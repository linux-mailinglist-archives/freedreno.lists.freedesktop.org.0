Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF07ABF77F8
	for <lists+freedreno@lfdr.de>; Tue, 21 Oct 2025 17:51:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 129C010E2ED;
	Tue, 21 Oct 2025 15:51:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="e/F25Tl+";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09F1710E06D
 for <freedreno@lists.freedesktop.org>; Tue, 21 Oct 2025 15:51:47 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59LEYuBF029412
 for <freedreno@lists.freedesktop.org>; Tue, 21 Oct 2025 15:51:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QA+SGH9BRJ0ma1obWpO6OlmiAFE4VJLnzS8FLoARyTE=; b=e/F25Tl+h8sWHYgN
 qvrc5p3XKsRTka3smGrVa7k1Z424Gz+NAR3Uu2VZ39/0qVMtqp/smSTvk3v1rhdG
 BaHNf/VBKEVRfqcc5Lls4EIvBkfyPPbjHunncXpK7CXHVMTteGpv3TB87SJHOSVK
 kBuVupPida5ih416imHw7K8x5mrXzusNjGUFCn4ZNAf2oqkceWxyzTq5SkSL+owf
 48xHeMBmw2EN/NCIiJrncG3DsMXURpN28ewI/rXyEFeclrzA4mJlNaCwa8znshCj
 S38wQpcn03Yk//QCuHvf9YhqrB+1P1A7zPwLHy9i4o3CA6UfgT8xP8bq3zRolFvS
 ZbseKg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49wswnupm9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 21 Oct 2025 15:51:46 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b522037281bso3658297a12.3
 for <freedreno@lists.freedesktop.org>; Tue, 21 Oct 2025 08:51:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761061906; x=1761666706;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QA+SGH9BRJ0ma1obWpO6OlmiAFE4VJLnzS8FLoARyTE=;
 b=lEdAduPPkSNUIrNYp/umMruWZniJ5/afMXijbBhHU+WvM4H5vZ1pZMlhhiMigbpdT+
 clM228BcfRJ2+0Cd5N620lDIcCSFfb4YvejvTun5tDS54yi6vyDfCcuwE+R7VQDr+7nV
 5beUf+/hln25PhoT9M9HJV5MwWR7y7G5Wi3ZYFsKAH08di/ZpEqzVl8QH6hJSouZrQb0
 JfN5r8i1Jygk9RzselbZ62WqDyLkfZLERO/tmQfZ/mYJF7c+Trfs7M5mqv6ffXH/P9jN
 nzD3rMS87rlznOGTjZ7/TZTIhbwafirw720B9SGR0Xv716kdl9rVyycoRZ5of1ZY2IH0
 8LKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoJ+jvmP7E4VlgFMSvrcIKqMQRLalhrcVuomr+h+Q7zY7diXe5SLIpRAn0UnGdd3aF+nvn9NDkQUo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz6Wvjr/x2ethv/8+sGJGrh0QXZQ0JskMNMfm8vOcPW9B3HKH9W
 4iJvbAggJevXEVPg7Qtk55fAre2MZiRaRKklHyY162toqrlmyQUYMK3gaxpaKyyt1k8T4DNg/y6
 iXfBaA+Lyre3MkaDrpJ67+CP5vAntFn3vFmzaprOr0Uq7m2OWsxwRivDCC6G4R5bgDHz0lBE=
X-Gm-Gg: ASbGncuI8wtx8MQjPzbncI58NP8YG+LPf7OSLcLObApZDXbICMZ2Uhvm52wwokkxESA
 +XtBcev/6pCFi/suIX3mWMWB0zgxzFSibv1mNzgY5zkr+WoOdeyeQmcJ2kxAfJlezP98pMEK3tC
 nkuf7Hc0uxjP4YaRBGQPuDgXjTKaBkBBLLgdfnB/Zd660TDFbrzgv8g9ZdBGjZEgFVOixaJcjhn
 aOSm8QIWX7eOm8Gd9Ggt6JqkhjiM0k3/sLipOq5e/0C2q03U0PjX0EhcqR5Ycgrpr159oudQz7J
 sdiKTamNZmfcDBRzLTl35z95FilZtVkbDS17t29MHnfErI0vJCbbr3i/0lzV7tTOzLGyFjKTy5y
 7O73dQN1+sfmeD0zstn5mhg==
X-Received: by 2002:a05:6a21:99a0:b0:32d:b925:276b with SMTP id
 adf61e73a8af0-334a8523dc3mr22535840637.4.1761061905409; 
 Tue, 21 Oct 2025 08:51:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHpQcvweF2xt590lxQ0r+ZD4/+/QPgjpSYlH4eFm6Hkm1wvNrCcND/jZo/4fo2HgPZ9UZ6iw==
X-Received: by 2002:a05:6a21:99a0:b0:32d:b925:276b with SMTP id
 adf61e73a8af0-334a8523dc3mr22535788637.4.1761061904855; 
 Tue, 21 Oct 2025 08:51:44 -0700 (PDT)
Received: from [10.204.104.20] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a2301211besm11597489b3a.68.2025.10.21.08.51.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Oct 2025 08:51:44 -0700 (PDT)
Message-ID: <181af756-09a1-4694-98c4-53cea556e172@oss.qualcomm.com>
Date: Tue, 21 Oct 2025 21:21:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] dt-bindings: display/msm/gmu: Document A612 RGMU
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Clark <robin.clark@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
References: <20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com>
 <20251017-qcs615-spin-2-v1-3-0baa44f80905@oss.qualcomm.com>
 <8f3f4874-2e82-473e-87bd-e3bd58089b90@kernel.org>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <8f3f4874-2e82-473e-87bd-e3bd58089b90@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KLMpNF3ZTvmoOz56S4A20LwECJc4rQrn
X-Authority-Analysis: v=2.4 cv=Maxhep/f c=1 sm=1 tr=0 ts=68f7ac12 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=0jTnGb_4dxt76ar0_UAA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: KLMpNF3ZTvmoOz56S4A20LwECJc4rQrn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDE0OCBTYWx0ZWRfX+RFhPzwLylOb
 vqmhXIPKvjOsaNT3FQVzHrnsPRzpus0y99q7Ju0Dc5ZQIdIxf6G0hIxdEHdAHqx8JQ+M/ZdTVeK
 xsHjxytr9rhK1WuBfT36Dh5yf1s6u9X+Z1efXYtCk01gUGLxJjIVsUUzoV6rxVnbY90okkRRlKQ
 +aQx45PvzO8OE4pn5TlyMXq3w3ItQi1FrL2c0HLkMdEBqbXVeri8IqzJS4R5sdPBhxuEIAOPePg
 7tZoHajmJkl+jAzrfUCJMwy2ojPfd0xyiYSA98isI6S/1R3lqB5YX+zdD2xZFi4A74f1SviRhQO
 DUr5PghjhuKmalgxeNvPMQbQJT77a6I2L5z0vPlheZ3jAHzamM80hFy69A8p2dwfhSCPu/D/586
 y9Fz7sm2fcB6FkzSdx4HY7XlmiGx7A==
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

On 10/19/2025 2:43 PM, Krzysztof Kozlowski wrote:
> On 17/10/2025 19:08, Akhil P Oommen wrote:
>> RGMU a.k.a Reduced Graphics Management Unit is a small state machine
>> with the sole purpose of providing IFPC (Inter Frame Power Collapse)
>> support. Compared to GMU, it doesn't manage GPU clock, voltage
>> scaling, bw voting or any other functionalities. All it does is detect
>> an idle GPU and toggle the GDSC switch. As it doesn't access DDR space,
>> it doesn't require iommu.
>>
>> So far, only Adreno 612 GPU has an RGMU core. Document RGMU in the GMU's
>> schema.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  .../devicetree/bindings/display/msm/gmu.yaml       | 98 +++++++++++++++++-----
>>  1 file changed, 79 insertions(+), 19 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
>> index afc1879357440c137cadeb2d9a74ae8459570a25..a262d41755f09f21f607bf7a1fd567f386595f39 100644
>> --- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
>> @@ -26,6 +26,9 @@ properties:
>>        - items:
>>            - pattern: '^qcom,adreno-gmu-x[1-9][0-9][0-9]\.[0-9]$'
>>            - const: qcom,adreno-gmu
>> +      - items:
>> +          - const: qcom,adreno-rgmu-612.0
>> +          - const: qcom,adreno-rgmu
>>        - const: qcom,adreno-gmu-wrapper
>>  
>>    reg:
>> @@ -45,24 +48,30 @@ properties:
>>      maxItems: 7
>>  
>>    interrupts:
>> -    items:
>> -      - description: GMU HFI interrupt
>> -      - description: GMU interrupt
> 
> 
> Both stay, just explain what is the first interrupt. You should not drop
> descriptions here. Look at every other binding - of course except that
> terrible Adreno GPU which is anti-example.

Do you mean we should use a OneOf and list both combo? Or elaborate the
description of the first interrupt to include OOB too? Something like:

- description: HFI interrupt on GMU and OOB interrupt on RGMU.

Sorry, I am a bit confused.

> 
>> +    minItems: 2
>> +    maxItems: 2
>>  
>>    interrupt-names:
>> -    items:
>> -      - const: hfi
>> -      - const: gmu
>> +    oneOf:
>> +      - items:
>> +          - const: hfi
>> +            description: GMU HFI interrupt
> 
> No, descriptions never go to xxx-names, but to xxx.
> 
>> +          - const: gmu
>> +            description: GMU interrupt
>> +      - items:
>> +          - const: oob
>> +            description: GMU OOB interrupt
>> +          - const: gmu
>> +            description: GMU interrupt
>> +
>>  
>>    power-domains:
>> -    items:
>> -      - description: CX power domain
>> -      - description: GX power domain
>> +    minItems: 2
>> +    maxItems: 3
> 
> No.
I will keep the 'description'. Here, RGMU has 3 power domains instead of
2. I suppose we should add the description for the 3rd power domain here
and keep 'minItems: 2' property to override the default 3?

> 
>>  
>>    power-domain-names:
>> -    items:
>> -      - const: cx
>> -      - const: gx
>> +    minItems: 2
>> +    maxItems: 3
> 
> 
> No. Why?
Same as above.

> 
>>  
>>    iommus:
>>      maxItems: 1
>> @@ -86,6 +95,44 @@ required:
>>  additionalProperties: false
>>  
>>  allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,adreno-rgmu-612.0
>> +    then:
>> +      properties:
>> +        reg:
>> +          items:
>> +            - description: Core RGMU registers
>> +        reg-names:
>> +          items:
>> +            - const: gmu
>> +        clocks:
>> +          items:
>> +            - description: GMU clock
>> +            - description: GPU CX clock
>> +            - description: GPU AXI clock
>> +            - description: GPU MEMNOC clock
>> +            - description: GPU SMMU vote clock
>> +        clock-names:
>> +          items:
>> +            - const: gmu
>> +            - const: cxo
>> +            - const: axi
>> +            - const: memnoc
>> +            - const: smmu_vote
>> +        power-domains:
>> +          items:
>> +            - description: CX power domain
>> +            - description: GX power domain
>> +            - description: VDD_CX power domain
>> +        power-domain-names:
>> +          items:
>> +            - const: cx
>> +            - const: gx
>> +            - const: vdd_cx
> 
> This does not make even sense. Why did you remove the the common list
> from  power-domain-names?
> 
>> +
>>    - if:
>>        properties:
>>          compatible:
>> @@ -313,13 +360,26 @@ allOf:
>>            items:
>>              - const: gmu
>>      else:
>> -      required:
>> -        - clocks
>> -        - clock-names
>> -        - interrupts
>> -        - interrupt-names
>> -        - iommus
>> -        - operating-points-v2
>> +      if:
>> +        properties:
>> +          compatible:
>> +            contains:
>> +              const: qcom,adreno-rgmu
>> +      then:
>> +        required:
>> +          - clocks
>> +          - clock-names
>> +          - interrupts
>> +          - interrupt-names
>> +          - operating-points-v2
>> +      else:
> 
> No. Don't nest multiple ifs.

I guess we should split this. I will add a 'required' constraint to the
rgmu constraints above. And apply the below 'required' constraint
specifically to 'qcom,adreno-gmu' instead of the 'else' fallback case.

Please let me know if you have any suggestion.

-Akhil>
>> +        required:
>> +          - clocks
>> +          - clock-names
>> +          - interrupts
>> +          - interrupt-names
>> +          - iommus
>> +          - operating-points-v2
>>  
>>  examples:
>>    - |
>>
> 
> 
> Best regards,
> Krzysztof

