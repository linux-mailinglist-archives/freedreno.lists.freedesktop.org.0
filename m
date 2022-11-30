Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A245A63D42F
	for <lists+freedreno@lfdr.de>; Wed, 30 Nov 2022 12:17:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52AE510E446;
	Wed, 30 Nov 2022 11:17:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD20210E060
 for <freedreno@lists.freedesktop.org>; Wed, 30 Nov 2022 11:17:41 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id d3so20513718ljl.1
 for <freedreno@lists.freedesktop.org>; Wed, 30 Nov 2022 03:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DghhzdLC70p88Ph3mhaw98h7VRYL9qUr3MH4/vlNzpU=;
 b=pk2KRXvukRhqgVJJ2HWK9+/xZSC8gf1lZmcPUA7LHq5GXsNg6AGRRUS4lRYB6yRxPX
 SxFOIYM3+sncwsmGoDUpXXdWiA+zE5JtPKkqOpFGaOThZ3lfUNm6lHaPxIP9sheMaFgi
 G/iAZWe/ZM/w8hEvpd5in4w6pZU4clr0BxvT4e1XZ5bTcZ+Sz6Qj+xTz9Od2n1SetIvS
 xTK1MBgKxc2kyS+heZJDRA2FklCoYpNnIWYPwFi4Ep4DZd9uJCEkObi0HGpXQV4oGYqu
 qFz4MXJlIk2dq12cfnEiidPD4InWa/WW1fng7QEU7ZcgpZ+EHVlkevvXXVk4CmGNjCdo
 /0oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DghhzdLC70p88Ph3mhaw98h7VRYL9qUr3MH4/vlNzpU=;
 b=wQVHLTNAefMxc+BfVr3/67f0NAraCQDiKwDY8lUXuSBNeLKDWNDJPX1O3jCn/bNYUy
 9tY3lTu7doENu1p9zHpe/KZrSmMt6NxkuXcbfcXBD9SKvtWUFZibL3t12jqsBtnJny9B
 OWcLma7AvJ0J1VfNbF/HRh6dq778C8kjM9+aqTkLO4zSJYu7LZRjkZCMItB5v0wjCG3H
 49zlGG/roQsJYU9mcvrmqK5VCwFnSdjyC19hcRm3/Uha5QjILKSQwp7CTLaZtvZdsxzK
 B7/SSISUNKW1hLPegRxviCM0wY7eOffFjNcZsDpvyQLt1ZMUVIywSlj46zB/1KQHQcBw
 Xy7g==
X-Gm-Message-State: ANoB5pl0JlxMSwt8yt3+wh9JGjzgSwYAQQzztiYobIV5ZQ8+2U/tXHhz
 QPZKGRzDi8g2iiqKb0sJWWs72g==
X-Google-Smtp-Source: AA0mqf7FAZUmUwdxZIfnK1o0qwCU14VpcIfdB0vtB8H9/H3zj6Ulagqt8uLHVWQ63VwAvOGTlNU2hQ==
X-Received: by 2002:a2e:9c4e:0:b0:26e:2bda:1821 with SMTP id
 t14-20020a2e9c4e000000b0026e2bda1821mr14090758ljj.241.1669807060137; 
 Wed, 30 Nov 2022 03:17:40 -0800 (PST)
Received: from [192.168.1.101] (95.49.125.236.neoplus.adsl.tpnet.pl.
 [95.49.125.236]) by smtp.gmail.com with ESMTPSA id
 s22-20020a056512315600b0049ade93ad24sm218501lfi.156.2022.11.30.03.17.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 03:17:37 -0800 (PST)
Message-ID: <f508a01d-55e3-259b-d648-7125a2606c96@linaro.org>
Date: Wed, 30 Nov 2022 12:17:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: Adam Skladowski <a39.skl@gmail.com>
References: <20221129204616.47006-1-a39.skl@gmail.com>
 <20221129204616.47006-7-a39.skl@gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221129204616.47006-7-a39.skl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 06/12] arm64: dts: qcom: sm6115: Add
 rpm-stats node
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
> Add rpm stats node.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm6115.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> index 04620c272227..6d14bbcda9d3 100644
> --- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> @@ -538,6 +538,11 @@ rpm_msg_ram: sram@45f0000 {
>  			reg = <0x045f0000 0x7000>;
>  		};
>  
> +		sram@4690000 {
> +			compatible = "qcom,rpm-stats";
> +			reg = <0x04690000 0x10000>;
> +		};
> +
>  		sdhc_1: mmc@4744000 {
>  			compatible = "qcom,sm6115-sdhci", "qcom,sdhci-msm-v5";
>  			reg = <0x04744000 0x1000>, <0x04745000 0x1000>, <0x04748000 0x8000>;
