Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D8DA08B37
	for <lists+freedreno@lfdr.de>; Fri, 10 Jan 2025 10:18:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FCF210F036;
	Fri, 10 Jan 2025 09:18:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iAgyACW2";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D17010F036
 for <freedreno@lists.freedesktop.org>; Fri, 10 Jan 2025 09:18:47 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-54021daa6cbso1621289e87.0
 for <freedreno@lists.freedesktop.org>; Fri, 10 Jan 2025 01:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736500666; x=1737105466; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=L2lf5WclkEz+EvG+eiHP21Z389GYrT7IorkLmd4KRl4=;
 b=iAgyACW24O/dbUbd1G3jl57TaCB78m/O26Njji7fKpwbfYCmqZVj2EpsSFCRu8WQMT
 BLlSVL4lwFOevtRH7as6NJ1MeKyeSHtBZEnTEmAXERmxqmp9XOAnCmqv12V2Blnv8BCV
 1LvErd3W2c/F/u8n5MRkdzOxkWh5C2NE5yp6OWAwpPFYsF6PY/KU5DJi2I0NsUazhj0S
 oESc/PdtFaItLykametGiyrexTuc841RgrkxUwQOADYGJfafNUcJLs7KlN6ytGPKEqeD
 sW7B7TRkJtid8ye5uAvLyDMVoBijGDxLAop9O2I3sYGLsO4DCTJtP0zNfITqI20F0tGR
 u+/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736500666; x=1737105466;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L2lf5WclkEz+EvG+eiHP21Z389GYrT7IorkLmd4KRl4=;
 b=DPtHEQfq06G0Oo21SnAxEAxSm/1qFYgmdI5i3K1FgxKQNBH/4NGds0W83L/JfnBs7n
 Bbid1bo+IxVEEJjLdhufFZZSuY+ulenFYZolq9R1CaEgO0WLUyzY/4xms0Obo+ANrEhB
 kIfP2f09swZ5oOIyoktdk2huAv0gzKl/KKGlpRThsHvboMV40SkvpnOkpnVZaycTsYqa
 BTlLrbHvFl5pLdNThHV7m/RRw8UnotpHyqjxP4dOWwVbsp/IDEhMoV7Y4gRwF1cr3d8C
 t9goM+2VjjJcj6aO5tgrLv0Wj30WG0XanbAEfUY02FUm0kzTkQcCpGlMWzDpe6fG7Tkt
 CTgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1B31dC8IwZWstjf4Huwf95qFqWH8zqoNsuFLsA3qCFHFrHOb8rgO02IfowkUpsGkKY0BccOPawTk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxI3ClJUAm0tseh60xrjoKdIULvwII0jjC4decJtU2hABC3xKYr
 CTkRSpFohqCTNQIvAIcEhGa/x7u/hsHYDc29ihdDldnyPhiut6BQRp1m9s51RnM=
X-Gm-Gg: ASbGncudnO4qNatCXhSUVhAUyMDLKVvNT2Jr5zwX8lfDEe9KRGwEHvsA1+qQDIUxw65
 31igCxjedhHL75a4aEUXlDFo2isWhHHYwIaB89vvA9yw5gefwiqESC2e5019o6PgiWtbK92SDuF
 ZgIIOztZGZcE66pHeYBmh7GZJWhsyj1VjqbuPEOgpEm1hhyjfbO6cAjzb4BQZJuKt0H3k55ViL1
 r5PeC4dcJJVtGp9WXI6ys4Wyf5/CKQ+c/DexQLcfd55HBqPPzjWfiJdtsP+gUVuuTJlFaSij+vT
 UATwswClCXNDV3paTKXSH7OFkmeA/S4tZjYh
X-Google-Smtp-Source: AGHT+IG+4qk6lHAL/TkzXeydSTLQvUxuwnokkCUltBuWF9YYEQanPry9PUofIV010QxcJ74yeY5qGQ==
X-Received: by 2002:a05:6512:3a83:b0:540:1b2d:8ef3 with SMTP id
 2adb3069b0e04-5428481d30dmr2788001e87.52.1736500665613; 
 Fri, 10 Jan 2025 01:17:45 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428bec0664sm468204e87.193.2025.01.10.01.17.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 01:17:44 -0800 (PST)
Date: Fri, 10 Jan 2025 11:17:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH RFC 08/11] drm/msm/dsi: Add support for SM8750
Message-ID: <7eupqawhdrbjgsj2p7e3ky7uj62m252i6dzkb6y23btocedp3q@qmw72nmbk2c4>
References: <20250109-b4-sm8750-display-v1-0-b3f15faf4c97@linaro.org>
 <20250109-b4-sm8750-display-v1-8-b3f15faf4c97@linaro.org>
 <3p7kjok5jzwvgt7dxuad26xgdkjd52v4gbtuudvgkeoj33skqn@afl2ddtsq7s2>
 <4fc7fdd5-36cd-42e6-af4a-e0e429f9f50b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4fc7fdd5-36cd-42e6-af4a-e0e429f9f50b@linaro.org>
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

On Fri, Jan 10, 2025 at 09:59:26AM +0100, Krzysztof Kozlowski wrote:
> On 10/01/2025 00:18, Dmitry Baryshkov wrote:
> > On Thu, Jan 09, 2025 at 02:08:35PM +0100, Krzysztof Kozlowski wrote:
> >> Add support for DSI PHY v7.0 on Qualcomm SM8750 SoC which comes with two
> >> differences worth noting:
> >>
> >> 1. ICODE_ACCUM_STATUS_LOW and ALOG_OBSV_BUS_STATUS_1 registers - their
> >>    offsets were just switched.  Currently these registers are not used
> >>    in the driver, so the easiest is to document both but keep them
> >>    commented out to avoid conflict.
> >>
> >> 2. DSI PHY PLLs, the parents of pixel and byte clocks, cannot be used as
> >>    parents before they are prepared and initial rate is set.  Therefore
> >>    assigned-clock-parents are not working here and driver is responsible
> >>    for reparenting clocks with proper procedure: see dsi_clk_init_6g_v2_9().
> > 
> > Isn't it a description of CLK_SET_PARENT_GATE and/or
> 
> No - must be gated accross reparent - so opposite.
> 
> > CLK_OPS_PARENT_ENABLE ?
> 
> Yes, but does not work. Probably enabling parent, before
> assigned-clocks-parents, happens still too early:
> 
> [    1.623554] DSI PLL(0) lock failed, status=0x00000000
> [    1.623556] PLL(0) lock failed
> [    1.624650] ------------[ cut here ]------------
> [    1.624651] disp_cc_mdss_byte0_clk_src: rcg didn't update its
> configuration.
> 
> Or maybe something is missing in the DSI PHY PLL driver?

Do you have the no-zero-freq workaround?

> 
> > 
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >> ---
> >>  drivers/gpu/drm/msm/dsi/dsi.h                      |  2 +
> >>  drivers/gpu/drm/msm/dsi/dsi_cfg.c                  | 25 +++++++
> >>  drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |  1 +
> >>  drivers/gpu/drm/msm/dsi/dsi_host.c                 | 80 ++++++++++++++++++++++
> >>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |  2 +
> >>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |  1 +
> >>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          | 78 +++++++++++++++++++--
> >>  .../gpu/drm/msm/registers/display/dsi_phy_7nm.xml  | 14 ++++
> > 
> > Please separate DSI and PHY changes.
> > 
> >>  8 files changed, 197 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> >> index 7754dcec33d06e3d6eb8a9d55e53f24af073adb9..e2a8d6fcc45b6c207a3018ea7c8744fcf34dabd2 100644
> >> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> >> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> >> @@ -205,6 +205,17 @@ static const struct msm_dsi_config sm8650_dsi_cfg = {
> >>  	},
> >>  };
> >>  
> >> +static const struct msm_dsi_config sm8750_dsi_cfg = {
> >> +	.io_offset = DSI_6G_REG_SHIFT,
> >> +	.regulator_data = sm8650_dsi_regulators,
> >> +	.num_regulators = ARRAY_SIZE(sm8650_dsi_regulators),
> >> +	.bus_clk_names = dsi_v2_4_clk_names,
> >> +	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
> >> +	.io_start = {
> >> +		{ 0xae94000, 0xae96000 },
> >> +	},
> >> +};
> >> +
> >>  static const struct regulator_bulk_data sc7280_dsi_regulators[] = {
> >>  	{ .supply = "vdda", .init_load_uA = 8350 },	/* 1.2 V */
> >>  	{ .supply = "refgen" },
> >> @@ -257,6 +268,18 @@ static const struct msm_dsi_host_cfg_ops msm_dsi_6g_v2_host_ops = {
> >>  	.calc_clk_rate = dsi_calc_clk_rate_6g,
> >>  };
> >>  
> >> +static const struct msm_dsi_host_cfg_ops msm_dsi_6g_v2_9_host_ops = {
> >> +	.link_clk_set_rate = dsi_link_clk_set_rate_6g_v2_9,
> >> +	.link_clk_enable = dsi_link_clk_enable_6g,
> >> +	.link_clk_disable = dsi_link_clk_disable_6g,
> >> +	.clk_init_ver = dsi_clk_init_6g_v2_9,
> >> +	.tx_buf_alloc = dsi_tx_buf_alloc_6g,
> >> +	.tx_buf_get = dsi_tx_buf_get_6g,
> >> +	.tx_buf_put = dsi_tx_buf_put_6g,
> >> +	.dma_base_get = dsi_dma_base_get_6g,
> >> +	.calc_clk_rate = dsi_calc_clk_rate_6g,
> >> +};
> >> +
> >>  static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
> >>  	{MSM_DSI_VER_MAJOR_V2, MSM_DSI_V2_VER_MINOR_8064,
> >>  		&apq8064_dsi_cfg, &msm_dsi_v2_host_ops},
> >> @@ -300,6 +323,8 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
> >>  		&sm8550_dsi_cfg, &msm_dsi_6g_v2_host_ops},
> >>  	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_8_0,
> >>  		&sm8650_dsi_cfg, &msm_dsi_6g_v2_host_ops},
> >> +	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_9_0,
> >> +		&sm8750_dsi_cfg, &msm_dsi_6g_v2_9_host_ops},
> >>  };
> >>  
> >>  const struct msm_dsi_cfg_handler *msm_dsi_cfg_get(u32 major, u32 minor)
> >> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> >> index 120cb65164c1ba1deb9acb513e5f073bd560c496..859c279afbb0377d16f8406f3e6b083640aff5a1 100644
> >> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> >> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> >> @@ -30,6 +30,7 @@
> >>  #define MSM_DSI_6G_VER_MINOR_V2_6_0	0x20060000
> >>  #define MSM_DSI_6G_VER_MINOR_V2_7_0	0x20070000
> >>  #define MSM_DSI_6G_VER_MINOR_V2_8_0	0x20080000
> >> +#define MSM_DSI_6G_VER_MINOR_V2_9_0	0x20090000
> >>  
> >>  #define MSM_DSI_V2_VER_MINOR_8064	0x0
> >>  
> >> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> >> index 2218d4f0c5130a0b13f428e89aa30ba2921da572..ced28ee61eedc0a82da9f1d0792f17ee2a5538c4 100644
> >> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> >> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> >> @@ -119,6 +119,15 @@ struct msm_dsi_host {
> >>  	struct clk *pixel_clk;
> >>  	struct clk *byte_intf_clk;
> >>  
> >> +	/*
> >> +	 * Clocks which needs to be properly parented between DISPCC and DSI PHY
> >> +	 * PLL:
> >> +	 */
> >> +	struct clk *byte_src_clk;
> >> +	struct clk *pixel_src_clk;
> >> +	struct clk *dsi_pll_byte_clk;
> >> +	struct clk *dsi_pll_pixel_clk;
> >> +
> >>  	unsigned long byte_clk_rate;
> >>  	unsigned long byte_intf_clk_rate;
> >>  	unsigned long pixel_clk_rate;
> >> @@ -269,6 +278,38 @@ int dsi_clk_init_6g_v2(struct msm_dsi_host *msm_host)
> >>  	return ret;
> >>  }
> >>  
> >> +int dsi_clk_init_6g_v2_9(struct msm_dsi_host *msm_host)
> >> +{
> >> +	struct device *dev = &msm_host->pdev->dev;
> >> +	int ret;
> >> +
> >> +	ret = dsi_clk_init_6g_v2(msm_host);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	msm_host->byte_src_clk = devm_clk_get(dev, "byte_src");
> >> +	if (IS_ERR(msm_host->byte_src_clk))
> >> +		return dev_err_probe(dev, PTR_ERR(msm_host->byte_src_clk),
> >> +				     "can't get byte_src clock\n");
> >> +
> >> +	msm_host->dsi_pll_byte_clk = devm_clk_get(dev, "dsi_pll_byte");
> >> +	if (IS_ERR(msm_host->dsi_pll_byte_clk))
> >> +		return dev_err_probe(dev, PTR_ERR(msm_host->dsi_pll_byte_clk),
> >> +				     "can't get dsi_pll_byte clock\n");
> >> +
> >> +	msm_host->pixel_src_clk = devm_clk_get(dev, "pixel_src");
> >> +	if (IS_ERR(msm_host->pixel_src_clk))
> >> +		return dev_err_probe(dev, PTR_ERR(msm_host->pixel_src_clk),
> >> +				     "can't get pixel_src clock\n");
> >> +
> >> +	msm_host->dsi_pll_pixel_clk = devm_clk_get(dev, "dsi_pll_pixel");
> >> +	if (IS_ERR(msm_host->dsi_pll_pixel_clk))
> >> +		return dev_err_probe(dev, PTR_ERR(msm_host->dsi_pll_pixel_clk),
> >> +				     "can't get dsi_pll_pixel clock\n");
> > 
> > How is this going to work in the bonded DSI mode when DSI1 is being fed
> > by the DSI0 PLL? For existing platforms this is being handled by
> > changing the parents in DT.
> 
> I don't see the problem - you just put different clock as input in DTS?
> 
> Please trim your replies, so we won't need to keep scrolling to figure
> out that there is nothing more to read.
> 
> Best regards,
> Krzysztof

-- 
With best wishes
Dmitry
