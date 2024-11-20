Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D22D9D38FB
	for <lists+freedreno@lfdr.de>; Wed, 20 Nov 2024 12:02:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE56610E705;
	Wed, 20 Nov 2024 11:02:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DgAR179H";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31EB110E705
 for <freedreno@lists.freedesktop.org>; Wed, 20 Nov 2024 11:02:37 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-53da3545908so4877439e87.1
 for <freedreno@lists.freedesktop.org>; Wed, 20 Nov 2024 03:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732100555; x=1732705355; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=a5zgbWAlYfYCr8Nk6Jg9k5X2+R3v6k9oDP6EluhSmbg=;
 b=DgAR179HzXeU9ci3Ori1+pvJQ/xRLwOrcDhE2mL5XzYup+uhu1yThVaY5Sgzy6FSci
 HpTte8TUwOPIh2+sXuDR7Qc8+YmitWOzM1Fz63bdsNvLD+bd4musEU3eysJIhINwlXPA
 b+O6EKPLJrAMqqe3gfCgDsfMTJ4sOdKiywLVq279kakIhVk6C2PE1Wb/W8ulK907Nj/J
 v+MaNlKhriRmefTFJSf5as92j6JmCTxjrm1Un2EnZAEULzZRvubM10x5ZD2fmnDrxvfN
 kVCdtl6UguNKfO9hPMD86ANjcwmiTwVbX4snj0OD4HJGgrRTwQ2INmeANWi8pZfSnrml
 b3mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732100555; x=1732705355;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a5zgbWAlYfYCr8Nk6Jg9k5X2+R3v6k9oDP6EluhSmbg=;
 b=KzSmFGDHjvGBsT+nB5MmexS6P3Tva3mfpFU0QDsyf1gz900IzgPxeDNRC/AN5gu4nr
 bnKmEVcIns1vfG0qqTUTK3ikf96cBccb1b/m40LcizH8n5NlAtAchEKjf1UtnjR+enUs
 z9DthnU6nZCcsI0jeye2wjCzXzxRCAdGFW3K17jlKqs+xxqkBVCmrZZk98Q1uHs03QmN
 jYuAvqz0LpsfrQ+Dke1wAF9ZyeMmEaaoir1WIBktyYpJ/4EvB63wYcbUNMu1qfzhjjlH
 qzWv+HIRkEMwq/ok19SY8Vp2AVDmc8mM4L5t3iBkq7ZfLRaUmErbtnqCEAsdavqo8dbz
 dgyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtlpVwtXdQMz8wSJGzK2MTfPKypiEYIMVbctOsZ2YHsdHi9O6C+G4GbLsycBw6P3JfLM7qDcOltO4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQ2miccx7pHga/ryb4ltlGbCII1Jnhu3Q+vW9HJSGp48fKNbfd
 kvItHxJwKU6hQZ6mEcMRZFpC7A3TcxXTbGAJcLMyWqkcBW29dCww8gBqVwmj7z8=
X-Google-Smtp-Source: AGHT+IHKWiTrRrCzYnYM6d7Ym7wDAknR4wn2POzDwbTPgBhBhzfbphYglKnHr9g6u4D92E9megUh/Q==
X-Received: by 2002:a05:6512:3d19:b0:53d:a86a:6b2b with SMTP id
 2adb3069b0e04-53dc136a95emr1101614e87.35.1732100555170; 
 Wed, 20 Nov 2024 03:02:35 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dbf09664esm394046e87.162.2024.11.20.03.02.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2024 03:02:34 -0800 (PST)
Date: Wed, 20 Nov 2024 13:02:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com, 
 linux-arm-msm@vger.kernel.org, sean@poorly.run, marijn.suijten@somainline.org, 
 airlied@gmail.com, simona@ffwll.ch, quic_bjorande@quicinc.com, 
 quic_parellan@quicinc.com, quic_khsieh@quicinc.com,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dianders@chromium.org
Subject: Re: [PATCH drm-next] drm/msm/dp: Fix potential division by zero issue
Message-ID: <piembwzz7x6plsps3umjg3b3pi2ii44svmeii3wwtydtriceny@uqq7ck2ge5zz>
References: <20241120050451.100957-1-dheeraj.linuxdev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241120050451.100957-1-dheeraj.linuxdev@gmail.com>
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

On Wed, Nov 20, 2024 at 10:34:51AM +0530, Dheeraj Reddy Jonnalagadda wrote:
> The variable pixel_div can remain zero due to an invalid rate input,

No, it can not. Rate is set by the driver, which knowns which rates are
supported. 

> leading to a potential division by zero issue. This patch fixes it and
> the function now logs an error and returns early.

See Documentation/process/submitting-patches.rst, look for "This patch"
string.

> 
> Additionally, this patch resolves trailing whitespace issues detected
> by checkpatch.pl in the same file.

Additionally perform ... => separate commits.

> 
> Signed-off-by: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index b4c8856fb25d..e170f70f1d42 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -225,7 +225,7 @@ int msm_dp_catalog_aux_clear_hw_interrupts(struct msm_dp_catalog *msm_dp_catalog
>   * This function reset AUX controller
>   *
>   * NOTE: reset AUX controller will also clear any pending HPD related interrupts
> - * 
> + *
>   */
>  void msm_dp_catalog_aux_reset(struct msm_dp_catalog *msm_dp_catalog)
>  {
> @@ -487,8 +487,10 @@ void msm_dp_catalog_ctrl_config_msa(struct msm_dp_catalog *msm_dp_catalog,
>  		pixel_div = 2;
>  	else if (rate == link_rate_hbr2)
>  		pixel_div = 4;
> -	else
> +	else {
>  		DRM_ERROR("Invalid pixel mux divider\n");
> +		return;
> +	}
>  
>  	dispcc_input_rate = (rate * 10) / pixel_div;
>  
> @@ -579,7 +581,7 @@ u32 msm_dp_catalog_hw_revision(const struct msm_dp_catalog *msm_dp_catalog)
>   * This function reset the DP controller
>   *
>   * NOTE: reset DP controller will also clear any pending HPD related interrupts
> - * 
> + *
>   */
>  void msm_dp_catalog_ctrl_reset(struct msm_dp_catalog *msm_dp_catalog)
>  {
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
