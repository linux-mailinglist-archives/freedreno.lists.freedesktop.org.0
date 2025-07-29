Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C55CB14F0B
	for <lists+freedreno@lfdr.de>; Tue, 29 Jul 2025 16:06:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02EE310E296;
	Tue, 29 Jul 2025 14:06:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="AG4TgF2i";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8695010E28F
 for <freedreno@lists.freedesktop.org>; Tue, 29 Jul 2025 14:06:35 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-451d7b50815so36616235e9.2
 for <freedreno@lists.freedesktop.org>; Tue, 29 Jul 2025 07:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753797994; x=1754402794; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=Fn497pBIb31Sx7BbH71sH1wCChN0m96yZl9gFKIrt2U=;
 b=AG4TgF2iM49Su2E4taYqmhOPGf/OVVI8wIWa77d3DxU8s0pKgj6uN3bxYR5WYUec2t
 jakNp+lTbFmGBXOr7VNAD0QmVOcd/RrFXf2ODgJ4TO8hmZqDMHE9GQQdvoQiJNk1Eln4
 OQRfAMw2m/hOBwTkY6cfv8O7PYIXEGgsEp/S3BCahnJ7jI9p71RbcUHf9BLz5FJPZfWM
 /xyUXcW6/wCs7JxZTPcEbNA4QkH7BrJldf0PGgi32zdaEAtmITgQe0aV+nak5Qc49ZxA
 TwaMSFjyo2SeFzInBo3mSDSwC8L+yG+LlYuCy2EH9NynnBoS+R04gNivgHuvkIJOKqFq
 DAhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753797994; x=1754402794;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Fn497pBIb31Sx7BbH71sH1wCChN0m96yZl9gFKIrt2U=;
 b=WuiU8bNLdcz1DZk6UoV6vs79d2gV22yBO0s6KYyE+S3y3577ijfpsRRZX5ctjKtrsx
 1zSULC3Np0eOgXI3jOoZaN8P9GRiYpml2FaUlRo4hCChuTS3kKoWN5s1uUWJ/H8nxBWL
 ieBqoHG5weyJXT0luRy2Wf4YrmAmqQu8Nos6naP+VXxIaPiuhzuPR5XyFwS7DAr7erz1
 eA1LHtUneF6Avml5BW/AN7vci2k9TirhLKS9T1VqVvOmmxk7qNliyc1P7c4VC8hddy58
 pdA611y9Z/3SBXBjkEJAwtpwhxU5sCZZap5HcPuTj0jESAd9VXuiWUWZjubpVeR6u8VY
 rwzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVewscPTLKLOnrLz2s1kmW57uvyiQz6Un35PL/Wolzyr8+hKacl/nBWHzZWfWdbBgn8sgq5yl4KZCI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzEI5sQZDhtlv6J1Ia84Qq+u4vk+ateGnkUQ353jCpC+4OeTlNH
 Vd13pGrtYSgxYYmb8trXNsKvZjSLs0M1myMUcw2w6qsmOeKluDR/KGtLp2VXG6La29c=
X-Gm-Gg: ASbGncsXARcUnE8GaMviRYHBMULD3RPRtrHQ6+RXsw3c/4y9WVQDsWGpwhvOUU4F1lD
 Bnp5q2dq1ow2r0F/mOPkrzI9pYWcfqu4LWKphOowig7/3WZLlT0ZYe1PjdhDe9kL1tAn2xUogqU
 AmB4zN7B6sS7xLyvj6NTrr+TBFuUCTz1TJknWR/2P3fWCf15XVt65ahmQN0nm0n7JxnPyhfKDk6
 Kxl8PkzNZuP97TIyo0Xpa5wvz43kjfXu6osQ7LEwBU2e9JBdaeqrK8if9Eq454lvU2mJI35c6NO
 4Srm7v4X8hW05CEai6AKpZskArWcM6qHS7VNlNIziCt3PBnIwBXChI1detbPa4lyr1swbozvghr
 Lua27yO2l07H6sKNzF0T0n0y0EIktPQR34w3D/03DTCxokRZ54adO114aHFQwAuxue2wdIGNh
X-Google-Smtp-Source: AGHT+IF0jH8WRN0uj1ieZOTFoPYfy4emJn+MHYxU9ZEF0XGbevulltaVbFmdQE5WJDFjaDKAdfUMXQ==
X-Received: by 2002:a05:600c:3e0c:b0:456:18f3:b951 with SMTP id
 5b1f17b1804b1-45892814760mr1387415e9.15.1753797993672; 
 Tue, 29 Jul 2025 07:06:33 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:3ae8:20b:c783:9328?
 ([2a01:e0a:3d9:2080:3ae8:20b:c783:9328])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b78dd6cb0fsm3231780f8f.29.2025.07.29.07.06.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 07:06:33 -0700 (PDT)
Message-ID: <cfbad162-e629-45c9-8436-74bb6fc416f2@linaro.org>
Date: Tue, 29 Jul 2025 16:06:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 16/17] drm/msm/a6xx: Enable IFPC on Adreno X1-85
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-16-9347aa5bcbd6@oss.qualcomm.com>
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
In-Reply-To: <20250720-ifpc-support-v1-16-9347aa5bcbd6@oss.qualcomm.com>
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

On 20/07/2025 14:16, Akhil P Oommen wrote:
> Add the IFPC restore register list and enable IFPC support on Adreno
> X1-85 gpu.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 67 ++++++++++++++++++++++++++++++-
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 15 +++++--
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>   3 files changed, 78 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 70f7ad806c34076352d84f32d62c2833422b6e5e..07fcabed472c3b9ca47faf1a8b3f7cf580801981 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -1343,6 +1343,69 @@ static const uint32_t a7xx_pwrup_reglist_regs[] = {
>   

<snip>

> +
>   static const struct adreno_info a7xx_gpus[] = {
>   	{
>   		.chip_ids = ADRENO_CHIP_IDS(0x07000200),
> @@ -1432,12 +1495,13 @@ static const struct adreno_info a7xx_gpus[] = {
>   		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>   		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
>   			  ADRENO_QUIRK_HAS_HW_APRIV |
> -			  ADRENO_QUIRK_PREEMPTION,
> +			  ADRENO_QUIRK_PREEMPTION | ADRENO_QUIRK_IFPC,
>   		.init = a6xx_gpu_init,
>   		.a6xx = &(const struct a6xx_info) {
>   			.hwcg = a740_hwcg,
>   			.protect = &a730_protect,
>   			.pwrup_reglist = &a7xx_pwrup_reglist,
> +			.ifpc_reglist = &a750_ifpc_reglist,
>   			.gmu_chipid = 0x7050001,
>   			.gmu_cgc_mode = 0x00020202,
>   		},
> @@ -1459,6 +1523,7 @@ static const struct adreno_info a7xx_gpus[] = {
>   		.a6xx = &(const struct a6xx_info) {
>   			.protect = &a730_protect,
>   			.pwrup_reglist = &a7xx_pwrup_reglist,
> +			.ifpc_reglist = &a750_ifpc_reglist,

So far it's stable on a750 so I think can safely add ADRENO_QUIRK_IFPC here aswell.

Neil

<snip>

