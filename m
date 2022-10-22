Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6769608E20
	for <lists+freedreno@lfdr.de>; Sat, 22 Oct 2022 17:42:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E7BB10E0D4;
	Sat, 22 Oct 2022 15:42:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABB2F10E0D4
 for <freedreno@lists.freedesktop.org>; Sat, 22 Oct 2022 15:42:52 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-13aeccf12fbso7106007fac.11
 for <freedreno@lists.freedesktop.org>; Sat, 22 Oct 2022 08:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ODjrPiqkc2NevEsjSmm0YWaYClNrBblCeUYkT3+0Dik=;
 b=CmTSIh1KkQeYMj5Vs2t3cRhCGp+LgmZz/67bweawjb08p541cjT1FqgDebHTsC/Ga+
 t1Viw9HjIToJMSAwb5fo3h+vqP9SRjiHn7MYQuq5Zrq1yXUECeXnz8KHmZ8BB4JQnqGr
 9FjWSmVDtLmnRWEofEg+v/TR5SP3BlV6TDsbPpRz+llrgsyI2kbxvloIYwtZ+POJ8TkG
 RAiywPcrmgIXfrhiSpazoq0l7PDFETZ7b0Cx1IgR/BjL+SHnBt65r2bolBMkQksEH4PN
 ouIfqCY8669wwA2wx0kkgrtoaRP/tBcrP12CAglJUvGVyM+0mTxdueliqLxFjBXtcIgs
 agyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ODjrPiqkc2NevEsjSmm0YWaYClNrBblCeUYkT3+0Dik=;
 b=NM5d5i51z8NNysCx2fKk+kVcbedY6ZSVk4Z/wJ4qEj6cwbJIv+nQsE+mrDrfNPaB+O
 ed/ewd19an98fi45V3RBPTjAvv/LunJn9wUbmlVprELM7phqIE4soW3cDe+pkE9EcFOE
 Kr558DeyEZ/yNCAKv4yUZiDliwUtUwpNH3zWcARo0Gr2zAqdxcQSYeRbg6AOVDLI7/CO
 nwmBk2MZI64poWjYMYRdiQOl9SivdzeRwe/U4u8AyAFu2xQ4/WbwQQIOPTI0RF8LMXfZ
 Nmaksoczwl2Q2MQlW7yqNrylW5glHQBc+RSMCMpesono0EDJ7AWkLM7A6LQwvD/3eN5z
 zLzA==
X-Gm-Message-State: ACrzQf0CXnVn5RIgaw6h8odrTYOLkmQ9QwlgOq8D3lsfx8EjH/54iRdh
 PiI6qYGUUmKlqS403+qgGLYbYw==
X-Google-Smtp-Source: AMsMyM7IssC7AwXaNPbBMPy2YiZrWgkm3vbVzBHOsug9EmiifFNdhlM2LdpVhAK/3Bp31GT5B9EavA==
X-Received: by 2002:a05:6870:338a:b0:13b:6032:ea71 with SMTP id
 w10-20020a056870338a00b0013b6032ea71mr1864204oae.291.1666453371838; 
 Sat, 22 Oct 2022 08:42:51 -0700 (PDT)
Received: from [10.203.8.70] ([205.153.95.177])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a0568301d6900b00661b9421daesm2327121oti.69.2022.10.22.08.42.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Oct 2022 08:42:51 -0700 (PDT)
Message-ID: <c86e5263-50b3-cdff-0bc5-2c2a578d5ada@linaro.org>
Date: Sat, 22 Oct 2022 11:42:46 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark <robdclark@gmail.com>
References: <20221021165534.2334329-1-dmitry.baryshkov@linaro.org>
 <20221021165534.2334329-2-dmitry.baryshkov@linaro.org>
 <a36ca97e-5e64-54a8-a571-e9b7f6da76e5@linaro.org>
 <48e13203-2588-618b-4fde-3004b2472783@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <48e13203-2588-618b-4fde-3004b2472783@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [RFC PATCH 1/9] dt-bindings: arm-smmu: Add missing
 Qualcomm SMMU compatibles
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
Cc: devicetree@vger.kernel.org, Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
 linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
 Vinod Koul <vkoul@kernel.org>, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 22/10/2022 05:17, Dmitry Baryshkov wrote:
> On 22/10/2022 03:59, Krzysztof Kozlowski wrote:
>> On 21/10/2022 12:55, Dmitry Baryshkov wrote:
>>> Add missing compatibles used for Adreno SMMU on sc7280 and sm8450
>>> platforms and for the Qualcomm v2 SMMU used on SDM630 platform.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 11 +++++++++++
>>>   1 file changed, 11 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>>> index 9066e6df1ba1..34ee33a62ba5 100644
>>> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>>> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>>> @@ -28,6 +28,7 @@ properties:
>>>             - enum:
>>>                 - qcom,msm8996-smmu-v2
>>>                 - qcom,msm8998-smmu-v2
>>> +              - qcom,sdm630-smmu-v2
>>
>> So qcom,adreno-smmu is not compatible with Adreno? See below.
>>
>>>             - const: qcom,smmu-v2
>>>   
>>>         - description: Qcom SoCs implementing "arm,mmu-500"
>>> @@ -48,10 +49,20 @@ properties:
>>>                 - qcom,sm8350-smmu-500
>>>                 - qcom,sm8450-smmu-500
>>>             - const: arm,mmu-500
>>> +
>>> +      - description: Qcom Adreno GPUs implementing "arm,smmu-500"
>>> +        items:
>>> +          - enum:
>>> +              - qcom,sc7280-smmu-500
>>> +              - qcom,sm8250-smmu-500
>>> +          - const: qcom,adreno-smmu
>>> +          - const: arm,mmu-500
>>>         - description: Qcom Adreno GPUs implementing "arm,smmu-v2"
>>>           items:
>>>             - enum:
>>> +              - qcom,msm8996-smmu-v2
>>>                 - qcom,sc7180-smmu-v2
>>> +              - qcom,sdm630-smmu-v2
>>
>> This does not look correct. The same compatible should not be present in
>> two different setups.
>>
>> If qcom,msm8996-smmu-v2 is compatible with qcom,adreno-smmu, then your
>> first hunk is not correct.
> 
> Currently the qcom,adreno-smmu compat string is used as a flag, telling 
> the kernel that this SMMU instance needs some special setup to work with 
> Adreno GPU driver

Indeed, I see the usage in DTS,

> 
> For example, we have the following compat lists in the existing DT files:
> - "qcom,msm8996-smmu-v2", "qcom,adreno-smmu", "qcom,smmu-v2"
> - "qcom,msm8996-smmu-v2", "qcom,smmu-v2" // not handled by arm-qcom-smmu
> 
> - "qcom,sdm630-smmu-v2", "qcom,adreno-smmu", "qcom,smmu-v2"
> - "qcom,sdm630-smmu-v2", "qcom,smmu-v2"
> 
> - "qcom,sdm845-smmu-v2", "qcom,adreno-smmu", "qcom,smmu-v2"
> - "qcom,sdm845-smmu-500", "arm,mmu-500"
> - "qcom,sdm845-smmu-v2", "qcom,smmu-v2" // special setup used on Cheza
> 
> - "qcom,sm8250-smmu-500", "qcom,adreno-smmu", "arm,mmu-500"
> - "qcom,sm8250-smmu-500", "arm,mmu-500"
> 
> 
> As we are trying to refactor the IOMMU bindings, what would be your 
> recommendation?
> 
> To introduce minimal changes, I wanted to have the following lists:
> - "qcom,SOC-smmu-500", "qcom,adreno-smmu", "qcom,smmu-500", "arm,mmu-500"
> 
> - "qcom,SOC-smmu-500", "qcom,smmu-500", "arm,mmu-500"
> 
> However maybe you would prefer the following model:
> 
> - "qcom,SOC-adreno-smmu-500", "qcom,adreno-smmu-500", "arm,mmu-500"
> - "qcom,SOC-smmu-500", "qcom,smmu-500", "arm,mmu-500"

If we started from scratch, I would prefer this one, however as DTSes
are already using your previous method, It's fine.

It's a bit confusing to have most specific compatible followed by
different fallbacks, but we already have few cases for this (e.g.
Renesas boards), so I guess it is fine here as well. At the end entire
compatible list uniquely describes the hardware.

> 
> 
> Or:
> - "qcom,SOC-smmu-500", "qcom,smmu-500", "arm,mmu-500" + 
> 'qcom,adreno-smmu' flag/property?
> 
> 
>>
>>>                 - qcom,sdm845-smmu-v2
>>>             - const: qcom,adreno-smmu
>>>             - const: qcom,smmu-v2
>>
>> Best regards,
>> Krzysztof
>>
> 

Best regards,
Krzysztof

