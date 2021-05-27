Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA26392663
	for <lists+freedreno@lfdr.de>; Thu, 27 May 2021 06:29:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 824AF6EE2C;
	Thu, 27 May 2021 04:29:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4116B6EE2C
 for <freedreno@lists.freedesktop.org>; Thu, 27 May 2021 04:29:32 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 69-20020a9d0a4b0000b02902ed42f141e1so3236094otg.2
 for <freedreno@lists.freedesktop.org>; Wed, 26 May 2021 21:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=b6/faYhfGu8qBtbR9bUitKj7oId3L35j1rSLlZcppAc=;
 b=hqtLG7QpB0PQlZwg8WYtUpXzm2d/c3skqj2CuiBHVhNRi5kJrIGjiCGThIW9cWk625
 F+gG060MyizR0reJ0HKBczMaxAQiJCu56bAJbJ4Z3gyBrrh+XtlXRJwR4KnqTw/XKBfs
 XzwIZPTaXXUDQFHD08XZiVdQAoLGZXeLhvLZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=b6/faYhfGu8qBtbR9bUitKj7oId3L35j1rSLlZcppAc=;
 b=qPAQvrOcs047tt4mk6zLlg46xK8ernGteOUp6viIHoJ0NIfgGrrLp4k0xgekO9LLDS
 eiRyQBl4dCP42ESr53cB7QjT632ZloqDienzD2F7qCS40W/qmDvarG988CaRiYds15Bj
 n6G7uz7osDazMkuZzsoMzrnKn/sSXC31rh34J9ovp14zoiZN+9VlHRbsd3vf08TkIuW3
 a7e7YhaB/l2oOqHoJDK3+UYqOjB6lVe0IB9avdNkaafxb07HMDEY3vjED+CJMNycPmXv
 gqO4PL5PKPGPlBk52ysmA1RJ2KqQy33uHy/P2vD+3y3nE2bPIsajjqSi7LuzRv56I7R6
 mxXA==
X-Gm-Message-State: AOAM530Bns1OPcEcwlqpGf4BLnoHK1ipPJTDKmsOToMvg7nvw5cCEb0I
 AeS+qanAF/OhGrGz5T+NaFrcYE3/TmHr5IHai/rr9w==
X-Google-Smtp-Source: ABdhPJws6Lj2vooodJL5wMKOsFkykOzSDFlWUi5rcClITq/ysQEsXTKKyLiW6XmKahA5l1NgfJeVvV5+sShDboAl3j0=
X-Received: by 2002:a05:6830:1f51:: with SMTP id
 u17mr1338955oth.25.1622089771409; 
 Wed, 26 May 2021 21:29:31 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 May 2021 00:29:30 -0400
MIME-Version: 1.0
In-Reply-To: <1622072989-793-1-git-send-email-khsieh@codeaurora.org>
References: <1622072989-793-1-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 27 May 2021 00:29:30 -0400
Message-ID: <CAE-0n51tgnPnwTvtNe-w5MjEAOmgtko0aw6Hu744EwOE00tzPg@mail.gmail.com>
To: Kuogee Hsieh <khsieh@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: keep aux channel up when power
 of dp phy
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
Cc: linux-arm-msm@vger.kernel.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

General note, please Cc dri-devel on freedreno driver patches.

Quoting Kuogee Hsieh (2021-05-26 16:49:49)
> Aux channel is used to perform management function and should be
> running in parallel with main link. Therefore should only power
> down main link and keep aux channel running when power down phy.
>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Does this supersede the previous patch[1] or is it in addition to?

[1] https://lore.kernel.org/r/1622052503-21158-1-git-send-email-khsieh@codeaurora.org

>  drivers/gpu/drm/msm/dp/dp_ctrl.c    |  4 ----
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 11 +++++++++--
>  2 files changed, 9 insertions(+), 6 deletions(-)

Given that it touches two subsystems the merge path is questionable.

>
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 5115c05..5f93c64 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1844,10 +1844,6 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
>
>         phy_power_off(phy);
>
> -       /* aux channel down, reinit phy */
> -       phy_exit(phy);
> -       phy_init(phy);
> -
>         DRM_DEBUG_DP("DP off link/stream done\n");
>         return ret;
>  }
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index b122e63..567e32e 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -3214,12 +3214,19 @@ static int qcom_qmp_phy_power_off(struct phy *phy)
>  {
>         struct qmp_phy *qphy = phy_get_drvdata(phy);
>         const struct qmp_phy_cfg *cfg = qphy->cfg;
> +       u32 val;
>
>         clk_disable_unprepare(qphy->pipe_clk);
>
>         if (cfg->type == PHY_TYPE_DP) {
> -               /* Assert DP PHY power down */
> -               writel(DP_PHY_PD_CTL_PSR_PWRDN, qphy->pcs + QSERDES_V3_DP_PHY_PD_CTL);
> +               /*
> +                * Assert DP PHY LANE_0_1, LANE_2_3, PSR power down
> +                * keep aux channel up

Maybe say "keep aux channel up until phy_exit() is called" so we know
how long it is supposed to stay on. And just to confirm, it is on in
phy_init(), right?

> +                */
> +               val = DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
> +                       DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN |
> +                       DP_PHY_PD_CTL_PSR_PWRDN;
> +               writel(val, qphy->pcs + QSERDES_V3_DP_PHY_PD_CTL);
>         } else {
>                 /* PHY reset */
>                 if (!cfg->no_pcs_sw_reset)
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
