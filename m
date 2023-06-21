Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BED8473925E
	for <lists+freedreno@lfdr.de>; Thu, 22 Jun 2023 00:18:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D19F410E043;
	Wed, 21 Jun 2023 22:18:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EB3510E043
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jun 2023 22:18:16 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4f4b2bc1565so8775524e87.2
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jun 2023 15:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687385894; x=1689977894;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zyWuSVMXh2Y/fSXjuElkXOGDHtemipt9fq/ZZgliCDQ=;
 b=y8vrACxzMcCef2j1eZMvyDCcR4g1WySOtRYSYJyZqwUKM4+gk+I3LPSGmrGtyQtqtw
 MvYjd6Ib3r6rZHSZMSh2yH4aFQ2E5lARS+WYZhB25P8fxa7ICZ4Qgkd4Pp8w9bXLnyho
 +ar+OFjHQwc86zWWpU8XRSIiyeaCC4yhtSx+qG3huWbBmuVl8wB9vQhzdp1pbIiG7gFR
 TNBjkEBdyO4mDXxeWtkUcajbdQUpSFA5Ry9I0WU8whd+wL7QnnRihow0MxwPSsiGzE4E
 u55FKvTNWFZz8Mtwv8f/FtYsbWr82ukB4r4QkAHYfcfIxQRRWxoxf58G1LJNcR1LfFcG
 4hFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687385894; x=1689977894;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zyWuSVMXh2Y/fSXjuElkXOGDHtemipt9fq/ZZgliCDQ=;
 b=iGBgx3ofb2ySyWGsk3Z/zIhJS9lupjndQnLRJ7lzVbNNYGB4fxaVAsz2DOJIj5+s46
 zqYayW3eAOxhgd8JOF4ZI0rIevpyn8mnNLg+jFhDkQWXLkSqbTqmroOugEYjw7w4PnAN
 cd6IvqMwEyAhEJX2ChYRQoJjtGk6Snnl0wG5Rfvwxi7q9uHEmtgdLd50Jd7PALf1ZwFq
 0GAFVLfBSY/OGIcD4qjTedkFsVUHbfe5Bh4icCG71THNKCZnsdkcfx9wgxy1td8sUbY8
 9vEeheIS8iNMAHecjSzBpxn0G2rU8pN8DVXKtap3a8lit5JbkbBDVOYLwzPgUn0g681t
 kg+g==
X-Gm-Message-State: AC+VfDxuqMN1IrvNcPq34Xb1/fbu42G+tzMRKR1XwIpMsq65thIlWObm
 rbbonAYAZTm+POFK9xCKcgB8xA==
X-Google-Smtp-Source: ACHHUZ5Si4dCWNPr03XUSarW8gCPbkN/erz8YhdBHCibOFkHWzUSZhPV12IA2841vnOqzTcqJaHntg==
X-Received: by 2002:ac2:4988:0:b0:4f9:535e:cdca with SMTP id
 f8-20020ac24988000000b004f9535ecdcamr4407924lfl.7.1687385894197; 
 Wed, 21 Jun 2023 15:18:14 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 h16-20020ac25970000000b004f85858e52dsm893503lfp.138.2023.06.21.15.18.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jun 2023 15:18:13 -0700 (PDT)
Message-ID: <c05a9a02-0a33-6160-9072-717efe30031a@linaro.org>
Date: Thu, 22 Jun 2023 01:18:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20230118171621.102694-1-bryan.odonoghue@linaro.org>
 <20230118171621.102694-3-bryan.odonoghue@linaro.org>
 <qew6nd3jqnasb3mivvdxcwugfrvxdeafilaxk35v7uihagk2qi@oxe3oqdgfwpe>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <qew6nd3jqnasb3mivvdxcwugfrvxdeafilaxk35v7uihagk2qi@oxe3oqdgfwpe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v9 2/2] dt-bindings: msm:
 dsi-controller-main: Document clocks on a per compatible basis
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
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 konrad.dybcio@somainline.org, quic_abhinavk@quicinc.com, david@ixit.cz,
 dianders@chromium.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 robdclark@gmail.com, robh+dt@kernel.org, agross@kernel.org, daniel@ffwll.ch,
 airlied@gmail.com, swboyd@chromium.org, sean@poorly.run,
 Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 22/06/2023 00:45, Marijn Suijten wrote:
> Hi!
> 
> On 2023-01-18 17:16:21, Bryan O'Donoghue wrote:
>> Each compatible has a different set of clocks which are associated with it.
>> Add in the list of clocks for each compatible.
> 
> So if each set of compatibles have their own unique set of clocks, is
> there a reason to have so many duplicate then: blocks?  I ran into this
> while preparing for submitting SM6125 DPU and having no clue where to
> add it.
> 
>> Acked-by: Rob Herring <robh@kernel.org>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>   .../display/msm/dsi-controller-main.yaml      | 218 ++++++++++++++++--
>>   1 file changed, 201 insertions(+), 17 deletions(-)
>>

[skipped most of the comments]

> 
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,sc7180-dsi-ctrl
>> +              - qcom,sc7280-dsi-ctrl
>> +              - qcom,sm8250-dsi-ctrl
>> +              - qcom,sm8150-dsi-ctrl
>> +              - qcom,sm8250-dsi-ctrl
>> +              - qcom,sm8350-dsi-ctrl
>> +              - qcom,sm8450-dsi-ctrl
>> +              - qcom,sm8550-dsi-ctrl
>> +    then:
>> +      properties:
>> +        clocks:
>> +          maxItems: 6
>> +        clock-names:
>> +          items:
>> +            - const: byte
>> +            - const: byte_intf
>> +            - const: pixel
>> +            - const: core
>> +            - const: iface
>> +            - const: bus
> 
> ... and here ...
> 
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,sdm660-dsi-ctrl
>> +    then:
>> +      properties:
>> +        clocks:
>> +          maxItems: 9
>> +        clock-names:
>> +          items:
>> +            - const: mdp_core
>> +            - const: byte
>> +            - const: byte_intf
>> +            - const: mnoc
>> +            - const: iface
>> +            - const: bus
>> +            - const: core_mmss
>> +            - const: pixel
>> +            - const: core
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,sdm845-dsi-ctrl
>> +    then:
>> +      properties:
>> +        clocks:
>> +          maxItems: 6
>> +        clock-names:
>> +          items:
>> +            - const: byte
>> +            - const: byte_intf
>> +            - const: pixel
>> +            - const: core
>> +            - const: iface
>> +            - const: bus
> 
> and here, we have *three* identical lists of clocks.  Should they (have
> been) combined?
> 
> I can send a patch fixing these all if desired!

Probably it would be logical to split follow DPU and MDSS schema and 
split this file into per-SoC compatibles and a generic file. Then it 
would be easier to review different SoC parts.

Regarding reordering of clocks. I think we have 5 different 
configurations in dsi_cfg.c, but we definitely can optimize the schema.

> 
> - Marijn
> 
>> +
>>   additionalProperties: false
>>   
>>   examples:
>> -- 
>> 2.38.1
>>

-- 
With best wishes
Dmitry

