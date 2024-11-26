Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5BF9D9A7E
	for <lists+freedreno@lfdr.de>; Tue, 26 Nov 2024 16:37:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A93E10E8DD;
	Tue, 26 Nov 2024 15:37:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="JL3ATGMQ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2064910E8DD
 for <freedreno@lists.freedesktop.org>; Tue, 26 Nov 2024 15:37:45 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQCxKvi010839
 for <freedreno@lists.freedesktop.org>; Tue, 26 Nov 2024 15:37:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ZeWTiJgYGpGksDKFyexsTz4zd1G2Va/eWcXSjSykmvs=; b=JL3ATGMQFoQ0WQJt
 cnxpJWH2OwS9aObxND2+jH8GSZKE8O0oqudM+XoFfSoJ8If8DhqELyolYnbXkynE
 NbfLafQWmtedRnQn3MWD0VozmFk6POSQ3LJOxBBRd8PWA127ZkgINO+phVobFjGp
 6Ark80V+HqL2LYJKMBTp5kXAUnUfPCbZd+IcIrD+hqM/R7CW0a9QzQuw7tnM5DOt
 NZIE9V3DAsxEsg7wHyKp4v+EHm4IHYEzytBCXsCn1ox4M1E0xyvXhwO0EZO8HXIS
 ILC7oStW8HYGNBNmD69fjSULFK16yiAeR+h1H8ui6GvelSnSmgGasV+cWGMWiw2U
 GNAyUw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 434sw9bmk9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 26 Nov 2024 15:37:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AQFbh7M012822
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 26 Nov 2024 15:37:43 GMT
Received: from [10.216.49.153] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 26 Nov
 2024 07:37:42 -0800
Message-ID: <ba4e830c-e37f-4f5c-b461-2bcd8330234c@quicinc.com>
Date: Tue, 26 Nov 2024 21:07:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/msm/adreno: Introduce ADRENO_QUIRK_NO_SYSCACHE
To: <freedreno@lists.freedesktop.org>
References: <20241125-a612-gpu-support-v2-0-b7cc38e60191@quicinc.com>
 <20241125-a612-gpu-support-v2-1-b7cc38e60191@quicinc.com>
 <vfbklrbereo3j5dp2w4pvctef364sb2dqogccmaevjerkm5u43@jytwobqwvuv2>
Content-Language: en-US
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <vfbklrbereo3j5dp2w4pvctef364sb2dqogccmaevjerkm5u43@jytwobqwvuv2>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: AqVdyhJMzNXThOt_2C6PX1wWFs02Cqpo
X-Proofpoint-ORIG-GUID: AqVdyhJMzNXThOt_2C6PX1wWFs02Cqpo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=845 adultscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411260126
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

On 11/25/2024 10:16 PM, Dmitry Baryshkov wrote:
> On Mon, Nov 25, 2024 at 10:03:00PM +0530, Akhil P Oommen wrote:
>> There are a few chipsets which don't have system cache a.k.a LLC.
>> Currently, the assumption in the driver is that the system cache
>> availability correlates with the presence of GMU or RPMH, which
>> is not true. For instance, Snapdragon 6 Gen 1 has RPMH and a GPU
>> with a full blown GMU, but doesnot have a system cache. So,
>> introduce an Adreno Quirk flag to check support for system cache
>> instead of using gmu_wrapper flag.
>>
>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 3 ++-
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 7 +------
>>  drivers/gpu/drm/msm/adreno/adreno_gpu.h   | 1 +
>>  3 files changed, 4 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> index 0c560e84ad5a..5e389f6b8b8a 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> @@ -682,6 +682,7 @@ static const struct adreno_info a6xx_gpus[] = {
>>  		},
>>  		.gmem = (SZ_128K + SZ_4K),
>>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>> +		.quirks = ADRENO_QUIRK_NO_SYSCACHE,
>>  		.init = a6xx_gpu_init,
>>  		.zapfw = "a610_zap.mdt",
>>  		.a6xx = &(const struct a6xx_info) {
>> @@ -1331,7 +1332,7 @@ static const struct adreno_info a7xx_gpus[] = {
>>  		},
>>  		.gmem = SZ_128K,
>>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>> -		.quirks = ADRENO_QUIRK_HAS_HW_APRIV,
>> +		.quirks = ADRENO_QUIRK_HAS_HW_APRIV | ADRENO_QUIRK_NO_SYSCACHE,
>>  		.init = a6xx_gpu_init,
>>  		.zapfw = "a702_zap.mbn",
>>  		.a6xx = &(const struct a6xx_info) {
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index 019610341df1..a8b928d0f320 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -1863,10 +1863,6 @@ static void a7xx_llc_activate(struct a6xx_gpu *a6xx_gpu)
>>  
>>  static void a6xx_llc_slices_destroy(struct a6xx_gpu *a6xx_gpu)
>>  {
>> -	/* No LLCC on non-RPMh (and by extension, non-GMU) SoCs */
>> -	if (adreno_has_gmu_wrapper(&a6xx_gpu->base))
>> -		return;
>> -
> 
> Shouldn't it also be a NO_SYSCACHE check?

llcc_slice_putd() has an ERR_OR_NULL check inside. So, not really needed.

-Akhil.
> 
>>  	llcc_slice_putd(a6xx_gpu->llc_slice);
>>  	llcc_slice_putd(a6xx_gpu->htw_llc_slice);
>>  }
>> @@ -1876,8 +1872,7 @@ static void a6xx_llc_slices_init(struct platform_device *pdev,
>>  {
>>  	struct device_node *phandle;
>>  
>> -	/* No LLCC on non-RPMh (and by extension, non-GMU) SoCs */
>> -	if (adreno_has_gmu_wrapper(&a6xx_gpu->base))
>> +	if (a6xx_gpu->base.info->quirks & ADRENO_QUIRK_NO_SYSCACHE)
>>  		return;
>>  
>>  	/*
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> index e71f420f8b3a..398be2218110 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> @@ -57,6 +57,7 @@ enum adreno_family {
>>  #define ADRENO_QUIRK_HAS_HW_APRIV		BIT(3)
>>  #define ADRENO_QUIRK_HAS_CACHED_COHERENT	BIT(4)
>>  #define ADRENO_QUIRK_PREEMPTION			BIT(5)
>> +#define ADRENO_QUIRK_NO_SYSCACHE		BIT(6)
>>  
>>  /* Helper for formating the chip_id in the way that userspace tools like
>>   * crashdec expect.
>>
>> -- 
>> 2.45.2
>>
> 

