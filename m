Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A81DF85B572
	for <lists+freedreno@lfdr.de>; Tue, 20 Feb 2024 09:38:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B7D310E220;
	Tue, 20 Feb 2024 08:38:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xT/yhzkr";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26E2210E21F
 for <freedreno@lists.freedesktop.org>; Tue, 20 Feb 2024 08:38:34 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a3eafbcb1c5so176984766b.0
 for <freedreno@lists.freedesktop.org>; Tue, 20 Feb 2024 00:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708418312; x=1709023112; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=kJGa4Iif74KIq28HuBx0obq22VL2V9cwPjQcH9f77gk=;
 b=xT/yhzkrbrUAcqyJ/erJL2GE6QEgcdC+2US4qhzgsuo2les8NTnnvHNNSPV0ZnQD4p
 fAVXfzQGwp60pFHZbLFUuA/NdSIVZNehXjdsM3onVjLPDBh8y0j5GjLSpv2pq2AkhVp2
 XnFG9/UCbdEOvKyAVxNeZv+SuIyk7zrIQsbRF0EdkM+p40Ys8ud1RWyuszTZ5hgWKjRH
 fQjBkiCZ9ltBgYyxD+kZf9DLfBwhiy9gtIlucC8V9StT7N6CZQMhmt6MZoTNJWuLClcT
 LUuEoIHVgd29jIBYIAMirOzUNYRHoeNeK1/ROkssY+CbRjh2ySxtfG/ws4pBQrx3UDgL
 XTww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708418312; x=1709023112;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=kJGa4Iif74KIq28HuBx0obq22VL2V9cwPjQcH9f77gk=;
 b=B1nDRJvYdNoRqORTD3qFQvMYpUhJNFWkjHQzhR2xjnNm8Ysl05h4jBdLMnz9wtVp2R
 6SaD10VRYf/tm/AwVZJAxUUxn3JrrvAcX45VfXSwzqey+zKEx+LS/qLr61J8lvFBqr6i
 VPCMFVs7WWnpZUvHCYSj/hW34gvHH4MBcDxYy61jrE3B2bhdJaLoWFa/yF49LO/Pp/Uu
 K3KA0fBaAdHt+FzHnKQRKPXkoslWrk1soA0IodUoPuhP0BMWPgs+ZTHmZ/rd2u1Lh0/3
 ErvMsrF6D4GwfYH32tfB/uoMV5fPciCvNX5zfrvLHvKyO8gb3/tX6SpJDCMCSoT3j6ML
 JhhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6D16IeKxw9gajGS9CQhOYR3ot1kyfZKYRsA4OBfjhXdiWEMMyIj+VAhaQOaL/H0Gq4WwMpEnFqbKYbm6SDCrrDe+ZT3L3LD8qACMqbifq
X-Gm-Message-State: AOJu0YxUBtmgYvIyg2NG9i7N3NxW1x8CVT/oYOdMR4Hxh+k+ia6qh2Bg
 pMpsDR+tO4u6HMKIQej96ZjtV8isbNhQCwvuNQ6IIe7kSzojq6wDwxZywHZa14Y=
X-Google-Smtp-Source: AGHT+IG5sof+uEBFLugZ3URqtm9eYBKvIS7ypPMXhjAaCDviRIT2l26ljktZ4RfQuw9pU3z3NdDz/g==
X-Received: by 2002:a17:906:ce4a:b0:a3e:720a:b961 with SMTP id
 se10-20020a170906ce4a00b00a3e720ab961mr4048248ejb.34.1708418312170; 
 Tue, 20 Feb 2024 00:38:32 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:bd84:e8aa:cf30:cb6e?
 ([2a01:e0a:982:cbb0:bd84:e8aa:cf30:cb6e])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a05600c294500b00410df4bf22esm13596294wmd.38.2024.02.20.00.38.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Feb 2024 00:38:31 -0800 (PST)
Message-ID: <90290e71-6d85-4aaa-af5b-79c44bc786ef@linaro.org>
Date: Tue, 20 Feb 2024 09:38:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 8/8] arm64: dts: qcom: qrb2210-rb1: Enable the GPU
Content-Language: en-US, fr
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20240219-topic-rb1_gpu-v1-0-d260fa854707@linaro.org>
 <20240219-topic-rb1_gpu-v1-8-d260fa854707@linaro.org>
 <CAA8EJppPvXfkz=wVca8aFBhFaVUe9+OiVzcQUq7D8zPbK+T1FQ@mail.gmail.com>
 <b73e329a-02a4-46e0-bda4-5d5fae0a1180@linaro.org>
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
Organization: Linaro Developer Services
In-Reply-To: <b73e329a-02a4-46e0-bda4-5d5fae0a1180@linaro.org>
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

On 19/02/2024 22:37, Konrad Dybcio wrote:
> On 19.02.2024 15:49, Dmitry Baryshkov wrote:
>> On Mon, 19 Feb 2024 at 15:36, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>>
>>> Enable the A702 GPU (also marketed as "3D accelerator by qcom [1], lol).
>>
>> Is it not?
> 
> Sure, every electronic device is also a heater, I suppose.. I found
> this wording extremely funny though


GPU (Graphics Processing Unit) isn't accurate either since it can also run compute shaders do to non graphics processing,
so 3D Accelerator isn't that different.

A proper term would be Vectorized Mathematical Computing Complex or something similar.

Neil

> 
>>
>>>
>>> [1] https://docs.qualcomm.com/bundle/publicresource/87-61720-1_REV_A_QUALCOMM_ROBOTICS_RB1_PLATFORM__QUALCOMM_QRB2210__PRODUCT_BRIEF.pdf
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>
>> With the exception of the commit message:
> 
> :(
> 
> Konrad
> 
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>
>>> ---
>>>   arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 8 ++++++++
>>>   1 file changed, 8 insertions(+)
>>
>>
> 

