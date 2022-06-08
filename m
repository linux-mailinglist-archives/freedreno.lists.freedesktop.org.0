Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58ED3542AAE
	for <lists+freedreno@lfdr.de>; Wed,  8 Jun 2022 11:06:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B461510E2D5;
	Wed,  8 Jun 2022 09:06:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 533E210E10A
 for <freedreno@lists.freedesktop.org>; Wed,  8 Jun 2022 09:06:41 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id n10so40173760ejk.5
 for <freedreno@lists.freedesktop.org>; Wed, 08 Jun 2022 02:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=UWYWVcXogZZm7TQss3LobaIgIJTxFR11rLplfzwNMig=;
 b=I+f7PscBnXMmsm6JdEzkN2r/BEt/ov8ZM76Of9NkJuptPE0KKTlIUPs75o4N75t+c9
 akUFLm72NOe/Dwa+JZKwGsZd6vIvsolgjFqCFy+7Q8gxb+lGg7Fm1kRDuQl/qe4xFy3F
 jmvEAD+FqGv5Tk9hX6na08VmJzEGvOgQTyPSi0Wb+OZxOLTEw7rPUx3ODM9dLH7df5Vk
 k/mkjhhiDuRAhRbIB+y4vuYQ+u68A7ejwC+UvqxRHiJ8FLLn2ify8SqSDPLxAnQxAQyC
 9R8gjr3zavFFHfAToBI8dANCxRJSx3bCQncuQbziii+rFS5hcekPkTLq52y0pma8ILvG
 j9wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UWYWVcXogZZm7TQss3LobaIgIJTxFR11rLplfzwNMig=;
 b=SWN3x0mrzv62ehxbR1hcl5i7MmSpR9fbjSdS0xZ9sjH5yOz9rD0B3haas02AZO0P+y
 aQXCOT8o93Gp37rWhU8L2KQws8slJdJtawtFgbPT293hX68P83Dse1HAVvdzRtksOoOz
 D8khY2kttryCm4vfoL2nVdky4g17UsCqpvqxYPHE+/7X5+OBrQeyur44ene75/nEV7y8
 3b61AplwDE+qzTIvM12R9hawB2uZltrudA/4tQke9O22aW1NWToxfgb2Ancrm5/96Mcy
 hzZga9HECTUJ8wFHsqCuhBRGiVrO9hFvqdCIHWbw1gxkxx7iI6hcCjhV8PRw2pibh99P
 aXSQ==
X-Gm-Message-State: AOAM530c8+MkXSCMx0w5kE0FsIOTDT9vzyceZiNTORvqvH6JBbmtNbGw
 S2S6ERvk/E2Poni2o8wyKU5yxU5oJkOQEORLCu64bQ==
X-Google-Smtp-Source: ABdhPJx2A5aRKvXYdtPa/8GFoapItwwMlKdcoNxXkyMGuWfdsOjCC9S9cC1Zud9VZdYGP7rgIy+NAQ==
X-Received: by 2002:a05:651c:98d:b0:250:976b:4a0e with SMTP id
 b13-20020a05651c098d00b00250976b4a0emr55921408ljq.494.1654679188857; 
 Wed, 08 Jun 2022 02:06:28 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 j20-20020a2e3c14000000b00253bd515f88sm3110633lja.68.2022.06.08.02.06.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jun 2022 02:06:28 -0700 (PDT)
Message-ID: <5a7b9d21-1d10-fba0-1102-c5ae27809a79@linaro.org>
Date: Wed, 8 Jun 2022 12:06:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220607185806.2771739-1-dmitry.baryshkov@linaro.org>
 <20220607185806.2771739-3-dmitry.baryshkov@linaro.org>
 <c431b51a-f68f-8608-5d5d-6dac85e2be4f@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <c431b51a-f68f-8608-5d5d-6dac85e2be4f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v1 2/7] dt-bindings: display/msm: hdmi: mark
 old GPIO properties as deprecated
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, David Heidelberg <david@ixit.cz>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 08/06/2022 12:05, Krzysztof Kozlowski wrote:
> On 07/06/2022 20:58, Dmitry Baryshkov wrote:
>> Mark obsolete GPIO properties as deprecated. They are not used by
>> existing device trees. While we are at it, also drop them from the
>> schema example.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../devicetree/bindings/display/msm/qcom,hdmi.yaml         | 7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,hdmi.yaml b/Documentation/devicetree/bindings/display/msm/qcom,hdmi.yaml
>> index 2f485b5d1c5d..2b1cac0851ce 100644
>> --- a/Documentation/devicetree/bindings/display/msm/qcom,hdmi.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,hdmi.yaml
>> @@ -59,22 +59,27 @@ properties:
>>   
>>     qcom,hdmi-tx-ddc-clk-gpios:
>>       maxItems: 1
>> +    deprecated: true
>>       description: HDMI DDC clock
>>   
>>     qcom,hdmi-tx-ddc-data-gpios:
>>       maxItems: 1
>> +    deprecated: true
> 
> This is confusing. These two are not defined in the old bindings, not
> used by DTS, not used by Linux implementation - why did you add them?

Most probably I added them as they were referenced in the source (and in 
the example). I'll drop these two completely (and document removing them 
from the example).

> 
>>       description: HDMI DDC data
>>   
>>     qcom,hdmi-tx-mux-en-gpios:
>>       maxItems: 1
>> +    deprecated: true
>>       description: HDMI mux enable pin
>>   
>>     qcom,hdmi-tx-mux-sel-gpios:
>>       maxItems: 1
>> +    deprecated: true
>>       description: HDMI mux select pin
>>   
>>     qcom,hdmi-tx-mux-lpm-gpios:
>>       maxItems: 1
>> +    deprecated: true
>>       description: HDMI mux lpm pin
>>   
>>     '#sound-dai-cells':
>> @@ -171,8 +176,6 @@ examples:
>>             <&clk 61>,
>>             <&clk 72>,
>>             <&clk 98>;
>> -      qcom,hdmi-tx-ddc-clk-gpios = <&msmgpio 70 0>;
>> -      qcom,hdmi-tx-ddc-data-gpios = <&msmgpio 71 0>;
>>         hpd-gpios = <&msmgpio 72 0>;
>>         core-vdda-supply = <&pm8921_hdmi_mvs>;
>>         hdmi-mux-supply = <&ext_3p3v>;
> 


-- 
With best wishes
Dmitry
