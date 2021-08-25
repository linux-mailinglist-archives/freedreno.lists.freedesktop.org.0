Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 039013F7BBA
	for <lists+freedreno@lfdr.de>; Wed, 25 Aug 2021 19:50:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99FDB6E3F7;
	Wed, 25 Aug 2021 17:49:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32E386E3F7
 for <freedreno@lists.freedesktop.org>; Wed, 25 Aug 2021 17:49:49 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 m7-20020a9d4c87000000b0051875f56b95so23884otf.6
 for <freedreno@lists.freedesktop.org>; Wed, 25 Aug 2021 10:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=IHLTZuGBoBlIFXswVu7bXC/9iKMJE13qU6Y1SgFjzlc=;
 b=KOn72M/be1SVIlEd8SkIJsZJ97/eGvxHtqGd4iwCylW1lrZ85kbyU90MVU9O3ZDdxU
 IZom4HK739dYulYJMozQ+TkGBDLOuq+uCZDciXjLmMduA1hSsyahSyzY5WY+JXaJO4d3
 zTxV04LhDNnqD8IxBRwE81AIw7TYp+OiPklG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=IHLTZuGBoBlIFXswVu7bXC/9iKMJE13qU6Y1SgFjzlc=;
 b=IKMIb43HcqDpS3y258Kw3M5bucvVY2d4wfE6OkdEwliiqB7sN1CeFcPIJdBIpuFtcT
 FsXNZ49uW0EBogG1ZYI+hGkIwt05reHBPbnYXlTcEO3yTywUqGuWsUaVfSOJSppltH0S
 REDoA9akDOJekSJABEzmDSyH7itXrUi9kRvIvpEgNWLzh2uVCUoBCUf1HIit+iOmQLtS
 +/jCAOQY89GtwSi4m7YWTPq8Xykc2tU4v/cf4bfcVESU0BmN7/ai0KvjthtG/Cn0sZXy
 C2OGXlIEPY5GA7TucCTy5e8FKsGxvn+cs+XRO+n/lhjH0Td3l7iSS7xdCipG3D8kVpFq
 KABw==
X-Gm-Message-State: AOAM531/GZCqTN1biIXfkr9ETS/Om9wPbDvS/kBL+4NasRRCKxcg/nnx
 HVaxLBPM9M/cfimRRjNqIxzcCgg/cvoyBPs7DuQNbQ==
X-Google-Smtp-Source: ABdhPJxW5wHzEiRPZArcpHDa60XkS4gMZuHdU4SRDUo0pRaGJR5599SJE1ynpdZmPBns6PhWB8W+Ii3SYlSa1hgLSao=
X-Received: by 2002:a05:6830:2473:: with SMTP id
 x51mr31144560otr.34.1629913788390; 
 Wed, 25 Aug 2021 10:49:48 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 25 Aug 2021 17:49:47 +0000
MIME-Version: 1.0
In-Reply-To: <1629847775-16767-1-git-send-email-khsieh@codeaurora.org>
References: <1629847775-16767-1-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 25 Aug 2021 17:49:47 +0000
Message-ID: <CAE-0n52obotsMwXLHm8Fkd3+7QnXCEZgVhO_FNSY7RsbC+pbcA@mail.gmail.com>
To: Kuogee Hsieh <khsieh@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, 
 devicetree@vger.kernel.org, robdclark@gmail.com, robh+dt@kernel.org, 
 sean@poorly.run, vkoul@kernel.org
Cc: abhinavk@codeaurora.org, aravindh@codeaurora.org, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kishon@ti.com, p.zabel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] phy: qcom-qmp: add support for voltage and
 pre emphesis swing
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

Quoting Kuogee Hsieh (2021-08-24 16:29:35)
> Add voltage and pre emphesis swing tables so that voltage and

Is it "pre-emphasis"?

> pre emphsis swing level can be configured base on link rate.

This one is also different.

>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>

Presumably

Fixes: aff188feb5e1 ("phy: qcom-qmp: add support for sm8250-usb3-dp phy")

> ---
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 95 ++++++++++++++++++++++++++++++++-----
>  1 file changed, 82 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index 31036aa..52bab6e 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -1916,7 +1916,7 @@ static const struct qmp_phy_init_tbl qmp_v4_dp_tx_tbl[] = {
>         QMP_PHY_INIT_CFG(QSERDES_V4_TX_RES_CODE_LANE_OFFSET_RX, 0x11),
>         QMP_PHY_INIT_CFG(QSERDES_V4_TX_TX_BAND, 0x4),
>         QMP_PHY_INIT_CFG(QSERDES_V4_TX_TX_POL_INV, 0x0a),
> -       QMP_PHY_INIT_CFG(QSERDES_V4_TX_TX_DRV_LVL, 0x2a),
> +       QMP_PHY_INIT_CFG(QSERDES_V4_TX_TX_DRV_LVL, 0x22),

Is 0x22 the better "default"? Can that be described in the commit text?

>         QMP_PHY_INIT_CFG(QSERDES_V4_TX_TX_EMP_POST1_LVL, 0x20),
>  };
>
> @@ -3727,6 +3727,81 @@ static int qcom_qmp_v3_dp_phy_calibrate(struct qmp_phy *qphy)
>
>         return 0;
>  }

Nitpick: Newline here please.

> +/*
> + * 0x20 deducted from tables
> + *
> + * swing_value |= DP_PHY_TXn_TX_DRV_LVL_MUX_EN;
> + * pre_emphasis_value |= DP_PHY_TXn_TX_EMP_POST1_LVL_MUX_EN;
> +*/
> +static const u8 qmp_dp_v4_pre_emphasis_hbr3_hbr2[4][4] = {
> +       /* p0    p1    p2    p3 */
> +       { 0x00, 0x0c, 0x15, 0x1b },     /* s0 */
> +       { 0x02, 0x0e, 0x16, 0xff },     /* s1 */
> +       { 0x02, 0x11, 0xff, 0xff },     /* s2 */
> +       { 0x04, 0xff, 0xff, 0xff }      /* s3 */
> +};
> +
> +static const u8 qmp_dp_v4_voltage_swing_hbr3_hbr2[4][4] = {

This looks the same as qmp_dp_v3_voltage_swing_hbr3_hbr2. Can that be
used?

> +       /* p0    p1    p2    p3 */
> +       { 0x02, 0x12, 0x16, 0x1a },     /* s0 */
> +       { 0x09, 0x19, 0x1f, 0xff },     /* s1 */
> +       { 0x10, 0x1f, 0xff, 0xff },     /* s2 */
> +       { 0x1f, 0xff, 0xff, 0xff }      /* s3 */
> +};
> +
> +static const u8 qmp_dp_v4_pre_emphasis_hbr_rbr[4][4] = {
> +       /* p0    p1    p2    p3 */
> +       { 0x00, 0x0e, 0x15, 0x1b },     /* s0 */
> +       { 0x00, 0x0e, 0x15, 0xff },     /* s1 */
> +       { 0x00, 0x0e, 0xff, 0xff },     /* s2 */
> +       { 0x04, 0xff, 0xff, 0xff }      /* s3 */
> +};
> +
> +static const u8 qmp_dp_v4_voltage_swing_hbr_rbr[4][4] = {
> +       /* p0    p1    p2    p3 */
> +       { 0x08, 0x0f, 0x16, 0x1f },     /* s0 */
> +       { 0x11, 0x1e, 0x1f, 0xff },     /* s1 */
> +       { 0x16, 0x1f, 0xff, 0xff },     /* s2 */
> +       { 0x1f, 0xff, 0xff, 0xff }      /* s3 */

Do these comments add any value? Can we drop them?

> +};
> +
> +static int qcom_qmp_v4_phy_configure_dp_swing(struct qmp_phy *qphy,
> +               unsigned int drv_lvl_reg, unsigned int emp_post_reg)
> +{
> +       const struct phy_configure_opts_dp *dp_opts = &qphy->dp_opts;
> +       unsigned int v_level = 0, p_level = 0;
> +       u8 voltage_swing_cfg, pre_emphasis_cfg;
> +       int i;
> +
> +       for (i = 0; i < dp_opts->lanes; i++) {
> +               v_level = max(v_level, dp_opts->voltage[i]);
> +               p_level = max(p_level, dp_opts->pre[i]);
> +       }
> +
> +

Nitpick: Drop extra newline.

> +       if (dp_opts->link_rate <= 2700) {
> +               voltage_swing_cfg = qmp_dp_v4_voltage_swing_hbr_rbr[v_level][p_level];
> +               pre_emphasis_cfg = qmp_dp_v4_pre_emphasis_hbr_rbr[v_level][p_level];
> +       } else {
> +               voltage_swing_cfg = qmp_dp_v4_voltage_swing_hbr3_hbr2[v_level][p_level];
> +               pre_emphasis_cfg = qmp_dp_v4_pre_emphasis_hbr3_hbr2[v_level][p_level];
> +       }
> +
> +       /* TODO: Move check to config check */
> +       if (voltage_swing_cfg == 0xFF && pre_emphasis_cfg == 0xFF)
> +               return -EINVAL;
> +
> +       /* Enable MUX to use Cursor values from these registers */
> +       voltage_swing_cfg |= DP_PHY_TXn_TX_DRV_LVL_MUX_EN;
> +       pre_emphasis_cfg |= DP_PHY_TXn_TX_EMP_POST1_LVL_MUX_EN;
> +
> +       writel(voltage_swing_cfg, qphy->tx + drv_lvl_reg);
> +       writel(pre_emphasis_cfg, qphy->tx + emp_post_reg);
> +       writel(voltage_swing_cfg, qphy->tx2 + drv_lvl_reg);
> +       writel(pre_emphasis_cfg, qphy->tx2 + emp_post_reg);

This is copy/pasted from qcom_qmp_phy_configure_dp_swing() right? How
about making a function

static int
__qcom_qmp_phy_configure_dp_swing(struct qmp_phy *qphy,
				  unsigned int drv_lvl_reg,
				  unsigned int emp_post_reg,
				  const u8 **voltage_rbr_hbr,
				  const u8 **pre_emphasis_rbr_hbr,
				  const u8 **voltage_hbr3_hbr2,
				  const u8 **pre_emphasis_hbr3_hbr2)

that does the same stuff but allows the tables to be different.

> +
> +       return 0;
> +}
>
>  static void qcom_qmp_v4_phy_dp_aux_init(struct qmp_phy *qphy)
>  {
> @@ -3757,14 +3832,7 @@ static void qcom_qmp_v4_phy_dp_aux_init(struct qmp_phy *qphy)
>
>  static void qcom_qmp_v4_phy_configure_dp_tx(struct qmp_phy *qphy)
>  {
> -       /* Program default values before writing proper values */
> -       writel(0x27, qphy->tx + QSERDES_V4_TX_TX_DRV_LVL);
> -       writel(0x27, qphy->tx2 + QSERDES_V4_TX_TX_DRV_LVL);
> -
> -       writel(0x20, qphy->tx + QSERDES_V4_TX_TX_EMP_POST1_LVL);
> -       writel(0x20, qphy->tx2 + QSERDES_V4_TX_TX_EMP_POST1_LVL);
> -
> -       qcom_qmp_phy_configure_dp_swing(qphy,
> +       qcom_qmp_v4_phy_configure_dp_swing(qphy,
>                         QSERDES_V4_TX_TX_DRV_LVL,
>                         QSERDES_V4_TX_TX_EMP_POST1_LVL);
>  }
> @@ -3885,6 +3953,9 @@ static int qcom_qmp_v4_phy_configure_dp_phy(struct qmp_phy *qphy)
>         writel(drvr1_en, qphy->tx2 + QSERDES_V4_TX_HIGHZ_DRVR_EN);
>         writel(bias1_en, qphy->tx2 + QSERDES_V4_TX_TRANSCEIVER_BIAS_EN);
>
> +       writel(0x0a, qphy->tx + QSERDES_V4_TX_TX_POL_INV);
> +       writel(0x0a, qphy->tx2 + QSERDES_V4_TX_TX_POL_INV);

Is this mentioned in the commit text? Is this fixing the sequence?
It doesn't look like we're adding tables.

> +
>         writel(0x18, qphy->pcs + QSERDES_DP_PHY_CFG);
>         udelay(2000);
>         writel(0x19, qphy->pcs + QSERDES_DP_PHY_CFG);
> @@ -3896,11 +3967,9 @@ static int qcom_qmp_v4_phy_configure_dp_phy(struct qmp_phy *qphy)
>                         10000))
>                 return -ETIMEDOUT;
>
> -       writel(0x0a, qphy->tx + QSERDES_V4_TX_TX_POL_INV);
> -       writel(0x0a, qphy->tx2 + QSERDES_V4_TX_TX_POL_INV);
>
> -       writel(0x27, qphy->tx + QSERDES_V4_TX_TX_DRV_LVL);
> -       writel(0x27, qphy->tx2 + QSERDES_V4_TX_TX_DRV_LVL);
> +       writel(0x22, qphy->tx + QSERDES_V4_TX_TX_DRV_LVL);
> +       writel(0x22, qphy->tx2 + QSERDES_V4_TX_TX_DRV_LVL);
>
>         writel(0x20, qphy->tx + QSERDES_V4_TX_TX_EMP_POST1_LVL);
>         writel(0x20, qphy->tx2 + QSERDES_V4_TX_TX_EMP_POST1_LVL);
