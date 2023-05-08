Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5228C6FA247
	for <lists+freedreno@lfdr.de>; Mon,  8 May 2023 10:32:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B06310E177;
	Mon,  8 May 2023 08:32:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5635910E17A
 for <freedreno@lists.freedesktop.org>; Mon,  8 May 2023 08:32:13 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4ec8149907aso4863629e87.1
 for <freedreno@lists.freedesktop.org>; Mon, 08 May 2023 01:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683534731; x=1686126731;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Lz4prnU5xuYjdNiPVkvAinLr8cUxavLs9H9bFD3s5E4=;
 b=VM2UvIjzOl6msa7ESuMNmHdh/XQD7CM9UKMEkbiYpBNm4ZhecF2+NVtZ0JD1++ZdVm
 smzpRlAYXQYwcCjyEmjBL5pZ6XwGJHn/ju2UshYmq+KZkAuk5/z/rwnDIOr/FaOjImcR
 rmtm4csGQSFFlsoDSOADe2gEpn1AhJeSlpBWBPIsvQ3byL337W5DTrkQ75LF87nyRMFh
 W/S1U6r/nGgE1uW118kt6zLcQw1+50/r7EpVA79Uco1SFnJL2scQFeM4twObW2NNxJEl
 f9zMf0Xv9cUJQNg6Y7YAcX/dxcMGOnWfrFVu3iioaQdLvaQQaqXi9m/9BUqhLr37K+Eb
 HgTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683534731; x=1686126731;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Lz4prnU5xuYjdNiPVkvAinLr8cUxavLs9H9bFD3s5E4=;
 b=CFmYHgy65bo7evYmKqiV5hn7CZ525+KvzmaNkGNl6pL2Ru2KijYjvd+F+msRc2VwiV
 SDHTvradu9KG7XuXP01NQE+zk+cJSWetyLfMzL2lylya9LsEGzSX2qI17rijEsgvUi8X
 s4gfXekRa9UAplxFrL/zGmbQZGjGGo0Psf2TCd+rTg9M30dM/JYqSiChjxbnG+fIdPpA
 tnUcsWTvDPwM7x0SPIGLr0jyeZTRXKYapu6D+7kZ/ltVXz+k3bMkPJa5KvK5BiN3G17R
 6VSa9CQ2SjLxiOz7xru3Xu/ccfy8qchK3c+5yhYv8fxxky0ofswDi6bTmkOaLmjHA90J
 6tqw==
X-Gm-Message-State: AC+VfDyovdIO0WeZ0lIjtlRDtIfRVBe93svWCoDSjz8Y3rn6d9vzjSiv
 DQu5bg4Lr5GLKL1kmjtzQ3eKXQ==
X-Google-Smtp-Source: ACHHUZ4/szUMQTlbn+VYeDtxgy0K4t/loQJR9Vxp7p2ce4kCYvUw7R4MnZrtXBi912JybpA3mQGDog==
X-Received: by 2002:a19:ee04:0:b0:4ed:bdac:7a49 with SMTP id
 g4-20020a19ee04000000b004edbdac7a49mr2013547lfb.54.1683534731164; 
 Mon, 08 May 2023 01:32:11 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
 by smtp.gmail.com with ESMTPSA id
 p11-20020ac246cb000000b004edc485f86bsm1219117lfo.239.2023.05.08.01.32.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 01:32:10 -0700 (PDT)
Message-ID: <f968009f-c52b-5e4c-aa79-01c0ac53b8dc@linaro.org>
Date: Mon, 8 May 2023 10:32:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230507190735.2333145-1-dmitry.baryshkov@linaro.org>
 <20230507190735.2333145-3-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230507190735.2333145-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 2/4] ARM: dts: qcom: apq8074-dragonboard:
 Set DMA as remotely controlled
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



On 7.05.2023 21:07, Dmitry Baryshkov wrote:
> Add the qcom,controlled-remotely property for the blsp2_bam
> controller node. This board requires this, otherwise the board stalls
> during the boot for some reason (most probably because TZ mishandles the
> protection error and keeps on looping somewhere inside).
> 
> Fixes: 62bc81792223 dts: msm8974: Add blsp2_bam dma node
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Looks like a common theme.. sony-rhine boards also have the DMA
enabled *and* need this property.. perhaps it's a SoC-wide (or
at least SoC-and-fw-distribution-wide) issue?

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm/boot/dts/qcom-apq8074-dragonboard.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
> index 1345df7cbd00..6b047c679370 100644
> --- a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
> +++ b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
> @@ -23,6 +23,10 @@ &blsp1_uart2 {
>  	status = "okay";
>  };
>  
> +&blsp2_dma {
> +	qcom,controlled-remotely;
> +};
> +
>  &blsp2_i2c5 {
>  	status = "okay";
>  	clock-frequency = <200000>;
