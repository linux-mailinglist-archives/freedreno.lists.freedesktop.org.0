Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0A0B2692A
	for <lists+freedreno@lfdr.de>; Thu, 14 Aug 2025 16:26:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19EB710E2D4;
	Thu, 14 Aug 2025 14:26:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NOHcGZ7w";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCCC510E05A
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 14:26:03 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-45a1b0c8867so7545105e9.3
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 07:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755181562; x=1755786362; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=cUV3fUJR8K/LNtQMHHFa+NVRtvkhhAA1yMnYl/5MEqg=;
 b=NOHcGZ7wv8N41L+auR8Wdt7Dmp/vHkBCaIMKPDkUVqoERymanE7Tnql43L3hk1HgE9
 E9K+KnQ4p9/cKS0mvj1ntFHaXqZ4C6ZsnzpXtRb1gSvZKm8D6S7cBtWreWhWdGMWvP6I
 MBjwAtEPCtErYQSUoj9VtLus3O4bnqcKc9F9+9wchWR+HIbEfaLflyO7m+uYfG2o8s5O
 tCulr09xL4GuXZBTyyVEH1o4y+h/MDwYAbhg6Xde7foWZXMuH77603dtUG8EEV0DsFMY
 atnMl3msbHKre9WsME3EVQAh4QH2tzRpErYCUWd/buect+m5OrtigzUomcYF5B9iUqPl
 46eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755181562; x=1755786362;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=cUV3fUJR8K/LNtQMHHFa+NVRtvkhhAA1yMnYl/5MEqg=;
 b=PXSV/S4oQr+eBxqC415EpFtyag2JKmceMHkUu231tNauBaBmawT2CTTwbJAUv5zBpL
 JSkhYkVV1UAli3KTBXIHruFDbOWgahPI1j7Ekh+E+1roPLPy3DJHxAOLqyKL7FqWEaYA
 heLnmrJTevJj/3WBTjaJ51HP25LkIv3P76eoIwMpgwzjcX4nO3kUmIf20d9qZIWmQlf5
 R9GuM/3yf/18Ywp7QJ1+ZxdupBNBkpRFb0CM4L0Bz1wXop7lCu7VKu6huFPFAgmSZhDS
 g8AqQ74QHj3tN1EOT2+SIR4B6yHA4Vei2lBwckOTYXV8Nc4UNALkENtCg1OctJmpC1wv
 +xNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfC09c4kTSVEC3QTvm3j8aVMw9XU3q6gktcUAoRss3fRtx2SgFj+Fou7uEwFlNotnNeTkaHNF4yyQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwUSovWtZBRj1gWSXCK7w67uGtQjbfDqpzsRCcTfgq7peI127wD
 syYwFe3hAm+q1bmuGJdnlyT/6xtyVSHuFe09BHubp3w/3F/ahEkBrBMTif7iY/FUG3g=
X-Gm-Gg: ASbGncsjR/zT8/BBhinjw6Cnk5fBuZVqWmnoy5q5QnIVwNkTDZ4Z5rwdJTMSqAZVo/7
 AR5w6Er6s8zk9jcmyTcNBp9lKazOJk+9KQNBnIB5fhoALeLiICmGoW5G2B5CZCz9CNdDJZFIjBW
 mAKmWzGoQec94VW2+W+AiswJRmPuzZUA+x/bt4ELFwj2pxqarOVZkg035H2tHR80r/dkcaMkqL+
 IH+BiSAVv8ZIFD1UByqCBnGHh7Zq9U9cpPrXRl+zpepC4nuzhHHUJ9gG+Y/PqKjvTJtwNhUaRXa
 0eNyxI8kITf0pX97REplo6LOZR0fScDTgWMTfdGinNP7wrVRTTSeexH+FheufE6G+lwFXXnrLNk
 yOIyStqaUPElZNskfIVSiedhfKoBDyyQ20a+z+MWQSxAnTHYlX4KMZUMQLCzrB5lq9xqXHEUD
X-Google-Smtp-Source: AGHT+IH26+hLzQJtX2ss5voCJMw3O/X67D5ManbVwKM2eqgig1E2QKvsougttThvAf89+ZGPYwzR0Q==
X-Received: by 2002:a05:600c:4587:b0:456:302:6dc3 with SMTP id
 5b1f17b1804b1-45a1b65585bmr25542325e9.26.1755181562146; 
 Thu, 14 Aug 2025 07:26:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:7336:e60:7f9e:21e6?
 ([2a01:e0a:3d9:2080:7336:e60:7f9e:21e6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b91b05b28fsm4802655f8f.21.2025.08.14.07.26.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 07:26:01 -0700 (PDT)
Message-ID: <269506b6-f51b-45cc-b7cc-7ad0e5ceea47@linaro.org>
Date: Thu, 14 Aug 2025 16:26:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] drm/msm: adreno: a6xx: enable GMU bandwidth voting for
 x1e80100 GPU
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250725-topic-x1e80100-gpu-bwvote-v2-1-58d2fbb6a127@linaro.org>
 <e7ddfe18-d2c7-4201-a271-81be7c814011@oss.qualcomm.com>
 <33442cc4-a205-46a8-a2b8-5c85c236c8d4@oss.qualcomm.com>
 <b4f283ce-5be1-4d2f-82e2-e9c3be22a37f@oss.qualcomm.com>
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
In-Reply-To: <b4f283ce-5be1-4d2f-82e2-e9c3be22a37f@oss.qualcomm.com>
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

Hi,

On 14/08/2025 13:22, Konrad Dybcio wrote:
> On 8/14/25 1:21 PM, Konrad Dybcio wrote:
>> On 7/31/25 12:19 PM, Konrad Dybcio wrote:
>>> On 7/25/25 10:35 AM, Neil Armstrong wrote:
>>>> The Adreno GPU Management Unit (GMU) can also scale DDR Bandwidth along
>>>> the Frequency and Power Domain level, but by default we leave the
>>>> OPP core scale the interconnect ddr path.
>>>>
>>>> Declare the Bus Control Modules (BCMs) and the corresponding parameters
>>>> in the GPU info struct to allow the GMU to vote for the bandwidth.
>>>>
>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>> ---
>>>> Changes in v2:
>>>> - Used proper ACV perfmode bit/freq
>>>> - Link to v1: https://lore.kernel.org/r/20250721-topic-x1e80100-gpu-bwvote-v1-1-946619b0f73a@linaro.org
>>>> ---
>>>>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 11 +++++++++++
>>>>   1 file changed, 11 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>> index 00e1afd46b81546eec03e22cda9e9a604f6f3b60..892f98b1f2ae582268adebd758437ff60456cdd5 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>> @@ -1440,6 +1440,17 @@ static const struct adreno_info a7xx_gpus[] = {
>>>>   			.pwrup_reglist = &a7xx_pwrup_reglist,
>>>>   			.gmu_chipid = 0x7050001,
>>>>   			.gmu_cgc_mode = 0x00020202,
>>>> +			.bcms = (const struct a6xx_bcm[]) {
>>>> +				{ .name = "SH0", .buswidth = 16 },
>>>> +				{ .name = "MC0", .buswidth = 4 },
>>>> +				{
>>>> +					.name = "ACV",
>>>> +					.fixed = true,
>>>> +					.perfmode = BIT(3),
>>>> +					.perfmode_bw = 16500000,
>>>
>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Actually no, BIT(3) is for the CPU (OS), GPU should use BIT(2)
> 
> This is *very* platform-dependent, goes without saying..
> 
> I see BIT(2) is also valid for X1P4


I'm confused, Akhil can you confirm ?

Neil

> 
> Konrad

