Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E46DC61971C
	for <lists+freedreno@lfdr.de>; Fri,  4 Nov 2022 14:09:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9F0A10E748;
	Fri,  4 Nov 2022 13:09:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C367710E748
 for <freedreno@lists.freedesktop.org>; Fri,  4 Nov 2022 13:09:39 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id h24so2956421qta.7
 for <freedreno@lists.freedesktop.org>; Fri, 04 Nov 2022 06:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4MxzjYKOk4sy5XjCR20EQiICdAfVYjjgrKgPBg79CsE=;
 b=jLQzpldCEcHA/FkI6E2pNXsFnBYFSpZpEi7EGtsN+UbHgHMGt8mblItb2S0sOavdll
 jCcljPGzrU0UgJjpy1YZmGTSPaynqcblExMDGFb0IxZXZ0aGYS+2lgY/D4Wl05GhpFsU
 W/n2UYzXuW8qV7VWdvCYoV5kzxUGQdBdz7c9j8drXSgmQjNL6DT8ydhoS2AiqxZm4XrH
 UK4Ur55PACqY5zSKJxsWVPLYJuBiW7sQl1Tag9msZcuQy24zXWfmBiJLGdn4so83rbEp
 6G1u49bDUYjiO3Av4uCxZyw32PMliCeFBFzU8bvCLokVrw8Qp0SmwF7yuNpSoKrj02/J
 MVgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4MxzjYKOk4sy5XjCR20EQiICdAfVYjjgrKgPBg79CsE=;
 b=Di/izis38chZnogO7uo1420kgLf5jucWzfvnEMXwRsXuMFWMNyT4rljXxAGQOEcErb
 bVlaNL6OlTPg47zqfW9UKXIUx9qSLkAOdVmbGN2msg7tkHW5lW5F3uRypajY3IvJrQTd
 YpuxmP0COTIOy0B5WbPrH8mITkWFmkw2cee/JCe5OOh0HM1Z+J/NehUNK9NIHZf2Un36
 zTaLR1s+guvtyJ4je3d0KowaBTjefEjvshH6ZJ9QzsQ0Og9KS/egt+BSU+arpQ14O2Es
 f+Zygt0/x7KHKaw9lWoEeuofqVHLfz6czpLkz3XphIoYEktg9aE8Ii15u50OJiLKiOcY
 zEIQ==
X-Gm-Message-State: ACrzQf0hCI12FiDfsi+Cqq+QKU9SDOjSP/srymFCiJrgz8EZwk8RIw/x
 7UDBtkIUB/38qt50J+2WwCNNfA==
X-Google-Smtp-Source: AMsMyM7zigYUVbBE2nPsp2ko6wVBLqpJ2LbhXuLIsukXJXFC98j3sXxmYJGHcIG5kwBfS9W5O41I7g==
X-Received: by 2002:a05:622a:4ac6:b0:3a5:29d8:b683 with SMTP id
 fx6-20020a05622a4ac600b003a529d8b683mr20780593qtb.386.1667567378867; 
 Fri, 04 Nov 2022 06:09:38 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:aad6:acd8:4ed9:299b?
 ([2601:586:5000:570:aad6:acd8:4ed9:299b])
 by smtp.gmail.com with ESMTPSA id
 w15-20020ac857cf000000b0038b684a1642sm2461299qta.32.2022.11.04.06.09.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 06:09:38 -0700 (PDT)
Message-ID: <94b9c2c7-a1f8-26e7-0dcf-41b7ef46b23f@linaro.org>
Date: Fri, 4 Nov 2022 09:09:37 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221102231309.583587-1-dmitry.baryshkov@linaro.org>
 <20221102231309.583587-4-dmitry.baryshkov@linaro.org>
 <bcc246a0-d682-33db-35d9-7738922756c0@linaro.org>
 <ec774d8b-b6b1-8dca-ec14-8e39e0a4f0f4@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ec774d8b-b6b1-8dca-ec14-8e39e0a4f0f4@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 3/8] dt-bindings: display/msm: add
 support for the display on SM8450
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 04/11/2022 08:45, Dmitry Baryshkov wrote:
> On 03/11/2022 17:03, Krzysztof Kozlowski wrote:
>> On 02/11/2022 19:13, Dmitry Baryshkov wrote:
>>> Add DPU and MDSS schemas to describe MDSS and DPU blocks on the Qualcomm
>>> SM8450 platform.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   .../bindings/display/msm/qcom,sm8450-dpu.yaml | 132 +++++++
>>>   .../display/msm/qcom,sm8450-mdss.yaml         | 349 ++++++++++++++++++
>>>   2 files changed, 481 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml
>>>   create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
>>>
> 
> [skipped]
> 
>>> +
>>> +$ref: /schemas/display/msm/mdss-common.yaml#
>>> +
>>> +properties:
>>> +  compatible:
>>> +    items:
> 
> [skipped]
> 
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: iface
>>> +      - const: bus
>>> +      - const: nrt_bus
>>> +      - const: core
>>> +
>>> +  iommus:
>>> +    maxItems: 1
>>> +
>>> +  interconnects:
>>> +    maxItems: 2
>>> +
>>> +  interconnect-names:
>>> +    maxItems: 2
>>
>> You need specific names here.
>>
> 
> The names are described in mdss-common.yaml

Ah, then it is ok. I could not check these :/

Best regards,
Krzysztof

