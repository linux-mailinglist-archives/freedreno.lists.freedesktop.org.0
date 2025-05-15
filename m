Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 737E9AB8B74
	for <lists+freedreno@lfdr.de>; Thu, 15 May 2025 17:51:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2892F10E8FC;
	Thu, 15 May 2025 15:51:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="leUOTINV";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADF4C10E8FC
 for <freedreno@lists.freedesktop.org>; Thu, 15 May 2025 15:51:36 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFYWR001035
 for <freedreno@lists.freedesktop.org>; Thu, 15 May 2025 15:51:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +e+5/dGFTBvTUJTFnStarpjY0VEAdmkaML06k5ujGeE=; b=leUOTINVq/54ZUdU
 vQv4+xzg3M/uywuo6dM2OpTinZku8k8A8Xp/jSUkY1bCs0Ae0cEwExkXVVNacxX7
 lHzVX5oFrpO4fmvNs08fms/IF0t9EoxIeswc2x5BBPSNknLJeIF1M9cTDCrS+hOW
 eR6w+nK3rd9zwJsmDIVoFD95zI96i8YZ8Uxg/9joylQeSAGZHjzlnKR/YGQg7KOs
 NBJS2XBih/4MwNbs/OdSVjlDPCdjNBrxntKbnrKzZmPGdVUEcORkcLUiRctOfdgO
 w0QtZ7fQHW/3jjeuZj1bIS0qLWvRtU3p8GKp0oJze8Py+hUAEaGu1NkaDyhawm0C
 /xWYdg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnxp3n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 15 May 2025 15:51:35 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6f8aa327049so270596d6.0
 for <freedreno@lists.freedesktop.org>; Thu, 15 May 2025 08:51:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747324295; x=1747929095;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+e+5/dGFTBvTUJTFnStarpjY0VEAdmkaML06k5ujGeE=;
 b=uBDI3OJQPz9S5UigbBV+ENnl5TwYgFmfxEZi4qVacssbP5LfbwZh5AZWeOopJvEKbm
 5JP5TSGR0CUlYegw4PooE1b74PKPFGy8dO8CPe0tbIvUj8o2Z3jOKgTdRCVp60JA31gM
 wnTt/paF5kh3/R9SXqn6+UM7T1gkBKoQRx8+ChW2edh9lC9qUmtRiJ+uqDZNM7AYFAxt
 ExBFTnddE/CHaz3+pfZNZ7N+MyHrOzoeoALxP62BmKDfL2uwwg7baKbJUrc+i6HFbQ7I
 GLqBgCxXqC4sphs4PsB1mrw+caAkvv5OB1PsgUluxy9g5wJvckGfIWSG4NIa8BsxikEg
 DwZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiIijl9dLa4e5ld1ynipBf+IPtSCe9uX7URalJ6cIQmazkF71xnZv7k33ZI6xn24P7Vh5RbugnryM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyH5ZC2g0qIezCZBccB/lo/NTP+pB6eR66+kWE7QgP3f80Kiyee
 zytd61g5OWr6H9FlxEodFZF2FczvABAV3HvS3KhIf9S0rhbETPEMA0esSMk4DYh8qKqShyU5DVr
 0SCNH1hCkwvLe/AA53QZPe/bH4Wd6r6ozzw0j/OSdsYfzsgnXg1fsK+0gZ62JFTyVIipnpCc=
X-Gm-Gg: ASbGncsxI97sSc6ZIWVcP1Y7CdqiBvvLbrx00imW3Q5IG+ha/fqKcRwC792FPdM+48t
 JeSsP5pvME9/wVi+a8hFK35NHI68YR6UTnSltPHmr/ApUYixwEvInlbfPZGiQZ/vjcz5wg+UrTr
 zHBOIGnqRbTw4xwIuhs1OaqKs/Aj57EE4Zo5nkNzmg5Xiac+s8defJAVQFgS6wKJGwE/MKNDBlN
 ie7/2J5A/XKHsQvH+7ESGVhoeAWTnM+Yt2zlJWOETF/HLcCMLjmdHKHtbrmQ1+4/hbTEhz3yUE5
 C+RGziYiZEvOe6sCFc+6mqI/LYG3Kdnok+UFIfBLPTBnudEYG49Z5YgA/bDPlvrz0Q==
X-Received: by 2002:a05:6214:20ab:b0:6f8:95ee:9da2 with SMTP id
 6a1803df08f44-6f8b08ab968mr1250226d6.10.1747324294909; 
 Thu, 15 May 2025 08:51:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfaZCHStwDbGBnyL2BR4sz8v/EdIJECgWgLt80+ba9IIvBZ4s0JC+YbhOTKTK6PxxUotlxYA==
X-Received: by 2002:a05:6214:20ab:b0:6f8:95ee:9da2 with SMTP id
 6a1803df08f44-6f8b08ab968mr1249956d6.10.1747324294537; 
 Thu, 15 May 2025 08:51:34 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d4ca2bfsm6455966b.157.2025.05.15.08.51.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 May 2025 08:51:34 -0700 (PDT)
Message-ID: <503932a8-3124-4448-b18a-e25554745488@oss.qualcomm.com>
Date: Thu, 15 May 2025 17:51:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v2 11/15] drm/msm/adreno: Switch to the common UBWC
 config struct
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-11-09ecbc0a05ce@oss.qualcomm.com>
 <qhmayxvlyz2txum5rs5vaf3iqzniz6nktr4zatru6bhgp6tdah@uq24obw2ro5f>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <qhmayxvlyz2txum5rs5vaf3iqzniz6nktr4zatru6bhgp6tdah@uq24obw2ro5f>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FBf5N_0SdexsoLqBoJvXA9QXNvNvTgl5
X-Proofpoint-ORIG-GUID: FBf5N_0SdexsoLqBoJvXA9QXNvNvTgl5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE1NyBTYWx0ZWRfX+0oJDsLOblf4
 ++XZHXOgRloi1xiUF3th5MNdhR+hrf6LmCKqZYkVdyGTzlcrJcYl40iifNsH5/tbq5cCHiXIKO3
 fIYyzT5GVAH8P/xtUpNpugU9VRbMEhzFbgKYMcASW7aSsvHUefBkEERBld+Lwz9bNz+Fp4lXsgH
 +la93bdV2mV+8MSImgnpCzqKO9retIqQNbRk5riLBLXHLdhuLS/NDEisdIlqsBIX5RqJv41nsaE
 mHE5MyzfR9M16FPNQT4ZNfRawZlyl75SM5iJ5ud31ectHQxx3AZbbVo+5ns/d09dRGlZ5iqr5TC
 qFYGT2bH9zlpmMgoeTXp9XzYAXd/1a+kNUoUsY4Y2Q8XHGYOnvsWDuOWGU6OONzvLEd5KLth7RJ
 +Hq0sZ7GMSQFstJ4scClm2rb4+ZI63F1c3KwhARRTbH3BpMJdBPxD7ZtAZzW/W4oNXc/osat
X-Authority-Analysis: v=2.4 cv=Gp9C+l1C c=1 sm=1 tr=0 ts=68260d87 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=hON3piRNd2u2ny3NyMoA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_06,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150157
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

On 5/14/25 9:22 PM, Dmitry Baryshkov wrote:
> On Wed, May 14, 2025 at 05:10:31PM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Now that Adreno specifics are out of the way, use the common config
>> (but leave the HBB hardcoding in place until that is wired up on the
>> other side).
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 20 +++++------
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 64 ++++++++++++++++-----------------
>>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  6 ++--
>>  drivers/gpu/drm/msm/adreno/adreno_gpu.h | 45 ++++-------------------
>>  4 files changed, 50 insertions(+), 85 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
>> index 650e5bac225f372e819130b891f1d020b464f17f..611e0eb26d0e19d431673d08e042162375fd400f 100644
>> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
>> @@ -833,8 +833,8 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
>>  
>>  	gpu_write(gpu, REG_A5XX_RBBM_AHB_CNTL2, 0x0000003F);
>>  
>> -	BUG_ON(adreno_gpu->ubwc_config.highest_bank_bit < 13);
>> -	hbb = adreno_gpu->ubwc_config.highest_bank_bit - 13;
>> +	BUG_ON(adreno_gpu->ubwc_config->highest_bank_bit < 13);
>> +	hbb = adreno_gpu->ubwc_config->highest_bank_bit - 13;
>>  
>>  	gpu_write(gpu, REG_A5XX_TPL1_MODE_CNTL, hbb << 7);
>>  	gpu_write(gpu, REG_A5XX_RB_MODE_CNTL, hbb << 1);
>> @@ -1754,6 +1754,7 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
>>  	struct msm_drm_private *priv = dev->dev_private;
>>  	struct platform_device *pdev = priv->gpu_pdev;
>>  	struct adreno_platform_config *config = pdev->dev.platform_data;
>> +	const struct qcom_ubwc_cfg_data *common_cfg;
>>  	struct a5xx_gpu *a5xx_gpu = NULL;
>>  	struct adreno_gpu *adreno_gpu;
>>  	struct msm_gpu *gpu;
>> @@ -1790,15 +1791,14 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
>>  	/* Set up the preemption specific bits and pieces for each ringbuffer */
>>  	a5xx_preempt_init(gpu);
>>  
>> -	/* Set the highest bank bit */
>> -	if (adreno_is_a540(adreno_gpu) || adreno_is_a530(adreno_gpu))
>> -		adreno_gpu->ubwc_config.highest_bank_bit = 15;
>> -	else
>> -		adreno_gpu->ubwc_config.highest_bank_bit = 14;
>> +	/* Inherit the common config and make some necessary fixups */
>> +	common_cfg = qcom_ubwc_config_get_data();
>> +	if (IS_ERR(common_cfg))
>> +		return ERR_PTR(-EINVAL);
>>  
>> -	/* a5xx only supports UBWC 1.0, these are not configurable */
>> -	adreno_gpu->ubwc_config.macrotile_mode = 0;
>> -	adreno_gpu->ubwc_config.ubwc_swizzle = 0x7;
>> +	/* Copy the data into the internal struct to drop the const qualifier (temporarily) */
>> +	adreno_gpu->_ubwc_config = *common_cfg;
>> +	adreno_gpu->ubwc_config = &adreno_gpu->_ubwc_config;
> 
> Ugh. I'd rather keep the ubwc config r/o.
> 
>>  
>>  	adreno_gpu->uche_trap_base = 0x0001ffffffff0000ull;
>>  
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index fdc843c47c075a92ec8305217c355e4ccee876dc..ae0bb7934e7ed203aa3b81e28767de204f0a4d60 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -587,64 +587,62 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
>>  
>>  static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>  {
>> +	const struct qcom_ubwc_cfg_data *common_cfg;
>> +	struct qcom_ubwc_cfg_data *cfg = &gpu->_ubwc_config;
>> +
>>  	/* Inherit the common config and make some necessary fixups */
>> -	gpu->common_ubwc_cfg = qcom_ubwc_config_get_data();
>> -	if (IS_ERR(gpu->common_ubwc_cfg))
>> +	common_cfg = qcom_ubwc_config_get_data();
>> +	if (IS_ERR(common_cfg))
>>  		return -EINVAL;
>>  
>> -	gpu->ubwc_config.ubwc_swizzle = 0x6;
>> -	gpu->ubwc_config.macrotile_mode = 0;
>> -	gpu->ubwc_config.highest_bank_bit = 15;
>> +	/* Copy the data into the internal struct to drop the const qualifier (temporarily) */
>> +	*cfg = *common_cfg;
>> +
>> +	cfg->ubwc_swizzle = 0x6;
>> +	cfg->highest_bank_bit = 15;
>>  
> 
> This begs for WARN_ON(cfg->ubwc_swizzle !=
> gpu->common_ubwc_cfg->ubwc_swizzle) and similar change for HBB. Then
> after testing we should be able to drop r/w part of the config.

I'd rather put the warn in ubwc_config.c

Konrad
