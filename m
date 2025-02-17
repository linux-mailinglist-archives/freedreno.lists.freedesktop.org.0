Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F00A38430
	for <lists+freedreno@lfdr.de>; Mon, 17 Feb 2025 14:14:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BB0510E1D3;
	Mon, 17 Feb 2025 13:14:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rHe4WxNc";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 599E310E1D3
 for <freedreno@lists.freedesktop.org>; Mon, 17 Feb 2025 13:14:02 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-54298ec925bso5893933e87.3
 for <freedreno@lists.freedesktop.org>; Mon, 17 Feb 2025 05:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739798040; x=1740402840; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vZutIcnMmP6iI6i3LYjXGBl6USSBwuenG5p8HEpR4ZU=;
 b=rHe4WxNcTcCtN5MyjUk/NrJxmwQAF1O8YBPGjxVkfJUW3oYqsrwRsRM2CoR1egus5g
 pxPSYDJed8vjGDzUh2Rr0ZfMRdYjXlN/Lwyep5v69lb7G3gSPYGwprEK/lnp/BYU2n6q
 h87JmiqAnvMNshCGa/QYV5Xq/Ji4gMrwe5q6yXhvWRQswSD6+df7mjumBNQlsVcR9fcu
 FfGeqod7hdT9Etvb/8GVu8ND2Cgme05ZeRtLMo2BNWF/JQA8lSAppKi2+CMy61GxZ3eC
 W5/aykdXhnA9w967Vqxr/vjgnAE1z3a5z0lL408rter3OXYnEw+67+AQXmTF6SSSi/Ys
 AYhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739798040; x=1740402840;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vZutIcnMmP6iI6i3LYjXGBl6USSBwuenG5p8HEpR4ZU=;
 b=AfYBNQucHlkG8oobZM0y0tnu1ZFmahVHOmuLiH3WGvxlyo4H40dhJCmRDaVmfKicju
 y30ss33i50DcKAPBa8vz9Eliw+sXbFWgYc+JTp9p/qX2Dsk2GrQgOjiHN87VxyozgJ89
 NLBdTNMahQsAh59ShzBT6iWPbsoH1/vIf3mXI9OJgbE7NzFN5ZJK2cAZRmfyu15byhdc
 ea4PjlZBoMzkclHJnDWfL84L+wINvjN0uqLGVbRRQvJC7MRpCDwpmXCDc3wiGyTkbgIw
 2QamewD5SS5JEMjHshS51Vp/drZDasJjwHY3NFjWsZ1+ynkzOHYZPpunTzmF1jG7PIyS
 xrQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfEMve5cQCOJ73AoNY9yLHHkUlNL7p5CW8vcP61J5qSfW3Lw0LJdEhF3rj7Kh6aWugJ+mbTcXZltQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwRxd07/LKbWWv/h09ifhGCXaiSvLRGDuSrsztq3RTm5ztXL2mt
 1v8Fl+1I4XW61a5eB7l5yuETefiM4lTSlJJ+7mrJQk89vix6NEMfyQ2CaC9JSac=
X-Gm-Gg: ASbGncsFsJcKit2Mm6wkK+1EKABLU9gIhQSHCQmR8AK7/D25H68KeiG+9QE95iYSAmD
 HEyd6wVvDxXBgx/0oeVKYXHhURdjegALDf60zRzNcAPHFhG2kGkDJQlAo3+28ThpEWL5pYF/96m
 9tlgUYk3wKGmKB0bDQQcnalCGc7FQXPot3eFRrD/DTweAQGltj5hWqInXeVmj9ufIURvZ0ZCZ4s
 5CYrs4+P1T+7J/EenMxBfR022YZVo8IW/BUUgi/uzp9yHuCuf+z6ip9X+hhNAmv8BHB+oNsEWwz
 gpOLdgokOfIZ0oIGWCvjt/PNQg+ixbGrSpzOMw5MGvHohbH/ozkOCOBRrccoU43CzKVPwZU=
X-Google-Smtp-Source: AGHT+IGqa8xFmHNzImtW+A+QLQpzg9FHImgPsXMU8Ep2PbCLqkenGCdKllB7ykd8l9t74TkwpnVpHQ==
X-Received: by 2002:a05:6512:1593:b0:545:85f:6a46 with SMTP id
 2adb3069b0e04-5452fe8fc2amr3163114e87.52.1739798040527; 
 Mon, 17 Feb 2025 05:14:00 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5461f0d74e6sm536349e87.170.2025.02.17.05.13.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 05:14:00 -0800 (PST)
Date: Mon, 17 Feb 2025 15:13:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Marek <jonathan@marek.ca>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH v4 4/4] drm/msm/dsi/phy: Define PHY_CMN_CLK_CFG[01]
 bitfields and simplify saving
Message-ID: <ocxifv24wxghio3gfoychilmmjsxpeypxkzidspoq2e4dor7ja@wc54pryzyjge>
References: <20250217-drm-msm-phy-pll-cfg-reg-v4-0-106b0d1df51e@linaro.org>
 <20250217-drm-msm-phy-pll-cfg-reg-v4-4-106b0d1df51e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-drm-msm-phy-pll-cfg-reg-v4-4-106b0d1df51e@linaro.org>
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

On Mon, Feb 17, 2025 at 12:53:17PM +0100, Krzysztof Kozlowski wrote:
> Add bitfields for PHY_CMN_CLK_CFG0 and PHY_CMN_CLK_CFG1 registers to
> avoid hard-coding bit masks and shifts and make the code a bit more
> readable.  While touching the lines in dsi_7nm_pll_save_state()
> resulting cached->pix_clk_div assignment would be too big, so just
> combine pix_clk_div and bit_clk_div into one cached state to make
> everything simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v4:
> 1. Add mising bitfield.h include
> 2. One more FIELD_GET and DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL (Dmitry)
> 
> Changes in v3:
> 1. Use FIELD_GET
> 2. Keep separate bit_clk_div and pix_clk_div
> 3. Rebase (some things moved to previous patches)
> 
> Changes in v2:
> 1. New patch
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c             | 13 ++++++++-----
>  drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml |  1 +
>  2 files changed, 9 insertions(+), 5 deletions(-)
> 
> @@ -739,7 +741,8 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
>  		u32 data;
>  
>  		data = readl(pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> -		writel(data | 3, pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> +		writel(data | DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL(3),
> +		       pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);

Nit: should this also be using dsi_pll_cmn_clk_cfg1_update() ?

>  
>  		phy_pll_out_dsi_parent = pll_post_out_div;
>  	} else {

-- 
With best wishes
Dmitry
