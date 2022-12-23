Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4F7654D19
	for <lists+freedreno@lfdr.de>; Fri, 23 Dec 2022 08:58:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16DD210E16A;
	Fri, 23 Dec 2022 07:57:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C788D10E16A
 for <freedreno@lists.freedesktop.org>; Fri, 23 Dec 2022 07:57:37 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id s10so4262076ljg.1
 for <freedreno@lists.freedesktop.org>; Thu, 22 Dec 2022 23:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zBvQKOto+vmplvuOPy0PMGPzXwMlPMKtXIbJlmwmhJM=;
 b=hXvibYBkLGjTrJYbsFqKhXLOegd4W20iLdjD3iKt01q1zPltmfjZY8kX+oOr8XLO5Y
 LpdkD//YhwUuB5g0E1vllQlEFb61gRUI3OKL1z4E9UuCAWbSEuByLrEUpa1+crvaugV4
 v8m9+iz35sStKAUq4inDeaI6AVbvGxu1r0p+HjAIq31Uw9Q4XJbtj6xK5Z7Pn1lx+RiB
 kOUoZnU6h0sLNpwcJUp18PRU8gGMrcGF0xqm7aMS6YDVFl/qDOy/qf6WhuCHSIlIpqrD
 UM4t4L1sKbP+/1oOucr3Hryzx4Srk3FFC2Vg4Tz70g4If7xafsB/VPOirUUMTmbTcn9C
 Q+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zBvQKOto+vmplvuOPy0PMGPzXwMlPMKtXIbJlmwmhJM=;
 b=mXrt95HBBr4BejRwJUvUmTsgenh7EZhcgHg90xM5eJUlJ4SQ8H3+B9nnhuU/LH9hOG
 YsaCo4rfoH+ZMfX1sCLZbdmGGBj2kRUyxGo6Z3YYnnwoivigVQYbvpmOjGhoeYE0U1Nv
 wdYEA/8le34tCLs+cuu5zwFnS6gt0Tp9Dppaomk1EtOE5DmNNLELbUmZezPzlO57T4HB
 Zye+41uiluNo8mRSR/Ke6tToF1J9xWJdpSLRrFjoF3+LgDtZXt6Ru+P4ZonOW6jyTMlJ
 97qnsItYiOfELsCmxXvpRPXC5HJiYo+IG4PL9RZrX3YOjQ+W1VhIaJOrpgUhuirKFuBw
 jv1A==
X-Gm-Message-State: AFqh2kr16YzKg4Smor7SJk1MGNJhMtg6KhP85rrO1O4z/4EVOGfMUxKe
 7npJj9GTtfJ+blT/KTD+Q3cAog==
X-Google-Smtp-Source: AMrXdXsZDZ5XmTLs7XUsj5QJeRBTIPRou5NU5Myhiv5VfkgR31vazIcUFlwh0ULYxb6j2gSaFSMQRA==
X-Received: by 2002:a05:651c:b94:b0:277:3b1:7017 with SMTP id
 bg20-20020a05651c0b9400b0027703b17017mr3520368ljb.33.1671782255306; 
 Thu, 22 Dec 2022 23:57:35 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 e3-20020a2e8183000000b002778d482800sm306576ljg.59.2022.12.22.23.57.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 23:57:34 -0800 (PST)
Message-ID: <f8ed0927-a97e-9395-1297-addb57ecd855@linaro.org>
Date: Fri, 23 Dec 2022 08:57:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, agross@kernel.org,
 dmitry.baryshkov@linaro.org, andersson@kernel.org,
 konrad.dybcio@somainline.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
 airlied@gmail.com
References: <1671217893-17496-1-git-send-email-quic_khsieh@quicinc.com>
 <1671217893-17496-2-git-send-email-quic_khsieh@quicinc.com>
 <1a5cc3d3-ac2d-52c8-79f4-b13252a4bb86@linaro.org>
 <54bd8b85-8b68-4b28-ec68-28edf9a8a097@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <54bd8b85-8b68-4b28-ec68-28edf9a8a097@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v14 1/5] arm64: dts: qcom: add data-lanes
 and link-freuencies into dp_out endpoint
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

On 22/12/2022 17:22, Kuogee Hsieh wrote:
> 
> On 12/22/2022 2:47 AM, Krzysztof Kozlowski wrote:
>> On 16/12/2022 20:11, Kuogee Hsieh wrote:
>>> Move data-lanes property from mdss_dp node to dp_out endpoint. Also
>>> add link-frequencies property into dp_out endpoint as well. The last
>>> frequency specified at link-frequencies will be the max link rate
>>> supported by DP.
>>>
>>> Changes in v5:
>>> -- revert changes at sc7180.dtsi and sc7280.dtsi
>>> -- add &dp_out to sc7180-trogdor.dtsi and sc7280-herobrine.dtsi
>>>
>>> Changes in v6:
>>> -- add data-lanes and link-frequencies to yaml
>>>
>>> Changes in v7:
>>> -- change 160000000 to 1620000000
>>> -- separate yaml to different patch
>>>
>>> Changes in v8:
>>> -- correct Bjorn mail address to kernel.org
>>>
>>> Changes in v9:
>>> -- use symbol rate (hz) for link-frequencies at dp_out at sc7180_trogdor.dtsi
>>>
>>> Changes in v13:
>>> -- delete an extra space at data-lanes
>>>
>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi   | 6 +++++-
>>>   arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 4 ++++
>>>   2 files changed, 9 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
>>> index eae22e6..e2783dd 100644
>>> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
>>> @@ -814,7 +814,11 @@ hp_i2c: &i2c9 {
>>>   	status = "okay";
>>>   	pinctrl-names = "default";
>>>   	pinctrl-0 = <&dp_hot_plug_det>;
>>> -	data-lanes = <0 1>;
>>> +};
>>> +
>>> +&dp_out {
>>> +    data-lanes = <0 1>;
>>> +    link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000>;
>> Messed order of nodes.
> 
> can you please give me more details and how should i fixed it?

Node overrides/extends are more or less ordered by name. dp should not
be around mdp, but for example dsi.

Best regards,
Krzysztof

