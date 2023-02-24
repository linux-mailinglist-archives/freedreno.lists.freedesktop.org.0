Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 308936A1B95
	for <lists+freedreno@lfdr.de>; Fri, 24 Feb 2023 12:50:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA34A10E8BE;
	Fri, 24 Feb 2023 11:50:20 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55E7D10E88D
 for <freedreno@lists.freedesktop.org>; Fri, 24 Feb 2023 11:50:19 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id g17so4854313lfv.4
 for <freedreno@lists.freedesktop.org>; Fri, 24 Feb 2023 03:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677239417;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tRGKNu8+nQtfgk+o8BnV6TsJOhtE3fIGeixZ72M30Es=;
 b=uojecS0jnQXyMuuky7+8Vn/P7ewJIsjqAc3BoNM/P5nAtzjlKb4SirE0DjYHlJpjvz
 z3EKqL0jDsd8NR7RDXyMwa6xjn9wkI6u+d3GBN/5jjjH476wsPpfwWWy6V3mBfv3UbCZ
 DIou4j3WeZiCnPxaxwGX9fmJlS3oMwNBmNgJhmALSozd4XxHuv945xEallYyT2EAW7LF
 diRZdC1w6O8nhRfVyvScyPlSbvquMn+kH/heYVf136h8yfk94HXgUNKyi0izUE71OFdC
 3uGwdxy/ulhsQrR/ISC9gewvLsEUMux4stdSTnKR7/wRCa+5vm7T0wie+/Ily77QEP40
 0aVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677239417;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tRGKNu8+nQtfgk+o8BnV6TsJOhtE3fIGeixZ72M30Es=;
 b=EuSe5XzrsGTJr1IVUH3GAIWu19ovaAbfyufBvZ0wfPKQ7V+ovdQ7oy+b6bITu7GZ+D
 uhXg7qV9acQ9pbPEJWhPRa/5AvavkJ0MfMT5s3Vtmt/r7Tgb/9LK95/AzhuAjWTBrgb5
 pie3QVU+SR47Oh5LiNfvxeR6rdccC+KOHR4fVztnEgqgWrHm+hf+nD+vUTgxTOiICfE4
 /pTI0Yeyvx5bppsHq3noHJ32upVGz5p4PSMzAsAEjl9ra23eMDT9ZMTmrMPbfiGtoj6X
 yJA7HuD2ru6YuGslTzycBkR7vszFomOoEvPKqjOHIPeKTGh+Sp1YN8/YbV23Ee4Y9X7p
 JaxA==
X-Gm-Message-State: AO0yUKW+O3lDpjW1sSW7EqT2vIiFT8YeYR22c9vHSI5ccobGtWVhycfT
 IJ72so69LTiRf6bSqyOyQt5EPQ==
X-Google-Smtp-Source: AK7set8zYxXQDEr3DaHDzu+XwBKc4RGTc9rFYpzvi/qL+BFDOihLu6FJODBvD7IcUJVtll2G21yhYQ==
X-Received: by 2002:ac2:43d5:0:b0:4d5:a689:cd73 with SMTP id
 u21-20020ac243d5000000b004d5a689cd73mr4906894lfl.55.1677239417328; 
 Fri, 24 Feb 2023 03:50:17 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
 by smtp.gmail.com with ESMTPSA id
 l26-20020ac2555a000000b004cb45148027sm1600980lfk.203.2023.02.24.03.50.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 03:50:16 -0800 (PST)
Message-ID: <40c42e36-9da7-73e1-8ae6-5a0a4abf17b1@linaro.org>
Date: Fri, 24 Feb 2023 12:50:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>
References: <20230223-topic-gmuwrapper-v3-0-5be55a336819@linaro.org>
 <20230223-topic-gmuwrapper-v3-2-5be55a336819@linaro.org>
 <2fb0ba58-c011-7896-9792-005d0ed9ad55@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <2fb0ba58-c011-7896-9792-005d0ed9ad55@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v3 02/15] dt-bindings: display/msm/gmu: Add
 GMU wrapper
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 24.02.2023 12:19, Krzysztof Kozlowski wrote:
> On 23/02/2023 13:06, Konrad Dybcio wrote:
>> GMU wrapper is essentially a register space within the GPU, which
>> Linux sees as a dumbed-down regular GMU: there's no clocks,
>> interrupts, multiple regs, iommus and OPP. Document it.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>  .../devicetree/bindings/display/msm/gmu.yaml       | 49 ++++++++++++++++------
>>  1 file changed, 37 insertions(+), 12 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
>> index ab14e81cb050..021373e686e1 100644
>> --- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
>> @@ -19,16 +19,18 @@ description: |
>>  
>>  properties:
>>    compatible:
>> -    items:
>> -      - pattern: '^qcom,adreno-gmu-6[0-9][0-9]\.[0-9]$'
>> -      - const: qcom,adreno-gmu
>> +    oneOf:
>> +      - items:
>> +          - pattern: '^qcom,adreno-gmu-6[0-9][0-9]\.[0-9]$'
>> +          - const: qcom,adreno-gmu
>> +      - const: qcom,adreno-gmu-wrapper
> 
> Why wrapper is part of this binding then? Usually wrapper means there is
> wrapper node with a GMU child (at least this is what we call for all
> wrappers of custom IP blocks like USB DWC). Where is the child?
"GMU wrapper" is a sorta confusing name that Qualcomm chose for
the "fake GMU" which has the GMU_CX and GMU_GX registers responsible
for things like powering up some GPU things internally and some
perf/pwr counters. It is _not_ a wrapper in the sense of a parent-child
relationship. The GMU wrapper has no HFI (Hardware Firmware Interface)
to communicate through crafted messages, but relies on plain register
accesses.

Konrad
> 
> 
> Best regards,
> Krzysztof
> 
