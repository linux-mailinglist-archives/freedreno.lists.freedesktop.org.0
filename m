Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BAB73D320
	for <lists+freedreno@lfdr.de>; Sun, 25 Jun 2023 21:11:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B070E10E17E;
	Sun, 25 Jun 2023 19:11:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3998710E17E
 for <freedreno@lists.freedesktop.org>; Sun, 25 Jun 2023 19:10:59 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 1CF463EEB8;
 Sun, 25 Jun 2023 21:10:56 +0200 (CEST)
Date: Sun, 25 Jun 2023 21:10:54 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Message-ID: <yjc63sxypg3zwju3vudyogexxnng6sgjxxf4fhibid6ifunexc@k2ieeqh23ncm>
References: <20230624-sm6125-dpu-v1-0-1d5a638cebf2@somainline.org>
 <20230624-sm6125-dpu-v1-1-1d5a638cebf2@somainline.org>
 <a2a79b58-c7a9-9099-028c-5ca79cf8f711@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a2a79b58-c7a9-9099-028c-5ca79cf8f711@linaro.org>
Subject: Re: [Freedreno] [PATCH 01/15] arm64: dts: qcom: sm6125: Sort
 spmi_bus node numerically by reg
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
Cc: Michael Turquette <mturquette@baylibre.com>,
 dri-devel@lists.freedesktop.org, Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@gmail.com>, linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Andy Gross <agross@kernel.org>,
 Lux Aliaga <they@mint.lgbt>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Jami Kettunen <jami.kettunen@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2023-06-24 03:43:21, Konrad Dybcio wrote:
> On 24.06.2023 02:40, Marijn Suijten wrote:
> > This node has always resided in the wrong spot, making it somewhat
> > harder to contribute new node entries while maintaining proper sorting
> > around it.  Move the node up to sit after hsusb_phy1 where it maintains
> > proper numerial
> numerical

Thanks.

> sorting on the (first of its many) reg address property.

Why was this continuation of the line not re-quoted?  Makes your reply
super-hard to read.

- Marijn

> > 
> > Fixes: cff4bbaf2a2d ("arm64: dts: qcom: Add support for SM6125")
> > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > ---
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> Konrad
> >  arch/arm64/boot/dts/qcom/sm6125.dtsi | 38 ++++++++++++++++++------------------
> >  1 file changed, 19 insertions(+), 19 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
> > index a596baa6ce3e..722dde560bec 100644
> > --- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
> > @@ -679,6 +679,24 @@ hsusb_phy1: phy@1613000 {
> >  			status = "disabled";
> >  		};
> >  
> > +		spmi_bus: spmi@1c40000 {
> > +			compatible = "qcom,spmi-pmic-arb";
> > +			reg = <0x01c40000 0x1100>,
> > +			      <0x01e00000 0x2000000>,
> > +			      <0x03e00000 0x100000>,
> > +			      <0x03f00000 0xa0000>,
> > +			      <0x01c0a000 0x26000>;
> > +			reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";
> > +			interrupt-names = "periph_irq";
> > +			interrupts = <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>;
> > +			qcom,ee = <0>;
> > +			qcom,channel = <0>;
> > +			#address-cells = <2>;
> > +			#size-cells = <0>;
> > +			interrupt-controller;
> > +			#interrupt-cells = <4>;
> > +		};
> > +
> >  		rpm_msg_ram: sram@45f0000 {
> >  			compatible = "qcom,rpm-msg-ram";
> >  			reg = <0x045f0000 0x7000>;
> > @@ -1184,27 +1202,9 @@ sram@4690000 {
> >  			reg = <0x04690000 0x10000>;
> >  		};
> >  
> > -		spmi_bus: spmi@1c40000 {
> > -			compatible = "qcom,spmi-pmic-arb";
> > -			reg = <0x01c40000 0x1100>,
> > -			      <0x01e00000 0x2000000>,
> > -			      <0x03e00000 0x100000>,
> > -			      <0x03f00000 0xa0000>,
> > -			      <0x01c0a000 0x26000>;
> > -			reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";
> > -			interrupt-names = "periph_irq";
> > -			interrupts = <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>;
> > -			qcom,ee = <0>;
> > -			qcom,channel = <0>;
> > -			#address-cells = <2>;
> > -			#size-cells = <0>;
> > -			interrupt-controller;
> > -			#interrupt-cells = <4>;
> > -		};
> > -
> >  		apps_smmu: iommu@c600000 {
> >  			compatible = "qcom,sm6125-smmu-500", "qcom,smmu-500", "arm,mmu-500";
> > -			reg = <0xc600000 0x80000>;
> > +			reg = <0x0c600000 0x80000>;
> >  			interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>,
> >  				     <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>,
> >  				     <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>,
> > 
