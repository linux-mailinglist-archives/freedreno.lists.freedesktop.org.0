Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3BA751BE4
	for <lists+freedreno@lfdr.de>; Thu, 13 Jul 2023 10:41:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EE9910E0AA;
	Thu, 13 Jul 2023 08:41:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9609A10E0A6
 for <freedreno@lists.freedesktop.org>; Thu, 13 Jul 2023 08:41:52 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4f95bf5c493so796713e87.3
 for <freedreno@lists.freedesktop.org>; Thu, 13 Jul 2023 01:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689237708; x=1691829708;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ql1POIcuo0TsaMIUAHdPoB5L/Q0A6/AHhI/hDkQRujs=;
 b=t+TmQwgHNF5uKWW7Uxnk9AfRqeWy8tCvsF/pc9g/2NmcOXFSc5XsWxfhwihNegwkWw
 RF0LVByoXz5AUEQ+mTgX4KZvx6pvPtBijUDelJbDlWZjnEyyhx3qvgGcX6fIUzhRre4Z
 09m+mhGwvp13v7+yzxsNopin9Do4PJ3hIi8QSdYBixlUA8RFDUjH5jKG2yeVJwSMUFOj
 tpoCjwmlL2U7U+NI5fdhQ7l4ds8AjXATovxVykfPt/PAEVF7tmQm3UuwJiSzhcR8+9zs
 E4LsBecUYzDxQrDSMjArws5hTLEZ194zHYdH+lO9jK+ciz32HWh1urgUAU0dl/J4VqKW
 0AVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689237708; x=1691829708;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ql1POIcuo0TsaMIUAHdPoB5L/Q0A6/AHhI/hDkQRujs=;
 b=g9Sf9HGzn7tSNxDFoEt0ErRx58nJMA9Mj78iAH6VK87zXQUb9I7EF2X0Oll6nN38cp
 r1FDTLIC3PZa8y1u98P1zJA53czJ94u+EddSenwFDLMP5wJ25uVCworuhh0u7x0AuPEL
 tc2p2Mu+lrdYGmQuiuJke5fG7/lj0DUo9ke8ARWFYD6ppXa6x23Qk3tnmUK1hSi+/z8i
 WjnftRzT6FOf1cfsrFMwNRPpjOywrnOmTiAkYqcsG+j38sn1nCgV25dt51M78cwmuvhc
 2Sv/7qx0HYNiqgDYb6APiM2D8dDEyEo1CXk4cnaCtnFz6N2YavnXIK39MRrHPJeMDxqT
 4U2Q==
X-Gm-Message-State: ABy/qLYNnWWU3OwZ1iZUOq3oP5AlWVzMzRyNRwUsRpz4znGrmQl+DxoO
 UQ62P0zJKt0daHd1w+VsrcA55w==
X-Google-Smtp-Source: APBJJlG2UJSxl2mpB4gj51oF6BFqZoTDX7kP9XHcu2MhIIGhV4rZTmSm0W8uOG4QvddLOulBKjPzbw==
X-Received: by 2002:ac2:5290:0:b0:4fb:7b2a:78de with SMTP id
 q16-20020ac25290000000b004fb7b2a78demr708934lfm.45.1689237707997; 
 Thu, 13 Jul 2023 01:41:47 -0700 (PDT)
Received: from [192.168.1.101] (abyl63.neoplus.adsl.tpnet.pl. [83.9.31.63])
 by smtp.gmail.com with ESMTPSA id
 f22-20020ac25336000000b004fba6f38f87sm1027447lfh.24.2023.07.13.01.41.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jul 2023 01:41:47 -0700 (PDT)
Message-ID: <9587baf4-2316-494d-fbd1-73a86e742741@linaro.org>
Date: Thu, 13 Jul 2023 10:41:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230712121145.1994830-1-dmitry.baryshkov@linaro.org>
 <20230712121145.1994830-9-dmitry.baryshkov@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230712121145.1994830-9-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 8/8] arm64: dts: qcom: sm8450: provide
 MDSS cfg interconnect
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

On 12.07.2023 14:11, Dmitry Baryshkov wrote:
> Add support for the MDSS cfg-cpu bus vote on the SM8450 platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index 595533aeafc4..0b01f3027ee3 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -13,6 +13,7 @@
>  #include <dt-bindings/mailbox/qcom-ipcc.h>
>  #include <dt-bindings/phy/phy-qcom-qmp.h>
>  #include <dt-bindings/power/qcom-rpmpd.h>
> +#include <dt-bindings/interconnect/qcom,icc.h>
>  #include <dt-bindings/interconnect/qcom,sm8450.h>
>  #include <dt-bindings/soc/qcom,gpr.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
> @@ -2672,8 +2673,12 @@ mdss: display-subsystem@ae00000 {
>  
>  			/* same path used twice */
>  			interconnects = <&mmss_noc MASTER_MDP_DISP 0 &mc_virt SLAVE_EBI1_DISP 0>,
> -					<&mmss_noc MASTER_MDP_DISP 0 &mc_virt SLAVE_EBI1_DISP 0>;
> -			interconnect-names = "mdp0-mem", "mdp1-mem";
> +					<&mmss_noc MASTER_MDP_DISP 0 &mc_virt SLAVE_EBI1_DISP 0>,
> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
Looking at icc_set_tag occurences in msm-5.10/techpack/display,
I *think* active-only is only possible for the data bus (MDP-EBI)

Moreover, I think Linux is supposed to cast MDSS votes through the
APPS RSC (so, nodes without _DISP [1][2]) and conversely, DISP_RSC is
supposed to active-only votes

Konrad

[1] not that it matters today because it's not implemented yet
[2] https://lore.kernel.org/linux-arm-msm/20230708-topic-rpmh_icc_rsc-v1-0-b223bd2ac8dd@linaro.org

> +			interconnect-names = "mdp0-mem",
> +					     "mdp1-mem",
> +					     "cpu-cfg";
>  
>  			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
>  
