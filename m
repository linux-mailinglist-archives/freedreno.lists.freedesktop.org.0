Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A92FB9F0D37
	for <lists+freedreno@lfdr.de>; Fri, 13 Dec 2024 14:21:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F3810EFF9;
	Fri, 13 Dec 2024 13:21:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="FBxDH4jP";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF80E10EFF9
 for <freedreno@lists.freedesktop.org>; Fri, 13 Dec 2024 13:21:49 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD81a5e022117
 for <freedreno@lists.freedesktop.org>; Fri, 13 Dec 2024 13:21:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +QqE0gG0fSzViqcBUpuyJ1Eq6A/dGbbjElVKoNZyqDc=; b=FBxDH4jPOv390rVI
 71qI+qlSkNU8UBzxwJjrRjS67iabFZV2NzBq9LvvAwJ/p2hYu3eK5jZQNZeDVcwM
 P9zTkmzBZJkHC2crsYJd/uyGijNfhl47GNxD/XZaZcFLns31NXctC9NJNp1Nshj6
 AeIQ+oT7l7uO6D7l2TcDTR5AcCo6ogkmcBZicO2Qx2ApDrUcwkLTFW+Ss2lHGWmf
 CdYdfyW+UficLUZ3OUI8nswIsDZGG3F7xHGAP5Dq+Ulc2m/rrCxmx6wmXo0mUYNM
 jKEWrGpnLlG3TIkzPmEMVju7XilxnB4ZeSfG/lofhN+WVVi0HlvSse3SFocdbb+v
 SOPdtg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43gh270wq4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 13 Dec 2024 13:21:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BDDLlO7023188
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 13 Dec 2024 13:21:47 GMT
Received: from [10.204.101.130] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 13 Dec
 2024 05:21:46 -0800
Message-ID: <800c3c86-692e-40d3-84ec-52a5b5014598@quicinc.com>
Date: Fri, 13 Dec 2024 18:51:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/7] drm/msm: adreno: enable GMU bandwidth for A740 and
 A750
To: <freedreno@lists.freedesktop.org>
References: <20241211-topic-sm8x50-gpu-bw-vote-v5-0-6112f9f785ec@linaro.org>
 <20241211-topic-sm8x50-gpu-bw-vote-v5-5-6112f9f785ec@linaro.org>
 <31264e68-2cdc-41b2-8d84-459dc257f0f5@oss.qualcomm.com>
 <76592f0b-85f4-4c84-b45b-859d55c4e87d@linaro.org>
 <230eb99b-b223-4d5f-92f6-27edc6827cb0@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <230eb99b-b223-4d5f-92f6-27edc6827cb0@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: PqsD98h2W5mx__Pyzsb-1bIatedCoiTC
X-Proofpoint-GUID: PqsD98h2W5mx__Pyzsb-1bIatedCoiTC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 mlxlogscore=999 impostorscore=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130094
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

On 12/13/2024 6:09 PM, Konrad Dybcio wrote:
> On 12.12.2024 10:36 PM, Neil Armstrong wrote:
>> On 12/12/2024 21:32, Konrad Dybcio wrote:
>>> On 11.12.2024 9:29 AM, Neil Armstrong wrote:
>>>> Now all the DDR bandwidth voting via the GPU Management Unit (GMU)
>>>> is in place, declare the Bus Control Modules (BCMs) and the
>>>> corresponding parameters in the GPU info struct.
>>>>
>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>> ---
>>>>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 22 ++++++++++++++++++++++
>>>>   1 file changed, 22 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>> index 0c560e84ad5a53bb4e8a49ba4e153ce9cf33f7ae..edffb7737a97b268bb2986d557969e651988a344 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>> @@ -1388,6 +1388,17 @@ static const struct adreno_info a7xx_gpus[] = {
>>>>               .pwrup_reglist = &a7xx_pwrup_reglist,
>>>>               .gmu_chipid = 0x7020100,
>>>>               .gmu_cgc_mode = 0x00020202,
>>>> +            .bcms = (const struct a6xx_bcm[]) {
>>>> +                { .name = "SH0", .buswidth = 16 },
>>>
>>> All a7xx targets use the same BCMs with the only difference being
>>> the ACV voting mask. You may want to make these non-anonymous structs.
>>
>> it can be done in a second step
>>
>>>
>>>> +                { .name = "MC0", .buswidth = 4 },
>>>> +                {
>>>> +                    .name = "ACV",
>>>> +                    .fixed = true,
>>>> +                    .perfmode = BIT(3),
>>>> +                    .perfmode_bw = 16500000,
>>>
>>> I think perfmode is simply supposed to be set when bw == max_bw
>>
>> Not for a750
> 
> Akhil, is there any way to determine a suitable OPP for this
> dynamically?

iirc, BIT(3) is a dedicated perf vote for GPU-to-ddr path introduced in
A750+. So we can keep a more aggressive threshold when GPU is active.
The exact DDR corner is based on some heuristics. It is better to leave
it as it is since this threshold may change in next chipset.

-Akhil.

> 
> Konrad

