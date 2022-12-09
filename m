Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94709647A8A
	for <lists+freedreno@lfdr.de>; Fri,  9 Dec 2022 01:11:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4784C10E20E;
	Fri,  9 Dec 2022 00:11:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DB7F10E4E5
 for <freedreno@lists.freedesktop.org>; Fri,  9 Dec 2022 00:11:19 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id d6so4523223lfs.10
 for <freedreno@lists.freedesktop.org>; Thu, 08 Dec 2022 16:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/kIc8Jj1a1zmKoEz2W+SDkXTo4yVcxbbD8qSkeEWknU=;
 b=wpW0fdECuuJrTEYsX2yYgZWZ94l+6CDLy44QJYzfcrdDvT3FVluT2PIIue7K0zHWIl
 yWbXC5qmqKdBjroFeUNhwn+52y8vm1V2Pi+swxXu0n3b/MBdRSu4p5jHMc/SUWXuTu2D
 +ui/QQZZ1Imtb4NqfTRdhG3QWMqRgYVP3MhQkT0qy5OhT7DkHvlWydlKifKmZY69pgx5
 JLMSayHDdRDisFheLffB+0OhxHvh4VF+UrdMNXCt0/kRVqnyzT0oqAF8fqdlSfjSZ8gt
 QmWnJ/gVN3h0nmrb5d9VYYaHcM/550dxtaYjcYuHVcffCbwLv5a4saFZ4OrcAtXikoVs
 Ip/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/kIc8Jj1a1zmKoEz2W+SDkXTo4yVcxbbD8qSkeEWknU=;
 b=ptDkKebSmcVS96SEok9ADaATmODShQF6aAzCYXmmtB0DrKlXoPShTegRkl3hi92+AR
 clX5PE0gNvGKtAtPBpjSEMXOy/vxS9yOuw13wsZ+SptMxQ2DYdUkkcYP0O/y6osAuGNl
 yeglS9MvQSQ483/Zt9/lw6tbgiUu2+/iNVrxMLF5YEyh5vESs2INSIvf5+keVQeSQNjv
 RzAk6kddC4xK8o2BiLxwcjrUazWtmC7WToOBkYL/gxklcypmi/8nCTt+ubPHnf9VGLPz
 chm1z90HRZvxk54leRPzoe1rpXx7ovjt6Ru8QxhajVDTXmg5f8v3nmadeBJiGSbEkjpO
 XK3g==
X-Gm-Message-State: ANoB5plnA1VHhuXZSq4K1GmY0q/rJ9dDISXEK22SSohcv5pcoi0WQkm2
 cyVqVYxspVGnlsWasl+WwIIrkw==
X-Google-Smtp-Source: AA0mqf7SZW85DZNUtkIqiFI//txZoeVxBcWArnYfSQ9s5TyjKffDnECzuHeD3eEzjBG5bsn3sqZBSg==
X-Received: by 2002:ac2:4f16:0:b0:4a4:68b8:9c4b with SMTP id
 k22-20020ac24f16000000b004a468b89c4bmr946096lfr.51.1670544677678; 
 Thu, 08 Dec 2022 16:11:17 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a2e3309000000b0027a00aab48fsm24069ljc.66.2022.12.08.16.11.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Dec 2022 16:11:17 -0800 (PST)
Message-ID: <be1411e8-1d07-7643-977c-a306016fd660@linaro.org>
Date: Fri, 9 Dec 2022 02:11:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
 agross@kernel.org, andersson@kernel.org, konrad.dybcio@somainline.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 devicetree@vger.kernel.org, airlied@gmail.com
References: <1670539015-11808-1-git-send-email-quic_khsieh@quicinc.com>
 <1670539015-11808-3-git-send-email-quic_khsieh@quicinc.com>
 <5a3865ed-8847-db04-3d60-f35438250bef@linaro.org>
 <5aa16223-dbf6-996c-1985-794302dcce91@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <5aa16223-dbf6-996c-1985-794302dcce91@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v11 2/5] dt-bindings: msm/dp: add data-lanes
 and link-frequencies property
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
Cc: linux-arm-msm@vger.kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 09/12/2022 01:38, Kuogee Hsieh wrote:
> 
> On 12/8/2022 3:33 PM, Dmitry Baryshkov wrote:
>> On 09/12/2022 00:36, Kuogee Hsieh wrote:
>>> Add both data-lanes and link-frequencies property into endpoint
>>>
>>> Changes in v7:
>>> -- split yaml out of dtsi patch
>>> -- link-frequencies from link rate to symbol rate
>>> -- deprecation of old data-lanes property
>>>
>>> Changes in v8:
>>> -- correct Bjorn mail address to kernel.org
>>>
>>> Changes in v10:
>>> -- add menu item to data-lanes and link-frequecnis
>>>
>>> Changes in v11:
>>> -- add endpoint property at port@1
>>>
>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>`
>>
>> Applying: dt-bindings: msm/dp: add data-lanes and link-frequencies 
>> property
>> .git/rebase-apply/patch:47: trailing whitespace.
>>
>> .git/rebase-apply/patch:51: trailing whitespace.
>>
>>
>> Also the dt_binding_check fails with an error for this schema. And 
>> after fixing the error in the schema I faced an example validation 
>> error. Did you check that the schema is correct and that the example 
>> validates against the schema?
> 
> yes, but i run "make dt_binding_check 
> DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/msm/dp-controller.yaml" at mu v5.15 branch since

I wouldn't ask you to post the log here. But I don't think that either 
of the errors that I see here is related to 5.15 vs 6.1-rc.

In fact after applying this patch against 5.15 I saw the expected failure:

Documentation/devicetree/bindings/display/msm/dp-controller.yaml: 
properties:required: ['port@0', 'port@1'] is not of type 'object', 'boolean'
Documentation/devicetree/bindings/display/msm/dp-controller.yaml: 
properties: 'required' should not be valid under {'$ref': 
'#/definitions/json-schema-prop-names'}
Documentation/devicetree/bindings/display/msm/dp-controller.yaml: 
ignoring, error in schema: properties: required

> 
> "make dt_binding_check" does not work at msm-next branch.

I went ahead and just checked.

`make dt_binding_check DT_SCHEMA_FILES=display/msm`  works cleanly in 
msm-next and reports a single example-related warning in msm-next-lumag. 
I pushed a patch to fix that warning (wich can hopefully be picked up by 
Abhinav into msm-fixes). So you can assume that both these branches have 
consistent error-free display/msm schemas.

> 
> But I did not check trainiling whitespace this time.
> 
>>
>>> ---
>>>   .../bindings/display/msm/dp-controller.yaml        | 27 
>>> ++++++++++++++++++++++
>>>   1 file changed, 27 insertions(+)
>>>
>>> diff --git 
>>> a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml 
>>> b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>> index f2515af..2a7fdef8 100644
>>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>> @@ -81,6 +81,7 @@ properties:
>>>       data-lanes:
>>>       $ref: /schemas/types.yaml#/definitions/uint32-array
>>> +    deprecated: true
>>>       minItems: 1
>>>       maxItems: 4
>>>       items:
>>> @@ -96,6 +97,7 @@ properties:
>>>       ports:
>>>       $ref: /schemas/graph.yaml#/properties/ports
>>> +
>>>       properties:
>>>         port@0:
>>>           $ref: /schemas/graph.yaml#/properties/port
>>> @@ -105,6 +107,29 @@ properties:
>>>           $ref: /schemas/graph.yaml#/properties/port
>>>           description: Output endpoint of the controller
>>>   +        properties:
>>> +          endpoint:
>>> +            $ref: /schemas/media/video-interfaces.yaml#
>>> +
>>> +            properties:
>>> +              remote-endpoint: true
>>
>> PLease add empty lines between the property definitions
>>
>>> +              data-lanes:
>>> +                $ref: /schemas/types.yaml#/definitions/uint32-array
>>
>> This is already a part of video-interfaces, so you don't need $ref
>>
>>> +                minItems: 1
>>> +                maxItems: 4
>>> +                items:
>>> +                  maximum: 3
>>
>> enum: [0, 1, 2, 3]
>>
>>> +              link-frequencies:
>>> +                $ref: /schemas/types.yaml#/definitions/uint64-array
>>> +                minItems: 1
>>> +                maxItems: 4
>>> +                items:
>>> +                  maximum: 8100000000
>>
>> I think we can have enum here too.
>>
>>> +
>>> +  required:
>>> +    - port@0
>>> +    - port@1
>>> +
>>>   required:
>>>     - compatible
>>>     - reg
>>> @@ -193,6 +218,8 @@ examples:
>>>                   reg = <1>;
>>>                   endpoint {
>>>                       remote-endpoint = <&typec>;
>>> +                    data-lanes = <0 1>;
>>> +                    link-frequencies = /bits/ 64 <1620000000 
>>> 2700000000 5400000000 8100000000>;
>>>                   };
>>>               };
>>>           };
>>

-- 
With best wishes
Dmitry

