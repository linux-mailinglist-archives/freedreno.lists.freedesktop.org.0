Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DBD3B97DF
	for <lists+freedreno@lfdr.de>; Thu,  1 Jul 2021 22:59:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC2D36E0DE;
	Thu,  1 Jul 2021 20:59:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D68516E0DE
 for <freedreno@lists.freedesktop.org>; Thu,  1 Jul 2021 20:59:17 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 m6-20020a9d1d060000b029044e2d8e855eso7916847otm.8
 for <freedreno@lists.freedesktop.org>; Thu, 01 Jul 2021 13:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=XrWzpSfGWJs4mU7AbSR6+V4VHnkU5pSgSDyg2slAt30=;
 b=EjzKi5uaP0VQcEGw8pTiCdQJVucKkhHNVO7oowIqztIsBsjAHtES6A14HBthDpEGta
 57pnzLXTcp43YW9JZGFdYjUgM4+9YFW3k/k1zvZu6T6tzU/5hjYNcyrDdaqOEwaqCftI
 6QxUCK3daPHzh16hsFrq6UJTRrDsofcZkB/lKIHxIEhOHe1GmGBRNSnKMiZvzqj8NI5m
 HOYuqbF5IBS4bA/OVFUnkff/K3pmjP6sOm8iDdUzlECcYsMqI48mgH0zSmf5o0NRymmT
 D1mzIaTYnktp9+AFm1+zGiTvsHHFf4ZYI4zvUbY6wmUtGz/QOgaux2QhM2WJtVouc0Ea
 cuLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XrWzpSfGWJs4mU7AbSR6+V4VHnkU5pSgSDyg2slAt30=;
 b=pHIM0nYVLt0Q0iyMguyt8duLPWrTAclOPwc1ivvbs9WSSIecJW6Ru0kwFC0UAQL+EA
 mnRdzs4VFlgZmvOiY3NNxoAhA4/ntKIQczY0958ZQJ3glAvM65ABpbC/YT4HS4tnp1+I
 o+cNY8JUaeSHMe0005X9x1eyHf5wSwT38MsXZR8wXijD+9or10AF6AnjcdaBFIq46lF9
 qioTCoZ+2oph+hmi6vc3RLJ/x2BJ91uuEIjSyUsXb9rK4rI2+wR10zCx/j9b4UlysIIo
 6U61J8ttoRAYZIX0Hq1UnUzUtcCzGptH5WQuhlITlktL+Zr7FO7PhmNV7LKneIluNR48
 rqfQ==
X-Gm-Message-State: AOAM532coDbHSn/hkKClYhQVvU56+65bAFj3Kmn4Mii8kzDkQramcBX8
 shG0aVY7L98fsR5XOjnuvZMkbQ==
X-Google-Smtp-Source: ABdhPJwIRnpPxwiwaPUqDIjDQDPpGe2AzdWrhxL+vmnF9x4fm6rwS0DFjgoK+0VtbGYBZ5MIhWlfcA==
X-Received: by 2002:a9d:8c7:: with SMTP id 65mr1578919otf.25.1625173157128;
 Thu, 01 Jul 2021 13:59:17 -0700 (PDT)
Received: from yoga (rrcs-97-77-166-58.sw.biz.rr.com. [97.77.166.58])
 by smtp.gmail.com with ESMTPSA id m11sm177944otp.29.2021.07.01.13.59.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 13:59:16 -0700 (PDT)
Date: Thu, 1 Jul 2021 15:59:14 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <YN4sojVhCpfHDpgZ@yoga>
References: <20210701000015.3347713-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210701000015.3347713-1-dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH] drm/msm/dsi: drop gdsc regulator handling
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>, David Airlie <airlied@linux.ie>,
 Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed 30 Jun 19:00 CDT 2021, Dmitry Baryshkov wrote:

> None of supported devies uses "gdsc" regulator for DSI. GDSC support is
> now implemented as a power domain. Drop old code and config handling
> gdsc regulator requesting and enabling.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/gpu/drm/msm/dsi/dsi_cfg.c  | 12 ++++--------
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 22 +++-------------------
>  2 files changed, 7 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> index f3f1c03c7db9..32c37d7c2109 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> @@ -32,9 +32,8 @@ static const char * const dsi_6g_bus_clk_names[] = {
>  static const struct msm_dsi_config msm8974_apq8084_dsi_cfg = {
>  	.io_offset = DSI_6G_REG_SHIFT,
>  	.reg_cfg = {
> -		.num = 4,
> +		.num = 3,
>  		.regs = {
> -			{"gdsc", -1, -1},
>  			{"vdd", 150000, 100},	/* 3.0 V */
>  			{"vdda", 100000, 100},	/* 1.2 V */
>  			{"vddio", 100000, 100},	/* 1.8 V */
> @@ -53,9 +52,8 @@ static const char * const dsi_8916_bus_clk_names[] = {
>  static const struct msm_dsi_config msm8916_dsi_cfg = {
>  	.io_offset = DSI_6G_REG_SHIFT,
>  	.reg_cfg = {
> -		.num = 3,
> +		.num = 2,
>  		.regs = {
> -			{"gdsc", -1, -1},
>  			{"vdda", 100000, 100},	/* 1.2 V */
>  			{"vddio", 100000, 100},	/* 1.8 V */
>  		},
> @@ -73,9 +71,8 @@ static const char * const dsi_8976_bus_clk_names[] = {
>  static const struct msm_dsi_config msm8976_dsi_cfg = {
>  	.io_offset = DSI_6G_REG_SHIFT,
>  	.reg_cfg = {
> -		.num = 3,
> +		.num = 2,
>  		.regs = {
> -			{"gdsc", -1, -1},
>  			{"vdda", 100000, 100},	/* 1.2 V */
>  			{"vddio", 100000, 100},	/* 1.8 V */
>  		},
> @@ -89,9 +86,8 @@ static const struct msm_dsi_config msm8976_dsi_cfg = {
>  static const struct msm_dsi_config msm8994_dsi_cfg = {
>  	.io_offset = DSI_6G_REG_SHIFT,
>  	.reg_cfg = {
> -		.num = 7,
> +		.num = 6,
>  		.regs = {
> -			{"gdsc", -1, -1},
>  			{"vdda", 100000, 100},	/* 1.25 V */
>  			{"vddio", 100000, 100},	/* 1.8 V */
>  			{"vcca", 10000, 100},	/* 1.0 V */
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index ed504fe5074f..66c425d4159c 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -203,35 +203,22 @@ static const struct msm_dsi_cfg_handler *dsi_get_config(
>  {
>  	const struct msm_dsi_cfg_handler *cfg_hnd = NULL;
>  	struct device *dev = &msm_host->pdev->dev;
> -	struct regulator *gdsc_reg;
>  	struct clk *ahb_clk;
>  	int ret;
>  	u32 major = 0, minor = 0;
>  
> -	gdsc_reg = regulator_get(dev, "gdsc");
> -	if (IS_ERR(gdsc_reg)) {
> -		pr_err("%s: cannot get gdsc\n", __func__);
> -		goto exit;
> -	}
> -
>  	ahb_clk = msm_clk_get(msm_host->pdev, "iface");
>  	if (IS_ERR(ahb_clk)) {
>  		pr_err("%s: cannot get interface clock\n", __func__);
> -		goto put_gdsc;
> +		goto exit;
>  	}
>  
>  	pm_runtime_get_sync(dev);
>  
> -	ret = regulator_enable(gdsc_reg);
> -	if (ret) {
> -		pr_err("%s: unable to enable gdsc\n", __func__);
> -		goto put_gdsc;
> -	}
> -
>  	ret = clk_prepare_enable(ahb_clk);
>  	if (ret) {
>  		pr_err("%s: unable to enable ahb_clk\n", __func__);
> -		goto disable_gdsc;
> +		goto runtime_put;
>  	}
>  
>  	ret = dsi_get_version(msm_host->ctrl_base, &major, &minor);
> @@ -246,11 +233,8 @@ static const struct msm_dsi_cfg_handler *dsi_get_config(
>  
>  disable_clks:
>  	clk_disable_unprepare(ahb_clk);
> -disable_gdsc:
> -	regulator_disable(gdsc_reg);
> +runtime_put:
>  	pm_runtime_put_sync(dev);
> -put_gdsc:
> -	regulator_put(gdsc_reg);
>  exit:
>  	return cfg_hnd;
>  }
> -- 
> 2.30.2
> 
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
