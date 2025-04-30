Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 933DEAA4B9B
	for <lists+freedreno@lfdr.de>; Wed, 30 Apr 2025 14:49:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 586BF10E770;
	Wed, 30 Apr 2025 12:49:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QRIQoN92";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CED910E770
 for <freedreno@lists.freedesktop.org>; Wed, 30 Apr 2025 12:49:33 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-43d04ea9d9aso33582885e9.3
 for <freedreno@lists.freedesktop.org>; Wed, 30 Apr 2025 05:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746017372; x=1746622172; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=U0QaE6gqDjxKdHf7ertrDDvouXP/X1oSlZQqvhzBwFk=;
 b=QRIQoN92AJCbO7lM6CLhalCqJh1xUq1nlGfwSDTovuzJIVT3ZrUgSMtA1vJq7KSadu
 XI+/aQGIdtFFL33IDo40nh+sPrEZbhv796+XU//RQqsJrCBQYlKn/83HU/cDBjlPbQ0F
 GP3nC2FdQkKSQOCiyWddhuuqgQtkAPoHNmE4aDdPDnGm0yipo54U4ivJvPGcH4vSgHlY
 b+MyFUQPw0aTeN5G7m+cKYL2B+orGPYflbGAgBP2IugM9R6Ihu+X54QfflqUtqdarrqx
 MXaBgeS4HRw0nNBmAJjjk5Lm5PM4xigBfnmI/NuZhBgC5A3/8JtWwrK8M5TQUnRr0CNq
 XrnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746017372; x=1746622172;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=U0QaE6gqDjxKdHf7ertrDDvouXP/X1oSlZQqvhzBwFk=;
 b=nspv/vOXhhcpaoRL+MHKhYyjWfz2vo73xmiPf4nuVkmdCrTguLi1qJVtyZFfzCMuYU
 2Gpxxi0z5mE0M58+ebE/tCNB51rJNDiBFIb+/PgBgzjym7dRwtRYQ8D5OozQmxmc9VU3
 DTu4PEuQ8Z4rQOabsPEOAJTmVmboeJbcFRJJe/ibJMQDn3noHoe+VThyNgqkXHmqDiij
 2BS0e0h0i/VU5ug66HLcVS5mRe/eM0llvcIv+iGZTXc4Xn/WVIk/HyX3EklROzGUhctU
 Rg+UZir7WqDQ0sa6RD+mRKYbIXpNnl/2zNVWLwcC0W6LPP+QYUXKgzWaB8La2IKLsKoR
 P7uA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDueSasZPlfpoLb5AYNtQXXrsDm6wO/5WMTSdVawyVYRRkNo33PaL4UsRC1nKaN9Lhg1KgqniZN0I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjcYZDB4/o9uLc7YfNnCBykhVjxfSAdrvhRvVsjmwsC2N8Tt6B
 frmrAf+IILgZ9COi6vVGRawS9RB9umLMTVNYu859fsWPsW5TCTFwjc4bQZ0yKsM=
X-Gm-Gg: ASbGncsh4v7ykYAf6ZqfLdmhHLsVQV9OfU5FZ2j5E1Cg+QdKUvPt6oF9fLKQztAohub
 +V6aYAKcMerIFecsyZoAqSL+5/8ZGZZXPscIGDcVzgKTpWDnEmhHgHtIlFaYhWsI+t9z59JccxC
 m4nKI+X8Vex2rujKfGuUKHJcSgSUkct5/Q1GGRjjkDS0knHTL/B1qcDg0TXBokWIpBznJiDnQZl
 YyosCVe5c2hHhh90MM8+SjvV2eMnuohA1iU5DgwXIrueKAKo8saPQV7pZS/K9jMSGkPJGNerwU8
 zdiPBrrG0KIrobKnOOsNdt8kbYDbvEmlNleJDZ28efmUreQg9D1xC66pnrDuRD+LjVbAK+tXrjt
 4ioBfDq2EW6LOyg0PYA==
X-Google-Smtp-Source: AGHT+IE0vi2coXCwFNtieUFxKKeCy42jmnqHs3dTSRXFK+ENcMKD71lm+Qd/xSuR3AE5EW7jjaACeg==
X-Received: by 2002:a05:600c:a016:b0:43c:f513:958a with SMTP id
 5b1f17b1804b1-441b2639853mr24601215e9.13.1746017371767; 
 Wed, 30 Apr 2025 05:49:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:b3d6:213c:5c50:7785?
 ([2a01:e0a:3d9:2080:b3d6:213c:5c50:7785])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b2b9726fsm24514075e9.8.2025.04.30.05.49.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Apr 2025 05:49:31 -0700 (PDT)
Message-ID: <b838f9bd-0537-4f8d-b24b-d96700d566c8@linaro.org>
Date: Wed, 30 Apr 2025 14:49:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH RFT v6 2/5] drm/msm/adreno: Add speedbin data for SM8550 /
 A740
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20250430-topic-smem_speedbin_respin-v6-0-954ff66061cf@oss.qualcomm.com>
 <20250430-topic-smem_speedbin_respin-v6-2-954ff66061cf@oss.qualcomm.com>
 <13cd20c6-f758-45ff-82d1-4fd663d1698c@linaro.org>
 <886d979d-c513-4ab8-829e-4a885953079a@oss.qualcomm.com>
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
In-Reply-To: <886d979d-c513-4ab8-829e-4a885953079a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 30/04/2025 14:35, Konrad Dybcio wrote:
> On 4/30/25 2:26 PM, neil.armstrong@linaro.org wrote:
>> Hi,
>>
>> On 30/04/2025 13:34, Konrad Dybcio wrote:
>>> From: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>
>>> Add speebin data for A740, as found on SM8550 and derivative SoCs.
>>>
>>> For non-development SoCs it seems that "everything except FC_AC, FC_AF
>>> should be speedbin 1", but what the values are for said "everything" are
>>> not known, so that's an exercise left to the user..
>>>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 8 ++++++++
>>>    1 file changed, 8 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>> index 53e2ff4406d8f0afe474aaafbf0e459ef8f4577d..61daa331567925e529deae5e25d6fb63a8ba8375 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>> @@ -11,6 +11,9 @@
>>>    #include "a6xx.xml.h"
>>>    #include "a6xx_gmu.xml.h"
>>>    +#include <linux/soc/qcom/smem.h>
>>> +#include <linux/soc/qcom/socinfo.h>
>>> +
>>>    static const struct adreno_reglist a612_hwcg[] = {
>>>        {REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x22222222},
>>>        {REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220},
>>> @@ -1431,6 +1434,11 @@ static const struct adreno_info a7xx_gpus[] = {
>>>            },
>>>            .address_space_size = SZ_16G,
>>>            .preempt_record_size = 4192 * SZ_1K,
>>> +        .speedbins = ADRENO_SPEEDBINS(
>>> +            { ADRENO_SKU_ID(SOCINFO_FC_AC), 0 },
>>> +            { ADRENO_SKU_ID(SOCINFO_FC_AF), 0 },
>>> +            /* Other feature codes (on prod SoCs) should match to speedbin 1 */
>>
>> I'm trying to understand this sentence. because reading patch 4, when there's no match
>> devm_pm_opp_set_supported_hw() is simply never called so how can it match speedbin 1 ?
> 
> What I'm saying is that all other entries that happen to be possibly
> added down the line are expected to be speedbin 1 (i.e. BIT(1))
> 
>> Before this change the fallback was speedbin = BIT(0), but this disappeared.
> 
> No, the default was to allow speedbin mask ~(0U)

Hmm no:

	supp_hw = fuse_to_supp_hw(info, speedbin);

	if (supp_hw == UINT_MAX) {
		DRM_DEV_ERROR(dev,
			"missing support for speed-bin: %u. Some OPPs may not be supported by hardware\n",
			speedbin);
		supp_hw = BIT(0); /* Default */
	}

	ret = devm_pm_opp_set_supported_hw(dev, &supp_hw, 1);
	if (ret)
		return ret;

> 
> Konrad

