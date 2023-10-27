Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B35F7D8C96
	for <lists+freedreno@lfdr.de>; Fri, 27 Oct 2023 02:35:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5947210E8EF;
	Fri, 27 Oct 2023 00:35:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [IPv6:2607:f8b0:4864:20::c29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F41F10E8EF
 for <freedreno@lists.freedesktop.org>; Fri, 27 Oct 2023 00:35:55 +0000 (UTC)
Received: by mail-oo1-xc29.google.com with SMTP id
 006d021491bc7-581f78a0206so833552eaf.2
 for <freedreno@lists.freedesktop.org>; Thu, 26 Oct 2023 17:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698366954; x=1698971754; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=F80iHno91JCv1Uj52E9vutPeUGQGB84uBRbdzpgvxfY=;
 b=lOjC5MQicx1yNE11zXUrTcmonAwVmg053P+Q7Yv9xxJCbzSUnYNpUIhl6x1xVV/ihm
 eT6n0A+Hze5HEI5pRG5ce8WYNnnsPMdisMRZF8oaUVqF7RvvKizxWEcrOF3+o14Duhei
 uy2S/wwo3/G7nC0VT3aMISt2LS236xLZR+G6YN1tVaf5/nc5flKM6rgR2NR9TBVI6Iho
 hvzcQyDIIRkoQyCe61ki0kvakUQGkyDOpVxZrsEB8xYivqaXKdsMY8Aiz/8RDBqQE79N
 JikDfnQ+5J/NG4nV047S9i2qdjRmb1crcjQqti0dgqyVk5Dzo6tBwMRTQTMMGXAwPo/y
 uk9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698366954; x=1698971754;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F80iHno91JCv1Uj52E9vutPeUGQGB84uBRbdzpgvxfY=;
 b=vHfNvs7m/85HabwpRp7iYxVgTo7Fjpt5Hpr6SaQ6n0zWuujvnNNS7BSfK4UyvZdqnU
 nO7Yyq7UUp0RzTeeUN3znh29nYfSUtRg4fZhxcBWVkklL6vwu69+hX3DRID/8SXX+RBk
 p8tsn50tDaAI2X6sq3XfOpXpCYiknWZm6Fdp2FO7+3oD0cKbLlFCLWiZ0A9V0aFo9c4e
 xUherA4uOxLqyT1+209eib8CM7nCQCRG8R/3a+QPiby4cDsfo19EnwRyF8vsGQXyNYX3
 GZPKckvA+i+IyMP3tSnlSpGpXA4DcbD1tHt/n4+gx8tptUYgQQ6xycMZ4xbYrdjysat3
 4zPw==
X-Gm-Message-State: AOJu0Yx5D8r9SIWKQy3dZ/YWivSR2Mehy9dbS30+TcST6jof08SgclGG
 mfWFk04jRn+ULBy0tKIO9XQnOYE49xWtcWOLyH4tTA==
X-Google-Smtp-Source: AGHT+IEcUzbPOkOWvjp/fe5w7R1pKSB7pe+4Z7WOc6Z7tCpLWBp758kcYR8l2Wn8zbZmVR88yiUuEXQOI6d+Oe8PUJs=
X-Received: by 2002:aca:1907:0:b0:3b2:df83:3aec with SMTP id
 l7-20020aca1907000000b003b2df833aecmr950492oii.54.1698366954184; Thu, 26 Oct
 2023 17:35:54 -0700 (PDT)
MIME-Version: 1.0
References: <20231004003125.2289613-1-dmitry.baryshkov@linaro.org>
 <20231004003125.2289613-2-dmitry.baryshkov@linaro.org>
 <20231026225622.GT3553829@hu-bjorande-lv.qualcomm.com>
In-Reply-To: <20231026225622.GT3553829@hu-bjorande-lv.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 27 Oct 2023 03:35:42 +0300
Message-ID: <CAA8EJpr3VZiyCHCDPh6uhYKOPruLGF=WbOHdGYNZWiZBxU9UMA@mail.gmail.com>
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [RFC PATCH 1/2] clk: qcom: implement RCG2 'parked'
 clock support
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org,
 Taniya Das <quic_tdas@quicinc.com>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Andy Gross <agross@kernel.org>,
 freedreno@lists.freedesktop.org, Michael Turquette <mturquette@baylibre.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 27 Oct 2023 at 01:56, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
>
> On Wed, Oct 04, 2023 at 03:31:24AM +0300, Dmitry Baryshkov wrote:
> > clk_rcg2_shared_ops implements support for the case of the RCG which
> > must not be completely turned off. However its design has one major
> > drawback: it doesn't allow us to properly implement the is_enabled
> > callback, which causes different kinds of misbehaviour from the CCF.
>
> I have some behaviors in mind when reading this, others might not.
> Please give some specific behavior(s) here.

Bjorn (and other interested parties). At this RFC stage it would be
really nice to check whether the patch idea is worth the trouble and
if it fixes the issue.

>
> Thanks,
> Bjorn
>
> >
> > Follow the idea behind clk_regmap_phy_mux_ops and implement the new
> > clk_rcg2_parked_ops. It also targets the clocks which must not be fully
> > switched off (and shared most of the implementation with
> > clk_rcg2_shared_ops). The major difference is that it requires that the
> > parent map doesn't conain the safe (parked) clock source. Instead if the
> > CFG_REG register points to the safe source, the clock is considered to
> > be disabled.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/clk/qcom/clk-rcg.h  |  1 +
> >  drivers/clk/qcom/clk-rcg2.c | 34 ++++++++++++++++++++++++++++++++++
> >  2 files changed, 35 insertions(+)
> >
> > diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
> > index e6d84c8c7989..9fbbf1251564 100644
> > --- a/drivers/clk/qcom/clk-rcg.h
> > +++ b/drivers/clk/qcom/clk-rcg.h
> > @@ -176,6 +176,7 @@ extern const struct clk_ops clk_byte2_ops;
> >  extern const struct clk_ops clk_pixel_ops;
> >  extern const struct clk_ops clk_gfx3d_ops;
> >  extern const struct clk_ops clk_rcg2_shared_ops;
> > +extern const struct clk_ops clk_rcg2_parked_ops;
> >  extern const struct clk_ops clk_dp_ops;
> >
> >  struct clk_rcg_dfs_data {
> > diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
> > index 5183c74b074f..3f52abf0025e 100644
> > --- a/drivers/clk/qcom/clk-rcg2.c
> > +++ b/drivers/clk/qcom/clk-rcg2.c
> > @@ -5,6 +5,7 @@
> >
> >  #include <linux/kernel.h>
> >  #include <linux/bitops.h>
> > +#include <linux/bitfield.h>
> >  #include <linux/err.h>
> >  #include <linux/bug.h>
> >  #include <linux/export.h>
> > @@ -1150,6 +1151,39 @@ const struct clk_ops clk_rcg2_shared_ops = {
> >  };
> >  EXPORT_SYMBOL_GPL(clk_rcg2_shared_ops);
> >
> > +static int clk_rcg2_park_is_enabled(struct clk_hw *hw)
> > +{
> > +     struct clk_rcg2 *rcg = to_clk_rcg2(hw);
> > +     u32 cfg;
> > +     int ret;
> > +
> > +     if (!clk_rcg2_is_enabled(hw))
> > +             return false;
> > +
> > +     ret = regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + CFG_REG, &cfg);
> > +     if (ret)
> > +             return ret;
> > +
> > +     return FIELD_GET(CFG_SRC_SEL_MASK, cfg) != rcg->safe_src_index;
> > +}
> > +
> > +/*
> > + * Unlike clk_rcg2_shared_ops, the safe_src_index aka XO must NOT be present in
> > + * parent_map. This allows us to implement proper is_enabled callback.
> > + */
> > +const struct clk_ops clk_rcg2_parked_ops = {
> > +     .is_enabled = clk_rcg2_park_is_enabled,
> > +     .enable = clk_rcg2_shared_enable,
> > +     .disable = clk_rcg2_shared_disable,
> > +     .get_parent = clk_rcg2_shared_get_parent,
> > +     .set_parent = clk_rcg2_shared_set_parent,
> > +     .recalc_rate = clk_rcg2_shared_recalc_rate,
> > +     .determine_rate = clk_rcg2_determine_rate,
> > +     .set_rate = clk_rcg2_shared_set_rate,
> > +     .set_rate_and_parent = clk_rcg2_shared_set_rate_and_parent,
> > +};
> > +EXPORT_SYMBOL_GPL(clk_rcg2_parked_ops);
> > +
> >  /* Common APIs to be used for DFS based RCGR */
> >  static void clk_rcg2_dfs_populate_freq(struct clk_hw *hw, unsigned int l,
> >                                      struct freq_tbl *f)
> > --
> > 2.39.2
> >



-- 
With best wishes
Dmitry
