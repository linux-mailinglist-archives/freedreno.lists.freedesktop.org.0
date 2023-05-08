Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7436FA26E
	for <lists+freedreno@lfdr.de>; Mon,  8 May 2023 10:39:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FDF210E18C;
	Mon,  8 May 2023 08:39:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4316210E18C
 for <freedreno@lists.freedesktop.org>; Mon,  8 May 2023 08:39:06 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2ac8091351eso46053731fa.2
 for <freedreno@lists.freedesktop.org>; Mon, 08 May 2023 01:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683535144; x=1686127144;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=f9KWu05QQAHrGIgkSsa+JP+L8YvUPSvZPB7VD7A6qms=;
 b=ka9FwxiITVEo0yboLS/2O3n6/zlbIiVZWbvIIK49l3ZR44FexKmAnSVsrf5PoDsFDz
 L6D/ji5anPRI9Lb40qQu6FrfZYHxU80NHLiBFBGXFEUL8kdOssF3KNM5zCfl2zHBc0CZ
 tt1UfL68zqaQ+g+6/AzmC/hfKdVavShvmzEitPIXUS/h0U/XkZWL6VaE7o1r7yHhhPSq
 FkQ5pEzgBrtsmFOjXA0JFkmKn4bOF9Z4qRYoBt0YaGxhNesIR3POc3UhELMGch+UQL86
 nLdKyWzsibp/99wcDPZz95J1urVJNf8rPybXirYfA4AW2d00rkkRBy5i5NfLV+7T3TfF
 DdSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683535144; x=1686127144;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f9KWu05QQAHrGIgkSsa+JP+L8YvUPSvZPB7VD7A6qms=;
 b=ciznGB5SF2DRHo6UBEEuun57DL3RcZVNCVQ5uJH0IXtgA6BwFjA2w93rOJjwytLzm8
 GwZA44mewy0G7F8oFcUn38d2QZVLilxGgfFtvotqjZj96xSYomqFiC5z3lh7GAiAALFC
 nMxH+rYnHAP8vRwJFA3OgGi2S+g1vwI2STDIO8KG1fBYbzovbfvOyT/l/JQd8yoX2m5W
 WM0GjLGENRBX00zTIaRGo3tjOPo9yEdaXx2S2TaBUTBD1vvIgUoHK+T1aRVjZjpp67fl
 8JqeQx0cLlwa0iwnKxHxFiEf+JQUrBWwKq0O6fInCsBjB0MQZ2aEx1ge30OYNNWNYtp0
 /phg==
X-Gm-Message-State: AC+VfDwlCKsYXieMJgHTy1p6ENycpRtFXHqly7P8KvytRTeoedBkRrqu
 Utllh8OV0oEfcfKU34zO3nBoDw==
X-Google-Smtp-Source: ACHHUZ4f/q7vU8V60eEoycpYabQP7vUS7Ps/g6lArEoE/zeR5EVXKJpxTlWb4IMUn0Pwi0pPvwM0pQ==
X-Received: by 2002:a2e:874a:0:b0:2a7:b1de:3ff7 with SMTP id
 q10-20020a2e874a000000b002a7b1de3ff7mr2285929ljj.16.1683535144172; 
 Mon, 08 May 2023 01:39:04 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
 by smtp.gmail.com with ESMTPSA id
 n15-20020a2e904f000000b002a8bb20e534sm1063460ljg.108.2023.05.08.01.39.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 01:39:03 -0700 (PDT)
Message-ID: <dada9566-ba49-0f0c-3442-390b4461797b@linaro.org>
Date: Mon, 8 May 2023 10:39:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Will Deacon
 <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>
References: <20230411-topic-straitlagoon_mdss-v3-0-9837d6b3516d@linaro.org>
 <20230411-topic-straitlagoon_mdss-v3-4-9837d6b3516d@linaro.org>
 <80b46fcb-d6d0-1998-c273-5401fa924c7d@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <80b46fcb-d6d0-1998-c273-5401fa924c7d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v3 04/12] dt-bindings: display/msm: Add
 SM6350 MDSS
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 iommu@lists.linux.dev, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 7.05.2023 10:19, Krzysztof Kozlowski wrote:
> On 05/05/2023 23:40, Konrad Dybcio wrote:
>> Document the SM6350 MDSS.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>  .../bindings/display/msm/qcom,sm6350-mdss.yaml     | 214 +++++++++++++++++++++
>>  1 file changed, 214 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml
>> new file mode 100644
>> index 000000000000..6674040d2172
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml
>> @@ -0,0 +1,214 @@
>> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/msm/qcom,sm6350-mdss.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm SM6350 Display MDSS
>> +
>> +maintainers:
>> +  - Krishna Manikandan <quic_mkrishn@quicinc.com>
>> +
>> +description:
>> +  SM6350 MSM Mobile Display Subsystem (MDSS), which encapsulates sub-blocks
>> +  like DPU display controller, DSI and DP interfaces etc.
>> +
>> +$ref: /schemas/display/msm/mdss-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    items:
> 
> Drop items
> 
>> +      - const: qcom,sm6350-mdss
>> +
> 
> The Rob's bot warning can be ignored - it seems patch #1 was not applied.
Ack

Konrad
> 
> 
> Best regards,
> Krzysztof
> 
