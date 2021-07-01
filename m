Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 933653B94D1
	for <lists+freedreno@lfdr.de>; Thu,  1 Jul 2021 18:43:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 250D3892B7;
	Thu,  1 Jul 2021 16:43:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77A24892B7
 for <freedreno@lists.freedesktop.org>; Thu,  1 Jul 2021 16:43:30 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1625157813; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=GNTkVXpdVkSQKI0mqru1ysaJCUJY+h+yturbnm9LQHo=;
 b=sCqAYvl51+wYiJKd6z+UoB7EmDFIOLphhltefwjLpdxZd1ixLFuO8iM59k7dPICJg0Vp3Rdn
 1v2HUhtzyzXQnrBQY+z9o2+dimmyPBWZJvF/GWAuPAdY/QAHc7EzVVU+s6vTZSViKz+sK46s
 hMhnVBvrsh2gFFiJJwunWWpoWMI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 60ddf0ad2a2a9a9761b9437c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 01 Jul 2021 16:43:25
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id A56C6C433F1; Thu,  1 Jul 2021 16:43:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A5984C4338A;
 Thu,  1 Jul 2021 16:43:24 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 01 Jul 2021 09:43:24 -0700
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20210701000015.3347713-1-dmitry.baryshkov@linaro.org>
References: <20210701000015.3347713-1-dmitry.baryshkov@linaro.org>
Message-ID: <b1181efb3e55ca7fb52cbd1bd661a985@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Airlie <airlied@linux.ie>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2021-06-30 17:00, Dmitry Baryshkov wrote:
> None of supported devies uses "gdsc" regulator for DSI. GDSC support is
> now implemented as a power domain. Drop old code and config handling
> gdsc regulator requesting and enabling.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_cfg.c  | 12 ++++--------
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 22 +++-------------------
>  2 files changed, 7 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
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
> @@ -53,9 +52,8 @@ static const char * const dsi_8916_bus_clk_names[] = 
> {
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
> @@ -73,9 +71,8 @@ static const char * const dsi_8976_bus_clk_names[] = 
> {
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
> @@ -89,9 +86,8 @@ static const struct msm_dsi_config msm8976_dsi_cfg = 
> {
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
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c
> b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index ed504fe5074f..66c425d4159c 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -203,35 +203,22 @@ static const struct msm_dsi_cfg_handler 
> *dsi_get_config(
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
> @@ -246,11 +233,8 @@ static const struct msm_dsi_cfg_handler 
> *dsi_get_config(
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
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
