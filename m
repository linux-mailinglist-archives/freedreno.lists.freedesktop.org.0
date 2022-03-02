Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 306254CB296
	for <lists+freedreno@lfdr.de>; Wed,  2 Mar 2022 23:54:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFF7E10E5B8;
	Wed,  2 Mar 2022 22:54:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E33E10E5B8
 for <freedreno@lists.freedesktop.org>; Wed,  2 Mar 2022 22:54:16 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id r20so4409595ljj.1
 for <freedreno@lists.freedesktop.org>; Wed, 02 Mar 2022 14:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AOixTqbLkmUt5KzDDz/VZJz+gfDZkRumbt+VIp4C3b8=;
 b=ZJPRPff8emMDliBMrMOumvg8Tyr8r4HHVlmNvMmXn1j7p2vRe+p5vnxFfLzIzCsmvK
 yqGO1Ig/+e8vMNjUzR6xryMeSj5m2afjXo0Ft0T+fg+SNuSLkzhQbgKlLuwN0wSE6US7
 w46Z7CMQm1tuuI8Ak/8v4lrECIPl92VIwDuaNhrLGPX9QG0Zf62moh+2CcEk3UBDdbnh
 nh9V/ZUdSad2es4SB8uz1pokLzA5VlViiC07Mz898KsulnuHBet1sn25AALby2lOxAx8
 RideSACTRzeg9dnH9X1S9P1WCr8Zkreol/RlDLM35fAjTEKFjO8pVYky0FOOFW3gsKno
 9QzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AOixTqbLkmUt5KzDDz/VZJz+gfDZkRumbt+VIp4C3b8=;
 b=P8yegP59cy/6yxa7KXx0JViuANI4czl62AlBeYfPcsHIYyw+KaXMG087RR3CwJjhAG
 EPmdLITsHxWYhzGlAUCmrNKjgadGtKBJTceQaUGrdNGryLyEoMRq/P7a7y5hZbWhmqof
 IrTZEWJ5zWIM1lADeg+XBYjjfdhbYgD2bSWwSO9qlNf2opqslcqNqCL2id9bPuxo9u08
 UqQK4qTA1vO8sX9m4MkVhTIf26mVF5Hr+uBIr6Z+75dmUmn4g2SKfVP+hp743moJp01C
 ekqvy9RREyPKGYd7+eFQchOeOHn/FP7Pza/PZbVyLwY7O3OYRkj4m+o9XiI/izO4YeES
 7frQ==
X-Gm-Message-State: AOAM5338r9Bf0K8O8WIZK07sLcMh1B2Zm2gYvwL8Wgkc1rIEVGcUpvMd
 jWlf2I9x25h0GCoYpZsAqWlSxHWmI7WlIA==
X-Google-Smtp-Source: ABdhPJxARxRyH3owoYzra3Hd1juOU7X3fQJJZnKHh25cR+Hv5iHYGwUWAXaSIKOhINzWL1fiblj5MA==
X-Received: by 2002:a2e:3c0b:0:b0:245:f5f8:3f4a with SMTP id
 j11-20020a2e3c0b000000b00245f5f83f4amr21345019lja.483.1646261654968; 
 Wed, 02 Mar 2022 14:54:14 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
 by smtp.gmail.com with ESMTPSA id
 x26-20020a05651c105a00b00246585ccd53sm54236ljm.75.2022.03.02.14.54.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 14:54:14 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>
Date: Thu,  3 Mar 2022 01:54:07 +0300
Message-Id: <20220302225411.2456001-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302225411.2456001-1-dmitry.baryshkov@linaro.org>
References: <20220302225411.2456001-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 2/6] arm64: dts: qcom: sdm630: Drop flags for
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
Fixes: b52555d590d1 ("arm64: dts: qcom: sdm630: Add MDSS nodes")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 240293592ef9..7f875bf9390a 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1453,7 +1453,7 @@ mdp: mdp@c901000 {
 				reg-names = "mdp_phys";
 
 				interrupt-parent = <&mdss>;
-				interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <0>;
 
 				assigned-clocks = <&mmcc MDSS_MDP_CLK>,
 						  <&mmcc MDSS_VSYNC_CLK>;
@@ -1530,7 +1530,7 @@ dsi0: dsi@c994000 {
 				power-domains = <&rpmpd SDM660_VDDCX>;
 
 				interrupt-parent = <&mdss>;
-				interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <4>;
 
 				assigned-clocks = <&mmcc BYTE0_CLK_SRC>,
 						  <&mmcc PCLK0_CLK_SRC>;
-- 
2.34.1

