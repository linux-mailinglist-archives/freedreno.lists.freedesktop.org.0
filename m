Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1392F68BD04
	for <lists+freedreno@lfdr.de>; Mon,  6 Feb 2023 13:37:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA85C10E3A9;
	Mon,  6 Feb 2023 12:37:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65CC010E3A9
 for <freedreno@lists.freedesktop.org>; Mon,  6 Feb 2023 12:36:59 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so10665019wmb.2
 for <freedreno@lists.freedesktop.org>; Mon, 06 Feb 2023 04:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=e1/W4vRspGFqPKyfZ9iLWstpJUiKCT/PotldFbMIbXE=;
 b=YpnQj+Qewd739lMDk8Qj0AGFdVsu+mcPOF7zxKNf5Mu0W1wJpDEhdV70krq140dGs8
 xQAEq02J6OJvKh1zfvqxZCcstAdsb2OS+mwZTj9gjpQ0OBY8+j+7Bz3fjnw7vj7iCc3K
 sSv1ESPOhOTx1A4ixr3Mj3GvfYbJTiiSXv+STuEfl5qfC1D792LBeleX+IsdT5A+WarZ
 rMviQdHyMMd58wSkcdRXurpJVAwF4HUu3+s+X+hC8so7QFqHaISxIUxw/HEsUA43BEqE
 h33LFR+MtNGlHwoEJhanuEP+2jy1LhiO/8St7QXD3TrppBL+vz2AYtUZguhrDKkL1ovn
 JAYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e1/W4vRspGFqPKyfZ9iLWstpJUiKCT/PotldFbMIbXE=;
 b=Q2KVxWBeBGUpv+ifuzHisxZLlq48HuMks1vfesFjuTWBTrsk+fCYL4l8FUoqTRSOOR
 6SUCFgS61jJrpObqbso61v+PBBaLuWXc071gKB7D9CkHv10jTHlgnIjMt6YEygU+tNev
 cs2J2QwXEkhXt6GDEqcrZeVxx+PYTEW2R136km+Botuw7BEgYetyo2Re5MDRAkDCp4eO
 28AxKjsPTvoboZXXl9oVh7UfhBiqZ9BRefTcp5vVgZhvofY0J5EY9Onw4ekCudE/k0ML
 CKzW5sCZwHBzNU0z5eFQBXyElfehisA8zzvaNl08SE96G3ZWheJYqER/+tFMvRJ8XcQe
 t16w==
X-Gm-Message-State: AO0yUKUC9L+I2r9mdWqOHI5QOMLp17k0Y/gNbxExVdV9fuiOlNUj5Xdg
 2gPCeTvD/nuOvlQhaTsEBhJkaw==
X-Google-Smtp-Source: AK7set9fB0Ww3UvqTSLoPFgsNKMOmP1EKVTidKJRXRsxAwbBRtkjfrHPrMf9DpUSFF3AM0gXH+e+TQ==
X-Received: by 2002:a05:600c:1e89:b0:3dc:5b48:ee5 with SMTP id
 be9-20020a05600c1e8900b003dc5b480ee5mr19017077wmb.2.1675687017918; 
 Mon, 06 Feb 2023 04:36:57 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:f03f:3ced:a369:d884?
 ([2a01:e0a:982:cbb0:f03f:3ced:a369:d884])
 by smtp.gmail.com with ESMTPSA id
 bj24-20020a0560001e1800b002bded7da2b8sm8864067wrb.102.2023.02.06.04.36.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 04:36:57 -0800 (PST)
Message-ID: <56e3816e-c317-1772-1ef3-aeaa9ef0c890@linaro.org>
Date: Mon, 6 Feb 2023 13:36:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20230206-topic-sm8450-upstream-dp-controller-v1-0-f1345872ed19@linaro.org>
 <20230206-topic-sm8450-upstream-dp-controller-v1-1-f1345872ed19@linaro.org>
 <f1665a8f-5b5b-7d98-a94e-d1b1df04afdf@linaro.org>
 <a2ad7b78-d848-df9d-2646-476cb306c505@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <a2ad7b78-d848-df9d-2646-476cb306c505@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH 1/5] dt-bindings: display: msm:
 dp-controller: document SM8450 compatible
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
Reply-To: neil.armstrong@linaro.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 06/02/2023 12:20, Dmitry Baryshkov wrote:
> On 06/02/2023 12:33, Krzysztof Kozlowski wrote:
>> On 06/02/2023 11:17, Neil Armstrong wrote:
>>> The SM8450 & SM350 shares the same DT TX IP version, use the
>>> SM8350 compatible as fallback for SM8450.
>>>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>>   Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 4 ++++
>>>   1 file changed, 4 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>> index 0e8d8df686dc..98bae326e655 100644
>>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>> @@ -25,6 +25,10 @@ properties:
>>>         - qcom,sc8280xp-edp
>>>         - qcom,sdm845-dp
>>>         - qcom,sm8350-dp
>>> +      - items:
>>> +          - enum:
>>> +            - qcom,sm8450-dp
>>
>> Indentation looks wrong here. Testing should fail, did you test it?
> 
> Moreover it also breaks dt-schema, see https://github.com/devicetree-org/dt-schema/issues/98

Yep the change totally broke on rebase, will fix it

Sorry for the noise.

Neil

> 
>>
>> Best regards,
>> Krzysztof
>>
> 

