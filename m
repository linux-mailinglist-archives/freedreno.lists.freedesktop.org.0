Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C39FB9AD4EC
	for <lists+freedreno@lfdr.de>; Wed, 23 Oct 2024 21:37:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9526F10E0DC;
	Wed, 23 Oct 2024 19:37:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="N+W8TfVe";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F9C410E0DC
 for <freedreno@lists.freedesktop.org>; Wed, 23 Oct 2024 19:37:52 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49N9v3sP016005
 for <freedreno@lists.freedesktop.org>; Wed, 23 Oct 2024 19:37:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 DIbrPzltu0ILEh3PPAqLOC+uPIcodFr4BkYda7fzQp8=; b=N+W8TfVecWPEnDHQ
 5nC8Uj3FaWo0mCpQvIcc2t6Hg3y8Lwa6TTBaJCSJudr+0xpbAbSwcj2i97ObXtok
 ecCcgNI7hvLniOJmFVQAyvwGGOJFnHvWt2P3RoaIWrhdi+qqinQah50TP/N1MX1b
 xowItob+1TzPSRJgPmJ3TCBhVbJufKrndo8OyC6wqOlINqaXYac7VJd4+eudwFpX
 7c/erVDkYLenGcWcHjSMEqwZmb/8mv/uLD4xnThT5tnEaad69bfcmkX/sKRB0+Ad
 zZ8wYWRUtjsBjha6pq5rv47KOeSq9VXB+UKWvoOS2+9gOgjWECPQvYDvXu6Iuwu6
 CIq90g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3xkawm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 23 Oct 2024 19:37:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49NJbpFV002604
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 23 Oct 2024 19:37:51 GMT
Received: from [10.216.22.63] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 23 Oct
 2024 12:37:50 -0700
Message-ID: <39366394-c747-45e9-adaa-889393cd950c@quicinc.com>
Date: Thu, 24 Oct 2024 01:07:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/msm/adreno: Add support for ACD
To: <freedreno@lists.freedesktop.org>
References: <20241021-gpu-acd-v2-0-9c25a62803bc@quicinc.com>
 <20241021-gpu-acd-v2-1-9c25a62803bc@quicinc.com>
 <3ee7a1c9-2d6d-4fd5-982e-d86151e45662@linaro.org>
Content-Language: en-US
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <3ee7a1c9-2d6d-4fd5-982e-d86151e45662@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: eSK67UNEZuylcg-r5DIQGoboq9_IxI_n
X-Proofpoint-ORIG-GUID: eSK67UNEZuylcg-r5DIQGoboq9_IxI_n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 impostorscore=0 mlxscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 malwarescore=0 priorityscore=1501 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410230126
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

On 10/22/2024 2:37 PM, Bryan O'Donoghue wrote:
> On 21/10/2024 12:53, Akhil P Oommen wrote:
>> ACD a.k.a Adaptive Clock Distribution is a feature which helps to reduce
>> the power consumption. In some chipsets, it is also a requirement to
>> support higher GPU frequencies. This patch adds support for GPU ACD by
>> sending necessary data to GMU and AOSS. The feature support for the
>> chipset is detected based on devicetree data.
>>
>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 81 ++++++++++++++++++++++++++++-------
>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  1 +
>>   drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 36 ++++++++++++++++
>>   drivers/gpu/drm/msm/adreno/a6xx_hfi.h | 21 +++++++++
>>   4 files changed, 124 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> index 37927bdd6fbe..09fb3f397dbb 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> @@ -1021,14 +1021,6 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
>>         gmu->hung = false;
>>   -    /* Notify AOSS about the ACD state (unimplemented for now => disable it) */
>> -    if (!IS_ERR(gmu->qmp)) {
>> -        ret = qmp_send(gmu->qmp, "{class: gpu, res: acd, val: %d}",
>> -                   0 /* Hardcode ACD to be disabled for now */);
>> -        if (ret)
>> -            dev_err(gmu->dev, "failed to send GPU ACD state\n");
>> -    }
>> -
>>       /* Turn on the resources */
>>       pm_runtime_get_sync(gmu->dev);
>>   @@ -1476,6 +1468,64 @@ static int a6xx_gmu_pwrlevels_probe(struct a6xx_gmu *gmu)
>>       return a6xx_gmu_rpmh_votes_init(gmu);
>>   }
>>   +static int a6xx_gmu_acd_probe(struct a6xx_gmu *gmu)
>> +{
>> +    struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
>> +    struct a6xx_hfi_acd_table *cmd = &gmu->acd_table;
>> +    struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
>> +    struct msm_gpu *gpu = &adreno_gpu->base;
>> +    int ret, i, cmd_idx = 0;
>> +
>> +    cmd->version = 1;
>> +    cmd->stride = 1;
>> +    cmd->enable_by_level = 0;
>> +
>> +    /* Skip freq = 0 and parse acd-level for rest of the OPPs */
>> +    for (i = 1; i < gmu->nr_gpu_freqs; i++) {
>> +        struct dev_pm_opp *opp;
>> +        struct device_node *np;
>> +        unsigned long freq;
>> +        u32 val;
>> +
>> +        freq = gmu->gpu_freqs[i];
>> +        opp = dev_pm_opp_find_freq_exact(&gpu->pdev->dev, freq, true);
>> +        np = dev_pm_opp_get_of_node(opp);
>> +
>> +        ret = of_property_read_u32(np, "qcom,opp-acd-level", &val);
>> +        of_node_put(np);
>> +        dev_pm_opp_put(opp);
>> +        if (ret == -EINVAL)
>> +            continue;
>> +        else if (ret) {
>> +            DRM_DEV_ERROR(gmu->dev, "Unable to read acd level for freq %lu\n", freq);
>> +            return ret;
>> +        }
>> +
>> +        cmd->enable_by_level |= BIT(i);
>> +        cmd->data[cmd_idx++] = val;
> 
> How do you know that cmd_idx is always < sizeof(cmd->data); ?

Because "i < nr_gpu_freqs".

I can think of some potential improvements here, but that is outside
the scope of this patch.

> 
>> +    }
>> +
>> +    cmd->num_levels = cmd_idx;
>> +
>> +    /* We are done here if ACD is not required for any of the OPPs */
>> +    if (!cmd->enable_by_level)
>> +        return 0;
>> +
>> +    /* Initialize qmp node to talk to AOSS */
>> +    gmu->qmp = qmp_get(gmu->dev);
>> +    if (IS_ERR(gmu->qmp)) {
>> +        cmd->enable_by_level = 0;
>> +        return dev_err_probe(gmu->dev, PTR_ERR(gmu->qmp), "Failed to initialize qmp\n");
>> +    }
>> +
>> +    /* Notify AOSS about the ACD state */
>> +    ret = qmp_send(gmu->qmp, "{class: gpu, res: acd, val: %d}", 1);
>> +    if (ret)
>> +        DRM_DEV_ERROR(gmu->dev, "failed to send GPU ACD state\n");
>> +
>> +    return 0;
> 
> Shouldn't the ret from gmp_send() get propogated in the return of this function ?
> 
> i.e. how can your probe be successful if the notification failed ?

Failure to send this message to AOP is not worth failing the
probe. We just loose a little bit of power savings.

-Akhil.

> 
> ---
> bod

