Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EB365CFC0
	for <lists+freedreno@lfdr.de>; Wed,  4 Jan 2023 10:38:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D27410E519;
	Wed,  4 Jan 2023 09:38:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F7DF10E510
 for <freedreno@lists.freedesktop.org>; Wed,  4 Jan 2023 09:38:00 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id m6so39244782lfj.11
 for <freedreno@lists.freedesktop.org>; Wed, 04 Jan 2023 01:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LStRUu9LwhR/TLTpxI+ph/EG2JmByBMx76WWbcsIEGQ=;
 b=n1EKwCfP30SS7eMuLGG5SZWDkdxiFLj4uBKPHOJMBY/IRxyxNzc6vTJT05hyYTLHiz
 RD+YYw5zt5wuKnPh8Wso6oavgDC/Izy9JHdlTaotQGIUDxxOzn6HQbJ6VKCaYrxT0IbT
 rbdtdh8s6Zq8gaHPDCcb1rMOLluqMMePsJy5jFLrtSiFtf1GIcZgTph03anmF+5lX4tD
 jvWb+D58ATK9y+bOcDUcSFM4hReWn6+Lqw/XiLYW3ZWHGuSQwvAXieilpqrLnzYEQ/dB
 nZu8yb4PNqWNRaNv3mVfyxu68xoLhMcWPTK0bKn6k0cGur0pKOLTriytieWMdV1QJbiA
 jAaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LStRUu9LwhR/TLTpxI+ph/EG2JmByBMx76WWbcsIEGQ=;
 b=6u4/sA5rismadtEHEUNCGqKciQ/haqW1QVN0NjPAJf88KbcFOi5jybZV8+opTM/leS
 Dn6uT3wNSIc8h8Fy3kEJlclFHi3JrJN716SIFSERBs7SM5lRmRiyzEbmW+gcU1M7UlvO
 /uuayDsUOGfPGbwuf/oNHoPxYaxJcxk00pch3CijeSLqTK81w4iN9UD5Mp/9NKeiv9Lc
 ZFRev98glyg4cRU27JVtwtl3XxV2S+pAjQeSvsRLJlhUccnFo57+2h/rDFYxGNYm6GtK
 1ciR6EZN2mxPPVtRoi2L36PwrE/SEwYir3WoTn8IrpdhISyHnVrqChySLgXij5oSEiA1
 nyog==
X-Gm-Message-State: AFqh2koCoyjNb7xmg/hynJDIPSBK64MPltl+XtgupTFu29cg2sDNMxxA
 UuMHRxI0K/5O5zFBZJ5KVo8obA==
X-Google-Smtp-Source: AMrXdXt5+ZnAW0pVabAyBzRs7eYzNqgxPSx9qoK3UOe6tmlJo0GsVQUuCGGk/1nlGNDSgAf06ZIYbw==
X-Received: by 2002:ac2:5503:0:b0:4b5:9845:c8a9 with SMTP id
 j3-20020ac25503000000b004b59845c8a9mr12497800lfk.47.1672825078391; 
 Wed, 04 Jan 2023 01:37:58 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 bu20-20020a056512169400b004cb02ed464esm3991641lfb.196.2023.01.04.01.37.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 01:37:57 -0800 (PST)
Message-ID: <8a68bb5c-6006-c852-227d-d68751258a61@linaro.org>
Date: Wed, 4 Jan 2023 11:37:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To: Rob Herring <robh@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20221223021025.1646636-1-bryan.odonoghue@linaro.org>
 <20221223021025.1646636-8-bryan.odonoghue@linaro.org>
 <20230104002905.GA134092-robh@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230104002905.GA134092-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v6 07/18] dt-bindings: display/msm: Add list
 of mdss-dsi-ctrl compats
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
Cc: freedreno@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, konrad.dybcio@somainline.org, quic_abhinavk@quicinc.com,
 david@ixit.cz, dianders@chromium.org, robdclark@gmail.com, agross@kernel.org,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch, airlied@gmail.com,
 swboyd@chromium.org, sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 04/01/2023 02:29, Rob Herring wrote:
> On Fri, Dec 23, 2022 at 02:10:14AM +0000, Bryan O'Donoghue wrote:
>> Add the list of current compats absent the deprecated qcm2290 to the list
>> of dsi compats listed here.
>>
>> Several MDSS yaml files exist which document the dsi sub-node.
>> For each existing SoC MDSS yaml, provide the right dsi compat string.
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>   .../bindings/display/msm/qcom,mdss.yaml          | 16 +++++++++++++++-
>>   .../bindings/display/msm/qcom,msm8998-mdss.yaml  |  8 +++++---
>>   .../bindings/display/msm/qcom,sc7180-mdss.yaml   |  6 ++++--
>>   .../bindings/display/msm/qcom,sc7280-mdss.yaml   |  6 ++++--
>>   .../bindings/display/msm/qcom,sdm845-mdss.yaml   |  8 +++++---
>>   .../bindings/display/msm/qcom,sm8250-mdss.yaml   |  8 +++++---
>>   6 files changed, 38 insertions(+), 14 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
>> index ba0460268731b..86bb43489bf4a 100644
>> --- a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
>> @@ -94,7 +94,21 @@ patternProperties:
>>       type: object
>>       properties:
>>         compatible:
>> -        const: qcom,mdss-dsi-ctrl
>> +        items:
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
> 
> No need to have an exact match here. Just this is enough:
> 
> compatible:
>    contains:
>      const: qcom,mdss-dsi-ctrl
> 
> Then the DSI schema will check the rest.

I think the intent here should have been to list DSI variants usable 
with the qcom,mdss device. But then the list should be shortened a bit. 
E.g. apq8064 is pre-MDSS  and sc7180/7280 and sm8250 are used with 
qcom,SoC-mdss devices rather than just qcom,mdss.

> Same for the rest.
> 
> Rob

-- 
With best wishes
Dmitry

