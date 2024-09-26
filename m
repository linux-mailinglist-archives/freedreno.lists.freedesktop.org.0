Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 615CC987440
	for <lists+freedreno@lfdr.de>; Thu, 26 Sep 2024 15:12:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EBA210EB3A;
	Thu, 26 Sep 2024 13:12:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DbxvjvEm";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0220C10EB3A
 for <freedreno@lists.freedesktop.org>; Thu, 26 Sep 2024 13:12:16 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2f77be8ffecso10940981fa.1
 for <freedreno@lists.freedesktop.org>; Thu, 26 Sep 2024 06:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727356335; x=1727961135; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=nKriAI4eZkRaHODPjuZ+jj+F+rk5iOr07UhYYqdkBLg=;
 b=DbxvjvEmP66qxdbnPoczcY1dwg4JHqyZa/USvGjkq4+eWj9Q3mshuAfZGH7tG7HBwr
 iMavcPGy0fhN3V8H7BwAjKzKG7bM0N5CozvOAdnSaIfE0X941HGz0Jyd6VJ5IHvbeYZw
 h9ss614AHKI3J5+IcqR4mN3RQOZem3BKgxGcXTpjXHjM1CiODWbQ4VfWQV5CVffBFiqS
 bAJilNxaHG0kZOQ+O+1YSLt255Iu0sNYStjdnrWYht/0QJJ9RN9spbhIXQAWl72ZB6GF
 Ipr1hDUCcD/9C6vs3g1apnzOHu3c0fNmD1H+S6W1Zbv/gb1FI3AsbFSFudGWsvBfEB9x
 /Nbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727356335; x=1727961135;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nKriAI4eZkRaHODPjuZ+jj+F+rk5iOr07UhYYqdkBLg=;
 b=aAnEe92tNjE2GsrpRfKq6SXT0dvntTpyfbiMu9z6nYN5uy1A3X4GNt0LgYmgK1aKQ6
 quLKngz7hPDUt2kucXwEyGqTiIhNyKOd0fBCXU1Zw3uqgp6ZtY8Y8lJDfOa+Yj8gBMsc
 Wp3pWwIY8h0JNC0hXlSYCrTvZohibKu4SEvmQB/SMLqGQUyXWBN9nP1SUIP18QFW5pVG
 FbBGAy2NSNPhY3CL7jUO6PUm3NkC0DGoJNd71uvZtqE7gDu5nl/kPQ4UBWso429g43qB
 myMhuJJZmH+Ai4di6+y8ylCkF1/cm/zfQ+xRgn7lvuJsqNy7nFrbMMX1AINc2yd8xSbd
 V2RQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW81zjx0dyPualVUFZRdpScAiRLIQ7Mc38587EqzxdqWRdwoJ3wX3wKc+nFyYJUBJDS5ui/u2zr7w4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxekAcCiKpgXffIC0AKhvlRttbX4YSsO9I7lWVBh0oOglsPGkR7
 wXmrqJ5KKukDWqjRvL/UUY/1vpiGCa51edB+xFN3LCoN0S6yq53c2URN7nj9RBE=
X-Google-Smtp-Source: AGHT+IEdvfytwo17gCgvymeEaRhz2m8Z7wR8D5FYIwCXKva9/v1xhvvhMLWRmcQBnqRRYBVmBQbL8g==
X-Received: by 2002:a05:651c:50f:b0:2f6:62c3:4e0e with SMTP id
 38308e7fff4ca-2f914ac3ff9mr40894901fa.6.1727356334934; 
 Thu, 26 Sep 2024 06:12:14 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f8d289b54bsm7832621fa.109.2024.09.26.06.12.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 06:12:13 -0700 (PDT)
Date: Thu, 26 Sep 2024 16:12:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Mahadevan <quic_mahap@quicinc.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
 marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, swboyd@chromium.org, 
 konrad.dybcio@linaro.org, danila@jiaxyga.com, bigfoot@classfun.cn, 
 neil.armstrong@linaro.org, mailingradian@gmail.com, quic_jesszhan@quicinc.com, 
 andersson@kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 quic_kalyant@quicinc.com, quic_jmadiset@quicinc.com, quic_vpolimer@quicinc.com
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: sa8775p: add display dt nodes
Message-ID: <hyhsyl43xurr25ws2blejxbyae47a73f77hnjmjql3jwcpocvk@565kpktxs2fi>
References: <20240926110137.2200158-1-quic_mahap@quicinc.com>
 <20240926110137.2200158-6-quic_mahap@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926110137.2200158-6-quic_mahap@quicinc.com>
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, Sep 26, 2024 at 04:31:37PM GMT, Mahadevan wrote:
> Add mdss0 and mdp devicetree nodes for sa8775p target.
> 
> Signed-off-by: Mahadevan <quic_mahap@quicinc.com>
> 
> ---
> 
> This patch depends on the clock enablement change:
> https://lore.kernel.org/all/20240816-sa8775p-mm-v3-v1-0-77d53c3c0cef@quicinc.com/
> 
> ---
> 
> [v2]
> - Update commit message mentioning enablement of mdss0 only is done. [Dmitry]

It doesn't

> - Add resets node and fix indentation. [Dmitry]
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 87 +++++++++++++++++++++++++++
>  1 file changed, 87 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index 93be4683a31f..27ab1921c1f3 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -6,6 +6,7 @@
>  #include <dt-bindings/interconnect/qcom,icc.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
> +#include <dt-bindings/clock/qcom,sa8775p-dispcc.h>
>  #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
>  #include <dt-bindings/clock/qcom,sa8775p-gpucc.h>
>  #include <dt-bindings/interconnect/qcom,sa8775p-rpmh.h>
> @@ -2937,6 +2938,92 @@ camcc: clock-controller@ade0000 {
>  			#power-domain-cells = <1>;
>  		};
> 
> +		mdss0: display-subsystem@ae00000 {
> +			compatible = "qcom,sa8775p-mdss";
> +			reg = <0x0 0x0ae00000 0x0 0x1000>;
> +			reg-names = "mdss";
> +
> +			/* same path used twice */
> +			interconnects = <&mmss_noc MASTER_MDP0 0 &mc_virt SLAVE_EBI1 0>,
> +					<&mmss_noc MASTER_MDP1 0 &mc_virt SLAVE_EBI1 0>,

QCOM_ICC_TAG_ACTIVE_ONLY ?

> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
> +			interconnect-names = "mdp0-mem",
> +					     "mdp1-mem",
> +					     "cpu-cfg";
> +
> +			resets = <&dispcc0 MDSS_DISP_CC_MDSS_CORE_BCR>;
> +
> +			power-domains = <&dispcc0 MDSS_DISP_CC_MDSS_CORE_GDSC>;
> +
> +			clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
> +				 <&gcc GCC_DISP_HF_AXI_CLK>,
> +				 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_CLK>;
> +
> +			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +
> +			iommus = <&apps_smmu 0x1000 0x402>;
> +
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +
> +			status = "disabled";
> +
> +			mdss0_mdp: display-controller@ae01000 {
> +				compatible = "qcom,sa8775p-dpu";
> +				reg = <0x0 0x0ae01000 0x0 0x8f000>,
> +				      <0x0 0x0aeb0000 0x0 0x2008>;
> +				reg-names = "mdp", "vbif";
> +
> +				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
> +					 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
> +					 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_LUT_CLK>,
> +					 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_CLK>,
> +					 <&dispcc0 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
> +				clock-names = "bus",
> +					      "iface",
> +					      "lut",
> +					      "core",
> +					      "vsync";
> +
> +				assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
> +				assigned-clock-rates = <19200000>;
> +
> +				operating-points-v2 = <&mdss0_mdp_opp_table>;
> +				power-domains = <&rpmhpd RPMHPD_MMCX>;
> +
> +				interrupt-parent = <&mdss0>;
> +				interrupts = <0>;
> +
> +				mdss0_mdp_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +
> +					opp-375000000 {
> +						opp-hz = /bits/ 64 <375000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};
> +
> +					opp-500000000 {
> +						opp-hz = /bits/ 64 <500000000>;
> +						required-opps = <&rpmhpd_opp_nom>;
> +					};
> +
> +					opp-575000000 {
> +						opp-hz = /bits/ 64 <575000000>;
> +						required-opps = <&rpmhpd_opp_turbo>;
> +					};
> +
> +					opp-650000000 {
> +						opp-hz = /bits/ 64 <650000000>;
> +						required-opps = <&rpmhpd_opp_turbo_l1>;
> +					};
> +				};
> +			};
> +		};
> +
>  		dispcc0: clock-controller@af00000 {
>  			compatible = "qcom,sa8775p-dispcc0";
>  			reg = <0x0 0x0af00000 0x0 0x20000>;
> --
> 2.34.1
> 

-- 
With best wishes
Dmitry
