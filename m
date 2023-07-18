Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FF47573A8
	for <lists+freedreno@lfdr.de>; Tue, 18 Jul 2023 08:09:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 229FF10E081;
	Tue, 18 Jul 2023 06:09:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43B4C10E2EC
 for <freedreno@lists.freedesktop.org>; Tue, 18 Jul 2023 06:09:45 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4fcd615d7d6so7937151e87.3
 for <freedreno@lists.freedesktop.org>; Mon, 17 Jul 2023 23:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689660583; x=1690265383;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z5VQwVrGcXMfCfvuw2kyfpvvEbdxnp5EKgVKHPURbWM=;
 b=HHvKaDKj0O6hNAptE4inyZOHuRF+UKZXm+WzhvsppGx6mT12Uv3s0wHix2zOZOkvkJ
 877SnV8WdE3kc/5yorMj2oCVMEcnUrqvrqltwTn2u3Ma5XlIhQ9YjVrYtchVjFchEUVs
 b4ns+4ukynBmrM4w9TK2edsk+MJLwwQFbmx0sdD9fvxXosHfFSPF1gAHqA55UosGsiHD
 asr4nRLbFZLmqxAJyEVTPU4ej+5KkCtQJCfSuXXDYYgcVdwYifBoECoY7YkW7k5/iM8K
 VPnYrIdT8Q//oCldxyRGgcLZUqFNTzskDMAuvE7hvRpARirSNs4Gfz0gRvAqXT76NsIA
 MTSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689660583; x=1690265383;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z5VQwVrGcXMfCfvuw2kyfpvvEbdxnp5EKgVKHPURbWM=;
 b=MAuvEX4R5foqn9V2HfddG8JmAKTjgRhF+RwCdxBxbeJfkii5nDpfeLdAcoa56FDhw7
 mOZqAdY4OZSXSrBHmjiOKs2FMUIIB80yXlsiN8A74IQqUjIYP4ji2jZYDuv9fNls904j
 2y/5Y+H8io0OxIQw0HfAaEgQjVZV3caHgjBBJgAipNQu5NPbIkTgWEL0aHLpex4dCeml
 GTQHI6sCDYERzISp+Qj8VKyzhVPy7XKzU3vCCaT4t3X4FRA7tH7grzEZXnRmYicYChqf
 GZ0/eTLX3LSGC+pc4AjBNq+hyifxPNhFt4u4gkLZzBGYyo/vxFxcHYcUsksDDjw6nA7a
 t6dA==
X-Gm-Message-State: ABy/qLbEN1nxgtos/u4defwKbdaZs7GXVs91JzFhgwQ1KrSQ4a6LEPi/
 UCehZKNSmm+MLyc5nj6TDj0eww==
X-Google-Smtp-Source: APBJJlFuWqM7VJ+TLOLnaEcliAKHtvXtVu+8Nyr2lg0mEZWLl6kglI0wuWE+sp43IVhjUCSwTxDmtg==
X-Received: by 2002:a05:6512:3989:b0:4fd:c923:db5f with SMTP id
 j9-20020a056512398900b004fdc923db5fmr1976725lfu.14.1689660582991; 
 Mon, 17 Jul 2023 23:09:42 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 a28-20020a056512021c00b004fbac025223sm279081lfo.22.2023.07.17.23.09.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jul 2023 23:09:42 -0700 (PDT)
Message-ID: <0075783f-9166-89aa-a9f9-068494e468e3@linaro.org>
Date: Tue, 18 Jul 2023 09:09:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Bjorn Andersson <andersson@kernel.org>
References: <20230709041926.4052245-1-dmitry.baryshkov@linaro.org>
 <yjr3i54z4ddifn7y6ls65h65su54xtuzx3gvibw6ld4x27fd7x@ganmrdp4vzx7>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <yjr3i54z4ddifn7y6ls65h65su54xtuzx3gvibw6ld4x27fd7x@ganmrdp4vzx7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 0/5] arm64: dts: qcom: qrb5165-rb5: enable
 DP support
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
 David Airlie <airlied@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Andy Gross <agross@kernel.org>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 18/07/2023 07:37, Bjorn Andersson wrote:
> On Sun, Jul 09, 2023 at 07:19:21AM +0300, Dmitry Baryshkov wrote:
>> Implement DisplayPort support for the Qualcomm RB5 platform.
>>
>> Note: while testing this, I had link training issues with several
>> dongles with DP connectors. Other DisplayPort-USB-C dongles (with HDMI
>> or VGA connectors) work perfectly.
>>
>> Dependencies: [1]
>> Soft-dependencies: [2], [3]
>>
>> [1] https://lore.kernel.org/linux-arm-msm/20230515133643.3621656-1-bryan.odonoghue@linaro.org/
> 
> I'm not able to find a version of this series ready to be merged, can
> you please help me find it?

This = Bryan's? I have posted some (small) feedback regarding v8. You 
also had issues with orientation switching bindings, etc. So there 
should be v9.

> 
> Regards,
> Bjorn

-- 
With best wishes
Dmitry

