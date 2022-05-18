Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9EA552C637
	for <lists+freedreno@lfdr.de>; Thu, 19 May 2022 00:27:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C00E113F48;
	Wed, 18 May 2022 22:27:28 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EDD4113F43
 for <freedreno@lists.freedesktop.org>; Wed, 18 May 2022 22:27:26 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id x22so3263747qto.2
 for <freedreno@lists.freedesktop.org>; Wed, 18 May 2022 15:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4e2k0Xzs0N4K3ysaBNCtRHldaZWwVY5QUxC6Y2ywRTc=;
 b=eTFHghXuJ6ffqSdFZkHc9pwFYJ2ct5eV2UB05tO+YLjqqoFMP2y7b6UgbffHNiidTA
 NLa1Z8CVNeTzkORvqOCBxL1lzZnlxw+j6DZdUt82085zHshmD+LAIdtlirSveKGGJBq0
 kdxX78gtzhNMRqW2VfYcX1urWuJuP9q4VP9Ns7r2s5FWtZHBpP92VJXGfcW2jgFwik9S
 aJnvKgN6GwZcrC1hm/Wq6U3ZyL7zl3JJqmqSsE+vqCtpT8sxxp35sHd3amQARNxEH1Xd
 4zUgH1H7f48Q8jK9uzMJrTYtkMVOar/kzVhCDUaxfdlPjAFfmd5kH01I7DGx9u3vqEfq
 yTnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4e2k0Xzs0N4K3ysaBNCtRHldaZWwVY5QUxC6Y2ywRTc=;
 b=7bub4t889gJXqGGskeHXKUqrPG8uTVkMkvaNgTSrIHOdcmTOabRb7hfNIb/de242LE
 O672wihg0EvRecyNgLFpGKblIgpXguo1I/bcwRSV/JJkMgo/G7z4HI1a1T/W3EqkZ8pk
 SWDVP1pyI0GFDh72VIljySVupBuwKrJ+0O436M9qDPYka19sqsdrU9sSycFsestWtHbj
 7IIcJ63hyRHiNbvVVkOrhGSICGj5eX5QFdQ2I/5bvX1RBTRdEmB6rA/qZDbcbqi/WaFW
 S1hHutIEuPT44nX2rSkPsZM7IcabOO/4o4QNjvwjtVacRIqlUvdVF17f8YucGE0MeXjh
 9cwQ==
X-Gm-Message-State: AOAM53307/gKnrKiDOGY3vJQK47TMnkZCxqdr22Y7W10I/TCVVVFNYBR
 UjtH/lB5RZGmotjWCR1i0PLjxkyar2T5WKagF0CjXQ==
X-Google-Smtp-Source: ABdhPJyWforIMlP/Mylzyx44Pfglhahym13tW4MHFx0tewZ1ZB1zO3uJVZvqSDA4ETYcknhJQXeQpIR4c/HnjW+eEEU=
X-Received: by 2002:ac8:4e45:0:b0:2f9:fc2:ee3a with SMTP id
 e5-20020ac84e45000000b002f90fc2ee3amr561381qtw.370.1652912845789; Wed, 18 May
 2022 15:27:25 -0700 (PDT)
MIME-Version: 1.0
References: <1652909790-16245-1-git-send-email-quic_khsieh@quicinc.com>
 <1652909790-16245-3-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1652909790-16245-3-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 19 May 2022 01:27:14 +0300
Message-ID: <CAA8EJpoQ5B=iZo=u0Yi4Bgn7b3DHXkf7aKOEzvV3yvFwmRSFhg@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v4 2/3] phy/qualcomm: add regulator_set_load
 to dp phy
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
> DP phy driver.
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index b144ae1..20ac446 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -3130,6 +3130,7 @@ struct qmp_phy_cfg {
>         int num_resets;
>         /* regulators to be requested */
>         const char * const *vreg_list;
> +       const unsigned int *vreg_enable_load;
>         int num_vregs;
>
>         /* array of registers with different offsets */
> @@ -3346,6 +3347,10 @@ static const char * const qmp_phy_vreg_l[] = {
>         "vdda-phy", "vdda-pll",
>  };
>
> +static const unsigned int qmp_phy_vreg_enable_load[] = {
> +       21800, 36000
> +};
> +
>  static const struct qmp_phy_cfg ipq8074_usb3phy_cfg = {
>         .type                   = PHY_TYPE_USB3,
>         .nlanes                 = 1,
> @@ -4072,6 +4077,7 @@ static const struct qmp_phy_cfg sm8250_usb3phy_cfg = {
>         .reset_list             = msm8996_usb3phy_reset_l,
>         .num_resets             = ARRAY_SIZE(msm8996_usb3phy_reset_l),
>         .vreg_list              = qmp_phy_vreg_l,
> +       .vreg_enable_load       = qmp_phy_vreg_enable_load,
>         .num_vregs              = ARRAY_SIZE(qmp_phy_vreg_l),
>         .regs                   = qmp_v4_usb3phy_regs_layout,
>
> @@ -4139,6 +4145,7 @@ static const struct qmp_phy_cfg sm8250_dpphy_cfg = {
>         .reset_list             = msm8996_usb3phy_reset_l,
>         .num_resets             = ARRAY_SIZE(msm8996_usb3phy_reset_l),
>         .vreg_list              = qmp_phy_vreg_l,
> +       .vreg_enable_load       = qmp_phy_vreg_enable_load,
>         .num_vregs              = ARRAY_SIZE(qmp_phy_vreg_l),
>         .regs                   = qmp_v4_usb3phy_regs_layout,

I'd ask again: what about the sdm845? SC8180x? SC7180? Do we need to
change them too?
Currently they will all be handled by the DP driver.

>
> @@ -5008,6 +5015,11 @@ static int qcom_qmp_phy_com_init(struct qmp_phy *qphy)
>                 return 0;
>         }
>
> +       if (cfg->vreg_enable_load) {
> +               for (i = cfg->num_vregs - 1; i >= 0; --i)
> +                       regulator_set_load(qmp->vregs[i].consumer, cfg->vreg_enable_load[i]);
> +       }
> +
>         /* turn on regulator supplies */
>         ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
>         if (ret) {
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>


-- 
With best wishes
Dmitry
