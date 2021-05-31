Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0294E39677F
	for <lists+freedreno@lfdr.de>; Mon, 31 May 2021 19:57:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89FA16E430;
	Mon, 31 May 2021 17:57:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62B6B6E430
 for <freedreno@lists.freedesktop.org>; Mon, 31 May 2021 17:57:10 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id a4so15961301ljd.5
 for <freedreno@lists.freedesktop.org>; Mon, 31 May 2021 10:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sjGZmsfFp/UOuSzQORD2nudXv9W+sFfiJPaPSogdWlM=;
 b=cBqc5YKm9oxk8wkGFtsy6bmh6Kzc1awzqSTVVxKgBAaJXzcshVY80xBr9QDXTbasz6
 bsR+mpQlkzNf05BAvtdR6YrS2l7cxdC1L/Y1u1ZEJsy+sEmUKQnrox1cH7mvhAEsyNHg
 r8CUY/VpsmZm9SumqUvO4tSTS4lsUnTbEVWWMXIJOiNaymRIus1ldGF35UnpBS9ADzL9
 x1w+ER/ZFHdGbwTfJNlVUeuDPNIFqCl91qmO4fHPzkIi+E+Ij1SqPjOVOlxLv/2Rsw9Q
 aLclZQcpP/dGYufPL7zUagcFnDJdx/dDHEKPzx395wI6P2b5OmvICf28kimOEk7/SD0q
 W09g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sjGZmsfFp/UOuSzQORD2nudXv9W+sFfiJPaPSogdWlM=;
 b=ByJiUzOIJxwrH2LpXe0BxcgYLrnFY4u8k1iju7xgj0xO/HMT3D+gf2vFwV2Eve2rdS
 o42quCo9rYAXR/R3TiUSxvJAZpJdRSBQwVDGn5wwOGZfcULdpgaxooeNt5q4hEuufBM3
 kKGkt8amx9mqrYaz3UUTRiZL5V0kAHXr5a0z+Ak5qHZfOXw+1ozh7WBt++2+Q/44856M
 ZrJBM2olDEGoMyNqFXWqDceTFiKZnPGXFcMSiMvJ4Gm/G752LvGxBKHHLUqzdZOtCrJv
 jBv+u4haOt2JSBRuGM6K58Egoo/6J3LZh3uQDszJtuPzcxwOKha8iNBsJVY/DPklyPBk
 s1Ig==
X-Gm-Message-State: AOAM532Cs0UNJAKkEEo22ehb68loJmAQml3MH45XfUfXpJtAPWJocMpB
 295bgfgxN8mw/aoMFOiqOaTISQ==
X-Google-Smtp-Source: ABdhPJz0MIiGVgSvBAZS9tl8Pnpzl/E1hQI2wkn1dtJaP5RqncKnNMnUbbDm4atWwvJ7AscsHMdI5g==
X-Received: by 2002:a2e:681a:: with SMTP id c26mr9266477lja.306.1622483828860; 
 Mon, 31 May 2021 10:57:08 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id w24sm1408417lfa.143.2021.05.31.10.57.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 May 2021 10:57:08 -0700 (PDT)
To: Rajeev Nandan <rajeevny@codeaurora.org>, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <1622468035-8453-1-git-send-email-rajeevny@codeaurora.org>
 <1622468035-8453-3-git-send-email-rajeevny@codeaurora.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <7a3facb5-d118-f81b-65f8-381b0d56a23b@linaro.org>
Date: Mon, 31 May 2021 20:57:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <1622468035-8453-3-git-send-email-rajeevny@codeaurora.org>
Content-Language: en-GB
Subject: Re: [Freedreno] [v1 2/3] drm/msm/dsi: Add PHY configuration for
 SC7280
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
Cc: mkrishn@codeaurora.org, jonathan@marek.ca, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, robdclark@gmail.com, robh+dt@kernel.org,
 kalyan_t@codeaurora.org, sean@poorly.run
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 31/05/2021 16:33, Rajeev Nandan wrote:
> The SC7280 SoC uses the 7nm (V4.1) DSI PHY driver with
> different enable|disable regulator loads.
> 
> Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
> ---
>   drivers/gpu/drm/msm/Kconfig               |  6 +++---
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |  2 ++
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 22 ++++++++++++++++++++++
>   4 files changed, 28 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> index 10f693e..7c9d9f1 100644
> --- a/drivers/gpu/drm/msm/Kconfig
> +++ b/drivers/gpu/drm/msm/Kconfig
> @@ -114,9 +114,9 @@ config DRM_MSM_DSI_10NM_PHY
>   	  Choose this option if DSI PHY on SDM845 is used on the platform.
>   
>   config DRM_MSM_DSI_7NM_PHY
> -	bool "Enable DSI 7nm PHY driver in MSM DRM (used by SM8150/SM8250)"
> +	bool "Enable DSI 7nm PHY driver in MSM DRM"
>   	depends on DRM_MSM_DSI
>   	default y
>   	help
> -	  Choose this option if DSI PHY on SM8150/SM8250 is used on the
> -	  platform.
> +	  Choose this option if DSI PHY on SM8150/SM8250/SC7280 is used on
> +	  the platform.
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index ff7f2ec..2770783 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -593,6 +593,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
>   	  .data = &dsi_phy_7nm_cfgs },
>   	{ .compatible = "qcom,dsi-phy-7nm-8150",
>   	  .data = &dsi_phy_7nm_8150_cfgs },
> +	{ .compatible = "qcom,dsi-phy-7nm-7280",
> +	  .data = &dsi_phy_7nm_7280_cfgs },
>   #endif
>   	{}
>   };
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> index 94a77ac..bc91dc8 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> @@ -51,6 +51,7 @@ extern const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs;
>   extern const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs;
>   extern const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs;
>   extern const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs;
> +extern const struct msm_dsi_phy_cfg dsi_phy_7nm_7280_cfgs;
>   
>   struct msm_dsi_dphy_timing {
>   	u32 clk_zero;
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index e76ce40..6e30d21 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -998,3 +998,25 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs = {
>   	.io_start = { 0xae94400, 0xae96400 },
>   	.num_dsi_phy = 2,
>   };
> +
> +const struct msm_dsi_phy_cfg dsi_phy_7nm_7280_cfgs = {
> +	.has_phy_lane = true,
> +	.reg_cfg = {
> +		.num = 1,
> +		.regs = {
> +			{"vdds", 37550, 0},
> +		},
> +	},
> +	.ops = {
> +		.enable = dsi_7nm_phy_enable,
> +		.disable = dsi_7nm_phy_disable,
> +		.pll_init = dsi_pll_7nm_init,
> +		.save_pll_state = dsi_7nm_pll_save_state,
> +		.restore_pll_state = dsi_7nm_pll_restore_state,
> +	},
> +	.min_pll_rate = 600000000UL,
> +	.max_pll_rate = (5000000000ULL < ULONG_MAX) ? 5000000000ULL : ULONG_MAX,

Could you please follow the patch by Arnd here? 
https://lore.kernel.org/linux-arm-msm/20210514213032.575161-1-arnd@kernel.org/



> +	.io_start = { 0xae94400, 0xae96400 },
> +	.num_dsi_phy = 2,

Judging from the next patch, you have one DSI host and one DSI PHY. 
Could you please correct io_start / num_dsi_phy here?

> +	.quirks = DSI_PHY_7NM_QUIRK_V4_1,
> +};


With these two issues fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
