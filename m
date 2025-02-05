Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72709A28240
	for <lists+freedreno@lfdr.de>; Wed,  5 Feb 2025 03:59:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DEC810E721;
	Wed,  5 Feb 2025 02:59:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LMdw4aFT";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 825ED10E71E
 for <freedreno@lists.freedesktop.org>; Wed,  5 Feb 2025 02:51:18 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-540215984f0so6988670e87.1
 for <freedreno@lists.freedesktop.org>; Tue, 04 Feb 2025 18:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738723876; x=1739328676; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Sal9bpIT3EIK1E8XL8kL1lQntuyvQMLbh8ZI+Q+dMFE=;
 b=LMdw4aFTdSySsTJtQ+3GUjYa/1Q6bp71dl4Zfkus08TmOrAmlLr0RkxeDXAxuMrSSi
 rKOqdtCkja3cbWYWt/iC55406wKZCj2YSklyCw5/ZDyyLMVYkh40qjElgVPaFwIc44WS
 cUPlG4KqzMdLCMAP9aReaxTB4qpoSxQjeeFMReoxxnRPdMxo7fz6aq/1nnejhJOZwc5O
 4af7nqauJf0y5sO1kPRrCD5PnVnqICfVZ9LbrEEZO4DPpyRLu++p01pzMMGI3iWIdmlG
 gOh8pRnQdGlJnqT/W0SEDksXrkpR6y2LW8wfJYaQBJiA3RAL4/qTKWYuepg/MOyMCc0f
 1j5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738723876; x=1739328676;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sal9bpIT3EIK1E8XL8kL1lQntuyvQMLbh8ZI+Q+dMFE=;
 b=tMXaMZjBc22FpK7LVF0JPyB8SMW+rJDJiA2MUYX43/edGRo8ysTg/ZbmrNLOJ0yPEs
 HhO6iZn2WH5bA4yJZMByDebMXm96HLjRj9ubEyF9gBrBGjBUEWMYtw3dz0UD5LETTHHN
 9tshX9oZ1hOBUAeigs3JAqXVDlNpHn7/uQ94SyB6rdy77s2PK/3y1IvVbSaSwVWFSjh5
 oYyalyVuKCazAgnwj1PreeYptD9xm2f+yDGi/onhbkDeOS/BhsE97WErWn3GMQwVxCAp
 Nv5F+R4fewfg01GvaXi1i01t/eJ8HawTpzHDEmPSRsTPQQm5gsLNvkqNVAlKpjEYt+/x
 7zpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcLkFYjAOG3fO2YJMTcBKZp79GYRtV4R5bu8FR7qcJR0RuGzs8bbesgZJol0tJRZoFQSMd/oxLpcA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZ0zphtN390a0IrVZXxlt97rBaNJI5GbmDc95BGjz2tiK82Xbg
 z5YBQFlKKp4dXS3nBuhMaCJ3c8cNV4OejIlaT4Q0MxaobxHu+ypfT4/z3lCCPvU=
X-Gm-Gg: ASbGncuDag2ZQ20Xc1kKdXs1LNq6vRLrQ83Gl2U/qQQ7IU0vljVl6Nbqp9vV53A4gdY
 CPLg9QpyaX/wvv9kIlT5U3dccPQ7CF4PIWBM0myb6zE+Hp06i6cqExLI/8DVMpy9lThRYGdT7OV
 Ydbdq5qB6uY3a+0nI2e7pH+uqWANY1wU6qyNG0WKOFGAvCyBADHrNAFrZuhI3f9ox5WxdsqFlBj
 YARZPKhNDYdrEjwkfw+2+tilJVP3zsik/HnJHluVjo1tmcoqzCPhlf6RcsuhZhS7gU/fNnmRrGO
 Rk78LZJ4OpQ3W7Pjc0KoiyQcW70B/BdBRwEdCVxDcX0BR5wN0xOw43rQ7ghjQYJalD4Ak9o=
X-Google-Smtp-Source: AGHT+IEpdwrVVWgvPZBy3RjGtkhwHF0kUa5g2ZWpU4E+/3fmvwNCNdl0KYdTFTnKWGKykH6xnSeS9A==
X-Received: by 2002:a05:6512:234c:b0:540:1b7e:7b3d with SMTP id
 2adb3069b0e04-54405a682f8mr239139e87.36.1738723876503; 
 Tue, 04 Feb 2025 18:51:16 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543ebeb782bsm1779544e87.182.2025.02.04.18.51.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2025 18:51:15 -0800 (PST)
Date: Wed, 5 Feb 2025 04:51:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG1 against
 clock driver
Message-ID: <t4zn2gv3mbn3nqlh5h3l3ej5zxs4wa74ncgymonci7v45w47ai@qmmtxbelichw>
References: <20250203-drm-msm-phy-pll-cfg-reg-v2-0-862b136c5d22@linaro.org>
 <20250203-drm-msm-phy-pll-cfg-reg-v2-2-862b136c5d22@linaro.org>
 <u4qho7u2nu2x6qxkfxpeakotmbdgoha3e5csmsamaanlxziiif@22kzxupzibj7>
 <12275e11-eadc-48be-b8c3-9463cdf92698@linaro.org>
 <vfqfbpxc3zrerrb2hyis6h4kgk7aqfljwb7sxlduwlkqprmodg@rjjfsgwr5c6j>
 <2e96ae62-3114-4c7b-bea7-27f6e2009634@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e96ae62-3114-4c7b-bea7-27f6e2009634@linaro.org>
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

On Tue, Feb 04, 2025 at 04:46:04PM +0100, Krzysztof Kozlowski wrote:
> On 04/02/2025 15:26, Dmitry Baryshkov wrote:
> > On Tue, Feb 04, 2025 at 10:21:25AM +0100, Krzysztof Kozlowski wrote:
> >> On 03/02/2025 18:41, Dmitry Baryshkov wrote:
> >>> On Mon, Feb 03, 2025 at 06:29:19PM +0100, Krzysztof Kozlowski wrote:
> >>>> PHY_CMN_CLK_CFG1 register is updated by the PHY driver and by a mux
> >>>> clock from Common Clock Framework:
> >>>> devm_clk_hw_register_mux_parent_hws().  There could be a path leading to
> >>>> concurrent and conflicting updates between PHY driver and clock
> >>>> framework, e.g. changing the mux and enabling PLL clocks.
> >>>>
> >>>> Add dedicated spinlock to be sure all PHY_CMN_CLK_CFG1 updates are
> >>>> synchronized.
> >>>>
> >>>> Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
> >>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>>>
> >>>> ---
> >>>>
> >>>> Changes in v2:
> >>>> 1. Store BIT(4) and BIT(5) in local var in dsi_pll_enable_global_clk()
> >>>> ---
> >>>>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 35 +++++++++++++++++++------------
> >>>>  1 file changed, 22 insertions(+), 13 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> >>>> index c164f845653816291ad96c863257f75462ef58e7..e26f53f7cde8f0f6419a633f5d39784dc2e5bb98 100644
> >>>> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> >>>> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> >>>> @@ -83,6 +83,9 @@ struct dsi_pll_7nm {
> >>>>  	/* protects REG_DSI_7nm_PHY_CMN_CLK_CFG0 register */
> >>>>  	spinlock_t postdiv_lock;
> >>>>  
> >>>> +	/* protects REG_DSI_7nm_PHY_CMN_CLK_CFG1 register */
> >>>> +	spinlock_t pclk_mux_lock;
> >>>> +
> >>>>  	struct pll_7nm_cached_state cached_state;
> >>>>  
> >>>>  	struct dsi_pll_7nm *slave;
> >>>> @@ -381,22 +384,32 @@ static void dsi_pll_cmn_clk_cfg0_write(struct dsi_pll_7nm *pll, u32 val)
> >>>>  	spin_unlock_irqrestore(&pll->postdiv_lock, flags);
> >>>>  }
> >>>>  
> >>>> -static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
> >>>> +static void dsi_pll_cmn_clk_cfg1_update(struct dsi_pll_7nm *pll, u32 mask,
> >>>> +					u32 val)
> >>>>  {
> >>>> +	unsigned long flags;
> >>>>  	u32 data;
> >>>>  
> >>>> +	spin_lock_irqsave(&pll->pclk_mux_lock, flags);
> >>>>  	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> >>>> -	writel(data & ~BIT(5), pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> >>>> +	data &= ~mask;
> >>>> +	data |= val & mask;
> >>>> +
> >>>> +	writel(data, pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> >>>> +	spin_unlock_irqrestore(&pll->pclk_mux_lock, flags);
> >>>> +}
> >>>> +
> >>>> +static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
> >>>> +{
> >>>> +	dsi_pll_cmn_clk_cfg1_update(pll, BIT(5), 0);
> >>>>  }
> >>>>  
> >>>>  static void dsi_pll_enable_global_clk(struct dsi_pll_7nm *pll)
> >>>>  {
> >>>> -	u32 data;
> >>>> +	u32 cfg_1 = BIT(5) | BIT(4);
> >>>
> >>> Please define these two bits too.
> >>
> >> Why? They were not defined before. This only moving existing code.
> > 
> > Previously it was just a bit magic. Currently you are adding them as
> 
> No, previous code:
> 
> writel(data | BIT(5) | BIT(4), pll->phy->base +
> REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> 
> This is a mask and update in the same time, because:
> 	(data & (BIT(5) | BIT(4)) | BIT(5) | BIT(4)
> is just redudant.
> 
> I did not do any logical change, I did not add any mask or field.
> Everything was already there.

Yes... and no. Previously it was just writel(foo | BIT(5) | BIT(4)). Now
your code adds BIT(5) as a 'mask' parameter. Is it a correct mask for
that field? That's why I'm asking you to define those - you have changed
bitwrites to the masked bit writes. Masks should be defined.

> 
> 
> > masks. I want to know if BIT(4) and BIT(5) are parts of the same
> > bitfield (2 bits wide) or if they define two different bits.
> 
> While in general you are right, it does not matter for this fix. If this
> are separate bitfields - fix is correct. If this is one bitfield - fix
> is still correct. You could claim that if this was one bitfield, using
> 2xBIT() is not logical, but this was there already, so again my fix is
> only fixing and keeping entire logic or inconsistencies intact.

-- 
With best wishes
Dmitry
