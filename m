Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA12CB15293
	for <lists+freedreno@lfdr.de>; Tue, 29 Jul 2025 20:20:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EAB510E664;
	Tue, 29 Jul 2025 18:20:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q2TITawp";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C9D710E664
 for <freedreno@lists.freedesktop.org>; Tue, 29 Jul 2025 18:20:03 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56TI3G6X017592
 for <freedreno@lists.freedesktop.org>; Tue, 29 Jul 2025 18:20:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lcsta1yjIbei4fuovlusUPalhkFx/bRo2Mx3CVdJirA=; b=Q2TITawp04pzzAhu
 xgbOv/S3s9a9GWetJyEZIkSGmrKEpvOPuMlD7Izf4baGmdaurpXRt9l+ANFsEoWu
 w73V3gK+5KM5/kVy9RKGiziNE18pFPqGNZWLvJsTjQcopKW5Tj/kb6/8OXuBN5CB
 L7NUd+ZIKA8UdLD5hblJYL170pAh0Uow/7/7cveYRpNmfzURSX2MvJaL1VE98tys
 v/8jgbJ7/PaJq0mPYXyYPx7SmFX+mlgm3Xl/WcOZiJbSJD8FySltSjB/Y+gE8jjC
 84SlWIWs7NzpLOUN5rCISI1Dt0XWXK128LqYaozH+l8WFR/OPo34NSIP0nz2WtPF
 AHn/Lg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484p1ah4gs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 29 Jul 2025 18:20:02 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-237e6963f70so102175075ad.2
 for <freedreno@lists.freedesktop.org>; Tue, 29 Jul 2025 11:20:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753813201; x=1754418001;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lcsta1yjIbei4fuovlusUPalhkFx/bRo2Mx3CVdJirA=;
 b=hFIwL0Nq77CIBrWnqZCocM+cJeoyYou4fB1BD1Vb3Wng8R10XCgIWajs/nVCMhJl6p
 vEEmFg4g4v13aUudWsG2z5nRNLVO2InjmfbWVNtSVZ5zAieAc6axKGU16WUF5iAD/MH+
 AgIIeNxk3fTUiDXIc60V7m5VTNs5fgI9Ul783tW89HgPfkoGcS/qNuXXhAC6ncP7Nbl+
 k1mGXQtPO7W8EjpUUpFI1IWK3Qct/Pwy72aqszc8XFa9eH+lWyW/sy866M81Zzc+Toit
 JDA5JxTml3UnqYaZqnVdH5cr4xJ2kGrMYJIvUUb75x+xU3Nvg/P8/1IOdeAsA/l3bNf6
 yI0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUBrDMwWsFJHJQKh67Dp6DdPwDrvx+frK0wQZvw0GIzUPJfdCUzGZGeK13/qBOI4EmeObjifeWBm0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzcnxSPMRrPs4F8Xw+z4PHb4M2qNZ9lXNDvcIDoZ+Of6xxphl9S
 iAfM7ygMXmNH+wJUy7bDyI6egqhieDvG2Ugne+rhUEknq+XnlfQNCIpCdwdgykM0WKXbzj2bjEb
 WFPP2PU7S2UfrbAcJpiXNbcV+3WYniJiXAkPivCWe1Xr77F3RVuZUNZHNeTvAkwss4MUpwOg=
X-Gm-Gg: ASbGncuaiQ8HbkjCcyy+nmdB3YKOvL9sxsfPzh3PbR0578hD6SoDoJ01KAr/9veYqQa
 KPTz+8l2mgdlr9twpL/hANDdYziLQmERIrNl1rYCB7xC1xm1tKhka4c/nCpmMYRnzBUtE+nxPhA
 LY/Q3piLO8uoJE+bHJmB6NxAW0JpG4w25Ooj+tOsrAVUtSgV+j0kqJv3cdXnYcau5Z5yzZ+Hezh
 V6fMRD+tGLhh/bcOTTO4y+TRwxfJrHPtAovME/bppiN1Hos5MsrDeL3QC1KIjfTGSN3pN+BH8dF
 krQdNO5KSicgEnR4qEQXO8NpV26PPgv+Qmio6NuzhugstmiuxVNYGjUCEs2xq63Q
X-Received: by 2002:a17:902:d4cc:b0:240:6406:c471 with SMTP id
 d9443c01a7336-24096a4f7e5mr4814335ad.10.1753813200869; 
 Tue, 29 Jul 2025 11:20:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGa6BasIaRExFV/BwNT4qsayfxOvO5gmjUpfnYyJ28K3IONSoxFXWJUahLqssfmGes+zOsqug==
X-Received: by 2002:a17:902:d4cc:b0:240:6406:c471 with SMTP id
 d9443c01a7336-24096a4f7e5mr4814125ad.10.1753813200416; 
 Tue, 29 Jul 2025 11:20:00 -0700 (PDT)
Received: from [192.168.1.6] ([106.222.231.177])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23ff1dbec8esm68679145ad.194.2025.07.29.11.19.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 11:20:00 -0700 (PDT)
Message-ID: <c44eb0a7-3656-412e-8b21-fdc52866c0a4@oss.qualcomm.com>
Date: Tue, 29 Jul 2025 23:49:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/17] drm/msm/a6xx: Enable IFPC on Adreno X1-85
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-16-9347aa5bcbd6@oss.qualcomm.com>
 <cfbad162-e629-45c9-8436-74bb6fc416f2@linaro.org>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <cfbad162-e629-45c9-8436-74bb6fc416f2@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: IMSunVF_pCyZU09DTddTcYF1mpvH37pn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDE0MCBTYWx0ZWRfX+LL4lDZKt0s7
 WUM9h0uqo24S9LWVslegu+UPkitJ0O9nmqoDSIFNzlt/Ao9X38kGc3ZOklcsB6cTaVGXqH432Gt
 +uyeBsshA+a6dlgaApf0rhw81OFwoRBJWSvW1Sfc8vURQyDFXGW5EiS9CviPaOqIUCaPsfDNgAu
 w21g3buzlk1wDs/pKf0ZsPCQPjMiP3xmg9IBU8TgZtkSRcnrc5ZmYXMsj8Skprfzc7MKJ/+e8vX
 vCYEdavDuZKcNB1UUa7BaLPj5VzH0Ykf+KdVvFuKdY69xC5ZWr7UMJ1YBr2HgWomD4nyoKTahL5
 yRxCM/6JL29yzplBL/eIaxBNKuaCNw24USR+6W1G3oMiuqHhWJSKqVnJlWjbrSGApJvedcQfrXk
 PnuLl1sDGjVnDQGHT7EYGLUvWqnR16G/gpljFoxw0FA+AphDfEl3H2eUqIh3NGEMsj1ai4/K
X-Proofpoint-GUID: IMSunVF_pCyZU09DTddTcYF1mpvH37pn
X-Authority-Analysis: v=2.4 cv=KtNN2XWN c=1 sm=1 tr=0 ts=688910d2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=9XpMM9ZEX5jLuhR58p3+Fw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=oxwwQDlBbdW4oIJT5RMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 mlxlogscore=978 bulkscore=0 spamscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507290140
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

On 7/29/2025 7:36 PM, neil.armstrong@linaro.org wrote:
> On 20/07/2025 14:16, Akhil P Oommen wrote:
>> Add the IFPC restore register list and enable IFPC support on Adreno
>> X1-85 gpu.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 67 +++++++++++++++++++++
>> +++++++++-
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 15 +++++--
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>>   3 files changed, 78 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/
>> drm/msm/adreno/a6xx_catalog.c
>> index
>> 70f7ad806c34076352d84f32d62c2833422b6e5e..07fcabed472c3b9ca47faf1a8b3f7cf580801981 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> @@ -1343,6 +1343,69 @@ static const uint32_t a7xx_pwrup_reglist_regs[]
>> = {
>>   
> 
> <snip>
> 
>> +
>>   static const struct adreno_info a7xx_gpus[] = {
>>       {
>>           .chip_ids = ADRENO_CHIP_IDS(0x07000200),
>> @@ -1432,12 +1495,13 @@ static const struct adreno_info a7xx_gpus[] = {
>>           .inactive_period = DRM_MSM_INACTIVE_PERIOD,
>>           .quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
>>                 ADRENO_QUIRK_HAS_HW_APRIV |
>> -              ADRENO_QUIRK_PREEMPTION,
>> +              ADRENO_QUIRK_PREEMPTION | ADRENO_QUIRK_IFPC,
>>           .init = a6xx_gpu_init,
>>           .a6xx = &(const struct a6xx_info) {
>>               .hwcg = a740_hwcg,
>>               .protect = &a730_protect,
>>               .pwrup_reglist = &a7xx_pwrup_reglist,
>> +            .ifpc_reglist = &a750_ifpc_reglist,
>>               .gmu_chipid = 0x7050001,
>>               .gmu_cgc_mode = 0x00020202,
>>           },
>> @@ -1459,6 +1523,7 @@ static const struct adreno_info a7xx_gpus[] = {
>>           .a6xx = &(const struct a6xx_info) {
>>               .protect = &a730_protect,
>>               .pwrup_reglist = &a7xx_pwrup_reglist,
>> +            .ifpc_reglist = &a750_ifpc_reglist,
> 
> So far it's stable on a750 so I think can safely add ADRENO_QUIRK_IFPC
> here aswell.

Thanks for testing. I will enable it for a750 in the next revision.

-Akhil

> 
> Neil
> 
> <snip>
> 

