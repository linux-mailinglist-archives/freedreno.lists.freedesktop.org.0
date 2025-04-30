Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E9DAA51CC
	for <lists+freedreno@lfdr.de>; Wed, 30 Apr 2025 18:40:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AE0A10E7F5;
	Wed, 30 Apr 2025 16:40:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dY8dmIfo";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B760710E7F5
 for <freedreno@lists.freedesktop.org>; Wed, 30 Apr 2025 16:40:04 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U9TRt5003005
 for <freedreno@lists.freedesktop.org>; Wed, 30 Apr 2025 16:40:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0IybLpUDVoXrbVMSePl8o57sK9UNIaXw3/isvQ/riIs=; b=dY8dmIfodJu511kr
 3eIUUxkRfmvOrKME+2epqnqJ1uLKpyqQqXfcD+2eTGaBYc6BpvRXYdS/il0ytb9I
 +FpW1MEpRjVYGUZPJlXxqCla0PljBDBAFlX8q/BMAKggCr/B8RqpPLSoSKhit/x8
 gnM4m4wO9TEOSv4JulpwPq0nu57uKAuH+2eU18a0lCtveWb3wTK2mzN6UVvaARGB
 66pPKVzFYoCjUbuXXJdn4PxeEDhsnSDESEsmF5vTAqCcNWuhVSguqjp7mNoNsOdz
 r7CuaNV+AU9MK0tx9LacBUxycr9scRwteoO131x2DqwqrRW65mZBffY5p5Xo3WOR
 /icVPg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u8aw1u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 30 Apr 2025 16:40:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4768b27fef3so140511cf.2
 for <freedreno@lists.freedesktop.org>; Wed, 30 Apr 2025 09:40:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746031200; x=1746636000;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0IybLpUDVoXrbVMSePl8o57sK9UNIaXw3/isvQ/riIs=;
 b=aDbfNNBf+kQIxC2e7bQDXbitopRpkVYGNmN7ZiGYKZNLJKRynbe3Nz+naa2O7xFIIb
 lT7e7fm49BGhGaBvwTb2Zc8pLW/DmofTJBLYxXtuEeqHBDM9EG4KgU0dgSOvvbBCRQtw
 Znjfyh3dVQz9eCR/32msILPsNIJC0KTso95YjELvQ+JZlvdMZMIAYdTeqIBQn4yuCBJQ
 mnWaBoInq5Gcp4Ylhuoaa41l7bLSjG2pecRtiBYktUTeOIR6XlPIOGKrThCeeLHnCbA4
 sUOwIBc2vP5zV0LiCC/FBoIgV7tp03394W4WzG46VyD3xg59CpSVmXP9Eak2IHMd8/Mm
 k/PQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOO0Bswg7V1CA+ftwIwmij9C2ZjnaKbmEP5IqLtuTA05PVoLwOKFKYEOfzU6b4Cnt2kqq37CeV1iI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyVcW0ydtE6CZNIQpSEaRQzHshtKdugWjf8QdUsQ4KTccFgBbvp
 iuphsz7Z/cHLFj04aVfGTOcTQVZnwYMqsdA6hV6XbDvohUTQj8ZJvOFG3NV/2ju5Yls1rQWrZjW
 +DRzb/UsJaG71znZh8D+/SFUd1ycJHqKE0D/PQo2rhRPZpSCkHJq8jdb2gmOPtDBx8/I=
X-Gm-Gg: ASbGncvPcabrbskB1mHDjnvDTeoohoO1k2hlTriUA2Al2QS6HzCKJyQ2lPlrxi6SS0a
 4JExj/GnIt8Yv7N8N3JFRVGHTbbo2roLVbpCK9r9pjYktaTN59pOA/RHYB+Lsoo0Nlf5VB6xPqZ
 dWgSI2ui/8ASFrJM2lGHynWYDLemCClUdf/r4/gsdhvw64UZpl4eaxZdq7BDARMqCuJcmDAsAoI
 lRwo5phHzm/EneSjl7pYdHLbGhHB6BabhbyDNXL9WgGuxe5WKvenMp2276TRDSShP2IqcFRG/0t
 6UAOxx4IykRAIDF9bA0ggeOOC+bPCScs8A/oRtuOo3B5Wneorx1PE1/12tB6RnYPccc=
X-Received: by 2002:ac8:7dcd:0:b0:47a:ecd7:6714 with SMTP id
 d75a77b69052e-489e4e70aaamr18107251cf.9.1746031198634; 
 Wed, 30 Apr 2025 09:39:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEh2bOPNWRF8KmYsuXVxcvL17E8iNqVQrHEwU12VALDMgDENwfbhdQrAkhqW8emKmyyAuo3Q==
X-Received: by 2002:ac8:7dcd:0:b0:47a:ecd7:6714 with SMTP id
 d75a77b69052e-489e4e70aaamr18106871cf.9.1746031198046; 
 Wed, 30 Apr 2025 09:39:58 -0700 (PDT)
Received: from [192.168.65.132] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f703833c8csm8852270a12.72.2025.04.30.09.39.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Apr 2025 09:39:57 -0700 (PDT)
Message-ID: <892fc1eb-efd3-4fb6-9110-2df3349960a6@oss.qualcomm.com>
Date: Wed, 30 Apr 2025 18:39:55 +0200
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
 <281ab1b6-498e-4b29-9e15-19b5aae25342@oss.qualcomm.com>
 <63105bce-6b8e-4b99-bca1-3741f27ea25a@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <63105bce-6b8e-4b99-bca1-3741f27ea25a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=B7i50PtM c=1 sm=1 tr=0 ts=68125263 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=bavVSKjQvIFP_uUPWtcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: LjQ2LOMUB8WR3EyQiOr4m4srJSEymuyu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDExOSBTYWx0ZWRfX33q0ejnJelzC
 e2pW4u3BlafYdfBjCgZ/truHFEQZnzg79aSzYhQ+FG26Q0Rz7KFDUp8Vv+Db4Ghxb5oLtdPG3St
 hMEB3/MIKv/h9FfPv+eLKBcBdR9jPCHaafuGOc4ZPvrs5kafyT5hsgS6PrnIMCgoVgWxx2N1z7L
 AZxWFMZY+AqrUBDCzu3T+PQjYhMh7U07DMu1D5xJVPxmcGeb5pCfu4RqkYEU/8EJdI61IIo0/yq
 PPjfK5G9BYY9EszOFVUMixlKWGUvrGJnWRPNAlJmgk0PX0lkVGN8q9SzmzmfcrNexsM/JvKr1Zc
 JeAG2JwNvUrSn3L0I4oGXAIfmg72BAAE5MPtVYb8ztAYr7IguD8al+KudR9jft7ZxIGrtdGeflW
 SJJHniK0vm0HeYOzlgB/MQdTsA7n4Tt7gfmReSOJer6lptlBHfNZxggfSRuvgqYAUJU0DMkn
X-Proofpoint-ORIG-GUID: LjQ2LOMUB8WR3EyQiOr4m4srJSEymuyu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 clxscore=1015
 mlxscore=0 impostorscore=0 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300119
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

On 4/30/25 6:19 PM, neil.armstrong@linaro.org wrote:
> On 30/04/2025 17:36, Konrad Dybcio wrote:
>> On 4/30/25 4:49 PM, neil.armstrong@linaro.org wrote:
>>> On 30/04/2025 15:09, Konrad Dybcio wrote:
>>>> On 4/30/25 2:49 PM, neil.armstrong@linaro.org wrote:
>>>>> On 30/04/2025 14:35, Konrad Dybcio wrote:
>>>>>> On 4/30/25 2:26 PM, neil.armstrong@linaro.org wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> On 30/04/2025 13:34, Konrad Dybcio wrote:
>>>>>>>> From: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>>>>>>
>>>>>>>> Add speebin data for A740, as found on SM8550 and derivative SoCs.
>>>>>>>>
>>>>>>>> For non-development SoCs it seems that "everything except FC_AC, FC_AF
>>>>>>>> should be speedbin 1", but what the values are for said "everything" are
>>>>>>>> not known, so that's an exercise left to the user..
>>>>>>>>
>>>>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>>>>>> ---
>>>>>>>>      drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 8 ++++++++
>>>>>>>>      1 file changed, 8 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>>>>>> index 53e2ff4406d8f0afe474aaafbf0e459ef8f4577d..61daa331567925e529deae5e25d6fb63a8ba8375 100644
>>>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>>>>>> @@ -11,6 +11,9 @@
>>>>>>>>      #include "a6xx.xml.h"
>>>>>>>>      #include "a6xx_gmu.xml.h"
>>>>>>>>      +#include <linux/soc/qcom/smem.h>
>>>>>>>> +#include <linux/soc/qcom/socinfo.h>
>>>>>>>> +
>>>>>>>>      static const struct adreno_reglist a612_hwcg[] = {
>>>>>>>>          {REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x22222222},
>>>>>>>>          {REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220},
>>>>>>>> @@ -1431,6 +1434,11 @@ static const struct adreno_info a7xx_gpus[] = {
>>>>>>>>              },
>>>>>>>>              .address_space_size = SZ_16G,
>>>>>>>>              .preempt_record_size = 4192 * SZ_1K,
>>>>>>>> +        .speedbins = ADRENO_SPEEDBINS(
>>>>>>>> +            { ADRENO_SKU_ID(SOCINFO_FC_AC), 0 },
>>>>>>>> +            { ADRENO_SKU_ID(SOCINFO_FC_AF), 0 },
>>>>>>>> +            /* Other feature codes (on prod SoCs) should match to speedbin 1 */
>>>>>>>
>>>>>>> I'm trying to understand this sentence. because reading patch 4, when there's no match
>>>>>>> devm_pm_opp_set_supported_hw() is simply never called so how can it match speedbin 1 ?
>>>>>>
>>>>>> What I'm saying is that all other entries that happen to be possibly
>>>>>> added down the line are expected to be speedbin 1 (i.e. BIT(1))
>>>>>>
>>>>>>> Before this change the fallback was speedbin = BIT(0), but this disappeared.
>>>>>>
>>>>>> No, the default was to allow speedbin mask ~(0U)
>>>>>
>>>>> Hmm no:
>>>>>
>>>>>       supp_hw = fuse_to_supp_hw(info, speedbin);
>>>>>
>>>>>       if (supp_hw == UINT_MAX) {
>>>>>           DRM_DEV_ERROR(dev,
>>>>>               "missing support for speed-bin: %u. Some OPPs may not be supported by hardware\n",
>>>>>               speedbin);
>>>>>           supp_hw = BIT(0); /* Default */
>>>>>       }
>>>>>
>>>>>       ret = devm_pm_opp_set_supported_hw(dev, &supp_hw, 1);
>>>>>       if (ret)
>>>>>           return ret;
>>>>
>>>> Right, that's my own code even..
>>>>
>>>> in any case, the kernel can't know about the speed bins that aren't
>>>> defined and here we only define bin0, which doesn't break things
>>>>
>>>> the kernel isn't aware about hw with bin1 with or without this change
>>>> so it effectively doesn't matter
>>>
>>> But it's regression for the other platforms, where before an unknown SKU
>>> mapped to supp_hw=BIT(0)
>>>
>>> Not calling devm_pm_opp_set_supported_hw() is a major regression,
>>> if the opp-supported-hw is present, the OPP will be rejected:
>>
>> A comment in patch 4 explains that. We can either be forwards or backwards
>> compatible (i.e. accept a limited amount of
>> speedbin_in_driver x speedbin_in_dt combinations)
> 
> I have a hard time understanding the change, please be much more verbose
> in the cover letter and commit messages.
> 
> The fact that you do such a large change in the speedbin policy in patch 4
> makes it hard to understand why it's needed in the first place.
> 
> Finally I'm very concerned that "old" SM8550 DT won't work on new kernels,
> this is frankly unacceptable, and this should be addressed in the first
> place.
> 
> The nvmem situation was much simple, where we considered we added the nvmem
> property at the same time as opp-supported-hw in OPPs, but it's no more the
> case.
> 
> So I think the OPP API should probably be extended to address this situation
> first, since if we do not have the opp-supported-hw in OPPs, all OPPs are safe.
> 
> So this code:
>     count = of_property_count_u32_elems(np, "opp-supported-hw");
>     if (count <= 0 || count % levels) {
>         dev_err(dev, "%s: Invalid opp-supported-hw property (%d)\n",
>             __func__, count);
>         return false;
>     }
> should return true in this specific case, like a supported_hw_failsafe mode.

Not really. opp-supported-hws = <BIT(0)> usually translates to the *fastest*
bin in our case, so perhaps that change I made previously to default to it
wasn't the wisest. In other words, all slower SKUs that weren't added to the
kernel catalog & dt are potentially getting overclocked, which is no bueno.
That is not always the case, but it most certainly has been for a number of
years.

Old DTs in this case would be DTs lacking opp-supported-hw with the kernel
having speedbin tables. The inverse ("too new DTs") case translates into
"someone put some unexpected stuff in dt and the kernel has no idea what
to do with it".
In this context, old DTs would continue to work after patch 4, as the first
early return in adreno_set_speedbin() takes care of that.

Konrad
