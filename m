Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A778E466D74
	for <lists+freedreno@lfdr.de>; Fri,  3 Dec 2021 00:08:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 555666EDE1;
	Thu,  2 Dec 2021 23:08:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB9136EDE1
 for <freedreno@lists.freedesktop.org>; Thu,  2 Dec 2021 23:08:31 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 i5-20020a05683033e500b0057a369ac614so1685487otu.10
 for <freedreno@lists.freedesktop.org>; Thu, 02 Dec 2021 15:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=0L2By4CDtRg7Bo2JcTOelRDpHyD8uA2uf3K9wmjvTeY=;
 b=mjGPcRuOwbN4C17b9PnbMNsi1lUXjmWJ4/CxM8Z9wCX5kobN1ay8UjMtIy87ikASjI
 lcWtPhcYpb6TFE3NvjfwEyzS4EGci2AYxvHWzoKLEyn7qBQgXUFt+JKMnfeacRQbjkEX
 mzeiEuB8JwhsxStXfAM7E7OLK/wGJ4h2JWf5mHJ4oGQjrGdXI5jZndHZnGJDytNxzLEZ
 /gEJvwI7dx9bgLnG2wpyIkmxiW2MnFFkjBfE4oUVoGinTaj4mz1DKkDeUAYd2n1p48gn
 BTBNmnDBxMakbG+E+XGwGqQZe6vKtVSbc8MbtdtMKPrDOxRJscfO0HKjesd4dd5QpVuz
 CI8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0L2By4CDtRg7Bo2JcTOelRDpHyD8uA2uf3K9wmjvTeY=;
 b=zV5rAJc8J++0ykD/SZ0TEUvwGlXBqAEdwD1LkLC6h9/Bzl+FeGvov/2ZTFKXcum2xY
 opvTALq14GczogZuJ0j9EkGYeejzhvMfpPzPuIKLrn57oBABJYx1ZsT2V+tp+RQu8CPU
 0yNQrR83jKT4HRoaXgPHNmmCEjTGyQfpvD05SXF+zUPFEyz9lOdwykcjn4vTbSCtWHmM
 V67uxVxDePbd05zNZRwe8SLg/4xvcOpodHSAOVlH/fhq18j4O5z+gTpsg17AtZTka5C+
 aJ7D1m/iT867anLqZbIyyhS2Sk/JyLHk0+s6qE/pvAd46R5NXS+im2KNUYzC1EtNJ4GI
 7hmQ==
X-Gm-Message-State: AOAM532xZIQ32ptf1b9E3mtPlGRmVQ9zuYabPa95GFRELv2XoGjQ4CHm
 vtXlj1lJQcjcEgPiuAqJG14Qog==
X-Google-Smtp-Source: ABdhPJx6mI7fGWZL0ZzePlsZqU77AEY3wzrqEGHpOpt9tGQ79tTsazOkSZjY/FKRLicgi6kN2UI52w==
X-Received: by 2002:a9d:2243:: with SMTP id o61mr13427918ota.126.1638486510998; 
 Thu, 02 Dec 2021 15:08:30 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id h3sm273009oon.34.2021.12.02.15.08.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 15:08:30 -0800 (PST)
Date: Thu, 2 Dec 2021 15:10:03 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Kuogee Hsieh <khsieh@codeaurora.org>
Message-ID: <YalSS1C4/XUzz62q@ripper>
References: <1631637901-11603-1-git-send-email-khsieh@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1631637901-11603-1-git-send-email-khsieh@codeaurora.org>
Subject: Re: [Freedreno] [PATCH v4] phy: qcom-qmp: add support for display
 port voltage and pre-emphasis swing
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
Cc: devicetree@vger.kernel.org, kishon@ti.com, freedreno@lists.freedesktop.org,
 vkoul@kernel.org, robh+dt@kernel.org, swboyd@chromium.org, robdclark@gmail.com,
 agross@kernel.org, abhinavk@codeaurora.org, p.zabel@pengutronix.de,
 linux-arm-msm@vger.kernel.org, aravindh@codeaurora.org, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue 14 Sep 09:45 PDT 2021, Kuogee Hsieh wrote:

$suject says "add support", but afaict the code already configures
voltage and pre-emphasis swing.

If I understand your change you're not adding support for the swing, but
rather you make it possible to have different tables for different
versions of the phy?

> Both voltage and pre-emphasis swing level are set during link training
> negotiation between host and sink. There are totally four tables added.
> A voltage swing table for both hbr and hbr1, a voltage table for both
> hbr2 and hbr3, a pre-emphasis table for both hbr and hbr1 and a pre-emphasis
> table for both hbr2 and hbr3. In addition, write 0x0a to TX_TX_POL_INV is
> added to complete the sequence of configure dp phy base on HPG.
> 
> Chnages in v2:
> -- revise commit test
> -- add Fixes tag
> -- replaced voltage_swing_cfg with voltage
> -- replaced pre_emphasis_cfg with emphasis
> -- delete drv_lvl_reg and emp_post_reg parameters from qcom_qmp_v4_phy_configure_dp_swing()
> -- delete drv_lvl_reg and emp_post_reg parameters from qcom_qmp_phy_configure_dp_swing()
> 
> Changes in V3:
> -- add __qcom_qmp_phy_configure_dp_swing() to commit swing/pre-emphasis level
> 
> Changes in V4:
> -- pass 2D array to __qcom_qmp_phy_configure_dp_swing()

Carrying the change log as part of the commit message is a DRM specific
thing, outside of drivers/gpu this all goes below the '---' below.

> 
> Fixes: aff188feb5e1 ("phy: qcom-qmp: add support for sm8250-usb3-dp phy")

It's not clear to me what issue with aff188feb5e1 this patch fixes. In
what way is aff188feb5e1 broken?

> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 97 +++++++++++++++++++++++++------------
>  1 file changed, 66 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index 31036aa..fb029e4 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -3546,12 +3546,17 @@ static const u8 qmp_dp_v3_voltage_swing_hbr_rbr[4][4] = {
>  	{ 0x1f, 0xff, 0xff, 0xff }
>  };
>  
> -static int qcom_qmp_phy_configure_dp_swing(struct qmp_phy *qphy,
> -		unsigned int drv_lvl_reg, unsigned int emp_post_reg)
> +static int __qcom_qmp_phy_configure_dp_swing(struct qmp_phy *qphy,
> +				unsigned int drv_lvl_reg,
> +				unsigned int emp_post_reg,
> +				const u8 voltage_swing_hbr_rbr[4][4],
> +				const u8 pre_emphasis_hbr_rbr[4][4],
> +				const u8 voltage_swing_hbr3_hbr2[4][4],
> +				const u8 pre_emphasis_hbr3_hbr2[4][4])
>  {
>  	const struct phy_configure_opts_dp *dp_opts = &qphy->dp_opts;
>  	unsigned int v_level = 0, p_level = 0;
> -	u8 voltage_swing_cfg, pre_emphasis_cfg;
> +	u8 voltage, emphasis;
>  	int i;
>  
>  	for (i = 0; i < dp_opts->lanes; i++) {
> @@ -3560,26 +3565,25 @@ static int qcom_qmp_phy_configure_dp_swing(struct qmp_phy *qphy,
>  	}
>  
>  	if (dp_opts->link_rate <= 2700) {
> -		voltage_swing_cfg = qmp_dp_v3_voltage_swing_hbr_rbr[v_level][p_level];
> -		pre_emphasis_cfg = qmp_dp_v3_pre_emphasis_hbr_rbr[v_level][p_level];
> +		voltage = voltage_swing_hbr_rbr[v_level][p_level];
> +		emphasis = pre_emphasis_hbr_rbr[v_level][p_level];
>  	} else {
> -		voltage_swing_cfg = qmp_dp_v3_voltage_swing_hbr3_hbr2[v_level][p_level];
> -		pre_emphasis_cfg = qmp_dp_v3_pre_emphasis_hbr3_hbr2[v_level][p_level];
> +		voltage = voltage_swing_hbr3_hbr2[v_level][p_level];
> +		emphasis = pre_emphasis_hbr3_hbr2[v_level][p_level];
>  	}
>  
>  	/* TODO: Move check to config check */
> -	if (voltage_swing_cfg == 0xFF && pre_emphasis_cfg == 0xFF)
> +	if (voltage == 0xFF && emphasis == 0xFF)
>  		return -EINVAL;
>  
>  	/* Enable MUX to use Cursor values from these registers */
> -	voltage_swing_cfg |= DP_PHY_TXn_TX_DRV_LVL_MUX_EN;
> -	pre_emphasis_cfg |= DP_PHY_TXn_TX_EMP_POST1_LVL_MUX_EN;
> -
> -	writel(voltage_swing_cfg, qphy->tx + drv_lvl_reg);
> -	writel(pre_emphasis_cfg, qphy->tx + emp_post_reg);
> -	writel(voltage_swing_cfg, qphy->tx2 + drv_lvl_reg);
> -	writel(pre_emphasis_cfg, qphy->tx2 + emp_post_reg);
> +	voltage |= DP_PHY_TXn_TX_DRV_LVL_MUX_EN;
> +	emphasis |= DP_PHY_TXn_TX_EMP_POST1_LVL_MUX_EN;
>  
> +	writel(voltage, qphy->tx + drv_lvl_reg);
> +	writel(emphasis, qphy->tx + emp_post_reg);
> +	writel(voltage, qphy->tx2 + drv_lvl_reg);
> +	writel(emphasis, qphy->tx2 + emp_post_reg);
>  	return 0;
>  }
>  
> @@ -3588,9 +3592,13 @@ static void qcom_qmp_v3_phy_configure_dp_tx(struct qmp_phy *qphy)
>  	const struct phy_configure_opts_dp *dp_opts = &qphy->dp_opts;
>  	u32 bias_en, drvr_en;
>  
> -	if (qcom_qmp_phy_configure_dp_swing(qphy,
> -				QSERDES_V3_TX_TX_DRV_LVL,
> -				QSERDES_V3_TX_TX_EMP_POST1_LVL) < 0)
> +	if (__qcom_qmp_phy_configure_dp_swing(qphy,
> +			QSERDES_V3_TX_TX_DRV_LVL,
> +			QSERDES_V3_TX_TX_EMP_POST1_LVL,
> +			qmp_dp_v3_voltage_swing_hbr_rbr,
> +			qmp_dp_v3_pre_emphasis_hbr_rbr,
> +			qmp_dp_v3_voltage_swing_hbr3_hbr2,
> +			qmp_dp_v3_pre_emphasis_hbr3_hbr2) < 0)
>  		return;
>  
>  	if (dp_opts->lanes == 1) {
> @@ -3728,6 +3736,35 @@ static int qcom_qmp_v3_dp_phy_calibrate(struct qmp_phy *qphy)
>  	return 0;
>  }
>  
> +/* The values in these tables are given without MUX_EN (0x20) bit set */
> +static const u8 qmp_dp_v4_pre_emphasis_hbr3_hbr2[4][4] = {
> +	{ 0x00, 0x0c, 0x15, 0x1b },
> +	{ 0x02, 0x0e, 0x16, 0xff },
> +	{ 0x02, 0x11, 0xff, 0xff },
> +	{ 0x04, 0xff, 0xff, 0xff }
> +};
> +
> +static const u8 qmp_dp_v4_voltage_swing_hbr3_hbr2[4][4] = {
> +	{ 0x02, 0x12, 0x16, 0x1a },
> +	{ 0x09, 0x19, 0x1f, 0xff },
> +	{ 0x10, 0x1f, 0xff, 0xff },
> +	{ 0x1f, 0xff, 0xff, 0xff }
> +};
> +
> +static const u8 qmp_dp_v4_pre_emphasis_hbr_rbr[4][4] = {
> +	{ 0x00, 0x0e, 0x15, 0x1b },
> +	{ 0x00, 0x0e, 0x15, 0xff },
> +	{ 0x00, 0x0e, 0xff, 0xff },
> +	{ 0x04, 0xff, 0xff, 0xff }
> +};
> +
> +static const u8 qmp_dp_v4_voltage_swing_hbr_rbr[4][4] = {
> +	{ 0x08, 0x0f, 0x16, 0x1f },
> +	{ 0x11, 0x1e, 0x1f, 0xff },
> +	{ 0x16, 0x1f, 0xff, 0xff },
> +	{ 0x1f, 0xff, 0xff, 0xff }
> +};
> +
>  static void qcom_qmp_v4_phy_dp_aux_init(struct qmp_phy *qphy)
>  {
>  	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_PSR_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
> @@ -3757,16 +3794,13 @@ static void qcom_qmp_v4_phy_dp_aux_init(struct qmp_phy *qphy)
>  
>  static void qcom_qmp_v4_phy_configure_dp_tx(struct qmp_phy *qphy)
>  {
> -	/* Program default values before writing proper values */
> -	writel(0x27, qphy->tx + QSERDES_V4_TX_TX_DRV_LVL);
> -	writel(0x27, qphy->tx2 + QSERDES_V4_TX_TX_DRV_LVL);
> -
> -	writel(0x20, qphy->tx + QSERDES_V4_TX_TX_EMP_POST1_LVL);
> -	writel(0x20, qphy->tx2 + QSERDES_V4_TX_TX_EMP_POST1_LVL);
> -
> -	qcom_qmp_phy_configure_dp_swing(qphy,
> +	__qcom_qmp_phy_configure_dp_swing(qphy,
>  			QSERDES_V4_TX_TX_DRV_LVL,
> -			QSERDES_V4_TX_TX_EMP_POST1_LVL);
> +			QSERDES_V4_TX_TX_EMP_POST1_LVL,
> +			qmp_dp_v4_voltage_swing_hbr_rbr,
> +			qmp_dp_v4_pre_emphasis_hbr_rbr,
> +			qmp_dp_v4_voltage_swing_hbr3_hbr2,
> +			qmp_dp_v4_pre_emphasis_hbr3_hbr2);
>  }
>  
>  static int qcom_qmp_v4_phy_configure_dp_phy(struct qmp_phy *qphy)
> @@ -3885,6 +3919,9 @@ static int qcom_qmp_v4_phy_configure_dp_phy(struct qmp_phy *qphy)
>  	writel(drvr1_en, qphy->tx2 + QSERDES_V4_TX_HIGHZ_DRVR_EN);
>  	writel(bias1_en, qphy->tx2 + QSERDES_V4_TX_TRANSCEIVER_BIAS_EN);
>  
> +	writel(0x0a, qphy->tx + QSERDES_V4_TX_TX_POL_INV);
> +	writel(0x0a, qphy->tx2 + QSERDES_V4_TX_TX_POL_INV);

So specifying TX_POL_INV has do be done before we kick off the
configuration? This sounds like a real bug fix, separate of the swing
settings.

Perhaps I'm misunderstanding something with this change?

Thanks,
Bjorn

> +
>  	writel(0x18, qphy->pcs + QSERDES_DP_PHY_CFG);
>  	udelay(2000);
>  	writel(0x19, qphy->pcs + QSERDES_DP_PHY_CFG);
> @@ -3896,11 +3933,9 @@ static int qcom_qmp_v4_phy_configure_dp_phy(struct qmp_phy *qphy)
>  			10000))
>  		return -ETIMEDOUT;
>  
> -	writel(0x0a, qphy->tx + QSERDES_V4_TX_TX_POL_INV);
> -	writel(0x0a, qphy->tx2 + QSERDES_V4_TX_TX_POL_INV);
>  
> -	writel(0x27, qphy->tx + QSERDES_V4_TX_TX_DRV_LVL);
> -	writel(0x27, qphy->tx2 + QSERDES_V4_TX_TX_DRV_LVL);
> +	writel(0x22, qphy->tx + QSERDES_V4_TX_TX_DRV_LVL);
> +	writel(0x22, qphy->tx2 + QSERDES_V4_TX_TX_DRV_LVL);
>  
>  	writel(0x20, qphy->tx + QSERDES_V4_TX_TX_EMP_POST1_LVL);
>  	writel(0x20, qphy->tx2 + QSERDES_V4_TX_TX_EMP_POST1_LVL);
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
