Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA49E120719
	for <lists+freedreno@lfdr.de>; Mon, 16 Dec 2019 14:26:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87F256E52F;
	Mon, 16 Dec 2019 13:26:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 072566E528
 for <freedreno@lists.freedesktop.org>; Mon, 16 Dec 2019 13:26:15 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id x18so4090282vsq.4
 for <freedreno@lists.freedesktop.org>; Mon, 16 Dec 2019 05:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SrkrPQ07aL4Y8FBmUyUkJpuYsuQMyP810ElV68K8SU4=;
 b=GyqEEbSdTByqPxlCqLnzO3SgHl68nbRiwaqjEd+/kK+rRRRZAOL45aMnWjjGRmreZB
 +ftpWHMiZXQxYSIjyq9dAfMxwNzQJHz5iLx2OvQgPP68CsdOZYN8i8zHrybnmYyVqL1R
 X6dE0LcM0TB7yzNWUj12e/2hMbtnzJR6GI2zWKRWqIW5aWAF2PbYMvq+v1ym1jgu1VPq
 ePJR/tl4A3hfq6HRZRrnJ9BGtex/OcwWXQOZHqB4YEZS2fUs3M97lfTI58tr5vC/Keot
 1VS7nuUoSjAefZMHlTtt0I4tFDQjCiBS0EAGbQ2WaKTPeLVS8vPD2/iRdHm4iEB5jthc
 8Pfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SrkrPQ07aL4Y8FBmUyUkJpuYsuQMyP810ElV68K8SU4=;
 b=Hf3EIq2Mk6SmA/n91B8ZMW09xGRjyxyVjJAVunFB8+PFlFxCKV9LFEJ9xbtkQ8ua8I
 oUfEwsBEr3akUXdHECuljt2yNXekniicISpXC7Hmoes+F5HBkm5kVNQjY4HdVWLFJ8kN
 SBJOgzp9AfOzeAfJqe6O+Rsw28YIeVpM8fVzosGRObJiTSBftgs9tiaqpG2Im7k9RJL7
 lWq5STo8PtNUqA2EarNHSQMNg8w9G6jFnXsRY73adAmbPCAWoMI+rvBX5MDphH8pOVr5
 YesQOGZKFIC1WM3I1PPSQ9mxFnkF5lWS63YEMVt0uPaFpTcGR+EuJzjq1Ux+vPsEXECh
 XCSQ==
X-Gm-Message-State: APjAAAWPSt4Dwzoxd/vV04ZGnrJZjnoZDm/jl+iGnIjpYf4MAp4zcVhv
 5Bef3d25s/uPKTNa2qNGR8cCesA2KpRvQIpBghJ76A==
X-Google-Smtp-Source: APXvYqyRDozkVfiI0C+2HNPeqIhS2/Bb2kBbTJGL4Wnf7QJpvb3NwnNnPHukNK271c769edIWV40Bv/82qshV4Ty/MQ=
X-Received: by 2002:a67:fa16:: with SMTP id i22mr20210246vsq.137.1576502773631; 
 Mon, 16 Dec 2019 05:26:13 -0800 (PST)
MIME-Version: 1.0
References: <mailman.535.1576278305.1117.freedreno@lists.freedesktop.org>
In-Reply-To: <mailman.535.1576278305.1117.freedreno@lists.freedesktop.org>
From: vadiraj kaveri <vadirajkaveri@gmail.com>
Date: Mon, 16 Dec 2019 18:56:02 +0530
Message-ID: <CA+xOhcTVZ+sZL0biVEe4MRje2xxnhdpLXfdqLtPQqfEksxc+sw@mail.gmail.com>
To: freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [DPU PATCH v3 1/5] dt-bindings: msm/dp: add
 bindings of DP/DP-PLL driver for Snapdragon 845
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
Cc: chandanu@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi Chandan,

I see some difference in DP and PLL base address between SD845 Android
4.9 kernel and [DPU,v3,1/5] dt-bindings.
And also I find difference in reg format, why is that so?

Is it possible to share your git tree of SD845 DP to check on DB845C?

[DPU,v3,1/5] dt-bindings: msm/dp: add bindings of DP/DP-PLL driver for
Snapdragon 845Linux:
-------------------------------------------------------------------------------------------------------------------------------------------

        reg = <1 0xea000 0x200>,
              <1 0xeaa00 0x200>,
              <1 0xea200 0x200>,
              <1 0xea600 0x200>,
              <2 0x03000 0x8>;
        reg-names = "pll_base", "phy_base", "ln_tx0_base",
            "ln_tx1_base", "gdsc_base";


        reg =   <0 0x90000 0x0dc>,
            <0 0x90200 0x0c0>,
            <0 0x90400 0x508>,
            <0 0x90a00 0x094>,
            <1 0xeaa00 0x200>,
            <1 0xea200 0x200>,
            <1 0xea600 0x200>,
            <2 0x02000 0x1a0>,
            <3 0x00000 0x621c>,
            <1 0xea000 0x180>,
            <1 0xe8000 0x20>,
            <4 0xe1000 0x034>;
        reg-names = "dp_ahb", "dp_aux", "dp_link",
            "dp_p0", "dp_phy", "dp_ln_tx0", "dp_ln_tx1",
            "dp_mmss_cc", "qfprom_physical", "dp_pll",
            "usb3_dp_com", "hdcp_physical";


SD845 Android kernel 4.9:
--------------------------------------

              reg = <0x088ea000 0x200>,
                      <0x088eaa00 0x200>,
                      <0x088ea200 0x200>,
                      <0x088ea600 0x200>,
                      <0xaf03000 0x8>;
                reg-names = "pll_base", "phy_base", "ln_tx0_base",
                        "ln_tx1_base", "gdsc_base";


                reg =   <0xae90000 0x0dc>,
                        <0xae90200 0x0c0>,
                        <0xae90400 0x508>,
                        <0xae90a00 0x094>,
                        <0x88eaa00 0x200>,
                        <0x88ea200 0x200>,
                        <0x88ea600 0x200>,
                        <0xaf02000 0x1a0>,
                        <0x780000 0x621c>,
                        <0x88ea030 0x10>,
                        <0x88e8000 0x20>,
                        <0x0aee1000 0x034>;
                /* dp_ctrl: dp_ahb, dp_aux, dp_link, dp_p0 */
                reg-names = "dp_ahb", "dp_aux", "dp_link",
                        "dp_p0", "dp_phy", "dp_ln_tx0", "dp_ln_tx1",
                        "dp_mmss_cc", "qfprom_physical", "dp_pll",
                        "usb3_dp_com", "hdcp_physical";

Regards,
Vadiraj


On Sat, Dec 14, 2019 at 4:35 AM <freedreno-request@lists.freedesktop.org> wrote:
>
> Send Freedreno mailing list submissions to
>         freedreno@lists.freedesktop.org
>
> To subscribe or unsubscribe via the World Wide Web, visit
>         https://lists.freedesktop.org/mailman/listinfo/freedreno
> or, via email, send a message with subject or body 'help' to
>         freedreno-request@lists.freedesktop.org
>
> You can reach the person managing the list at
>         freedreno-owner@lists.freedesktop.org
>
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of Freedreno digest..."
>
>
> Today's Topics:
>
>    1. Re: [DPU PATCH v3 1/5] dt-bindings: msm/dp: add bindings of
>       DP/DP-PLL driver for Snapdragon 845 (Rob Herring)
>    2. Re: [DPU PATCH v3 1/5] dt-bindings: msm/dp: add bindings of
>       DP/DP-PLL driver for Snapdragon 845 (Jeffrey Hugo)
>
>
> ----------------------------------------------------------------------
>
> Message: 1
> Date: Fri, 13 Dec 2019 16:58:00 -0600
> From: Rob Herring <robh@kernel.org>
> To: Chandan Uddaraju <chandanu@codeaurora.org>
> Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
>         devicetree@vger.kernel.org, seanpaul@chromium.org,
>         robdclark@gmail.com, abhinavk@codeaurora.org, nganji@codeaurora.org,
>         jsanka@codeaurora.org, hoegsberg@google.com,
>         dri-devel@lists.freedesktop.org
> Subject: Re: [Freedreno] [DPU PATCH v3 1/5] dt-bindings: msm/dp: add
>         bindings of DP/DP-PLL driver for Snapdragon 845
> Message-ID: <20191213225800.GA21739@bogus>
> Content-Type: text/plain; charset=us-ascii
>
> On Mon, Dec 02, 2019 at 01:47:45PM +0000, Chandan Uddaraju wrote:
> > Add bindings for Snapdragon 845 DisplayPort and
> > display-port PLL driver.
>
> Is it just me, but I keep getting 2 copies of codeaurora emails?
>
> >
> > Changes in V2:
> > Provide details about sel-gpio
>
> This is V3, what changed in V3?
>
> >
> > Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>
> > ---
> >  .../devicetree/bindings/display/msm/dp.txt         | 249 +++++++++++++++++++++
> >  .../devicetree/bindings/display/msm/dpu.txt        |  16 +-
> >  2 files changed, 261 insertions(+), 4 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/display/msm/dp.txt
>
> New bindings should be in DT schema format.
>
> > diff --git a/Documentation/devicetree/bindings/display/msm/dp.txt b/Documentation/devicetree/bindings/display/msm/dp.txt
> > new file mode 100644
> > index 0000000..38be36d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/msm/dp.txt
> > @@ -0,0 +1,249 @@
> > +Qualcomm Technologies, Inc.
> > +DP is the master Display Port device which supports DP host controllers that are compatible with VESA Display Port interface specification.
> > +DP Controller: Required properties:
> > +- compatible:           Should be "qcom,dp-display".
>
> Needs to be more specific like including the SoC name.
>
> > +- reg:                  Base address and length of DP hardware's memory mapped regions.
> > +- cell-index:           Specifies the controller instance.
>
> FDT doesn't use cell-index.
>
> > +- reg-names:            A list of strings that name the list of regs.
> > +                     "dp_ahb" - DP controller memory region.
> > +                     "dp_aux" - DP AUX memory region.
> > +                     "dp_link" - DP link layer memory region.
> > +                     "dp_p0" - DP pixel clock domain memory region.
> > +                     "dp_phy" - DP PHY memory region.
> > +                     "dp_ln_tx0" - USB3 DP PHY combo TX-0 lane memory region.
> > +                     "dp_ln_tx1" - USB3 DP PHY combo TX-1 lane memory region.
> > +                     "dp_mmss_cc" - Display Clock Control memory region.
>
> Sounds like a separate clock controller node...
>
> > +                     "qfprom_physical" - QFPROM Phys memory region.
> > +                     "dp_pll" - USB3 DP combo PLL memory region.
> > +                     "usb3_dp_com" - USB3 DP PHY combo memory region.
>
> Should be a separate phy node?
>
> > +                     "hdcp_physical" - DP HDCP memory region.
>
> The 'dp_' part is redundant.
>
> What does 'physical' mean? Addresses in DT are always physical.
>
> > +- interrupt-parent   phandle to the interrupt parent device node.
>
> Don't document interrupt-parent. It's not required either because it
> could be in a parent node.
>
> > +- interrupts:                The interrupt signal from the DP block.
> > +- clocks:               Clocks required for Display Port operation. See [1] for details on clock bindings.
> > +- clock-names:          Names of the clocks corresponding to handles. Following clocks are required:
> > +                     "core_aux_clk", "core_usb_ref_clk_src","core_usb_ref_clk", "core_usb_cfg_ahb_clk",
> > +                     "core_usb_pipe_clk", "ctrl_link_clk", "ctrl_link_iface_clk", "ctrl_crypto_clk",
> > +                     "ctrl_pixel_clk", "pixel_clk_rcg", "pixel_parent".
>
> Clocks should be actual clock inputs to the module. If 'pixel_parent' is
> just some parent clock you want to assign, then use assigned-clocks.
>
> > +- pll-node:          phandle to DP PLL node.
>
> But you have a DP PLL reg region defined. Is this something else?
>
> Needs a 'qcom' prefix if it stays.
>
> > +- vdda-1p2-supply:           phandle to vdda 1.2V regulator node.
> > +- vdda-0p9-supply:           phandle to vdda 0.9V regulator node.
> > +- qcom,aux-cfg0-settings:            Specifies the DP AUX configuration 0 settings. The first
> > +                                     entry in this array corresponds to the register offset
> > +                                     within DP AUX, while the remaining entries indicate the
> > +                                     programmable values.
>
> Needs more details on what these are and why they must be in DT. We
> generally don't just stuff DT with raw values to initial registers with.
>
> Line lengths should be <80 char.
>
> > +- qcom,aux-cfg1-settings:            Specifies the DP AUX configuration 1 settings. The first
> > +                                     entry in this array corresponds to the register offset
> > +                                     within DP AUX, while the remaining entries indicate the
> > +                                     programmable values.
> > +- qcom,aux-cfg2-settings:            Specifies the DP AUX configuration 2 settings. The first
> > +                                     entry in this array corresponds to the register offset
> > +                                     within DP AUX, while the remaining entries indicate the
> > +                                     programmable values.
> > +- qcom,aux-cfg3-settings:            Specifies the DP AUX configuration 3 settings. The first
> > +                                     entry in this array corresponds to the register offset
> > +                                     within DP AUX, while the remaining entries indicate the
> > +                                     programmable values.
> > +- qcom,aux-cfg4-settings:            Specifies the DP AUX configuration 4 settings. The first
> > +                                     entry in this array corresponds to the register offset
> > +                                     within DP AUX, while the remaining entries indicate the
> > +                                     programmable values.
> > +- qcom,aux-cfg5-settings:            Specifies the DP AUX configuration 5 settings. The first
> > +                                     entry in this array corresponds to the register offset
> > +                                     within DP AUX, while the remaining entries indicate the
> > +                                     programmable values.
> > +- qcom,aux-cfg6-settings:            Specifies the DP AUX configuration 6 settings. The first
> > +                                     entry in this array corresponds to the register offset
> > +                                     within DP AUX, while the remaining entries indicate the
> > +                                     programmable values.
> > +- qcom,aux-cfg7-settings:            Specifies the DP AUX configuration 7 settings. The first
> > +                                     entry in this array corresponds to the register offset
> > +                                     within DP AUX, while the remaining entries indicate the
> > +                                     programmable values.
> > +- qcom,aux-cfg8-settings:            Specifies the DP AUX configuration 8 settings. The first
> > +                                     entry in this array corresponds to the register offset
> > +                                     within DP AUX, while the remaining entries indicate the
> > +                                     programmable values.
> > +- qcom,aux-cfg9-settings:            Specifies the DP AUX configuration 9 settings. The first
> > +                                     entry in this array corresponds to the register offset
> > +                                     within DP AUX, while the remaining entries indicate the
> > +                                     programmable values.
> > +- qcom,max-pclk-frequency-khz:       An integer specifying the maximum. pixel clock in KHz supported by Display Port.
>
> Wrap your lines.
>
> > +- extcon:                            Phandle for the external connector class interface.
>
> Don't use extcon. Either dp-connector or usb-connector binding instead.
>
> > +- qcom,<type>-supply-entries:                A node that lists the elements of the supply used by the a particular "type" of DP module. The module "types"
> > +                                     can be "core", "ctrl", and "phy". Within the same type,
> > +                                     there can be more than one instance of this binding,
> > +                                     in which case the entry would be appended with the
> > +                                     supply entry index.
> > +                                     e.g. qcom,ctrl-supply-entry@0
> > +                                     -- qcom,supply-name: name of the supply (vdd/vdda/vddio)
> > +                                     -- qcom,supply-min-voltage: minimum voltage level (uV)
> > +                                     -- qcom,supply-max-voltage: maximum voltage level (uV)
> > +                                     -- qcom,supply-enable-load: load drawn (uA) from enabled supply
> > +                                     -- qcom,supply-disable-load: load drawn (uA) from disabled supply
> > +                                     -- qcom,supply-pre-on-sleep: time to sleep (ms) before turning on
> > +                                     -- qcom,supply-post-on-sleep: time to sleep (ms) after turning on
> > +                                     -- qcom,supply-pre-off-sleep: time to sleep (ms) before turning off
> > +                                     -- qcom,supply-post-off-sleep: time to sleep (ms) after turning off
>
> Not sure what you're trying to do here, but looks like the regulator
> binding should be used.
>
> > +- pinctrl-names:     List of names to assign mdss pin states defined in pinctrl device node
> > +                                     Refer to pinctrl-bindings.txt
> > +- pinctrl-<0..n>:    Lists phandles each pointing to the pin configuration node within a pin
> > +                                     controller. These pin configurations are installed in the pinctrl
> > +                                     device node. Refer to pinctrl-bindings.txt
> > +DP Endpoint properties:
> > +  - remote-endpoint: For port@0, set to phandle of the connected panel/bridge's
> > +    input endpoint. For port@1, set to the DPU interface output. See [2] for
> > +    device graph info.
> > +
> > +Optional properties:
> > +- qcom,aux-en-gpio:          Specifies the aux-channel enable gpio.
> > +- qcom,aux-sel-gpio:         Specifies the mux-selection that might be needed for aux interface.
>
> -gpios is the preferred form.
>
> > +
> > +
> > +DP PLL: Required properties:
>
> Should be a separate doc.
>
> > +- compatible:           Should be "qcom,dp-pll-10nm".
> > +- reg:                  Base address and length of DP hardware's memory mapped regions.
> > +- cell-index:           Specifies the PLL instance.
> > +- reg-names:            A list of strings that name the list of regs.
> > +                     "pll_base" - DP PLL memory region.
> > +                     "phy_base" - DP PHY memory region.
> > +                     "ln_tx0_base" - USB3 DP PHY combo TX-0 lane memory region.
> > +                     "ln_tx1_base" - USB3 DP PHY combo TX-1 lane memory region.
> > +                     "gdsc_base" - gdsc memory region.
> > +- interrupt-parent   phandle to the interrupt parent device node.
> > +- interrupts:                The interrupt signal from the DP block.
> > +- clocks:               Clocks required for Display Port operation. See [1] for details on clock bindings.
> > +- clock-names:          Names of the clocks corresponding to handles. Following clocks are required:
> > +                     "iface_clk", "ref_clk", cfg_ahb_clk", "pipe_clk".
> > +- clock-rate:           Initial clock rate to be configured. For the shared clocks, the default value                             is set to zero so that minimum clock value is configured. Non-zero clock
> > +                     value can be used to configure DP pixel clock.
> > +
> > +
> > +[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
> > +[2] Documentation/devicetree/bindings/graph.txt
> > +
> > +Example:
> > +     msm_dp: dp_display@ae90000{
> > +             cell-index = <0>;
> > +             compatible = "qcom,dp-display";
> > +
> > +             reg =   <0 0x90000 0x0dc>,
> > +                     <0 0x90200 0x0c0>,
> > +                     <0 0x90400 0x508>,
> > +                     <0 0x90a00 0x094>,
> > +                     <1 0xeaa00 0x200>,
> > +                     <1 0xea200 0x200>,
> > +                     <1 0xea600 0x200>,
> > +                     <2 0x02000 0x1a0>,
> > +                     <3 0x00000 0x621c>,
> > +                     <1 0xea000 0x180>,
> > +                     <1 0xe8000 0x20>,
> > +                     <4 0xe1000 0x034>;
> > +             reg-names = "dp_ahb", "dp_aux", "dp_link",
> > +                     "dp_p0", "dp_phy", "dp_ln_tx0", "dp_ln_tx1",
> > +                     "dp_mmss_cc", "qfprom_physical", "dp_pll",
> > +                     "usb3_dp_com", "hdcp_physical";
> > +
> > +             interrupt-parent = <&mdss>;
> > +             interrupts = <12 0>;
> > +
> > +             extcon = <&usb_1_ssphy>;
> > +             clocks =  <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
> > +                     <&rpmhcc RPMH_CXO_CLK>,
> > +                     <&gcc GCC_USB3_PRIM_CLKREF_CLK>,
> > +                     <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
> > +                     <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>,
> > +                     <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
> > +                     <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
> > +                     <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>,
> > +                     <&dispcc DISP_CC_MDSS_DP_CRYPTO_CLK>,
> > +                     <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
> > +             clock-names = "core_aux_clk", "core_ref_clk_src",
> > +                     "core_usb_ref_clk", "core_usb_cfg_ahb_clk",
> > +                     "core_usb_pipe_clk", "ctrl_link_clk",
> > +                     "ctrl_link_iface_clk", "ctrl_pixel_clk",
> > +                     "crypto_clk", "pixel_clk_rcg";
> > +
> > +             pll-node = <&dp_pll>;
> > +             qcom,aux-cfg0-settings = [20 00];
> > +             qcom,aux-cfg1-settings = [24 13 23 1d];
> > +             qcom,aux-cfg2-settings = [28 24];
> > +             qcom,aux-cfg3-settings = [2c 00];
> > +             qcom,aux-cfg4-settings = [30 0a];
> > +             qcom,aux-cfg5-settings = [34 26];
> > +             qcom,aux-cfg6-settings = [38 0a];
> > +             qcom,aux-cfg7-settings = [3c 03];
> > +             qcom,aux-cfg8-settings = [40 bb];
> > +             qcom,aux-cfg9-settings = [44 03];
> > +
> > +             qcom,max-pclk-frequency-khz = <675000>;
> > +
> > +             qcom,ctrl-supply-entries {
> > +                     #address-cells = <1>;
> > +                     #size-cells = <0>;
> > +
> > +                     qcom,ctrl-supply-entry@0 {
> > +                             reg = <0>;
> > +                             qcom,supply-name = "vdda-1p2";
> > +                             qcom,supply-min-voltage = <1200000>;
> > +                             qcom,supply-max-voltage = <1200000>;
> > +                             qcom,supply-enable-load = <21800>;
> > +                             qcom,supply-disable-load = <4>;
> > +                     };
> > +             };
> > +
> > +             qcom,phy-supply-entries {
> > +                     #address-cells = <1>;
> > +                     #size-cells = <0>;
> > +
> > +                     qcom,phy-supply-entry@0 {
> > +                             reg = <0>;
> > +                             qcom,supply-name = "vdda-0p9";
> > +                             qcom,supply-min-voltage = <880000>;
> > +                             qcom,supply-max-voltage = <880000>;
> > +                             qcom,supply-enable-load = <36000>;
> > +                             qcom,supply-disable-load = <32>;
> > +                     };
> > +             };
> > +
> > +             ports {
> > +                     #address-cells = <1>;
> > +                     #size-cells = <0>;
> > +
> > +                     port@0 {
> > +                             reg = <0>;
> > +                             dp_in: endpoint {
> > +                                     remote-endpoint = <&dpu_intf0_out>;
> > +                             };
> > +                     };
> > +
> > +                     port@1 {
> > +                             reg = <1>;
> > +                             dp_out: endpoint {
> > +                             };
> > +                     };
> > +             };
> > +     };
> > +
> > +     dp_pll: dp-pll@c011000 {
> > +             compatible = "qcom,dp-pll-10nm";
> > +             label = "DP PLL";
> > +             cell-index = <0>;
> > +             #clock-cells = <1>;
> > +
> > +             reg = <1 0xea000 0x200>,
> > +                   <1 0xeaa00 0x200>,
> > +                   <1 0xea200 0x200>,
> > +                   <1 0xea600 0x200>,
> > +                   <2 0x03000 0x8>;
> > +             reg-names = "pll_base", "phy_base", "ln_tx0_base",
> > +                     "ln_tx1_base", "gdsc_base";
> > +
> > +             clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> > +                      <&gcc GCC_USB3_PRIM_CLKREF_CLK>,
> > +                      <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
> > +                      <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
> > +             clock-names = "iface_clk", "ref_clk",
> > +                     "cfg_ahb_clk", "pipe_clk";
> > +             clock-rate = <0>;
> > +
> > +     };
> > diff --git a/Documentation/devicetree/bindings/display/msm/dpu.txt b/Documentation/devicetree/bindings/display/msm/dpu.txt
> > index a61dd40..eac6e1c 100644
> > --- a/Documentation/devicetree/bindings/display/msm/dpu.txt
> > +++ b/Documentation/devicetree/bindings/display/msm/dpu.txt
> > @@ -63,8 +63,9 @@ Required properties:
> >       Documentation/devicetree/bindings/graph.txt
> >       Documentation/devicetree/bindings/media/video-interfaces.txt
> >
> > -     Port 0 -> DPU_INTF1 (DSI1)
> > -     Port 1 -> DPU_INTF2 (DSI2)
> > +     Port 0 -> DPU_INTF0 (DP)
> > +     Port 1 -> DPU_INTF1 (DSI1)
> > +     Port 2 -> DPU_INTF2 (DSI2)
>
> No, you can't redefine existing binding.
>
> >
> >  Optional properties:
> >  - assigned-clocks: list of clock specifiers for clocks needing rate assignment
> > @@ -125,13 +126,20 @@ Example:
> >
> >                               port@0 {
> >                                       reg = <0>;
> > -                                     dpu_intf1_out: endpoint {
> > -                                             remote-endpoint = <&dsi0_in>;
> > +                                     dpu_intf0_out: endpoint {
> > +                                             remote-endpoint = <&dp_in>;
> >                                       };
> >                               };
> >
> >                               port@1 {
> >                                       reg = <1>;
> > +                                     dpu_intf1_out: endpoint {
> > +                                             remote-endpoint = <&dsi0_in>;
> > +                                     };
> > +                             };
> > +
> > +                             port@2 {
> > +                                     reg = <2>;
> >                                       dpu_intf2_out: endpoint {
> >                                               remote-endpoint = <&dsi1_in>;
> >                                       };
> > --
> > The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> > a Linux Foundation Collaborative Project
> >
>
>
> ------------------------------
>
> Message: 2
> Date: Fri, 13 Dec 2019 16:04:52 -0700
> From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> To: Chandan Uddaraju <chandanu@codeaurora.org>
> Cc: freedreno <freedreno@lists.freedesktop.org>, MSM
>         <linux-arm-msm@vger.kernel.org>,  DTML <devicetree@vger.kernel.org>,
>         Sean Paul <seanpaul@chromium.org>,  Rob Clark <robdclark@gmail.com>,
>         Abhinav Kumar <abhinavk@codeaurora.org>, nganji@codeaurora.org,
>         Jeykumar Sankaran <jsanka@codeaurora.org>, hoegsberg@google.com,
>         "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
> Subject: Re: [Freedreno] [DPU PATCH v3 1/5] dt-bindings: msm/dp: add
>         bindings of DP/DP-PLL driver for Snapdragon 845
> Message-ID:
>         <CAOCk7Nr+W8psZb5V_Ttacv9xKTTY6Zz+BuLYMCqCteJpP06t-A@mail.gmail.com>
> Content-Type: text/plain; charset="UTF-8"
>
> On Mon, Dec 2, 2019 at 6:48 AM Chandan Uddaraju <chandanu@codeaurora.org> wrote:
> >
> > Add bindings for Snapdragon 845 DisplayPort and
> > display-port PLL driver.
> >
> > Changes in V2:
> > Provide details about sel-gpio
> >
> > Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>
> > ---
> >  .../devicetree/bindings/display/msm/dp.txt         | 249 +++++++++++++++++++++
> >  .../devicetree/bindings/display/msm/dpu.txt        |  16 +-
> >  2 files changed, 261 insertions(+), 4 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/display/msm/dp.txt
> >
> > diff --git a/Documentation/devicetree/bindings/display/msm/dp.txt b/Documentation/devicetree/bindings/display/msm/dp.txt
> > new file mode 100644
> > index 0000000..38be36d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/msm/dp.txt
> > @@ -0,0 +1,249 @@
> > +Qualcomm Technologies, Inc.
> > +DP is the master Display Port device which supports DP host controllers that are compatible with VESA Display Port interface specification.
> > +DP Controller: Required properties:
> > +- compatible:           Should be "qcom,dp-display".
> > +- reg:                  Base address and length of DP hardware's memory mapped regions.
> > +- cell-index:           Specifies the controller instance.
> > +- reg-names:            A list of strings that name the list of regs.
> > +                       "dp_ahb" - DP controller memory region.
> > +                       "dp_aux" - DP AUX memory region.
> > +                       "dp_link" - DP link layer memory region.
> > +                       "dp_p0" - DP pixel clock domain memory region.
> > +                       "dp_phy" - DP PHY memory region.
> > +                       "dp_ln_tx0" - USB3 DP PHY combo TX-0 lane memory region.
> > +                       "dp_ln_tx1" - USB3 DP PHY combo TX-1 lane memory region.
> > +                       "dp_mmss_cc" - Display Clock Control memory region.
> > +                       "qfprom_physical" - QFPROM Phys memory region.
> > +                       "dp_pll" - USB3 DP combo PLL memory region.
> > +                       "usb3_dp_com" - USB3 DP PHY combo memory region.
> > +                       "hdcp_physical" - DP HDCP memory region.
> > +- interrupt-parent     phandle to the interrupt parent device node.
> > +- interrupts:          The interrupt signal from the DP block.
> > +- clocks:               Clocks required for Display Port operation. See [1] for details on clock bindings.
> > +- clock-names:          Names of the clocks corresponding to handles. Following clocks are required:
> > +                       "core_aux_clk", "core_usb_ref_clk_src","core_usb_ref_clk", "core_usb_cfg_ahb_clk",
> > +                       "core_usb_pipe_clk", "ctrl_link_clk", "ctrl_link_iface_clk", "ctrl_crypto_clk",
> > +                       "ctrl_pixel_clk", "pixel_clk_rcg", "pixel_parent".
> > +- pll-node:            phandle to DP PLL node.
> > +- vdda-1p2-supply:             phandle to vdda 1.2V regulator node.
> > +- vdda-0p9-supply:             phandle to vdda 0.9V regulator node.
> > +- qcom,aux-cfg0-settings:              Specifies the DP AUX configuration 0 settings. The first
> > +                                       entry in this array corresponds to the register offset
> > +                                       within DP AUX, while the remaining entries indicate the
> > +                                       programmable values.
> > +- qcom,aux-cfg1-settings:              Specifies the DP AUX configuration 1 settings. The first
> > +                                       entry in this array corresponds to the register offset
> > +                                       within DP AUX, while the remaining entries indicate the
> > +                                       programmable values.
> > +- qcom,aux-cfg2-settings:              Specifies the DP AUX configuration 2 settings. The first
> > +                                       entry in this array corresponds to the register offset
> > +                                       within DP AUX, while the remaining entries indicate the
> > +                                       programmable values.
> > +- qcom,aux-cfg3-settings:              Specifies the DP AUX configuration 3 settings. The first
> > +                                       entry in this array corresponds to the register offset
> > +                                       within DP AUX, while the remaining entries indicate the
> > +                                       programmable values.
> > +- qcom,aux-cfg4-settings:              Specifies the DP AUX configuration 4 settings. The first
> > +                                       entry in this array corresponds to the register offset
> > +                                       within DP AUX, while the remaining entries indicate the
> > +                                       programmable values.
> > +- qcom,aux-cfg5-settings:              Specifies the DP AUX configuration 5 settings. The first
> > +                                       entry in this array corresponds to the register offset
> > +                                       within DP AUX, while the remaining entries indicate the
> > +                                       programmable values.
> > +- qcom,aux-cfg6-settings:              Specifies the DP AUX configuration 6 settings. The first
> > +                                       entry in this array corresponds to the register offset
> > +                                       within DP AUX, while the remaining entries indicate the
> > +                                       programmable values.
> > +- qcom,aux-cfg7-settings:              Specifies the DP AUX configuration 7 settings. The first
> > +                                       entry in this array corresponds to the register offset
> > +                                       within DP AUX, while the remaining entries indicate the
> > +                                       programmable values.
> > +- qcom,aux-cfg8-settings:              Specifies the DP AUX configuration 8 settings. The first
> > +                                       entry in this array corresponds to the register offset
> > +                                       within DP AUX, while the remaining entries indicate the
> > +                                       programmable values.
> > +- qcom,aux-cfg9-settings:              Specifies the DP AUX configuration 9 settings. The first
> > +                                       entry in this array corresponds to the register offset
> > +                                       within DP AUX, while the remaining entries indicate the
> > +                                       programmable values.
> > +- qcom,max-pclk-frequency-khz: An integer specifying the maximum. pixel clock in KHz supported by Display Port.
> > +- extcon:                              Phandle for the external connector class interface.
> > +- qcom,<type>-supply-entries:          A node that lists the elements of the supply used by the a particular "type" of DP module. The module "types"
> > +                                       can be "core", "ctrl", and "phy". Within the same type,
> > +                                       there can be more than one instance of this binding,
> > +                                       in which case the entry would be appended with the
> > +                                       supply entry index.
> > +                                       e.g. qcom,ctrl-supply-entry@0
> > +                                       -- qcom,supply-name: name of the supply (vdd/vdda/vddio)
> > +                                       -- qcom,supply-min-voltage: minimum voltage level (uV)
> > +                                       -- qcom,supply-max-voltage: maximum voltage level (uV)
> > +                                       -- qcom,supply-enable-load: load drawn (uA) from enabled supply
> > +                                       -- qcom,supply-disable-load: load drawn (uA) from disabled supply
> > +                                       -- qcom,supply-pre-on-sleep: time to sleep (ms) before turning on
> > +                                       -- qcom,supply-post-on-sleep: time to sleep (ms) after turning on
> > +                                       -- qcom,supply-pre-off-sleep: time to sleep (ms) before turning off
> > +                                       -- qcom,supply-post-off-sleep: time to sleep (ms) after turning off
> > +- pinctrl-names:       List of names to assign mdss pin states defined in pinctrl device node
> > +                                       Refer to pinctrl-bindings.txt
> > +- pinctrl-<0..n>:      Lists phandles each pointing to the pin configuration node within a pin
> > +                                       controller. These pin configurations are installed in the pinctrl
> > +                                       device node. Refer to pinctrl-bindings.txt
> > +DP Endpoint properties:
> > +  - remote-endpoint: For port@0, set to phandle of the connected panel/bridge's
> > +    input endpoint. For port@1, set to the DPU interface output. See [2] for
> > +    device graph info.
> > +
> > +Optional properties:
> > +- qcom,aux-en-gpio:            Specifies the aux-channel enable gpio.
> > +- qcom,aux-sel-gpio:           Specifies the mux-selection that might be needed for aux interface.
> > +
> > +
> > +DP PLL: Required properties:
> > +- compatible:           Should be "qcom,dp-pll-10nm".
> > +- reg:                  Base address and length of DP hardware's memory mapped regions.
> > +- cell-index:           Specifies the PLL instance.
> > +- reg-names:            A list of strings that name the list of regs.
> > +                       "pll_base" - DP PLL memory region.
> > +                       "phy_base" - DP PHY memory region.
> > +                       "ln_tx0_base" - USB3 DP PHY combo TX-0 lane memory region.
> > +                       "ln_tx1_base" - USB3 DP PHY combo TX-1 lane memory region.
> > +                       "gdsc_base" - gdsc memory region.
> > +- interrupt-parent     phandle to the interrupt parent device node.
> > +- interrupts:          The interrupt signal from the DP block.
> > +- clocks:               Clocks required for Display Port operation. See [1] for details on clock bindings.
> > +- clock-names:          Names of the clocks corresponding to handles. Following clocks are required:
> > +                       "iface_clk", "ref_clk", cfg_ahb_clk", "pipe_clk".
> > +- clock-rate:           Initial clock rate to be configured. For the shared clocks, the default value                       is set to zero so that minimum clock value is configured. Non-zero clock
> > +                       value can be used to configure DP pixel clock.
>
> This should be a clock provider, no?
>
> > +
> > +
> > +[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
> > +[2] Documentation/devicetree/bindings/graph.txt
> > +
> > +Example:
> > +       msm_dp: dp_display@ae90000{
> > +               cell-index = <0>;
> > +               compatible = "qcom,dp-display";
> > +
> > +               reg =   <0 0x90000 0x0dc>,
> > +                       <0 0x90200 0x0c0>,
> > +                       <0 0x90400 0x508>,
> > +                       <0 0x90a00 0x094>,
> > +                       <1 0xeaa00 0x200>,
> > +                       <1 0xea200 0x200>,
> > +                       <1 0xea600 0x200>,
> > +                       <2 0x02000 0x1a0>,
> > +                       <3 0x00000 0x621c>,
> > +                       <1 0xea000 0x180>,
> > +                       <1 0xe8000 0x20>,
> > +                       <4 0xe1000 0x034>;
> > +               reg-names = "dp_ahb", "dp_aux", "dp_link",
> > +                       "dp_p0", "dp_phy", "dp_ln_tx0", "dp_ln_tx1",
> > +                       "dp_mmss_cc", "qfprom_physical", "dp_pll",
> > +                       "usb3_dp_com", "hdcp_physical";
> > +
> > +               interrupt-parent = <&mdss>;
> > +               interrupts = <12 0>;
> > +
> > +               extcon = <&usb_1_ssphy>;
> > +               clocks =  <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
> > +                       <&rpmhcc RPMH_CXO_CLK>,
> > +                       <&gcc GCC_USB3_PRIM_CLKREF_CLK>,
> > +                       <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
> > +                       <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>,
> > +                       <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
> > +                       <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
> > +                       <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>,
> > +                       <&dispcc DISP_CC_MDSS_DP_CRYPTO_CLK>,
> > +                       <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
> > +               clock-names = "core_aux_clk", "core_ref_clk_src",
> > +                       "core_usb_ref_clk", "core_usb_cfg_ahb_clk",
> > +                       "core_usb_pipe_clk", "ctrl_link_clk",
> > +                       "ctrl_link_iface_clk", "ctrl_pixel_clk",
> > +                       "crypto_clk", "pixel_clk_rcg";
> > +
> > +               pll-node = <&dp_pll>;
> > +               qcom,aux-cfg0-settings = [20 00];
> > +               qcom,aux-cfg1-settings = [24 13 23 1d];
> > +               qcom,aux-cfg2-settings = [28 24];
> > +               qcom,aux-cfg3-settings = [2c 00];
> > +               qcom,aux-cfg4-settings = [30 0a];
> > +               qcom,aux-cfg5-settings = [34 26];
> > +               qcom,aux-cfg6-settings = [38 0a];
> > +               qcom,aux-cfg7-settings = [3c 03];
> > +               qcom,aux-cfg8-settings = [40 bb];
> > +               qcom,aux-cfg9-settings = [44 03];
> > +
> > +               qcom,max-pclk-frequency-khz = <675000>;
> > +
> > +               qcom,ctrl-supply-entries {
> > +                       #address-cells = <1>;
> > +                       #size-cells = <0>;
> > +
> > +                       qcom,ctrl-supply-entry@0 {
> > +                               reg = <0>;
> > +                               qcom,supply-name = "vdda-1p2";
> > +                               qcom,supply-min-voltage = <1200000>;
> > +                               qcom,supply-max-voltage = <1200000>;
> > +                               qcom,supply-enable-load = <21800>;
> > +                               qcom,supply-disable-load = <4>;
> > +                       };
> > +               };
> > +
> > +               qcom,phy-supply-entries {
> > +                       #address-cells = <1>;
> > +                       #size-cells = <0>;
> > +
> > +                       qcom,phy-supply-entry@0 {
> > +                               reg = <0>;
> > +                               qcom,supply-name = "vdda-0p9";
> > +                               qcom,supply-min-voltage = <880000>;
> > +                               qcom,supply-max-voltage = <880000>;
> > +                               qcom,supply-enable-load = <36000>;
> > +                               qcom,supply-disable-load = <32>;
> > +                       };
> > +               };
> > +
> > +               ports {
> > +                       #address-cells = <1>;
> > +                       #size-cells = <0>;
> > +
> > +                       port@0 {
> > +                               reg = <0>;
> > +                               dp_in: endpoint {
> > +                                       remote-endpoint = <&dpu_intf0_out>;
> > +                               };
> > +                       };
> > +
> > +                       port@1 {
> > +                               reg = <1>;
> > +                               dp_out: endpoint {
> > +                               };
> > +                       };
> > +               };
> > +       };
> > +
> > +       dp_pll: dp-pll@c011000 {
> > +               compatible = "qcom,dp-pll-10nm";
> > +               label = "DP PLL";
> > +               cell-index = <0>;
> > +               #clock-cells = <1>;
> > +
> > +               reg = <1 0xea000 0x200>,
> > +                     <1 0xeaa00 0x200>,
> > +                     <1 0xea200 0x200>,
> > +                     <1 0xea600 0x200>,
> > +                     <2 0x03000 0x8>;
> > +               reg-names = "pll_base", "phy_base", "ln_tx0_base",
> > +                       "ln_tx1_base", "gdsc_base";
> > +
> > +               clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> > +                        <&gcc GCC_USB3_PRIM_CLKREF_CLK>,
> > +                        <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
> > +                        <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
> > +               clock-names = "iface_clk", "ref_clk",
> > +                       "cfg_ahb_clk", "pipe_clk";
> > +               clock-rate = <0>;
> > +
> > +       };
> > diff --git a/Documentation/devicetree/bindings/display/msm/dpu.txt b/Documentation/devicetree/bindings/display/msm/dpu.txt
> > index a61dd40..eac6e1c 100644
> > --- a/Documentation/devicetree/bindings/display/msm/dpu.txt
> > +++ b/Documentation/devicetree/bindings/display/msm/dpu.txt
> > @@ -63,8 +63,9 @@ Required properties:
> >         Documentation/devicetree/bindings/graph.txt
> >         Documentation/devicetree/bindings/media/video-interfaces.txt
> >
> > -       Port 0 -> DPU_INTF1 (DSI1)
> > -       Port 1 -> DPU_INTF2 (DSI2)
> > +       Port 0 -> DPU_INTF0 (DP)
> > +       Port 1 -> DPU_INTF1 (DSI1)
> > +       Port 2 -> DPU_INTF2 (DSI2)
> >
> >  Optional properties:
> >  - assigned-clocks: list of clock specifiers for clocks needing rate assignment
> > @@ -125,13 +126,20 @@ Example:
> >
> >                                 port@0 {
> >                                         reg = <0>;
> > -                                       dpu_intf1_out: endpoint {
> > -                                               remote-endpoint = <&dsi0_in>;
> > +                                       dpu_intf0_out: endpoint {
> > +                                               remote-endpoint = <&dp_in>;
> >                                         };
> >                                 };
> >
> >                                 port@1 {
> >                                         reg = <1>;
> > +                                       dpu_intf1_out: endpoint {
> > +                                               remote-endpoint = <&dsi0_in>;
> > +                                       };
> > +                               };
> > +
> > +                               port@2 {
> > +                                       reg = <2>;
> >                                         dpu_intf2_out: endpoint {
> >                                                 remote-endpoint = <&dsi1_in>;
> >                                         };
> > --
> > The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> > a Linux Foundation Collaborative Project
> >
>
>
> ------------------------------
>
> Subject: Digest Footer
>
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
>
>
> ------------------------------
>
> End of Freedreno Digest, Vol 70, Issue 26
> *****************************************
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
