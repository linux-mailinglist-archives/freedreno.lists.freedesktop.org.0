Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50135B10DE8
	for <lists+freedreno@lfdr.de>; Thu, 24 Jul 2025 16:44:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01D4810E95D;
	Thu, 24 Jul 2025 14:44:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="C2mS9dZF";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85F2610E034
 for <freedreno@lists.freedesktop.org>; Thu, 24 Jul 2025 14:44:12 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-45617887276so7477235e9.2
 for <freedreno@lists.freedesktop.org>; Thu, 24 Jul 2025 07:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753368251; x=1753973051; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=h61dAcV4h+YntxpGoUH8VGIIIUvkHb2+OkdP23t55x8=;
 b=C2mS9dZFk5cvIJKwbaIVnxjAgiSZfBZYFJjt8zoDByL7vdYigJI6Dw9du2R+9aMsxS
 WpGng/bfwnw246ejfpX5PaN1dZSDDz8FebUnJV+Ma/AaZWxPPfB627W4/U+GySRHfWTr
 Iw5XVeYaeWsGPzDBEM+zyoDbh7/szzQyFycwDlk7fsxYcE0pV0bFF26OIeDdJBvmAzoj
 dRWB49c5DhP159xQgCITHBnYC0d6zEEZx3Ms2QeYTYZ2jBPSP4WDatNEfaLJsS1pVl4O
 pDjYBbi/sve6Ygz3yjGFrA+DWjR6nA7YPHDdl7pvPaU9ESewBDca3T7Tpc6sMGgSdhQV
 xY3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753368251; x=1753973051;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=h61dAcV4h+YntxpGoUH8VGIIIUvkHb2+OkdP23t55x8=;
 b=hWsze2yrgpSxa8z4Nlg1oCnAf51/DSfraB4Ep2PO0E7AUZdgmKRLUHFRDHVk9FceMb
 4b9Dzd1xDImJwGdG5K6NjPcHAIYB7FgKUluwGKO7wfP2FAKJL2NNIsCD4nwEgS3nW7zn
 1tT5XfPxhrQKC0GxAa37Fdl6MMeLpIWld29aOa1yNBHklfKbERBVcvxjflYBuQ0RPsmI
 0V0bj/+w2ZtuTh4BtAdm/hZkSzx4ZoR6AdTZm+hgKBCJ7Km/8C9Rwxb07tz5t1+7vptv
 ObFK5PjNG6cdQIqFc3HT+dh4LWk8hfGolL1+SSSgbavgNZ0GfSsDAGXGtaOlT27g/gHX
 oxqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSBP+kgK9kXMRG2GCR7VyFMeCjxBEH6AbCn0pOvVEO4WoPTDMAWKkHUqzcuf7TS4sZ4/KAjOVgOUs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAAJM/Lf//Ycw86ZZKRwAERQekvfKRxHjSnjG7eOArg+uxOZM+
 TvRD+TD4prTy/aRh+74SQuRJK+so8OSUbnzuufTshG5PRv3XsjLxnK8brwlPyiU7CP0=
X-Gm-Gg: ASbGnctpr62y+pxMJC/q/39jX/7vJYSSuMHgK0pn0UUzQWzauucsgp6qIPieCt7NGLm
 XW6Cc81uJBqxuZDA67jw7k58D5j3S5kDFwa19oFMGtkpoZJGgmvgDgWod5hSn8dILLXaRFAFoBN
 3/6+MO61JpyLVQphVAQkvHaRX57uUTAA80pC/bWtZZa0UN4QTCyzi4K3R8GYgePGVRTq1ThfdY6
 Vhmt1corS3liHiDzOJfgxZYxps5h0iqriDK1+NUi3F3/PHEEatcZLA0lmojNEGvs35+E2+FA/Dt
 6Rlv8dMGgaKG1yIptbnbagbxrAc4fLl2jnsNV6O2drIQwqo0hPiRiFxgBLcZbILzwWsJXAfDjbi
 YJv6n0fmZlm1L03BS5E4eKV0S1wPd9tWn+audEeyu0//eBRkiA8G3d+H9P8PFz4d3aNUHoIkGcs
 AImApgFLniCg==
X-Google-Smtp-Source: AGHT+IFGgQDhmKjsxwQeeanUSBp4sAHQ1P3xwlEiMitDwLsVw1OyZFVplMZ/sj3w25qrYF6TJH+r9w==
X-Received: by 2002:a05:6000:25c2:b0:3a4:dd16:a26d with SMTP id
 ffacd0b85a97d-3b768ef3c59mr6524335f8f.38.1753368250912; 
 Thu, 24 Jul 2025 07:44:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:e2d3:d328:dc00:f187?
 ([2a01:e0a:cad:2140:e2d3:d328:dc00:f187])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b76fcb89a5sm2326994f8f.65.2025.07.24.07.44.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jul 2025 07:44:10 -0700 (PDT)
Message-ID: <53e0ae24-c32a-4b6b-a0ea-b056540c2f3d@linaro.org>
Date: Thu, 24 Jul 2025 16:44:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/msm: adreno: a6xx: enable GMU bandwidth voting for
 x1e80100 GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250721-topic-x1e80100-gpu-bwvote-v1-1-946619b0f73a@linaro.org>
 <ac476949-d0e7-4058-ad76-c3cc45691092@oss.qualcomm.com>
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
In-Reply-To: <ac476949-d0e7-4058-ad76-c3cc45691092@oss.qualcomm.com>
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

On 24/07/2025 16:35, Akhil P Oommen wrote:
> On 7/21/2025 6:05 PM, Neil Armstrong wrote:
>> The Adreno GPU Management Unit (GMU) can also scale DDR Bandwidth along
>> the Frequency and Power Domain level, but by default we leave the
>> OPP core scale the interconnect ddr path.
>>
>> Declare the Bus Control Modules (BCMs) and the corresponding parameters
>> in the GPU info struct to allow the GMU to vote for the bandwidth.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> index 00e1afd46b81546eec03e22cda9e9a604f6f3b60..b313505e665ba50e46f2c2b7c34925b929a94c31 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> @@ -1440,6 +1440,17 @@ static const struct adreno_info a7xx_gpus[] = {
>>   			.pwrup_reglist = &a7xx_pwrup_reglist,
>>   			.gmu_chipid = 0x7050001,
>>   			.gmu_cgc_mode = 0x00020202,
>> +			.bcms = (const struct a6xx_bcm[]) {
>> +				{ .name = "SH0", .buswidth = 16 },
>> +				{ .name = "MC0", .buswidth = 4 },
>> +				{
>> +					.name = "ACV",
>> +					.fixed = true,
>> +					.perfmode = BIT(2),
>> +					.perfmode_bw = 10687500,
> 
> This configurations should be similar to X1-45.

Including the perfmode bit ?

+					.perfmode = BIT(3),
+					.perfmode_bw = 16500000,


Neil

> 
> -Akhil
> 
>> +				},
>> +				{ /* sentinel */ },
>> +			},
>>   		},
>>   		.preempt_record_size = 4192 * SZ_1K,
>>   		.speedbins = ADRENO_SPEEDBINS(
>>
>> ---
>> base-commit: 97987520025658f30bb787a99ffbd9bbff9ffc9d
>> change-id: 20250721-topic-x1e80100-gpu-bwvote-9fc4690fe5e3
>>
>> Best regards,
> 

