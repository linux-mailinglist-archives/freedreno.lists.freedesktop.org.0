Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C1DC4E976
	for <lists+freedreno@lfdr.de>; Tue, 11 Nov 2025 15:52:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE2A910E314;
	Tue, 11 Nov 2025 14:52:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mywPlpaJ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ItI1s2NN";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E623B10E5E8
 for <freedreno@lists.freedesktop.org>; Tue, 11 Nov 2025 14:52:10 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ABBH4FC2302379
 for <freedreno@lists.freedesktop.org>; Tue, 11 Nov 2025 14:52:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wEL2b4o4woVn7YImhKI7d/0wBJBkLCWFh9YogBdPmPg=; b=mywPlpaJTknD9eFR
 +LZImcREnhWYRLXEfPToGsGwF+OX/lSEIYYFEX4ZCBgozv8mys5+tpoLrHtN23rX
 yuocgRqYDfskfiESTcAvUMwHLu+Da4kMP7BFLAAlG/MBrY8u15v55KkC8IhC2a7U
 1mLFINtr7ag4I+cK0w5BNDaJ5paaPWsk4TaJARMw7lSyJ+wB5SYrtTcovu+tcyWH
 W093cXvUH75aQi+Tg8ZXs5AJMyVg1RW//zs/60RvmiGwXwHRB66sjtN2+Bw2fGFQ
 8ElNYuswumaNSu3zPjiUs70ea43SbokVgT44OrH4EcLqterb2AnMZtI56reQo8So
 wGQIag==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abjxqkjna-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 11 Nov 2025 14:52:09 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-340d3b1baafso7817855a91.3
 for <freedreno@lists.freedesktop.org>; Tue, 11 Nov 2025 06:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762872729; x=1763477529;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wEL2b4o4woVn7YImhKI7d/0wBJBkLCWFh9YogBdPmPg=;
 b=ItI1s2NNIsc7o+XjPtM8miy1hZxkmDOGB2gZvAIuXU90LuwuAmKsqEPaQ+AJxCYaGk
 yIgdPbVmAxCAF8rHbosXMhO426Ylzxu3nnfrsnlc1B6gf1rG6MiZC2s2/sKyOYmkQkSE
 okQ7Iv1nf6AMJtHlOaoJSWjXBPLcCuSYf0Ho2H7HbwhggHHfCb2RYtD4dBxjkupmIapT
 dPMU6det457SORy/gUL6aznGU3d9LpADNHuXK0k0Gijm+3jg1iXnzjee40mVGdzahPjI
 I2AJj4rrT71f5EexvsvctWlG8odr2JVx0Xsa9ma4GpAZmGn4OpY1Sdau7ExG2CMlbCPn
 VHKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762872729; x=1763477529;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wEL2b4o4woVn7YImhKI7d/0wBJBkLCWFh9YogBdPmPg=;
 b=KIC3oSehGEwRmwCDjMpfN26e8YHeCIAQv9nmOOB6pRkXyN+xbBSml494dZ8uqVcpKk
 Qy6xsM3jivviFMDZDBEfVz1o4pU3Ba6sCiACOpQVyA8bm5zlAtgedxM9D9LCCH0RseTw
 66COcj2tl/m0WyAPd6T9HK2K+2xtT2pKmFX/UMdrEcjEaaXFfKAit2HwR5qPgMpkY6e8
 c/rQZNBcrteiAFcuHjet9ZlkXKkK8UjJLmbZX7vgSc2SG5H0hWD8+f5CZ+2U9O3CwL+a
 aNXQOlT7vmPhBIfwMZMjsJ+CkhwlmZji18vtWJcLTN2B/GudAlj8Shk7l2bbKWXU9h4D
 V9+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+bBcaxk3MS/4mpPC9p+uKuBQ10yXZeNPKwcIvw3nf7Np3agoVyXOZ98e+7EXDaGAdiLZOmWZPm/c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJo1Lmo3bNTDz/3NKraMevKCIsCrMHVd+z3xwAV/HTe/3M9Lp9
 8RI1qO823sSxz04h2CwB9YnGDiwWKTwBZCUK1KDSoVXoFwK/y4hWSqDrEmUwyo0XvwikwHqcoqm
 4x2j5qGrPktMWB9gbxFqV+Bs+/xk7AZHKDPp5P9EaFMkAiDuirxwjxp7r82EBiG8Q8kbyVqU=
X-Gm-Gg: ASbGnct45eh3fZ2/Lvr9+z3gjh9sISnCtt57BVTenfIswPQ5HYt5TofFD8hbYuTDlmg
 0Iwfz35+gMimLNDUQLmlWZBC62KHC1e6HRumyxzEq2K/TJ/4eVl5muiQlk0hDapph+B3KeyKOEO
 ZkITjbkgsp8zhORP3NoyW/4YnfUrIRXYVHR2bBKS5gCMtyu+R+8daolU414rIE+PzCUDu75Lth6
 i0W8F5gO+g2dHV9CRe8IC6zViN6oQgVsHnjZOpjA7gPhG5pL+n2+CrT6008jDjAgWwXxDazNEL9
 p5znsjyaOnJH0q4yl4YMHpNUA5+C9/72O8pduIkNWxunQX/7jb7b4mQ7hcFhj9MJyWOK5S2U5Lx
 CnA9h+A9IIYCnckLmg6t4aQ==
X-Received: by 2002:a17:90b:4c8a:b0:340:fb6a:cb4c with SMTP id
 98e67ed59e1d1-3436cd064efmr16227973a91.30.1762872728696; 
 Tue, 11 Nov 2025 06:52:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHPNkW8hxtm48MCmWzwGS5Xaut0loCR++uqJQRZWgnCErEm9erUxXbzVLKElqgpRN181cAIlQ==
X-Received: by 2002:a17:90b:4c8a:b0:340:fb6a:cb4c with SMTP id
 98e67ed59e1d1-3436cd064efmr16227916a91.30.1762872728121; 
 Tue, 11 Nov 2025 06:52:08 -0800 (PST)
Received: from [10.206.103.12] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-343d0173239sm1432594a91.16.2025.11.11.06.52.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Nov 2025 06:52:07 -0800 (PST)
Message-ID: <07221941-4546-4153-b845-594be006e79a@oss.qualcomm.com>
Date: Tue, 11 Nov 2025 20:21:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] dt-bindings: display/msm/rgmu: Document A612 RGMU
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jie Zhang <jie.zhang@oss.qualcomm.com>
References: <20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com>
 <20251107-qcs615-spin-2-v2-3-a2d7c4fbf6e6@oss.qualcomm.com>
 <20251110-persimmon-wombat-of-holiness-6b3f9c@kuoka>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20251110-persimmon-wombat-of-holiness-6b3f9c@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDEyMCBTYWx0ZWRfX37Vn8W7bCdc/
 r/6mz2hTOOB56/F+WQvITm5aEze1Y4JQcHC+JlHqBhQxxK09cyQjPtxTSn+J08zuxbZe29rEaqY
 3zQWU/Yu6Ejmr+3RosfRB+2ihZ19obQ6cM8eHk9ZUxnDW9G2bPwXTllxe+s/UGnfvCrlsYdOdZI
 +ZG3IA7+gaAA1/9egKG87yi9mLpWKYr4PkvTBDjKW/8ve0Xd28LtKcQTyRkRPxQtUBtNcr7tLwR
 71FLTKip8BC1FOypf/5m7x9i0iVHz3vnxUBeUU7PiBcyzf1JG+rLlIo0FI11pg3CpbErU+8SM+F
 YtEDOtFOOYDiPcNihuqc15D14xlIq4e/vCW9T8mEd7a/ibqXFdyeIGQYK/k+SB5gCBPE/FEV4QO
 0PnUwKwI/rW4Nk64iv5M7HVPgwDPlQ==
X-Authority-Analysis: v=2.4 cv=CsKys34D c=1 sm=1 tr=0 ts=69134d99 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=UXIAUNObAAAA:8 a=EUspDBNiAAAA:8
 a=9x9RmpQyoqOX9MKIOEcA:9 a=QEXdDO2ut3YA:10 a=bFq2RbqkfqsA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=sptkURWiP4Gy88Gu7hUp:22 a=a1s67YnXd6TbAZZNj1wK:22
 a=poXaRoVlC6wW9_mwW8W4:22
X-Proofpoint-ORIG-GUID: lkP2Smq8s9mcNSjyqt0CWA_n41kGuOYe
X-Proofpoint-GUID: lkP2Smq8s9mcNSjyqt0CWA_n41kGuOYe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_02,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511110120
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

On 11/10/2025 1:21 PM, Krzysztof Kozlowski wrote:
> On Fri, Nov 07, 2025 at 02:20:08AM +0530, Akhil P Oommen wrote:
>> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
>>
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
>> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  .../devicetree/bindings/display/msm/rgmu.yaml      | 131 +++++++++++++++++++++
>>  MAINTAINERS                                        |   1 +
>>  2 files changed, 132 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/rgmu.yaml b/Documentation/devicetree/bindings/display/msm/rgmu.yaml
>> new file mode 100644
>> index 000000000000..7621556477d0
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/msm/rgmu.yaml
> 
> Filename matching compatible, so qcom,adreno-rgmu.yaml
> 
> 
>> @@ -0,0 +1,131 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +# Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> +%YAML 1.2
>> +---
>> +
>> +$id: http://devicetree.org/schemas/display/msm/rgmu.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: RGMU attached to certain Adreno GPUs
>> +
>> +maintainers:
>> +  - Rob Clark <robin.clark@oss.qualcomm.com>
>> +
>> +description: |
> 
> Do not need '|' unless you need to preserve formatting.
> 
>> +  RGMU (Reduced Graphics Management Unit) IP is present in some GPUs that
>> +  belong to Adreno A6xx family. It is a small state machine that helps to
>> +  toggle the GX GDSC (connected to CX rail) to implement IFPC feature and save
>> +  power.
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - const: qcom,adreno-rgmu-612.0
>> +      - const: qcom,adreno-rgmu
>> +
>> +  reg:
>> +    items:
>> +      - description: Core RGMU registers
>> +
>> +  reg-names:
>> +    items:
>> +      - const: gmu
> 
> Drop reg-names, useless for one entry with same name as the block name.
> 
>> +
>> +  clocks:
>> +    items:
>> +      - description: GMU clock
>> +      - description: GPU CX clock
>> +      - description: GPU AXI clock
>> +      - description: GPU MEMNOC clock
>> +      - description: GPU SMMU vote clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: gmu
>> +      - const: cxo
>> +      - const: axi
>> +      - const: memnoc
>> +      - const: smmu_vote
>> +
>> +  power-domains:
>> +    items:
>> +      - description: CX GDSC power domain
>> +      - description: GX GDSC power domain
>> +
>> +  power-domain-names:
>> +    items:
>> +      - const: cx
>> +      - const: gx
>> +
>> +  interrupts:
>> +    items:
>> +      - description: GMU OOB interrupt
>> +      - description: GMU interrupt
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: oob
>> +      - const: gmu
>> +
>> +  operating-points-v2: true
>> +  opp-table:
>> +    type: object
>> +
>> +required:
> 
> compatible
> 
>> +  - reg
>> +  - reg-names
>> +  - clocks
>> +  - clock-names
>> +  - power-domains
>> +  - power-domain-names
>> +  - interrupts
>> +  - interrupt-names
> 
> Keep the same order as in properties.
> 
>> +  - operating-points-v2
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,qcs615-gpucc.h>
>> +    #include <dt-bindings/clock/qcom,qcs615-gcc.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/power/qcom,rpmhpd.h>
>> +
>> +    rgmu: rgmu@506a000 {
> 
> Drop label.
> 
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> If you cannot find a name matching your device, please check in kernel
> sources for similar cases or you can grow the spec (via pull request to
> DT spec repo).

I guess we can use 'gmu' here as that name is already in use for other
chipsets?

Ack for all other suggestions. Will update the patch.

-Akhil

> 
> Best regards,
> Krzysztof
> 

