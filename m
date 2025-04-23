Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AABCCA990D2
	for <lists+freedreno@lfdr.de>; Wed, 23 Apr 2025 17:23:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 733A210E6E1;
	Wed, 23 Apr 2025 15:23:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OM9E2ZUy";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD77810E6E1
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 15:23:49 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAt75P017255
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 15:23:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 r3FIkxvIinGQIcn2H7NbkL17x51IYW6d98QsKUMr6mM=; b=OM9E2ZUy88IfGzVL
 FoatmTtvhHzimCX7SP40jD5dm4SdjRbCGLzLC8D/vnO3aIYKZF5HdjzMVGMlqZPy
 mqojsB0Jv2CVheREflSAupJj2e5l21D4FfGn1TWumer7Tl1a9jaLOy25UN6uze7V
 zszN9rfpfUXbRDR0Fl0KBeL/r4UmLVBi79RGr/jGus4XfKqWlRwbnQCIYC+LcK7k
 C77M7vBEehcysBHElXFFeR40tWqcdY/38hjCI3WEAz09wtb4JSBD2MH5VJm8YCHS
 ezXgBV7ZY56YWioqDuzBv9O7JUgJxRdcKQBRPwZ4R6GKUtufn7hvQv33ZgHsFT+k
 yFxR9A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3jjaq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 15:23:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c5e28d0cc0so1112267585a.3
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 08:23:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745421828; x=1746026628;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r3FIkxvIinGQIcn2H7NbkL17x51IYW6d98QsKUMr6mM=;
 b=YJB1+egK1rM5YT6HCvabM+It/KvS9M6dLC7wUs7pL5a+shsSjMkp5mp/EHQ0b8ATgk
 rw2Yrxd78caGjFPumhU91rdVgEsYbyQ7PX0Y8N2GXo2EWjc0iit9zgBuXCJjiB0pDmLD
 ee3ptBK1u1yOhwbvSHhGb8W4W6/aCY/WMwUkFP/mQ6s2eLdEH8kTcYKLI6MUgGaNIlbj
 cwkX3fmE+Em8Y4JmZkk0kPD0h81CPgQnacPds3e7+TpQYFRZlfa4wmD8a38Zy1185AR6
 AOfXo3a5XG7oPG2RybEfDis40LstITJyNBuUnRUT8xcyLi6h6gz4/Yiubea2Ywf1Np+Z
 QN4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfl6+oYaX4y4Bw6BZl9gGRBWwXWuRY7q5PTvugnAYozEtl/PJ++vLilERQ5oGuKGre2aOD4XBP+1s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxSj4qeDfvDz6CPOaQqXmbO4Rp8Z1AzjrJea0zLxa7vS3uRWz/U
 qF8Vc4F80e5CEb/4S2oq+pmQiOpVcYhzqxz0Ed5eVgvZ2AR3RWGy82ut88csGwx18d39067EQGk
 Pg+k9hGQNTDYl2zq6z7bmBCUApd5RcI6YTGQ8VO+vJtHDv7EuquongYD5V8uREEpbAn0=
X-Gm-Gg: ASbGncsgeBK0RUF11xPHBPteL9qzR7IbUn2tKp/HhNlHmcGWvX/kNEY9CwHTQL1Pnkn
 mYl7GkHd4mwwA6A78yie/npFabnBocCWlyoQfawIMNUO6gJnySTYmymcwZMS8jYBIda0eWaq/ef
 dSg0MCnhAQH5pBZzhDwh1eYDs0m5QC2JHaKML32wJPuuypiE/n36PMbarg0qc+xWtbg0SF09hIV
 qmhPwa3BACDtvPOHezztZbgis2neGYVtnuProId05Iiy5jQrcasFA+s4kStXys9RqVsJ02O+0b7
 EOXEBmd8PIZE413P9XM9LCyI9rFx7bfhfFs6wOZcgIlaRKzQklS9T4r1MnCpj2eRrnR1eTtbwXg
 zlsqiLLJXtJ+AJUOP0pAWTYx00swc6wQZIMLUOn3Be7Z36m/xLPz38NFkNht6QEPp
X-Received: by 2002:a05:620a:4149:b0:7c5:3cf6:7838 with SMTP id
 af79cd13be357-7c92805dcd3mr3251754885a.49.1745421827618; 
 Wed, 23 Apr 2025 08:23:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4VINuu2Xy9f+Jgd9x+sEEy1ml8USXXDrXZs3i+/S1a0FB6ilwJUPYzKZPPdxuaxS+9i8laA==
X-Received: by 2002:a05:620a:4149:b0:7c5:3cf6:7838 with SMTP id
 af79cd13be357-7c92805dcd3mr3251749885a.49.1745421827190; 
 Wed, 23 Apr 2025 08:23:47 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ce:6a0b:b501:c51a:e775:2fe5?
 (2001-14bb-ce-6a0b-b501-c51a-e775-2fe5.rev.dnainternet.fi.
 [2001:14bb:ce:6a0b:b501:c51a:e775:2fe5])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-31090822c3asm19762901fa.65.2025.04.23.08.23.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Apr 2025 08:23:46 -0700 (PDT)
Message-ID: <6233171a-2964-4d57-986c-d3f1725eacd6@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 18:23:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] drm/msm/a6xx: Get HBB dynamically, if available
To: Rob Clark <robdclark@gmail.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Connor Abbott <cwabbott0@gmail.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 linux-hardening@vger.kernel.org, dri-devel
 <dri-devel@lists.freedesktop.org>, freedreno@lists.freedesktop.org
References: <20250410-topic-smem_dramc-v2-0-dead15264714@oss.qualcomm.com>
 <20250410-topic-smem_dramc-v2-3-dead15264714@oss.qualcomm.com>
 <20911703-ab4e-4eb2-8611-294730a06d2f@quicinc.com>
 <CACu1E7HDmQXDNtEQCXpHXsOKPCOgrWgo+_kcgizo9Mp1ntjDbA@mail.gmail.com>
 <1282bf58-e431-4a07-97e5-628437e7ce5f@quicinc.com>
 <CACu1E7GwMCt6+JJQGgSvJObTMMWYLPd69owyFo7S=sxu_EEsUw@mail.gmail.com>
 <16845de2-a40a-4e3d-b3aa-c91e7072b57f@quicinc.com>
 <CAF6AEGvyeRLHFBYmxkevgT+hosXGiH_w8Z+UjQmL+LdbNfVZ+w@mail.gmail.com>
 <acd1c8dd-286b-40b7-841d-e53e2d155a61@oss.qualcomm.com>
 <CAF6AEGts5rWvgyZy8RtAaUOsad362AG-uNjxF9vyj4szg=b5Bw@mail.gmail.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <CAF6AEGts5rWvgyZy8RtAaUOsad362AG-uNjxF9vyj4szg=b5Bw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: L8bA7fqLWfa5Su0Z_CURy_rqGeZPP0ez
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDEwOCBTYWx0ZWRfX+49bmqCnP7ws
 pC+3I9lxL2aCS+siwYJOdLS6GFEmbcxAZS9EX8b47JXI+lYhxwyDJzDVQwbac4w/LsSsFr7qiqR
 zeiuwxRb6yhcEVKzLHLWJfupWWcRkOTd9chVN8M/En0KxWMKmnhWtBcTO8Qn37P35W4nlJoAZC1
 mFsMI147k3gqT6vbCNUBUU7fmMGiUrGPnwCdEOsmVTspbkSFXq62zpK786eqwjnjf1B8tUqS442
 TbZg/lEx2Pa2225hUdXrsXSGFER6wR3wBSLVgpz/9As2U7xqHZH0eaAcL5FKbYKDnc0zplC9UeJ
 9Pmvrp0RURDR5+vTHyA5VXdFSQf3rHgbNWzk1q5J37OQL1vqrQwRUiIeifmwUmygJhfHMpJsenb
 BB1fTs1jhBa6+IEHtijL8w7i7LGBy/1jw3WiC6ukbpE/iggBEHrnoyFACR5r/CkaNujHaLHZ
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=68090604 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=INHOtyMNgn4pQtdJY3IA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: L8bA7fqLWfa5Su0Z_CURy_rqGeZPP0ez
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_09,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230108
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

On 23/04/2025 17:55, Rob Clark wrote:
> On Tue, Apr 22, 2025 at 4:57 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 4/21/25 10:13 PM, Rob Clark wrote:
>>> On Fri, Apr 18, 2025 at 9:00 AM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>>
>>>> On 4/18/2025 6:40 AM, Connor Abbott wrote:
>>>>> On Thu, Apr 17, 2025, 1:50 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>>>>
>>>>>> On 4/17/2025 9:02 PM, Connor Abbott wrote:
>>>>>>> On Thu, Apr 17, 2025 at 3:45 AM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>>>>>>
>>>>>>>> On 4/10/2025 11:13 PM, Konrad Dybcio wrote:
>>>>>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>>>>
>>>>>>>>> The Highest Bank address Bit value can change based on memory type used.
>>>>>>>>>
>>>>>>>>> Attempt to retrieve it dynamically, and fall back to a reasonable
>>>>>>>>> default (the one used prior to this change) on error.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>>>> ---
>>>>>>>>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 15 ++++++++++++++-
>>>>>>>>>   1 file changed, 14 insertions(+), 1 deletion(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>>>>> index 06465bc2d0b4b128cddfcfcaf1fe4252632b6777..a6232b382bd16319f20ae5f8f5e57f38ecc62d9f 100644
>>>>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>>>>> @@ -13,6 +13,7 @@
>>>>>>>>>   #include <linux/firmware/qcom/qcom_scm.h>
>>>>>>>>>   #include <linux/pm_domain.h>
>>>>>>>>>   #include <linux/soc/qcom/llcc-qcom.h>
>>>>>>>>> +#include <linux/soc/qcom/smem.h>
>>>>>>>>>
>>>>>>>>>   #define GPU_PAS_ID 13
>>>>>>>>>
>>>>>>>>> @@ -587,6 +588,8 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
>>>>>>>>>
>>>>>>>>>   static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>>>>>>>>   {
>>>>>>>>> +     int hbb;
>>>>>>>>> +
>>>>>>>>>        gpu->ubwc_config.rgb565_predicator = 0;
>>>>>>>>>        gpu->ubwc_config.uavflagprd_inv = 0;
>>>>>>>>>        gpu->ubwc_config.min_acc_len = 0;
>>>>>>>>> @@ -635,7 +638,6 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>>>>>>>>            adreno_is_a690(gpu) ||
>>>>>>>>>            adreno_is_a730(gpu) ||
>>>>>>>>>            adreno_is_a740_family(gpu)) {
>>>>>>>>> -             /* TODO: get ddr type from bootloader and use 2 for LPDDR4 */
>>>>>>>>>                gpu->ubwc_config.highest_bank_bit = 16;
>>>>>>>>>                gpu->ubwc_config.amsbc = 1;
>>>>>>>>>                gpu->ubwc_config.rgb565_predicator = 1;
>>>>>>>>> @@ -664,6 +666,13 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>>>>>>>>                gpu->ubwc_config.highest_bank_bit = 14;
>>>>>>>>>                gpu->ubwc_config.min_acc_len = 1;
>>>>>>>>>        }
>>>>>>>>> +
>>>>>>>>> +     /* Attempt to retrieve the data from SMEM, keep the above defaults in case of error */
>>>>>>>>> +     hbb = qcom_smem_dram_get_hbb();
>>>>>>>>> +     if (hbb < 0)
>>>>>>>>> +             return;
>>>>>>>>> +
>>>>>>>>> +     gpu->ubwc_config.highest_bank_bit = hbb;
>>>>>>>>
>>>>>>>> I am worried about blindly relying on SMEM data directly for HBB for
>>>>>>>> legacy chipsets. There is no guarantee it is accurate on every chipset
>>>>>>>> and every version of firmware. Also, until recently, this value was
>>>>>>>> hardcoded in Mesa which matched the value in KMD.
>>>>>>>
>>>>>>> To be clear about this, from the moment we introduced host image
>>>>>>> copies in Mesa we added support for querying the HBB from the kernel,
>>>>>>> explicitly so that we could do what this series does without Mesa ever
>>>>>>> breaking. Mesa will never assume the HBB unless the kernel is too old
>>>>>>> to support querying it. So don't let Mesa be the thing that stops us
>>>>>>> here.
>>>>>>
>>>>>> Thanks for clarifying about Mesa. I still don't trust a data source that
>>>>>> is unused in production.
>>>>>
>>>>> Fair enough, I'm not going to argue with that part. Just wanted to
>>>>> clear up any confusion about Mesa.
>>>>>
>>>>> Although, IIRC kgsl did set different values for a650 depending on
>>>>> memory type... do you know what source that used?
>>>>
>>>> KGSL relies on an undocumented devicetree node populated by bootloader
>>>> to detect ddrtype and calculates the HBB value based on that.
>>>
>>> Would it be reasonable to use the smem value, but if we find the
>>> undocumented dt property, WARN_ON() if it's value disagrees with smem?
>>>
>>> That would at least give some confidence, or justified un-confidence
>>> about the smem values
>>
>> The aforementioned value is populated based on the data that this
>> driver reads out, and only on the same range of platforms that this
>> driver happens to cater to
> 
> Did I understand that correctly to mean that the dt property is based
> on the same smem value that you are using?  In that case, there should
> be no argument against using the smem value as the source of truth.

It is, but is done by the bootloader that knows exact format of the data.


-- 
With best wishes
Dmitry
