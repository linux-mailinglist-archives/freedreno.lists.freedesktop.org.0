Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E916FA244
	for <lists+freedreno@lfdr.de>; Mon,  8 May 2023 10:31:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D650510E174;
	Mon,  8 May 2023 08:31:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19D7A10E176
 for <freedreno@lists.freedesktop.org>; Mon,  8 May 2023 08:31:01 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4f139de8cefso26421575e87.0
 for <freedreno@lists.freedesktop.org>; Mon, 08 May 2023 01:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683534659; x=1686126659;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Bj0Lw2kox19ii2BM01KlnNMvqL1S4dwAiyFt2I0KjpM=;
 b=JZGSLHB9MIYiGCrQCgu4CqzDve0wTy93hMJVCfnNsIg1e/oqMnEnuKZEjGWR7bs7cw
 wfJ8mC5hmtQJMzFIerLt205IFxVfsoCteL9MbnHixWLjRat8FN3FHeByYWulJI5nse+n
 XVxWvVrQgdCTXGXQPid3/2FfcJopHt43b38my1vwvUf01TJiN1YjXn+q37RSFi4TYAO9
 aDNST8R5MPSiSCKGwws5Qi3bGUiXg+rLaRFlhpUHLtrTpmX3YA1zcsW6vm6FOoXFlgna
 EWO8+OU0NAQaJXsDR6KfFam/VKu2N9I98M/8QewTteeTKYONYftaD56MxhGplbAFkQwV
 wHVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683534659; x=1686126659;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Bj0Lw2kox19ii2BM01KlnNMvqL1S4dwAiyFt2I0KjpM=;
 b=WMY/BTG4kyIe1EiiAhIG5F6hiGBW7S8l6RMsYCOYCE9B7FcAqXJI+jnUl6rZJFyBVG
 +JzwdlMMYXhDPQP1BCll4xEyEinf7/odfGaOrRs3IvwG9RBsUEAzfrOZpPPhVecilakM
 PlSizAF2qhCMWJdmmCC4x7Cci2pBiCUVB8Uzi8Jwv4jE+AJBF1oC77LobIe4WkrMNDLD
 fbGy9GlgFm0x9p80k7PckawzdDly/4G7WpD862mQE6I7KGAwwxdhxOfXAVaeMLlnNo6r
 +Ou3/j3E2hbj9eo7Dg/aEsV5t3B/2TFsSBsvcs0AgZBKrSmDBWtzV2raxjJqUS2Tkb5Z
 tJmw==
X-Gm-Message-State: AC+VfDyD4kE9h7+JP/CEfjearINSD4Ir9s+gVJ+5fVVzeM3mIf5vp5vf
 fS9G9g3mqr4RMl9++3sKfhdSxA==
X-Google-Smtp-Source: ACHHUZ6d24zxoVca00fKR8vFgULu7VtObta6oV9gpaKWuTbbc7CK6t+VDpL4OjXEIRruPoM0kJT4+A==
X-Received: by 2002:a19:f00d:0:b0:4ee:dc5a:42f7 with SMTP id
 p13-20020a19f00d000000b004eedc5a42f7mr2907935lfc.24.1683534658808; 
 Mon, 08 May 2023 01:30:58 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
 by smtp.gmail.com with ESMTPSA id
 a17-20020a19f811000000b004f13634da05sm1215359lff.180.2023.05.08.01.30.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 01:30:58 -0700 (PDT)
Message-ID: <8cdecc51-2a42-4b82-9eb3-2ab77860c5d4@linaro.org>
Date: Mon, 8 May 2023 10:30:56 +0200
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
 <20230507190735.2333145-2-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230507190735.2333145-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 1/4] ARM: dts: qcom: msm8974: add ocmem
 clock to GPU
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
> To get GPU working with the OCMEM, the oxili_ocmemgx_clk clock should be
> enabled. Pass it to the GPU to get it to work on apq8074/msm8974 boards.
> 
> Fixes: fe079442db63 ("ARM: dts: qcom: msm8974: add gpu support")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Uhh.. this clock should be managed by RPM with:

type = MEM
id = 2

just like it's defined for 8994 today.

Could you try adding it in rpmcc and confirming?

Konrad
>  arch/arm/boot/dts/qcom-msm8974.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
> index 834ad95515b1..fb661c1bd3d5 100644
> --- a/arch/arm/boot/dts/qcom-msm8974.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
> @@ -2104,8 +2104,9 @@ gpu: adreno@fdb00000 {
>  
>  			clocks = <&mmcc OXILI_GFX3D_CLK>,
>  				 <&mmcc OXILICX_AHB_CLK>,
> +				 <&mmcc OXILI_OCMEMGX_CLK>,
>  				 <&mmcc OXILICX_AXI_CLK>;
> -			clock-names = "core", "iface", "mem_iface";
> +			clock-names = "core", "iface", "mem", "mem_iface";
>  
>  			sram = <&gmu_sram>;
>  			power-domains = <&mmcc OXILICX_GDSC>;
