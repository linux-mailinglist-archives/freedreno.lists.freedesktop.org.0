Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE513ABD15E
	for <lists+freedreno@lfdr.de>; Tue, 20 May 2025 10:05:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8855210E4A3;
	Tue, 20 May 2025 08:05:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pt6wvBWD";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 590C810E49A
 for <freedreno@lists.freedesktop.org>; Tue, 20 May 2025 08:05:13 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-442ec3ce724so43225095e9.0
 for <freedreno@lists.freedesktop.org>; Tue, 20 May 2025 01:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747728312; x=1748333112; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=5GL9/WVnDzCRjHM7KCqjvky6ly317+0xsVdOQlS6d90=;
 b=pt6wvBWDVDo6lVx+bZWclhkhDaujbI+/21s260WBcN7FBO+ncjpSTdwiU/+wt+ufNp
 Q2tZcL5gTCEd5tuhPC5zcwnVTrMNONzgrzLmTGYjlXEYoICQX4R4lGoL8rgYG0T9RzDs
 4lkILq036Ra4UK4963dMnWTLcFHj26Vb2s9rFWg2f9Z014cVwdUKesHtmVwlw6RU8YXv
 joZY3BdmbfPG0yyDXP0Ibt6JLcNI3gLPdq3EVQq+Rq2VzdmJsZWxmxvEn5mGN777RcRG
 3kLKBBE6ZXM/KEdHr9Z1HxPVWnUzv+w56dC7ifKBQQ6p0W41VE3EJlfXGF+0ppHCR2hV
 yVaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747728312; x=1748333112;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=5GL9/WVnDzCRjHM7KCqjvky6ly317+0xsVdOQlS6d90=;
 b=J5oX9a63XJ/MHWkPGeFDldEnqc9aC+Lh8WSHalT+eMBeX1afrdjSHLRe0v2dJ0HZz7
 V/WdErYnhkAqOgd+d/4NGx4HUqRQQ2V4S0Cgh4TB4pNfoR37FJt/8f5vUeSBTnTPoXBJ
 gvHiXavZCJUdaCGbAC2bgL7ypNg010ZyRply6LBAu+yHUKSVxVtOD4yteSt3WiypP7CW
 Yr2VdZKsKgYBE/WF/KCI6mYpyulgurkzDmPoUQx5x3JRP2mx4C9be/9gFChiwi05lbiY
 iqZ/shE439ytjHrDihd5Va1fuDcNl1Dgc0xUYm+4jSxrcrCUMAtTX4LA/NiMKD63oo+h
 wGiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUftFT2aTSMRePL6fAfCm/Qgf87UT31cqJYyBV8eYd8jO8dXa0EpywKoken5drcjYE4C1gbgOioUWw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwC+PWTQBQjTAQFHN1VcDYjXmt5jesgko74tyNFVN3Ak7YbBH/L
 dNlQkJvLQoj9zBxixFr7QVbVDPPkmSmmBM5Aim9Pod7wCCK8t0u/WXnIxgcYx3mcJ1k=
X-Gm-Gg: ASbGncsPGqTKx9xzz2hoBEyIprA2KQjfotz2ZaKvJocWJFCq0vtQJdl26ug4C9bdqcH
 y8eOKyGrh/1YzeD01wBrweWKenq3vrmS8hElBzICkmK90t0/p2SxaZqH27Poqk5lPnE+Ps1jpM0
 dZShaXzP5O6AtBtle05VfLwCavomYmERkVK4SAT5jj+gey9R+spHbm/wmsaRQCfktvuyF1FXU6R
 1cyYh63aUecKzxIvDJem0qP6xNJ4V5h6xv8v5OgmWe8TjUe7+wPPI0tQ7FFxwh6UDFjs71TaHMe
 whSE7LwpXo/gcTxI3WG+y0bPbYVYxefhzg+wZ+Yy/ghTa6SymiYB081Z5hdAnkp0B2rpAXPJar6
 kIiVM8cO8imbXQ5pAYQ9/g5ZwkTHA
X-Google-Smtp-Source: AGHT+IGP1iT2KS7C1jAAS9avfiRYegZAXZJbq43ThFN2fqZehYB3eN8S1ivyCQg/LLIAvxsCPpLRRg==
X-Received: by 2002:a05:600c:3f06:b0:43b:ca39:6c75 with SMTP id
 5b1f17b1804b1-442fd63c7aemr176158525e9.16.1747728311950; 
 Tue, 20 May 2025 01:05:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68?
 ([2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca88990sm15825687f8f.68.2025.05.20.01.05.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 01:05:11 -0700 (PDT)
Message-ID: <7142ab55-9173-431a-98fb-a78acf0e5ddb@linaro.org>
Date: Tue, 20 May 2025 10:05:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v4 27/30] drm/msm/dpu: drop unused MDP TOP features
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
 <20250519-dpu-drop-features-v4-27-6c5e88e31383@oss.qualcomm.com>
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
In-Reply-To: <20250519-dpu-drop-features-v4-27-6c5e88e31383@oss.qualcomm.com>
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
> Drop unused MDP TOP features from the current codebase.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 13 -------------
>   1 file changed, 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index c582ef1ffe022f2e92b1b80cbab97ff41a2acfe9..9658561c4cb653ca86094d67f7b5dc92d36d38cd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -28,19 +28,6 @@
>   
>   #define MAX_XIN_COUNT 16
>   
> -/**
> - * MDP TOP BLOCK features
> - * @DPU_MDP_PANIC_PER_PIPE Panic configuration needs to be done per pipe
> - * @DPU_MDP_10BIT_SUPPORT, Chipset supports 10 bit pixel formats
> - * @DPU_MDP_MAX            Maximum value
> -
> - */
> -enum {
> -	DPU_MDP_PANIC_PER_PIPE = 0x1,
> -	DPU_MDP_10BIT_SUPPORT,
> -	DPU_MDP_MAX
> -};
> -
>   /**
>    * SSPP sub-blocks/features
>    * @DPU_SSPP_SCALER_QSEED2,  QSEED2 algorithm support
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
