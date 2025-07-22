Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E55DBB0E477
	for <lists+freedreno@lfdr.de>; Tue, 22 Jul 2025 21:56:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF9B410E709;
	Tue, 22 Jul 2025 19:56:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OKqie+tW";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2329010E706
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 19:56:04 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MEtEvH017686
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 19:56:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GjTWvnObvG/UeJuKXHL9K9+ApIca33uxx+7EN7uxT/4=; b=OKqie+tWt99ZKEf8
 mAm/cX/RY8ADiZ3d49ZZhhZ5C76BICLa+fxEe2uT9OC6zM0Lm2Po8S8BxqByx7kS
 b780q1o0HyQBv5ayhLBW47cTHVXGkt4dXh0ZTTWmpS4u4H7FXmW5I2zolHBIWoZM
 X9LWlos02N+xOaumOQlS1BbYiBvI2mVxfhQfLC8fYn1FHaVW1A/guRX7VgX7cUoT
 1fU2PIgSKIoyaOBG+X1ygtz8YMV0ErNXxLNj8Oz+twJshpKBI+T6AatLG190oGdm
 9l1Acc4talfp7qKRwld2uG2GQ5WJf6lHRM+SjzTl7sXLILfTAaMs68dY2XE/x+UQ
 QDlToQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481t6w3v0a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 19:56:03 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-748e1e474f8so8440210b3a.2
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 12:56:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753214162; x=1753818962;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GjTWvnObvG/UeJuKXHL9K9+ApIca33uxx+7EN7uxT/4=;
 b=rElJrRK94bebAgdfstOSQtW1hV5XqQiUStclWALahxgJgvLuuNCjEWey9T9X82/RBA
 mlEfxgcos4idUEtGPFQuvAhK0lEB5KgOtpLw1a8PBAxKOuxQW9gZ7LsyhcAA6nP+2uGO
 VqDjIXunReTT23rhskUvNHkGWEi5zAmr9FGx2vO4HA0IzAUGarVI4DO0I6mg6yKHv7Tr
 EcuueDZfnGRG53A06HtwyDdzAc9I2wK69vU+Whmqxe1FIekTrInpPLhC6oeMHicKnBig
 tB2wQ790qnogEHwGuu1wumx/E8ssyJplrQD83YSkigegmSjmIiiC0C7QsC7OgsgWKHcd
 mYHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWckFL9JOmFQzViNEylN6DgvGBVjs2P99jAzNtM+eDYkoGQDUWEqO9ArRjsiRAowsTJ968B1D1jf5E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxn8dTUrxCm7pdpMcKL++qOxCXoGoOhSHnjsEK29enjbOywXF8o
 XPFx2WiLTFLjfTCeANFAy2Ie1LoYEO0o8+NERdExgoDux62gTYqF0GjuVsdZMIqZ3E1iA3VnfyH
 HHjypWIpd6yNb1lJhmpK+oTYaIuLHROQKzSvPvFAV75VpVlNTGXRExBpl8vt7jCfCa4usFUM=
X-Gm-Gg: ASbGncstRincWoqlf4BEPl6jpbXNTSmwXreDo3jYk0Bot1MZDKFwVbuTjiUhS4nsWnc
 S6ivyi7PS42jKVuEyccJ5Unyaqk8InUEJgLJVrsUQYdgrpZz0WeL54iUC6qA8kwOsS14P47Xxk0
 rCQgpGXMLX2RrSGSih0wGkk/Ff7cxCko9yf7h72chRdxYLcahfT/GRWAuU2K9Da2Fd7Mqfh2b1R
 XVkAeNyXEjSviKISWL8nyW7fmPChsDqvhGQZR64t1/WgJ7Aci7Hc9uIeGVRSDlyCcIs8VxoUffe
 0GIxj1fmBAPJy3YI/Dbvk6LAoWzIrE2edmm5xnYLO6Xn7Ylg8p4eMXgbkxWVpOp1
X-Received: by 2002:a05:6a00:92a7:b0:736:31cf:2590 with SMTP id
 d2e1a72fcca58-760353f2759mr687694b3a.16.1753214162229; 
 Tue, 22 Jul 2025 12:56:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJK019g6DqECaNDbpD0Yvmal8JjGmdWP1kCx05y6YQEB+NqSgr5xgmvBvu9sxGV/5wQFRvhg==
X-Received: by 2002:a05:6a00:92a7:b0:736:31cf:2590 with SMTP id
 d2e1a72fcca58-760353f2759mr687654b3a.16.1753214161634; 
 Tue, 22 Jul 2025 12:56:01 -0700 (PDT)
Received: from [192.168.1.4] ([106.222.235.133])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cbc680absm8266052b3a.144.2025.07.22.12.55.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 12:56:01 -0700 (PDT)
Message-ID: <1b7817eb-6d54-4ed0-9ab3-d5b521d5bf6d@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 01:25:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/17] drm/msm/a6xx: Poll additional DRV status
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-4-9347aa5bcbd6@oss.qualcomm.com>
 <shq6rnj5qrw52xvtcnu3bbvxuxjuddzajugawcojdyrm74fpp6@abeztbbmtqnr>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <shq6rnj5qrw52xvtcnu3bbvxuxjuddzajugawcojdyrm74fpp6@abeztbbmtqnr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SPpCVPvH c=1 sm=1 tr=0 ts=687fecd3 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=4dphQItTPUswyQvINXrzgA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=TSBj-XRfAaQ4HSZEJ1QA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDE3MCBTYWx0ZWRfX0nwaMjjdXbjo
 Wg1ardxsnUNHlWQdtvsX0KfXHq81GelBL3ynkUck7S1kXz4hcBoRcBgP6mhkjw72cdodJxhFLkF
 S4oKmdIgCH0xsWVutHyf4I1oLTi0vEFB+34IcdfBGyL6zNxrayUJ7Ns6zPC6mCEcEHH13WME9Pu
 1rFq6pbnG9vrh4O5hphQoh8ZuyQPmaoYP+5cAdejucMZT6LueV26AfsG3BfJs+WEjIzdpj8WC+I
 DvuxFEdgLh2nNoN4zaL5zvV/ZzvFepngSCTK1a88/ou2WKLLyrvRUDYNlW7qyA1F9MtNP8lhkEy
 cZww1AK4+aCrvEHdi8YXGwq8yiSW9TH9VeuyeV8oYBSWzD3fEnHe0kTW6PCLhSmfl+QEu02ZOOq
 PBJpgYrNNUfj+TurxgSp5M4HpJm2K3wmvmIIWnP+jrFI2SqAwQOI0eZdRLX9ps04Ifq9xXOh
X-Proofpoint-ORIG-GUID: O9aG3RD7aTgB82vJAwf7UkVOfxMM6wNg
X-Proofpoint-GUID: O9aG3RD7aTgB82vJAwf7UkVOfxMM6wNg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220170
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

On 7/22/2025 7:01 PM, Dmitry Baryshkov wrote:
> On Sun, Jul 20, 2025 at 05:46:05PM +0530, Akhil P Oommen wrote:
>> A7XX_GEN2 generation has additional TCS slots. Poll the respective
>> DRV status registers before pm suspend.
>>
> 
> Fixes?

Ack. Will add the tag. It is good to ensure there are no outstanding votes.

-Akhil

> 
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> index 790ef2f94a0b0cd40433d7edb6a89e4f04408bf5..3bebb6dd7059782ceca29f2efd2acee24d3fc930 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> @@ -987,6 +987,22 @@ static void a6xx_gmu_rpmh_off(struct a6xx_gmu *gmu)
>>  		val, (val & 1), 100, 10000);
>>  	gmu_poll_timeout_rscc(gmu, REG_A6XX_RSCC_TCS3_DRV0_STATUS + seqmem_off,
>>  		val, (val & 1), 100, 1000);
>> +
>> +	if (!adreno_is_a740_family(adreno_gpu))
>> +		return;
>> +
>> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS4_DRV0_STATUS + seqmem_off,
>> +		val, (val & 1), 100, 10000);
>> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS5_DRV0_STATUS + seqmem_off,
>> +		val, (val & 1), 100, 10000);
>> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS6_DRV0_STATUS + seqmem_off,
>> +		val, (val & 1), 100, 10000);
>> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS7_DRV0_STATUS + seqmem_off,
>> +		val, (val & 1), 100, 1000);
>> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS8_DRV0_STATUS + seqmem_off,
>> +		val, (val & 1), 100, 10000);
>> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS9_DRV0_STATUS + seqmem_off,
>> +		val, (val & 1), 100, 1000);
>>  }
>>  
>>  /* Force the GMU off in case it isn't responsive */
>>
>> -- 
>> 2.50.1
>>
> 

