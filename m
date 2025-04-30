Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D292BAA4CC6
	for <lists+freedreno@lfdr.de>; Wed, 30 Apr 2025 15:09:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9312610E011;
	Wed, 30 Apr 2025 13:09:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TdPTRbew";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C397010E011
 for <freedreno@lists.freedesktop.org>; Wed, 30 Apr 2025 13:09:46 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U98c2W032081
 for <freedreno@lists.freedesktop.org>; Wed, 30 Apr 2025 13:09:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vRMOzQ1+a8EQloSooTZ1VPQWAuenrRDcnTPBGwn0XDk=; b=TdPTRbewAN+TNHGe
 NxnkUu8cl0q+5/I3KAw4TNDDFaIwyp6ja6iYQjo/dcbF7M2ZgapbqAw/H5dyN3iI
 VQex1vfjt+ogLMbv9q7yyFrTPbRhIOvSiDB5kQP1kE4mWkIIp/geLeT7Ifbc7VG0
 wLIgT07RMsu9I/+9m/bO76jk3zYPrSC3ONZd9EmtdmiKvogGZpDMvG+UORF+sxQw
 XnZM+IoXtcz+vduJPvPN5ckLfWNxX1k78wy28emvabbeMxJ7mNxmJrjrGRaaLiwV
 0l4xRDGklngle0GNSdXfGPJie1Q5hIImVQN7cry34YwqVA8D5SJysTQ3QFH/Ro/V
 iE0zhA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u72aqd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 30 Apr 2025 13:09:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c54be4b03aso102800985a.3
 for <freedreno@lists.freedesktop.org>; Wed, 30 Apr 2025 06:09:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746018585; x=1746623385;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vRMOzQ1+a8EQloSooTZ1VPQWAuenrRDcnTPBGwn0XDk=;
 b=jGLkLvY+ZYzRrbxRp8uExb0WBU8/+s4nzFN2QfrlxjKIfQNu83H+xOLdAgTBWdShWb
 MfIub7x2zPSa0jruHIIn4OBmpmreBshOwP6XH3RQVVpRxgvlCUJhfVsaL/uqU0bPVpun
 lkCISrZEgvikgtI43dsccNCa4lLOSyhS/AVU1geshBsvnYPqS4tjyVPIadqdN4dG2Hbe
 PJhkFArY6cAum2Yc7qA/NJ2RlE44YDqXRltbOgV1DiyDgSPhA9pUZ+sDUSWvH8IvHdW4
 VjFvvB//9qxrg2jBQw85fDno1cFMgErN+sxYriPH83p6l0KlyrtUPB8hCxhNjIL83SRD
 Tfgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtO5tS3drJNOpcCl7EUYBiqn/IRf5FIh/8dIUwsLGl70WF6RoJAEHeIRKfuZ2j+ucmI+fsvOmvM+k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPGLJn7htUkUFmwwfTQaiSAeSM/iPido9gYLMM1RWYOBTlh1cY
 iIf/O/MXmLo0pbLPHoZfk3ry3RO0plAdfNiot+0wHtX99RXwEK2SM6cJaBZUNLgfPWZx3/tokHO
 BlN1skRKoohvm/uF+yHCxxk48QbvP1OgFgEtLkGgL4pNIsbtCQBCdw4wjjQPjsBgxUqY=
X-Gm-Gg: ASbGnctmvi3RVThRPJZJuQxLYlnOZ4IfX1ZmR/MUc65ACJUPZOK/esQo6DqyrCtt1WY
 7DryKzHKuBZGF1wpiGkF1XxgwmMzDm/O9GhJJ820vXfXDO5Y5wTB3GLUoKvoE4jf9B0K4LmIiAo
 grJ2/+qb1QDuY2i99+1htkm77lOyIya0vpbDnHE61elY8dbyvTF6Lspy01dFlUBss/mguiOozBI
 GDueBnbuGMcyK0XGubbnT1vjhx3KTcG9rkEMjZTS2OsHXYz1UV490d67+oW3pUE4VRhQorROFcl
 BKbMpwCL4Q/+YuZEle3fhUyQCVO+P+TNVZf5mjnRjDa2aWaCEMB3pqVYHr8eJYebcoE=
X-Received: by 2002:a05:620a:4494:b0:7c0:af16:b4a8 with SMTP id
 af79cd13be357-7cacc172af5mr26593685a.3.1746018584838; 
 Wed, 30 Apr 2025 06:09:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEO097WTrfuIxU7CNWA83CThbCdCAbQ6J4gL7u3jo8Kby/5gjdIscRtpOeE3Q1bQkyisdevfw==
X-Received: by 2002:a05:620a:4494:b0:7c0:af16:b4a8 with SMTP id
 af79cd13be357-7cacc172af5mr26591185a.3.1746018584214; 
 Wed, 30 Apr 2025 06:09:44 -0700 (PDT)
Received: from [192.168.65.132] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6e4cd79dsm920573466b.38.2025.04.30.06.09.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Apr 2025 06:09:43 -0700 (PDT)
Message-ID: <98a4ad20-c141-4280-801e-015dafd1fb39@oss.qualcomm.com>
Date: Wed, 30 Apr 2025 15:09:41 +0200
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b838f9bd-0537-4f8d-b24b-d96700d566c8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA5MyBTYWx0ZWRfXxxAEzx82qjgU
 s6e1T+7YkfmM/G7g9uEl0lJEevGnQPFtux2xWYW/QdQqfV9OF0seBzx6POimOTtcd9OoTOkHive
 l4iJJ/6WlV3spt+S2qIuedmcA69BjgpCv6UY0xiwjRIPLl6ANygJIn9YkHf/MN15E3gCDlB6WXd
 tS2S1zO7ORDnsFcf2/RPVcH9XGatS7of/W9rEsIqNF4bGS9d2EtE/GdR271Abgpcuse0b6b5+YA
 DGdSPEUSKQXBvOv6zxOuqB9r44Yrsz+n6vLuRN79eT2p0ZwW5KH7EemHsyvXIBogLIkIXCtWFK4
 ZnoHRXRCP2nTyQj/4dvCvI08uft9Qz+d9cExpSTH8S+iL7owr0SVK+OdhMdAut7qrzKaBiwsI/h
 cZM4wnSGZXrwLzJeX3dw9smuJZ3J4H5ozyMvWVOZi09ISvMc2btO3UobU+o40sqIcteGB5Ke
X-Proofpoint-GUID: 46bTO_4pE3yx5IvO-rJi1P7Bm4MEgWgc
X-Authority-Analysis: v=2.4 cv=W404VQWk c=1 sm=1 tr=0 ts=6812211a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=aak9J4RPMLM6hOP-xocA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 46bTO_4pE3yx5IvO-rJi1P7Bm4MEgWgc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 bulkscore=0 spamscore=0
 clxscore=1015 phishscore=0 impostorscore=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300093
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

On 4/30/25 2:49 PM, neil.armstrong@linaro.org wrote:
> On 30/04/2025 14:35, Konrad Dybcio wrote:
>> On 4/30/25 2:26 PM, neil.armstrong@linaro.org wrote:
>>> Hi,
>>>
>>> On 30/04/2025 13:34, Konrad Dybcio wrote:
>>>> From: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>>
>>>> Add speebin data for A740, as found on SM8550 and derivative SoCs.
>>>>
>>>> For non-development SoCs it seems that "everything except FC_AC, FC_AF
>>>> should be speedbin 1", but what the values are for said "everything" are
>>>> not known, so that's an exercise left to the user..
>>>>
>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>> ---
>>>>    drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 8 ++++++++
>>>>    1 file changed, 8 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>> index 53e2ff4406d8f0afe474aaafbf0e459ef8f4577d..61daa331567925e529deae5e25d6fb63a8ba8375 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>> @@ -11,6 +11,9 @@
>>>>    #include "a6xx.xml.h"
>>>>    #include "a6xx_gmu.xml.h"
>>>>    +#include <linux/soc/qcom/smem.h>
>>>> +#include <linux/soc/qcom/socinfo.h>
>>>> +
>>>>    static const struct adreno_reglist a612_hwcg[] = {
>>>>        {REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x22222222},
>>>>        {REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220},
>>>> @@ -1431,6 +1434,11 @@ static const struct adreno_info a7xx_gpus[] = {
>>>>            },
>>>>            .address_space_size = SZ_16G,
>>>>            .preempt_record_size = 4192 * SZ_1K,
>>>> +        .speedbins = ADRENO_SPEEDBINS(
>>>> +            { ADRENO_SKU_ID(SOCINFO_FC_AC), 0 },
>>>> +            { ADRENO_SKU_ID(SOCINFO_FC_AF), 0 },
>>>> +            /* Other feature codes (on prod SoCs) should match to speedbin 1 */
>>>
>>> I'm trying to understand this sentence. because reading patch 4, when there's no match
>>> devm_pm_opp_set_supported_hw() is simply never called so how can it match speedbin 1 ?
>>
>> What I'm saying is that all other entries that happen to be possibly
>> added down the line are expected to be speedbin 1 (i.e. BIT(1))
>>
>>> Before this change the fallback was speedbin = BIT(0), but this disappeared.
>>
>> No, the default was to allow speedbin mask ~(0U)
> 
> Hmm no:
> 
>     supp_hw = fuse_to_supp_hw(info, speedbin);
> 
>     if (supp_hw == UINT_MAX) {
>         DRM_DEV_ERROR(dev,
>             "missing support for speed-bin: %u. Some OPPs may not be supported by hardware\n",
>             speedbin);
>         supp_hw = BIT(0); /* Default */
>     }
> 
>     ret = devm_pm_opp_set_supported_hw(dev, &supp_hw, 1);
>     if (ret)
>         return ret;

Right, that's my own code even..

in any case, the kernel can't know about the speed bins that aren't
defined and here we only define bin0, which doesn't break things

the kernel isn't aware about hw with bin1 with or without this change
so it effectively doesn't matter

Konrad
