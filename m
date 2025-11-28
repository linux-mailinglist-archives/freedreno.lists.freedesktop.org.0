Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B2AC91A10
	for <lists+freedreno@lfdr.de>; Fri, 28 Nov 2025 11:30:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1D9F10E8DE;
	Fri, 28 Nov 2025 10:30:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PZEbDkb+";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OWiOXLct";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72C7710E8E1
 for <freedreno@lists.freedesktop.org>; Fri, 28 Nov 2025 10:30:00 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AS8O5aX3476490
 for <freedreno@lists.freedesktop.org>; Fri, 28 Nov 2025 10:30:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 oXYe6mkEGh2S9MaO3kzaYD413h5MGkk3YZfCvxtE4L4=; b=PZEbDkb+BqjLoTmE
 IbyuGH7VoaiCQvyTQmkFm2FKHTF90Di7/MYUopCAr4Tr/LYRuRClgR+kiafJ7O6+
 zIJwf9VF5vwC8zMMic8OLgG9XYbSqfuc9OVEXxFPj7XM3zvD0Dfsk6rM5PB0HZ/D
 F09gDc/9wIkJ5VVBgkuqS/DnJE/7YpQjOhHzMgJuKW1mZIJdvqLt8+MIE8HX2vjm
 2cFLeuoZx3xg73U62D9Y8mIX2o42NbybzMWlN0dDZN6EsfNB1nWGLtah+keJTAKO
 I7qLApzCDw3wlkk79f8qD6vORwb3q5QHThU0cr36hiKgrRIBNg4ud7RbnnQnwFLR
 bbxynQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aptpua2d9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 28 Nov 2025 10:29:59 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-3437863d0easo2477443a91.0
 for <freedreno@lists.freedesktop.org>; Fri, 28 Nov 2025 02:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764325799; x=1764930599;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oXYe6mkEGh2S9MaO3kzaYD413h5MGkk3YZfCvxtE4L4=;
 b=OWiOXLctiONVdy7U3tIUF52fjuMCjaRQtIAYNjqCRkLaxqvPG2hixPhkpMyB8v0ail
 o8WvO2Y9BisIQnACB38kttsIH/8lD8V3ZzXvidTagD5lV3Qyy2JifLb7s19RlVdNH3Ys
 5T8bpBgGgNCU6V7c+o32JD2SyZmajl0I9AgJn5XPJWT4if7pYy7hBdzuHo511VXaATqJ
 rh4sZtOLwcApc6pVU+eyK2gWTQvR0ojwxuxaCUsFxMevNuOxLsF2iprlTOimZ4u16jl9
 aUg7kVN7G7jVHQ5nhWzwo5Qp83iRk6fXl4d2FzLfAVZ6Ah8jEJcRIVRRmlek0vvUtBin
 cLYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764325799; x=1764930599;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oXYe6mkEGh2S9MaO3kzaYD413h5MGkk3YZfCvxtE4L4=;
 b=eWcak9uWUkiybvplA31//skyADSnZx1jZpaY7CmBJ2cqU5WR55Q2DXIOQStYqZ7msN
 IE38/9NOB6k+TfP+QleB4KNzWSQimaXf12mNEsmU0QsfxDn6cOt7fXAqKgYfQY3L4BHp
 95Jn4gP5j8PIot3W7efJYjXd4k9+CmB0Bh/R/ekrEjz8P9EEXwAwS6wg2diT4UvB05GS
 pJvQ7588cnENoMMc6SZYT4oklBh1qwSG1JelXvee8wB0Z1KFNh2l1x+KEWPnBUmgDb/3
 c4K4Ha7wrUeHJtVAybwhQhyBYKgWCpR5HVNCD+1Nyl63TwXHzKHKu9+UGwTTRwczUn3q
 j/Uw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuP8InHTcoN/VXdAJdje//q3IPKj5j0Uu5bU60SbIcPgWl+9vEOYRxlE9pDGGTPYWwbNU3WvalGts=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzn4wrYCUVQohI9YTCV5j0LcGHulPTIadGIKSCBvU+9GuvHsEDD
 uRGyObDucNMGmx0Z/ZR9Snz5ckgffBbpfFwnMkOLTwEscCTdWQoSgtFivHonzjzP9G1M/cGQFMr
 hS9kfR5aKqwlAVnr45Xh5edKdeFcGRVy3p8wjnO2Rd01zZ4p8akI1F567ujc9GlggXE6C3/k=
X-Gm-Gg: ASbGnctjI799Z/akWLpzaqVBy37mJUmKUD7ee+yEmLILZ4JFWH4yCCklE/rTh7+Cpmm
 OW5V/BpnuiOJU8MaKaVn9OctENEKDEkq+Xx0xaxe+YXFtNzZFhaHZxNgQANEa+iFZec1ozpqoVJ
 t/0TvFjSzXtqamkrPuJB1Iueq6oEE/VR3yuC9dDWxRXjI33YstJq7TZi8aVtdRn3mp2fuSFUCgp
 yOXVtpGwQqaKAl68YuOZS+7ylStTN5ErAfxVi4pfOuyU+cY/TQZlJAphbHg2Nwvu8Jl8oymJoJK
 MpMOVUsn1vqE94w+AfT6ifg7OJf3gAN6M74Lq8sPziBY5L/HLR7U/A3t9jzJOYPqguP1lrBvo+I
 mttMOpMR4BMtyN1ZSyHh1JYuJ6mfPx2o5HK/fWlA81mXCsdq3q0FDfPxBh7kF74upKLswhXA=
X-Received: by 2002:a17:90b:394d:b0:343:e461:9022 with SMTP id
 98e67ed59e1d1-34733f22796mr26448512a91.24.1764325799172; 
 Fri, 28 Nov 2025 02:29:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFnfkDhmgbQ0LMgayTlYteKh7N8FsF3Rt/LG7x/fvdcW32kWh6oGAoVP9/VCmIhe3SG1L3ow==
X-Received: by 2002:a17:90b:394d:b0:343:e461:9022 with SMTP id
 98e67ed59e1d1-34733f22796mr26448490a91.24.1764325798699; 
 Fri, 28 Nov 2025 02:29:58 -0800 (PST)
Received: from ?IPV6:2401:4900:1c27:6704:8849:8c0d:18ec:2263?
 ([2401:4900:1c27:6704:8849:8c0d:18ec:2263])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-347600de37dsm4371267a91.14.2025.11.28.02.29.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Nov 2025 02:29:58 -0800 (PST)
Message-ID: <a6a172bc-9f76-4e12-8925-35319baabb62@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 15:59:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] dt-bindings: display/msm: gpu: Document A612 GPU
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
 devicetree@vger.kernel.org
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-qcs615-spin-2-v3-2-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-savvy-camouflaged-chinchilla-f600ce@kuoka>
 <1207b70e-dcf1-47cf-be26-ff2928932e3e@oss.qualcomm.com>
 <89601075-a312-478e-925d-3cc0b1e9471a@kernel.org>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <89601075-a312-478e-925d-3cc0b1e9471a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: G-zkE_5gfuftxEWcVVpa99Avo76wp72N
X-Proofpoint-ORIG-GUID: G-zkE_5gfuftxEWcVVpa99Avo76wp72N
X-Authority-Analysis: v=2.4 cv=WIZyn3sR c=1 sm=1 tr=0 ts=692979a7 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8vLtEHPTFFeNd2o-lkcA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA3NiBTYWx0ZWRfX60eDr40NSKBh
 jAf1jFBIXhJte9dnNgmMCvfBAwaz1OiVx6I5zPtQCeDYsAEeJomzH8FHQwufMXq2N9uFvJJxXkr
 ecOMLSlbIWAzQnsEsVABg5RJ2Foaz0j274hNBeI1go6vbWS9E/5RjWAJkoC+Y+NJE2CW3Ij47wG
 3jtM4TkD1O8GGhKJV3/gd8wX7v4OXESut+WVI29vvy3Y8Sqd1P2xTx/Jmx0T3D+BV/gZUBpAB+z
 f0xAjkiyelKWFlqAm3G2EYEBA/lhyY9w3s32h2o3jdPjhJ3ej/gtheGcfDc5jLNgX+S8v235Utu
 O4tcBW6nWNufpOkmMdzIkBDOMpdXFtO4MjoTP36c/Kr4Du6EOINVvtf/6vYH/yeG+Y7gPKTHtfg
 /R7n1xYCEFl3kRdBe3D/bWc/LQsHzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 impostorscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280076
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

On 11/25/2025 1:28 PM, Krzysztof Kozlowski wrote:
> On 24/11/2025 22:39, Akhil P Oommen wrote:
>> On 11/22/2025 4:32 PM, Krzysztof Kozlowski wrote:
>>> On Sat, Nov 22, 2025 at 03:22:16AM +0530, Akhil P Oommen wrote:
>>>> +
>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          contains:
>>>> +            const: qcom,adreno-612.0
>>>> +    then:
>>>> +      properties:
>>>> +        clocks:
>>>> +          items:
>>>> +            - description: GPU Core clock
>>>> +
>>>> +        clock-names:
>>>> +          items:
>>>> +            - const: core
>>>> +
>>>> +      required:
>>>> +        - clocks
>>>> +        - clock-names
>>>> +
>>>>      else:
>>>
>>> I am pretty sure you break not only intention/logic behindi this else,
>>> but actually cause real warnings to appear.
>>>
>>> The else was intentional, right? So the pattern further will not match
>>> some of devices defined in if:. Now else is for different part, so only
>>> 612 out of these devices is excluded.
>>>
>>> There is a reason we do not want ever else:if: in bindings. If it
>>> appeared, sure, maybe there is some benefit of it, but it means you need
>>> to be more careful now.
>>
>> Aah! I missed that this comes under an 'allOf'. Not an expert in this
> 
> The allOf does not matter here. If these were separate if:then: then it
> would be the same.
> 
>> syntax, does moving this entire block under an 'else' make sense? Or is
> 
> No, never nest blocks.
> 
>> there a saner alternative?
> 
> Not sure, I don't remember the code. Original code was not easy to read,
> with your changes it will not be easier. So the only alternative I see
> is to make it simple and obvious.

Could you please confirm if the below change would be okay?

@@ -384,6 +384,31 @@ allOf:

  - if:
      properties:
        compatible:
          contains:
            enum:
              - qcom,adreno-610.0
              - qcom,adreno-619.1
              - qcom,adreno-07000200
    then:
      properties:
        clocks:
          minItems: 6
          maxItems: 6

        clock-names:
          items:
            - const: core
              description: GPU Core clock
            - const: iface
              description: GPU Interface clock
            - const: mem_iface
              description: GPU Memory Interface clock
            - const: alt_mem_iface
              description: GPU Alternative Memory Interface clock
            - const: gmu
              description: CX GMU clock
            - const: xo
              description: GPUCC clocksource clock

        reg-names:
          minItems: 1
          items:
             - const: kgsl_3d0_reg_memory
             - const: cx_dbgc

+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,adreno-612.0
+    then:
+      properties:
+        clocks:
+          items:
+            - description: GPU Core clock
+
+        clock-names:
+          items:
+            - const: core
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,adreno-610.0
+              - qcom,adreno-612.0
+              - qcom,adreno-619.1
+              - qcom,adreno-07000200
+    then:
      required:
        - clocks
        - clock-names

    else:
      if:
        properties:
          compatible:
            contains:
              oneOf:
                - pattern: '^qcom,adreno-[67][0-9][0-9]\.[0-9]+$'
                - pattern: '^qcom,adreno-[0-9a-f]{8}$'

      then: # Starting with A6xx, the clocks are usually defined in the
        properties:
          clocks: false
          clock-names: false

          reg-names:
            minItems: 1
            items:
              - const: kgsl_3d0_reg_memory
              - const: cx_mem
              - const: cx_dbgc

-Akhil

> 
> 
> Best regards,
> Krzysztof

