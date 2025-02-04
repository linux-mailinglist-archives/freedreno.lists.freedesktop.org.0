Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC05A2744C
	for <lists+freedreno@lfdr.de>; Tue,  4 Feb 2025 15:27:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F118310E659;
	Tue,  4 Feb 2025 14:27:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XzDAZbKF";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65CC210E347
 for <freedreno@lists.freedesktop.org>; Tue,  4 Feb 2025 14:27:04 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-30613802a04so55057541fa.2
 for <freedreno@lists.freedesktop.org>; Tue, 04 Feb 2025 06:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738679223; x=1739284023; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=RmBbaBkGKHffCofMrs0JVEYTBSJ+mN5gf9jQjReuUmI=;
 b=XzDAZbKFI8VBWyyrj0KJ1lDhp5mphXxrRu81RL/MrI837+fmhfcbeaKYcibZfHKZ5O
 /whPwCOrgm1jYPUyQ+6noJpQpoEsY+J/m1U/iW0lxOnzIOw1Rj9ky2UijQx0xwrSS5RR
 GN9cyp37e+HkEDLS0V5EE1coQzqgWIT7cVgTz0w0wsgXTi6Zvq8GYM+fqMNcY3UqsqOd
 3zp1+Is4+PMWcFle1y8cci0HO1IukCOkL1GFPDSS6tJS1iVHGCXD18udTFBs0LKcS1lD
 CXVaYwDRpXe6XO4XIJFM9f2EGO423l6mbD1raCajXgJWUAiw8SmZRDFb95wb5Bm21fjJ
 GIyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738679223; x=1739284023;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RmBbaBkGKHffCofMrs0JVEYTBSJ+mN5gf9jQjReuUmI=;
 b=WbK4oNgUEbujcSihlQ0R1rkytC59aeAD5WFltSESEhOco4bhPfTgPycdRTiXju6Guo
 2swwsWBEH2tJEkdcnvQb9gYmwX7h5n7Ls4kMNkZq83s2q2xV7nl9cCqkPIfEFU40BYyL
 h3z7MC474pDqrqOvOrVJGULhJPijncOKeJEr+W3abxaLeARizNByrz5L5lGusi4CAaFo
 uHh8zFaARkQQUZROXxUSy98gGssR1C5sAUvSER5/4L51gTiuyULtWCHru8GyodBbLXYd
 m6RNX3cnr2VPjFzI1TDQR0/H+a8yTYfeNLj3aGI5e51tR96CvX8hntKXOKlFaFSvYvfY
 wvuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKEGmEQ7kypIFwBJHTBJRRpRLCG6rYAM2OD4+aDZ6a9A9fKd6W8iA9UfovnG2ER0pbVuFspzAADnk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJhH26oWNmvVVulw+Bi/iXadActt52DDFDCguU9hJNGWVRl3RS
 cnQ6T8ICfWrkgyTQgmLPkVVohcTKgVL+us+sz2whHCswtXnZxuuC48Ddwrryv14=
X-Gm-Gg: ASbGncv4kTakgGQYYglvAb/2U+RYQyAT6Wihkr1rvRKkGjX5eArIDDS+hGbLEJ3htWz
 iAN8ihhgSiRbFrMppHdbnvMGUjEUVNXSU7aJkpoX+VFc0U/jswr8ywBLa94bQY0nUe6xRQpa2Ud
 XSNk0VOXn1c0feHxUy8Lg57I55pnW8LFafkj/07nYgkFPbQNsmXZikajePLdHTFD+HY9ubL8Sbx
 RSrV5AJuyaG564YAxJpSFj+2ZM3fhustgoljNHxDsSX1vPeJqujyU7NpD1pYjyKOlosnS6zQe4z
 yUWtnbNDLs/ufFNafWhTFd4UGpUm0CIB/Ar4RlZ2nDZuA6W3o7Q3uNQjHGjCnXd96iyxLvU=
X-Google-Smtp-Source: AGHT+IE8XOaYEj7jYvhNnwbtWQcvDKstTrzf5XAxQhgdONK67Y73izpEykGcxI07g33XKs4TMQ+cHA==
X-Received: by 2002:a05:651c:160f:b0:300:4107:6294 with SMTP id
 38308e7fff4ca-307968fb853mr89129541fa.35.1738679222565; 
 Tue, 04 Feb 2025 06:27:02 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-307a33f6aebsm18480671fa.73.2025.02.04.06.27.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2025 06:27:01 -0800 (PST)
Date: Tue, 4 Feb 2025 16:26:58 +0200
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
Message-ID: <vfqfbpxc3zrerrb2hyis6h4kgk7aqfljwb7sxlduwlkqprmodg@rjjfsgwr5c6j>
References: <20250203-drm-msm-phy-pll-cfg-reg-v2-0-862b136c5d22@linaro.org>
 <20250203-drm-msm-phy-pll-cfg-reg-v2-2-862b136c5d22@linaro.org>
 <u4qho7u2nu2x6qxkfxpeakotmbdgoha3e5csmsamaanlxziiif@22kzxupzibj7>
 <12275e11-eadc-48be-b8c3-9463cdf92698@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12275e11-eadc-48be-b8c3-9463cdf92698@linaro.org>
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

On Tue, Feb 04, 2025 at 10:21:25AM +0100, Krzysztof Kozlowski wrote:
> On 03/02/2025 18:41, Dmitry Baryshkov wrote:
> > On Mon, Feb 03, 2025 at 06:29:19PM +0100, Krzysztof Kozlowski wrote:
> >> PHY_CMN_CLK_CFG1 register is updated by the PHY driver and by a mux
> >> clock from Common Clock Framework:
> >> devm_clk_hw_register_mux_parent_hws().  There could be a path leading to
> >> concurrent and conflicting updates between PHY driver and clock
> >> framework, e.g. changing the mux and enabling PLL clocks.
> >>
> >> Add dedicated spinlock to be sure all PHY_CMN_CLK_CFG1 updates are
> >> synchronized.
> >>
> >> Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>
> >> ---
> >>
> >> Changes in v2:
> >> 1. Store BIT(4) and BIT(5) in local var in dsi_pll_enable_global_clk()
> >> ---
> >>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 35 +++++++++++++++++++------------
> >>  1 file changed, 22 insertions(+), 13 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> >> index c164f845653816291ad96c863257f75462ef58e7..e26f53f7cde8f0f6419a633f5d39784dc2e5bb98 100644
> >> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> >> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> >> @@ -83,6 +83,9 @@ struct dsi_pll_7nm {
> >>  	/* protects REG_DSI_7nm_PHY_CMN_CLK_CFG0 register */
> >>  	spinlock_t postdiv_lock;
> >>  
> >> +	/* protects REG_DSI_7nm_PHY_CMN_CLK_CFG1 register */
> >> +	spinlock_t pclk_mux_lock;
> >> +
> >>  	struct pll_7nm_cached_state cached_state;
> >>  
> >>  	struct dsi_pll_7nm *slave;
> >> @@ -381,22 +384,32 @@ static void dsi_pll_cmn_clk_cfg0_write(struct dsi_pll_7nm *pll, u32 val)
> >>  	spin_unlock_irqrestore(&pll->postdiv_lock, flags);
> >>  }
> >>  
> >> -static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
> >> +static void dsi_pll_cmn_clk_cfg1_update(struct dsi_pll_7nm *pll, u32 mask,
> >> +					u32 val)
> >>  {
> >> +	unsigned long flags;
> >>  	u32 data;
> >>  
> >> +	spin_lock_irqsave(&pll->pclk_mux_lock, flags);
> >>  	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> >> -	writel(data & ~BIT(5), pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> >> +	data &= ~mask;
> >> +	data |= val & mask;
> >> +
> >> +	writel(data, pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> >> +	spin_unlock_irqrestore(&pll->pclk_mux_lock, flags);
> >> +}
> >> +
> >> +static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
> >> +{
> >> +	dsi_pll_cmn_clk_cfg1_update(pll, BIT(5), 0);
> >>  }
> >>  
> >>  static void dsi_pll_enable_global_clk(struct dsi_pll_7nm *pll)
> >>  {
> >> -	u32 data;
> >> +	u32 cfg_1 = BIT(5) | BIT(4);
> > 
> > Please define these two bits too.
> 
> Why? They were not defined before. This only moving existing code.

Previously it was just a bit magic. Currently you are adding them as
masks. I want to know if BIT(4) and BIT(5) are parts of the same
bitfield (2 bits wide) or if they define two different bits.

-- 
With best wishes
Dmitry
