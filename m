Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34084578EA5
	for <lists+freedreno@lfdr.de>; Tue, 19 Jul 2022 02:01:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D29B8113231;
	Tue, 19 Jul 2022 00:01:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B762B113636
 for <freedreno@lists.freedesktop.org>; Tue, 19 Jul 2022 00:00:59 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-10cf9f5b500so27026719fac.2
 for <freedreno@lists.freedesktop.org>; Mon, 18 Jul 2022 17:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1FnYzVMiek+SlAzgVB4w6TNdP3JBRcRzdvMKcgUPF7Y=;
 b=CYO0h1QjLiXX58sLhGBr/WMWfMcMp7XUUC3E71/2erVeeB3PEq7HzlgPmXcaqDqqB9
 27ouDs23+xD+E8CseNTLTteZtqNesuoef3yokyaex7SFQUy/+Dii5yvhMciK+YE+k8Pr
 zbD9yvwhtXUhPUHRUBQCpHSAXaRUDOaDjnwwrckZGwt6sZZaKeFkQd2vJErDX737FA7l
 0W6zLgGJIGAAdqG8ifYHsCFwNoxM9nCb6+q+R5L2yfGMeaysgoWQrHRfe2v2Di6beOwO
 Ga1tP6bc+mipfETjtiJ9SffLSCQVuXYfWfa5ya0QhVjyifEt/e1o+GaZW5Ih7haT2P/U
 Ve3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1FnYzVMiek+SlAzgVB4w6TNdP3JBRcRzdvMKcgUPF7Y=;
 b=AuKbIuge9Sqadenr0kaxyXth1TNn5AMgpEHBVfo7T/TWupp7NoTEnAFYptroVd5OUs
 x+y7gg57IzjowuSmSvsKoqF4CHuPTlPqNzBtOS+eCVm01FvdKYgVq3HPqRkXDmA2XbEm
 OaBjh0N9jQvllT7bDpzYe37gxCLTwPuiHuv40ttf1IibkdjA7HEiOKUn+RtJ+Gr5zwQi
 +OH+UNuXaU/E2n6fP46e/wzJz6JYcn6W6UDE737ugpTKQgll41jRBq/A3wO4bzDOfVcW
 bkH6wSkUeTAmvxSdJCWw+4hb/Z2+oaky+esEjumm5uF9DFJ2dIr7DeHfEEdSJ6rCSYRT
 +10w==
X-Gm-Message-State: AJIora/D/qkslFP2nHGd8j4gxax3bcDiPGzm6v1qfEhFzW/GdDLbk3A5
 VmskVq++uIgMjGzwU/M32jWJ/g==
X-Google-Smtp-Source: AGRyM1s8zLIArx9kCVPBZrk37/t/2i6H01CV57jyxV4+CuXkMf6keiVbJTEX2CdHL/jrA5GmrZa2IQ==
X-Received: by 2002:a05:6808:d4f:b0:339:afb0:ccce with SMTP id
 w15-20020a0568080d4f00b00339afb0cccemr14400991oik.53.1658188858777; 
 Mon, 18 Jul 2022 17:00:58 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186]) by smtp.gmail.com with ESMTPSA id
 z15-20020a056808064f00b0033a422b39b4sm4480419oih.49.2022.07.18.17.00.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 17:00:58 -0700 (PDT)
Date: Mon, 18 Jul 2022 19:00:56 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Message-ID: <YtX0OP2EprFRJ/wx@builder.lan>
References: <1657556603-15024-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1657556603-15024-1-git-send-email-quic_khsieh@quicinc.com>
Subject: Re: [Freedreno] [PATCH v2] arm64: dta: qcom: sc7280: delete
 vdda-1p2 and vdda-0p9 from both dp and edp
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
Cc: devicetree@vger.kernel.org, quic_sbillaka@quicinc.com,
 quic_abhinavk@quicinc.com, freedreno@lists.freedesktop.org,
 robdclark@gmail.com, robh+dt@kernel.org, dianders@chromium.org,
 vkoul@kernel.org, agross@kernel.org, quic_mkrishn@quicinc.com,
 linux-arm-msm@vger.kernel.org, quic_aravindh@quicinc.com, swboyd@chromium.org,
 sean@poorly.run, quic_kalyant@quicinc.coml, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon 11 Jul 11:23 CDT 2022, Kuogee Hsieh wrote:

Please double check that the subject prefix matches existing changes
next time.

Thanks,
Bjorn

> Both vdda-1p2-supply and vdda-0p9-supply regulators are controlled
> by dp combo phy. Therefore remove them from dp controller.
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 2 --
>  arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi     | 3 ---
>  2 files changed, 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> index ed800817..3f8996c 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> @@ -435,8 +435,6 @@ ap_i2c_tpm: &i2c14 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&dp_hot_plug_det>;
>  	data-lanes = <0 1>;
> -	vdda-1p2-supply = <&vdd_a_usbssdp_0_1p2>;
> -	vdda-0p9-supply = <&vdd_a_usbssdp_0_core>;
>  };
>  
>  &mdss_mdp {
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi b/arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi
> index 4c25ffc..7adf31b 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi
> @@ -311,9 +311,6 @@
>  
>  /* NOTE: Not all Qcards have eDP connector stuffed */
>  &mdss_edp {
> -	vdda-0p9-supply = <&vdd_a_edp_0_0p9>;
> -	vdda-1p2-supply = <&vdd_a_edp_0_1p2>;
> -
>  	aux-bus {
>  		edp_panel: panel {
>  			compatible = "edp-panel";
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
