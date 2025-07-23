Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3A8B0FC38
	for <lists+freedreno@lfdr.de>; Wed, 23 Jul 2025 23:43:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D6BC10E077;
	Wed, 23 Jul 2025 21:43:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VjClZdQ1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D8BB10E077
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 21:43:33 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NIop9n019720
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 21:43:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Uzsd1xcUKgsxCpgkX2HBRK56tDWw0kgTphmNT2IrLUU=; b=VjClZdQ1R/6nAsi4
 mu+I9PBYb7YhfPNj0w8Fs2qNGeoI0KcHczcDEQM4o5IUFyS2ten/n4F2EaZ0523J
 rwSbI+nGvi6txycqRvmmWqGt4TqoqVyFrRTQQ8wJ2wdvV9Utxuk7JKTuhjRe+Y/+
 dzkhAyUuM20VVUAL1cUngxGKagZdTcdJO1ATwOvU7z8zjcqd478DxIqT6vGHIlBK
 l0QMIf7/80G4LjaVbL6jEL3SommuCkoaEr45iupaESdgvCqTe/FsONjzPSlsr8kd
 HOCt8TtVevPIk2MBl2ZMRe6Wejvy2H80sbG19DlAexLixjDP8noHmMTSjUhbaWW8
 klxYZA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481qh6rsdp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 21:43:32 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-3138f5e8ff5so245114a91.3
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 14:43:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753307011; x=1753911811;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Uzsd1xcUKgsxCpgkX2HBRK56tDWw0kgTphmNT2IrLUU=;
 b=oFWF/Q9FnVNs3uKOkMaUwf+WdU0tLtTCEh02Z+DgJMd+gFKsRH3IlWlJ1f9+3Rpkwv
 NSY+qJL1ma4tQ+KoonxZjcOQeLH188jvZXO1sTN/Qpp0A/R/blcfATXHEo00Frnr7iID
 y2zmHPTuObOpD168TsF4xsMoVVpoacA7HRzqOZ+mZH9zRAPOVR3zqMlydELp6pKUzUfv
 TN6/Q2+dHzIneFD7Ii0QyeDWJrPSP8MI0QshhXNDUyTd4csiHFeVzY1CpyJ2P2bpc+1m
 6fWL50bLqx4TLrGGHV/9VLyxdPxhDA8dGSMIhj7WyFsJyNTQVzOUhLtjebGfS5furWpr
 fJ6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnmAU6ZMyMfS385cjaxen1cSlnYCkVF/gcGAnSosAQSzQwj6y4f1Jo0BLsmjLajWxn8cka0gHFSiw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBtLP7RyW2z5ark+kZ9fLX0WrVXrSo2QI4JDmlfUMtL6+3lrOB
 H9vmfUh525IGTLLZM0xj/fq8+NnqgZBDZ9vs4CihdrMHKU7X5jatzdo+IDT0U2qA1CtEyG/Ut8W
 lw/GGL5w3/ganCSYhDg6WVeBOQ5+MxN8NYHmEwj9ZXa2jz0MPHkTuVArfkbugiQv2QqU6kIo=
X-Gm-Gg: ASbGncvay4L42miRwZiJVIbOri6KP8tVRv5JRKnjT4zMcjsOMfy2OUs0Z6qzVMjqgQR
 rWh8hqkHLO01kzH5iP2D8VVDKWNTTgbXSWl9ua9z9479yXXycLX8m1QiI4mUmcRiRCx/y5qOzC4
 92vXXiqXrE4uwMqit2gz87+t+Jd4p3vwpT0QuR0ZZtn+zkHY3OlnpN1GL+NHjP+cH0TRGMTLJ/u
 aPcys3t5TI2XZWIpUV0EyH2Y+PzBh1NiNz0ssp4CRKacHJzE2xOk0kvmBaCmonz3O6HsUF0yDyG
 JCyRhUBG/AXCBTptQo79xODRrVbPAMJvziDPRckUFd8uP21HmAA2TqFrm8jHHw==
X-Received: by 2002:a17:90b:2e4f:b0:311:b0ec:1360 with SMTP id
 98e67ed59e1d1-31e507e27ccmr6472061a91.29.1753307010584; 
 Wed, 23 Jul 2025 14:43:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzTDpyK8uhEHXdusySPe7kL1WJwqg+L63lFCGjVnLvsY2leb5rLrYmu0tDVWGGC6nfTLKVxw==
X-Received: by 2002:a17:90b:2e4f:b0:311:b0ec:1360 with SMTP id
 98e67ed59e1d1-31e507e27ccmr6471989a91.29.1753307009327; 
 Wed, 23 Jul 2025 14:43:29 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.235.3])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31e63a6677esm18638a91.3.2025.07.23.14.43.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 14:43:29 -0700 (PDT)
Message-ID: <d06c6b86-2aa0-4f59-af8f-0130897c7b26@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 03:13:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/17] drm/msm: Add support for IFPC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
 <20250720-ifpc-support-v1-11-9347aa5bcbd6@oss.qualcomm.com>
 <k653qq6a4xkvwadeum5kbr7cheje773vobehpzq33ec44vyxjj@vi3ekv4jwext>
 <6472bc1a-9546-4cb1-85b9-d826f76ba9f4@oss.qualcomm.com>
 <5471754b-5dec-4107-96d6-a6075328d824@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <5471754b-5dec-4107-96d6-a6075328d824@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CZ4I5Krl c=1 sm=1 tr=0 ts=68815784 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=pSIa2sKh8ADkebnh61Ypzg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=-ImCKyWHiv6jzAo2IrkA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: GpclHTKw3z3oVvN7FE2WVi-CAFPN1CbY
X-Proofpoint-GUID: GpclHTKw3z3oVvN7FE2WVi-CAFPN1CbY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE4NiBTYWx0ZWRfX3jNjZx5XPJB3
 teaOED4mSne/NN76a42At9pljtsBvcVeH0guI53rAXz2g8jjXMuTeu/ZbqFPs/4pB4MLs/iKt4C
 av/20hjPMPfLCXgak9xsGcqDjyvmuuVh8/PQ0mh1cwIJcm2K6jCk99sEasDsDCOhiIWiEF7o53/
 owwjxW5mHLP3amH9C1w921oXAEW++hwRuvLng0QzgFzLtmtky9Sf5kQWZU/m9d3gFVA9Zc5OwrG
 hML/jNke5AfwG6B11OhAwBkTmwEsFC4RPBNTcZjy5QH+/Pe/yoBSyStMUV1jAZeBUGUJZs9PSlR
 4zQYCtX5amN1s4RMuWMvyXqAP4/hbw0Z1+8fR+O+T88T32H9okx/VnLIXc2CBoAIB4FHFTDtj9/
 fKMKflnUow7ZN2qTfhzMrInoixR+QJgh2DUBJPzSJ9JWDyVEQXofktJ405N9JfWECN6Xx48V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 impostorscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 bulkscore=0 spamscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230186
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

On 7/23/2025 3:57 PM, Konrad Dybcio wrote:
> On 7/22/25 11:27 PM, Akhil P Oommen wrote:
>> On 7/22/2025 7:19 PM, Dmitry Baryshkov wrote:
>>> On Sun, Jul 20, 2025 at 05:46:12PM +0530, Akhil P Oommen wrote:
>>>> Add a new quirk to denote IFPC (Inter-Frame Power Collapse) support
>>>> for a gpu. Based on this flag send the feature ctrl hfi message to
>>>> GMU to enable IFPC support.
>>>>
>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>> ---
> 
> [...]
> 
>>>> +static int a6xx_hfi_enable_ifpc(struct a6xx_gmu *gmu)
>>>> +{
>>>> +	if (gmu->idle_level != GMU_IDLE_STATE_IFPC)
>>>> +		return 0;
>>>> +
>>>> +	return a6xx_hfi_feature_ctrl_msg(gmu, HFI_FEATURE_IFPC, 1, 0x1680);
>>>
>>> magic number?
>>>
>>
>> Let me check.
> 
> techpack-graphics/adreno_a6xx_gmu.c:
> 537:#define A6X_GMU_LONG_IFPC_HYST      FIELD_PREP(GENMASK(15, 0), 0x1680)
> 541:#define A6X_GMU_LONG_IFPC_HYST_FLOOR        FIELD_PREP(GENMASK(15, 0), 0x0F00)
> 
> (same value for a7/a8)
> 
> 0x0f00 is 3840, which smells oddly like the XO clock rate (possibly mul/div2)
> 
> (38.4 MHz or 19.2) / 3840 is (1000 or 500) (ms? us? cycles?) and the other one is
> (333 or 667) - without any further information I'd estimate this is some sort of
> scheduler tuning

Thats right. It is around 300us. Will add the same macro in the next rev.

-Akhil

> 
> Konrad

