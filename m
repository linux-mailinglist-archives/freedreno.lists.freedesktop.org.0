Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67535A03996
	for <lists+freedreno@lfdr.de>; Tue,  7 Jan 2025 09:17:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E97BA10E2F7;
	Tue,  7 Jan 2025 08:17:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Qos4p4PR";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A6DA10E2F7
 for <freedreno@lists.freedesktop.org>; Tue,  7 Jan 2025 08:17:24 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3862ca8e0bbso11553309f8f.0
 for <freedreno@lists.freedesktop.org>; Tue, 07 Jan 2025 00:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736237783; x=1736842583; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=VPvkl9NLmMFO9chBKj0rhtLZ12jNHzyAWJ3EKiBo2Fc=;
 b=Qos4p4PRr0Ac2B5cIkR+xAZHag90dCe5EL5RDVp4NXYEyfw94UpOda5mXvylYopLPH
 1kFMG4VeOLPolN4HcH9reVehnzPt+DfYU81I7cFAIrvqNUlTuBnxTPkwzex9/J841CEP
 +EzblrXAXIopi14ehvatXDvU5N9qQ7AlXBx6ZjWazwZ5MrZ8kS641AxwkZOEM4HicmLm
 f8JccQfYmizgbgiHdAk2O0qIdQE8VynbK7jfCKYfRllp4YLoZE85kNjC6Tx1OXJdo3ly
 rIBhTmT0+yX+LTDRLBIeDvW/CxiKoJNeplJGpS1RY3eFnpYfCYnZEVWHqE//ceDKewiR
 32cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736237783; x=1736842583;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=VPvkl9NLmMFO9chBKj0rhtLZ12jNHzyAWJ3EKiBo2Fc=;
 b=G76qXbdxqr4vpCqqTsnLCJK/eVQwd0+7p8QX6JV1f+jUBFb4y8RzCXTCJzAh7OI0MD
 TvnrTVDGibKlyYKkocTAidVr9Pti6GG/4q8mXR+xuQaa5k4LM0CJMWnoTyo0knoGks/j
 fmmareHUc+RaKIQfMXQSD021QX01ewPAxTt1E41nM/y9PILxzmL4ubGowYBNYHyTdK8N
 29I9iDxb4CGPeTNirsnfTUIUtptDUcC4H2g7uMlg6qVTAZpOjfNpALAYXJ+VSIHw/Zdv
 766Ow5bhbt+WlxuFbOfRq/244INfy7L+HQvWMgw4SId49QAAGw8JrnVE73StuhCoosmR
 44iQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpCWgIL+d3Rt/5UX9oUZLVETmhQK8V300cn2UDi7nLK0H217yd2xtnuUXsEb/9hSptl8LucRmJ2HQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwwSrSZ00c4XpErvOWEgbeuBeAXk5D6eTO/952DV/3dJYrtoDmn
 Mm4g0xz30P3OYCYvZwOh0q7YgA2Prb7A6QAWuD8BVJ0N6pSDc/71tRGyWXoVlPuWInk4OLIn1EG
 i
X-Gm-Gg: ASbGncvDeffU4Fz8mhKtLBqwylCG2acKGhs7jPuvKlnYbl7YJ4m5TLNOH1KvFaq/hI1
 K0KrSE1El0jof1lm/1Os/cvIrti/Q26KPRUzwLUIBsOh3RGtqlKIY5BXuPR3xoU2AUB5GkOBbTv
 JSlGMi+UTcefgCq5BB1nUqkkqBsy9YOYQMqb/6PujtJ1tlnIYzr7vY2azyOtOWFlcbuAAYgvf5U
 zn0/vrWLxyVjjj6Oyqnb9Yq3b05xLqd3Mvp84Ae6HieJqG/+gJoWqbhxnZMMJdmMC/i5lZk7icv
 qXwlAzl8Ot1lX0I2K5s9DNGgavt4ned8Lg==
X-Google-Smtp-Source: AGHT+IEj3mnGDF4IJMWEXYu122nB2ocAcm6lUPn1P5i+p5AsmXkfV/YbZ2y/vsSj6aanKVz9FOlZRQ==
X-Received: by 2002:a5d:5987:0:b0:38a:6929:ffa1 with SMTP id
 ffacd0b85a97d-38a692a0090mr10700443f8f.23.1736237783202; 
 Tue, 07 Jan 2025 00:16:23 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:6d5b:2c82:bc7f:46f6?
 ([2a01:e0a:982:cbb0:6d5b:2c82:bc7f:46f6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c828989sm49811861f8f.18.2025.01.07.00.16.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 00:16:22 -0800 (PST)
Message-ID: <1cb0b1f4-b445-471d-a7e1-660e3b82dacc@linaro.org>
Date: Tue, 7 Jan 2025 09:16:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 0/4] drm/msm/dpu: enable CDM for all supported platforms
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241224-dpu-add-cdm-v1-0-7aabfcb58246@linaro.org>
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
In-Reply-To: <20241224-dpu-add-cdm-v1-0-7aabfcb58246@linaro.org>
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
Reply-To: neil.armstrong@linaro.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 24/12/2024 05:25, Dmitry Baryshkov wrote:
> Enable CDM block on all the platforms where it is supposed to be
> present. Notably, from the platforms being supported by the DPU driver
> it is not enabled for SM6115 (DPU 6.3), QCM2290 (DPU 6.5) and SM6375
> (DPU 6.9)


Can you specify how to validate this ?

Thanks,
Neil

> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Dmitry Baryshkov (4):
>        drm/msm/dpu: rename CDM block definition
>        drm/msm/dpu: enable CDM_0 for all DPUs which are known to have it
>        drm/msm/dpu: enable CDM_0 for SC8280XP platform
>        drm/msm/dpu: enable CDM_0 for X Elite platform
> 
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h  | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h   | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h   | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h   | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h   | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h   | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 2 +-
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   | 2 +-
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 2 +-
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           | 2 +-
>   26 files changed, 26 insertions(+), 4 deletions(-)
> ---
> base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
> change-id: 20241215-dpu-add-cdm-0b5b9283ffa8
> 
> Best regards,

