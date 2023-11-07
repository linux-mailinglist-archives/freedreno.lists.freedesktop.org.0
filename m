Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4997E32BB
	for <lists+freedreno@lfdr.de>; Tue,  7 Nov 2023 03:00:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44CD610E49F;
	Tue,  7 Nov 2023 02:00:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D51710E49F
 for <freedreno@lists.freedesktop.org>; Tue,  7 Nov 2023 02:00:17 +0000 (UTC)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-5a7c95b8d14so56054287b3.3
 for <freedreno@lists.freedesktop.org>; Mon, 06 Nov 2023 18:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699322416; x=1699927216; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=srgMrDERDuArNaxuZd4HI4TnsAEBPNaQibROPDY10RI=;
 b=RCB3TTRNnLoKLOBrD7CJukk4VjkCaO+0cO2+n+Kr7JVs+YFt8mzJfXsOZTpkOH8gPR
 5S2ZJk8YXBHfp4j698FXQ+DH+2syWakphl3TSf6TGTTNzdfP/pDoopMWTj2F/WWmFpS4
 T4/tlrz+8sd2O05IQ2e3Ulh1KYENEakdTI/mmWGC0IcUxOpxT9C4c3AZV1DmLBLXE5x1
 eLghMKveg9Lknk3/7E47xyQFVaxhbSiRepRHAI0b96m4SYWVdDEd3cx7zQlOMjQvN2ru
 TsfZHph/yyMgfJm6j0YfBcb7+KIZe5pzzDqzTImd9HnLyi8KTLIE8m1BTXpIDOM+DMSe
 Wj6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699322416; x=1699927216;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=srgMrDERDuArNaxuZd4HI4TnsAEBPNaQibROPDY10RI=;
 b=wRZGtjsYF+1ktwNYm9JtFFKF3nT8qq2hvO1UUFPQKsZW7083PmFdag9N98Eb16v2yz
 AEo+f0fTizRiiBpBo7CdUWXbiuVJ6iRjbaNYwO17py27sHDJHbEfjY/AEDrN8FJxj/Qv
 6hUneHexZAGWJKAm7WnnwEOMrrwyJk8/nB9kutLRgH9Sjmr3f3edEcHVehABgOm+j/92
 Rb1JArupnOyVXVY0a3co+teI7aUxmNQSXmGG0D4JTPTNgIUDyehnDVWCjIW5adqsI7Y9
 o1MJUo3+xSM1Kki/6819HILS1tGEC3djrbxgg1DhDC8yoPnoI/4hAuLqpemiAzM4BFrF
 QGig==
X-Gm-Message-State: AOJu0YzU11ARGUXdkCG9gqfhoHPN+btVjwSnKUQVM6CwInuHLcQIsVIA
 HPKBld72vykC1flJsPRVbPs7JG7Ue5ncf+9Svei1Pw==
X-Google-Smtp-Source: AGHT+IGAbwSZWyye4E84dHHgparQ8O40wfiIiUoHGpNlnz9M5tSIRTKwGliiUOzCtSfXVSHBz472Uh2ULr30uqHoDxs=
X-Received: by 2002:a0d:d8d1:0:b0:5af:7330:9f1e with SMTP id
 a200-20020a0dd8d1000000b005af73309f1emr9610473ywe.28.1699322415998; Mon, 06
 Nov 2023 18:00:15 -0800 (PST)
MIME-Version: 1.0
References: <20231004012308.2305273-1-dmitry.baryshkov@linaro.org>
 <20231004012308.2305273-3-dmitry.baryshkov@linaro.org>
 <2346f541be5b8528ad1a16df256a2f50.sboyd@kernel.org>
 <1290a5a0f7f584fcce722eeb2a1fd898.sboyd@kernel.org>
In-Reply-To: <1290a5a0f7f584fcce722eeb2a1fd898.sboyd@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 7 Nov 2023 04:00:04 +0200
Message-ID: <CAA8EJpq_pvtCxuPKrHmUOgsDFmDeG8cuUcynvvk-0SJNY3HJnA@mail.gmail.com>
To: Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [RFC PATCH v2 2/3] clk: qcom: implement RCG2
 'parked' clock support
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-clk@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Andy Gross <agross@kernel.org>, freedreno@lists.freedesktop.org,
 Michael Turquette <mturquette@baylibre.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 7 Nov 2023 at 03:36, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Stephen Boyd (2023-11-03 18:24:47)
> > Quoting Dmitry Baryshkov (2023-10-03 18:23:07)
> > > +
> > > +       ret = regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + CFG_REG, &cfg);
> > > +       if (ret)
> > > +               return ret;
> > > +
> > > +       return FIELD_GET(CFG_SRC_SEL_MASK, cfg) != rcg->safe_src_index;
> > > +}
> > > +
> > > +static int clk_rcg2_parked_init(struct clk_hw *hw)
> > > +{
> > > +       struct clk_rcg2 *rcg = to_clk_rcg2(hw);
> > > +       const struct freq_tbl *f = rcg->freq_tbl;
> > > +
> > > +       regmap_read(rcg->clkr.regmap, RCG_CFG_OFFSET(rcg), &rcg->parked_cfg);
> >
> > I need this part today to fix a stuck clk problem I see on trogdor.lazor
> > where during registration a call to clk_ops::get_parent() sees the clk
> > isn't enabled at boot (because there isn't a clk_ops::is_enabled()
> > function) so clk_rcg2_shared_get_parent() reads the parent from the
> > 'parked_cfg' value, which is zero. If the hardware actually has non-zero
> > for the parent then the framework will get the wrong parent, which is
> > what happens on trogdor when the devmode screen is shown. The parent is
> > the display PLL instead of XO. I haven't dug far enough to understand
> > why disabling unused clks wedges the branch when we try to enable it
> > again, but not disabling unused clks fixes the problem or reading the
> > config register at registration to get the proper parent also fixes it.
> > I guess the problem is that we're switching the RCG value when we
> > shouldn't be doing that.
> >
>
> I looked at this more today. It seems that I need to both read the
> config register at init and also move over the rcg to the safe source at
> init (i.e. park the clk at init). That's doable with a call to
> clk_rcg2_shared_disable() for the clk_ops::init callback. Otherwise I
> get a stuck clk warning.
>
> Either
>
>  disp_cc_mdss_mdp_clk status stuck at 'off'
>
> or
>
>  disp_cc_mdss_rot_clk status stuck at 'on'
>
> When I don't park the rcg, the disp_cc_mdss_rot_clk gets stuck during
> disabling of unused clks. I think I understand that problem. What
> happens is disp_cc_mdss_mdp_clk_src and disp_cc_mdss_rot_clk_src are
> both sourcing from disp_cc_pll0 at boot. Fixing the parent mapping makes
> it so that enabling and then disabling disp_cc_mdss_ahb_clk causes
> disp_cc_pll0 to be turned off when disp_cc_mdss_rot_clk_src is sourced
> from it (and the branch disp_cc_mdss_rot_clk is enabled). If we park
> both the rcgs at clk registration time we avoid this problem because the
> PLL is disabled but nothing is actually a child clk. The act of reading
> the config register and stashing that in the 'parked_cfg' only helps
> avoid duplicate calls to change the rate, and doesn't help when we try
> to repoint the clk at XO when the parent PLL is off.
>
> The part I still don't understand is why reading the config register at
> init and stashing that in 'parked_cfg' fixes the disp_cc_mdss_mdp_clk
> stuck at off problem. I see that the branch clk is turned off and on
> many times during boot and there aren't any warnings regardless of
> stashing the config register. That means we should be moving the RCG to
> XO source, between forcibly enabling and disabling the RCG, which
> presumably would complain about being unable to update the config
> register, but it doesn't. Only after late init does the clk fail to
> enable, and the source is still XO at that time. Something else must be
> happening that wedges the branch to the point that it can't be
> recovered. But simply reporting the proper parent is enough for
> disp_cc_mdss_mdp_clk.

I suppose that the issue is caused by mdss_gdsc or mmcx also being
shut down at the late_init. And if I remember correctly, properly
parking disp_cc_mdss_mdp_clk to the XO solves this issue. This is
where is_enabled comes to play. Adding it changes the
clk_disable_unused behaviour.

-- 
With best wishes
Dmitry
