Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 637EAA97B6C
	for <lists+freedreno@lfdr.de>; Wed, 23 Apr 2025 01:57:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FC3510E3CB;
	Tue, 22 Apr 2025 23:57:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NedBK0c6";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0003310E3CE
 for <freedreno@lists.freedesktop.org>; Tue, 22 Apr 2025 23:57:35 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MKpLU8024601
 for <freedreno@lists.freedesktop.org>; Tue, 22 Apr 2025 23:57:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 H1IjI6zQkO1wJMxEGjiNO1XXndei6SHSNKx61xlsx+Y=; b=NedBK0c6t854p9eh
 CdZtrysS/hZcRtPXQSH4e/OocOoDDEuRwwwNNw9cKY3DwCW9eus4vDD697uKJhHH
 qzFbBpAMzOFKTXBtQ2cpYxlNvlDBPT9uTeB4oMXPE0dPxIfGmOm4FpKKOQGCTLV7
 lEJ++ol5DgDTCPx0w89mhnetm+jfpA68nGOGoxHrsHMEsMMzgzjP+6eIZ7ykaF90
 6z4lYqS6ext37V32U9h6BlcnNCwo/DkVEwzvrJP+D0deDUE74JTSRnzTLXZSzer6
 CnCYg9tWA0y303ceyy1h+g8uyX9uXyh1wHdAVdX9ZAgW7KPCezLRtpQCHgGkioT1
 MHmQ4A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh08aj7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 22 Apr 2025 23:57:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c555d4ad75so26222785a.0
 for <freedreno@lists.freedesktop.org>; Tue, 22 Apr 2025 16:57:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745366254; x=1745971054;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H1IjI6zQkO1wJMxEGjiNO1XXndei6SHSNKx61xlsx+Y=;
 b=KBJDElVM1ar3qNKnerJOGZf70PRvVuHI1efLyWQ4Gb0AEdJlDDHB0E8kHydPTzvGYK
 kKM7u6tHAml9lCsrF75R2kTH2CVwy++DogyxJ6j4SISTcUKy7EpnubchxWj8FJ0wLB20
 f8j/uU7IZTuSo1pdRgTuzrPt/c+kuInoOnLTkkA78x4adhrqp8wkRPxxQxVJA30QdERl
 qVbeQm2gAe2LLnPEkX9ft9Bj97XnV6H9OIZIE7pxZZqWoXsewyxbhVmkD+fWk+QnLZOE
 hgjZQto2mkeQw+RZpBZ0MVjL0Ion0pcrYzv9D7untTp9+xSswNe2FTxYVcNTdSlROZ3c
 r+Tw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3nlBgydpQ8TSSDAczdaeXsl3G985GalvnSQPUxJbi3ZAQeOlMeYE/lajUt/8aMRRTXTFz0fTRhls=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzrL50NiWw1qnO0VEztNpQ+NvuOAW70p/+Eq9HLdWS/45mVrrWz
 iH2bG+7BDop1Q1PbAbHLRb5euvO9cS8HhlRZB07s1Mp05Tvsa64x9asB203xAzH/hVBm3gz/Nbm
 mxLNqfqliFKaihEc4xQ+UaVZuabQ+0auC5v3fF5E6/RBpd/95WCRCgUcF61hYDoQ6N54=
X-Gm-Gg: ASbGncthc8ytbd1g2g5+kyYnTZlOPV12JYJZN06DKnYAJYyHdR8Pe5p8C1w1f2652FP
 HLxLHb3E4/VwB6JhcNnT0eq2Hl/1zfYNUtYiDe4m4DPkaqCjpB2h2Bdp7d3BnDsoLZEF3BvsVhD
 yu+EvYsp4KC7tGv1sDseDiJR6dvXwrPlYH2y+kO4LlFkfjqD2J1Y25YCySVLZcwDyQ0FG+bbDyv
 r+fQVJ41/1OpUXV1dOZqnDnvxTU3Muzwe+qKZF7XzttzOoM7enlglVRUn/NYP+XIhbe13tG2xWp
 ER3pGKWzyDYPr33EHAmzgixmk9swdSL8THChBz254TFPl7WvHw8uxK9r9283+vdc2Lg=
X-Received: by 2002:a05:620a:430b:b0:7c5:6fee:246f with SMTP id
 af79cd13be357-7c94d231186mr76783985a.1.1745366253958; 
 Tue, 22 Apr 2025 16:57:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEwDHPfh+3S2avLrO37FcmKZFcnMLRvAj2FgPUvuV/KU+OjhRg4HtBNyxuqy6ggiQpB23oJw==
X-Received: by 2002:a05:620a:430b:b0:7c5:6fee:246f with SMTP id
 af79cd13be357-7c94d231186mr76781285a.1.1745366253511; 
 Tue, 22 Apr 2025 16:57:33 -0700 (PDT)
Received: from [192.168.65.141] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acb6eefd8e3sm723131566b.98.2025.04.22.16.57.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 16:57:32 -0700 (PDT)
Message-ID: <acd1c8dd-286b-40b7-841d-e53e2d155a61@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 01:57:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] drm/msm/a6xx: Get HBB dynamically, if available
To: Rob Clark <robdclark@gmail.com>, Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Connor Abbott <cwabbott0@gmail.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 linux-hardening@vger.kernel.org, dri-devel
 <dri-devel@lists.freedesktop.org>, freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250410-topic-smem_dramc-v2-0-dead15264714@oss.qualcomm.com>
 <20250410-topic-smem_dramc-v2-3-dead15264714@oss.qualcomm.com>
 <20911703-ab4e-4eb2-8611-294730a06d2f@quicinc.com>
 <CACu1E7HDmQXDNtEQCXpHXsOKPCOgrWgo+_kcgizo9Mp1ntjDbA@mail.gmail.com>
 <1282bf58-e431-4a07-97e5-628437e7ce5f@quicinc.com>
 <CACu1E7GwMCt6+JJQGgSvJObTMMWYLPd69owyFo7S=sxu_EEsUw@mail.gmail.com>
 <16845de2-a40a-4e3d-b3aa-c91e7072b57f@quicinc.com>
 <CAF6AEGvyeRLHFBYmxkevgT+hosXGiH_w8Z+UjQmL+LdbNfVZ+w@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAF6AEGvyeRLHFBYmxkevgT+hosXGiH_w8Z+UjQmL+LdbNfVZ+w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 7zrBpbZtFh_ccH7GIqitchZO33puqXVA
X-Proofpoint-ORIG-GUID: 7zrBpbZtFh_ccH7GIqitchZO33puqXVA
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=68082cef cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=bi7NrT-7VlQDZNL6n6kA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIyMDE3OSBTYWx0ZWRfX5PNn+CE72Vdx
 /rJla2vvDu9foZNghJtgxIO2ciKJn+xXZOu/emh1acDF7zNKmqTjg+xa+tuX94rBlzrF6yyyDGd
 KNUguCYFLqZ36E3mwFKOD+y9FjuGsoq/tIUGznURVQZit54zEvYqkn64WJYSCb54WvNGzdrJDkX
 ckvzJq5uqEEtCF3niBs6ARn9D8FFKIpA38EXX5vpwjVVGE1Qz5VxUemKyZ4/9r80geh2mQ83PtR
 GvwvxjsQnO9OLboGUls1Kss+EYVOEWMBAjOX2aDsuJCdPhmjCAOsmRbUCb+74X8DoD5qg8iHoWy
 rLFcl7WQ2A6Jw4aCz7eeYfg1/nphSJy2xWDYmO09QFeQGF8YkWpy25XsrKp1NLNj88Cik+kk/tt
 RfbORUsRpzrx7n6Lnn7MOAvKUFhkK86CxlU7VfZiez4YL6Q4r3tlj0g62ZEZo2BskND+bDCm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_11,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504220179
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

On 4/21/25 10:13 PM, Rob Clark wrote:
> On Fri, Apr 18, 2025 at 9:00 AM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>
>> On 4/18/2025 6:40 AM, Connor Abbott wrote:
>>> On Thu, Apr 17, 2025, 1:50 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>>
>>>> On 4/17/2025 9:02 PM, Connor Abbott wrote:
>>>>> On Thu, Apr 17, 2025 at 3:45 AM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>>>>
>>>>>> On 4/10/2025 11:13 PM, Konrad Dybcio wrote:
>>>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>>
>>>>>>> The Highest Bank address Bit value can change based on memory type used.
>>>>>>>
>>>>>>> Attempt to retrieve it dynamically, and fall back to a reasonable
>>>>>>> default (the one used prior to this change) on error.
>>>>>>>
>>>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>> ---
>>>>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 15 ++++++++++++++-
>>>>>>>  1 file changed, 14 insertions(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>>> index 06465bc2d0b4b128cddfcfcaf1fe4252632b6777..a6232b382bd16319f20ae5f8f5e57f38ecc62d9f 100644
>>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>>> @@ -13,6 +13,7 @@
>>>>>>>  #include <linux/firmware/qcom/qcom_scm.h>
>>>>>>>  #include <linux/pm_domain.h>
>>>>>>>  #include <linux/soc/qcom/llcc-qcom.h>
>>>>>>> +#include <linux/soc/qcom/smem.h>
>>>>>>>
>>>>>>>  #define GPU_PAS_ID 13
>>>>>>>
>>>>>>> @@ -587,6 +588,8 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
>>>>>>>
>>>>>>>  static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>>>>>>  {
>>>>>>> +     int hbb;
>>>>>>> +
>>>>>>>       gpu->ubwc_config.rgb565_predicator = 0;
>>>>>>>       gpu->ubwc_config.uavflagprd_inv = 0;
>>>>>>>       gpu->ubwc_config.min_acc_len = 0;
>>>>>>> @@ -635,7 +638,6 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>>>>>>           adreno_is_a690(gpu) ||
>>>>>>>           adreno_is_a730(gpu) ||
>>>>>>>           adreno_is_a740_family(gpu)) {
>>>>>>> -             /* TODO: get ddr type from bootloader and use 2 for LPDDR4 */
>>>>>>>               gpu->ubwc_config.highest_bank_bit = 16;
>>>>>>>               gpu->ubwc_config.amsbc = 1;
>>>>>>>               gpu->ubwc_config.rgb565_predicator = 1;
>>>>>>> @@ -664,6 +666,13 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>>>>>>               gpu->ubwc_config.highest_bank_bit = 14;
>>>>>>>               gpu->ubwc_config.min_acc_len = 1;
>>>>>>>       }
>>>>>>> +
>>>>>>> +     /* Attempt to retrieve the data from SMEM, keep the above defaults in case of error */
>>>>>>> +     hbb = qcom_smem_dram_get_hbb();
>>>>>>> +     if (hbb < 0)
>>>>>>> +             return;
>>>>>>> +
>>>>>>> +     gpu->ubwc_config.highest_bank_bit = hbb;
>>>>>>
>>>>>> I am worried about blindly relying on SMEM data directly for HBB for
>>>>>> legacy chipsets. There is no guarantee it is accurate on every chipset
>>>>>> and every version of firmware. Also, until recently, this value was
>>>>>> hardcoded in Mesa which matched the value in KMD.
>>>>>
>>>>> To be clear about this, from the moment we introduced host image
>>>>> copies in Mesa we added support for querying the HBB from the kernel,
>>>>> explicitly so that we could do what this series does without Mesa ever
>>>>> breaking. Mesa will never assume the HBB unless the kernel is too old
>>>>> to support querying it. So don't let Mesa be the thing that stops us
>>>>> here.
>>>>
>>>> Thanks for clarifying about Mesa. I still don't trust a data source that
>>>> is unused in production.
>>>
>>> Fair enough, I'm not going to argue with that part. Just wanted to
>>> clear up any confusion about Mesa.
>>>
>>> Although, IIRC kgsl did set different values for a650 depending on
>>> memory type... do you know what source that used?
>>
>> KGSL relies on an undocumented devicetree node populated by bootloader
>> to detect ddrtype and calculates the HBB value based on that.
> 
> Would it be reasonable to use the smem value, but if we find the
> undocumented dt property, WARN_ON() if it's value disagrees with smem?
> 
> That would at least give some confidence, or justified un-confidence
> about the smem values

The aforementioned value is populated based on the data that this
driver reads out, and only on the same range of platforms that this
driver happens to cater to

Konrad
