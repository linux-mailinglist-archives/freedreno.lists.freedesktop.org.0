Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 209B93DA9F3
	for <lists+freedreno@lfdr.de>; Thu, 29 Jul 2021 19:19:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A4B76EE15;
	Thu, 29 Jul 2021 17:19:35 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14A776EE13
 for <freedreno@lists.freedesktop.org>; Thu, 29 Jul 2021 17:19:34 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 v8-20020a0568301bc8b02904d5b4e5ca3aso6560626ota.13
 for <freedreno@lists.freedesktop.org>; Thu, 29 Jul 2021 10:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=JcuPL2E0yGh3YMQ5Ryjgd8htxcjiWk/JLPxwWfyTTEI=;
 b=KLCY003udwzbwW5s6LyNduchb1uN48eo8fIMzMQLlYES2R18futSNL9RxxsZHwnYbd
 /b5ktnC/xdeo/sJ5ZpltOyfNxiFZiBjHJlGRUh7CFaOpRJGZeE42o5mq2Ex2oELSBlCN
 IGYOONXVZ2/HJiKfQ9cKd2unJKWBj40fZ1+3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=JcuPL2E0yGh3YMQ5Ryjgd8htxcjiWk/JLPxwWfyTTEI=;
 b=iYpqPpvxeNEP0XBJiahvqHv2cYhtPJc7fsJ/OdwFnVc4eRZq507QU1Mq3MS5ytjCw7
 fyvzm2cWcIUv7IGqtfiXparMXpsHNr+eRAF6zLPUvVILvPUgOQLBAjVfrDwqp54xWZ3m
 JFBSGPIVLpKa9yeM7FAOeLvhhISQzFgCli823C2yzFA9tUR5RggKEFoXpKZChatJNcoE
 zQlSOz0KW3rZ5h2LJUPjmx2A6gvZ4ZIGBtBTCkCHOfmmmzZdwLLELllJ+h0dKBaqpn+N
 pvtY7ZdJEtofi6sMnkf8lbPYS0uDmoeZBWs+tXfutUY3OQQS4ZZ/0Ij9D3B0A2rJW36v
 prIw==
X-Gm-Message-State: AOAM530rn0MlF8yWHPOa3KkExWJfI459bg5ySMiGK4DGofSgHiViflk3
 31kDPXRIq7dQDJCFtX/CZ7fxWQIecvOIW3k6AxuOow==
X-Google-Smtp-Source: ABdhPJxm3TNkTt83zHPFaTJ+JLOdxmNPIABd6fWr/eYibpJ0bq8EyQFF2n6jRlWgUra5oNFfYz42SdCYS/JjQAGbOPI=
X-Received: by 2002:a9d:650e:: with SMTP id i14mr4267279otl.233.1627579173391; 
 Thu, 29 Jul 2021 10:19:33 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 29 Jul 2021 12:19:33 -0500
MIME-Version: 1.0
In-Reply-To: <1627473242-35926-1-git-send-email-akhilpo@codeaurora.org>
References: <1627473242-35926-1-git-send-email-akhilpo@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 29 Jul 2021 12:19:32 -0500
Message-ID: <CAE-0n53xMHudWaL7gdnN7jEPE1uLmetZaxYiqToO1AzTZ2R0Mw@mail.gmail.com>
To: Akhil P Oommen <akhilpo@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Manaf Meethalavalappu Pallikunhi <manafm@codeaurora.org>, 
 OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, freedreno <freedreno@lists.freedesktop.org>, 
 linux-arm-msm@vger.kernel.org
Subject: Re: [Freedreno] [PATCH v3 1/2] arm64: dts: qcom: sc7280: Add gpu
 support
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
Cc: Jonathan Marek <jonathan@marek.ca>, linux-kernel@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Rob Clark <robdclark@gmail.com>,
 Andy Gross <agross@kernel.org>, Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Akhil P Oommen (2021-07-28 04:54:01)
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 029723a..c88f366 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -592,6 +593,85 @@
>                         qcom,bcm-voters = <&apps_bcm_voter>;
>                 };
>
> +               gpu@3d00000 {
> +                       compatible = "qcom,adreno-635.0", "qcom,adreno";
> +                       #stream-id-cells = <16>;
> +                       reg = <0 0x03d00000 0 0x40000>,
> +                             <0 0x03d9e000 0 0x1000>,
> +                             <0 0x03d61000 0 0x800>;
> +                       reg-names = "kgsl_3d0_reg_memory",
> +                                   "cx_mem",
> +                                   "cx_dbgc";
> +                       interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
> +                       iommus = <&adreno_smmu 0 0x401>;
> +                       operating-points-v2 = <&gpu_opp_table>;
> +                       qcom,gmu = <&gmu>;
> +                       interconnects = <&gem_noc MASTER_GFX3D 0 &mc_virt SLAVE_EBI1 0>;
> +                       interconnect-names = "gfx-mem";
> +
> +                       gpu_opp_table: opp-table {
> +                               compatible = "operating-points-v2";
> +
> +                               opp-550000000 {
> +                                       opp-hz = /bits/ 64 <550000000>;
> +                                       opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
> +                                       opp-peak-kBps = <6832000>;
> +                               };
> +
> +                               opp-450000000 {

Why is 450000000 after 550000000? Is it on purpose? If not intended
please sort by frequency.

> +                                       opp-hz = /bits/ 64 <450000000>;
> +                                       opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
> +                                       opp-peak-kBps = <4068000>;
> +                               };
> +
> +                               opp-315000000 {
> +                                       opp-hz = /bits/ 64 <315000000>;
> +                                       opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
> +                                       opp-peak-kBps = <1804000>;
> +                               };
> +                       };
> +               };
> +
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
