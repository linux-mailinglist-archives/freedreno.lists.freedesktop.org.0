Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACDBA143E0
	for <lists+freedreno@lfdr.de>; Thu, 16 Jan 2025 22:16:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1546510E2EC;
	Thu, 16 Jan 2025 21:16:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FIsuU5rR";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 663A610E2EC
 for <freedreno@lists.freedesktop.org>; Thu, 16 Jan 2025 21:16:33 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50GEHxdg012029
 for <freedreno@lists.freedesktop.org>; Thu, 16 Jan 2025 21:16:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 duEqSVZt1k43PZMd9QMDtaw8IMhjbIVlsCKvYGvC+i8=; b=FIsuU5rRT6YkcKNR
 zEfcrLMCxkV4jTXAlza1eF5pivhNGt00bJhnqLjV+yoFCKVz1GJD1RuSjuUAPMVp
 Cn2YC9MAWwoHpTFUuFAGPiTdMQ0MOLkX/IPuZBS4sJc1FWKKme2jDkqyEverr2CL
 6jXKsEgsqtPyDo/IvRf7uJrnajnDRL5f848A3xBSPSTAQYeDQtjyiPxE0ou8Oy+B
 EEuInlZjHTqDxNXx6HwoxhQPKgaWv0ZSdNvpinBQomGbExXyDywgLJ0rfKhB7sts
 IwfSPu5+9N6rPUS+tCkPUFwr+DIA1zkRl5jqbz5JpxFcuBHaBshZFxdihjyBnCfj
 3tlO5Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4473res0t4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 16 Jan 2025 21:16:31 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-467975f1b53so3695651cf.3
 for <freedreno@lists.freedesktop.org>; Thu, 16 Jan 2025 13:16:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737062190; x=1737666990;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=duEqSVZt1k43PZMd9QMDtaw8IMhjbIVlsCKvYGvC+i8=;
 b=rNpHolpwfXoTF58S9QpX2L+xopDusIpfMkBjvv49E10sqk+QiRF4hUGWjheVMCPvYx
 m/1lFCQoa/fWbWITsJLTgn46Tsp1vaNZ+Vqd92ITqkchIbF9URaimR61WclKeUzAIT4J
 25U4HxfTVPcp1vFGCRi4XPJ70HAsnKtixIcZ7ng21Y7T1UQblpGMR4Fa+YoM0jxcsH7y
 0Uow7j5yVuZKIDMXvz3OnXpkYawmyqJbN/PjI5DSYSBURR6MokaXjQ/DmhrN3/QDYXHT
 sJ2M39fn7U3QAZo6wuZqpa2O7JX8CnZG5cF1QUqYFjQ/ZqvpEqi/6kMNJSc/K6kfk5ud
 PoeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWpCfUwZkW2udUOOPIInGEtUcUI7Arj7HeWwoJOeQnHTYze6PZPwlKcUrpLQKPQsfa1uAES2qpTY0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy06LSZh+JspTfSrGuXHzjcqS0z6/m1gd06kSdnykXwoEQvFvUc
 vyPJq/CXyIpEg6UE/pcVhEr9RQSMrRKkbxZpzd2Ux43YsBaWx8R+WLoLvLTdylz5IBeGm926oYa
 Nytlw6foOCc76T9h0PcftT0gEKHsBAoSollV6/Dixqgg9bkS4yy8eGBvYt6uyqy+P0OQ=
X-Gm-Gg: ASbGncumZBEAl/JUB2lXM4g/fUZ4OKFbeMOipAHp3+dgkkGynIMiqdLhVaDydTxiq26
 O6cAVGPpjGyoVDJ0HJYqt6jiR5s49SEVoRzzHlvAFv+a+jS8Qgnc4A92T2b90xif43VG6++iTjO
 z7f2J72lSgi17N9Hkx94kRaTObGwoxNPjfXhlNKZoMAQnp7t17Q8U9/dIVG9TR9npqswi5OVYIT
 K2PDEtFGPJs8WNqFp8HbYi6KCKVS7ISO1KxzFoin1IBuXe9GsZg5jvVwA/brO+4jIY3nMmc1rzg
 aPXr3qvD3Mu59dzuYHY4QYlPOXNt8S48PEc=
X-Received: by 2002:a05:622a:1922:b0:464:889f:a41e with SMTP id
 d75a77b69052e-46e12a15fbfmr1292731cf.1.1737062190372; 
 Thu, 16 Jan 2025 13:16:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFXt5NyVoWry2QOdDSRLx9F2O47PKP+nxPyccur8tm4EUjeKajrh/vfeX3iMMizXWvAQI/zsA==
X-Received: by 2002:a05:622a:1922:b0:464:889f:a41e with SMTP id
 d75a77b69052e-46e12a15fbfmr1292411cf.1.1737062189895; 
 Thu, 16 Jan 2025 13:16:29 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5db736428e3sm437703a12.14.2025.01.16.13.16.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jan 2025 13:16:28 -0800 (PST)
Message-ID: <404e8b7d-30ef-47f2-8a44-927b201d60ec@oss.qualcomm.com>
Date: Thu, 16 Jan 2025 22:16:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/4] drm/msm/adreno: Add speedbin support for X1-85
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250109-x1e-speedbin-b4-v1-0-009e812b7f2a@quicinc.com>
 <20250109-x1e-speedbin-b4-v1-1-009e812b7f2a@quicinc.com>
 <356986fa-e66c-4e78-ab92-2593b037ab9a@oss.qualcomm.com>
 <837602a7-bbd5-4436-ab9f-2b101bdcaac2@quicinc.com>
 <enykcipequ4xjykcjbkpnmtlclrbbmkhncj7fx3zy4sgmo3h4n@y3k7xgjscpfc>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <enykcipequ4xjykcjbkpnmtlclrbbmkhncj7fx3zy4sgmo3h4n@y3k7xgjscpfc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: uPJuheYRLQ1YLMj78cCniexNEBT0qIx0
X-Proofpoint-GUID: uPJuheYRLQ1YLMj78cCniexNEBT0qIx0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_09,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501160157
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

On 15.01.2025 8:59 PM, Dmitry Baryshkov wrote:
> On Thu, Jan 16, 2025 at 01:07:17AM +0530, Akhil P Oommen wrote:
>> On 1/9/2025 7:27 PM, Konrad Dybcio wrote:
>>> On 8.01.2025 11:42 PM, Akhil P Oommen wrote:
>>>> Adreno X1-85 has an additional bit which is at a non-contiguous
>>>> location in qfprom. Add support for this new "hi" bit along with
>>>> the speedbin mappings.
>>>> ---
>>>>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c |  5 +++++
>>>>  drivers/gpu/drm/msm/adreno/adreno_gpu.c   | 15 ++++++++++++++-
>>>>  2 files changed, 19 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>> index 0c560e84ad5a53bb4e8a49ba4e153ce9cf33f7ae..e2261f50aabc6a2f931d810f3637dfdba5695f43 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>> @@ -1412,6 +1412,11 @@ static const struct adreno_info a7xx_gpus[] = {
>>>>  			.gmu_cgc_mode = 0x00020202,
>>>>  		},
>>>>  		.address_space_size = SZ_256G,
>>>> +		.speedbins = ADRENO_SPEEDBINS(
>>>> +			{ 0,   0 },
>>>> +			{ 263, 1 },
>>>> +			{ 315, 0 },
>>>> +		),
>>>>  		.preempt_record_size = 4192 * SZ_1K,
>>>>  	}, {
>>>>  		.chip_ids = ADRENO_CHIP_IDS(0x43051401), /* "C520v2" */
>>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>>> index 75f5367e73caace4648491b041f80b7c4d26bf89..7b31379eff444cf3f8ed0dcfd23c14920c13ee9d 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>>> @@ -1078,7 +1078,20 @@ void adreno_gpu_ocmem_cleanup(struct adreno_ocmem *adreno_ocmem)
>>>>  
>>>>  int adreno_read_speedbin(struct device *dev, u32 *speedbin)
>>>>  {
>>>> -	return nvmem_cell_read_variable_le_u32(dev, "speed_bin", speedbin);
>>>> +	u32 hi_bits = 0;
>>>> +	int ret;
>>>> +
>>>> +	ret = nvmem_cell_read_variable_le_u32(dev, "speed_bin", speedbin);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	/* Some chipsets have MSB bits (BIT(8) and above) at a non-contiguous location */
>>>> +	ret = nvmem_cell_read_variable_le_u32(dev, "speed_bin_hi", &hi_bits);
>>>> +	if (ret != -ENOENT)
>>>> +		return ret;
>>>> +
>>>> +	*speedbin |= (hi_bits << 8);
>>>
>>> Now that we're overwriting speedbin, we should probably have some checks in
>>> order to make sure somebody passing a too-wide cell to one of these won't
>>> result in cripplingly-untraceable value corruption
>>>
>>> I guess we could just introduce nvmem_cell_read_variable_le_u8() and call it
>>> a day?
>>
>> X1E is an outlier here, because this was fixed from the next chipset
>> onward. For newer chipsets, we can use just the "speed_bin" node, which
>> represents a contiguous 9 bits. So, just do a "WARN_ON(fls(speedbin) >
>> 8)" here?
> 
> Or extend nvmem core to support non-contiguous fields.

This sounds more desirable, as we surely aren't the only ones with
such a "feature"..

Konrad
