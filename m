Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 938C14CB2CB
	for <lists+freedreno@lfdr.de>; Thu,  3 Mar 2022 00:48:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E07010E87E;
	Wed,  2 Mar 2022 23:48:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 412FD10E87E
 for <freedreno@lists.freedesktop.org>; Wed,  2 Mar 2022 23:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1646264934; x=1677800934;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=rnm9IT6icR+D1zeLKO9N9LcDFz1RD+efyHBDALGfxug=;
 b=fzCdk6eRe95o9XtkBW8g6t5e4Ahd8cku/n4L1timL2/+s6o0IE12h9+k
 E75PQnrliLvY6sfsXBdEcER5WVt58UEO0ajsXBsxKSVwfl7NNlaHelT2K
 OXV+5r7zSbjCi9vFHhpTqc6tWqy4e2RHrB5xEt2HWc6dfLFNCgGv1lR+m w=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 02 Mar 2022 15:48:53 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 15:48:53 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Wed, 2 Mar 2022 15:48:53 -0800
Received: from [10.110.107.103] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Wed, 2 Mar 2022
 15:48:52 -0800
Message-ID: <2a664269-df14-11c0-c678-6eae696cdfae@quicinc.com>
Date: Wed, 2 Mar 2022 15:48:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Rob Herring
 <robh+dt@kernel.org>
References: <20220302225411.2456001-1-dmitry.baryshkov@linaro.org>
 <20220302225411.2456001-5-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220302225411.2456001-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Subject: Re: [Freedreno] [PATCH v2 5/6] arm64: dts: qcom: sm8250: Drop flags
 for mdss irqs
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
Cc: linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 3/2/2022 2:54 PM, Dmitry Baryshkov wrote:
> The number of interrupt cells for the mdss interrupt controller is 1,
> meaning there should only be one cell for the interrupt number, not two.
> Drop the second cell containing (unused) irq flags.
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Fixes: 7c1dffd471b1 ("arm64: dts: qcom: sm8250.dtsi: add display system nodes")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/sm8250.dtsi | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index fdaf303ba047..956848068871 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -3200,7 +3200,7 @@ mdss_mdp: mdp@ae01000 {
>   				power-domains = <&rpmhpd SM8250_MMCX>;
>   
>   				interrupt-parent = <&mdss>;
> -				interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupts = <0>;
>   
>   				ports {
>   					#address-cells = <1>;
> @@ -3252,7 +3252,7 @@ dsi0: dsi@ae94000 {
>   				reg-names = "dsi_ctrl";
>   
>   				interrupt-parent = <&mdss>;
> -				interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupts = <4>;
>   
>   				clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
>   					 <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
> @@ -3325,7 +3325,7 @@ dsi1: dsi@ae96000 {
>   				reg-names = "dsi_ctrl";
>   
>   				interrupt-parent = <&mdss>;
> -				interrupts = <5 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupts = <5>;
>   
>   				clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK>,
>   					 <&dispcc DISP_CC_MDSS_BYTE1_INTF_CLK>,
