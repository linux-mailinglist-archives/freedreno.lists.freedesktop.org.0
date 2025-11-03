Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E4FC2B788
	for <lists+freedreno@lfdr.de>; Mon, 03 Nov 2025 12:44:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF89510E056;
	Mon,  3 Nov 2025 11:44:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HTFTJTyj";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jCiDRhPx";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2758210E3B9
 for <freedreno@lists.freedesktop.org>; Mon,  3 Nov 2025 11:44:37 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A383UrO809005
 for <freedreno@lists.freedesktop.org>; Mon, 3 Nov 2025 11:44:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YvOf+kp0ZdmTGQTGoezpj45yRTsjMynuJPHhSZjrogk=; b=HTFTJTyjdyo/guLM
 WX2vhQ8wZOIyFsXCe36gsy0kBRphrIR62eb+610H9EB0TpCX8aYS5LqQynP6PtJ/
 6v+T8yCOh51+nVYc+9+fyonlatXL5oZtPb5+QNDkR+KcVdeY4cDJ9z3ZRmOo4UPq
 ZSx8rk9SRhZ3XWifvdQ2otIH7ayKm/JmEkSY2KsrCUT+z2IuWHB71WJaZjm9zUFZ
 lc0VSywiqw7rv9DgUol3LcQ1PHggRN+37CxwNJYlaN7OaXZDAg3avUFpAfqdaW61
 /UA7nBFmgSyZKTwAj136tyNbR5RcHBgA4TtkrGS2Ro7hi5iLxAI/Xy9EIi0RzGIC
 A5Y6qQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a5977ck54-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 03 Nov 2025 11:44:35 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ed0633c433so13795981cf.1
 for <freedreno@lists.freedesktop.org>; Mon, 03 Nov 2025 03:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762170275; x=1762775075;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YvOf+kp0ZdmTGQTGoezpj45yRTsjMynuJPHhSZjrogk=;
 b=jCiDRhPx76quRjpXBO/t784J1i2S4NQCGu0hBmPv8pXC6jY0lp45E53xCqIskBisxc
 oaZAx/n3tDcsyacvFagzdZTa0nR6J+UlaI+DI7F2/+fkYxHQfuxZeTqFtw4KtjN4tNYf
 DxvA2gQnsjmPk3f6AftFZhuuoVsAnhGsJBVYtmBmOBlBuRVEFOFU/dyqZlq5nl25Sh9f
 gSnl3s6b9t/PS+hvwlqeL5NvNzA4HrkjHkatBRYl4FJGLZrYyNHSxmbZvCs6/+tDqXDw
 7uVslzDCyEMdEXavSygnISOnXeD6R6pp6EwFRk/iClWqLMldrWHDopy/04iO6FGcRgIu
 vMpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762170275; x=1762775075;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YvOf+kp0ZdmTGQTGoezpj45yRTsjMynuJPHhSZjrogk=;
 b=aL05JZza6C19KONN8G1qCvnn7BpGqPnaxZSTZz9iiwjMn3ORuZyakrNj2ma2rehgzB
 /7TII+pVHwXMI+PTnu6DUcHLgncIurvWEjiOe67KFvhaRFr/NEDu7NS/niXCh2MUeBZO
 rlcbL4FNX+onGcU8bn/0jvegxMAnDeTPayXvhlufQT9CfM/TFgReZRhEgrdOvrIJ8QKH
 fzp3a48cTyNRyfCCmZL/BuA0NaQSVU67IXoP3dk7PTWgMbHohNKwZyzpiR2i3kHiCIry
 5umw9GESWu1YP06v4tPEnR3Op971XYN7tvmCbJ8IlAGeoUGbmxOuOsY2Ww+OSgZ4ZCuG
 5SQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSA0+lLo35hQPXY8fX66aIcgLP0qAUFB+p00Qxqcjv+D+Lc4rbo1xvdcvzN9X/GpH7UKDdnUjQvio=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz3FaUHUnVuvc94YQJpdXR81yRyJbhtgIKNUjZ+U6HkUwvkovmK
 h1mTBCGsJGrpf+e7ELD+aqq0GZRRCndefAZ1NGuJE5xXlI+RpOVuTBzNR4fk9JEZhr3en6wyxdO
 KyA5W+CwtIkbIWzFfanCQJGtR3AEpu7wL6NeWRC1hOoLxMR+tnr2bcN1F0q5+vJaAlbTFrFU=
X-Gm-Gg: ASbGncu9d8SI//q860euRxKyMbMklL2bqeFB5V0qJcU2t/rKne+3/WlkG7Xl06L1R8E
 cIz14eY/Ju1jwAngIBafahMUMYRjTekBCx8/Z1WZh6oG/2MXj1mjwLGVzZkiE2PWTe+jKW8sQm9
 2hNfW9gwvz7RpNOpK+uHSSTpstrI1xOmEeVxJd8PhuhOegPJbdqTn23BwVYxsV/5up4xbree4Zu
 GZhEPSQNc/JTjXiPMSaBzQwF4d1aHCKoTLqF1ScUaGFepdGX6fiMV4dCLzmOY/QGG8+iVLFIYp+
 s6lVM6K5LLbTfcvGmCD1gZceLNSQij5pw88Kq/8MUIcbGVTzmIawG9K+JYPczS4pnEQKVMPwPzj
 7qXMSOIsC2gnjSmAozwY3R/vj+ZQBfy1aIjghbQQ7VhlkSOIJwr4cwZAc
X-Received: by 2002:a05:622a:607:b0:4ec:f123:230a with SMTP id
 d75a77b69052e-4ed310020c8mr119136071cf.13.1762170275409; 
 Mon, 03 Nov 2025 03:44:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGnGpJTNO4VxSLqtGK2GRrVTvl345j+n/5/IOWSW5sFL9hZhQS5EOwv6lu1y5X00EWO5TIXYA==
X-Received: by 2002:a05:622a:607:b0:4ec:f123:230a with SMTP id
 d75a77b69052e-4ed310020c8mr119135761cf.13.1762170274838; 
 Mon, 03 Nov 2025 03:44:34 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6407b34a808sm9435758a12.8.2025.11.03.03.44.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Nov 2025 03:44:34 -0800 (PST)
Message-ID: <ff74fd52-1191-4a0f-8c3f-1dce1830c8ea@oss.qualcomm.com>
Date: Mon, 3 Nov 2025 12:44:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] drm/msm/a6xx: Add support for Adreno 612
To: rob.clark@oss.qualcomm.com
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
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
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACSVV00vwbNtH47S_BVet7uP7u9t4RY=xTBn_r3u4sS91Y7Muw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Emj7Vl_7499Q6NoDNcncMEPBk0wa3_FC
X-Proofpoint-ORIG-GUID: Emj7Vl_7499Q6NoDNcncMEPBk0wa3_FC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDEwNiBTYWx0ZWRfX59OOrGgCAajJ
 b5WC1jDF4AAry2ZbPHG/8HwYEOYa5QF1/RzdL7q9dQ0Y7mvZmDjbNeO/Q2wmhSgXnABCrleoMtb
 n+1pk8i1R9JGDmR2cmx0LRdR75Uj7dKjywCYzIQH5Oi4WRundWIhhHjG4t6CC9mLkDkj0Br4Z06
 W7ytZak9krEZDsoB1K+sh7t6FBPnracLKyTstgbeYA1yng8k5LbiFBhajK2S/HN87vNyz8mQ2cD
 8AYNkYZLR06gXTVVBtOq8nz3tg3wlqEP1Lzvw9OcfvquomqWoJ4lUPWIhqpEl85iFYhoh8vhSaf
 wWrnXgRtfPTnFw11dSIMAFeDBQgUB3cg6VLWyqP1MZNpFf+ntDxoF6TrE+K3DrqUFx2ugTMP64k
 khwEvKRCNisRcX4EbHpKIMD/IvrBKg==
X-Authority-Analysis: v=2.4 cv=WcABqkhX c=1 sm=1 tr=0 ts=690895a4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=Kgau_Mukr_2Uqyo6pRUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_01,2025-11-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511030106
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

On 10/24/25 3:16 PM, Rob Clark wrote:
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

Indeed you're right

Konrad
