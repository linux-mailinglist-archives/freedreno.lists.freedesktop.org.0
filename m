Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6E6A2619A
	for <lists+freedreno@lfdr.de>; Mon,  3 Feb 2025 18:42:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B0DB10E539;
	Mon,  3 Feb 2025 17:42:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UEolFfJn";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D77C10E538
 for <freedreno@lists.freedesktop.org>; Mon,  3 Feb 2025 17:42:24 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-54287a3ba3cso5171932e87.0
 for <freedreno@lists.freedesktop.org>; Mon, 03 Feb 2025 09:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738604542; x=1739209342; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZV759n545yp2xuLFkBUA+OXI8LlcFh1JTbt2D9n4TpY=;
 b=UEolFfJnfiGlH0NawLaJnrihIfGD19rTXBZmbrW6UW5OMTgxPaqhIdSFMOcudIUFcL
 EVnI5tp3a3MEfOjt1bLQPHbtOshRdYHlS43ZdDTz+wHi+xiqq6IaquPzBh9AID57hp+2
 347Sns5o37Dh9/bnimQHoybaP3vGteF41xH3tUBaODcF7OIQR2ntgYAfFxOCIOnZYx1W
 rNCg35lpXvZjyiS4vD+nho3xebqiymyRDoBLKHqHSyZFjoYiiJijWdGURF1xuTbO57Ul
 9gmV+fhTJYkVRssHZPYdBEQyzagP7TC1ECmDH6FX54GO8pd8/Uw/+EhzbszWGZaBo6GD
 UGQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738604542; x=1739209342;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZV759n545yp2xuLFkBUA+OXI8LlcFh1JTbt2D9n4TpY=;
 b=Pv5tIDoiJaAQbNg+/HmhTvKqeGwcEZ9euo6fhczABxwe4Y7zkvmIWzs43Y9s1Q3MRp
 wpNJ3wWV926pYRISFD8gLUKbjxq19/jRLVVlu9IfJA+yn/pAqWbkS4N49Cmcp7h91jGL
 vMajB75iHHIdXoEywFeV+yho3GDwsyiZCrFolJNdz9NcDyaJ6wnixouQB8HdyOyuPvd2
 9EsmjnS64Flcjv5sVFvXQK8C+uMCen47jI2JncNWLWN7qlRh+xpGSWezCPxNR+gtjLFR
 UwKn4HYr4HVwsHLD1qIZNw65Mrn+NkqvyJ6L1leUracCE/o5+uNavL8bsexrHN6f8+Cy
 R0ZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBtedDIVONzWA5gmcQZU+OhdNhxSxUKRYqbpyF+HniXukGs+edeyV2eUHwkHFrBBqu7c0T01h75Ng=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwyizCZo98D4OIsjK7jV7ddWeApO1dMugj3NXA37AmW9ayZ3KN9
 KoIj2txfrba+LcDoZxKQubG5TX86iAaMwo97x4KrW31UYcsn3S4ihdjgLzHLSHI=
X-Gm-Gg: ASbGncuEHR5RvOUB/P7J0Fh1FnL65SfwH6qyBvRxlO+b25Q3hbQyE6UY461lw3vyjC8
 5fwf4t7w4g+cQoxCD5qqTXUS7sVZZ0Xh17sFCNlB4M2gGnc+mD3yDIuWo+AmfMUVT/m29Ub5q2H
 1X7Ssppl3GtTABq1sTFeVdRrcTF5OmXzQOIKxXgKlN70+ILaX1a4GxHTxv7X01Y9wvjvD0sXMpq
 ZmhaXVfn+PyLIfo1nxVSzlWEaZL/9AA3sIVbSCtheotY0R/Pu2NvEdZu2tPYKzJstloDZsuRBr2
 83To7ko4brrGi9xtQ/aNNyCxPz0iYsxKuBN/4lprXDzkPOAWgrh4vXW7wE/P+6Ur7Cicifg=
X-Google-Smtp-Source: AGHT+IGlJ87svBgPPUA20T73yUcNcWRnrAPPLfHleKAdvq9eZ+1SZHlu0nXMsWAYW/fUC1Is8QpX2g==
X-Received: by 2002:a05:6512:3f13:b0:542:99a7:b415 with SMTP id
 2adb3069b0e04-543ffab903amr96587e87.0.1738604542379; 
 Mon, 03 Feb 2025 09:42:22 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543ebeb7df3sm1351683e87.204.2025.02.03.09.42.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2025 09:42:22 -0800 (PST)
Date: Mon, 3 Feb 2025 19:42:19 +0200
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
Message-ID: <le5kxzhm3b2whxoo3eblkelryc7ak2yezugqti2sxw7m244dzc@nyuhhs53jdup>
References: <20250203-drm-msm-phy-pll-cfg-reg-v2-0-862b136c5d22@linaro.org>
 <20250203-drm-msm-phy-pll-cfg-reg-v2-1-862b136c5d22@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203-drm-msm-phy-pll-cfg-reg-v2-1-862b136c5d22@linaro.org>
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

On Mon, Feb 03, 2025 at 06:29:18PM +0100, Krzysztof Kozlowski wrote:
> PHY_CMN_CLK_CFG0 register is updated by the PHY driver and by two
> divider clocks from Common Clock Framework:
> devm_clk_hw_register_divider_parent_hw().  Concurrent access by the
> clocks side is protected with spinlock, however driver's side in
> restoring state is not.  Restoring state is called from
> msm_dsi_phy_enable(), so there could be a path leading to concurrent and
> conflicting updates with clock framework.
> 
> Add missing lock usage on the PHY driver side, encapsulated in its own
> function so the code will be still readable.
> 
> Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index 031446c87daec0af3f81df324158311f5a80014e..c164f845653816291ad96c863257f75462ef58e7 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -372,6 +372,15 @@ static void dsi_pll_enable_pll_bias(struct dsi_pll_7nm *pll)
>  	ndelay(250);
>  }
>  
> +static void dsi_pll_cmn_clk_cfg0_write(struct dsi_pll_7nm *pll, u32 val)
> +{
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&pll->postdiv_lock, flags);
> +	writel(val, pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG0);
> +	spin_unlock_irqrestore(&pll->postdiv_lock, flags);
> +}
> +
>  static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
>  {
>  	u32 data;
> @@ -574,8 +583,8 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
>  	val |= cached->pll_out_div;
>  	writel(val, pll_7nm->phy->pll_base + REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE);
>  
> -	writel(cached->bit_clk_div | (cached->pix_clk_div << 4),
> -	       phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG0);
> +	dsi_pll_cmn_clk_cfg0_write(pll_7nm,
> +				   cached->bit_clk_div | (cached->pix_clk_div << 4));

Ideally this would be FIELD_PREP or a special function generated for you
in the header.

>  
>  	val = readl(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
>  	val &= ~0x3;
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
