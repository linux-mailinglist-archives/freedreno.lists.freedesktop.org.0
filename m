Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB61D3FA03A
	for <lists+freedreno@lfdr.de>; Fri, 27 Aug 2021 22:00:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C0C96E9BA;
	Fri, 27 Aug 2021 20:00:28 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EA516E9BA
 for <freedreno@lists.freedesktop.org>; Fri, 27 Aug 2021 20:00:24 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1630094426; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=z72idV3NWgM7ioiLJkOrmuVDeX54IRncvfUCduwkFdc=;
 b=Yd756af4pvvU0RkhDdg7/vCp/SDJxt2iNEGVzEu/HP1k3ZvNPZ3RzWPebGgbpKNWCic2SByi
 B/rAvG/3RM5OX1ZKKDMcJ5VnPlTytj6ZAQwIj1WdBnptjHUOna4dJoefvX6z+KHX/tJlvlpo
 YExsGvqiRZ7+C/hb10J9Rq3r0FQ=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 61294453d6653df7679f288e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 27 Aug 2021 20:00:19
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id F0ED7C43460; Fri, 27 Aug 2021 20:00:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 781D6C4338F;
 Fri, 27 Aug 2021 20:00:16 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 27 Aug 2021 13:00:16 -0700
From: khsieh@codeaurora.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: agross@kernel.org, bjorn.andersson@linaro.org,
 devicetree@vger.kernel.org, robdclark@gmail.com, robh+dt@kernel.org,
 sean@poorly.run, vkoul@kernel.org, abhinavk@codeaurora.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, kishon@ti.com,
 p.zabel@pengutronix.de
In-Reply-To: <CAE-0n52obotsMwXLHm8Fkd3+7QnXCEZgVhO_FNSY7RsbC+pbcA@mail.gmail.com>
References: <1629847775-16767-1-git-send-email-khsieh@codeaurora.org>
 <CAE-0n52obotsMwXLHm8Fkd3+7QnXCEZgVhO_FNSY7RsbC+pbcA@mail.gmail.com>
Message-ID: <556428d20109fee3b4e3e1fd185e22cf@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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

On 2021-08-25 10:49, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2021-08-24 16:29:35)
>> Add voltage and pre emphesis swing tables so that voltage and
> 
> Is it "pre-emphasis"?
> 
>> pre emphsis swing level can be configured base on link rate.
> 
> This one is also different.
> 
>> 
>> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> 
> Presumably
> 
> Fixes: aff188feb5e1 ("phy: qcom-qmp: add support for sm8250-usb3-dp 
> phy")
> 
>> ---
>>  drivers/phy/qualcomm/phy-qcom-qmp.c | 95 
>> ++++++++++++++++++++++++++++++++-----
>>  1 file changed, 82 insertions(+), 13 deletions(-)
>> 
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c 
>> b/drivers/phy/qualcomm/phy-qcom-qmp.c
>> index 31036aa..52bab6e 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
>> @@ -1916,7 +1916,7 @@ static const struct qmp_phy_init_tbl 
>> qmp_v4_dp_tx_tbl[] = {
>>         QMP_PHY_INIT_CFG(QSERDES_V4_TX_RES_CODE_LANE_OFFSET_RX, 0x11),
>>         QMP_PHY_INIT_CFG(QSERDES_V4_TX_TX_BAND, 0x4),
>>         QMP_PHY_INIT_CFG(QSERDES_V4_TX_TX_POL_INV, 0x0a),
>> -       QMP_PHY_INIT_CFG(QSERDES_V4_TX_TX_DRV_LVL, 0x2a),
>> +       QMP_PHY_INIT_CFG(QSERDES_V4_TX_TX_DRV_LVL, 0x22),
> 
> Is 0x22 the better "default"? Can that be described in the commit text?
> 
>>         QMP_PHY_INIT_CFG(QSERDES_V4_TX_TX_EMP_POST1_LVL, 0x20),
>>  };
>> 
>> @@ -3727,6 +3727,81 @@ static int qcom_qmp_v3_dp_phy_calibrate(struct 
>> qmp_phy *qphy)
>> 
>>         return 0;
>>  }
> 
> Nitpick: Newline here please.
> 
>> +/*
>> + * 0x20 deducted from tables
>> + *
>> + * swing_value |= DP_PHY_TXn_TX_DRV_LVL_MUX_EN;
>> + * pre_emphasis_value |= DP_PHY_TXn_TX_EMP_POST1_LVL_MUX_EN;
>> +*/
>> +static const u8 qmp_dp_v4_pre_emphasis_hbr3_hbr2[4][4] = {
>> +       /* p0    p1    p2    p3 */
>> +       { 0x00, 0x0c, 0x15, 0x1b },     /* s0 */
>> +       { 0x02, 0x0e, 0x16, 0xff },     /* s1 */
>> +       { 0x02, 0x11, 0xff, 0xff },     /* s2 */
>> +       { 0x04, 0xff, 0xff, 0xff }      /* s3 */
>> +};
>> +
>> +static const u8 qmp_dp_v4_voltage_swing_hbr3_hbr2[4][4] = {
> 
> This looks the same as qmp_dp_v3_voltage_swing_hbr3_hbr2. Can that be
> used?
to avoid confuse, i like to keep them separated.
> 
>> +       /* p0    p1    p2    p3 */
>> +       { 0x02, 0x12, 0x16, 0x1a },     /* s0 */
>> +       { 0x09, 0x19, 0x1f, 0xff },     /* s1 */
>> +       { 0x10, 0x1f, 0xff, 0xff },     /* s2 */
>> +       { 0x1f, 0xff, 0xff, 0xff }      /* s3 */
>> +};
>> +
>> +static const u8 qmp_dp_v4_pre_emphasis_hbr_rbr[4][4] = {
>> +       /* p0    p1    p2    p3 */
>> +       { 0x00, 0x0e, 0x15, 0x1b },     /* s0 */
>> +       { 0x00, 0x0e, 0x15, 0xff },     /* s1 */
>> +       { 0x00, 0x0e, 0xff, 0xff },     /* s2 */
>> +       { 0x04, 0xff, 0xff, 0xff }      /* s3 */
>> +};
>> +
>> +static const u8 qmp_dp_v4_voltage_swing_hbr_rbr[4][4] = {
>> +       /* p0    p1    p2    p3 */
>> +       { 0x08, 0x0f, 0x16, 0x1f },     /* s0 */
>> +       { 0x11, 0x1e, 0x1f, 0xff },     /* s1 */
>> +       { 0x16, 0x1f, 0xff, 0xff },     /* s2 */
>> +       { 0x1f, 0xff, 0xff, 0xff }      /* s3 */
> 
> Do these comments add any value? Can we drop them?
> 
>> +};
>> +
>> +static int qcom_qmp_v4_phy_configure_dp_swing(struct qmp_phy *qphy,
>> +               unsigned int drv_lvl_reg, unsigned int emp_post_reg)
>> +{
>> +       const struct phy_configure_opts_dp *dp_opts = &qphy->dp_opts;
>> +       unsigned int v_level = 0, p_level = 0;
>> +       u8 voltage_swing_cfg, pre_emphasis_cfg;
>> +       int i;
>> +
>> +       for (i = 0; i < dp_opts->lanes; i++) {
>> +               v_level = max(v_level, dp_opts->voltage[i]);
>> +               p_level = max(p_level, dp_opts->pre[i]);
>> +       }
>> +
>> +
> 
> Nitpick: Drop extra newline.
> 
>> +       if (dp_opts->link_rate <= 2700) {
>> +               voltage_swing_cfg = 
>> qmp_dp_v4_voltage_swing_hbr_rbr[v_level][p_level];
>> +               pre_emphasis_cfg = 
>> qmp_dp_v4_pre_emphasis_hbr_rbr[v_level][p_level];
>> +       } else {
>> +               voltage_swing_cfg = 
>> qmp_dp_v4_voltage_swing_hbr3_hbr2[v_level][p_level];
>> +               pre_emphasis_cfg = 
>> qmp_dp_v4_pre_emphasis_hbr3_hbr2[v_level][p_level];
>> +       }
>> +
>> +       /* TODO: Move check to config check */
>> +       if (voltage_swing_cfg == 0xFF && pre_emphasis_cfg == 0xFF)
>> +               return -EINVAL;
>> +
>> +       /* Enable MUX to use Cursor values from these registers */
>> +       voltage_swing_cfg |= DP_PHY_TXn_TX_DRV_LVL_MUX_EN;
>> +       pre_emphasis_cfg |= DP_PHY_TXn_TX_EMP_POST1_LVL_MUX_EN;
>> +
>> +       writel(voltage_swing_cfg, qphy->tx + drv_lvl_reg);
>> +       writel(pre_emphasis_cfg, qphy->tx + emp_post_reg);
>> +       writel(voltage_swing_cfg, qphy->tx2 + drv_lvl_reg);
>> +       writel(pre_emphasis_cfg, qphy->tx2 + emp_post_reg);
> 
> This is copy/pasted from qcom_qmp_phy_configure_dp_swing() right? How
> about making a function
> 
> static int
> __qcom_qmp_phy_configure_dp_swing(struct qmp_phy *qphy,
> 				  unsigned int drv_lvl_reg,
> 				  unsigned int emp_post_reg,
> 				  const u8 **voltage_rbr_hbr,
> 				  const u8 **pre_emphasis_rbr_hbr,
> 				  const u8 **voltage_hbr3_hbr2,
> 				  const u8 **pre_emphasis_hbr3_hbr2)
> 
> that does the same stuff but allows the tables to be different.
> 
>> +
>> +       return 0;
>> +}
>> 
>>  static void qcom_qmp_v4_phy_dp_aux_init(struct qmp_phy *qphy)
>>  {
>> @@ -3757,14 +3832,7 @@ static void qcom_qmp_v4_phy_dp_aux_init(struct 
>> qmp_phy *qphy)
>> 
>>  static void qcom_qmp_v4_phy_configure_dp_tx(struct qmp_phy *qphy)
>>  {
>> -       /* Program default values before writing proper values */
>> -       writel(0x27, qphy->tx + QSERDES_V4_TX_TX_DRV_LVL);
>> -       writel(0x27, qphy->tx2 + QSERDES_V4_TX_TX_DRV_LVL);
>> -
>> -       writel(0x20, qphy->tx + QSERDES_V4_TX_TX_EMP_POST1_LVL);
>> -       writel(0x20, qphy->tx2 + QSERDES_V4_TX_TX_EMP_POST1_LVL);
>> -
>> -       qcom_qmp_phy_configure_dp_swing(qphy,
>> +       qcom_qmp_v4_phy_configure_dp_swing(qphy,
>>                         QSERDES_V4_TX_TX_DRV_LVL,
>>                         QSERDES_V4_TX_TX_EMP_POST1_LVL);
>>  }
>> @@ -3885,6 +3953,9 @@ static int 
>> qcom_qmp_v4_phy_configure_dp_phy(struct qmp_phy *qphy)
>>         writel(drvr1_en, qphy->tx2 + QSERDES_V4_TX_HIGHZ_DRVR_EN);
>>         writel(bias1_en, qphy->tx2 + 
>> QSERDES_V4_TX_TRANSCEIVER_BIAS_EN);
>> 
>> +       writel(0x0a, qphy->tx + QSERDES_V4_TX_TX_POL_INV);
>> +       writel(0x0a, qphy->tx2 + QSERDES_V4_TX_TX_POL_INV);
> 
> Is this mentioned in the commit text? Is this fixing the sequence?
> It doesn't look like we're adding tables.

add these since they are missed from HPG sequence.
> 
>> +
>>         writel(0x18, qphy->pcs + QSERDES_DP_PHY_CFG);
>>         udelay(2000);
>>         writel(0x19, qphy->pcs + QSERDES_DP_PHY_CFG);
>> @@ -3896,11 +3967,9 @@ static int 
>> qcom_qmp_v4_phy_configure_dp_phy(struct qmp_phy *qphy)
>>                         10000))
>>                 return -ETIMEDOUT;
>> 
>> -       writel(0x0a, qphy->tx + QSERDES_V4_TX_TX_POL_INV);
>> -       writel(0x0a, qphy->tx2 + QSERDES_V4_TX_TX_POL_INV);
>> 
>> -       writel(0x27, qphy->tx + QSERDES_V4_TX_TX_DRV_LVL);
>> -       writel(0x27, qphy->tx2 + QSERDES_V4_TX_TX_DRV_LVL);
>> +       writel(0x22, qphy->tx + QSERDES_V4_TX_TX_DRV_LVL);
>> +       writel(0x22, qphy->tx2 + QSERDES_V4_TX_TX_DRV_LVL);
>> 
>>         writel(0x20, qphy->tx + QSERDES_V4_TX_TX_EMP_POST1_LVL);
>>         writel(0x20, qphy->tx2 + QSERDES_V4_TX_TX_EMP_POST1_LVL);
