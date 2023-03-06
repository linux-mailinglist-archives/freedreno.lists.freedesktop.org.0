Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8A56ABAB7
	for <lists+freedreno@lfdr.de>; Mon,  6 Mar 2023 11:05:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E3FC10E1DF;
	Mon,  6 Mar 2023 10:05:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F289210E0B7
 for <freedreno@lists.freedesktop.org>; Mon,  6 Mar 2023 10:05:53 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id b10so9065297ljr.0
 for <freedreno@lists.freedesktop.org>; Mon, 06 Mar 2023 02:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678097152;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=unOds7GIYyIZeIXCeSmLecqXXZzGvwJd0Rd/RRt4GOY=;
 b=b6rOn43tg0gOXWQqa0AIS3IHPoJ7L4w6kUyqmeHcbu3ij2H2rn4c18sidaRTCJ2Ri5
 TDmN6Pwl42m3EzZGgWmgGCr2gWrTttx+XFkBI7RAKXtpwGzj29bWlPq/ppQ1gjapwnre
 ApK+FwnMnk53R6jnWWLXIe/ec2QMnXoeIHUJZbONBhAnTyXsKH7XIrBEoirum5D5HO5S
 6WMOZtJ/cKWPmLc+bcwRbweTdw8qw/+0+7QN9AyriJ/DB/oxe/2H2v2tQsg6/6hWpe+D
 ADLqye33ELEp/3cSmmZSJYjRlqdkld3TWUil8I5NURSao74s5LI7pxJ4EGRpVlK5gfTx
 nwhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678097152;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=unOds7GIYyIZeIXCeSmLecqXXZzGvwJd0Rd/RRt4GOY=;
 b=OB2u2NjnlXt2GdVAZRuKPg82fmJ+WAPB5kZ565smFSH5G069XLoFFVf6gmkfJEvvl/
 RHDX18tGguhzWpnL/GrED7uoKgGEfOfQluBlYuA3zZjriYodP26560t2JuVNa1PVO51j
 YhqkrxY0FHbz5B8NTYch0JT485x0oxRsCv0eHkkJUqkNz1D7Rg05eJsU4mWrA7VISV1g
 jtL1MNhJJa8KrR7bg7S1Fy0dCgHrOQPMCC0Nt90vP2H5kYHTkTJkgkYw3nUDiU7v545R
 kMGtpJZgwiYMo5gRJGarvqYJC2shBoYeAyHVMpkzR68UELRvZ8UEhkO1t14V8gmAKl6m
 ONnw==
X-Gm-Message-State: AO0yUKXrLYM3u0u70xzeP0OGaW6i6s4gWXTw9gabYfNI2BIYch9AwRj6
 1sHMvMXQ2q6cGgtslS5QtL4Btg==
X-Google-Smtp-Source: AK7set+aZ5TWHcLe9FNsPz4hbcFTUvTYKf/VqiA+AH/AiSSMe2Eqq+EPUWJm/yhcjWI+rHs4fUTQPg==
X-Received: by 2002:a05:651c:10a4:b0:294:6e44:b6e0 with SMTP id
 k4-20020a05651c10a400b002946e44b6e0mr2836268ljn.5.1678097152016; 
 Mon, 06 Mar 2023 02:05:52 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
 by smtp.gmail.com with ESMTPSA id
 r19-20020a2e9953000000b00293534d9760sm1628381ljj.127.2023.03.06.02.05.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 02:05:51 -0800 (PST)
Message-ID: <7f1b29f3-35fa-4459-4832-f109d2979382@linaro.org>
Date: Mon, 6 Mar 2023 11:05:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
References: <20230304-topic-dsi_fixup-v3-0-b8565944d0e6@linaro.org>
 <20230304-topic-dsi_fixup-v3-1-b8565944d0e6@linaro.org>
 <c1a2ba5b-4cd9-362b-5a4e-e95a6bf27b3e@linaro.org>
 <30798bd2-5805-45e6-92d2-a9df6fb52600@linaro.org>
 <28561c8b-e9a3-b58e-429a-6dc331ad94e4@linaro.org>
 <35e19031-877c-329f-3bdd-4f04bc8ccc6f@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <35e19031-877c-329f-3bdd-4f04bc8ccc6f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v3 1/2] dt-bindings: display/msm:
 dsi-controller-main: Fix deprecated compatible
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
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 4.03.2023 18:53, Bryan O'Donoghue wrote:
> On 04/03/2023 17:45, Bryan O'Donoghue wrote:
>> On 04/03/2023 17:35, Konrad Dybcio wrote:
>>>> you'll see no error. However if you just do this
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
>>>> index 0733c2f4f3798..829fbe05b5713 100644
>>>> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
>>>> @@ -1094,8 +1094,7 @@ mdp5_intf1_out: endpoint {
>>>>                          };
>>>>
>>>>                          dsi0: dsi@1a98000 {
>>>> -                               compatible = "qcom,msm8916-dsi-ctrl",
>>>> -                                            "qcom,mdss-dsi-ctrl";
>>>> +                               compatible = "qcom,mdss-dsi-ctrl";
>>>>                                  reg = <0x01a98000 0x25c>;
>>>>                                  reg-names = "dsi_ctrl";
>>>>
>>>>
>>>> and run the same test you get
>>> Yes, correct. It's valid but it's deprecated, so the bindings are
>>> sane. Keep in mind there's an ABI-like aspect to this.
>>>
>>> Konrad
>>
>> The _driver_ will still accept "qcom,mdss-dsi-ctrl" which is ABI compliant but, I don't see why the yaml should.
>>
>> If you declare a new .dts with only "qcom,mdss-dsi-ctrl", that should throw a yaml check error.
>>
>> ---
>> bod
> 
> Actually. I agree with you, I just dislike it.
If I understand correctly, you are dissatisfied with dt_binding_check
not even throwing a warning when a deprecated binding is present.. I
agree, that could be improved..

Konrad
> 
> - "qcom,mdss-dsi-ctrl" <- the driver will accept this
> - "qcom,dsi-ctrl-6g-qcm2290" <- the driver will not accept this
> 
> bah
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
