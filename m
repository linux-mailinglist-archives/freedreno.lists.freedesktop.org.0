Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F04A2745B
	for <lists+freedreno@lfdr.de>; Tue,  4 Feb 2025 15:29:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27A6C10E65F;
	Tue,  4 Feb 2025 14:29:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="tY0njjAk";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FDC010E65F
 for <freedreno@lists.freedesktop.org>; Tue,  4 Feb 2025 14:29:05 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-5439e331cceso765208e87.1
 for <freedreno@lists.freedesktop.org>; Tue, 04 Feb 2025 06:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738679343; x=1739284143; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=focBQCwxswdAVZ8Abbt2a80oqi/2vqTjInyZgccbIAA=;
 b=tY0njjAkc+GqIUMwgwWh31C5JChZOq7L0smXyXQ1WIwovIjG6yu/+8DGU5RgvCY2Fj
 SxoW2/WxHggsVu45oOTBiPLBEA5PU/jg/pZ83f4RowWfTzWXxBLD9/AaBXTrtGJr8Uvt
 fuqth0K7v/oKRX39JTgB6BFwgjZwpaTKQH9caEPKU2thRk6mgVNQeOGpULbamtUWLUby
 lmxE0XHDCvVbCQA2RXtoX775XVmJagBMCta4HXM+LrJJZxXu6+rCKNQBQCZ6YvEFnT6K
 4FC/nrV1JEdlLYkMpqMjkVZDsBq/A7GAL5C25wD6xVRfZIwDlom8Okyv4+zLLZL1bQ9x
 HYLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738679343; x=1739284143;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=focBQCwxswdAVZ8Abbt2a80oqi/2vqTjInyZgccbIAA=;
 b=b6NmDLn3Ab2/kkiWMV18PTi+WrAD4yrVr3Zk5+HD/vCm2XBIzJAIBdKYVGAo/kLL1a
 d9ZAGZI0goAP3bOpUMpftRuZ1V89U0+VqKfuV+MesSCAKF50lWx9JZcbggF03Ejg/fUw
 lDEZqNG1WYqWlIFjoauYWQAGNG4BoaX0JIZkcXXlwt/6GC37L7dqB0eMdzCyuBP4GfZp
 rw/BOrIb5z0ElCnzVQm4tSfs+wMvJU7qJHMPLpqqW0tKQVZSsl2qzxfTTTjmBhaZRwO/
 JN0BwQkptMsl4eqKGaeL2/l61/+MdBiMxll30uGO4zxgtg2MCL7Tft4LYKhv58BG7Skd
 XX5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWc7zqni192UpabLaWK6dVZe9BRVYS8VK6a7wtVGi14o2z57/8kwtJEpoEHXCaJUlaFYTzbznXrNgI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyqV3bTJm5TSvXZxmPMlZEn/pIjf3QKORlsrrxRtOq8cm+wB0jx
 057mInAMuBxZZZ+MZnPHkXgohqFrvy9/bJMrqNr7inO4w3kxwLega30zMIjyIYE=
X-Gm-Gg: ASbGncv74hFunxPfGn+eh5XCwL7tRDyJ8day8zRcpmaWsBfQCymGdmyIuRbVqi9T77+
 hzKwmEiLgYl5ScuBIuzV7v0Ysq2Ak6dTKqo07NTpcKJaYdAhjtHQ3j+6l25N8Es/rb4mym2j7j7
 Zyx26jdMOJsHBocRHk4YutBB6h9L44u44w2F5cp6kQzgXEjPwuhQjJJ3pAOxaPDN6lDum5aWMx6
 1ShwZpccsajy2HB+IyqwFJQsnPdcFFbjLPoo16ncv5fq5DOqYzIeQQsa7OBUiEUQ/iZt4dgawAn
 Kz7vu20YJxAo5TGCKuRIjeOgfrBrASIqt8ibSiOH/ZEtm72pSONB3qyshE0d7A2yOBoG+fk=
X-Google-Smtp-Source: AGHT+IEC1O4dAfwm2RAvRMNkQGlW/UA2o/sGSDuis3tbSpMY5FqwwE6f9ZDBY3h24zAeDqxXdOmmxQ==
X-Received: by 2002:a05:6512:48c1:b0:53e:39e6:a1c5 with SMTP id
 2adb3069b0e04-543e4c32c8emr7811652e87.41.1738679343360; 
 Tue, 04 Feb 2025 06:29:03 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543ebebeb92sm1597455e87.228.2025.02.04.06.29.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2025 06:29:02 -0800 (PST)
Date: Tue, 4 Feb 2025 16:28:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] drm/msm/dsi/phy: Define PHY_CMN_CLK_CFG[01]
 bitfields and simplify saving
Message-ID: <dtenajcyhcrejiiadcfmpz3h3cg3l2rkio55625umao6gl3q3k@asy2ecfz37ps>
References: <20250203-drm-msm-phy-pll-cfg-reg-v2-0-862b136c5d22@linaro.org>
 <20250203-drm-msm-phy-pll-cfg-reg-v2-4-862b136c5d22@linaro.org>
 <hhedgfdbqpbv7s6iegtoztmznqdqn7bdumik7dm5xtsfsj6uwp@3jz422fhchcn>
 <ef1f91e4-aec4-41e8-b842-52d3f91e82bb@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef1f91e4-aec4-41e8-b842-52d3f91e82bb@linaro.org>
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

On Tue, Feb 04, 2025 at 10:24:28AM +0100, Krzysztof Kozlowski wrote:
> On 03/02/2025 18:58, Dmitry Baryshkov wrote:
> > On Mon, Feb 03, 2025 at 06:29:21PM +0100, Krzysztof Kozlowski wrote:
> >> Add bitfields for PHY_CMN_CLK_CFG0 and PHY_CMN_CLK_CFG1 registers to
> >> avoid hard-coding bit masks and shifts and make the code a bit more
> >> readable.  While touching the lines in dsi_7nm_pll_save_state()
> >> resulting cached->pix_clk_div assignment would be too big, so just
> >> combine pix_clk_div and bit_clk_div into one cached state to make
> >> everything simpler.
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>
> >> ---
> >>
> >> Changes in v2:
> >> 1. New patch
> >> ---
> >>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          | 31 ++++++++++++----------
> >>  .../gpu/drm/msm/registers/display/dsi_phy_7nm.xml  | 12 +++++++--
> >>  2 files changed, 27 insertions(+), 16 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> >> index 926fd8e3330b2cdfc69d1e0e5d3930abae77b7d8..b61e75a01e1b69f33548ff0adefc5c92980a15d7 100644
> >> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> >> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> >> @@ -67,8 +67,7 @@ struct dsi_pll_config {
> >>  
> >>  struct pll_7nm_cached_state {
> >>  	unsigned long vco_rate;
> >> -	u8 bit_clk_div;
> >> -	u8 pix_clk_div;
> >> +	u8 clk_div;
> >>  	u8 pll_out_div;
> >>  	u8 pll_mux;
> >>  };
> >> @@ -401,12 +400,12 @@ static void dsi_pll_cmn_clk_cfg1_update(struct dsi_pll_7nm *pll, u32 mask,
> >>  
> >>  static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
> >>  {
> >> -	dsi_pll_cmn_clk_cfg1_update(pll, BIT(5), 0);
> >> +	dsi_pll_cmn_clk_cfg1_update(pll, DSI_7nm_PHY_CMN_CLK_CFG1_CLK_EN, 0);
> >>  }
> >>  
> >>  static void dsi_pll_enable_global_clk(struct dsi_pll_7nm *pll)
> >>  {
> >> -	u32 cfg_1 = BIT(5) | BIT(4);
> >> +	u32 cfg_1 = DSI_7nm_PHY_CMN_CLK_CFG1_CLK_EN | DSI_7nm_PHY_CMN_CLK_CFG1_CLK_EN_SEL;
> >>  
> >>  	writel(0x04, pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_3);
> >>  	dsi_pll_cmn_clk_cfg1_update(pll, cfg_1, cfg_1);
> >> @@ -572,15 +571,17 @@ static void dsi_7nm_pll_save_state(struct msm_dsi_phy *phy)
> >>  	cached->pll_out_div &= 0x3;
> >>  
> >>  	cmn_clk_cfg0 = readl(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG0);
> >> -	cached->bit_clk_div = cmn_clk_cfg0 & 0xf;
> >> -	cached->pix_clk_div = (cmn_clk_cfg0 & 0xf0) >> 4;
> >> +	cached->clk_div = cmn_clk_cfg0 & (DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_3_0__MASK |
> >> +					  DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_7_4__MASK);
> > 
> > Could you rather store these two fields separately by using FIELD_GET?
> 
> So make the code again more complicated? OK.

It was already there, bit_clk_div and pix_clk_div.

> 
> > 
> >>  
> >>  	cmn_clk_cfg1 = readl(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> >> -	cached->pll_mux = cmn_clk_cfg1 & 0x3;
> >> +	cached->pll_mux = cmn_clk_cfg1 & DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL__MASK;
> > 
> > FIELD_GET
> > 
> >>  
> >>  	DBG("DSI PLL%d outdiv %x bit_clk_div %x pix_clk_div %x pll_mux %x",
> >> -	    pll_7nm->phy->id, cached->pll_out_div, cached->bit_clk_div,
> >> -	    cached->pix_clk_div, cached->pll_mux);
> >> +	    pll_7nm->phy->id, cached->pll_out_div,
> >> +	    cached->clk_div & DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_3_0__MASK,
> >> +	    cached->clk_div >> DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_7_4__SHIFT,
> >> +	    cached->pll_mux);
> >>  }
> >>  
> >>  static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
> >> @@ -595,9 +596,9 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
> >>  	val |= cached->pll_out_div;
> >>  	writel(val, pll_7nm->phy->pll_base + REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE);
> >>  
> >> -	dsi_pll_cmn_clk_cfg0_write(pll_7nm,
> >> -				   cached->bit_clk_div | (cached->pix_clk_div << 4));
> >> -	dsi_pll_cmn_clk_cfg1_update(pll_7nm, 0x3, cached->pll_mux);
> >> +	dsi_pll_cmn_clk_cfg0_write(pll_7nm, cached->clk_div);
> >> +	dsi_pll_cmn_clk_cfg1_update(pll_7nm, DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL__MASK,
> >> +				    cached->pll_mux);
> >>  
> >>  	ret = dsi_pll_7nm_vco_set_rate(phy->vco_hw,
> >>  			pll_7nm->vco_current_rate,
> >> @@ -634,7 +635,8 @@ static int dsi_7nm_set_usecase(struct msm_dsi_phy *phy)
> >>  	}
> >>  
> >>  	/* set PLL src */
> >> -	dsi_pll_cmn_clk_cfg1_update(pll_7nm, GENMASK(3, 2), data << 2);
> >> +	dsi_pll_cmn_clk_cfg1_update(pll_7nm, DSI_7nm_PHY_CMN_CLK_CFG1_BITCLK_SEL__MASK,
> >> +				    data << DSI_7nm_PHY_CMN_CLK_CFG1_BITCLK_SEL__SHIFT);
> > 
> > use accessor function from the header.
> 
> For which part? for last argument? It will be almost pointless, but sure.
> 
> 
> > 
> >>  
> >>  	return 0;
> >>  }
> >> @@ -737,7 +739,8 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
> >>  		u32 data;
> >>  
> >>  		data = readl(pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> >> -		writel(data | 3, pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> >> +		writel(data | DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL__MASK,
> >> +		       pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> >>  
> >>  		phy_pll_out_dsi_parent = pll_post_out_div;
> >>  	} else {
> >> diff --git a/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml b/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
> >> index d54b72f924493b4bf0925c287366f7b1e18eb46b..d2c8c46bb04159da6e539bfe80a4b5dc9ffdf367 100644
> >> --- a/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
> >> +++ b/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
> >> @@ -9,8 +9,16 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
> >>  	<reg32 offset="0x00004" name="REVISION_ID1"/>
> >>  	<reg32 offset="0x00008" name="REVISION_ID2"/>
> >>  	<reg32 offset="0x0000c" name="REVISION_ID3"/>
> >> -	<reg32 offset="0x00010" name="CLK_CFG0"/>
> >> -	<reg32 offset="0x00014" name="CLK_CFG1"/>
> >> +	<reg32 offset="0x00010" name="CLK_CFG0">
> >> +		<bitfield name="DIV_CTRL_3_0" low="0" high="3" type="uint"/>
> >> +		<bitfield name="DIV_CTRL_7_4" low="4" high="7" type="uint"/>
> > 
> > Are there any sensible names for these two regs? It looks ther are
> > not...
> 
> These are the sensible names. That's how they are called in datasheet.

Yeah, that's what I had in the register file too. Then this part is
okay.

> 
> Best regards,
> Krzysztof

-- 
With best wishes
Dmitry
