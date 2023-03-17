Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 023D76BE913
	for <lists+freedreno@lfdr.de>; Fri, 17 Mar 2023 13:19:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68AD710E366;
	Fri, 17 Mar 2023 12:19:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F13BF10E366
 for <freedreno@lists.freedesktop.org>; Fri, 17 Mar 2023 12:19:53 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id br6so6207746lfb.11
 for <freedreno@lists.freedesktop.org>; Fri, 17 Mar 2023 05:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679055592;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=621ABpoi5KgPunSWjk55F8jRowzyF4/iYlPhbyE1p3k=;
 b=Tcz6A375PBqbDYHy74MKAPAIlPZ1jemPuQr4I6n8D2OO3pIV62Z/hGSGxZAt2tem3o
 PNdlhA0pksXg2VtFM4TOuFuJGf3TuQHMIhA1jhGQ+KfM3LCKL1oFGu4bRigcfll36cMA
 rGmTIgzNEuz53ZbWOtBwmdIY9q/ZRxrgbzLDwXPlLfi2J9M1Xd+Df26AZLY5cQXJm/Fr
 i5ApGdtUxPCQbq0PzSXsLLErCEZ2KMJoFempeASZUoz97tvZAPa+JqccFaza9CbjUgEM
 nT3UKhbxfQeWvlZmXyHDJMUi6MjBaTNSyOgbFgluMct7G//tJ+rCLjQDmlOcLWBRA1YG
 VkMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679055592;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=621ABpoi5KgPunSWjk55F8jRowzyF4/iYlPhbyE1p3k=;
 b=fUyLMmDGIDQzYNf6S4yqA+8HknCPYdBtlgtxI2aT4PSL/6ZzMQEa1UTCQaZ1mWZxJ7
 eYpyB0lbnyLU9MREHFsiJY7xXYIElEy6x3SQgT2tVSBirSPmYcHMBevmtnXqB1hXHGZO
 Z9L0VC4lLLxMbc4o/r4I2dpYOB91FtlTz9gqxP6BAnpNUrm+mzr2fQEZzM5U4VZ9ii0/
 fYJMeDajli4wO+UyI34A9kd+eQWibk/S1JlEVptpWNRYhaLbGVua3JbNUCq/bRd5wlZj
 HTCTtWrpeF4pibkKwzZubjjTAIdNg4d+arnsUceddbEDvNNY50tiPot85e4jB5sRud+E
 siRA==
X-Gm-Message-State: AO0yUKVQ1f+v6tgv5H9XX664XXYEYQn2UN561EyvtgTd2jqB298ZIueS
 8sUVXOiwzA2VkiumcwrkBEY9DxandFk3GpdN00Co48Z1
X-Google-Smtp-Source: AK7set9ad5XRcgl5xT0h9V0R6N2FtgL3FB9Rbklyz6pXbnXEyTKtGoy/nJkE4hVrwMTiEM4xVHG/Aw==
X-Received: by 2002:a19:ac02:0:b0:4d7:4826:3192 with SMTP id
 g2-20020a19ac02000000b004d748263192mr882384lfc.5.1679055591940; 
 Fri, 17 Mar 2023 05:19:51 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 v2-20020ac25602000000b004a0589786ddsm344236lfd.69.2023.03.17.05.19.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Mar 2023 05:19:51 -0700 (PDT)
Message-ID: <30b349bd-c083-ed17-1e20-c84e4b67d449@linaro.org>
Date: Fri, 17 Mar 2023 14:19:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-GB
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20230206-topic-sm8450-upstream-dp-controller-v5-0-a27f1b26ebe8@linaro.org>
 <20230206-topic-sm8450-upstream-dp-controller-v5-5-a27f1b26ebe8@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230206-topic-sm8450-upstream-dp-controller-v5-5-a27f1b26ebe8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v5 5/5] arm64: dts: qcom: sm8450: add dp
 controller
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 17/03/2023 11:12, Neil Armstrong wrote:
> Add the Display Port controller subnode to the MDSS node.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8450.dtsi | 79 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 79 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index 0b5a151ce138..41f5015e615b 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -2751,6 +2751,13 @@ dpu_intf2_out: endpoint {
>   						};
>   					};
>   
> +					port@2 {
> +						reg = <2>;
> +						dpu_intf0_out: endpoint {
> +							remote-endpoint = <&mdss_dp0_in>;
> +						};
> +					};
> +
>   				};
>   
>   				mdp_opp_table: opp-table {
> @@ -2783,6 +2790,78 @@ opp-500000000 {
>   				};
>   			};
>   
> +			mdss_dp0: displayport-controller@ae90000 {
> +				compatible = "qcom,sm8450-dp", "qcom,sm8350-dp";
> +				reg = <0 0xae90000 0 0x200>,
> +				      <0 0xae90200 0 0x200>,
> +				      <0 0xae90400 0 0xc00>,
> +				      <0 0xae91000 0 0x400>,
> +				      <0 0xae91400 0 0x400>;
> +				interrupt-parent = <&mdss>;
> +				interrupts = <12>;
> +				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
> +				clock-names = "core_iface",
> +					      "core_aux",
> +					      "ctrl_link",
> +			                      "ctrl_link_iface",
> +					      "stream_pixel";
> +
> +				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
> +						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
> +				assigned-clock-parents = <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
> +							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
> +
> +				phys = <&usb_1_qmpphy QMP_USB43DP_DP_PHY>;
> +			        phy-names = "dp";
> +
> +			        #sound-dai-cells = <0>;
> +
> +				operating-points-v2 = <&dp_opp_table>;
> +				power-domains = <&rpmhpd SM8450_MMCX>;
> +
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						mdss_dp0_in: endpoint {
> +							remote-endpoint = <&dpu_intf0_out>;
> +						};
> +					};
> +				};
> +
> +				dp_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +
> +					opp-19200000 {
> +						opp-hz = /bits/ 64 <19200000>;
> +						required-opps = <&rpmhpd_opp_low_svs>;
> +					};

Yes, the vendor kernel has 19.2 MHz as a frequency for the low_svs. 
However I don't think we should do it this way, we list DP rates here, 
so the lowest entry should be RBR, 160000000.

> +
> +					opp-270000000 {
> +						opp-hz = /bits/ 64 <270000000>;
> +						required-opps = <&rpmhpd_opp_svs>;
> +					};
> +
> +					opp-540000000 {
> +						opp-hz = /bits/ 64 <540000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};
> +
> +					opp-810000000 {
> +						opp-hz = /bits/ 64 <810000000>;
> +						required-opps = <&rpmhpd_opp_nom>;
> +					};
> +				};
> +			};
> +
>   			mdss_dsi0: dsi@ae94000 {
>   				compatible = "qcom,sm8450-dsi-ctrl", "qcom,mdss-dsi-ctrl";
>   				reg = <0 0x0ae94000 0 0x400>;
> 

-- 
With best wishes
Dmitry

