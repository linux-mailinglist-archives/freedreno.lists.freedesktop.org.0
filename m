Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D869AB8C8E
	for <lists+freedreno@lfdr.de>; Thu, 15 May 2025 18:36:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1505910E90B;
	Thu, 15 May 2025 16:36:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LiROpoKj";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ECEB10E90B
 for <freedreno@lists.freedesktop.org>; Thu, 15 May 2025 16:36:05 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFXEc021314
 for <freedreno@lists.freedesktop.org>; Thu, 15 May 2025 16:36:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Mf1yxC4j/0xqckE1bjp6hJEa7TWXoohzaf1QFVhnFec=; b=LiROpoKjmM84CxmY
 UidQ2afnAkgqV+FMbKnoXu4FFizXiPKgDgrqgzJYYhTBDWSa2J9kWEa4K0ua+8PY
 bhA2GIdI3LCaisKR23O/t7EM3ZU/WfKbVYG/zMtQmCis4H84VcWdgW6TSzJuX2d1
 TDOXnTW1dX5oiw/5tZ3ZT4BYPCXHmFsI2a1PADrQLubPMw3zlfwFTTZrNWDWSShx
 wLD8OZd+YYCAoIWapErPYpjRpsZs3jR5ZKYLPG5LCTJFOsdCPSRl2SV4CR+zHek2
 b/t4L4nnwrnRFw5sv+szt03PcJltkkalO9fDQQSwshB0se1tWbBg4HT9qdNnuyhx
 zSbnJA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbew6t7w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 15 May 2025 16:36:04 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6f8aa327049so317576d6.0
 for <freedreno@lists.freedesktop.org>; Thu, 15 May 2025 09:36:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747326964; x=1747931764;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Mf1yxC4j/0xqckE1bjp6hJEa7TWXoohzaf1QFVhnFec=;
 b=WHChZPzWfW6ffYkEh6nu2DXIatKwlu/HW5ZRnItbJ8bjgRltG5YyTIGtyS4+3uOjFy
 m5I1K0mUbamvIH4Hp3+ZwCTfFDhwluUijX3WMysRX0Oy2dA5C58vJuxQ5xDy5OI6ZSyC
 gjU3u7PbWMV/nkhbAcz1QbMyM3dI/2/+yRcS/R4678QlTQvzfOo7ttJ8raB0G1Y837FC
 hkyQrkyPqRrxXmCxQnEZ0q0v0nM/t1BqoN/5ZlbUPxWGlYe2ScAa8Q3g8Ye7POpmyYAs
 LhKVozPRscmrYBbUVQe/NVbcQ6tPAHRY7G0OhRdYabbiQj+HA/lUTfT6ffn2oITGXf6Y
 YZWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAOeDpcCYDo9QZ08oku2S56Me9tKkT/gLM2/1eEXBMU4Npeq4N5fcbcV560vx1A1pz5q4rPEXzm9w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWnOyNuv+5N2c2IwiMV0j887gGv3+idEB+7IhBJ/JiqpCBJuZz
 lIKI7DxjsfUQ0kaZjs13pzHs8uME493IAmoAOtCPcQ83PzebOmj0HpBL/mtrVq5YOiLX4dSbD5B
 uNw4kGHNhMofZuLE3V2eARpOvZm7OFU5m3HfzyfjZpJO3QH49dXZmZZgp1p+FgwxCrAfwaic=
X-Gm-Gg: ASbGnctLF1U3a0Gr5LJhW9MEPlUtJSxALKNLvO+HtjDWno3ljW+sZzd3BozbsuvdiDm
 rkLFvteAP5QQ3CBPu2jGyeclLc+XZlLTrUSTwdDHyFlw+Ne19u/mX8zatxN7AzPXx8/kzDTw/Vb
 o227P1LW0SAW8yRu4vVgZkHnm7sifF+1G6BrPtYWFG/0myWXQHtE4jAkS2PhirMbOow/a4TPXD1
 WMOcspbCeFtUh7TPIicglbSa+8yR0nQlh6UNHkz2q4SkfobQ2eDp07lftfcjGgXHal62bwZotua
 xlV2O8JlN0IkKpIPVILnJeNLx4aC5tEpNTO2Ll0n3Y8OUIm0fCnbpcZinPDzxQjxEg==
X-Received: by 2002:a05:6214:2602:b0:6e4:449c:ab1d with SMTP id
 6a1803df08f44-6f8b0806253mr2293816d6.2.1747326963634; 
 Thu, 15 May 2025 09:36:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvNUL5j6UfTHgiyVUOwjbW+ErGEGSr6X1GGt17A/3JvM7gfGdKNGvp9n+/7pu4N7fYdG51Lg==
X-Received: by 2002:a05:6214:2602:b0:6e4:449c:ab1d with SMTP id
 6a1803df08f44-6f8b0806253mr2293666d6.2.1747326963035; 
 Thu, 15 May 2025 09:36:03 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6005a6e63a0sm72049a12.39.2025.05.15.09.36.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 May 2025 09:36:01 -0700 (PDT)
Message-ID: <d0a036e7-605b-4475-8ddc-69482e16f0b3@oss.qualcomm.com>
Date: Thu, 15 May 2025 18:35:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v2 13/15] soc: qcom: ubwc: Fix SM6125's ubwc_swizzle
 value
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4ec678b4-9e69-4ba0-a59d-f2e0948a73ce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: fWH7p2SzqC4cxnyr8L-aEeUPv7GWpydW
X-Proofpoint-ORIG-GUID: fWH7p2SzqC4cxnyr8L-aEeUPv7GWpydW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE2NCBTYWx0ZWRfX3z4Rf9Ua2p7S
 g/pfVzqDbYTZ8+ZEl+eIZWGgHXhV5hqqGLY6M72Hqnc9S2OT05V9+p8G9nWFAbG046oaZO0S/xQ
 PviFvFfmjIvVob5371wZ0aMR0+HXqpF+Hla9fGhY0BAlDajUSG+b4LDrshylhAM2sy7RwZQoAVf
 LOt9E/Ef6ql6PPNT5d7KGA+0Zo3sD0YZxl9/FEWjob3abNmUuFmuJCimNthGamfA6khB41vFSW2
 +IlHUe/KVjfOhGpp2s3Fi6AYJ5b9n0EqpsxOur+5Pcm93ys7AU26YlYfL/AHDbhHml9X6igS7nw
 w75Zvylol29jCEOps4gDyf+J0xtNUN16saE/0zzTmJaEVkxEz6Zqrp5pFeqsNP+mPtR6MtxQg8g
 Dm4bO/ZCsYUjzMfOqRvaKHrIxwoeZaAeoFXBoj7LdXeWs4+c/7Ql5k7WX3wMNTWxYrPIEWoF
X-Authority-Analysis: v=2.4 cv=LOFmQIW9 c=1 sm=1 tr=0 ts=682617f4 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=_jjhv_60NFWZV4FgBwEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_07,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0 bulkscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150164
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

On 5/15/25 6:21 PM, Dmitry Baryshkov wrote:
> On 15/05/2025 19:18, Konrad Dybcio wrote:
>> On 5/14/25 10:33 PM, Dmitry Baryshkov wrote:
>>> On 14/05/2025 23:05, Konrad Dybcio wrote:
>>>> On 5/14/25 9:23 PM, Dmitry Baryshkov wrote:
>>>>> On Wed, May 14, 2025 at 05:10:33PM +0200, Konrad Dybcio wrote:
>>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>
>>>>>> The value of 7 (a.k.a. GENMASK(2, 0), a.k.a. disabling levels 1-3 of
>>>>>> swizzling) is what we want on this platform (and others with a UBWC
>>>>>> 1.0 encoder).
>>>>>>
>>>>>> Fix it to make mesa happy (the hardware doesn't care about the 2 higher
>>>>>> bits, as they weren't consumed on this platform).
>>>>>>
>>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>> ---
>>>>>>    drivers/soc/qcom/ubwc_config.c | 2 +-
>>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
>>>>>> index 9caecd071035ccb03f14464e9b7129ba34a7f862..96b94cf01218cce2dacdba22c7573ba6148fcdd1 100644
>>>>>> --- a/drivers/soc/qcom/ubwc_config.c
>>>>>> +++ b/drivers/soc/qcom/ubwc_config.c
>>>>>> @@ -103,7 +103,7 @@ static const struct qcom_ubwc_cfg_data sm6115_data = {
>>>>>>    static const struct qcom_ubwc_cfg_data sm6125_data = {
>>>>>>        .ubwc_enc_version = UBWC_1_0,
>>>>>>        .ubwc_dec_version = UBWC_3_0,
>>>>>> -    .ubwc_swizzle = 1,
>>>>>> +    .ubwc_swizzle = 7,
>>>>>>        .highest_bank_bit = 14,
>>>>>>    };
>>>>>
>>>>> Add a comment and squash into the patch 1.
>>>>
>>>> I don't think that's a good idea, plus this series should be merged
>>>> together anyway
>>>
>>> Well... Granted Rob's comment, I really think the patches should be reordered a bit:
>>>
>>> - MDSS: offset HBB by 13 (patch 2)
>>> - switch drm/msm/mdss and display to common DB (patches 1+3 squashed)
>>> - get a handle (patch 4)
>>> - resolve / simplify (patches 5-10, not squashed)
>>> - fix sm6125 (patch 13)
>>> - WARN_ON (swizzle != swizzle) or (HBB != HBB)
>>> - switch to common R/O config, keeping WARN_ON for the calculated values (with the hope to drop them after testing)
>>
>> Does this bring any functional benefit? This series is unfun to remix
> 
> I know the pain.
> 
> The functional benefit is to have the WARN_ON and side-by-side comparison of common_ubwc_config vs computed ubwc_config for HBB and swizzle.

HBB I agree, since we'll be outsourcing it to yet another driver, swizzle
should be good enough (tm) - I scanned through the values in the driver
and couldn't find anything wrong just by eye

I realize this sounds funny, but all in all I don't think it's worth the
effort just for that one

Konrad
