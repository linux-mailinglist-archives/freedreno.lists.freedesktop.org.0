Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DFDA82A0B
	for <lists+freedreno@lfdr.de>; Wed,  9 Apr 2025 17:22:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33A3510E93E;
	Wed,  9 Apr 2025 15:22:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FWte/KnC";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5331810E93E
 for <freedreno@lists.freedesktop.org>; Wed,  9 Apr 2025 15:22:34 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5398eDTZ023036
 for <freedreno@lists.freedesktop.org>; Wed, 9 Apr 2025 15:22:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 iCuvAY1136gR39qITiq/pHL207Ayurzq2f2+DfiLkY8=; b=FWte/KnCblohf2nC
 y2Vv4N1lU7dFggpsR0imf8eDB8KJptYiL0xhNftuZaEItLjxG8ewnvVIFZ2Iy0Op
 AGeezaP9MxthirZHk7Lp2E+dmRvWXBcS39QJ+7bQ0iDPphp0gdbg1lG7sm3ows6p
 qEVqF26UgPbhX7OCFdYoHoEPlUtLufIkEykMeK7FKXk31hd8xwg80S7K4p1DTcFa
 7/lRpO4eYLmsN7PQyOF52HmMvt54VjTYp4LRVsafx8fSAiBqE1vq1OoZxuODsRzG
 /eJaGSqaqN6Zec4tGCm/ywAskOF08oom6xvINDw12St3Cw3hkuzZvhBPA5HGzP7f
 0lrrLg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twfkkpxb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 09 Apr 2025 15:22:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c5530c2e01so66124785a.0
 for <freedreno@lists.freedesktop.org>; Wed, 09 Apr 2025 08:22:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744212152; x=1744816952;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iCuvAY1136gR39qITiq/pHL207Ayurzq2f2+DfiLkY8=;
 b=oE9EzqOpl9k5/JPS6GAqaJJ0PU2qmFyTvhLE3+oJbOZFmpvZ2MYaFzbAErsT3QF/fp
 KzRS8euJyCk54fVM6Gr/4/dPrSbo/z0CQfBi+aF4lLdSddITW97vXGBUYfwIcAXQUzRT
 T+BExbnwOlUhJYa4EH5ww76J3i7RrV6DuqZnUoFblq110bKP+6y6CTw5a5+C3liu32nR
 YqGJoSZ3XVGbiRC8A1RZzjQXUEokqlyqgugGUDFKre6ifdaDwnBITjM3S9rKFd0N1Ok1
 lgSZlw8BsXkVlqp22jHnZDRqvbrrgt2WL059+Xgfn1XIoWJevJrvjaXoXlmwfCQDLmPd
 He+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyfeJuzpuGeG9t8Rw876Dp3AGKfeF2t+4xzvVCmZbgj6bDdWlsEhiiITwTtOnIkq1jL9cS1iPly50=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwkTBlsH0OKhEjdrGIzFOp+PURjzTzJHnj7Xh4SakeW0Tjxp7Pw
 rRYYieVsrgw3LTaO/NnFpPwT0enLtflHoQghbpMEHvwylQYB0LVJWNBorK/PraowdocJdN7OZ+s
 N1fB2NpTv7dtl2XQLqStezaumf7VMuoBreTDFR1hkKSwryxTizUGwjkIDWgDpSRS5jH0=
X-Gm-Gg: ASbGncu7E5evF3OjUvHzpmI9Sw3iWfvEOE+tuC0QzAHNi4xgv3J+71d4LN98wixym/U
 waW8h2+fcR0+B5b96zGtuMpV7J3Ab2KOVxR6hq06UGkrYMw10PcqeZ2z6484GmufZ02YbKGocNS
 G3IMckhPjccj45mY6oo3B3u915GLc7RFk4ykSewh/urD4v74MMAzH4d+ikt9sPnowDzx/O0S3w1
 hPyLzn5wR9U84qgIWIzQP22DbT5JUE5pmABk41+88T4X6O6q8I860gjlYwFvFUKTF2wrZLsy26t
 2OtyNdLshFewCHck2+G28yJoRmeDTFcfW4ULKw67cXwn5aQXzImZ+iQ9e8vAt4x6yA==
X-Received: by 2002:a05:620a:2616:b0:7c0:add8:1736 with SMTP id
 af79cd13be357-7c79cc4b3f1mr182218085a.13.1744212152380; 
 Wed, 09 Apr 2025 08:22:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGu16PD6OWFhO9+2EVDMjvLbDZARn5f6zRS1+14nIt+zna7yAHulu/WcriBf7XUUO62wWUHLA==
X-Received: by 2002:a05:620a:2616:b0:7c0:add8:1736 with SMTP id
 af79cd13be357-7c79cc4b3f1mr182216085a.13.1744212152091; 
 Wed, 09 Apr 2025 08:22:32 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acaa1cb414dsm109595366b.121.2025.04.09.08.22.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Apr 2025 08:22:31 -0700 (PDT)
Message-ID: <c2dac38b-bbe5-4cd1-9d33-b4bba629d54b@oss.qualcomm.com>
Date: Wed, 9 Apr 2025 17:22:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/msm/a6xx: Get HBB dynamically, if available
To: Connor Abbott <cwabbott0@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250409-topic-smem_dramc-v1-0-94d505cd5593@oss.qualcomm.com>
 <20250409-topic-smem_dramc-v1-3-94d505cd5593@oss.qualcomm.com>
 <CACu1E7GMf0Mx2ZX_t76h+b1CPin49LGix7c5uvoWaJZC3dKyOw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACu1E7GMf0Mx2ZX_t76h+b1CPin49LGix7c5uvoWaJZC3dKyOw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: pT9cxBRxujcwW7dnY64qqS-Xmi7R4BuG
X-Proofpoint-ORIG-GUID: pT9cxBRxujcwW7dnY64qqS-Xmi7R4BuG
X-Authority-Analysis: v=2.4 cv=b7Oy4sGx c=1 sm=1 tr=0 ts=67f690b9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Z2wkywZrCN8y_YYJSgYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_05,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090097
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

On 4/9/25 5:12 PM, Connor Abbott wrote:
> On Wed, Apr 9, 2025 at 10:48 AM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> The Highest Bank address Bit value can change based on memory type used.
>>
>> Attempt to retrieve it dynamically, and fall back to a reasonable
>> default (the one used prior to this change) on error.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 22 ++++++++++++++++------
>>  1 file changed, 16 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index 06465bc2d0b4b128cddfcfcaf1fe4252632b6777..0cc397378c99db35315209d0265ad9223e8b55c7 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -13,6 +13,7 @@
>>  #include <linux/firmware/qcom/qcom_scm.h>
>>  #include <linux/pm_domain.h>
>>  #include <linux/soc/qcom/llcc-qcom.h>
>> +#include <linux/soc/qcom/smem.h>
>>
>>  #define GPU_PAS_ID 13
>>
>> @@ -669,17 +670,22 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>  static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>>  {
>>         struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>> +       u32 hbb = qcom_smem_dram_get_hbb();
>> +       u32 ubwc_mode = adreno_gpu->ubwc_config.ubwc_swizzle & 1;
>> +       u32 level2_swizzling_dis = !(adreno_gpu->ubwc_config.ubwc_swizzle & 2);
>> +       u32 hbb_hi, hbb_lo;
>> +
>>         /*
>>          * We subtract 13 from the highest bank bit (13 is the minimum value
>>          * allowed by hw) and write the lowest two bits of the remaining value
>>          * as hbb_lo and the one above it as hbb_hi to the hardware.
>>          */
>> -       BUG_ON(adreno_gpu->ubwc_config.highest_bank_bit < 13);
>> -       u32 hbb = adreno_gpu->ubwc_config.highest_bank_bit - 13;
>> -       u32 hbb_hi = hbb >> 2;
>> -       u32 hbb_lo = hbb & 3;
>> -       u32 ubwc_mode = adreno_gpu->ubwc_config.ubwc_swizzle & 1;
>> -       u32 level2_swizzling_dis = !(adreno_gpu->ubwc_config.ubwc_swizzle & 2);
>> +       if (hbb < 0)
>> +               hbb = adreno_gpu->ubwc_config.highest_bank_bit;
> 
> No. The value we expose to userspace must match what we program.
> You'll break VK_EXT_host_image_copy otherwise.

I didn't know that was exposed to userspace.

The value must be altered either way - ultimately, the hardware must
receive the correct information. ubwc_config doesn't seem to be const,
so I can edit it there if you like it better.

Konrad
