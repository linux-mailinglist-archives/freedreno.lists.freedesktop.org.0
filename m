Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F8A642C05
	for <lists+freedreno@lfdr.de>; Mon,  5 Dec 2022 16:40:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3036E10E241;
	Mon,  5 Dec 2022 15:40:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABDED10E241
 for <freedreno@lists.freedesktop.org>; Mon,  5 Dec 2022 15:40:27 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id f21so18310447lfm.9
 for <freedreno@lists.freedesktop.org>; Mon, 05 Dec 2022 07:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PhKkA5tycsJ0qFdcUE4QASrD53Au+/QL7B6lmd+GfDg=;
 b=soN1btbOUk5Z2fCDx3oXoEaXWdvTv1pLMt4eIlDrIREH/H985Y4hPdpCV2Qv4LEsjc
 oJRKzXPbzAqAbkJv4aLqv65EUbaeNMI68oFJo9afTy9L8178aoMHMVuJ2WiW4xYEzx3+
 IIPdg6LX3Mb+jZVV39+Voym3NaLX8h7wGlR1rwCUgvDaF7cRAGwH5yLwQYjCp3ciXW5l
 9fkVrnlxOd5zaPC3RTH5zGQK7jmT29dAs2SC2q4K4b3WthWB/+ZhzeA50/v66WrxQHWl
 FReFtBsLz4QwRZjqHzPg0zHCfGiYyC6G8VzHDryeyMUtiHmalV4ARwF/X3uYjatf/nwo
 bdwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PhKkA5tycsJ0qFdcUE4QASrD53Au+/QL7B6lmd+GfDg=;
 b=Jmc8jU+pHPizmr3p/9ZHaqbPOBlgCEt+ekHFEkQetA7KxgZdevDlUpiJRZ3GWKscG7
 8/8PoATulYmIRTf7Jv9QPRaBWaaVY+NVMTL9GoyWSjEdLEkYx5W/K5Qlxh4XceAKAZdL
 5AFAlcDzl1cvMY125gClpjFGobSQHTHbUOtj5m/anp2jk3ZE1/4DLaQth2d8fNOHGi6x
 2QxPKfeJTzEE6JRbd2hEKXjcKypPOVCKQdwfghS40OiT55rIounhm8P1PX5iciWCewah
 nZ2oYsAJeAKboyWgTgw2OTx27+Co93voo+5XFobo/YsAcRNnLKMGKDx/rO+z1tIh2a6l
 T/ag==
X-Gm-Message-State: ANoB5plefi5JIvhrBtoyuqLMObBc/w9dzlSJmtV5iwq7umTgG3O4NG1Q
 yLPH/aQS4jNEPjwDfxHM3l73CA==
X-Google-Smtp-Source: AA0mqf7f4CglkXZbEQxzrk+7oSKBBV1pglDSoHu4JmLPzgvKJt/bPMeqZaK8MVWgAln1AgCLEGiW7g==
X-Received: by 2002:a05:6512:1593:b0:4af:b4ac:c2d6 with SMTP id
 bp19-20020a056512159300b004afb4acc2d6mr6874873lfb.219.1670254825832; 
 Mon, 05 Dec 2022 07:40:25 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 e11-20020a19674b000000b0049adf925d00sm2159502lfj.1.2022.12.05.07.40.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Dec 2022 07:40:25 -0800 (PST)
Message-ID: <49299fbb-e6e6-a95b-ac34-e81c71607356@linaro.org>
Date: Mon, 5 Dec 2022 16:40:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221123210720.3593671-1-dmitry.baryshkov@linaro.org>
 <20221123210720.3593671-3-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221123210720.3593671-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v3 2/5] arm64: dts: qcom: sm8450: add
 display hardware devices
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

On 23/11/2022 22:07, Dmitry Baryshkov wrote:
> Add devices tree nodes describing display hardware on SM8450:
> - Display Clock Controller
> - MDSS
> - MDP
> - two DSI controllers and DSI PHYs
> 
> This does not provide support for DP controllers present on SM8450.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 283 ++++++++++++++++++++++++++-
>  1 file changed, 279 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index 8cc9f62f7645..31fcf3908b2a 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -2394,6 +2394,281 @@ camcc: clock-controller@ade0000 {
>  			status = "disabled";
>  		};
>  
> +		mdss: mdss@ae00000 {

According to:
https://lore.kernel.org/all/dfd2d1b5-4d1b-2381-ad11-5ea9e6654a55@linaro.org/

this should be "display-subsystem"

Best regards,
Krzysztof

