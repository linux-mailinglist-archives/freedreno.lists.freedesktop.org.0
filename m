Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2694F51787B
	for <lists+freedreno@lfdr.de>; Mon,  2 May 2022 22:47:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBBBF10EED5;
	Mon,  2 May 2022 20:47:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EEF810EB79
 for <freedreno@lists.freedesktop.org>; Mon,  2 May 2022 20:47:53 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id 12so16346466oix.12
 for <freedreno@lists.freedesktop.org>; Mon, 02 May 2022 13:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=TBXtHVCDgkha/h8EfsB/475w9tiwkpoYNEwBRkAE28Q=;
 b=nlwo0h4uJ3b9sJudkA4OAqMVOoDVvYkR7QwkYtkpoxqAfflehecyGBcje5DXj3uDvn
 l5czy/KAeS6W1newa/ZkeMvseIB6+8VOK2MFZbySZyoia8d4VI5D18CIKZLV5edA0lIp
 vyP1NUNeTVfaqy4I6z8iUxqG9yEe0tX3ECR88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=TBXtHVCDgkha/h8EfsB/475w9tiwkpoYNEwBRkAE28Q=;
 b=a3H6TC7ckKpkyio3d7bVYQjG2JM3wTJ7+a39kP2J6/t1Cy2hCSFTDuiw0OFaf38/bB
 lSDEy9F2D43V9cMWK+tFw257AAvvyAHPufhAI0mbv024P9obgueGaoSxzSFCQ72c3dYx
 bke9M8m6LzGjdWQKLCxVAxu151DcI5Lf8Bey8nO1n4G0VzzgBDK4JbshwODugehJqTnO
 ZhD6LaH5OlBumqPKs5XsjfOcyDmHceT5pQ8ps4lRDhpcd0W0LUJwnDVDekeOW7q2eTt0
 NtcLNbERbycWHNogIsoW6lhNWf2123IY8Ec5BO6pScKQvFncYRJ9QWnZxkea/KG4Kou6
 l/Yw==
X-Gm-Message-State: AOAM530v/mEbeoqwuask1FZphjs/atLW30e7QbSC0q0pPOw4u6oGwTey
 2C6Is5GDbTkgvnF4bf1uMzbeKam+h5KFb5EimFOnbQ==
X-Google-Smtp-Source: ABdhPJwJZV4OIei+weQ172CpfVAhfT8STbQ4S9q4PIxCXEbnTrZydvgCzRN89/H2aDd28y5efxt2iRIr5LHChV0JNLc=
X-Received: by 2002:aca:bd41:0:b0:2ec:ff42:814f with SMTP id
 n62-20020acabd41000000b002ecff42814fmr469774oif.63.1651524472308; Mon, 02 May
 2022 13:47:52 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 2 May 2022 13:47:51 -0700
MIME-Version: 1.0
In-Reply-To: <20220501195620.4135080-1-dmitry.baryshkov@linaro.org>
References: <20220501195620.4135080-1-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 2 May 2022 13:47:51 -0700
Message-ID: <CAE-0n51uV-BpuPSrTFiN2wvzh3+==WMU85j8kdi-td0X4xs8kg@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/dsi: pll_7nm: remove unsupported
 dividers for DSI pixel clock
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-05-01 12:56:20)
> Remove dividers that are not recommended for DSI DPHY mode when setting

Is "DPHY" intentional or just "PHY" should be here?

> up the clock tree for the DSI pixel clock.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index 6e506feb111f..66ed1919a1db 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -687,15 +687,13 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
>                 snprintf(clk_name, 32, "dsi%d_pclk_mux", pll_7nm->phy->id);
>                 snprintf(parent, 32, "dsi%d_pll_bit_clk", pll_7nm->phy->id);
>                 snprintf(parent2, 32, "dsi%d_pll_by_2_bit_clk", pll_7nm->phy->id);
> -               snprintf(parent3, 32, "dsi%d_pll_out_div_clk", pll_7nm->phy->id);
> -               snprintf(parent4, 32, "dsi%d_pll_post_out_div_clk", pll_7nm->phy->id);
>
>                 hw = devm_clk_hw_register_mux(dev, clk_name,
>                                         ((const char *[]){
> -                                       parent, parent2, parent3, parent4
> -                                       }), 4, 0, pll_7nm->phy->base +
> +                                       parent, parent2,
> +                                       }), 2, 0, pll_7nm->phy->base +
>                                         REG_DSI_7nm_PHY_CMN_CLK_CFG1,
> -                                       0, 2, 0, NULL);
> +                                       0, 1, 0, NULL);

Can you followup with a patch to move to clk_parent_data instead of
strings?
