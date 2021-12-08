Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6C646DDD0
	for <lists+freedreno@lfdr.de>; Wed,  8 Dec 2021 22:46:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A15C06E041;
	Wed,  8 Dec 2021 21:46:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 420896E041
 for <freedreno@lists.freedesktop.org>; Wed,  8 Dec 2021 21:46:33 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 v15-20020a9d604f000000b0056cdb373b82so4156455otj.7
 for <freedreno@lists.freedesktop.org>; Wed, 08 Dec 2021 13:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Yk17ZzWUHbqpSdQ87ZtHlIePjFkvqbkWw/I/IO9o50Q=;
 b=O+Ao8mjKqQGG65pz4p8CRueZd6rURGFpdfPVQMw+rc2qJ6FRxq+m1QQKRVmgrmVPut
 moGf+o8MvRxXC4R1IlwpWM1sqBMiKigF3ggQGKttU8E67TC57dIfvRBCbjbSZm50L0y+
 Q+HVcpetSD4JUg2rMuaF91QKVqZAGB5IZijShzyv8ga4IwQDivC6jeBgMm3wUUvh7raJ
 jcmECrAqkxFNOxqJMW6ARXhcK3oiEl8/6XoMQoyOiwNjAjlxxnkKDReTyZi9Pj2VmslM
 LiBwmiKx7duJjCEg8Warb398u/CA3zuTbkpI2etekAN93jfTRBibmVEHUFSCAMj43hf3
 fBXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Yk17ZzWUHbqpSdQ87ZtHlIePjFkvqbkWw/I/IO9o50Q=;
 b=E9h2dm7mK/KanyVgtnPiQ68thjoG8MfDgymwBi7pBlp+jZUdAlLal6BkEHLHjPElm2
 LnWpDJC6DjLh4CqSz3sP0X59fylCL4MviCaO1lwD5/tQ7NAq0xR9dxv1wxn6bseA3S36
 9dyi7NvR7acwobAvoG2FXyE960DLLNlRLkAYbfE6Jr+HOffkIKsxH/mi9Jdes8lma0Au
 gihNI7PuHLxcZQmLtxHJmwZJX6UWu8wH1IVaxQB6HCquJbwLRez3G5CZjXi/WSvHuMih
 DfkxYa/ZmRc5oB1GTHE//Yr2COb4hDIhQM6jUwbTCW7eJhEd8wt+ch2JknXR+/WnbPrA
 M2PQ==
X-Gm-Message-State: AOAM533wWe1m0FhA9fiUOCy2oExfShnq+XZuJLMrcgSshBaHEJrwm+NB
 vIN0M3IZEDAaCtCirUKgZkTBjQ==
X-Google-Smtp-Source: ABdhPJwC7+QElHOUrDWWWt1xqmuVqMxEcFYT8epWsNivSmScQYHI4GyIs/H/Cr7TzBJJX5YB54Q0ew==
X-Received: by 2002:a9d:58f:: with SMTP id 15mr1836337otd.11.1638999992369;
 Wed, 08 Dec 2021 13:46:32 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id j5sm692221ots.68.2021.12.08.13.46.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 13:46:31 -0800 (PST)
Date: Wed, 8 Dec 2021 13:47:58 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Message-ID: <YbEoDrXRwBVGx21B@ripper>
References: <1638998533-3729-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1638998533-3729-1-git-send-email-quic_khsieh@quicinc.com>
Subject: Re: [Freedreno] [PATCH v6] phy: qcom-qmp: add display port v4
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

On Wed 08 Dec 13:22 PST 2021, Kuogee Hsieh wrote:

> From: Kuogee Hsieh <khsieh@codeaurora.org>
> 
> "add support for sm8250-usb3-dp phy" patch added functions to support V4
> phy. But it did not update voltage and pre-emphasis tables accordingly.
> This patch add v4 voltage and pre-emphasis swing tables to complete v4
> phy implementation. Both voltage and pre-emphasis swing level are set
> during link training negotiation between host and sink. There are totally
> four tables added.  A voltage swing table for both hbr and hbr1, a voltage
> table for both hbr2 and hbr3, a pre-emphasis table for both hbr and hbr1
> and a pre-emphasis table for both hbr2 and hbr3. In addition, write 0x0a
> to TX_TX_POL_INV is added to complete the sequence of configure dp phy
> base on HPG.
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
> 
> Changes in V5:
> -- rebase on msm-next
> 
> Changes in V6:
> -- change commit text title
> -- re wording commit text

The changelog still don't belong in the commit message, perhaps Vinod
can drop that as he applies the patch.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> 
> Fixes: aff188feb5e1 ("phy: qcom-qmp: add support for sm8250-usb3-dp phy")
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 97 +++++++++++++++++++++++++------------
>  1 file changed, 66 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index 456a59d..1f3585d 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -4283,12 +4283,17 @@ static const u8 qmp_dp_v3_voltage_swing_hbr_rbr[4][4] = {
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
> @@ -4297,26 +4302,25 @@ static int qcom_qmp_phy_configure_dp_swing(struct qmp_phy *qphy,
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
> @@ -4325,9 +4329,13 @@ static void qcom_qmp_v3_phy_configure_dp_tx(struct qmp_phy *qphy)
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
> @@ -4465,6 +4473,35 @@ static int qcom_qmp_v3_dp_phy_calibrate(struct qmp_phy *qphy)
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
> @@ -4494,16 +4531,13 @@ static void qcom_qmp_v4_phy_dp_aux_init(struct qmp_phy *qphy)
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
> @@ -4622,6 +4656,9 @@ static int qcom_qmp_v4_phy_configure_dp_phy(struct qmp_phy *qphy)
>  	writel(drvr1_en, qphy->tx2 + QSERDES_V4_TX_HIGHZ_DRVR_EN);
>  	writel(bias1_en, qphy->tx2 + QSERDES_V4_TX_TRANSCEIVER_BIAS_EN);
>  
> +	writel(0x0a, qphy->tx + QSERDES_V4_TX_TX_POL_INV);
> +	writel(0x0a, qphy->tx2 + QSERDES_V4_TX_TX_POL_INV);
> +
>  	writel(0x18, qphy->pcs + QSERDES_DP_PHY_CFG);
>  	udelay(2000);
>  	writel(0x19, qphy->pcs + QSERDES_DP_PHY_CFG);
> @@ -4633,11 +4670,9 @@ static int qcom_qmp_v4_phy_configure_dp_phy(struct qmp_phy *qphy)
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
