Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1022CA82AB5
	for <lists+freedreno@lfdr.de>; Wed,  9 Apr 2025 17:40:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A66C10E127;
	Wed,  9 Apr 2025 15:40:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ObUY/g/I";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8349A10E06E
 for <freedreno@lists.freedesktop.org>; Wed,  9 Apr 2025 15:40:24 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5398OqIa023055
 for <freedreno@lists.freedesktop.org>; Wed, 9 Apr 2025 15:40:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 K9BPk28PAc9fisqkhvrEcPgWYuoMztzSJu7m7KRysU8=; b=ObUY/g/IZ0oO6wDD
 z6B3BmhNGOD2unIq3FYwV22xMwQXQmQgA7dbEF3FgKdNBj77UpJ7/LF3IYR+lVxD
 uDxkDFLyUrSvm0ON0ukXup0Sxv606DVfH8SaZOPa7wVRFFBsvrrTcyL3scT1mXLg
 qkZfYYHZkrSQQeCexNGm/Jfq2eC1CZjJmwmTcwFdQvT9bGwUQ/4R/SfKK6I9Qyjm
 QEtTImpBUop7Grl/3EH9lL0irgqgKcfLbgkmXIYKjV8bIUdpuRClO78Mgc2encsm
 Mk4z4hSgvgF9QHUR18j6xJ1NT7jF8IlJTMI8nrGU+MPm20mS5oGzZKvGR1QyYTjv
 dT53Qw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twfkkrax-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 09 Apr 2025 15:40:22 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-476718f9369so14972171cf.3
 for <freedreno@lists.freedesktop.org>; Wed, 09 Apr 2025 08:40:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744213222; x=1744818022;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K9BPk28PAc9fisqkhvrEcPgWYuoMztzSJu7m7KRysU8=;
 b=GAkyOYfoSP1UmmDlMmi3q5EJ8ffA2E8y2cWBlYmYrDwlEgq2FHBqqXjkViFjGqriLA
 sFXA5ke61LRMNp9oVRgOE301kKpXUiQlL6a8rENxHp6f6n/8MtT+SuZbSZO2rfZfVI8y
 Nd1BeP+zpiaAr/dakVnQ3pZ5z94m5D//jqp6KJz8idEKsyd9MxzqQLHGYMA8fyfFL6N0
 h8DGRRSL57EkKCbk3CnM/9YKwQ7mKu6uqPTu36V9mhIVUlf9EvMh8w/05U1HmfdlMO7T
 604wRfOL2zXtn8/Vefzj7UepOvINYm79j3N5Y9CGHcT6kcdujTtu9mY1DcmlsAN4bzF1
 LQRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHpRWjpK7IPkORQ7JFIz/SiviJu0bu5o9TYMShzPuLQOuDG7Bz2dvMqZVxMLPcs3pdkoR64eEVLd0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy6t2lVQBGKcXWv56c3P2GJEWUKnNVPF5pqh7kYp8PRogTnNS1j
 2AZg4vEmCSx31aPJGb5CybSZ/S2qlrIjO8GjxfaIoYVVjT7dvlDAebzBfjdM9AGEnYEQaaEk7GN
 sbRCgYb8vYUa8KlQebuDb4UxoP1JqFPYdzX4H9W6RtfVMUu7nAX1ALlvQdtGcga2mbC0=
X-Gm-Gg: ASbGncsvaAFRxqRytuT8nfx6UWdUjWU/S/MTz23AaA575B7im4k/cnFaRDhJZAWpWUM
 +h/kkaOzwr3+2M9v1kjqsJLsIsb4DtCbcovWLC2fBie8j2qkLnIgz/nlygWvDqKI1MfZn3BGpmY
 alH2B7eD0opC/WXjoGh/iRMz4915KHyvBKKSmcxSe4DCBljNkGs7zHi9uO0tz5s/4+V4uUk2wSX
 Son1HzESrGiu3hYCePblch1KMHzuYlxYdtuT5Y1OWJZTaoFu2k2PQEj+vLZHSkcbYkdjIY69axl
 ZDIrJZwp/QZTHDGX42BojbkkLHr2RsBK4f+hM5eBzcStnKYxpdEGqfHr1LqRUJIt2A==
X-Received: by 2002:a05:620a:2845:b0:7c0:9ac5:7f96 with SMTP id
 af79cd13be357-7c79cb32476mr192356885a.0.1744213221716; 
 Wed, 09 Apr 2025 08:40:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0y2JAYIsBZUZsxYlHzS9wyRxq0XZG+P+f9vATezBrv2Np+gMPt+9chspODJu7JrDLBQu+kA==
X-Received: by 2002:a05:620a:2845:b0:7c0:9ac5:7f96 with SMTP id
 af79cd13be357-7c79cb32476mr192355385a.0.1744213221343; 
 Wed, 09 Apr 2025 08:40:21 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f2fbd34dbcsm922827a12.66.2025.04.09.08.40.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Apr 2025 08:40:20 -0700 (PDT)
Message-ID: <9a12e042-487b-4937-a583-709f0c37ab12@oss.qualcomm.com>
Date: Wed, 9 Apr 2025 17:40:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/msm/a6xx: Get HBB dynamically, if available
To: Connor Abbott <cwabbott0@gmail.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20250409-topic-smem_dramc-v1-0-94d505cd5593@oss.qualcomm.com>
 <20250409-topic-smem_dramc-v1-3-94d505cd5593@oss.qualcomm.com>
 <CACu1E7GMf0Mx2ZX_t76h+b1CPin49LGix7c5uvoWaJZC3dKyOw@mail.gmail.com>
 <c2dac38b-bbe5-4cd1-9d33-b4bba629d54b@oss.qualcomm.com>
 <CACu1E7F71M0Z5KUdArRYbLEMXoS3jQEtp=0-4LEYFRysOsYZfA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACu1E7F71M0Z5KUdArRYbLEMXoS3jQEtp=0-4LEYFRysOsYZfA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: DkMW0uWdiH06vz__nNCy9QPH_ZUFAMaQ
X-Proofpoint-ORIG-GUID: DkMW0uWdiH06vz__nNCy9QPH_ZUFAMaQ
X-Authority-Analysis: v=2.4 cv=b7Oy4sGx c=1 sm=1 tr=0 ts=67f694e6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=RexmrgqQAhuxw17nEtEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_05,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090099
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

On 4/9/25 5:30 PM, Connor Abbott wrote:
> On Wed, Apr 9, 2025 at 11:22 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 4/9/25 5:12 PM, Connor Abbott wrote:
>>> On Wed, Apr 9, 2025 at 10:48 AM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>>>
>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>
>>>> The Highest Bank address Bit value can change based on memory type used.
>>>>
>>>> Attempt to retrieve it dynamically, and fall back to a reasonable
>>>> default (the one used prior to this change) on error.
>>>>
>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>> ---
>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 22 ++++++++++++++++------
>>>>  1 file changed, 16 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>> index 06465bc2d0b4b128cddfcfcaf1fe4252632b6777..0cc397378c99db35315209d0265ad9223e8b55c7 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>> @@ -13,6 +13,7 @@
>>>>  #include <linux/firmware/qcom/qcom_scm.h>
>>>>  #include <linux/pm_domain.h>
>>>>  #include <linux/soc/qcom/llcc-qcom.h>
>>>> +#include <linux/soc/qcom/smem.h>
>>>>
>>>>  #define GPU_PAS_ID 13
>>>>
>>>> @@ -669,17 +670,22 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>>>  static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>>>>  {
>>>>         struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>>>> +       u32 hbb = qcom_smem_dram_get_hbb();
>>>> +       u32 ubwc_mode = adreno_gpu->ubwc_config.ubwc_swizzle & 1;
>>>> +       u32 level2_swizzling_dis = !(adreno_gpu->ubwc_config.ubwc_swizzle & 2);
>>>> +       u32 hbb_hi, hbb_lo;
>>>> +
>>>>         /*
>>>>          * We subtract 13 from the highest bank bit (13 is the minimum value
>>>>          * allowed by hw) and write the lowest two bits of the remaining value
>>>>          * as hbb_lo and the one above it as hbb_hi to the hardware.
>>>>          */
>>>> -       BUG_ON(adreno_gpu->ubwc_config.highest_bank_bit < 13);
>>>> -       u32 hbb = adreno_gpu->ubwc_config.highest_bank_bit - 13;
>>>> -       u32 hbb_hi = hbb >> 2;
>>>> -       u32 hbb_lo = hbb & 3;
>>>> -       u32 ubwc_mode = adreno_gpu->ubwc_config.ubwc_swizzle & 1;
>>>> -       u32 level2_swizzling_dis = !(adreno_gpu->ubwc_config.ubwc_swizzle & 2);
>>>> +       if (hbb < 0)
>>>> +               hbb = adreno_gpu->ubwc_config.highest_bank_bit;
>>>
>>> No. The value we expose to userspace must match what we program.
>>> You'll break VK_EXT_host_image_copy otherwise.
>>
>> I didn't know that was exposed to userspace.
>>
>> The value must be altered either way - ultimately, the hardware must
>> receive the correct information. ubwc_config doesn't seem to be const,
>> so I can edit it there if you like it better.
>>
>> Konrad
> 
> Yes, you should be calling qcom_smem_dram_get_hbb() in
> a6xx_calc_ubwc_config(). You can already see there's a TODO there to
> plug it in.

Does this look good instead?

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 0cc397378c99..ae8dbc250e6a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -588,6 +588,8 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
 
 static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 {
+       u8 hbb;
+
        gpu->ubwc_config.rgb565_predicator = 0;
        gpu->ubwc_config.uavflagprd_inv = 0;
        gpu->ubwc_config.min_acc_len = 0;
@@ -636,7 +638,6 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
            adreno_is_a690(gpu) ||
            adreno_is_a730(gpu) ||
            adreno_is_a740_family(gpu)) {
-               /* TODO: get ddr type from bootloader and use 2 for LPDDR4 */
                gpu->ubwc_config.highest_bank_bit = 16;
                gpu->ubwc_config.amsbc = 1;
                gpu->ubwc_config.rgb565_predicator = 1;
@@ -665,6 +666,13 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
                gpu->ubwc_config.highest_bank_bit = 14;
                gpu->ubwc_config.min_acc_len = 1;
        }
+
+       /* Attempt to retrieve HBB data from SMEM, keep the above defaults in case of error */
+       hbb = qcom_smem_dram_get_hbb();
+       if (hbb < 0)
+               return;
+
+       gpu->ubwc_config.highest_bank_bit = hbb;
 }
 
 static void a6xx_set_ubwc_config(struct msm_gpu *gpu)


Konrad
