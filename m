Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 513FB47389F
	for <lists+freedreno@lfdr.de>; Tue, 14 Dec 2021 00:36:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B40010E8AC;
	Mon, 13 Dec 2021 23:36:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 882D110E7AC
 for <freedreno@lists.freedesktop.org>; Mon, 13 Dec 2021 23:36:07 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id o4so25240269oia.10
 for <freedreno@lists.freedesktop.org>; Mon, 13 Dec 2021 15:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+a3x2B0/KJq4wYj9GlAfLOlx8q2IrdZaa0L8o60yjpQ=;
 b=CyPXEZj4OmJD6w0VFLbuReWQOdJvL0yD8dVJrw3fEec0pnFkuFmYxlYE6PaqtClEHj
 cUdMUa3zhz+QQxpGqufH4Ijqe8D9OYoud+QbC+SGCiDARDJswbFqacnXrVJJ33J+6vx0
 Pov8/uiYGPLVi3NeennAoNAmFjV/wDEScyBpbAo+UigpLpdRxgnzrxCxvMuSPYjjnFOF
 1B+yImaAJjj4raNTocGH+PA0DDAhGaAzXQIS+CP6+yRISKj/XRYAv8DnlzfKEy/JJGQ9
 bjWmH1Pcwr5qZ/XQC6eeZMtpZccSsCggHTEupri6UaH3opkglrXvCSLgdTNUCBqcu1FJ
 /sIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+a3x2B0/KJq4wYj9GlAfLOlx8q2IrdZaa0L8o60yjpQ=;
 b=xNo278FyRAcspHPLj/Yt6tcLPh35c99sSVGZ0pOcMj0FwUxnSyuCI1YEkjf0LsjLLZ
 e4B95zkE0YMlX1L7MO6V6Zxwtny0j6kbo6zol5r2+c8YZzpU+b3sIFPxfTUZMnMmRVbf
 zaim4x9ggdfzfrAxwLHZcUr97liB1YQ/H4AAWHYD2lkwWK/cVZTKuq7iOTYGQNCqaG8x
 k/U+7bxWhIAfXzJuw4vJ9Wp1ZmJAS2jqFVVElk8zF3TgNrzh8lrtAqCO0VA0TqFPwSMo
 K+uditPQ7PNAWei89QZHYlaxaMw/TAnymU0ZQqDdjmPr6dHJdJK1yYG++29kAuVKX11I
 amJw==
X-Gm-Message-State: AOAM532DCPvHMo87eaNZBaB51m00KhFioRGHGiB0moIb4QaIVWdR803q
 O2xbLvj4tzP5p0khXTP/HA4o3A==
X-Google-Smtp-Source: ABdhPJzyqzJhJzyQe1RP/N+WzeXsWVZ5q5ArRIMWjjmXc3GsVaMsUlvKG202LoJ7kjKWKOWqnscMVg==
X-Received: by 2002:a05:6808:209b:: with SMTP id
 s27mr1489246oiw.43.1639438566662; 
 Mon, 13 Dec 2021 15:36:06 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id r23sm2447631ooj.37.2021.12.13.15.36.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 15:36:06 -0800 (PST)
Date: Mon, 13 Dec 2021 17:36:01 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Message-ID: <YbfY4RKsUP8K6RWH@builder.lan>
References: <1639070679-28348-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1639070679-28348-1-git-send-email-quic_khsieh@quicinc.com>
Subject: Re: [Freedreno] [PATCH v7] phy: qcom-qmp: add display port v4
 voltage and pre-emphasis swing tables
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
Cc: devicetree@vger.kernel.org, quic_abhinavk@quicinc.com, kishon@ti.com,
 freedreno@lists.freedesktop.org, vkoul@kernel.org, robh+dt@kernel.org,
 swboyd@chromium.org, Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com,
 agross@kernel.org, p.zabel@pengutronix.de, linux-arm-msm@vger.kernel.org,
 aravindh@codeaurora.org, sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu 09 Dec 11:24 CST 2021, Kuogee Hsieh wrote:

> From: Kuogee Hsieh <khsieh@codeaurora.org>
> 
> The previous patch from Fixes (aff188feb5e1) added functions to support V4

The expected way to reference an existing commit is 'sha1 ("subject")'
(including the ''), i.e. something like:

'aff188feb5e1 ("phy: qcom-qmp: add support for sm8250-usb3-dp phy")'
added functions to support V4 of the PHY, but it did not...

> phy. But it did not update voltage and pre-emphasis tables accordingly.
> This patch add v4 voltage and pre-emphasis swing tables to complete v4
> phy implementation. Both voltage and pre-emphasis swing level are set
> during link training negotiation between host and sink. There are totally
> four tables added.  A voltage swing table for both hbr and hbr1, a voltage
> table for both hbr2 and hbr3, a pre-emphasis table for both hbr and hbr1
> and a pre-emphasis table for both hbr2 and hbr3. In addition, write 0x0a
> to TX_TX_POL_INV is added to complete the sequence of configure dp phy
> base on HPG.

The world doesn't know what a HPG is, so you need to spell this out or
simply say "the hardware documentation".

Thanks,
Bjorn

> 
> Fixes: aff188feb5e1 ("phy: qcom-qmp: add support for sm8250-usb3-dp phy")
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 112 +++++++++++++++++++++++++-----------
>  1 file changed, 77 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index 456a59d..d41e30c 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -4255,40 +4255,50 @@ static void qcom_qmp_v3_phy_dp_aux_init(struct qmp_phy *qphy)
>  	       qphy->pcs + QSERDES_V3_DP_PHY_AUX_INTERRUPT_MASK);
>  }
>  
> -static const u8 qmp_dp_v3_pre_emphasis_hbr3_hbr2[4][4] = {
> +#define MAX_SWING_LEVEL 4
> +#define MAX_VOLTAGE_LEVEL 4
> +#define MAX_EMPHASIS_LEVEL 4
> +
> +static const u8 qmp_dp_v3_pre_emphasis_hbr3_hbr2[MAX_SWING_LEVEL][MAX_EMPHASIS_LEVEL] = {
>  	{ 0x00, 0x0c, 0x15, 0x1a },
>  	{ 0x02, 0x0e, 0x16, 0xff },
>  	{ 0x02, 0x11, 0xff, 0xff },
>  	{ 0x04, 0xff, 0xff, 0xff }
>  };
>  
> -static const u8 qmp_dp_v3_voltage_swing_hbr3_hbr2[4][4] = {
> +static const u8 qmp_dp_v3_voltage_swing_hbr3_hbr2[MAX_SWING_LEVEL][MAX_VOLTAGE_LEVEL] = {
>  	{ 0x02, 0x12, 0x16, 0x1a },
>  	{ 0x09, 0x19, 0x1f, 0xff },
>  	{ 0x10, 0x1f, 0xff, 0xff },
>  	{ 0x1f, 0xff, 0xff, 0xff }
>  };
>  
> -static const u8 qmp_dp_v3_pre_emphasis_hbr_rbr[4][4] = {
> +static const u8 qmp_dp_v3_pre_emphasis_hbr_rbr[MAX_SWING_LEVEL][MAX_EMPHASIS_LEVEL] = {
>  	{ 0x00, 0x0c, 0x14, 0x19 },
>  	{ 0x00, 0x0b, 0x12, 0xff },
>  	{ 0x00, 0x0b, 0xff, 0xff },
>  	{ 0x04, 0xff, 0xff, 0xff }
>  };
>  
> -static const u8 qmp_dp_v3_voltage_swing_hbr_rbr[4][4] = {
> +static const u8 qmp_dp_v3_voltage_swing_hbr_rbr[MAX_SWING_LEVEL][MAX_VOLTAGE_LEVEL] = {
>  	{ 0x08, 0x0f, 0x16, 0x1f },
>  	{ 0x11, 0x1e, 0x1f, 0xff },
>  	{ 0x19, 0x1f, 0xff, 0xff },
>  	{ 0x1f, 0xff, 0xff, 0xff }
>  };
>  
> -static int qcom_qmp_phy_configure_dp_swing(struct qmp_phy *qphy,
> -		unsigned int drv_lvl_reg, unsigned int emp_post_reg)
> +static int __qcom_qmp_phy_configure_dp_swing
> +			(struct qmp_phy *qphy,
> +			unsigned int drv_lvl_reg,
> +			unsigned int emp_post_reg,
> +			const u8 voltage_swing_hbr_rbr[MAX_SWING_LEVEL][MAX_VOLTAGE_LEVEL],
> +			const u8 pre_emphasis_hbr_rbr[MAX_SWING_LEVEL][MAX_EMPHASIS_LEVEL],
> +			const u8 voltage_swing_hbr3_hbr2[MAX_SWING_LEVEL][MAX_VOLTAGE_LEVEL],
> +			const u8 pre_emphasis_hbr3_hbr2[MAX_SWING_LEVEL][MAX_EMPHASIS_LEVEL])
>  {
>  	const struct phy_configure_opts_dp *dp_opts = &qphy->dp_opts;
>  	unsigned int v_level = 0, p_level = 0;
> -	u8 voltage_swing_cfg, pre_emphasis_cfg;
> +	u8 voltage, emphasis;
>  	int i;
>  
>  	for (i = 0; i < dp_opts->lanes; i++) {
> @@ -4297,26 +4307,25 @@ static int qcom_qmp_phy_configure_dp_swing(struct qmp_phy *qphy,
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
> @@ -4325,9 +4334,14 @@ static void qcom_qmp_v3_phy_configure_dp_tx(struct qmp_phy *qphy)
>  	const struct phy_configure_opts_dp *dp_opts = &qphy->dp_opts;
>  	u32 bias_en, drvr_en;
>  
> -	if (qcom_qmp_phy_configure_dp_swing(qphy,
> -				QSERDES_V3_TX_TX_DRV_LVL,
> -				QSERDES_V3_TX_TX_EMP_POST1_LVL) < 0)
> +	if (__qcom_qmp_phy_configure_dp_swing
> +			(qphy,
> +			QSERDES_V3_TX_TX_DRV_LVL,
> +			QSERDES_V3_TX_TX_EMP_POST1_LVL,
> +			qmp_dp_v3_voltage_swing_hbr_rbr,
> +			qmp_dp_v3_pre_emphasis_hbr_rbr,
> +			qmp_dp_v3_voltage_swing_hbr3_hbr2,
> +			qmp_dp_v3_pre_emphasis_hbr3_hbr2) < 0)
>  		return;
>  
>  	if (dp_opts->lanes == 1) {
> @@ -4465,6 +4479,35 @@ static int qcom_qmp_v3_dp_phy_calibrate(struct qmp_phy *qphy)
>  	return 0;
>  }
>  
> +/* The values in these tables are given without MUX_EN (0x20) bit set */
> +static const u8 qmp_dp_v4_pre_emphasis_hbr3_hbr2[MAX_SWING_LEVEL][MAX_EMPHASIS_LEVEL] = {
> +	{ 0x00, 0x0c, 0x15, 0x1b },
> +	{ 0x02, 0x0e, 0x16, 0xff },
> +	{ 0x02, 0x11, 0xff, 0xff },
> +	{ 0x04, 0xff, 0xff, 0xff }
> +};
> +
> +static const u8 qmp_dp_v4_voltage_swing_hbr3_hbr2[MAX_SWING_LEVEL][MAX_VOLTAGE_LEVEL] = {
> +	{ 0x02, 0x12, 0x16, 0x1a },
> +	{ 0x09, 0x19, 0x1f, 0xff },
> +	{ 0x10, 0x1f, 0xff, 0xff },
> +	{ 0x1f, 0xff, 0xff, 0xff }
> +};
> +
> +static const u8 qmp_dp_v4_pre_emphasis_hbr_rbr[MAX_SWING_LEVEL][MAX_EMPHASIS_LEVEL] = {
> +	{ 0x00, 0x0e, 0x15, 0x1b },
> +	{ 0x00, 0x0e, 0x15, 0xff },
> +	{ 0x00, 0x0e, 0xff, 0xff },
> +	{ 0x04, 0xff, 0xff, 0xff }
> +};
> +
> +static const u8 qmp_dp_v4_voltage_swing_hbr_rbr[MAX_SWING_LEVEL][MAX_VOLTAGE_LEVEL] = {
> +	{ 0x08, 0x0f, 0x16, 0x1f },
> +	{ 0x11, 0x1e, 0x1f, 0xff },
> +	{ 0x16, 0x1f, 0xff, 0xff },
> +	{ 0x1f, 0xff, 0xff, 0xff }
> +};
> +
>  static void qcom_qmp_v4_phy_dp_aux_init(struct qmp_phy *qphy)
>  {
>  	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_PSR_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
> @@ -4494,16 +4537,14 @@ static void qcom_qmp_v4_phy_dp_aux_init(struct qmp_phy *qphy)
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
> +	__qcom_qmp_phy_configure_dp_swing
> +			(qphy,
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
> @@ -4622,6 +4663,9 @@ static int qcom_qmp_v4_phy_configure_dp_phy(struct qmp_phy *qphy)
>  	writel(drvr1_en, qphy->tx2 + QSERDES_V4_TX_HIGHZ_DRVR_EN);
>  	writel(bias1_en, qphy->tx2 + QSERDES_V4_TX_TRANSCEIVER_BIAS_EN);
>  
> +	writel(0x0a, qphy->tx + QSERDES_V4_TX_TX_POL_INV);
> +	writel(0x0a, qphy->tx2 + QSERDES_V4_TX_TX_POL_INV);
> +
>  	writel(0x18, qphy->pcs + QSERDES_DP_PHY_CFG);
>  	udelay(2000);
>  	writel(0x19, qphy->pcs + QSERDES_DP_PHY_CFG);
> @@ -4633,11 +4677,9 @@ static int qcom_qmp_v4_phy_configure_dp_phy(struct qmp_phy *qphy)
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
