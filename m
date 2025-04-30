Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F9AAA506A
	for <lists+freedreno@lfdr.de>; Wed, 30 Apr 2025 17:36:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D19A910E302;
	Wed, 30 Apr 2025 15:36:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HW+UzbVh";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D6EA10E318
 for <freedreno@lists.freedesktop.org>; Wed, 30 Apr 2025 15:36:47 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U9D8e6012202
 for <freedreno@lists.freedesktop.org>; Wed, 30 Apr 2025 15:36:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fTGh4TqbF63xwYUm3QG5BIwcl65sh+wxAUCOiZrYCSU=; b=HW+UzbVhvZ4IZ/iB
 vO4WYx1WSCJxYjgWru18fm1EdcXWRb+22zr7uW40wv4F0ogDZ3XK+Tp3sRnmUz1l
 p+8i5mUmQWOm3Bv7PKABYQ9YNRrV8zulnQEYGYldYEDPNCrRG9JhmYBVd9dLB6Do
 XyuqRJVFRJhhUEsCsnVJzOaHN+qnYBffdEsUDmHQRnwacD/TTijwlKziodOKvAlB
 juOcE9Kn4WFFSOcrxmDq3ivP2ur7fEyLpdzuCrTBzAq9/AObu26xo0BjtNtLuqTB
 39Q4LhG1z+Y4pHzRluWotffMt7Qb0PFgUiz9LPHTzIYHmKJ/L4NsDcybbaMV7cgf
 HqlqbQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u3tnk3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 30 Apr 2025 15:36:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c54be4b03aso105762585a.3
 for <freedreno@lists.freedesktop.org>; Wed, 30 Apr 2025 08:36:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746027405; x=1746632205;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fTGh4TqbF63xwYUm3QG5BIwcl65sh+wxAUCOiZrYCSU=;
 b=HQVarTYjvtPlB0tu5P90ohFgekHUMucBF1nlINBFIbeyyHXTgWwlRZgUJ1HJGleSGc
 L8YiedBvkik444TCuvJe4UvuvCQxGhQIokBy+ECxV8MiNuwnW8gEIjE2pZ48BW67Kfo/
 xupCV2uw5loEGon9sbNQsnAR6tl8rc29bx/7aVosw/wt5OYnefSaQkcrBmfHOGUqdb5t
 Ozk2J4qsGV+54fnE2O9rhAn2brzb9F4vEKSSvXXaUfa7D9YcuO0y5QckOQx8nFtjwLJx
 KCFRlneyztKMmvrxPuG7xhspDgg/bWXCeO9gpbO3oBGSjVGYFaRMkn9Sf3iYoB3KatVf
 jYqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcN4hqjJWqgd27cWK8ZYoR/taGAEJmag3POfX88mzDQ7uomwX0PJ39wZZR7YskjEuRL+vGjT5BvVE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzAfdZ+KZR1LagPVOnpg3B8/fyw03T7lrCM3FwhKOPYgvlneEQ2
 PgWbz5WEWx4pgmJEuHZabsVBQP0wVs6XGbfgDB6YP9tv6WPX7Cgb9XqLiyvvAUtEHfocxhzKm0u
 GiHiv1YSAOjj+indpARwmwZbhD8+TgZEPlmIZImI2tzSqmsjCTVRW5Lj6aekESAiC+mo=
X-Gm-Gg: ASbGncvNpWegMVntKOyOI1ztFqihZuBbrqEoZsVpWcAhW/RxnRZigwg07SDrdIfUO6F
 WjTitdFONV8naxVM4C4CXNyMk8wI5m4ETI/6YIkJjJfXnTLuJ5LrKrR0FMNihBxt+iZzLFrinbP
 KfJH/SRtU4MG5eVBotYEKl4eD5uWWVenLQSZxjgV3WfKYL56jOmlA8oD/pleGp16OdCzeedXvcX
 3ibIn0uFNZ5coP2QWSi006lnTBzRN3T2+5eSuUJTgqdvtF8eOc98XnzSCyx2GD00vi0uArWEhwu
 Mj4pVvuetPgxCA/cF3+fSiHp7z1nPoA/DHEst8aucK8CV4twO22YXnLDyFUCjjys/Wg=
X-Received: by 2002:a05:620a:4308:b0:7c5:8ece:8b56 with SMTP id
 af79cd13be357-7cacc181228mr46433485a.4.1746027405337; 
 Wed, 30 Apr 2025 08:36:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdlzJzIfgOStzSFzks/Qe+xlSUuq+TMfHaCn0Fsor48lpZnfx+WjAEpbyBluclwVZNHNt8+g==
X-Received: by 2002:a05:620a:4308:b0:7c5:8ece:8b56 with SMTP id
 af79cd13be357-7cacc181228mr46430385a.4.1746027404834; 
 Wed, 30 Apr 2025 08:36:44 -0700 (PDT)
Received: from [192.168.65.132] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f703545218sm8711952a12.53.2025.04.30.08.36.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Apr 2025 08:36:44 -0700 (PDT)
Message-ID: <281ab1b6-498e-4b29-9e15-19b5aae25342@oss.qualcomm.com>
Date: Wed, 30 Apr 2025 17:36:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v6 2/5] drm/msm/adreno: Add speedbin data for SM8550 /
 A740
To: neil.armstrong@linaro.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20250430-topic-smem_speedbin_respin-v6-0-954ff66061cf@oss.qualcomm.com>
 <20250430-topic-smem_speedbin_respin-v6-2-954ff66061cf@oss.qualcomm.com>
 <13cd20c6-f758-45ff-82d1-4fd663d1698c@linaro.org>
 <886d979d-c513-4ab8-829e-4a885953079a@oss.qualcomm.com>
 <b838f9bd-0537-4f8d-b24b-d96700d566c8@linaro.org>
 <98a4ad20-c141-4280-801e-015dafd1fb39@oss.qualcomm.com>
 <a26213ec-808f-4edf-bb0d-ab469ee0a884@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a26213ec-808f-4edf-bb0d-ab469ee0a884@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Bv6dwZX5 c=1 sm=1 tr=0 ts=6812438e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=uyuhvXrvZAXgkk1q3UwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 8CGyy0gekTFCLYIfvZ_CMZSUZxRoGvFe
X-Proofpoint-ORIG-GUID: 8CGyy0gekTFCLYIfvZ_CMZSUZxRoGvFe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDExMSBTYWx0ZWRfX5YGFNO1VpYx5
 bi0S6IHUHX59GgchT+jFzMvNXBMn2oBk9bGfANDSaZa0K6TadjWZ8pRJEyS65UDpHhTJk1/keMd
 mLV6IaIB896vOnh2GjJuWu0aBX5X8XwJ/JMMyk9mS/p3KMJZaum/OyGdLXbBhFprAcniFd6E3aB
 KaJ8JYH8WuZW3B53TnyKvr9/8djG/qVKuXqmQUmlY3TY35g7Mwpc3NqvjIWprTGH5UX2pPY6eAz
 j31Lnh6evNo5ocskqke5LJGfxevxQR9UKNz0gmeE3mC1MbKeGE/yvW7XLec7LZHYU1wlTM7Njd8
 8aTsWecmF4YlVzwU+skjbX/sI9YYfQEBVc2iBSoU1Slu5qzgf/8QPCY7L9Sa0bRaqJQuGyeNFT7
 upTu7Pbl22u/Y6ddgZZ2A69oMB7ZeW3O1bFEqXRqz0QyhlnXvbZ5td2EDVltFv6KiA4qN4iM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 mlxlogscore=999 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300111
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 4/30/25 4:49 PM, neil.armstrong@linaro.org wrote:
> On 30/04/2025 15:09, Konrad Dybcio wrote:
>> On 4/30/25 2:49 PM, neil.armstrong@linaro.org wrote:
>>> On 30/04/2025 14:35, Konrad Dybcio wrote:
>>>> On 4/30/25 2:26 PM, neil.armstrong@linaro.org wrote:
>>>>> Hi,
>>>>>
>>>>> On 30/04/2025 13:34, Konrad Dybcio wrote:
>>>>>> From: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>>>>
>>>>>> Add speebin data for A740, as found on SM8550 and derivative SoCs.
>>>>>>
>>>>>> For non-development SoCs it seems that "everything except FC_AC, FC_AF
>>>>>> should be speedbin 1", but what the values are for said "everything" are
>>>>>> not known, so that's an exercise left to the user..
>>>>>>
>>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>>>> ---
>>>>>>     drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 8 ++++++++
>>>>>>     1 file changed, 8 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>>>> index 53e2ff4406d8f0afe474aaafbf0e459ef8f4577d..61daa331567925e529deae5e25d6fb63a8ba8375 100644
>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>>>> @@ -11,6 +11,9 @@
>>>>>>     #include "a6xx.xml.h"
>>>>>>     #include "a6xx_gmu.xml.h"
>>>>>>     +#include <linux/soc/qcom/smem.h>
>>>>>> +#include <linux/soc/qcom/socinfo.h>
>>>>>> +
>>>>>>     static const struct adreno_reglist a612_hwcg[] = {
>>>>>>         {REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x22222222},
>>>>>>         {REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220},
>>>>>> @@ -1431,6 +1434,11 @@ static const struct adreno_info a7xx_gpus[] = {
>>>>>>             },
>>>>>>             .address_space_size = SZ_16G,
>>>>>>             .preempt_record_size = 4192 * SZ_1K,
>>>>>> +        .speedbins = ADRENO_SPEEDBINS(
>>>>>> +            { ADRENO_SKU_ID(SOCINFO_FC_AC), 0 },
>>>>>> +            { ADRENO_SKU_ID(SOCINFO_FC_AF), 0 },
>>>>>> +            /* Other feature codes (on prod SoCs) should match to speedbin 1 */
>>>>>
>>>>> I'm trying to understand this sentence. because reading patch 4, when there's no match
>>>>> devm_pm_opp_set_supported_hw() is simply never called so how can it match speedbin 1 ?
>>>>
>>>> What I'm saying is that all other entries that happen to be possibly
>>>> added down the line are expected to be speedbin 1 (i.e. BIT(1))
>>>>
>>>>> Before this change the fallback was speedbin = BIT(0), but this disappeared.
>>>>
>>>> No, the default was to allow speedbin mask ~(0U)
>>>
>>> Hmm no:
>>>
>>>      supp_hw = fuse_to_supp_hw(info, speedbin);
>>>
>>>      if (supp_hw == UINT_MAX) {
>>>          DRM_DEV_ERROR(dev,
>>>              "missing support for speed-bin: %u. Some OPPs may not be supported by hardware\n",
>>>              speedbin);
>>>          supp_hw = BIT(0); /* Default */
>>>      }
>>>
>>>      ret = devm_pm_opp_set_supported_hw(dev, &supp_hw, 1);
>>>      if (ret)
>>>          return ret;
>>
>> Right, that's my own code even..
>>
>> in any case, the kernel can't know about the speed bins that aren't
>> defined and here we only define bin0, which doesn't break things
>>
>> the kernel isn't aware about hw with bin1 with or without this change
>> so it effectively doesn't matter
> 
> But it's regression for the other platforms, where before an unknown SKU
> mapped to supp_hw=BIT(0)
> 
> Not calling devm_pm_opp_set_supported_hw() is a major regression,
> if the opp-supported-hw is present, the OPP will be rejected:

A comment in patch 4 explains that. We can either be forwards or backwards
compatible (i.e. accept a limited amount of
speedbin_in_driver x speedbin_in_dt combinations)

Konrad
