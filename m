Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 514513606D4
	for <lists+freedreno@lfdr.de>; Thu, 15 Apr 2021 12:12:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DAF16EA1C;
	Thu, 15 Apr 2021 10:12:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1451A6E165
 for <freedreno@lists.freedesktop.org>; Thu, 15 Apr 2021 10:12:14 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id x19so7913218lfa.2
 for <freedreno@lists.freedesktop.org>; Thu, 15 Apr 2021 03:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Itx3xIB4vBXowgO5rVjeZp8XNY2n0XOetykFhl9hWow=;
 b=L4fOI3m5jedVmkoFqF4OMT0LKDappFVqesZYHY7CyLNRuknzo5hrAxbWLpeGBofHFn
 Kgi0cDatOkL0X14/u+gkYo0Sh4vlxHKlBWQaxNeOJ+GXhl2tfO0H2GiMYt3fa4Kq5CNK
 KtMdewT7N/e18vas4p77Xz9KempXtugzcD2n3d+1GKgWMuikghC5X7qXiO2hndzROTkl
 AbyGXbKsJZfKp3DuECU0TkgNr9AarbWV2v3aY+Gu508bQ8OnJwnBNbY6zNs9V5vUnRKq
 lfBwkYiaA7oTAFACrnnz4TpJpz1Kc2GsRFtI1wFHdA4wVfQYX7USAonbG5wtxlSu96/z
 5Ubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Itx3xIB4vBXowgO5rVjeZp8XNY2n0XOetykFhl9hWow=;
 b=Ukm3eN6oTa4sA6aCg9RE2otHA7ugLeDuRXg93Bvd0apz7Jsn6fF/nnwoLiD5tOrSkU
 iTH82SWpMS2mMGZ7nZODibGDAMrtFo8/pyfGa7iOK2J+lfgJXdYVwbCOR/LazHP/hPLO
 f2jMmw6QIzLiSGpXyz/6V1XeHb8DtAIvCSSVERcS8lrWiEo7C54SJwCK/vigRdrpjvef
 v85w/cGxEz5Z29X9PPVCAGjBuG7SXbOqoi4xkzc47+Cbwc8UZgiOGZCmwW331iQltz95
 vGgKw/cA/IvwyrmZdifm6GKUf3+MuQeUg4VVXmg7PK2/8uR6Vyh4pUVrosd1DLZ5XkaQ
 bgXw==
X-Gm-Message-State: AOAM533rNsKCN8wIbD5BDgcAcLhKZ1drJgg5BvWxqclF8PpY/Lv9l/He
 /Algoqq6e2fSDi/j10aXMvL9/q78pGt7Wg==
X-Google-Smtp-Source: ABdhPJyD6Rs7jiUdmupgDiq3XJMVdCt6DZ+cyVt1/xewJXMALCuiphmTOBBn8HXbou8s2wx72Ft2Cw==
X-Received: by 2002:a05:6512:3ba9:: with SMTP id
 g41mr2115337lfv.38.1618481532082; 
 Thu, 15 Apr 2021 03:12:12 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id c23sm623400lfc.300.2021.04.15.03.12.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Apr 2021 03:12:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>
References: <20210412000158.2049066-1-dmitry.baryshkov@linaro.org>
Message-ID: <b752d929-7f8c-6396-85a3-6b32c77121ca@linaro.org>
Date: Thu, 15 Apr 2021 13:12:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210412000158.2049066-1-dmitry.baryshkov@linaro.org>
Content-Language: en-GB
Subject: Re: [Freedreno] [PATCH] drm/msm/dsi: fix
 msm_dsi_phy_get_clk_provider return code
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi

On 12/04/2021 03:01, Dmitry Baryshkov wrote:
> msm_dsi_phy_get_clk_provider() always returns two provided clocks, so
> return 0 instead of returning incorrect -EINVAL error code.
> 
> Fixes: 5d13459650b3 ("drm/msm/dsi: push provided clocks handling into a generic code")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I wanted to ping/remind regarding this patch and regarding 
https://lore.kernel.org/linux-arm-msm/20210410011901.1735866-1-dmitry.baryshkov@linaro.org/

It would be great to get those two fixes in linux-next or early during 
5.14 cycle.

> ---
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index f0a2ddf96a4b..ff7f2ec42030 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -843,7 +843,7 @@ int msm_dsi_phy_get_clk_provider(struct msm_dsi_phy *phy,
>   	if (pixel_clk_provider)
>   		*pixel_clk_provider = phy->provided_clocks->hws[DSI_PIXEL_PLL_CLK]->clk;
>   
> -	return -EINVAL;
> +	return 0;
>   }
>   
>   void msm_dsi_phy_pll_save_state(struct msm_dsi_phy *phy)
> 


-- 
With best wishes
Dmitry
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
