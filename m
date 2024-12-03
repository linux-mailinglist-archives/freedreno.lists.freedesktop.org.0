Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 475FD9E1E47
	for <lists+freedreno@lfdr.de>; Tue,  3 Dec 2024 14:53:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFE7410E469;
	Tue,  3 Dec 2024 13:53:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dBwm9ck5";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E73810E469
 for <freedreno@lists.freedesktop.org>; Tue,  3 Dec 2024 13:53:46 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-53de92be287so8229222e87.1
 for <freedreno@lists.freedesktop.org>; Tue, 03 Dec 2024 05:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733234024; x=1733838824; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Y2z7Lw9AnAApn3+Fq4NPDiMReJ0TWjBn2iXkUvuhnlA=;
 b=dBwm9ck56PrZGeVWt0L+6jlrwX1EFsxpDDZT+LB1m90gDCmN9RiDn7QnSWVJTFfXe2
 t+20a7iVpQBqhx75Fu7jf8Tcbwdrs+K4GQUIgTY39T4qgkWs/CSPlP+vH/tK1uAhc463
 6UqBcZh1WliZKjBUAJJt0tNxfE9OLlR52sc+zjVUENHh1A0D41PR/Ac+rFnACsqRtR4s
 uiTuD96G26/++qMy5/1/BEKM5PHsin4rg8Tp8GWLs4z0mm3tc6nk7m6prpC5o3lam6/7
 sPCZgzZdGGWXBF4KX94VNcAFuKBQsoHdbYvmD30pTSR4GV2J7X7HQslQnZ/SEMehYjUs
 xuuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733234024; x=1733838824;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y2z7Lw9AnAApn3+Fq4NPDiMReJ0TWjBn2iXkUvuhnlA=;
 b=FIuh6/IM7nMTEcSVykuGXXtQum36/RX1LpEUjULmv2TRRGZWJ48Fdz8ldh7UZMW/Bq
 auzIi6mF1GEJmEEItU8jokQ0m7RGl3mgQnYnaMAEjVzFiu8+zlOVsmQZkSNAon1QRlYC
 D40io28Wi01SQHvmDOMKfQJUSdTzNoe7uHewRT/m1gguOByoQuQnhkSGfKA8QNLhPqYM
 RjKPuw5Xv3PKLo9e2zzjFitmFXfAYWyBE62kXBw1EtjHxXlCVfHcANletK6AdW7UBmSs
 d86SJsug5UbxGl3GCnb4Qd6YK7iWeQ/sZ39H1kDO+PzYbSaIEPSXtZV+oCxka9Zv255z
 F7yQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVM7mxB5zOXlx5LzRE3RwUa4QyU90dkIT0DxtESHwaUNAlo4736o4pS2i64kLcHaUP6ElDjtzgnMOI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzMSahKyXfpv81cv7FTRmUAoSeYPnpvNp0tZbP5wW6T8940yK6
 fHnU0mCrSiPSaB9nMLD9IpCsdqxYLYVsAbkSIvso/MdIvZRQEYr+r85xsxZ7Ijo=
X-Gm-Gg: ASbGnctuipSvWXtclEeFxTIg546dR8zTQEpLFKHAeCREOzR2mUCLFTQ6FQR7YGvypKz
 mHR28QkzVC+apwkRf0hOAm09/SBtz3/qBUUhG14KD1rgge9aE96cjuNKPYEFcBHyo4ytMD9jHpv
 kahSjTAXq2SyaOcnJUcFR/6AwIH3eX7cmAU+Sknm/OEmQqmRen0jOE0RIqfsCvZL+vncdUSVEd1
 LayxVEqHvV/kb/B4R2tdzmKJmYKPPwY4EvmC8dAkVmi/BtqtZzF/MDtRy1O4Z44CmQmoHcorPi+
 SQ2lZzHCTscNlmtcsNtuS+zoS+TgNA==
X-Google-Smtp-Source: AGHT+IGIVJilF847DUoQ5IIjS97Q02Ms+T6DT7oFUW5dd74axuuCY4gvMyDsqnLd1Arq5x+/ERo8Kw==
X-Received: by 2002:a05:6512:b14:b0:53d:e7b6:c701 with SMTP id
 2adb3069b0e04-53e12a06d37mr2329892e87.33.1733234024535; 
 Tue, 03 Dec 2024 05:53:44 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e0d4dff67sm562441e87.10.2024.12.03.05.53.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 05:53:44 -0800 (PST)
Date: Tue, 3 Dec 2024 15:53:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>, 
 Doug Anderson <dianders@chromium.org>, Johan Hovold <johan@kernel.org>, 
 Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH 3/4] drm/msm/dp: replace ST_DISPLAY_OFF with power_on in
 msm_dp_hpd_unplug_handle()
Message-ID: <lcr5i4s7it5goppdi5at6jplnrvb5xl4cmv22n5jtjdnlbda43@54z7afarengg>
References: <20241202-hpd_display_off-v1-0-8d0551847753@quicinc.com>
 <20241202-hpd_display_off-v1-3-8d0551847753@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202-hpd_display_off-v1-3-8d0551847753@quicinc.com>
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

On Mon, Dec 02, 2024 at 04:39:02PM -0800, Abhinav Kumar wrote:
> msm_dp_hpd_unplug_handle() checks if the display was already disabled and if
> so does not transition to ST_DISCONNECT_PENDING state and goes directly to
> ST_DISCONNECTED. The same result can be achieved with the !power_on check.
> 
> Replace ST_DISPLAY_OFF with !power_on to achieve the same outcome.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
