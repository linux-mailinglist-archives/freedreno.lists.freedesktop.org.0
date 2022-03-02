Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C90334CB298
	for <lists+freedreno@lfdr.de>; Wed,  2 Mar 2022 23:54:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7277D10E7A1;
	Wed,  2 Mar 2022 22:54:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7DDE10E7A1
 for <freedreno@lists.freedesktop.org>; Wed,  2 Mar 2022 22:54:20 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id u11so4390309lju.4
 for <freedreno@lists.freedesktop.org>; Wed, 02 Mar 2022 14:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ct+HHsxGsHDLzwfzMkcRAdVtSfqY+/v1/Z+cLy38KUs=;
 b=MUNo6h87OhnJ1q4r3sMVJSGB10uohuKIkFcFKI308aX70AnD2KzSoSMYi32mU60KHU
 Okw2AzfoYIMnFzH69/0LpuQBjr/tjebbs0WevwUKKPj/8uwDgnB4eM422QZNmUem2p/A
 OSzpCwp724FoAUYgpAeZ3KnbMKyujDGDmLpoq1o6UO9X9YYATHZzAVO7lE7Jxsm2pcbL
 GGM2wzC3ffWvfSfsX6NfPhehA8oyTrSC9rs+PcCA+8q+YRz92Nh4KDCzBqMCl9Q8NF17
 NHZB1bklN/ERQZ1E2+lfmtCFA6SV+1rlDubjHKr+HHLR3VKaTCN4qiedGIlEwGNtcYpV
 oaDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ct+HHsxGsHDLzwfzMkcRAdVtSfqY+/v1/Z+cLy38KUs=;
 b=yT4PdVP+JFdhTOUXEzU0V99x5qNAdIFIU+1uXnMM6yrLo9CIOeQf2ffUo6MsQ9+ozT
 xwZAEAU5YoB/4AmUQNSAUrhd5f8iZlxIRMP8gTLeVjHs3QUet8ZKAOT2ezgElmckCvc6
 tls46rZQS7xVUXS6I9Ypub9ak+DAzQ4V00BTIx8xYGTZwGVJHqCfuRn5aHzYxvp4YMgV
 zXIS0xIb8innUcO58fF6Zyp6VX/nBCSTyn2/WTdyRx5qwDvvLVif1scWqtA0bpxkH+Yt
 xSDMcCa/CZDGW2wYUI1Sh6/muBHW0FC+9nddhA+ckaUjY48QxjnMgEThin1zD5K3DW3R
 Iogw==
X-Gm-Message-State: AOAM530w5YARG82UchL+kbxrgRrCpiTB8qZDslgpqsILVA8g2R1uzrAC
 HjBrkYfJar1dv0rvBjKqDBY3BA==
X-Google-Smtp-Source: ABdhPJzoediskMaar8Th+y7ySLao+HhoVvZdx3f+uLaMrEN0QJ8nhGCC+a/it//BFF7+yvir6wUKsA==
X-Received: by 2002:a05:651c:1718:b0:246:2ab4:6d55 with SMTP id
 be24-20020a05651c171800b002462ab46d55mr22651063ljb.395.1646261658854; 
 Wed, 02 Mar 2022 14:54:18 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
 by smtp.gmail.com with ESMTPSA id
 x26-20020a05651c105a00b00246585ccd53sm54236ljm.75.2022.03.02.14.54.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 14:54:18 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>
Date: Thu,  3 Mar 2022 01:54:10 +0300
Message-Id: <20220302225411.2456001-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302225411.2456001-1-dmitry.baryshkov@linaro.org>
References: <20220302225411.2456001-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 5/6] arm64: dts: qcom: sm8250: Drop flags for
 mdss irqs
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
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 freedreno@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The number of interrupt cells for the mdss interrupt controller is 1,
meaning there should only be one cell for the interrupt number, not two.
Drop the second cell containing (unused) irq flags.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Fixes: 7c1dffd471b1 ("arm64: dts: qcom: sm8250.dtsi: add display system nodes")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index fdaf303ba047..956848068871 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3200,7 +3200,7 @@ mdss_mdp: mdp@ae01000 {
 				power-domains = <&rpmhpd SM8250_MMCX>;
 
 				interrupt-parent = <&mdss>;
-				interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <0>;
 
 				ports {
 					#address-cells = <1>;
@@ -3252,7 +3252,7 @@ dsi0: dsi@ae94000 {
 				reg-names = "dsi_ctrl";
 
 				interrupt-parent = <&mdss>;
-				interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <4>;
 
 				clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
 					 <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
@@ -3325,7 +3325,7 @@ dsi1: dsi@ae96000 {
 				reg-names = "dsi_ctrl";
 
 				interrupt-parent = <&mdss>;
-				interrupts = <5 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <5>;
 
 				clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK>,
 					 <&dispcc DISP_CC_MDSS_BYTE1_INTF_CLK>,
-- 
2.34.1

