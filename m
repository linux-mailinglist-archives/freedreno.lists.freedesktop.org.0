Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5B05E61AE
	for <lists+freedreno@lfdr.de>; Thu, 22 Sep 2022 13:47:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A68F10E2FC;
	Thu, 22 Sep 2022 11:47:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A91910EAD9
 for <freedreno@lists.freedesktop.org>; Thu, 22 Sep 2022 11:47:28 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id b24so10650577ljk.6
 for <freedreno@lists.freedesktop.org>; Thu, 22 Sep 2022 04:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=lfIzVvJwH59qn/BWWHJMkL6Oq/PiOvW3+SknpjmQRfE=;
 b=E2Ad53XZwhUsT1gispneQUgEJHMdy0oc3PAffMB/gOabR58mMlzPNR/9gDfrbkIU2a
 Ypj9T7uKEvLvZ0Ry4F+nA2ALzMFZKha87yssWTeO+SRIkagqChqI3siudGei2VsR4BuC
 ziFnvQHRnaCer0x9CU0kmoiD30GTDFDfaJ2MIV3IqpQP2byxVAd4c5Qry2eA0PxdW4od
 96le7BrnxkFQy38M4QJ+0diTdMs6ZppNqcL/g6fPGYVtFZIECTMhhUhvrrANQCKtQIlK
 En9ApHWuGMD536ri1ohXBFOGYSljnRx305RXQR8ut3u3wzgDZFyIxSKjhRZreQOMUXnI
 7IzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=lfIzVvJwH59qn/BWWHJMkL6Oq/PiOvW3+SknpjmQRfE=;
 b=iwzs5FQ/1s6SvM6qI2SbEDkLygDTB0rJEuGFkMuNlCclLyLLdAMRtENnFVeWxxXhfA
 5+OdzMFJDGR/G/Vwx8nobSY5/6xGXEgxL4J7FioYJJHItqkg+xQHp62WqjhNNJUpJqVY
 ZeE1+N2Ti6f8HleI7NbVsUHRbEvv1hOylClnRTYEMRS4WrkvuPgKSBfzE9KBis/fPTfj
 RX4CfmSN4I87gvPNG8erLS9EgCyVinllDFezCuawGKEaBcOsb/4Ojg4lne2LynU2q8tp
 SegMI9+mFLCCHRiVUDX8vmL5Y7edG1McaWXyBXXfIP5wweY/JD7nfsWRoUjlRa1ro44f
 LWyw==
X-Gm-Message-State: ACrzQf2RWmGXe6qhy/qy8CCWjnXtv6kwepvWeCMn3kElLbi8IhpLezxH
 WuJOzCxV4YyM/bEppgbGmmfWcQ==
X-Google-Smtp-Source: AMsMyM4jIlvZc1M/djOM/cHTTMsiKvPP6k7AvneFFRmoWo4a7UvSO3X4IHrXVUP63Spk/Cpb1uo8QA==
X-Received: by 2002:a05:651c:227:b0:26a:b322:b243 with SMTP id
 z7-20020a05651c022700b0026ab322b243mr893160ljn.13.1663847244282; 
 Thu, 22 Sep 2022 04:47:24 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 b25-20020a2ebc19000000b0026c4e922fb2sm879687ljf.48.2022.09.22.04.47.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 04:47:23 -0700 (PDT)
Message-ID: <126cd061-173d-62c1-a61d-06c191b13cb9@linaro.org>
Date: Thu, 22 Sep 2022 14:47:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-GB
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20220915133742.115218-1-dmitry.baryshkov@linaro.org>
 <20220915133742.115218-6-dmitry.baryshkov@linaro.org>
 <84c599c7-421a-78ed-b33e-ce1a4bd4356e@linaro.org>
 <CAA8EJpoZbNEiThZMaSCSML-x=TtXc8t8L-yvLZYDbR4hpvigXg@mail.gmail.com>
 <01baf27b-8257-aa08-d61f-a427c5056715@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <01baf27b-8257-aa08-d61f-a427c5056715@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v7 05/12] dt-bindings: display/msm: move
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
Cc: devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Andy Gross <agross@kernel.org>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 22/09/2022 14:43, Krzysztof Kozlowski wrote:
> On 22/09/2022 09:53, Dmitry Baryshkov wrote:
>> On Thu, 22 Sept 2022 at 10:05, Krzysztof Kozlowski
>> <krzysztof.kozlowski@linaro.org> wrote:
>>>
>>> On 15/09/2022 15:37, Dmitry Baryshkov wrote:
>>>> Move properties common to all MDSS DT nodes to the mdss-common.yaml.
>>>>
>>>> This extends qcom,msm8998-mdss schema to allow interconnect nodes, which
>>>> will be added later, once msm8998 gains interconnect support.
>>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>>>   .../bindings/display/msm/dpu-msm8998.yaml     | 41 +--------
>>>>   .../bindings/display/msm/dpu-qcm2290.yaml     | 51 ++----------
>>>>   .../bindings/display/msm/dpu-sc7180.yaml      | 50 ++---------
>>>>   .../bindings/display/msm/dpu-sc7280.yaml      | 50 ++---------
>>>>   .../bindings/display/msm/dpu-sdm845.yaml      | 54 ++----------
>>>>   .../bindings/display/msm/mdss-common.yaml     | 83 +++++++++++++++++++
>>>>   6 files changed, 111 insertions(+), 218 deletions(-)
>>>>   create mode 100644 Documentation/devicetree/bindings/display/msm/mdss-common.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml b/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
>>>> index 200eeace1c71..67791dbc3b5d 100644
>>>> --- a/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
>>>> +++ b/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
>>>> @@ -14,20 +14,13 @@ description: |
>>>>     sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
>>>>     bindings of MDSS and DPU are mentioned for MSM8998 target.
>>>>
>>>
>>> missing allOf
>>
>> Rob asked to remove this while reviewing v6 ([1]). And indeed the
>> allOf's around a single $ref do not seem to be necessary
> 
> He commented on one of properties, not top-level, maybe it is different
> case for dtschema. In the past it was required, so are you sure
> something changed in dtschema?

I do not know if something has changed or not. But judging from the fact 
that unevaluatedProperties:false do not generate any warnings, the 
referenced schema is processed and applied.

> 
> Best regards,
> Krzysztof
> 

-- 
With best wishes
Dmitry

