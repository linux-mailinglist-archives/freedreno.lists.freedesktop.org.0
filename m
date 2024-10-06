Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA53499214A
	for <lists+freedreno@lfdr.de>; Sun,  6 Oct 2024 22:44:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A315B10E2DE;
	Sun,  6 Oct 2024 20:44:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PMGIwR4g";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B72D10E2DE
 for <freedreno@lists.freedesktop.org>; Sun,  6 Oct 2024 20:44:42 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2fad100dd9fso50243131fa.3
 for <freedreno@lists.freedesktop.org>; Sun, 06 Oct 2024 13:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728247481; x=1728852281; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1dzk3WntIySvLJWusveHPZhNWnaINtIPBE/POIj9sa4=;
 b=PMGIwR4gkJv60GCdxjs5FxwBB/wkupmEEej/8w2zyFM2DchO289HorZJRhDQ91NqrU
 C31vOBQb4FCnwR0AzjM7EiF9Pqow0dmyhbLSn2UO/BCamS1mtwo1eNPZotu0yEckXX4N
 uGLXWZSINSS3RJz/x7Qc7ZUCoD2rm7+TkYmXpR1ZToZ6ZWVVhjN7wiunI+FKszLwkOng
 JL8TKlEZA8PnroWt4+GyMTPjeSwwLu3vjxBr59vUd7byjlmaj01olqzYYvJm/PxdU4k8
 ztCpS/LlQ9Pre/lCGcKoduIybDHxS7HFS6yAd8NM07vHOQ6JCP8vunI+leoe3yPXGuol
 uEDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728247481; x=1728852281;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1dzk3WntIySvLJWusveHPZhNWnaINtIPBE/POIj9sa4=;
 b=BB1X5HORl25ZJdzJbN8JbJiQi5YyTv7EzpTG0ehWeT3vyryaUeIk6mw32AWfa4x0T2
 uAo85OIAzkQVrBmi5aqO3tWrSG1RnPTxHZL3QX2mj/1j32YrhpTaDhooAvjj9ATBz+Cx
 lcvCXUeWf+Fj7pxFaK3FX5qPcp+IEJ7n4t+mANFx9I9mdBQs0kQ62ZBHV3v2Gb98Xgib
 Efi/eRzFVIH49YTjHc1Uv7MJSsN7MMBy4jjsUdEl5vmqgEWCy1UgGEQHFbL1TEdxT2Zz
 1a9OwGhLZonQBzCPfeocKB+NWQ7hXmk9cr/3jA2siFA4f8PNyL4QP0bPUtWP05lUvrD5
 Axrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWflz7IIeYlq6VpeCYBNwbcVL7TuOy5UjB839NVFYyvHVXA/Reohcf7xsz2tcFThwY71/52ZtFsrOc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzzBo1vKmDxzFfZ6E+YpYYMBhHDytMnquEaQi4xnXibYKGOMRIZ
 8SFG4FKDKrITztgvHavcTvbocaGl44I3qn+nKQtKuP4m4/v+pxfLZKzdpkallgI=
X-Google-Smtp-Source: AGHT+IGSACiI3kw3knol095Cbq7pCc2Lxyw8CUsV9n35GwTxUyFJ2etK1ySJVEoir2VRZFMDNMgfeA==
X-Received: by 2002:a05:6512:b98:b0:536:55cc:963e with SMTP id
 2adb3069b0e04-539ab9cf28bmr6424748e87.44.1728247480760; 
 Sun, 06 Oct 2024 13:44:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539afec852esm615479e87.93.2024.10.06.13.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Oct 2024 13:44:39 -0700 (PDT)
Date: Sun, 6 Oct 2024 23:44:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: quic_mahap@quicinc.com
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Kalyan Thota <quic_kalyant@quicinc.com>,
 Jayaprakash Madisetty <quic_jmadiset@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/5] drm/msm: mdss: Add SA8775P support
Message-ID: <dg73wfucbacsalh6eaxuk5u2lhoavvlp3euh3zhb7tlkvnhcvq@2x55r35znc3w>
References: <20241001-patchv3_1-v3-0-d23284f45977@quicinc.com>
 <20241001-patchv3_1-v3-3-d23284f45977@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241001-patchv3_1-v3-3-d23284f45977@quicinc.com>
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

On Tue, Oct 01, 2024 at 12:11:38PM GMT, Mahadevan via B4 Relay wrote:
> From: Mahadevan <quic_mahap@quicinc.com>
> 
> Add Mobile Display Subsystem (MDSS) support for the SA8775P platform.
> 
> Signed-off-by: Mahadevan <quic_mahap@quicinc.com>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
