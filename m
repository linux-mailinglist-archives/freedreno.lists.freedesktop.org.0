Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF1E63D423
	for <lists+freedreno@lfdr.de>; Wed, 30 Nov 2022 12:17:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9332910E060;
	Wed, 30 Nov 2022 11:17:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00FFF10E24C
 for <freedreno@lists.freedesktop.org>; Wed, 30 Nov 2022 11:17:03 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id z24so20495528ljn.4
 for <freedreno@lists.freedesktop.org>; Wed, 30 Nov 2022 03:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=93Fl7WiTCHJeIgakKDaYI1Qsq+II/EWb0Q1aTHCr7pA=;
 b=uL1Ic/P3fR5OXGJkEoD9BOkPINXKzVlvBXwRHreFGxX7vqQdYxlkqKhKU46HMaQ4SS
 9r/5h+zENHT7VKjhFy3k62I2oHurEg7Yy6DT6kKIiQpFad9GZLPzTJr3cVBVLqi5R5wv
 0/JSe2TJaa2kuX10sIjQ3u0bbU2S4ydAZsOByR2JNemAcPUbNVCdt/IalgIKjOaaYjY1
 HWKSZMOXfqvkSwuPCTcNMYXwVEBXljjoiR/8xSDxDYHEsH5K0cyLB2mRunlXz0JtZipQ
 iQesDJwc6oMQGp4UT9hQgTX5wk8LkCogzzqef2SiQHY7EBXY9qxMTbmjDwee+66MgliN
 9kcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=93Fl7WiTCHJeIgakKDaYI1Qsq+II/EWb0Q1aTHCr7pA=;
 b=OOkky8pDab7J8npB0ciPN3z+yMxTNb5lnUQinZ2Tkis6/+HZo/D1pwT2Yd4Q9eMq07
 yIGNC4LkNRL89/k4/94bfjr6FXGDQOvao2TiYHZN9Uh3OZJooze1qtDBARfIZpA/ckYT
 /GQPHABIwnefA4qt3waxQP6cFK6x3NTE3TpvuYseSWNZIuCBagMvmREjSERY5yXsDtMb
 nfEja0dYwW1uruQFDf17Yjn+yOAh2AqYYJto4kPUgexYdDDOFrKI2DfRTRwlUqIp+HJL
 mE37zuOSkaqjKWMOxCBnVllKXZs97O/z/nhrmsh0Tm4UQj2SR4s6xSemjCK3KPhTNmHx
 yBpA==
X-Gm-Message-State: ANoB5pktR4dpIARYPO5HlGBKp/MirVXV2FHmCgxqENTIRJdqVZ+RKbWx
 GzjM0w8yIJbH+2+5vS128pg2Rw==
X-Google-Smtp-Source: AA0mqf72zkzsX2t1JV2GlLC/Mt2x0wSRYPI7aozVNCnP7S0yBQycAUQytTfBHQ3TV8fKZr6qfgmiUA==
X-Received: by 2002:a05:651c:158c:b0:26c:90f:f8fe with SMTP id
 h12-20020a05651c158c00b0026c090ff8femr20603495ljq.2.1669807022044; 
 Wed, 30 Nov 2022 03:17:02 -0800 (PST)
Received: from [192.168.1.101] (95.49.125.236.neoplus.adsl.tpnet.pl.
 [95.49.125.236]) by smtp.gmail.com with ESMTPSA id
 q15-20020a2e914f000000b0027706d22878sm104656ljg.94.2022.11.30.03.16.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 03:17:01 -0800 (PST)
Message-ID: <8a57c06c-e755-c298-a9d6-3f2a431b3f5d@linaro.org>
Date: Wed, 30 Nov 2022 12:16:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: Adam Skladowski <a39.skl@gmail.com>
References: <20221129204616.47006-1-a39.skl@gmail.com>
 <20221129204616.47006-5-a39.skl@gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221129204616.47006-5-a39.skl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 04/12] arm64: dts: qcom: sm6115: Add TSENS
 node
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
> Add nodes required for TSENS block using the common qcom,tsens-v2 binding.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm6115.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> index 2003a2519a54..decbf7ca8a03 100644
> --- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> @@ -515,6 +515,17 @@ spmi_bus: spmi@1c40000 {
>  			#interrupt-cells = <4>;
>  		};
>  
> +		tsens0: thermal-sensor@4410000 {
> +			compatible = "qcom,sm6115-tsens", "qcom,tsens-v2";
> +			reg = <0x04411000 0x1ff>, /* TM */
> +			      <0x04410000 0x8>; /* SROT */
> +			#qcom,sensors = <16>;
> +			interrupts = <GIC_SPI 275 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "uplow", "critical";
> +			#thermal-sensor-cells = <1>;
> +		};
> +
>  		rpm_msg_ram: sram@45f0000 {
>  			compatible = "qcom,rpm-msg-ram";
>  			reg = <0x045f0000 0x7000>;
