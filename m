Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D270A2691A
	for <lists+freedreno@lfdr.de>; Tue,  4 Feb 2025 01:54:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEEC910E590;
	Tue,  4 Feb 2025 00:54:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KecPI4rk";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C10FA10E590
 for <freedreno@lists.freedesktop.org>; Tue,  4 Feb 2025 00:54:21 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-5439b0dd4bfso4437255e87.0
 for <freedreno@lists.freedesktop.org>; Mon, 03 Feb 2025 16:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738630460; x=1739235260; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=R6ZjpLJztPd/z6CugDEiLqKFmhAhr9ILcbNmlBzFygY=;
 b=KecPI4rk6+20ZUdTr7agrYTSkmyI7IojCg1d61k2/58B7I9QQaFLt/ayQZjKBqoLHz
 WcLpWBA01YM1zI8zHzq7t33V94J+dOnX4CJKrbshz2K7DmZAPO1ZZt0sK7YU3KfQV1nC
 JnbZaarOdnXYqrbSm7Accdr86zvoJn5CCr5QIMUrrsOOaC5mJaU0qqPXPh59V5CnW6Mr
 H/WNi2C3pgXVZvsmzWXAo3hKJxDi2mTtMrcxQAvyVWXu2Cz+b8ppDrSpCuXnhH+mJq9Q
 IMx48zMY6WhHNiezTMntYamuebohvMOuPTX5sjA8UkrHHmaco5SHtC744bQkDfPUnZE6
 6XmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738630460; x=1739235260;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R6ZjpLJztPd/z6CugDEiLqKFmhAhr9ILcbNmlBzFygY=;
 b=LpaRzgkh9K6YN3PKfrNhfnE4GH3SIGBOzuxjRcTavMHPfyj2iTWUFVeeDDZm7MDBBB
 V2KGAFwgmDDq5CaNVlbsORi7KqHaZlJWtkfneQxTwMElddFsOnul2SPcohXk2t21WlnN
 4V0I0UOvF0wqwWpkpEiDxz59sdnTLhqglFV1jyrMQ+2k9DmW5K777s3Gv8PkjLBl6+ia
 GxK3IDJyvtKrjde6EgfwtqS3Ps+L7YFtqTDYiwryiKewqQQ8+YlSC80mZJW6z28Tw1wV
 jkl1HELl4ZqrbIDvASaFrIPnSEDPswPXFzJVIqNIrlTDhIRZphgM0k3QedscR73pPXKq
 pAFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSzcHOZY/cWqB8ZuENWfnEW7rbIjIGL0w63MaiYxInNcCvL8pFrBPyil2WXMk38w3avhXc5/CqNjM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKKeR5fCMYkEdd7NX+xIUdh7gT/CQhR6suksi4k+o4Yu0A7EaU
 f1nPMMtcj/vzdE2FzmJYobo+PARwfpqmw0q0ClUzOmUPkNNmJlk3dGjEFOCLDyA=
X-Gm-Gg: ASbGncvIxEd9LRLTcziijap8wt3zzPmX8LoPlAoMzE049qvcRBASyT1qx1YIG8/jcCZ
 /sb1Y/ay61B+1e7YejzwiOMAyB4jCTNtt2fYv1rZNZbiM69SI+TCuYf1GjvO/25o6cyMq1hVcb5
 7Wtj/r/IjSkMeaSBedtZpsomJO+20+Es8Rx//DiShcw0hbPSBmTCLEhyY20YrCeJaaGMs4yR0Fr
 rldQqW1YF5CcHWQdMPWvDvc0CDLwLpq7auZEDE+tlzoG5ttJSoWAaDF292wc/3Cctx0EBAuVsqS
 +N8LJ+j2U0qKAM9ch1RWhMFREXTogl0Cz8XaDIQxMzcOLbh3NiQlJpGrFbbzgBs+UtVi8Wc=
X-Google-Smtp-Source: AGHT+IEpldiWweSia7SrDMC4AL51hi5zwa3/J31Z8ScFto8ds9fwqjC4+DaQa3FfHKj/Zkntym0SuA==
X-Received: by 2002:a05:6512:3e0e:b0:542:1137:611a with SMTP id
 2adb3069b0e04-543e4beab45mr7511819e87.17.1738630459976; 
 Mon, 03 Feb 2025 16:54:19 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543ebdf0ff7sm1435755e87.8.2025.02.03.16.54.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2025 16:54:18 -0800 (PST)
Date: Tue, 4 Feb 2025 02:54:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Danila Tikhonov <danila@jiaxyga.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 andersson@kernel.org, konradybcio@kernel.org, robdclark@gmail.com, 
 quic_abhinavk@quicinc.com, sean@poorly.run, marijn.suijten@somainline.org, 
 jonathan@marek.ca, jun.nie@linaro.org, fekz115@gmail.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux@mainlining.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 3/4] drm/msm/dsi: Allow all bpc values
Message-ID: <adm72vocbbl5n75eaf7kjosv37xxv42esnosnhshabznmqnsz7@mumtmgopeoxk>
References: <20250203181436.87785-1-danila@jiaxyga.com>
 <20250203181436.87785-4-danila@jiaxyga.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250203181436.87785-4-danila@jiaxyga.com>
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, Feb 03, 2025 at 09:14:26PM +0300, Danila Tikhonov wrote:
> From: Eugene Lepshy <fekz115@gmail.com>
> 
> DRM DSC helper has parameters for various bpc values ​​other than 8:
> (8/10/12/14/16).
> 
> Remove this guard.
> 
> Signed-off-by: Eugene Lepshy <fekz115@gmail.com>
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
