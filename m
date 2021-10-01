Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3181241F793
	for <lists+freedreno@lfdr.de>; Sat,  2 Oct 2021 00:44:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 463226E59D;
	Fri,  1 Oct 2021 22:44:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BBBE6E5A9
 for <freedreno@lists.freedesktop.org>; Fri,  1 Oct 2021 22:44:41 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id y26so44454930lfa.11
 for <freedreno@lists.freedesktop.org>; Fri, 01 Oct 2021 15:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Hyp8rNNNxhnx5usv5qotyjNm77T/YbCfuFJQXDZjm3c=;
 b=LEPUccLyJKnO/BgxSMsvSUj35HCuvuikhLC2YvuLl0jbh4rkra5+FjPhTH0OldVFY0
 p53mOk4WghDtxRZTz2ynhwx4yxm1w/IvCoyyuqM9nsbBvlDwH6y00FZPTbDgHZD1OaWK
 XDl0uC5I4gsOoqgkvNBqn4LjvLbfKbnEbejY8JgwJhwm3itjWyIktd9A5YjrtSC0gy/X
 XQlM8MO9tNQ+7SlKWPgDw260KjYbUeM5IZmNWQcCgU3JMZwrZIfwDBdLZH5RjuSDolhQ
 jqKpGuNa7JQp4jyGTJvs6OnZ4LZaGgwCw2+wocIkEIhRiDB4eYQDt3gGYOaJNeRZ6i7r
 8V1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Hyp8rNNNxhnx5usv5qotyjNm77T/YbCfuFJQXDZjm3c=;
 b=TNOM5r8x4Rh+AvgPxOcLUe88fp2zj8oVJ2kqYP2rBeHtxRmaTM+rqbLtrXWY366CqO
 /wkX0VjGhAg/iMXl3LLAJBt4Ty5mwuMXeUMxFV7WH2xfXYfNjAYaAiW/F4jrwfBdW/Q8
 Go/JNPyqly9IZ89TEXZNgZ4TPlTq0JnJkDWD/xXqubKOMOB5f7NemkVAiGlX5rdRpAlf
 qdAP0xNy7OwWLldrFgi1D7TbQOh+WK5hfR5WCTcPtWw9vmRp1Lk7bRhjxibXZh4qddpn
 FRwhnKfINVUDonZePLsmCIjMfq5AnsWBm+AkAiXIyh3dWN5mBAG6MQIFd5y9/Yi6LRoG
 MVJg==
X-Gm-Message-State: AOAM5308xj2al/pJ9WRYxqp/eG3VGSPSpRwosVFxmwLuiFQ9SXrWx8J3
 5SImpq0AtX8JmrOmPa48xR/NIg==
X-Google-Smtp-Source: ABdhPJyA1oFgS9X9yRcyXvH/zXNSgT0lDX4E6n03krWyg15pFA2D/72tYTF5y0tv2tQwK4EqFrtI4Q==
X-Received: by 2002:a2e:5453:: with SMTP id y19mr501616ljd.247.1633128279396; 
 Fri, 01 Oct 2021 15:44:39 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id o12sm865329lft.254.2021.10.01.15.44.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Oct 2021 15:44:39 -0700 (PDT)
To: Tim Gardner <tim.gardner@canonical.com>, dri-devel@lists.freedesktop.org
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Abhinav Kumar <abhinavk@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20210929175134.15808-1-tim.gardner@canonical.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <2f625866-89d0-3bc7-2618-2e01884d003d@linaro.org>
Date: Sat, 2 Oct 2021 01:44:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210929175134.15808-1-tim.gardner@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] drm/msm/dsi: prevent unintentional integer
 overflow in dsi_pll_28nm_clk_recalc_rate()
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

On 29/09/2021 20:51, Tim Gardner wrote:
> Coverity warns of an unintentional integer overflow
> 
> CID 120715 (#1 of 1): Unintentional integer overflow (OVERFLOW_BEFORE_WIDEN)
> overflow_before_widen: Potentially overflowing expression ref_clk * sdm_byp_div
>    with type unsigned int (32 bits, unsigned) is evaluated using 32-bit arithmetic,
>    and then used in a context that expects an expression of type unsigned long
>    (64 bits, unsigned).
> To avoid overflow, cast either ref_clk or sdm_byp_div to type unsigned long.
> 263                vco_rate = ref_clk * sdm_byp_div;
> 
> Fix this and another possible overflow by casting ref_clk to unsigned long.

Changing ref_clk from u32 to unsigned long would be a more simple and 
elegant way of fixing this issue. Could you please update your patch?

> 
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Abhinav Kumar <abhinavk@codeaurora.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Tim Gardner <tim.gardner@canonical.com>
> ---
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> index 2da673a2add6..cfe4b30eb96d 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> @@ -260,7 +260,7 @@ static unsigned long dsi_pll_28nm_clk_recalc_rate(struct clk_hw *hw,
>   		sdm_byp_div = FIELD(
>   				dsi_phy_read(base + REG_DSI_28nm_PHY_PLL_SDM_CFG0),
>   				DSI_28nm_PHY_PLL_SDM_CFG0_BYP_DIV) + 1;
> -		vco_rate = ref_clk * sdm_byp_div;
> +		vco_rate = (unsigned long)ref_clk * sdm_byp_div;
>   	} else {
>   		/* sdm mode */
>   		sdm_dc_off = FIELD(
> @@ -274,7 +274,7 @@ static unsigned long dsi_pll_28nm_clk_recalc_rate(struct clk_hw *hw,
>   		sdm_freq_seed = (sdm3 << 8) | sdm2;
>   		DBG("sdm_freq_seed = %d", sdm_freq_seed);
>   
> -		vco_rate = (ref_clk * (sdm_dc_off + 1)) +
> +		vco_rate = ((unsigned long)ref_clk * (sdm_dc_off + 1)) +
>   			mult_frac(ref_clk, sdm_freq_seed, BIT(16));
>   		DBG("vco rate = %lu", vco_rate);
>   	}
> 


-- 
With best wishes
Dmitry
