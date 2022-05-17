Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B616A52AAAB
	for <lists+freedreno@lfdr.de>; Tue, 17 May 2022 20:25:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 678AE897FD;
	Tue, 17 May 2022 18:25:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C3EA897FD
 for <freedreno@lists.freedesktop.org>; Tue, 17 May 2022 18:25:25 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id m6so2210017ljb.2
 for <freedreno@lists.freedesktop.org>; Tue, 17 May 2022 11:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qH8JUwLx+nM2xLEZwshDyeOy6cvrct0hZrP49LTkuDM=;
 b=EY9f44uXKvLkOY8iZd14BHawAhNUN5U4GqSLHNYuqKHcKS0Qke1+e4dR2Lr2q+pgtm
 PuNJGHYdn8j0Q/PHfKAhuitiiKnVmprU51irprKmrChcHh4UC7xaOLSS3bNfv3rRF2Ws
 I6aoIAW3INBzIFcGpdp5JQMEl5AHmprHor3Xc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qH8JUwLx+nM2xLEZwshDyeOy6cvrct0hZrP49LTkuDM=;
 b=WAPZF66PN8kBjpv2t+GlSllNHcf2SRdRusrOZStPrJNurgjJzxltNWJ4nxs1JvcQy7
 kqCHwi1nSQUvmkUKmo7kdQUFIDLCdru0C/v1NwAtkOhikdrZylLB18XVnH1MzN8uJEBx
 qAZvCFRyhcQ2brcdnmQbCJpNkqikcrCYYy3RwFB7gw5iKnYn3beCZ6OqSE+Dg8DwXnVc
 h26dcU0t9SHx68tvc1Sk36OlElFaL9F87nEF5i91mbZuHoFeIwuB2tOrp16en5oCwLOA
 VhlUp5AEE8uvNV0PfZp6xo5Q80kv+NVcKX0YNw8ec3+nOrAiVHvQLLbdZLinklf6fITG
 OGjA==
X-Gm-Message-State: AOAM530WW727ZPrzMWCgFRLhMLOK3jkIl5enccMLisoLb0NRKB4Bifps
 FkVobFIyJCWDL1bNUZmb1ogK9gCL2MXR8z5q
X-Google-Smtp-Source: ABdhPJzGGf8DIU7FVYPuywdVfk2mwnOtqqtFfEioPH3X+Ppfh7Y3EJYxNo6b/k8XE1FYxRAHyYfHYg==
X-Received: by 2002:a2e:9801:0:b0:24f:983:b17f with SMTP id
 a1-20020a2e9801000000b0024f0983b17fmr15426107ljj.88.1652811923407; 
 Tue, 17 May 2022 11:25:23 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com.
 [209.85.208.173]) by smtp.gmail.com with ESMTPSA id
 p3-20020a05651211e300b0047255d21103sm29687lfs.50.2022.05.17.11.25.22
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 11:25:23 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id i23so1736928ljb.4
 for <freedreno@lists.freedesktop.org>; Tue, 17 May 2022 11:25:22 -0700 (PDT)
X-Received: by 2002:a5d:5009:0:b0:20d:846:f4da with SMTP id
 e9-20020a5d5009000000b0020d0846f4damr10202605wrt.301.1652811497320; Tue, 17
 May 2022 11:18:17 -0700 (PDT)
MIME-Version: 1.0
References: <1652808360-9830-1-git-send-email-quic_khsieh@quicinc.com>
 <1652808360-9830-2-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1652808360-9830-2-git-send-email-quic_khsieh@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 17 May 2022 11:18:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U0Ba0th-jmF+3t9BPEisXU2ZmjiahV7YFUqC0fbUrvJQ@mail.gmail.com>
Message-ID: <CAD=FV=U0Ba0th-jmF+3t9BPEisXU2ZmjiahV7YFUqC0fbUrvJQ@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v1 1/2] phy/qcom: add regulator_set_load to
 edp/dp phy
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 David Airlie <airlied@linux.ie>, freedreno <freedreno@lists.freedesktop.org>,
 Vinod Koul <vkoul@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Andy Gross <agross@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Tue, May 17, 2022 at 10:26 AM Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> This patch add regulator_set_load() to both eDP and DP phy driver
> to have totally control regulators.
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 25 +++++++++++++++++++++----
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 24 ++++++++++++++++++++++++
>  2 files changed, 45 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index cacd32f..9b55095 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -87,17 +87,24 @@ struct qcom_edp {
>
>         struct clk_bulk_data clks[2];
>         struct regulator_bulk_data supplies[2];
> +       int enable_load[2];
> +       int disable_load[2];
>  };
>
>  static int qcom_edp_phy_init(struct phy *phy)
>  {
>         struct qcom_edp *edp = phy_get_drvdata(phy);
>         int ret;
> +       int num_consumers = ARRAY_SIZE(edp->supplies);
> +       int i;
>
> -       ret = regulator_bulk_enable(ARRAY_SIZE(edp->supplies), edp->supplies);
> +       ret = regulator_bulk_enable(num_consumers, edp->supplies);
>         if (ret)
>                 return ret;
>
> +       for (i = num_consumers - 1; i >= 0; --i)
> +               regulator_set_load(edp->supplies[i].consumer, edp->enable_load[i]);
> +
>         ret = clk_bulk_prepare_enable(ARRAY_SIZE(edp->clks), edp->clks);
>         if (ret)
>                 goto out_disable_supplies;
> @@ -425,9 +432,15 @@ static int qcom_edp_phy_power_off(struct phy *phy)
>  static int qcom_edp_phy_exit(struct phy *phy)
>  {
>         struct qcom_edp *edp = phy_get_drvdata(phy);
> +       int num_consumers = ARRAY_SIZE(edp->supplies);
> +       int i;
>
>         clk_bulk_disable_unprepare(ARRAY_SIZE(edp->clks), edp->clks);
> -       regulator_bulk_disable(ARRAY_SIZE(edp->supplies), edp->supplies);
> +
> +       for (i = num_consumers - 1; i >= 0; --i)
> +               regulator_set_load(edp->supplies[i].consumer, edp->disable_load[i]);
> +
> +       regulator_bulk_disable(num_consumers, edp->supplies);
>
>         return 0;
>  }
> @@ -633,8 +646,12 @@ static int qcom_edp_phy_probe(struct platform_device *pdev)
>         if (ret)
>                 return ret;
>
> -       edp->supplies[0].supply = "vdda-phy";
> -       edp->supplies[1].supply = "vdda-pll";
> +       edp->supplies[0].supply = "vdda-1p2";
> +       edp->supplies[1].supply = "vdda-0p9";
> +       edp->enable_load[0] = 21800;    /* 1.2 V */
> +       edp->enable_load[1] = 36000;    /* 1.2 V */
> +       edp->disable_load[0] = 4;       /* 0.9 V */
> +       edp->disable_load[1] = 4;       /* 10.9V */

10.9V? That's a lot!


>         ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(edp->supplies), edp->supplies);
>         if (ret)
>                 return ret;
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index b144ae1..c589231 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -3130,6 +3130,8 @@ struct qmp_phy_cfg {
>         int num_resets;
>         /* regulators to be requested */
>         const char * const *vreg_list;
> +       const unsigned int *vreg_enable_load;
> +       const unsigned int *vreg_disable_load;
>         int num_vregs;
>
>         /* array of registers with different offsets */
> @@ -3346,6 +3348,14 @@ static const char * const qmp_phy_vreg_l[] = {
>         "vdda-phy", "vdda-pll",
>  };
>
> +static const unsigned int qmp_phy_vreg_enable_load[] = {
> +       21800, 36000
> +};
> +
> +static const unsigned int qmp_phy_vreg_disable_load[] = {
> +       4, 32
> +};
> +
>  static const struct qmp_phy_cfg ipq8074_usb3phy_cfg = {
>         .type                   = PHY_TYPE_USB3,
>         .nlanes                 = 1,
> @@ -4072,6 +4082,8 @@ static const struct qmp_phy_cfg sm8250_usb3phy_cfg = {
>         .reset_list             = msm8996_usb3phy_reset_l,
>         .num_resets             = ARRAY_SIZE(msm8996_usb3phy_reset_l),
>         .vreg_list              = qmp_phy_vreg_l,
> +       .vreg_enable_load       = qmp_phy_vreg_enable_load,
> +       .vreg_disable_load      = qmp_phy_vreg_disable_load,
>         .num_vregs              = ARRAY_SIZE(qmp_phy_vreg_l),
>         .regs                   = qmp_v4_usb3phy_regs_layout,
>
> @@ -4139,6 +4151,8 @@ static const struct qmp_phy_cfg sm8250_dpphy_cfg = {
>         .reset_list             = msm8996_usb3phy_reset_l,
>         .num_resets             = ARRAY_SIZE(msm8996_usb3phy_reset_l),
>         .vreg_list              = qmp_phy_vreg_l,
> +       .vreg_enable_load       = qmp_phy_vreg_enable_load,
> +       .vreg_disable_load      = qmp_phy_vreg_disable_load,
>         .num_vregs              = ARRAY_SIZE(qmp_phy_vreg_l),
>         .regs                   = qmp_v4_usb3phy_regs_layout,
>
> @@ -5015,6 +5029,11 @@ static int qcom_qmp_phy_com_init(struct qmp_phy *qphy)
>                 goto err_reg_enable;
>         }
>
> +       if (cfg->vreg_enable_load) {
> +               for (i = cfg->num_vregs - 1; i >= 0; --i)
> +                       regulator_set_load(qmp->vregs[i].consumer, cfg->vreg_enable_load[i]);
> +       }
> +
>         for (i = 0; i < cfg->num_resets; i++) {
>                 ret = reset_control_assert(qmp->resets[i]);
>                 if (ret) {
> @@ -5116,6 +5135,11 @@ static int qcom_qmp_phy_com_exit(struct qmp_phy *qphy)
>
>         clk_bulk_disable_unprepare(cfg->num_clks, qmp->clks);
>
> +       if (cfg->vreg_disable_load[i]) {
> +               for (i = cfg->num_vregs - 1; i >= 0; --i)
> +                       regulator_set_load(qmp->vregs[i].consumer, cfg->vreg_disable_load[i]);
> +       }
> +
>         regulator_bulk_disable(cfg->num_vregs, qmp->vregs);

You don't haven't needed the regulator_set_load() on
regulator_bulk_disable() for many years now. See commit 5451781dadf8
("regulator: core: Only count load for enabled consumers")

...so the only place you should set the load is in qcom_edp_phy_init()

-Doug
