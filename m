Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBE5ABD113
	for <lists+freedreno@lfdr.de>; Tue, 20 May 2025 09:55:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A4A710E3EE;
	Tue, 20 May 2025 07:55:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xA+ZrkSJ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C77BA10E3EE
 for <freedreno@lists.freedesktop.org>; Tue, 20 May 2025 07:55:27 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-43cfdc2c8c9so31033115e9.2
 for <freedreno@lists.freedesktop.org>; Tue, 20 May 2025 00:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747727726; x=1748332526; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=X/91CV36lhWSMa7DnLmiKN1QMOc9a/+D1E7HUJkTqJs=;
 b=xA+ZrkSJ/6gwBqMBQDsMowNlzMwvQEVJoxHciMydQzyzVN1LHhxlH3NXQHLtDeJK/f
 W+DC1t1Ywg+uYWV/gmtWkwSKY+09j3U7kwfqocok6W5KX/e9XRQcdk8JPEYtzEl7/heb
 1Y1kX2x71lo7X5OZWRhEfpyeZZUTBWrhV1JpkPVpRSi7WlQgMtqajIjDLBsBH6taagVS
 8O7lsuK904Yazj0N8jYOPgrp4Qqf3hz52PmlfaCch/iKhgC0vZvdkipJII4QqJzjXnUK
 RKok0hYQGnmn7qOu+x/H+DYEaC67mfuDsi1A/xu6gScMWNl9+fxQMe7YcEhbWqOB79xt
 jXPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747727726; x=1748332526;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=X/91CV36lhWSMa7DnLmiKN1QMOc9a/+D1E7HUJkTqJs=;
 b=ocKfd+rOhdIRShZN6zV8Gp9azaSW4KCywYGcs+Rngco4iq5i6Kc1W5+EU+SXEKklIq
 2jNr9UAIfr0kWaXFozPW6E4q73iGTWA2LDLwvul0fztKCvpJE3NdbRN4Fy4ZaQizZyRl
 YY5H7f71O4o6nOywcA/wl41+EBhRb1XRo/AATE8Nob2Zp+7UxRkZef9IFpX3WvuIFhQr
 PC4j1xefo2d8Q9QfrbV+IicqxuMiAx9ZZg6n0zmFno9cqYyhTUPxcJGpFU2phJtCv3Z1
 ZI0s1H9XKQZKGb/o4XvcGicFk2IifMtKB4Xcj9+3y7rGySbq35OEd+7/G0S4liWA4x8Y
 vBSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxnZGAZD30Zvlb088z5OmmpdqinXBmGUQunF7/oFXld5bbaQyhZnd9pnuJgpcli2ATQYQNOUJ+q3A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzi71Pnky0vPhmdQUKDUffTC7vIokrBbWdV/SWfIs0GI8hE9QZp
 avZ0Bp+ptyKQOqMQrtochC2ICX1y52tJHngUwQrEg+6vC8e2E7buQ+3BbkgohTRRVGA=
X-Gm-Gg: ASbGncuPiFXvrTWjksjj758uojzhbs7ywJvDQUuM0iQ6E4EbaoXEARE64utynHfcPNb
 k3NoUE9cRSX/oRWCVQFTSnlm+o2zUYTaGnHgZNm8iq3yP/a0LgBYoZjJq4Q2hTVMo/cvEU+6LBP
 6vaRz6KIQJvFreOenXD1KDz1trs3pAHNW7IopE02kGreWvDUCjSs2ksUZIGN4Da1ZAAYSNaPtx+
 vJz+LDzWhuzPZlIEUQWQeqMj32sLoL7c3j10I0c5QcLbsbmi63pq8eeisrs25dlq2Dyqw1zpAqu
 vl5qUNPhN87pOD8qTq/4MeUjCoiZg1/yJJkJ8y+79Ua8zGG6dXa1XYwGztQLWSYMrrsl7EoeUSK
 GvDW9GuYzABoiR9VNz1+Lkn19Zoty
X-Google-Smtp-Source: AGHT+IHiP9p0pMnINp+zOOCG2xIhzXGtK4f+L4qc0kXeiXT6jf7iR2L43L5NIrkZb6FA+7O1ROagIA==
X-Received: by 2002:a05:600c:4e42:b0:43c:e70d:4504 with SMTP id
 5b1f17b1804b1-442fd64dfccmr148303465e9.19.1747727726305; 
 Tue, 20 May 2025 00:55:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68?
 ([2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca6265fsm15199006f8f.43.2025.05.20.00.55.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 00:55:26 -0700 (PDT)
Message-ID: <5b9678d8-c2df-4afa-8d65-4b9d8a1d8071@linaro.org>
Date: Tue, 20 May 2025 09:55:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v4 14/30] drm/msm/dpu: get rid of DPU_INTF_STATUS_SUPPORTED
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
 <20250519-dpu-drop-features-v4-14-6c5e88e31383@oss.qualcomm.com>
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
In-Reply-To: <20250519-dpu-drop-features-v4-14-6c5e88e31383@oss.qualcomm.com>
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

On 19/05/2025 18:04, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Continue migration to the MDSS-revision based checks and replace
> DPU_INTF_STATUS_SUPPORTED feature bit with the core_major_ver >= 5
> check.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c    | 3 +--
>   3 files changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 1244dd59648d11123c507a1369f28f952d047fd5..4482f2fe6f04e58408b55994d885ea1c717c6a07 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -105,8 +105,7 @@
>   	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
>   
>   #define INTF_SC7180_MASK \
> -	(BIT(DPU_INTF_INPUT_CTRL) | \
> -	 BIT(DPU_INTF_STATUS_SUPPORTED))
> +	(BIT(DPU_INTF_INPUT_CTRL))
>   
>   #define WB_SDM845_MASK (BIT(DPU_WB_LINE_MODE) | \
>   			 BIT(DPU_WB_UBWC) | \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index bf6b2392efb47fa8c3e3c5d17f1a72341872e18b..e1c6df3a3b72ffb5a816bd18266a35abe723fbd9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -143,12 +143,10 @@ enum {
>    * INTF sub-blocks
>    * @DPU_INTF_INPUT_CTRL             Supports the setting of pp block from which
>    *                                  pixel data arrives to this INTF
> - * @DPU_INTF_STATUS_SUPPORTED       INTF block has INTF_STATUS register
>    * @DPU_INTF_MAX
>    */
>   enum {
>   	DPU_INTF_INPUT_CTRL = 0x1,
> -	DPU_INTF_STATUS_SUPPORTED,
>   	DPU_INTF_MAX
>   };
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index 8f9733aad2dec3a9b5464d55b00f350348842911..54c2e984ef0ce604e3eda49595d2816ea41bd7fd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -308,9 +308,8 @@ static void dpu_hw_intf_get_status(
>   		struct dpu_hw_intf_status *s)
>   {
>   	struct dpu_hw_blk_reg_map *c = &intf->hw;
> -	unsigned long cap = intf->cap->features;
>   
> -	if (cap & BIT(DPU_INTF_STATUS_SUPPORTED))
> +	if (intf->mdss_ver->core_major_ver >= 5)
>   		s->is_en = DPU_REG_READ(c, INTF_STATUS) & BIT(0);
>   	else
>   		s->is_en = DPU_REG_READ(c, INTF_TIMING_ENGINE_EN);
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
