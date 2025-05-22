Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F769AC05C7
	for <lists+freedreno@lfdr.de>; Thu, 22 May 2025 09:32:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14E209BF79;
	Thu, 22 May 2025 07:27:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bnAkY0oz";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 302A79A094
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 07:23:13 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-43cf257158fso58401835e9.2
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 00:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747898592; x=1748503392; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=DKcV9YJnik1heDPbiDZhe+461Bkk9PUXYS1vSVg0MNo=;
 b=bnAkY0ozx2JD7KKOiwdOjPS8CSz+CdFAAwAa68PfTbTr7F/H2a2SLC0geoIH7wtgRG
 ey7o7YqCa8+WmzkIj1u8ZXPFUt9Hejzd/IDj9UODGNk1T6SoWH+TuO51QKWkTGd6iN3g
 j0/BWXzWWYshtPHq87XUrLKTPcNdKh+VPlntz9zCchQL6H3AVVGIRzfHHqceK5xIeN6U
 68nWAPKSeNixMIpjxsc5sbb2tz8HbfpDrArl14e0Uoou2tMqeCzyITOK+RM4SXSxiLo0
 cWg0yLUQDUtiRqNrC+qmcSXVLbMTSILOFvkNh1OLsxRE+QDtOOk+oEArnw034MMMOA/m
 eyLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747898592; x=1748503392;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=DKcV9YJnik1heDPbiDZhe+461Bkk9PUXYS1vSVg0MNo=;
 b=upU/bU7m8MmJDKMNVELn708fnekSsLN1KSIcefzrrFuuNv7y3IDP6b83eIP/sKDsUB
 ku97bxt+Je4X4kHxHzmbqR82kkPx67XCBP3ExgoSrX4PSCSeck6Pn5DIBEbuAXF4L0Gk
 9a+HtLCXri3ufvhDIrJsI/VrBeim2L/KDkE6VqzO1+debsscWQ9FZcAT9B9OxyGWDl7d
 6sGiIeWZUU8AEe9/m7YSuFk2MP49CrOObexYXp9z5mF2V2hVHxfF4pPil+HeVj9M6Gjw
 irHM42Msp9toQjq6slWrUiOw3WHDEu9IuSHXwCoek3bbCk7xk+xXuql4A1yXkOmL6HEG
 rhlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNF7O+Q5BVqlrRIwR3Ta9YmM+2LNGRSrBxxoxbz6qY4QxXda9snUAQ/pg9mGocsJ2bRY6dza0yKMs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyDT3YXE+2HX/CD2pvQcGex+QwMZhfYQhU1kHqkoHtNVZ+qApWK
 5ZKj70LpMZvMVLVnUI3SUFjJLtFkOJeXfUuBkgF4rIoa3zgJLA7ryxvdfWym/87p7/M=
X-Gm-Gg: ASbGnctxy8eSKoCaV/5pzbS8mc+ir1F91+RYu+kTGmP/5QkPaPDo5U8q0dFZ16gDVd4
 zr/oEM4lnLwS/6m2GqKxNPRh+KxZutXxxyZwBz8amJU/AqpTRwaTYxwk6ioT1g50QTDPx68ewcP
 Pk5kTDSNtjrb4brh9C+Geja3JzCJwRK9LosL2+MHF0QV8eg9LWptg9IYtwfBji/NbmDjqYznIJM
 odnJ9Wxl+nDqphr9fv4R4yfMdtrGq61Tf96HByRoVHs9Fo9fBzDE0s/PCALasytP1myqKX3o6p+
 /QOv7yjOzAnGFoX+7wqDbsmCJRhLQCjmk4wt5ko+aSJ6O/o5z8Jofjr2n1WR/WHynTYo9XHAN6Z
 5bdiFLW1Y+UXo8gXq/WDvGFKgmhW+
X-Google-Smtp-Source: AGHT+IHts0eteY4PlR1SQN/PyYMswWNwfgjzZcpYKjCK25ZDntVHx3kCGx8YLO7OAaDj+8ppdM5vmg==
X-Received: by 2002:a05:600c:548d:b0:442:f44f:678 with SMTP id
 5b1f17b1804b1-442ff03c63emr240517275e9.31.1747898591652; 
 Thu, 22 May 2025 00:23:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:ca6a:4d93:cd32:83a5?
 ([2a01:e0a:3d9:2080:ca6a:4d93:cd32:83a5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f3dd94f1sm97174725e9.35.2025.05.22.00.23.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 May 2025 00:23:11 -0700 (PDT)
Message-ID: <fa65b2bf-b76e-428a-8110-325a6191752e@linaro.org>
Date: Thu, 22 May 2025 09:23:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v4 2/5] phy: qcom: apq8064-sata: extract UNI PLL register
 defines
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-phy@lists.infradead.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250520-fd-hdmi-phy-v4-0-fcbaa652ad75@oss.qualcomm.com>
 <20250520-fd-hdmi-phy-v4-2-fcbaa652ad75@oss.qualcomm.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20250520-fd-hdmi-phy-v4-2-fcbaa652ad75@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 20/05/2025 22:44, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> The "uni" PLL is shared between several PHYS: APQ8064's SATA,
> MSM8974/APQ8084 HDMI, MSM8916 DSI, MSM8974/APQ8084 DSI.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/phy/qualcomm/phy-qcom-apq8064-sata.c | 23 +-------------------
>   drivers/phy/qualcomm/phy-qcom-uniphy.h       | 32 ++++++++++++++++++++++++++++
>   2 files changed, 33 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c b/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c
> index cae290a6e19fcb7fd68fe6cd0229b9b00d47131c..dd9929429f9a0e2f265180e8d3f390451d91adde 100644
> --- a/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c
> +++ b/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c
> @@ -15,28 +15,7 @@
>   #include <linux/platform_device.h>
>   #include <linux/phy/phy.h>
>   
> -/* PHY registers */
> -#define UNIPHY_PLL_REFCLK_CFG		0x000
> -#define UNIPHY_PLL_PWRGEN_CFG		0x014
> -#define UNIPHY_PLL_GLB_CFG		0x020
> -#define UNIPHY_PLL_SDM_CFG0		0x038
> -#define UNIPHY_PLL_SDM_CFG1		0x03C
> -#define UNIPHY_PLL_SDM_CFG2		0x040
> -#define UNIPHY_PLL_SDM_CFG3		0x044
> -#define UNIPHY_PLL_SDM_CFG4		0x048
> -#define UNIPHY_PLL_SSC_CFG0		0x04C
> -#define UNIPHY_PLL_SSC_CFG1		0x050
> -#define UNIPHY_PLL_SSC_CFG2		0x054
> -#define UNIPHY_PLL_SSC_CFG3		0x058
> -#define UNIPHY_PLL_LKDET_CFG0		0x05C
> -#define UNIPHY_PLL_LKDET_CFG1		0x060
> -#define UNIPHY_PLL_LKDET_CFG2		0x064
> -#define UNIPHY_PLL_CAL_CFG0		0x06C
> -#define UNIPHY_PLL_CAL_CFG8		0x08C
> -#define UNIPHY_PLL_CAL_CFG9		0x090
> -#define UNIPHY_PLL_CAL_CFG10		0x094
> -#define UNIPHY_PLL_CAL_CFG11		0x098
> -#define UNIPHY_PLL_STATUS		0x0C0
> +#include "phy-qcom-uniphy.h"
>   
>   #define SATA_PHY_SER_CTRL		0x100
>   #define SATA_PHY_TX_DRIV_CTRL0		0x104
> diff --git a/drivers/phy/qualcomm/phy-qcom-uniphy.h b/drivers/phy/qualcomm/phy-qcom-uniphy.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..e5b79a4dc270f25d8979f51bf4acd6c76998032e
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-uniphy.h
> @@ -0,0 +1,32 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2014, The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef PHY_QCOM_UNIPHY_H
> +#define PHY_QCOM_UNIPHY_H
> +
> +/* PHY registers */
> +#define UNIPHY_PLL_REFCLK_CFG		0x000
> +#define UNIPHY_PLL_PWRGEN_CFG		0x014
> +#define UNIPHY_PLL_GLB_CFG		0x020
> +#define UNIPHY_PLL_SDM_CFG0		0x038
> +#define UNIPHY_PLL_SDM_CFG1		0x03c
> +#define UNIPHY_PLL_SDM_CFG2		0x040
> +#define UNIPHY_PLL_SDM_CFG3		0x044
> +#define UNIPHY_PLL_SDM_CFG4		0x048
> +#define UNIPHY_PLL_SSC_CFG0		0x04c
> +#define UNIPHY_PLL_SSC_CFG1		0x050
> +#define UNIPHY_PLL_SSC_CFG2		0x054
> +#define UNIPHY_PLL_SSC_CFG3		0x058
> +#define UNIPHY_PLL_LKDET_CFG0		0x05c
> +#define UNIPHY_PLL_LKDET_CFG1		0x060
> +#define UNIPHY_PLL_LKDET_CFG2		0x064
> +#define UNIPHY_PLL_CAL_CFG0		0x06c
> +#define UNIPHY_PLL_CAL_CFG8		0x08c
> +#define UNIPHY_PLL_CAL_CFG9		0x090
> +#define UNIPHY_PLL_CAL_CFG10		0x094
> +#define UNIPHY_PLL_CAL_CFG11		0x098
> +#define UNIPHY_PLL_STATUS		0x0c0
> +
> +#endif
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
