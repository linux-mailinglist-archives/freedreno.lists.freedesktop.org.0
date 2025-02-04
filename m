Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4565A2743D
	for <lists+freedreno@lfdr.de>; Tue,  4 Feb 2025 15:21:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B619810E659;
	Tue,  4 Feb 2025 14:21:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="A2LGcSoW";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E24BB10E353
 for <freedreno@lists.freedesktop.org>; Tue,  4 Feb 2025 14:21:35 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-54024ecc33dso5785653e87.0
 for <freedreno@lists.freedesktop.org>; Tue, 04 Feb 2025 06:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738678894; x=1739283694; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=oi6tUx0/wzqbQ52cHEyBiqvPWzAr8efFA58lEXMvq7s=;
 b=A2LGcSoWufoMEOpZuWqsnUy9l+U1BOl/ol3/w6uSEuO16PBCOU0sp96EGHRYm5GrIV
 7uTKaYWWopCm7RyTkPP9jntHLP/RHtStmX486wjpjIcSsFtgxD86RmKqXx3vrTDO3p/o
 BnkE3LksvZYKRdEQ9J8LZeKUr3Gj550RcUAe1R/qf4DkFkGkTskuZpmK+E0SIGvHs9Lu
 am64yzK7znGYUN5ns2nEPWyGpyMKUYWwDvfJxmDVBrzrkYSWuY3EjQhtylFb9Q+xc76z
 rjoUHSZz/KT3ZBZuy4HBs6IqvuCiaY5e6eLYSexaOuOuCn5W9sFu8YJw53AKvKFA/2zA
 uN0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738678894; x=1739283694;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oi6tUx0/wzqbQ52cHEyBiqvPWzAr8efFA58lEXMvq7s=;
 b=s33+XWKYEEyI/8dASOefmiuxGGkutSP0PkN8K+yx590BhpDIiNGdJlC0IWPCYXqB94
 RN1Qt9KKCkVYnbZq3cNYXK9QxIOuppWQDCEeesxhIEaFvR0kJ8JGSNcUWY4PtAWiQfDB
 b8VyR6AuRVnhyde6aRfsnNvEk8EBWsFoX72az8gt7y6Ok75wbVpxwHcW5uz26xUfvQZW
 GZjj9Bniu/k4V3332XfRc5Vkk7QUPU64WKu8OLpd4Bxg4vd6gB7+fvATAT3SnV5l+iRx
 dwrogGS/iMdgt3ArPO/PetNlD3qtxf53eMJzNnFwXH69KPB2pTwa/Aw7KchHRLp0frDd
 t26w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVM/E3jCfTVR8qQjY3XXzfEZlR6LFisMNSdYpbqw2ZGEaIPV7CAeW/9/O12B1pgV5R0HEpV9o2H0zE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCTJUys4ZR6qeuNZLQ+gq7yX96GSyZXZ7OtIr+tZ97Ci3DvBrr
 c+ErOAiPUVnbtmFwFB/KUagA8XFNlyUeO7jzZH6RW7CEHhru59Hr51pmUQ1/p5o=
X-Gm-Gg: ASbGncuSyWNqkL4OhzOvkumDEF4cGSWBC8+x9dL3r5IJo/jelsTyG3Qx0HI/wJqoM0b
 aHFe7eE4ugnzpFeQkneAqiFcxDDFeCu1yTYppXKN60IAoY9TTH0vMdN4xGfCFkN7l/gnjieCzRR
 XxCgQGqEFyiXEeLknvbdngdHBHpiwegfFIhJGvq6MgsB+QENP2g5K0f4Q7Z+ZbqTaTY4ofk4PiO
 SfXNYt4INC/pv8wH0LeSKFzEXOu4lVaQiIWWI9pobZawy4xtLEqgMMi/+UC9oYS5FtggKyoPOiG
 NdZ6CTZehY24lQI5jJsGewJvAY8o51SL1A+hHoxI+/V0vhfQ334huJD5dLEcF3SlXaX9Ptc=
X-Google-Smtp-Source: AGHT+IFDRGI5VR5BcuN5nJ+zBTmiyxgvK65Wc13eLI6fmz9GDOmgId9YE/M2/7VVyU75pRkBKWfVAg==
X-Received: by 2002:ac2:4f8c:0:b0:53e:350a:729e with SMTP id
 2adb3069b0e04-543e4c32e43mr6798589e87.35.1738678894011; 
 Tue, 04 Feb 2025 06:21:34 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543ebebeb3esm1601521e87.220.2025.02.04.06.21.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2025 06:21:33 -0800 (PST)
Date: Tue, 4 Feb 2025 16:21:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG0 updated
 from driver side
Message-ID: <r3dur3sonbmpmchj4pmbeefe77iyfldnqgfztggxqh67mrjskv@sryo52xo2zml>
References: <20250203-drm-msm-phy-pll-cfg-reg-v2-0-862b136c5d22@linaro.org>
 <20250203-drm-msm-phy-pll-cfg-reg-v2-1-862b136c5d22@linaro.org>
 <le5kxzhm3b2whxoo3eblkelryc7ak2yezugqti2sxw7m244dzc@nyuhhs53jdup>
 <cc63872f-3ad5-479e-bfff-8d62478e446e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc63872f-3ad5-479e-bfff-8d62478e446e@linaro.org>
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

On Tue, Feb 04, 2025 at 10:20:51AM +0100, Krzysztof Kozlowski wrote:
> On 03/02/2025 18:42, Dmitry Baryshkov wrote:
> > On Mon, Feb 03, 2025 at 06:29:18PM +0100, Krzysztof Kozlowski wrote:
> >> PHY_CMN_CLK_CFG0 register is updated by the PHY driver and by two
> >> divider clocks from Common Clock Framework:
> >> devm_clk_hw_register_divider_parent_hw().  Concurrent access by the
> >> clocks side is protected with spinlock, however driver's side in
> >> restoring state is not.  Restoring state is called from
> >> msm_dsi_phy_enable(), so there could be a path leading to concurrent and
> >> conflicting updates with clock framework.
> >>
> >> Add missing lock usage on the PHY driver side, encapsulated in its own
> >> function so the code will be still readable.
> >>
> >> Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >> ---
> >>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 13 +++++++++++--
> >>  1 file changed, 11 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> >> index 031446c87daec0af3f81df324158311f5a80014e..c164f845653816291ad96c863257f75462ef58e7 100644
> >> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> >> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> >> @@ -372,6 +372,15 @@ static void dsi_pll_enable_pll_bias(struct dsi_pll_7nm *pll)
> >>  	ndelay(250);
> >>  }
> >>  
> >> +static void dsi_pll_cmn_clk_cfg0_write(struct dsi_pll_7nm *pll, u32 val)
> >> +{
> >> +	unsigned long flags;
> >> +
> >> +	spin_lock_irqsave(&pll->postdiv_lock, flags);
> >> +	writel(val, pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG0);
> >> +	spin_unlock_irqrestore(&pll->postdiv_lock, flags);
> >> +}
> >> +
> >>  static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
> >>  {
> >>  	u32 data;
> >> @@ -574,8 +583,8 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
> >>  	val |= cached->pll_out_div;
> >>  	writel(val, pll_7nm->phy->pll_base + REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE);
> >>  
> >> -	writel(cached->bit_clk_div | (cached->pix_clk_div << 4),
> >> -	       phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG0);
> >> +	dsi_pll_cmn_clk_cfg0_write(pll_7nm,
> >> +				   cached->bit_clk_div | (cached->pix_clk_div << 4));
> > 
> > Ideally this would be FIELD_PREP or a special function generated for you
> > in the header.
> 
> There is no header. That's patch #1 and I do not see how changing this
> to FIELDPREP is anyhow related to the actual problem being solved here.

Ack, this just moves the code.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
