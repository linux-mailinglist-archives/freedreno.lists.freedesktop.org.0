Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B6E52C64D
	for <lists+freedreno@lfdr.de>; Thu, 19 May 2022 00:32:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD2F7113F71;
	Wed, 18 May 2022 22:32:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50D47113F73
 for <freedreno@lists.freedesktop.org>; Wed, 18 May 2022 22:32:39 +0000 (UTC)
Received: by mail-qv1-xf2c.google.com with SMTP id s5so3019579qvo.12
 for <freedreno@lists.freedesktop.org>; Wed, 18 May 2022 15:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q4ZykJLS2PHvtKcHOB6T4RNNj1KqRzGThJTU8frssAg=;
 b=y1xoNtqUkZZAr/rx0wToIyFvFumWFv4hC/2Toris70/ANsYesC6y5Un53kA4rjuISh
 uPCNj9R+mjtkGESDd5osMtnSbDFs/Ji9ktcH+Py+8Mat7HhLymtR8+DFRRBdQR1Exe8Z
 9JIgo395RqD/sTZ6npkHLtRKYLGstXvLpRr/YfY9dP3XYff/vDqjppopc5KNDpU7ybwB
 BxZ7R/elaHFqk3ZCun2cg6p+dOb64JH7F4zlQeG925hruDKeZ70nbCsMGxPMZMxI+iyn
 3H/6yFhfPhaKG3M1HXVxDAkMbBfVkWCwvvHJN9tQBKlVl8adUE8Ag0JqUPlCNDtsGSBq
 3hrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q4ZykJLS2PHvtKcHOB6T4RNNj1KqRzGThJTU8frssAg=;
 b=2RyOO2lU63kHd8y+K6I0HkIhso5BBmMlQ+N3BsZIvkMtpiNFPNwrvZ9K3fLL8t80T6
 8ZPxFY6RTk6OK6RucQLkeddH0Z8qBPV411iPYzA+EtWaE98F53HQiSFbJMBkQOOi6tlz
 9X4DnZ9OzgfNrIjFpoEoQOdjVB7djaMg7THh4Z2IrXMOsn0UjIhI5NN+bMxJaskfla6e
 ipOvH/ReR23RTHoJNcsTPwvRGVsvvgw+F7/QDyVw9Vo4bLnRVujU+EtRIz+X51+WRb0b
 aBOlBnDG+BYCNTZxyTg59YgcbXfuedmsjW8zzZNw9+VDwqNAPxDOS+IxnHgtY4KAu9Cg
 qwJA==
X-Gm-Message-State: AOAM532DBszSwBNn52aIDRxf5b+Cjkh9mDh20p7Y4ZJRXEXgyoC4yKeU
 v+Y4+DSKjJSbXcmxAHXid1RsTjSUhSTl4I2ljNqDMw==
X-Google-Smtp-Source: ABdhPJx1L9bXYzm3gf4KAjO6FwK/XzF+nPQZRGAYiWD7kLLPsTwrs+dtkkv0ie3lfq/pVh+bG8MF726tSsT1JUFLVYM=
X-Received: by 2002:a0c:ac02:0:b0:45a:91a4:c11b with SMTP id
 l2-20020a0cac02000000b0045a91a4c11bmr1681179qvb.119.1652913158352; Wed, 18
 May 2022 15:32:38 -0700 (PDT)
MIME-Version: 1.0
References: <1652909790-16245-1-git-send-email-quic_khsieh@quicinc.com>
 <1652909790-16245-2-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1652909790-16245-2-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 19 May 2022 01:32:27 +0300
Message-ID: <CAA8EJprLY1M2hxEzkQPv7mwcfZ54kOXEkkBK8LiRvZYTSPR8kA@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v4 1/3] phy/qualcomm: add regulator_set_load
 to edp phy
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
Cc: quic_sbillaka@quicinc.com, quic_abhinavk@quicinc.com, airlied@linux.ie,
 freedreno@lists.freedesktop.org, robdclark@gmail.com,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, bjorn.andersson@linaro.org, daniel@ffwll.ch,
 linux-arm-msm@vger.kernel.org, quic_aravindh@quicinc.com, swboyd@chromium.org,
 sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 19 May 2022 at 00:36, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> This patch add regulator_set_load() before enable regulator at
> eDP phy driver.
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index cacd32f..fbe0be0 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -87,14 +87,20 @@ struct qcom_edp {
>
>         struct clk_bulk_data clks[2];
>         struct regulator_bulk_data supplies[2];
> +       int enable_load[2];
>  };
>
>  static int qcom_edp_phy_init(struct phy *phy)
>  {
>         struct qcom_edp *edp = phy_get_drvdata(phy);
>         int ret;
> +       int num_consumers = ARRAY_SIZE(edp->supplies);

No need to. ARRAY_SIZE is compile-time calculated.

> +       int i;
>
> -       ret = regulator_bulk_enable(ARRAY_SIZE(edp->supplies), edp->supplies);
> +       for (i = num_consumers - 1; i >= 0; --i)
> +               regulator_set_load(edp->supplies[i].consumer, edp->enable_load[i]);

Please. Change this to the ascending order or provide a good
description why it's done the other way. Your pointer to
regulator_bulk_enable() is not valid, as it processes arrays in the
ascending order.

> +
> +       ret = regulator_bulk_enable(num_consumers, edp->supplies);
>         if (ret)
>                 return ret;
>
> @@ -635,6 +641,8 @@ static int qcom_edp_phy_probe(struct platform_device *pdev)
>
>         edp->supplies[0].supply = "vdda-phy";
>         edp->supplies[1].supply = "vdda-pll";
> +       edp->enable_load[0] = 21800;    /* load for 1.2 V vdda-phy supply */
> +       edp->enable_load[1] = 36000;    /* load for 1.2 V vdda-pll supply */

Isn't vdda-pll 0.9V? On sm8250 I see VDD_A_USB0_SS_DP_1P2 and
VDD_A_USB0_SS_DP_CORE (which is 0.9V).

>         ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(edp->supplies), edp->supplies);
>         if (ret)
>                 return ret;
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>


-- 
With best wishes
Dmitry
