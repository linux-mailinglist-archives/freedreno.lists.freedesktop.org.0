Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FB21538E1
	for <lists+freedreno@lfdr.de>; Wed,  5 Feb 2020 20:19:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59A658813A;
	Wed,  5 Feb 2020 19:19:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com
 [IPv6:2607:f8b0:4864:20::a42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 299E16E9DE
 for <freedreno@lists.freedesktop.org>; Wed,  5 Feb 2020 19:19:47 +0000 (UTC)
Received: by mail-vk1-xa42.google.com with SMTP id i78so901109vke.0
 for <freedreno@lists.freedesktop.org>; Wed, 05 Feb 2020 11:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mevmQ6k3Ihmv8r7EI3IwBN79KI6v2gp2UE5ATwyofr0=;
 b=BuyExxOHNOnGw0g31bLqy0gVGWAXxG3djserMGkbzccG82zvt+a2/8Sqzj9jTg+Asa
 2upuVHfTuyxd4DU4e3VS+64pnwjwhNe/J8UtYPtwP/hwbQ2Of2yNZIjQyTe42b6laPAb
 Oa7DZNT5TuIoIpdt1rU89W3v4zmQUoQWR0r1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mevmQ6k3Ihmv8r7EI3IwBN79KI6v2gp2UE5ATwyofr0=;
 b=DllleC+YNTKLgD7Bemx52WfLhgzsek9Rr9S9wR71zr4NKyJkJzwmgX+yb1pRZaEXcF
 CKBMFVNf7Q/SzaRxLFSnqhO1jlugjBtbycI1GtxJ0H0QxHSJYo6bbx6qzigzPHrECCwX
 1hH5UCOvANFJv2aE4NiRlGfo1qVb5eJvxNXZiJ/m1YeEpUFL0t27lQyX9WPXeoWYSKBt
 y+lA7EhINnAYQV+L5soRiMefxzKmUf+ReK5mNRMkq7pFJamNie2eEuvPAeiin7nDS4sv
 X/OjDkFFr0WmSSFuGe+HkR2l1UjN/ZqzQReLpFRvc+HS64l11+7Nl47XX3DrcfIwUgG9
 QWTw==
X-Gm-Message-State: APjAAAUmWgjcGqOkqh9UzBTCSNXeT2AxiAgTc2tsuPZrxzPxDsy6LRRZ
 Dz1U4TLF4Rtz1OzN0rhBlyKnq/31uwc=
X-Google-Smtp-Source: APXvYqxGzF0mGeqY0xEHHRv3kwhtX/WvpFRahF3ilUe2O3FAw6hw/WNsznHo87V0+naDzud5X5mhDQ==
X-Received: by 2002:ac5:c7a9:: with SMTP id d9mr2608276vkn.79.1580930385920;
 Wed, 05 Feb 2020 11:19:45 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com.
 [209.85.222.54])
 by smtp.gmail.com with ESMTPSA id g26sm246187vkl.16.2020.02.05.11.19.45
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2020 11:19:45 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id 80so1285906uah.9
 for <freedreno@lists.freedesktop.org>; Wed, 05 Feb 2020 11:19:45 -0800 (PST)
X-Received: by 2002:a9f:300a:: with SMTP id h10mr14335806uab.91.1580930384495; 
 Wed, 05 Feb 2020 11:19:44 -0800 (PST)
MIME-Version: 1.0
References: <1580886097-6312-1-git-send-email-smasetty@codeaurora.org>
 <1580886097-6312-4-git-send-email-smasetty@codeaurora.org>
In-Reply-To: <1580886097-6312-4-git-send-email-smasetty@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 5 Feb 2020 11:19:33 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UEQ0mOXuDrSZrcJ8g6jb0eLf1Ttn+Mn7T6d2TpCMUcuA@mail.gmail.com>
Message-ID: <CAD=FV=UEQ0mOXuDrSZrcJ8g6jb0eLf1Ttn+Mn7T6d2TpCMUcuA@mail.gmail.com>
To: Sharat Masetty <smasetty@codeaurora.org>
Subject: Re: [Freedreno] [PATCH v4 3/3] arm64: dts: qcom: sc7180: Add A618
 gpu dt blob
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Jordan Crouse <jcrouse@codeaurora.org>, Matthias Kaehlcke <mka@chromium.org>,
 dri-devel@freedesktop.org, freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Tue, Feb 4, 2020 at 11:02 PM Sharat Masetty <smasetty@codeaurora.org> wrote:
>
> This patch adds the required dt nodes and properties
> to enabled A618 GPU.
>
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 102 +++++++++++++++++++++++++++++++++++
>  1 file changed, 102 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index f3fcc5c..63fff15 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1043,6 +1043,108 @@
>                         };
>                 };
>
> +               gpu: gpu@5000000 {
> +                       compatible = "qcom,adreno-618.0", "qcom,adreno";
> +                       #stream-id-cells = <16>;
> +                       reg = <0 0x05000000 0 0x40000>, <0 0x0509e000 0 0x1000>,
> +                               <0 0x05061000 0 0x800>;
> +                       reg-names = "kgsl_3d0_reg_memory", "cx_mem", "cx_dbgc";
> +                       interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
> +                       iommus = <&adreno_smmu 0>;
> +                       operating-points-v2 = <&gpu_opp_table>;
> +                       qcom,gmu = <&gmu>;
> +
> +                       gpu_opp_table: opp-table {
> +                               compatible = "operating-points-v2";
> +
> +                               opp-800000000 {
> +                                       opp-hz = /bits/ 64 <800000000>;
> +                                       opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
> +                               };
> +
> +                               opp-650000000 {
> +                                       opp-hz = /bits/ 64 <650000000>;
> +                                       opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
> +                               };
> +
> +                               opp-565000000 {
> +                                       opp-hz = /bits/ 64 <565000000>;
> +                                       opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
> +                               };
> +
> +                               opp-430000000 {
> +                                       opp-hz = /bits/ 64 <430000000>;
> +                                       opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
> +                               };
> +
> +                               opp-355000000 {
> +                                       opp-hz = /bits/ 64 <355000000>;
> +                                       opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
> +                               };
> +
> +                               opp-267000000 {
> +                                       opp-hz = /bits/ 64 <267000000>;
> +                                       opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
> +                               };
> +
> +                               opp-180000000 {
> +                                       opp-hz = /bits/ 64 <180000000>;
> +                                       opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
> +                               };
> +                       };
> +               };
> +
> +               adreno_smmu: iommu@5040000 {
> +                       compatible = "qcom,sc7180-smmu-v2", "qcom,smmu-v2";

As per prior discussion "qcom,sc7180-smmu-v2" needs to be added to the bindings.


> +                       reg = <0 0x05040000 0 0x10000>;
> +                       #iommu-cells = <1>;
> +                       #global-interrupts = <2>;
> +                       interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <GIC_SPI 231 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <GIC_SPI 364 IRQ_TYPE_EDGE_RISING>,
> +                                       <GIC_SPI 365 IRQ_TYPE_EDGE_RISING>,
> +                                       <GIC_SPI 366 IRQ_TYPE_EDGE_RISING>,
> +                                       <GIC_SPI 367 IRQ_TYPE_EDGE_RISING>,
> +                                       <GIC_SPI 368 IRQ_TYPE_EDGE_RISING>,
> +                                       <GIC_SPI 369 IRQ_TYPE_EDGE_RISING>,
> +                                       <GIC_SPI 370 IRQ_TYPE_EDGE_RISING>,
> +                                       <GIC_SPI 371 IRQ_TYPE_EDGE_RISING>;
> +                       clocks = <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
> +                               <&gcc GCC_GPU_CFG_AHB_CLK>,
> +                               <&gcc GCC_DDRSS_GPU_AXI_CLK>;
> +
> +                       clock-names = "bus", "iface", "mem_iface_clk";

As per discussion in v3 [1], "mem_iface_clk" is new and needs to be
added to the bindings. Presumably that patch should be posted / Acked
by Rob before we land this dts.

Other than relying on un-posted bindings, this looks sane to me and
this patch lets me bring the GPU up on my sc7180-based board.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Douglas Anderson <dianders@chromium.org>


-Doug

[1] https://lore.kernel.org/r/1e29097cc1cdf18671379f6420f872b0@codeaurora.org
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
