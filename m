Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5DA624D40
	for <lists+freedreno@lfdr.de>; Thu, 10 Nov 2022 22:45:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C66F10E769;
	Thu, 10 Nov 2022 21:45:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D66B10E769
 for <freedreno@lists.freedesktop.org>; Thu, 10 Nov 2022 21:45:07 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id a15so2455636ljb.7
 for <freedreno@lists.freedesktop.org>; Thu, 10 Nov 2022 13:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2Ycm4yI7Fjm7qLhACsZB89mJNY3y5LzgYSf1XQcN9Y4=;
 b=Q4bUJgTwdovmX1vqvVMapo117LNmOIzvO0a281XV/F3WwAHILMwd03RHWEq7tlhPDy
 XIVG7SryDYCP6zgWHaO3g9DFIcU235EUJ0uaAYxp5hRpQgYBhu7OUZQBLt0csz+xO1Fv
 vfWuAuMx/h4fIWfkGDciHM7vgG+pTlkikLp0aqPnQu1Qjy3efcr2IhroSpsWrkDiuYAF
 gbcEjP4H7mVo/fkmrf+X1Fyvap2jlyvb8Rubq7o7JKZ9PXGIh1yR8EAw0Ymenu+TGP8k
 fu4eyNFYGzy3qpSOYrNMRals6Rok32PmjtqisdWGueuoWzjFXi0hNAlz3UD+oFHr2DPo
 JVfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2Ycm4yI7Fjm7qLhACsZB89mJNY3y5LzgYSf1XQcN9Y4=;
 b=HFpxsMQqkmWdQ/FO0eaOAZ+Qlqz0kqTl1pNna3jd/F6hPtM5Y4YT6RCjqfgDWZHzIi
 3mmbF7C7HfviRt8uXjx1NGkyi2nDlpJbnfYf/zM9p/rsOSjbP9rfrbWFsUjyvWlsOndo
 TV5mJFeaqr2eHWPTl4lPhi0TzYg2mcSVdIx3iXcskyHPssHNxDPw5kBHwCFecUEiklN7
 oPCRvoFC08pGh7i7iZ+xvpOsDFu5OclzDTqy5wop3e+8N8kmLlq38ZQpXeBBaoOQs3Cs
 jBPyuFPr+lf14LM3+q6igCay+P1lLiKZzyP4HZj/uWn9Yi3FbkXDATpDkzEK5tw9fI3F
 I1cw==
X-Gm-Message-State: ACrzQf2Gi5qVO7TlWQbN3AY1xtySo1jDEUcBFWSGk1RuIoL19Bg+zcvL
 /2dz1FSCaxfnkYY4QQUfw3bkMw==
X-Google-Smtp-Source: AMsMyM5Yl3UNkJaH9rgIXunnY/WAMaQL8CpcD1fuGcZGK75QSChlvq2RNL7B4AkfY67/O7rs7SCNQw==
X-Received: by 2002:a05:651c:1113:b0:277:515b:3dae with SMTP id
 e19-20020a05651c111300b00277515b3daemr9577709ljo.487.1668116705580; 
 Thu, 10 Nov 2022 13:45:05 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d16-20020ac24c90000000b004949a8df775sm39905lfl.33.2022.11.10.13.45.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Nov 2022 13:45:05 -0800 (PST)
Message-ID: <b62e7239-0fef-e19c-5653-96f72b7b89b5@linaro.org>
Date: Fri, 11 Nov 2022 00:45:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Content-Language: en-GB
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221024164225.3236654-1-dmitry.baryshkov@linaro.org>
 <20221024164225.3236654-6-dmitry.baryshkov@linaro.org>
 <f72aeaa0-0c0a-86d9-0b9b-db3810c35fad@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <f72aeaa0-0c0a-86d9-0b9b-db3810c35fad@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v9 05/12] dt-bindings: display/msm: move
 common MDSS properties to mdss-common.yaml
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 08/11/2022 14:05, Krzysztof Kozlowski wrote:
> On 24/10/2022 18:42, Dmitry Baryshkov wrote:
>> Move properties common to all MDSS DT nodes to the mdss-common.yaml.
>>
>> This extends qcom,msm8998-mdss schema to allow interconnect nodes, which
>> will be added later, once msm8998 gains interconnect support.
> 
> 
> (...)
> 
>> +    minItems: 1
>> +    items:
>> +      - description: Interconnect path from mdp0 (or a single mdp) port to the data bus
>> +      - description: Interconnect path from mdp1 port to the data bus
>> +
>> +  interconnect-names:
>> +    minItems: 1
>> +    items:
>> +      - const: mdp0-mem
>> +      - const: mdp1-mem
>> +
>> +  resets:
>> +    items:
>> +      - description: MDSS_CORE reset
>> +
>> +required:
>> +  - compatible
> 
> For consistency this should not be required here, but in schema actually
> defining it.
> 
>> +  - reg
>> +  - reg-names
>> +  - power-domains
>> +  - clocks
>> +  - interrupts
>> +  - interrupt-controller
>> +  - iommus
>> +  - ranges
> 
> Keep the same order as in list of top-level properties.

But the order is the same.

Compare:
   reg:
   reg-names:
   power-domains:
   clocks:
   clock-names:
   interrupts:
   interrupt-controller: true
   iommus:
   ranges: true
   interconnects:
   interconnect-names:
   resets:

I'll add clock-names, but the rest is correct (interconnects and resets 
are optional).

> 
>> +
>> +additionalProperties: true
> 
> Best regards,
> Krzysztof
> 

-- 
With best wishes
Dmitry

