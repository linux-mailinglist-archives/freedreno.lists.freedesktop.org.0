Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9D436CE82
	for <lists+freedreno@lfdr.de>; Wed, 28 Apr 2021 00:14:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 927126E9EC;
	Tue, 27 Apr 2021 22:14:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D5536E9EC
 for <freedreno@lists.freedesktop.org>; Tue, 27 Apr 2021 22:14:47 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1619561689; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=w9iYbla8SfuYYaXRJhm+8Av4oAS2iP488Q4jqLprjkk=;
 b=P/3ckNvRBqheZaLhFhK4OD4I/8WP31Qoh12xAlk0+IEoGNzv3MQLRMpcbjJOdqr+8aNATglC
 uleU4kqNTXjiK4oSTMdS3PExpsDzQngyIZjGN7IOhuARuAvC5mlCu/yAYu4kjLaduIbNUh/v
 JfVTMjVwxhWVvsyuNB4PKKXBuBo=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 60888cbc2cbba88980ff31b0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 27 Apr 2021 22:14:20
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id BD921C433F1; Tue, 27 Apr 2021 22:14:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 95428C4338A;
 Tue, 27 Apr 2021 22:14:18 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 27 Apr 2021 15:14:18 -0700
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20210427001828.2375555-5-dmitry.baryshkov@linaro.org>
References: <20210427001828.2375555-1-dmitry.baryshkov@linaro.org>
 <20210427001828.2375555-5-dmitry.baryshkov@linaro.org>
Message-ID: <c567806ed6024e5c8b6b8a948632fc71@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Subject: Re: [Freedreno] [PATCH v2 4/4] drm/msm/dsi: add DSI PHY registers
 to snapshot data
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

On 2021-04-26 17:18, Dmitry Baryshkov wrote:
> Add DSI PHY registers to the msm state snapshots to be able to check
> their contents.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi.c         |  1 +
>  drivers/gpu/drm/msm/dsi/dsi.h         |  1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 31 +++++++++++++++++++++++----
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h |  4 ++++
>  4 files changed, 33 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c 
> b/drivers/gpu/drm/msm/dsi/dsi.c
> index 322d2e535df0..75afc12a7b25 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
> @@ -269,5 +269,6 @@ int msm_dsi_modeset_init(struct msm_dsi *msm_dsi,
> struct drm_device *dev,
>  void msm_dsi_snapshot(struct msm_disp_state *disp_state, struct
> msm_dsi *msm_dsi)
>  {
>  	msm_dsi_host_snapshot(disp_state, msm_dsi->host);
> +	msm_dsi_phy_snapshot(disp_state, msm_dsi->phy);
>  }
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h 
> b/drivers/gpu/drm/msm/dsi/dsi.h
> index b5679cf89413..cea73f9c4be9 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
> @@ -176,6 +176,7 @@ int msm_dsi_phy_get_clk_provider(struct msm_dsi_phy 
> *phy,
>  	struct clk **byte_clk_provider, struct clk **pixel_clk_provider);
>  void msm_dsi_phy_pll_save_state(struct msm_dsi_phy *phy);
>  int msm_dsi_phy_pll_restore_state(struct msm_dsi_phy *phy);
> +void msm_dsi_phy_snapshot(struct msm_disp_state *disp_state, struct
> msm_dsi_phy *phy);
> 
>  #endif /* __DSI_CONNECTOR_H__ */
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index f0a2ddf96a4b..bf7a4c20c13c 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -658,14 +658,14 @@ static int dsi_phy_driver_probe(struct
> platform_device *pdev)
>  	phy->regulator_ldo_mode = of_property_read_bool(dev->of_node,
>  				"qcom,dsi-phy-regulator-ldo-mode");
> 
> -	phy->base = msm_ioremap(pdev, "dsi_phy", "DSI_PHY");
> +	phy->base = msm_ioremap_size(pdev, "dsi_phy", "DSI_PHY", 
> &phy->base_size);
>  	if (IS_ERR(phy->base)) {
>  		DRM_DEV_ERROR(dev, "%s: failed to map phy base\n", __func__);
>  		ret = -ENOMEM;
>  		goto fail;
>  	}
> 
> -	phy->pll_base = msm_ioremap(pdev, "dsi_pll", "DSI_PLL");
> +	phy->pll_base = msm_ioremap_size(pdev, "dsi_pll", "DSI_PLL", 
> &phy->pll_size);
>  	if (IS_ERR(phy->pll_base)) {
>  		DRM_DEV_ERROR(&pdev->dev, "%s: failed to map pll base\n", __func__);
>  		ret = -ENOMEM;
> @@ -673,7 +673,7 @@ static int dsi_phy_driver_probe(struct
> platform_device *pdev)
>  	}
> 
>  	if (phy->cfg->has_phy_lane) {
> -		phy->lane_base = msm_ioremap(pdev, "dsi_phy_lane", "DSI_PHY_LANE");
> +		phy->lane_base = msm_ioremap_size(pdev, "dsi_phy_lane",
> "DSI_PHY_LANE", &phy->lane_size);
>  		if (IS_ERR(phy->lane_base)) {
>  			DRM_DEV_ERROR(&pdev->dev, "%s: failed to map phy lane base\n", 
> __func__);
>  			ret = -ENOMEM;
> @@ -682,7 +682,7 @@ static int dsi_phy_driver_probe(struct
> platform_device *pdev)
>  	}
> 
>  	if (phy->cfg->has_phy_regulator) {
> -		phy->reg_base = msm_ioremap(pdev, "dsi_phy_regulator", 
> "DSI_PHY_REG");
> +		phy->reg_base = msm_ioremap_size(pdev, "dsi_phy_regulator",
> "DSI_PHY_REG", &phy->reg_size);
>  		if (IS_ERR(phy->reg_base)) {
>  			DRM_DEV_ERROR(&pdev->dev, "%s: failed to map phy regulator
> base\n", __func__);
>  			ret = -ENOMEM;
> @@ -868,3 +868,26 @@ int msm_dsi_phy_pll_restore_state(struct 
> msm_dsi_phy *phy)
> 
>  	return 0;
>  }
> +
> +void msm_dsi_phy_snapshot(struct msm_disp_state *disp_state, struct
> msm_dsi_phy *phy)
> +{
> +	msm_disp_snapshot_add_block(disp_state,
> +			phy->base_size, phy->base,
> +			"dsi%d_phy", phy->id);
> +
> +	/* Do not try accessing PLL registers if it is switched off */
> +	if (phy->pll_on)
> +		msm_disp_snapshot_add_block(disp_state,
> +			phy->pll_size, phy->pll_base,
> +			"dsi%d_pll", phy->id);
> +
> +	if (phy->lane_base)
> +		msm_disp_snapshot_add_block(disp_state,
> +			phy->lane_size, phy->lane_base,
> +			"dsi%d_lane", phy->id);
> +
> +	if (phy->reg_base)
> +		msm_disp_snapshot_add_block(disp_state,
> +			phy->reg_size, phy->reg_base,
> +			"dsi%d_reg", phy->id);
> +}
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> index 94a77ac364d3..5b0feef87127 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> @@ -85,6 +85,10 @@ struct msm_dsi_phy {
>  	void __iomem *pll_base;
>  	void __iomem *reg_base;
>  	void __iomem *lane_base;
> +	phys_addr_t base_size;
> +	phys_addr_t pll_size;
> +	phys_addr_t reg_size;
> +	phys_addr_t lane_size;
>  	int id;
> 
>  	struct clk *ahb_clk;
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
