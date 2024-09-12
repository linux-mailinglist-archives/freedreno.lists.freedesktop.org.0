Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6139763C1
	for <lists+freedreno@lfdr.de>; Thu, 12 Sep 2024 10:00:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9D8610EAF7;
	Thu, 12 Sep 2024 08:00:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="d/ZpzBFq";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C049010EAF3
 for <freedreno@lists.freedesktop.org>; Thu, 12 Sep 2024 08:00:40 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5365aa568ceso832275e87.0
 for <freedreno@lists.freedesktop.org>; Thu, 12 Sep 2024 01:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726128039; x=1726732839; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5modn5x5ktb92R2/Sf1154fPo8VvDbqrTciHNWoobzQ=;
 b=d/ZpzBFqnSYDkVl+y8RQW/GESGZrr/xsJ/gWY4TO7bgh1XRpxoGZjQ8u0DrcLRsNQQ
 I4BSxJ6E3JMgyns7W7QxHG/wmn5j9isu/akC6UGdkmbQruedJ7noOM3W03w5ObPA6Ry0
 KuF2HyddZHqQt7tDJLig4cjEHD1E4Q2/SQGw2Gn5Sj87p2eU9KumOJ/O9xpMhYADtTDS
 txW+9e/ujmyZEu5sj02QdnDUVo6fLiQtNFtmmbnfhvwQ4Y3jnzBkR+s6kkBb3gXaL+BK
 9ANxhJlvFiI1zHoOGal2Cqrt+r8K4Y5XR9BA4DK8AIYwxXRsdwXsC6Ki9rkd87qTYKfT
 2GSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726128039; x=1726732839;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5modn5x5ktb92R2/Sf1154fPo8VvDbqrTciHNWoobzQ=;
 b=ka36ZOiMP3bWT89jWJxITJehGY5Pm+RSH2tIDfSV3PsMhicnkRFvPJT5rCAAZErxFX
 Kuiek6PXuRHcyDHR+ua8OzsrdIN/Y/BNmF0C/pntT4OsdQG0IqqHWNP0Yb8ICWstVsBj
 Qqr1gJsCk+m4wpkvtQpCtFFp7hKQ3fVyVV/JGD6ylJnnhz5Uf7ICd1fXhq3yfVqgBVBF
 6DVSR52/E7plGE0tI3pbAEA3LmdKW45fnOy/VVRyLK4ebbRnMjhBhuSNdWYDl7bbLrxY
 v0VpAv3GiwvDOjR0mlri09/eE8i0Mq6EXx6SBE6EBs1OoFMwR+U76WweWb7nmtJ7L3R2
 AbAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmq+yuMq/f0a6T6t8mEvx+Z1tKDV083h2h8SyXeRitCTwKkaA5IJ9a/s8c6mC6ASnK4ivtS2jx5nw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywo/s5N46XUkdpqBr3QAYgarqkXHOLFMzyMugfXjee37ha+yJuW
 3PrL4zt/eBgKdQBANgc47OymJ0h+oWBOeWzDKEuN3tUm0R84wpvUZ3iIAKiKHEg=
X-Google-Smtp-Source: AGHT+IHahBSHVXIeldwwf3pO17r+LD9jwU2Se1YwQ3QQIuNHAGAmDpStfbv4s0gMC389h59Yw6vybA==
X-Received: by 2002:a05:6512:3b22:b0:536:741a:6bc5 with SMTP id
 2adb3069b0e04-53678fab49dmr1746967e87.12.1726128037823; 
 Thu, 12 Sep 2024 01:00:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5365f8cb73esm1831653e87.174.2024.09.12.01.00.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 01:00:37 -0700 (PDT)
Date: Thu, 12 Sep 2024 11:00:35 +0300
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
Subject: Re: [PATCH 5/5] arm64: dts: qcom: sa8775p: add display dt nodes
Message-ID: <kxxcjrqndc2qzmexn4mm4vmfugfo23y63aa6oyia3uiwpe3arr@sbvdni2f2hq2>
References: <20240912071437.1708969-1-quic_mahap@quicinc.com>
 <20240912071437.1708969-6-quic_mahap@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912071437.1708969-6-quic_mahap@quicinc.com>
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

On Thu, Sep 12, 2024 at 12:44:37PM GMT, Mahadevan wrote:
> Add mdss and mdp DT nodes for SA8775P.
> 
> Signed-off-by: Mahadevan <quic_mahap@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 85 +++++++++++++++++++++++++++
>  1 file changed, 85 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index 67ba124d20f8..d5d8e02fdb29 100644
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
> @@ -2937,6 +2938,90 @@ camcc: clock-controller@ade0000 {
>  			#power-domain-cells = <1>;
>  		};
>  
> +		mdss0: display-subsystem@ae00000 {

Is there going to be mdss1?

> +			compatible = "qcom,sa8775p-mdss";
> +			reg = <0x0 0x0ae00000 0x0 0x1000>;
> +			reg-names = "mdss";
> +
> +			/* same path used twice */
> +			interconnects = <&mmss_noc MASTER_MDP0 0 &mc_virt SLAVE_EBI1 0>,
> +					<&mmss_noc MASTER_MDP1 0 &mc_virt SLAVE_EBI1 0>,
> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
> +			interconnect-names = "mdp0-mem",
> +					     "mdp1-mem",
> +					     "cpu-cfg";
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
> +					<&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
> +					<&dispcc0 MDSS_DISP_CC_MDSS_MDP_LUT_CLK>,
> +					<&dispcc0 MDSS_DISP_CC_MDSS_MDP_CLK>,
> +					<&dispcc0 MDSS_DISP_CC_MDSS_VSYNC_CLK>;

Wrong indentation

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
