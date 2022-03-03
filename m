Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC87A4CBE53
	for <lists+freedreno@lfdr.de>; Thu,  3 Mar 2022 14:01:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63F1A10E292;
	Thu,  3 Mar 2022 13:00:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 707FE10E3CD
 for <freedreno@lists.freedesktop.org>; Thu,  3 Mar 2022 13:00:57 +0000 (UTC)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl
 [94.209.165.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 4B66C3F67D;
 Thu,  3 Mar 2022 14:00:55 +0100 (CET)
Date: Thu, 3 Mar 2022 14:00:54 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <20220303130054.dxrwgq7vpzvgvip2@SoMainline.org>
References: <20220302225411.2456001-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220302225411.2456001-1-dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH v2 1/6] arm64: dts: qcom: msm8996: Drop
 flags for mdss irqs
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
 freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Andy Gross <agross@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2022-03-03 01:54:06, Dmitry Baryshkov wrote:
> The number of interrupt cells for the mdss interrupt controller is 1,
> meaning there should only be one cell for the interrupt number, not two.
> Drop the second cell containing (unused) irq flags.
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Fixes: 12d540375736 ("arm64: dts: qcom: msm8996: Add DSI0 nodes")
> Fixes: 3a4547c1fc2f ("arm64: qcom: msm8996.dtsi: Add Display nodes")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Thanks for adding the Fixes: tag.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index f0f81c23c16f..0597d865a4a6 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -788,7 +788,7 @@ mdp: mdp@901000 {
>  				reg-names = "mdp_phys";
>  
>  				interrupt-parent = <&mdss>;
> -				interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupts = <0>;
>  
>  				clocks = <&mmcc MDSS_AHB_CLK>,
>  					 <&mmcc MDSS_AXI_CLK>,
> @@ -834,7 +834,7 @@ dsi0: dsi@994000 {
>  				reg-names = "dsi_ctrl";
>  
>  				interrupt-parent = <&mdss>;
> -				interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupts = <4>;
>  
>  				clocks = <&mmcc MDSS_MDP_CLK>,
>  					 <&mmcc MDSS_BYTE0_CLK>,
> @@ -904,7 +904,7 @@ hdmi: hdmi-tx@9a0000 {
>  					    "hdcp_physical";
>  
>  				interrupt-parent = <&mdss>;
> -				interrupts = <8 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupts = <8>;
>  
>  				clocks = <&mmcc MDSS_MDP_CLK>,
>  					 <&mmcc MDSS_AHB_CLK>,
> -- 
> 2.34.1
> 
