Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA26B62F612
	for <lists+freedreno@lfdr.de>; Fri, 18 Nov 2022 14:30:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FB0810E746;
	Fri, 18 Nov 2022 13:30:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4F2F10E73D
 for <freedreno@lists.freedesktop.org>; Fri, 18 Nov 2022 13:30:34 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id p8so8188446lfu.11
 for <freedreno@lists.freedesktop.org>; Fri, 18 Nov 2022 05:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hoPLnQIWHGZiBfocuqhD68DppPhxPPYZcsfi2ooXQ0Q=;
 b=LIBcnPcwE+cq0K/MX/yErC/yiG5Fh34Sxfgouazyo+Nr92ett/A8koHUpXDvSIuoht
 GqW/7DNDALIw3qJmw1Np6hqudkyBT1e9jPwRAJUAKZsl8v2xEaCnOxeuDFnvQYN29H7B
 3xTznZiyn1IWlcMhz9lR6f3ullk5BVoMvATZLIfxLcycI3GMVeKCXmmm1GsNTmT0e3Cj
 qVoL9GDlznpB+M54vNS4apZHCx6W4r3tvnKbIwnM++DcK4alWYgup38PROQRQU68c8tu
 gCILPLcbNNB0oZ/kcMFZjsKfyno5MdA5dMB3oYHzpJsJL9rKxVWTWJE9CzO2EeL6P841
 UIXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hoPLnQIWHGZiBfocuqhD68DppPhxPPYZcsfi2ooXQ0Q=;
 b=1AdN74Il6gPYJ8SI4hf0t3hHdvXixw5eml3bC3MJ73XubQup1P8vzDJvb0dRS2ZI4I
 LJ/s0NDhP8PQ9ZK9md1AMdLlDSoYpKyLhmyWsEPnVnd2noMKdGX+A3556Awx7P4umQRR
 qeyOorIBYRDyLMuFTKy+ryOAmGcCU3EBqvano4+XLxfSGMD424ry1JifAaxExS6Gl+6S
 Aop8fMIh1Si0GbU/Mw5EF6Ip300c8Zs/kG6GAVxeQ5nUiAjTA2tYcP37HM8i9zXNwjzL
 2t1JH9YOLrEzarJrItmq8hO0Ld+EcP8WGqBmviCYcCa9cfknDs6QFkVdEaFHfqfA98Bx
 fnew==
X-Gm-Message-State: ANoB5pnF4tWMZAknVw0iYlrMdoIJHfGrw6Vx6Iw8rVGPvfsxStCs5ex6
 2SExA+NhUYcaGKRBsZFIKyoV5w==
X-Google-Smtp-Source: AA0mqf7OZT9f7s8VRA0spaiqh80uqrm8D1jurdI5s/WAmu9eeAg1h/N5A/QUUqt1bvuMp8kMxtO90g==
X-Received: by 2002:ac2:454b:0:b0:4a2:3f01:8669 with SMTP id
 j11-20020ac2454b000000b004a23f018669mr2290100lfm.305.1668778232687; 
 Fri, 18 Nov 2022 05:30:32 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 w25-20020a19c519000000b00498f3ebffb2sm661763lfe.25.2022.11.18.05.30.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Nov 2022 05:30:32 -0800 (PST)
Message-ID: <361a94f8-280c-89de-0681-9b662b67d7ba@linaro.org>
Date: Fri, 18 Nov 2022 15:30:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Content-Language: en-GB
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, krzysztof.kozlowski+dt@linaro.org,
 robh+dt@kernel.org, quic_mkrishn@quicinc.com, linux-arm-msm@vger.kernel.org
References: <20221107235654.1769462-1-bryan.odonoghue@linaro.org>
 <20221107235654.1769462-8-bryan.odonoghue@linaro.org>
 <aeb59d3c-34d0-f00a-bfc3-524cd03acb71@linaro.org>
 <0993d2bd-c0f2-8139-8f02-84abe6b8ad8b@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <0993d2bd-c0f2-8139-8f02-84abe6b8ad8b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v2 07/18] dt-bindings: msm:
 dsi-controller-main: Add compatible strings for every current SoC
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
Cc: Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org,
 Loic Poulain <loic.poulain@linaro.org>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawn.guo@linaro.org>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 18/11/2022 15:29, Bryan O'Donoghue wrote:
> On 08/11/2022 12:46, Dmitry Baryshkov wrote:
>> On 08/11/2022 02:56, Bryan O'Donoghue wrote:
>>> Currently we do not differentiate between the various users of the
>>> qcom,mdss-dsi-ctrl. The driver is flexible enough to operate from one
>>> compatible string but, the hardware does have some significant 
>>> differences
>>> in the number of clocks.
>>>
>>> To facilitate documenting the clocks add the following compatible 
>>> strings
>>>
>>> - qcom,mdss-dsi-ctrl-apq8064
>>
>> Generic comment: I think we'd better follow the arm/qcom-soc.yaml and 
>> use qcom,soc-something as compat string. This would leave us with 
>> qcom,apq8064-dsi-ctrl
>>
>> I'm not sure if we want to follow the qcm2290 approach and encode the 
>> DSI ctrl revision here (6g vs v2).
> 
> For qcm2290 I'm thinking qcm2290-dsi-ctrl - without the 6g piece.

This sounds good too.

> 
> a) Nobody is using the compat at the moment
> b) I'm not sure what - if any real information the silicon version
>     number conveys here.
> 
> + Loic, Shawn
> 
> ---
> bod
> 

-- 
With best wishes
Dmitry

