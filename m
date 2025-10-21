Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F33BF71C5
	for <lists+freedreno@lfdr.de>; Tue, 21 Oct 2025 16:39:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E847F10E606;
	Tue, 21 Oct 2025 14:39:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jJVCQzYw";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E451810E609
 for <freedreno@lists.freedesktop.org>; Tue, 21 Oct 2025 14:39:19 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59LEWdKS029400
 for <freedreno@lists.freedesktop.org>; Tue, 21 Oct 2025 14:39:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 IYiRng46K/9s0YcunKwJaYrPPhduE6KoJmzcZ76VteI=; b=jJVCQzYwQGZ2K844
 iAMShQ/NzcPzQWK1iWtjhpn/v8B2BxbqzdaI46BQX8nO7+3oEImpKmQlHDN+L9pP
 zBO9E4kNaRdmEmslpv7FgUeMV9VL80gOUUwQ824W6+CRiypYnxvgzVH4brIWsOpv
 FihxEnberXZaEh9Nn8P+LxuLFpBHaeMnq0nz6dI74qjUcxP5AnFlNZMCl/MmPAdb
 QokuSTC/9XbSJFBGgd87imZFRQi3BWy6lxtgc3FNOedJEfzSUl3MU8yRrvmHIPUG
 +zKgY05LUKcdGB1T0+ZSXLaN36XB6D91LG5LcNWiMhCL/WhuffI4Qj3oSbj2vwO9
 mYDJBA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49wswnuf1v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 21 Oct 2025 14:39:19 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-28bd8b3fa67so54925755ad.2
 for <freedreno@lists.freedesktop.org>; Tue, 21 Oct 2025 07:39:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761057558; x=1761662358;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IYiRng46K/9s0YcunKwJaYrPPhduE6KoJmzcZ76VteI=;
 b=ukBdyIMHs+ffAGhoJqJuR6rKdxPGh71WpGYAUOxFZ08wiNZSSjHOZItC6yjkJQJvFz
 KuVpvxjwHlVqEXfEIhgK99qtAx6GYCep5cZw+jJlUfictT7Zrp4cW5V0Z9pyAe3tQ8z7
 hXikTGgMkyqxYI0z0QH+JIGCKZd6AFTjEnMYDTt0r2nyVkJLjSyEAhkoA6uF21yvpe/Z
 DI/X1egE/A25dME7ZyY1yheQXaBCxGHZHeXUKT9TAldweK/JQ4ISRsjS5Sg4hPdsXnz6
 IxH8srqGhXT1CeVnhQ9B5uHKFVl0KPJ3KOXabEWYC5FvZryXDgi6lG9vXOTyU1YZys8s
 YBfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJ1I0NaeOkb2nIMiL7MP5Hda+BSLuo9eHnhsQYKoAt1P5LgsENZoYKG+8c2XQ8QBdIR49ohIUXuDo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwBcuOE8Z8fw2l8yFXR3dEQHx3esSEPdN2Jq4qb+G2ErTiwbdhA
 bnP6+0iZVzAd1tAaOo4CxrGaHQim+R7s3GxI4pfYdXNBGB8W183TsOwRYtXg2LDi98V/QDI78I2
 64ZHg+XQHHMw7nlpW/xqV+hCrhwPeSBo9/hSE6nwIRDienwHvzlavPh4kuTUCF4nQykpn3We4ln
 PK8nY=
X-Gm-Gg: ASbGnct9kpIIOXgkv9oIk1+AGLBZGfkQeiEif7Hgxw76AmHppg3+ru93KcfHY8jl+NO
 jTyFrRQzTm89tnmG1/pH+pTxb9v8g25+qvKUMig1iXAtDJYZ/H+HSRnYsmsb6vue+ZtoNvk2IZq
 uKF+YCQVHhzo5QTa5xnGOT9LgAOMAgdNn85RyC4KU0SbOsCO6+a6dOk3nYS37q5zCdTQ9LG6vN1
 KTM6um+ZxULyYxYrFCutXFsHs0hBkUxED2pZSZThVI8rioTo0Ol6IJ1wqadB9ybK6TDJhX2Rdwk
 4GNVTOIykk1ziJdgYlO5U9QSiW2+L1WVQWgb6MTd3EtIqYHTp4CAZaPhzEh1CQV7O6S/2asCeEV
 45kql1V4/ryy81BlsSG4I0A==
X-Received: by 2002:a17:902:e88e:b0:267:cdb8:c683 with SMTP id
 d9443c01a7336-290c9cf1785mr209130735ad.27.1761057558265; 
 Tue, 21 Oct 2025 07:39:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7Xu3yqvqq7tM2Hj4ax162jdVvcEgPtgB391HBWPwgMC3PxAc2yK/s89219b9zTLDa4YQfTA==
X-Received: by 2002:a17:902:e88e:b0:267:cdb8:c683 with SMTP id
 d9443c01a7336-290c9cf1785mr209130335ad.27.1761057557695; 
 Tue, 21 Oct 2025 07:39:17 -0700 (PDT)
Received: from [10.204.104.20] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29246ebcdefsm111879115ad.16.2025.10.21.07.39.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Oct 2025 07:39:17 -0700 (PDT)
Message-ID: <769b0fb2-75b3-45ef-b798-02ae5982b736@oss.qualcomm.com>
Date: Tue, 21 Oct 2025 20:09:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] dt-bindings: display/msm: gpu: Document A612 GPU
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
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
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com>
 <20251017-qcs615-spin-2-v1-2-0baa44f80905@oss.qualcomm.com>
 <811c728c-e2c9-462d-9c7a-dd79a683e301@kernel.org>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <811c728c-e2c9-462d-9c7a-dd79a683e301@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vaM6FUGciyV7F6s80urVALOr2x15YFQJ
X-Authority-Analysis: v=2.4 cv=Maxhep/f c=1 sm=1 tr=0 ts=68f79b17 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=PLUc99ambSscJNFV4OcA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: vaM6FUGciyV7F6s80urVALOr2x15YFQJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDE0OCBTYWx0ZWRfX8hQcUavAWqvg
 nqx38mgCibTeiScyrN1S1FWmZHBDMPs3uyDEZ6h9ot8+qA9nH87/7kRVMA/AvA8E13ItFw9f+Kc
 O0hMyYA7UJM+PjWB2R2Mc1MNpR/LcKM2m4Bu7dYCMiXilS+N3Va6Im/ETWQ/iut38H6mP/lElRh
 g1jTybYNIzXF28cI82TUM6cuJrPVy4SNPL6qoYLzYjX+tgSftd4G9l8MDmcRItgYCnFHZCtZWj4
 dgsbUmwRw7ksttK4Tb2vFdtHtuPPKmk6hJYlqhUy2aQl484qD6Dcar1M1OgUjsg/G/39ZOVVyQu
 eXO15h7BFZSo9hS9I9sFNvdhWXqW08ieHtzSNaEOGGtP3lEVKDJljRgj/7bTVlEaJklkCCA7ezZ
 jrjj6LGM0F9RKPEqqpn1HvVcZ4GLlQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-21_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510200148
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

On 10/19/2025 2:40 PM, Krzysztof Kozlowski wrote:
> On 17/10/2025 19:08, Akhil P Oommen wrote:
>> A612 GPU has a new IP called RGMU (Reduced Graphics Management Unit)
>> which replaces GMU. But it doesn't do clock or voltage scaling. So we
>> need the gpu core clock in the GPU node along with the power domain to
>> do clock and voltage scaling from the kernel. Update the bindings to
>> describe this GPU.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  .../devicetree/bindings/display/msm/gpu.yaml       | 31 ++++++++++++++++++++--
>>  1 file changed, 29 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
>> index 3696b083e353031a496a1f299d8f373270ca562d..efc529e82bc198e7c3c89a5eecb6f929960a8de9 100644
>> --- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
>> @@ -45,11 +45,11 @@ properties:
>>            - const: amd,imageon
>>  
>>    clocks:
>> -    minItems: 2
>> +    minItems: 1
>>      maxItems: 7
>>  
>>    clock-names:
>> -    minItems: 2
>> +    minItems: 1
>>      maxItems: 7
>>  
>>    reg:
>> @@ -388,6 +388,33 @@ allOf:
>>        required:
>>          - clocks
>>          - clock-names
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,adreno-612.0
>> +    then:
>> +      properties:
>> +        clocks:
>> +          minItems: 1
> 
> Drop, it's implied.
> 
> 
>> +          maxItems: 1
>> +
>> +        clock-names:
>> +          items:
>> +            - const: core
>> +              description: GPU Core clock
>> +
> 
> Missing constraint for 'reg'.

I suppose we should add reg property with a list of (items:) reg
descriptions. No need for 'min/minxItems constraints as it is not flexible.

> 
>> +        reg-names:
>> +          minItems: 1
> 
> Drop. MMIO range is not flexible.

Ack.

-Akhil

> 
>> +          items:
>> +            - const: kgsl_3d0_reg_memory
>> +            - const: cx_dbgc
>> +
> Best regards,
> Krzysztof

