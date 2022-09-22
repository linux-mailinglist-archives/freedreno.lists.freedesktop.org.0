Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CD85E6255
	for <lists+freedreno@lfdr.de>; Thu, 22 Sep 2022 14:27:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EFBD10EAF6;
	Thu, 22 Sep 2022 12:27:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9526210EAF8
 for <freedreno@lists.freedesktop.org>; Thu, 22 Sep 2022 12:27:33 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id l12so10772478ljg.9
 for <freedreno@lists.freedesktop.org>; Thu, 22 Sep 2022 05:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=7ccFSo0Mw9hv51nZ/WTVP/yv8+hP69R+o0QItp6lmgQ=;
 b=CdL4nsoD2ng5Sy28Ql5tfq4y3lZ7rR9unzjVJQnu55s2S1UIEOWAhKCidOVKOR8EJa
 BMizmuYoeHjGSKlbeT4D0yMKOVdaDyKOFqubQXIPJTa5dgv0kT1S0BhrztckgNNNtlk9
 3MrBS2bdlm/ZptwrnnoQWe/KE3CTakCB/kK77bHcs+zQRB1BflakeV6JyRMzQdYv+2j7
 GFfxRKHiI75RAE4AiIV+TuDgiLfw2WQ96BpkNcxRxRikQnNcOsJa8iZ9F+9Y9LHyqCP4
 SEcTiBVNMBTFsvwP3PIDvos91XBITT5oG2M5onvhX3bFXkQG50McBGQr6l8RRE/TnmTS
 ljsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=7ccFSo0Mw9hv51nZ/WTVP/yv8+hP69R+o0QItp6lmgQ=;
 b=8CQVcZJ+D4BOU26at0vXlnanYWQcIJxtwIZNOoPCDdJAaYTNljvwZrkza4Th4sSrjt
 Q5iuKzIqoO2QJmwhrt/gMFtU8hPhWuK2jE4ac7eoPB9m+UoIjhs7k0JMuZprbHGbjTdg
 LEx3xdO0lQaJWvhNTEUIOZDGSG731dkTayKPwliWxaN1ujLYvSPBpQqphn+IIdcHS028
 xc77hTfKekLJQaTB2HbVmiP3qvZTbn8ztkPQGi1qU6QjyWjlZegYcYym+Ns0y9S/8oos
 SVco5nGaKHVf/5Ygd3fcVMwGoRRNQ/IIdg+LGhqWrjQikZavZfcghEN01PRMnF2hSHvD
 9BzQ==
X-Gm-Message-State: ACrzQf1LCbNumfnMyQWea2gsnGOBrElYsPEsLLqpIJQ0weaC8HwhMbDF
 BtUkkkgSJg14zxe93j0U1jQgwA==
X-Google-Smtp-Source: AMsMyM6rwPyNPWhgVCTudkXy3IDM/q3Uw7Y6qZ9D1YXsPxVo3MDiQalbiqy3OvcnVEC4ueIt2jIaBA==
X-Received: by 2002:a05:651c:194e:b0:26c:4f8f:8723 with SMTP id
 bs14-20020a05651c194e00b0026c4f8f8723mr964521ljb.140.1663849651959; 
 Thu, 22 Sep 2022 05:27:31 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 k1-20020ac257c1000000b004947555dbc2sm920601lfo.100.2022.09.22.05.27.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 05:27:31 -0700 (PDT)
Message-ID: <bc8efd08-3cc3-f41f-74cc-3aa92d5738aa@linaro.org>
Date: Thu, 22 Sep 2022 14:27:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20220915133742.115218-1-dmitry.baryshkov@linaro.org>
 <20220915133742.115218-6-dmitry.baryshkov@linaro.org>
 <84c599c7-421a-78ed-b33e-ce1a4bd4356e@linaro.org>
 <CAA8EJpoZbNEiThZMaSCSML-x=TtXc8t8L-yvLZYDbR4hpvigXg@mail.gmail.com>
 <01baf27b-8257-aa08-d61f-a427c5056715@linaro.org>
 <126cd061-173d-62c1-a61d-06c191b13cb9@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <126cd061-173d-62c1-a61d-06c191b13cb9@linaro.org>
Content-Type: text/plain; charset=UTF-8
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

On 22/09/2022 13:47, Dmitry Baryshkov wrote:

>>>>
>>>> missing allOf
>>>
>>> Rob asked to remove this while reviewing v6 ([1]). And indeed the
>>> allOf's around a single $ref do not seem to be necessary
>>
>> He commented on one of properties, not top-level, maybe it is different
>> case for dtschema. In the past it was required, so are you sure
>> something changed in dtschema?
> 
> I do not know if something has changed or not. But judging from the fact 
> that unevaluatedProperties:false do not generate any warnings, the 
> referenced schema is processed and applied.

Hm, indeed looking at the dtschema code should be no difference between
ref and allOf-ref.

Best regards,
Krzysztof

