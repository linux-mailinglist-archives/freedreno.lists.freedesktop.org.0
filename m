Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9159C18AD56
	for <lists+freedreno@lfdr.de>; Thu, 19 Mar 2020 08:31:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BFC56E286;
	Thu, 19 Mar 2020 07:31:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 942216E0F0
 for <freedreno@lists.freedesktop.org>; Thu, 19 Mar 2020 07:31:23 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id d15so1236586iog.3
 for <freedreno@lists.freedesktop.org>; Thu, 19 Mar 2020 00:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=jomgdCLpahd3FAv2npbYPI8+FQ6XSFwP0NwoJcIKrDI=;
 b=e73vgvqvEk9vZ1wrZML1M7ZRhdJPyQbn3ASJuasCtdVSk4d6DVOILSLWkLdgCvOFru
 KpGdOKO0M9xNtv2NLG2c4t+hHkEuPMIL6Ynr1IW61Arfphb9TVvOlNXp3GVgtQjZIfNU
 pXZr/QdwafVJDpQoEH3YZrlhbnZsamS7APlvzqH7SoF+mvRYQpzSMyGcXIho+f3bA2zx
 R8YVhjwUboS+zCc9x8oQXTA21BQHDcpWeG8//5Nu16f6UpRY/GogKoI45vMPSYXKPoHX
 yXkuT2yuc/mWUTGqYCHWUkCdlGVqcTxzJalSJlRNs5WCTGx9lz8KwwRHCQCOdUeyL7eI
 2X/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=jomgdCLpahd3FAv2npbYPI8+FQ6XSFwP0NwoJcIKrDI=;
 b=fAzEFInts7yrp4P5gu+j6itDfuIEFk7NEBxt78N6sOazj8Q4DMp24/Np6cs13GDSng
 4/ub3XwrzmtKq3OzOYkztxMKVyIxab8ezG432jV/onBX+1z2pLD/zhlnpxNaCv9c64Yb
 TzIpF1/rIKCjB+JnMf2y6cn/N5SqnI+kvpZyfPN20f5lVVISgcWxO2YPE+iEaN5mMYDZ
 VSjrAFaqBhCFHBOXb1wxevyxylMSTP8d+GYDTEJyGZGkcExLw1aCAm8u3jjSSK2HC5qg
 68Sgi2/K9R14OAkUc4rsMNYxp8lEdcfvAW/ianMv4UUKs9e3Cjkh51zA5jnWlsWElQ2s
 koWw==
X-Gm-Message-State: ANhLgQ1czmrXnmgirp4JhX1lxFYXEzJWG1P6TqUvoRXYuz0FHI3rTV39
 Wu+qMshttRlM2Qqg+fbiGgy/hx5nrnDsM8SEtChG3hes
X-Google-Smtp-Source: ADFU+vv6bG3YgVuAvhITGXQ3/8y6DKdabygw3bmdHZm6PMcbVAy6NA+GKIaxrmykbd76jG9NytI3zjUmCE1DIZxCIqE=
X-Received: by 2002:a02:7f44:: with SMTP id r65mr1962710jac.26.1584603082412; 
 Thu, 19 Mar 2020 00:31:22 -0700 (PDT)
MIME-Version: 1.0
From: Vinay Simha B N <simhavcs@gmail.com>
Date: Thu, 19 Mar 2020 13:01:10 +0530
Message-ID: <CAGWqDJ7AccvoxjKfQJ3GytJ-+u56Bk3rEn0sSYv-zCuBe1brAg@mail.gmail.com>
To: "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [Freedreno] graph connection to node is not bidirectional
 kernel-5.6.0-rc6
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

hi,

I am getting the endpoint' is not bidirectional(d2l_in, dsi0_out)
warning in compilation, built boot image works on qcom apq8016-ifc6309
board with the dsi->bridge->lvds panel.
Because of this warning i cannot create a .yaml documentation examples.
Please suggest.

tc_bridge: bridge@f {
status = "okay";
    ports {
    #address-cells = <1>;
    #size-cells = <0>;

    port@0 {
        reg = <0>;
        d2l_in: endpoint {
            remote-endpoint = <&dsi0_out>;
        };
    };
};

dsi@1a98000 {
    status = "okay";
...
    ports {
        port@1 {
            dsi0_out:endpoint {
                remote-endpoint = <&d2l_in>;
                data-lanes = <0 1 2 3>;
            };
        };
    };
};

https://github.com/vinaysimhabn/kernel-msm/blob/1cbd104cca4ebfb111c92e939ca09f82aac00aa1/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
https://github.com/vinaysimhabn/kernel-msm/blob/08e4821646b5c128559c506a5777d8782f1ff79e/Documentation/devicetree/bindings/display/bridge/toshiba%2Ctc358775.yaml

arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi:253.28-255.9: Warning
(graph_endpoint): /soc/i2c@78b8000/bridge@39/ports/port@0/endpoint:
graph connection to node
'/soc/mdss@1a00000/dsi@1a98000/ports/port@1/endpoint' is not
bidirectional
arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi:333.53-335.35: Warning
(graph_endpoint): /soc/auo,b101xtn01/port/endpoint: graph connection
to node '/soc/i2c@78b8000/bridge@f/ports/port@1/endpoint' is not
bidirectional

-- 
regards,
vinaysimha
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
