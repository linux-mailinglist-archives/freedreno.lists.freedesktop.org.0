Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 709D3C06ADF
	for <lists+freedreno@lfdr.de>; Fri, 24 Oct 2025 16:23:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25CEE10EAA4;
	Fri, 24 Oct 2025 14:23:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nY5OaQve";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5813810EAA4
 for <freedreno@lists.freedesktop.org>; Fri, 24 Oct 2025 14:23:12 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59OC1jRe010214
 for <freedreno@lists.freedesktop.org>; Fri, 24 Oct 2025 14:23:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /EgZaEEAtQpIr/mZaxCGpC9Z/zSaRdUrKgdMD6X3vlY=; b=nY5OaQve8G5EIpFm
 rYPkwyaycSFwxx9VkYXWvNsPm0D7qWqt5lxOmbkwJxRqm5BIs5wf9GSTl6yW6xPv
 NgpidjM2fE4dnlVVnL0N5f/Pu12FQFJheeMVvhB8H5OlFfA4nQSjAwc9R3aXRRR6
 xY/hZqCgsskE2TLmOtII7ASb1aM1mdVlNM/p4KlBYXyXzkaDOCZvcU0McgMRHali
 BBhlCsHAsXXO+5cLj0J2XtSbAkhcbb7KW/hpmGdl7mDwBvg+YNxOekORtu3Q7sYc
 GtMEaPm5/PBFNFMzkpeJBZp5skCOFZwaQcTy7v39PSsIM75esnudy+wLI+dtVBPV
 MrhtgQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y524eg28-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 24 Oct 2025 14:23:11 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-272b7bdf41fso22850605ad.0
 for <freedreno@lists.freedesktop.org>; Fri, 24 Oct 2025 07:23:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761315791; x=1761920591;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/EgZaEEAtQpIr/mZaxCGpC9Z/zSaRdUrKgdMD6X3vlY=;
 b=Gdzq2AMy+nsQ+nmaB6a0lST+hAGIor56mUmD4kFyXNHxuHjvvhKgKZ3xRaos2aCglQ
 cbe/YCq+H0I/W6hQcA/FO31t8he/J9TKa1mP+Mf0YgJ24NtlkqpUXKme7TCo3LJQirIA
 +Q1XvcA6z2glEnF9ON0Q78xoI+0Pb1S3eDb0Up5vtwgphKuLaBy4r4740Mr/OAEJTkci
 wL/g96yL4pML9fsEmoTb/dQophepPHIgtYYALxEubX+h2lQUCG3p/XTZt2UGXFbhgRxF
 F/hRQhXQCSFiXpaw4xVuAzWgIvWaTsVRk7Hi8oOu6j4M1vBE8Iu1B07pD8V2Wri6kL2w
 8q3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWptwOrsUA8hnXLMN4neDzyiLpS9sCWYFC9zIWu0tNVAGaVBPYhpDI1274LgUtIL++xtWyNGiqBOHA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZPEnu/1cKvj9KQr0ZDQDdyfQxbi7kq5O6Ac8iraw6AwwGjmGv
 MKTBM9iO8kaktLaTB8LhBrcqsAWrSjLxkLqHYFguGbPczCtVfyzsOQa9MG1e3fRk855ziODAK0B
 gNWuYPG0dikeIBQqhL/VT0c9e6KgxgcBpfKzacyKBZUpOo525wf2+NzRcN2OzYEFUpVwgCR4=
X-Gm-Gg: ASbGncvAQE09rQkxvR1NkIUt/F3uk+TDsJtizJEH/a+/8911tzUPrYoJGjlW03t8o/9
 gWIRTul/vgdRoyiBf/9HjqllzQE1XRCXOY/oHOhpgAfV/Z3k13OCzoIXKSGwYrG8iNoiMA97rdm
 n/RXYqQnBczrQURLwzx6IK4D5dZanbkfCDq7lb3CjvAPYwUNMe7CmRRLr4ysQSKxh24nZMa7XU8
 iZcxqHHPqogjOJvpOsqLjdJQHJG61p24FLhYKa6LEIGfw/3fZ6HypkXzPrqPAEH37xIIvLw0ClN
 4iUPDWS2EgOMlY17JdQQD9JR/IJn3yOM7SSb1wxiIJr889FjdQygN6NAyAS8L/5sY13DDVGPIxH
 KADPCMhVJIxkeoEYfzstMpQ==
X-Received: by 2002:a17:902:f64a:b0:294:7048:643 with SMTP id
 d9443c01a7336-29470480f8fmr67499695ad.15.1761315790767; 
 Fri, 24 Oct 2025 07:23:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4MPeSwFhzPTKvaKRf1XESN9sP6R6a1VjFKBw7Sdaagyby5CvwLmehW1f6noOGu/6x8AKqOA==
X-Received: by 2002:a17:902:f64a:b0:294:7048:643 with SMTP id
 d9443c01a7336-29470480f8fmr67499295ad.15.1761315790217; 
 Fri, 24 Oct 2025 07:23:10 -0700 (PDT)
Received: from [10.204.104.20] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33e1ed68869sm5129253a91.0.2025.10.24.07.23.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Oct 2025 07:23:09 -0700 (PDT)
Message-ID: <7c563e83-031c-445c-bcfa-c04f4729622d@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 19:53:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] drm/msm/a6xx: Add support for Adreno 612
To: rob.clark@oss.qualcomm.com, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jie Zhang <quic_jiezh@quicinc.com>
References: <20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com>
 <20251017-qcs615-spin-2-v1-1-0baa44f80905@oss.qualcomm.com>
 <44ff81bf-8970-475c-a4f5-c03220bc8c3f@oss.qualcomm.com>
 <97aeb6a1-fda2-440f-b14b-2f3dbc2d7e8e@oss.qualcomm.com>
 <5e64c246-a424-42c9-b102-e1a2af579936@oss.qualcomm.com>
 <CACSVV00vwbNtH47S_BVet7uP7u9t4RY=xTBn_r3u4sS91Y7Muw@mail.gmail.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <CACSVV00vwbNtH47S_BVet7uP7u9t4RY=xTBn_r3u4sS91Y7Muw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE1NSBTYWx0ZWRfX52MhgxWeFyj4
 T0Hfu1e55nsrcsAJZJ3E6J5qUAtzpHwPUX93uL1vnE1HSk63htMbyxEBLJN4dna5WUK5TCtCjeR
 L1TNOrpxE9ZPT4ep8ZtvBTtEiULPIhKjU6v/bc8zmURv63FblwbgYs4l8ZhrJDPkl2XAp7V4cwS
 bweTSHoGW8pry9UfyBRvX4CIrHIlca9+TMMl7XjhJ4lF7/OCWgWY2GXZeQa/hGcV2U4dfAbyuo5
 DfopiKJsWyQw3SnZeCpzdXKf0dzwR5aSf30UipEPINzBedId7KH4bNg1d0Jz+N5wtA+3Ao6gdAZ
 UdYPnn4evRhKQklgElu9NuXeAoDIQKPjgm8ZKL42siC8qGXRLmEi8oXBvebM7Zjd2YqASbdB3sl
 e0INASMyQlY6dqs60edD6i/XLbL94Q==
X-Authority-Analysis: v=2.4 cv=Uotu9uwB c=1 sm=1 tr=0 ts=68fb8bcf cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=Kgau_Mukr_2Uqyo6pRUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: diLcFCpRcfIVXd4IbbXE_YOW8hFDP4lK
X-Proofpoint-ORIG-GUID: diLcFCpRcfIVXd4IbbXE_YOW8hFDP4lK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220155
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

On 10/24/2025 6:46 PM, Rob Clark wrote:
> On Fri, Oct 24, 2025 at 12:55 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 10/24/25 12:57 AM, Akhil P Oommen wrote:
>>> On 10/22/2025 8:43 PM, Konrad Dybcio wrote:
>>>> On 10/17/25 7:08 PM, Akhil P Oommen wrote:
>>>>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>>>>
>>>>> Add support for Adreno 612 GPU found in SM6150/QCS615 chipsets.
>>>>> A612 falls under ADRENO_6XX_GEN1 family and is a cut down version
>>>>> of A615 GPU.
>>>>>
>>>>> A612 has a new IP called Reduced Graphics Management Unit or RGMU
>>>>> which is a small state machine which helps to toggle GX GDSC
>>>>> (connected to CX rail) to implement IFPC feature. It doesn't support
>>>>> any other features of a full fledged GMU like clock control, resource
>>>>> voting to rpmh etc. So we need linux clock driver support like other
>>>>> gmu-wrapper implementations to control gpu core clock and gpu GX gdsc.
>>>>> This patch skips RGMU core initialization and act more like a
>>>>> gmu-wrapper case.
>>>>>
>>>>> Co-developed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>> @@ -350,12 +350,18 @@ static const struct a6xx_gmu_oob_bits a6xx_gmu_oob_bits[] = {
>>>>>  /* Trigger a OOB (out of band) request to the GMU */
>>>>>  int a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
>>>>>  {
>>>>> +   struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
>>>>> +   struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
>>>>>     int ret;
>>>>>     u32 val;
>>>>>     int request, ack;
>>>>>
>>>>>     WARN_ON_ONCE(!mutex_is_locked(&gmu->lock));
>>>>>
>>>>> +   /* Skip OOB calls since RGMU is not enabled */
>>>>
>>>> "RGMU doesn't handle OOB calls"
>>>
>>> Technically RGMU can handle OOB calls. But we are not initializing rgmu.
>>
>> Oh, I glossed over that..
>>
>> IIRC the reason we delayed 612 support in the past was to make sure
>> that the RGMU FW is consumed, so that runtime requirements don't
>> suddenly change one day.
>>
>> If you have no interest/way in getting it wholly supported right now,
>> can you at least make sure that the driver requests the firmware and
>> exits if it's absent?
> 
> adreno_load_gpu() calls adreno_load_fw() first thing, and will bail if
> gmu fw is missing.  (zap fw is a bit more awkward since that could
> come from dt or device table.)

Correct. And RGMU firmware is available in linux-firmware repo.

-Akhil.

> 
> BR,
> -R

