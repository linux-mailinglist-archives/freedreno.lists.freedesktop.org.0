Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA975608AF7
	for <lists+freedreno@lfdr.de>; Sat, 22 Oct 2022 11:17:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFACD10E14F;
	Sat, 22 Oct 2022 09:17:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32F7010E14F
 for <freedreno@lists.freedesktop.org>; Sat, 22 Oct 2022 09:17:37 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id r22so6677360ljn.10
 for <freedreno@lists.freedesktop.org>; Sat, 22 Oct 2022 02:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KV5T4Ds36Pn5JJ9LvcyOc5p1G5ob4lljxOKtNSKGmMI=;
 b=SmS4Dp2bjzHIDfgevSzTDT8N9t7g25MnT2uUBAQ9QLZiE7y7RAxBRrrD+QrDp/8OcE
 1qLojZGCYk1TmHD47+QZ5QRxKUVFsiFhryvAiY0PLrcWWZ7b3S9CvUD66igkBINAElc8
 XE8g10/JjAnoDJ8pvM2eWg8yPQ6rE35JA5K2GE46lb7Hn6aome44rrwg6ZVf3A6F01on
 DYIzONRkjyTmEmo3rWTUnItfFRilXcz0ZEJvIxDfJyIGnP68pxNEa/0Hv27AkZpCZH1z
 BF2AIxyfuC+3pMTC6vIDAzBpP+Fp7ZZVVe7VkEonK4Z5vM4wACjQljpaWU3Ig+FbsKui
 3nMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KV5T4Ds36Pn5JJ9LvcyOc5p1G5ob4lljxOKtNSKGmMI=;
 b=H9ojULHO95pbUvrVHjTMWJJRq0Q/bCGlFTDa6QCyt6R0HdfRqGQuizHRMbRCCIbgN3
 XCduahhhPJZuYT4Vpf6pRgfkqscdf9i0s9ed2ov+1IYKjistnd8c54RjA+ivVfhwJF4Y
 NFvb64spXvn4rNSvULCcEgZ3Eisg++OuB0h/rGRaqbuIfvkW6x9GMFJu09m5Ia2R/CR5
 2/solRFLtqepe1U4tf3Ol/SexNl261L986ib8wV3rE1T5PDuWHvlvLqvLYT0ggMuDBFW
 /hEyj7+LYfqrJD3phitHjE6BG3HnVkr6QQZQTwPutzTdZ8goZPOU/Z3WbiCP2hRr04nx
 OCvA==
X-Gm-Message-State: ACrzQf1XsIEfmb75eUH+zDUQ4hq3BTHT/lBKf7i4YM2gb+NQJijYRuF2
 M/2HaYjhLsfCV+MQ08TT7yPpOQ==
X-Google-Smtp-Source: AMsMyM6gqIWCG3vTlrW4YgHYo9wuugLZiy0KoowKh2MbcU1t+un3BouhWEM72DvnvW3vQf9yB/0rtA==
X-Received: by 2002:a05:651c:883:b0:26d:d4ce:befa with SMTP id
 d3-20020a05651c088300b0026dd4cebefamr8091211ljq.180.1666430256014; 
 Sat, 22 Oct 2022 02:17:36 -0700 (PDT)
Received: from [10.27.10.248] ([195.165.23.90])
 by smtp.gmail.com with ESMTPSA id
 f28-20020a05651c03dc00b0026dced9840dsm3669537ljp.61.2022.10.22.02.17.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Oct 2022 02:17:35 -0700 (PDT)
Message-ID: <48e13203-2588-618b-4fde-3004b2472783@linaro.org>
Date: Sat, 22 Oct 2022 12:17:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Content-Language: en-GB
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark <robdclark@gmail.com>
References: <20221021165534.2334329-1-dmitry.baryshkov@linaro.org>
 <20221021165534.2334329-2-dmitry.baryshkov@linaro.org>
 <a36ca97e-5e64-54a8-a571-e9b7f6da76e5@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <a36ca97e-5e64-54a8-a571-e9b7f6da76e5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 22/10/2022 03:59, Krzysztof Kozlowski wrote:
> On 21/10/2022 12:55, Dmitry Baryshkov wrote:
>> Add missing compatibles used for Adreno SMMU on sc7280 and sm8450
>> platforms and for the Qualcomm v2 SMMU used on SDM630 platform.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> index 9066e6df1ba1..34ee33a62ba5 100644
>> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> @@ -28,6 +28,7 @@ properties:
>>             - enum:
>>                 - qcom,msm8996-smmu-v2
>>                 - qcom,msm8998-smmu-v2
>> +              - qcom,sdm630-smmu-v2
> 
> So qcom,adreno-smmu is not compatible with Adreno? See below.
> 
>>             - const: qcom,smmu-v2
>>   
>>         - description: Qcom SoCs implementing "arm,mmu-500"
>> @@ -48,10 +49,20 @@ properties:
>>                 - qcom,sm8350-smmu-500
>>                 - qcom,sm8450-smmu-500
>>             - const: arm,mmu-500
>> +
>> +      - description: Qcom Adreno GPUs implementing "arm,smmu-500"
>> +        items:
>> +          - enum:
>> +              - qcom,sc7280-smmu-500
>> +              - qcom,sm8250-smmu-500
>> +          - const: qcom,adreno-smmu
>> +          - const: arm,mmu-500
>>         - description: Qcom Adreno GPUs implementing "arm,smmu-v2"
>>           items:
>>             - enum:
>> +              - qcom,msm8996-smmu-v2
>>                 - qcom,sc7180-smmu-v2
>> +              - qcom,sdm630-smmu-v2
> 
> This does not look correct. The same compatible should not be present in
> two different setups.
> 
> If qcom,msm8996-smmu-v2 is compatible with qcom,adreno-smmu, then your
> first hunk is not correct.

Currently the qcom,adreno-smmu compat string is used as a flag, telling 
the kernel that this SMMU instance needs some special setup to work with 
Adreno GPU driver

For example, we have the following compat lists in the existing DT files:
- "qcom,msm8996-smmu-v2", "qcom,adreno-smmu", "qcom,smmu-v2"
- "qcom,msm8996-smmu-v2", "qcom,smmu-v2" // not handled by arm-qcom-smmu

- "qcom,sdm630-smmu-v2", "qcom,adreno-smmu", "qcom,smmu-v2"
- "qcom,sdm630-smmu-v2", "qcom,smmu-v2"

- "qcom,sdm845-smmu-v2", "qcom,adreno-smmu", "qcom,smmu-v2"
- "qcom,sdm845-smmu-500", "arm,mmu-500"
- "qcom,sdm845-smmu-v2", "qcom,smmu-v2" // special setup used on Cheza

- "qcom,sm8250-smmu-500", "qcom,adreno-smmu", "arm,mmu-500"
- "qcom,sm8250-smmu-500", "arm,mmu-500"


As we are trying to refactor the IOMMU bindings, what would be your 
recommendation?

To introduce minimal changes, I wanted to have the following lists:
- "qcom,SOC-smmu-500", "qcom,adreno-smmu", "qcom,smmu-500", "arm,mmu-500"

- "qcom,SOC-smmu-500", "qcom,smmu-500", "arm,mmu-500"

However maybe you would prefer the following model:

- "qcom,SOC-adreno-smmu-500", "qcom,adreno-smmu-500", "arm,mmu-500"
- "qcom,SOC-smmu-500", "qcom,smmu-500", "arm,mmu-500"


Or:
- "qcom,SOC-smmu-500", "qcom,smmu-500", "arm,mmu-500" + 
'qcom,adreno-smmu' flag/property?


> 
>>                 - qcom,sdm845-smmu-v2
>>             - const: qcom,adreno-smmu
>>             - const: qcom,smmu-v2
> 
> Best regards,
> Krzysztof
> 

-- 
With best wishes
Dmitry

