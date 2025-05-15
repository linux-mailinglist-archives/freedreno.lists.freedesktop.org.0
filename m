Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D341AB8E47
	for <lists+freedreno@lfdr.de>; Thu, 15 May 2025 19:57:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61FC110E936;
	Thu, 15 May 2025 17:57:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HwMzc4Ld";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B01710E936
 for <freedreno@lists.freedesktop.org>; Thu, 15 May 2025 17:57:05 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFAWc014461
 for <freedreno@lists.freedesktop.org>; Thu, 15 May 2025 17:57:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 nO7osz8wRUJZDY0Z+dnUrmrOR+9j3qqdgRHC4Q77+38=; b=HwMzc4LdGegn2rqq
 nkZVXl5aFZQ6ueCZuOzufVXlUV88Vm4mLCc3lMLzS2Sm7FVtd9L/YGtAjF5NQRDK
 Re3k9oE+Y9EvziJl84rb9/9JjOZOQ+eKYkQLuH0sh2wvJWbx4Mqwtsn441p5L44r
 RYOGwT+cYYUzpdk6EH+K4PLWtT/mnK0ZMNLDy6Xlf+/kAersK5fvZKDCdGFavROI
 9fmGBO9TVvBgFXEwNK3Elilq5IbQPpFP5JOK9hLa6r1QAWtgwXahsQdNbh34p5my
 WyV+pLY7nB67LaRYrMdTC2wjasqhpR9hve94u1QU5sq8GxsIQYN6fQgSh9VlowDE
 MMjvVQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcpf98d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 15 May 2025 17:57:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c5841ae28eso30662285a.1
 for <freedreno@lists.freedesktop.org>; Thu, 15 May 2025 10:57:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747331806; x=1747936606;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nO7osz8wRUJZDY0Z+dnUrmrOR+9j3qqdgRHC4Q77+38=;
 b=MhR+HSC4V8pXiFPlhiug8FIUf0VIMdtveQcS2Q4THeKTBMXxs1q0NAyOWIG7bYwb1t
 EvCDfI1ZVkTfCDYDiKagG6kGH0MTEi6UZdtRptugKwvLnflVrpNJYTJ5+kPwMsiUVvRn
 5agUsAk2yjg0LLn8SYpaWlZb8hv0U1ftSOjpjYvMqIMC8q0e6utA5CpdOPWSr92k99ig
 zKUKFd7JiYGzL2bUjvEN8sqBSq+z5sE73uC7k59fWFaDm/Nt6ANH51wWRmECNi160Btk
 EhpEQmqvhZkN72bqhDQMoBU0WDZ09UO7D1hyD4NghXHqJUuTkIWxfXML40OO0Q0tTzeQ
 QFwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfnfWT+SxAE2u4DS6ORw1HKVSxSNoQ+aCJpNDgUGzsDUItMGZLRkl6jZLgwkelmc9BU7dPTOFTRA8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1AoaAe9lRRaHgwVQPKnTA5a9xB4z80m45lPHkIxR7waD6KPTY
 CNQiL0C+aYKlvzp0mvmoA7Y5TOQBnOEYZwTSWfMwplkG4xFimDWG2YCnD9vr5KR9rfa8xmRI72i
 HEIUX+ylBI9o8HKLjrZPnH5zUCmcvkAQiou7hsFJBBSi/fGENNiRvAxkiFsTA4SXxo/F7MfM=
X-Gm-Gg: ASbGncs5O5/qcx2SIcHhV7LYsfXfszM1H/STjxW9hrNonWK1fcucn77ewXAmY/i1ocz
 5IIyuFy2fVNQhxzxFu5ydvdgKU1Xu/2TaEqYpFnTZbEALL+0UOeE34stOoGy6I32+azP4brOXAn
 KuYOco3x/Ug1B1PYooPQ9OcjhFups39z3mjecU1EovxWSgZ87rL1f2wRUMEF3oZqOGeoBQAYHwE
 Pg7qS5Rjk+DmnA65qWE1CW0OPBPglnNJ3WJ7Mla2NgGulLuoTo6mtfdZlJdQIUuriXATRo7W/we
 qvaP6Fy371ihjoHvH06styu+CUn6Mr7ENWzO9wHgTo61JlJ9VC0YDbS+xeRJiOmcdQ==
X-Received: by 2002:a05:620a:628a:b0:7c0:b81f:7af9 with SMTP id
 af79cd13be357-7cd4672fd7bmr25637285a.6.1747331806302; 
 Thu, 15 May 2025 10:56:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3ibf+MjEukbdNgXoiuGdyW6XD2s0VHGguMOsCRyXNY9KKGsFmIMV8aCJE2HbDHDTsZjO7oQ==
X-Received: by 2002:a05:620a:628a:b0:7c0:b81f:7af9 with SMTP id
 af79cd13be357-7cd4672fd7bmr25635285a.6.1747331805816; 
 Thu, 15 May 2025 10:56:45 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d06cdefsm22310566b.52.2025.05.15.10.56.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 May 2025 10:56:45 -0700 (PDT)
Message-ID: <6d7b30b1-60ac-45bf-9ff8-72461f1b21c3@oss.qualcomm.com>
Date: Thu, 15 May 2025 19:56:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v2 13/15] soc: qcom: ubwc: Fix SM6125's ubwc_swizzle
 value
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-13-09ecbc0a05ce@oss.qualcomm.com>
 <lkkwnmnk32igcev3gykmtxsohyskj6ehylaypg2dyxbedvksee@lnuc4lfmzrkm>
 <9a05d545-1bf2-4f66-8838-b6969ba37baa@oss.qualcomm.com>
 <d7417290-a245-422c-ba00-3532661ea02d@oss.qualcomm.com>
 <466148c9-2461-4140-9ba9-5a3427ec6461@oss.qualcomm.com>
 <4ec678b4-9e69-4ba0-a59d-f2e0948a73ce@oss.qualcomm.com>
 <d0a036e7-605b-4475-8ddc-69482e16f0b3@oss.qualcomm.com>
 <CAO9ioeWHMUf66Vb0XPw9eHRoAXzroSSqQRzW1o+e509-BK+Y7Q@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAO9ioeWHMUf66Vb0XPw9eHRoAXzroSSqQRzW1o+e509-BK+Y7Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: svWiqhDChDfudZmS1MGj14x5Ept9iHbq
X-Proofpoint-ORIG-GUID: svWiqhDChDfudZmS1MGj14x5Ept9iHbq
X-Authority-Analysis: v=2.4 cv=cO7gskeN c=1 sm=1 tr=0 ts=68262aef cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=S0qm8UsrUeb_ptZHZhEA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE3NyBTYWx0ZWRfXy3ypEz8YZRFv
 Dd8kW1cFKDSJ7ptw3umdJU7/6CpzK7s23G1xXMvoP8ijkPyACCQLyyqxeGR/6NeIHvpwdK5Pb+b
 9KtIOpi4+GoiO2krPgE6L1NXYI+ghLJG1a1aV0aSDy+uKEKex0muw6aJ0h5VEpPL67G+Dxc4IyM
 qQjBBxVXlBWQy01c3XaBx7lc6UWwz7M8r2G3hFPKZXC+uo4ExggNAy8lXqYAMFubPdigxiV15C9
 NHQ9A9hPofO9q11xFkQeWml4TskqjHDiWN/fBonAdlGtm67fnQ6dz5X/VhH/5t1FpVHix6w5oCT
 tx7NgiP/VsYq3wmGtmlRMVoRDNhyUMBA157M7DbPYFaw7jC0CY0oaZKt9UDLxajMvH2SunTxiN8
 WnRXqs5jawsjK6Sa8AMdoWDjO1x4zFNkGWNGpdd11ApukVDfbdWwNZd/0qb3bfb/AgOK/Aw/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_07,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150177
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

On 5/15/25 7:15 PM, Dmitry Baryshkov wrote:
> On Thu, 15 May 2025 at 19:36, Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 5/15/25 6:21 PM, Dmitry Baryshkov wrote:
>>> On 15/05/2025 19:18, Konrad Dybcio wrote:
>>>> On 5/14/25 10:33 PM, Dmitry Baryshkov wrote:
>>>>> On 14/05/2025 23:05, Konrad Dybcio wrote:
>>>>>> On 5/14/25 9:23 PM, Dmitry Baryshkov wrote:
>>>>>>> On Wed, May 14, 2025 at 05:10:33PM +0200, Konrad Dybcio wrote:
>>>>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>>>
>>>>>>>> The value of 7 (a.k.a. GENMASK(2, 0), a.k.a. disabling levels 1-3 of
>>>>>>>> swizzling) is what we want on this platform (and others with a UBWC
>>>>>>>> 1.0 encoder).
>>>>>>>>
>>>>>>>> Fix it to make mesa happy (the hardware doesn't care about the 2 higher
>>>>>>>> bits, as they weren't consumed on this platform).
>>>>>>>>
>>>>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>>> ---
>>>>>>>>    drivers/soc/qcom/ubwc_config.c | 2 +-
>>>>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
>>>>>>>> index 9caecd071035ccb03f14464e9b7129ba34a7f862..96b94cf01218cce2dacdba22c7573ba6148fcdd1 100644
>>>>>>>> --- a/drivers/soc/qcom/ubwc_config.c
>>>>>>>> +++ b/drivers/soc/qcom/ubwc_config.c
>>>>>>>> @@ -103,7 +103,7 @@ static const struct qcom_ubwc_cfg_data sm6115_data = {
>>>>>>>>    static const struct qcom_ubwc_cfg_data sm6125_data = {
>>>>>>>>        .ubwc_enc_version = UBWC_1_0,
>>>>>>>>        .ubwc_dec_version = UBWC_3_0,
>>>>>>>> -    .ubwc_swizzle = 1,
>>>>>>>> +    .ubwc_swizzle = 7,
>>>>>>>>        .highest_bank_bit = 14,
>>>>>>>>    };
>>>>>>>
>>>>>>> Add a comment and squash into the patch 1.
>>>>>>
>>>>>> I don't think that's a good idea, plus this series should be merged
>>>>>> together anyway
>>>>>
>>>>> Well... Granted Rob's comment, I really think the patches should be reordered a bit:
>>>>>
>>>>> - MDSS: offset HBB by 13 (patch 2)
>>>>> - switch drm/msm/mdss and display to common DB (patches 1+3 squashed)
>>>>> - get a handle (patch 4)
>>>>> - resolve / simplify (patches 5-10, not squashed)
>>>>> - fix sm6125 (patch 13)
>>>>> - WARN_ON (swizzle != swizzle) or (HBB != HBB)
>>>>> - switch to common R/O config, keeping WARN_ON for the calculated values (with the hope to drop them after testing)
>>>>
>>>> Does this bring any functional benefit? This series is unfun to remix
>>>
>>> I know the pain.
>>>
>>> The functional benefit is to have the WARN_ON and side-by-side comparison of common_ubwc_config vs computed ubwc_config for HBB and swizzle.
>>
>> HBB I agree, since we'll be outsourcing it to yet another driver, swizzle
>> should be good enough (tm) - I scanned through the values in the driver
>> and couldn't find anything wrong just by eye
> 
> Well. What is the ubwc_swizzle value used for SDM845? I think it
> should be 6 according to a6xx_gpu.c and 0 according to msm_mdss.c.
> Yes, higher bits are most likely ignored. Still, we'd better have one
> correct value.

Ehh, so laziness bites after all..

Unfortunately it seems like I don't have a good answer for you
- although I can infer a technically valid config for these
at the very least:

msm8937
msm8998
sc8180x
sdm670
sdm845
sm6150
sm7150
sm8150

with the ubwc1.0 platforms receiving all 3 levels and ubwc 2.0/
3.0 enabling 2/3

this however I'm not sure matches what downstream does..

Konrad
