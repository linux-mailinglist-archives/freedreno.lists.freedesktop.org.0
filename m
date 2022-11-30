Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F240663D453
	for <lists+freedreno@lfdr.de>; Wed, 30 Nov 2022 12:21:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84D4F10E44D;
	Wed, 30 Nov 2022 11:21:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2B2510E44B
 for <freedreno@lists.freedesktop.org>; Wed, 30 Nov 2022 11:20:57 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id s8so26436946lfc.8
 for <freedreno@lists.freedesktop.org>; Wed, 30 Nov 2022 03:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p8z4N/bD53MVMrj31OH+QdwJAqTl5OmwA543jlEPLgE=;
 b=RQbKcCc3pbRTn1XcyRiu1RjlTwkKGioXyRRQtEDLoNVTHAZBAtehHzcFxw6CgZK9tN
 AjRwgiBqlfgxHOWZN7/0j3H7AipXC/xiOm/PNEilnhDkSzfvGt0J1YEzooU8UnQcEb0h
 Ol2QO4HJJELN4mieIr2elnrmpqb6TVJynsMHi0r88R3zdimfIm1MuKMVOuP2OAlCw2Hx
 +12EBpf80HdWERUj/9fvby5gZns38Z5TJvL3ebIuPFncI1uYv9dIInVu7fzPb2q4MqLU
 OuR2vKvUUrY2TX+Fc65uNkXpMPsgxpI3YAVHFiEpoh9bmObcs+AYZ5O8TfSuh9eFq6ML
 bgLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p8z4N/bD53MVMrj31OH+QdwJAqTl5OmwA543jlEPLgE=;
 b=GZA2J5TSwgojzyXipRK7r1ZymCqYmKjjdzytiqn/3jSw405KZWEnRU4y49C1VEjFRP
 3Ignj49vUX0IFkRXKEvAYcdeGC8qPgL1goLmkUx/UwD3/5+qumvOPl54Oz3fQFqUwbTr
 nVqN8RDR+CYe/kmhrtDgw9GFbeM4NwlI72qL2zFl5iBQfgZoiDXEMFll/Xue79eABnxU
 nA5igrgXg86mJg7lUP+tJ/0j5OnPcmA2Es9E81U03gsDP65Nd/jIDSGsgx4pIf51q8+g
 SH+ejkH59oemH4Z8qE0z0EkdTxLukbgIROqk3HrVJVRVhcDrM/V5QNC4tqFJ3T+UbwYI
 lCqA==
X-Gm-Message-State: ANoB5plsgrAJUyhVloovrv8wCee6xMQiAxjf9UFDh6wrJLPa2x5AEl06
 Hxi4gX0k2UOtF5Ri44qIdzwcWw==
X-Google-Smtp-Source: AA0mqf5wlmDEFG3H08ZgmA9VY97ACdqNpjQVnmj9UYjdNINlcDXeKxHUOUNrSXADPCEvy23Z/xIL0g==
X-Received: by 2002:ac2:5e70:0:b0:4ad:3f25:60f4 with SMTP id
 a16-20020ac25e70000000b004ad3f2560f4mr14578605lfr.92.1669807255818; 
 Wed, 30 Nov 2022 03:20:55 -0800 (PST)
Received: from [192.168.1.101] (95.49.125.236.neoplus.adsl.tpnet.pl.
 [95.49.125.236]) by smtp.gmail.com with ESMTPSA id
 q20-20020a056512211400b004b0317a1035sm219278lfr.109.2022.11.30.03.20.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 03:20:55 -0800 (PST)
Message-ID: <2efca01d-69b8-b96f-d351-0b68339920c7@linaro.org>
Date: Wed, 30 Nov 2022 12:20:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: Adam Skladowski <a39.skl@gmail.com>
References: <20221129204616.47006-1-a39.skl@gmail.com>
 <20221129204616.47006-13-a39.skl@gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221129204616.47006-13-a39.skl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 12/12] arm64: dts: qcom: sm6115: Fallback
 smmu to qcom generic compatible
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Thara Gopinath <thara.gopinath@gmail.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Andy Gross <agross@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, devicetree@vger.kernel.org,
 Amit Kucheria <amitk@kernel.org>, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 Sean Paul <sean@poorly.run>, Loic Poulain <loic.poulain@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 29.11.2022 21:46, Adam Skladowski wrote:
> Change fallback to qcom generic compatible
> in order to prevent reboot during SMMU initialization.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm6115.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> index 36d1cff23d10..b00d74055eb1 100644
> --- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> @@ -1222,7 +1222,7 @@ dispcc: clock-controller@5f00000 {
>  		};
>  
>  		apps_smmu: iommu@c600000 {
> -			compatible = "qcom,sm6115-smmu-500", "arm,mmu-500";
> +			compatible = "qcom,sm6115-smmu-500", "qcom,smmu-500", "arm,mmu-500";
>  			reg = <0x0c600000 0x80000>;
>  			#iommu-cells = <2>;
>  			#global-interrupts = <1>;
