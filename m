Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6F3531ED1
	for <lists+freedreno@lfdr.de>; Tue, 24 May 2022 00:50:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4C3C10F2DF;
	Mon, 23 May 2022 22:50:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 148D210F2CF
 for <freedreno@lists.freedesktop.org>; Mon, 23 May 2022 22:50:19 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id r84so2482417qke.10
 for <freedreno@lists.freedesktop.org>; Mon, 23 May 2022 15:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RupDdku696YI2aJ6LFtSWAU5mlc/9wa0HAPdVsaaX/g=;
 b=R74stxJhmvV8DOQAtRBN0/hGyLdW6u51nBr0b0EvrakKeyBawMzZGF95fa6y18lmTh
 SKeUFQl0ZVdMxd+mPnH0+IOovnvAM3oXBlz8XbzBjiQ8DGTqYfguS+rNgCLQG757PsqM
 3V+iv7wk6dRbJTm9w1guUxDiXAYsNiyP+OXyR5UApn35Q7fnRQpqNts40p4cVyyRm0Vq
 WdzU4P/iL3F0TcsmWvm2UvYDTuA8Xqzam5VgvuBOpwO5fFqER3xAGsu9Zb4eASs3TUTr
 2BGNOejDyBEl3knkhGfD07/RHO2bv3sXPvNEEzT87txTupfaYaEhdA1rMNh5/Im2xyIF
 EaKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RupDdku696YI2aJ6LFtSWAU5mlc/9wa0HAPdVsaaX/g=;
 b=N2FRyMrovh+d2IRQ5zsCv+Ufvv5Y7SFSvVBQ5SGIgRORcqjegQp5FJv52HPcZO431m
 rmKovX+0AJDtyHpKVp8byZYgPOY0g3zrbu/HRCk4zant5q3BWJgPuZpKxFeAy7beRsMn
 mztkJC46aOgHJjOLL9Ljd3ARozq8rVhprLaOhvwhpBDTPMGh5q68HBsaja41SjDKGgrI
 T44Gi1NDCkj0y/lVYKHdciguRNDkOOlpMYQ6Papw2pJUIbalXyy9S0i+pSH0dZ58djSa
 TEGPmfxtsYxvIkgZoid6K3M5ng+FZSY9VYWjw4QiInmmMN8iphsO32YoFWjL8Vg6SfLm
 khHw==
X-Gm-Message-State: AOAM530WfxhyzODot3etZNinO9Gwklbs0jwKEhxqA5vXKdOH+WRThD9b
 VB4NH5G2AioE6fJNPc+Gp56l0iiwSVacb5eKNOJaBQ==
X-Google-Smtp-Source: ABdhPJzZdapOYYj/QSmAr5fRdCMSDzn5R35SYPpAvq0ZsnvOd7pRBzd1D2aYKF1/xQ4y3KqMOChYjVUwSAl6uMA8JBA=
X-Received: by 2002:a05:620a:2a11:b0:6a0:4ae4:fee6 with SMTP id
 o17-20020a05620a2a1100b006a04ae4fee6mr15742412qkp.30.1653346218984; Mon, 23
 May 2022 15:50:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220523213837.1016542-1-marijn.suijten@somainline.org>
 <20220523213837.1016542-8-marijn.suijten@somainline.org>
In-Reply-To: <20220523213837.1016542-8-marijn.suijten@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 May 2022 01:50:08 +0300
Message-ID: <CAA8EJpr5iY8=VX8ixY7BOrzkqhvg=bJcP+WCHW03d7rmYo+_VQ@mail.gmail.com>
To: Marijn Suijten <marijn.suijten@somainline.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 7/9] drm/msm/dsi_phy_14nm: Replace parent
 names with clk_hw pointers
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
Cc: David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, dri-devel@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 phone-devel@vger.kernel.org, linux-clk@vger.kernel.org,
 Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Rajeev Nandan <quic_rajeevny@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Stephen Boyd <sboyd@kernel.org>, Vladimir Lypak <vladimir.lypak@gmail.com>,
 linux-kernel@vger.kernel.org, Jami Kettunen <jami.kettunen@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 24 May 2022 at 00:38, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> parent_hw pointers are easier to manage and cheaper to use than
> repeatedly formatting the parent name and subsequently leaving the clk
> framework to perform lookups based on that name.
>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Nit: my rant regarding syntax changes applies here too.

> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 36 ++++++++++------------
>  1 file changed, 17 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> index 8199c53567f4..574f95ab2f22 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> @@ -764,14 +764,14 @@ static int dsi_14nm_set_usecase(struct msm_dsi_phy *phy)
>
>  static struct clk_hw *pll_14nm_postdiv_register(struct dsi_pll_14nm *pll_14nm,
>                                                 const char *name,
> -                                               const char *parent_name,
> +                                               const struct clk_hw *parent_hw,
>                                                 unsigned long flags,
>                                                 u8 shift)
>  {
>         struct dsi_pll_14nm_postdiv *pll_postdiv;
>         struct device *dev = &pll_14nm->phy->pdev->dev;
>         struct clk_init_data postdiv_init = {
> -               .parent_names = (const char *[]) { parent_name },
> +               .parent_hws = (const struct clk_hw *[]) { parent_hw },
>                 .num_parents = 1,
>                 .name = name,
>                 .flags = flags,
> @@ -800,7 +800,7 @@ static struct clk_hw *pll_14nm_postdiv_register(struct dsi_pll_14nm *pll_14nm,
>
>  static int pll_14nm_register(struct dsi_pll_14nm *pll_14nm, struct clk_hw **provided_clocks)
>  {
> -       char clk_name[32], parent[32], vco_name[32];
> +       char clk_name[32], vco_name[32];
>         struct clk_init_data vco_init = {
>                 .parent_data = &(const struct clk_parent_data) {
>                         .fw_name = "ref",
> @@ -811,7 +811,7 @@ static int pll_14nm_register(struct dsi_pll_14nm *pll_14nm, struct clk_hw **prov
>                 .ops = &clk_ops_dsi_pll_14nm_vco,
>         };
>         struct device *dev = &pll_14nm->phy->pdev->dev;
> -       struct clk_hw *hw;
> +       struct clk_hw *hw, *n1_postdiv, *n1_postdivby2;
>         int ret;
>
>         DBG("DSI%d", pll_14nm->phy->id);
> @@ -824,48 +824,46 @@ static int pll_14nm_register(struct dsi_pll_14nm *pll_14nm, struct clk_hw **prov
>                 return ret;
>
>         snprintf(clk_name, 32, "dsi%dn1_postdiv_clk", pll_14nm->phy->id);
> -       snprintf(parent, 32, "dsi%dvco_clk", pll_14nm->phy->id);
>
>         /* N1 postdiv, bits 0-3 in REG_DSI_14nm_PHY_CMN_CLK_CFG0 */
> -       hw = pll_14nm_postdiv_register(pll_14nm, clk_name, parent,
> -                                      CLK_SET_RATE_PARENT, 0);
> -       if (IS_ERR(hw))
> -               return PTR_ERR(hw);
> +       n1_postdiv = pll_14nm_postdiv_register(pll_14nm, clk_name,
> +                       &pll_14nm->clk_hw, CLK_SET_RATE_PARENT, 0);
> +       if (IS_ERR(n1_postdiv))
> +               return PTR_ERR(n1_postdiv);
>
>         snprintf(clk_name, 32, "dsi%dpllbyte", pll_14nm->phy->id);
> -       snprintf(parent, 32, "dsi%dn1_postdiv_clk", pll_14nm->phy->id);
>
>         /* DSI Byte clock = VCO_CLK / N1 / 8 */
> -       hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent,
> -                                         CLK_SET_RATE_PARENT, 1, 8);
> +       hw = devm_clk_hw_register_fixed_factor_parent_hw(dev, clk_name,
> +                       n1_postdiv, CLK_SET_RATE_PARENT, 1, 8);
>         if (IS_ERR(hw))
>                 return PTR_ERR(hw);
>
>         provided_clocks[DSI_BYTE_PLL_CLK] = hw;
>
>         snprintf(clk_name, 32, "dsi%dn1_postdivby2_clk", pll_14nm->phy->id);
> -       snprintf(parent, 32, "dsi%dn1_postdiv_clk", pll_14nm->phy->id);
>
>         /*
>          * Skip the mux for now, force DSICLK_SEL to 1, Add a /2 divider
>          * on the way. Don't let it set parent.
>          */
> -       hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent, 0, 1, 2);
> -       if (IS_ERR(hw))
> -               return PTR_ERR(hw);
> +       n1_postdivby2 = devm_clk_hw_register_fixed_factor_parent_hw(dev,
> +                       clk_name, n1_postdiv, 0, 1, 2);
> +       if (IS_ERR(n1_postdivby2))
> +               return PTR_ERR(n1_postdivby2);
>
>         snprintf(clk_name, 32, "dsi%dpll", pll_14nm->phy->id);
> -       snprintf(parent, 32, "dsi%dn1_postdivby2_clk", pll_14nm->phy->id);
>
>         /* DSI pixel clock = VCO_CLK / N1 / 2 / N2
>          * This is the output of N2 post-divider, bits 4-7 in
>          * REG_DSI_14nm_PHY_CMN_CLK_CFG0. Don't let it set parent.
>          */
> -       hw = pll_14nm_postdiv_register(pll_14nm, clk_name, parent, 0, 4);
> +       hw = pll_14nm_postdiv_register(pll_14nm, clk_name, n1_postdivby2,
> +                       0, 4);
>         if (IS_ERR(hw))
>                 return PTR_ERR(hw);
>
> -       provided_clocks[DSI_PIXEL_PLL_CLK]      = hw;
> +       provided_clocks[DSI_PIXEL_PLL_CLK] = hw;
>
>         return 0;
>  }
> --
> 2.36.1
>


-- 
With best wishes
Dmitry
