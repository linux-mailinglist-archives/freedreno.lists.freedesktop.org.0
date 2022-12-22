Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D31654143
	for <lists+freedreno@lfdr.de>; Thu, 22 Dec 2022 13:46:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3EFA10E11C;
	Thu, 22 Dec 2022 12:46:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 982B510E157
 for <freedreno@lists.freedesktop.org>; Thu, 22 Dec 2022 12:46:02 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id z10so1493723wrh.10
 for <freedreno@lists.freedesktop.org>; Thu, 22 Dec 2022 04:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6n0bW6AEyag4Yz/fTHAES88HSyxxmFvstBuhh9x5saw=;
 b=KOROV8lX7w89xX5ufKygg/XiKOHbwq+ahSq/EFXdClSz6A6PPIASH93vwSblhvyfvP
 z065xKqyID4B23C5FKRtCNBRT7EZeHKqBaXWbTm25nv5NSIM4YVpd6sapwFwIVxhDl9W
 vgS1DDELxOfO9UFeHBkuF3kXiBeX2Z9lJnUFB7VxxeWgDG2J9dKD9d4mhaDEElya+7OC
 J/Ifu+V/cIVhsVdOkWv9imdoqJp91AmZx3BU1lsgG0BAioTGznMGTy/nSQNLUBVfUTbu
 59/w/iEnZzmu8sYKq1kwC+RZvZABDeTzNELZU1mol/HdAZezfgpti3m/1ZYHUj2Ma+AJ
 OpWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6n0bW6AEyag4Yz/fTHAES88HSyxxmFvstBuhh9x5saw=;
 b=uHXhyjZawNie3BgS0kKxHzuSU54ysruDF6VuE3NEJh1Bp6ZACKJkxZ7X2hSq9gF5r2
 cw7SXkoL85iuOsSQBh/UMg4lZGvNpf1/nLyfg6xIiMpIH1Mq46KP1A+6d1oyXCse/5OJ
 WZkOnWxIA6FoctTHiT1/QkkNTbwUAyuvMo/AqxLqKLjs4y5ZItcAhGeEnYrfRtsSokdR
 BPNhZPNK/c8C+AyE+1d41gic/fVi0am2spRTdKi1JSUlTpdkxhQ3nAdwA/oLVrbsNB04
 OePEcKZNA4+rr1kdVzYkbS7JcUJpiAN6u+uwOI9EjHJsyFcI0pHt9GUf07zc4cGOmcrD
 cBCA==
X-Gm-Message-State: AFqh2kpjANpGvVoEFc1Z6nWBgJWuL0EisYCkCisRNIntExhqCLI/X4Z/
 GNOXUamPaJECkSsMWKCD/sBwJQ==
X-Google-Smtp-Source: AMrXdXv2CMOs1kyvXBletImJqlJC+DtSfV8o0e7xTIWzSkmMqSaL7v/keKysbviY3GcBchUTo4+AIw==
X-Received: by 2002:adf:fd4a:0:b0:242:593e:ee08 with SMTP id
 h10-20020adffd4a000000b00242593eee08mr3616514wrs.36.1671713160841; 
 Thu, 22 Dec 2022 04:46:00 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a5d58c2000000b0026a4bb75477sm456705wrf.28.2022.12.22.04.45.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 04:46:00 -0800 (PST)
Message-ID: <b1f9dd11-b626-26d8-c6bd-7b5af7340dbb@linaro.org>
Date: Thu, 22 Dec 2022 12:45:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
 <20221220123634.382970-6-bryan.odonoghue@linaro.org>
 <4115ec26-dedf-ca80-b81a-409d9db88f52@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <4115ec26-dedf-ca80-b81a-409d9db88f52@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v5 05/21] dt-bindings: msm:
 dsi-controller-main: Deprecate qcom, dsi-ctrl-6g-qcm2290 in favour of qcom,
 qcm2290-dsi-ctrl
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
Cc: dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sean@poorly.run, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_abhinavk@quicinc.com, david@ixit.cz, dianders@chromium.org,
 robdclark@gmail.com, robh+dt@kernel.org, agross@kernel.org, daniel@ffwll.ch,
 dmitry.baryshkov@linaro.org, swboyd@chromium.org, airlied@gmail.com,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 22/12/2022 11:50, Krzysztof Kozlowski wrote:
> On 20/12/2022 13:36, Bryan O'Donoghue wrote:
>> Deprecate qcom,dsi-ctrl-6g-qcm2290 in favour of the desired format
>> qcom,qcm2290-dsi-ctrl.
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>   .../display/msm/dsi-controller-main.yaml      | 36 +++++++++++--------
>>   1 file changed, 21 insertions(+), 15 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>> index 01afa9e9c4b3c..98d54a7ee28d4 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>> @@ -14,21 +14,27 @@ allOf:
>>   
>>   properties:
>>     compatible:
>> -    items:
>> -      - enum:
>> -          - qcom,apq8064-dsi-ctrl
>> -          - qcom,msm8916-dsi-ctrl
>> -          - qcom,msm8953-dsi-ctrl
>> -          - qcom,msm8974-dsi-ctrl
>> -          - qcom,msm8996-dsi-ctrl
>> -          - qcom,msm8998-dsi-ctrl
>> -          - qcom,dsi-ctrl-6g-qcm2290
>> -          - qcom,sc7180-dsi-ctrl
>> -          - qcom,sc7280-dsi-ctrl
>> -          - qcom,sdm660-dsi-ctrl
>> -          - qcom,sdm845-dsi-ctrl
>> -          - qcom,sm8250-dsi-ctrl
>> -      - const: qcom,mdss-dsi-ctrl
>> +    oneOf:
>> +      - items:
>> +          - enum:
>> +              - qcom,apq8064-dsi-ctrl
>> +              - qcom,msm8916-dsi-ctrl
>> +              - qcom,msm8953-dsi-ctrl
>> +              - qcom,msm8974-dsi-ctrl
>> +              - qcom,msm8996-dsi-ctrl
>> +              - qcom,msm8998-dsi-ctrl
>> +              - qcom,qcm2290-dsi-ctrl
>> +              - qcom,sc7180-dsi-ctrl
>> +              - qcom,sc7280-dsi-ctrl
>> +              - qcom,sdm660-dsi-ctrl
>> +              - qcom,sdm845-dsi-ctrl
>> +              - qcom,sm8250-dsi-ctrl
>> +          - const: qcom,mdss-dsi-ctrl
>> +      - items:
> 
> I would just squash it with previous. You are adding some code and in
> next patch immediately:
> 1. re-indent it,
> 2. remove it (qcom,dsi-ctrl-6g-qcm2290)
> 
> 
> Best regards,
> Krzysztof
> 

Just to make sure.

I'll squash this patch down in the previous and include your RB.
