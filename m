Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C6B4C9A2B
	for <lists+freedreno@lfdr.de>; Wed,  2 Mar 2022 01:52:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6589410E944;
	Wed,  2 Mar 2022 00:52:20 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B51010E927
 for <freedreno@lists.freedesktop.org>; Wed,  2 Mar 2022 00:52:19 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id e8so158437ljj.2
 for <freedreno@lists.freedesktop.org>; Tue, 01 Mar 2022 16:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mdO1kFafRmQB1ylhJ2FjgGW8EzDUwR+K8t4/Xs4kq9Q=;
 b=Fxtmo3aMycl7xk+Lul0LSWm5TG/mfwTVTqYPa+KjBqw5rC0QwR7Ao0sUfevGtF5LD4
 k64tX8Oo4Lji0Neh2ivP2XcbTNozVjQZ02oR1Nq42hy8yNDHgzFbvVup1KAMGd/AUj4z
 J5bd2yGF/yd/cXGRy8M0E6h1bI/X2QcQUDBFaSpPSmogfHEwn3hhkFEkxYGOVvU0fhVW
 uEVLgFXq+9blz33lpJTojXDydraVexwlMs0VZ/Ra4aQG66KwSwbME0Ze4wWQuv4GjwkD
 SnEsJAQw7eFWZc2JRZ+m931di+scS7Ohj+zfIR4887/m6dwmD/D6YZCL7mvTovY+c/w7
 +zNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mdO1kFafRmQB1ylhJ2FjgGW8EzDUwR+K8t4/Xs4kq9Q=;
 b=ACmOwI9VcqWXxNePWVAq29El+ZrJcj5aiSSwU9aRktlU5QLWR/bDsi5G/Me8qGSFua
 RCWnBlDpwRZ17JjF9XKeQLgQYSmOqT4NMvfpphhDr0OqMm9NKr9RQXFao0nZ6nzHWxu7
 N6ZS9siabqmEs3efaKoSj9z9DL3aZhQbBOMQl9ZCGI8HEqJsjQ0qrqcbEBOoaI0VTzhh
 rRUp1TqALLgHO0w/qsdz1dGnr7ovWHV+zyiDhNCSNboSiPoQajngtQxjsKKYIdHvturC
 raUEnmw6YRO82+/JFK4DpnnuQ5WwFKrqKE7kU9uu8l2xVJ/Iqa4P/fSlwjvHpLTalJVq
 TAqg==
X-Gm-Message-State: AOAM530v3uRf7o5l/Z89ldhAw6O583ZApUsco0c1x2NBfwXXYEbp3DeL
 g+7kxNkA/C5vidWoHgHWj71gJg==
X-Google-Smtp-Source: ABdhPJxpIAoiAGbopIhIpyPpAucdmEDZ21agCkEkSvjzXqvdU+rcmpCfmeynxX6N0Hks9plHTf6bhQ==
X-Received: by 2002:a05:651c:1209:b0:22e:353c:76c0 with SMTP id
 i9-20020a05651c120900b0022e353c76c0mr18589141lja.139.1646182337477; 
 Tue, 01 Mar 2022 16:52:17 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0:5258:5528:7624:3edd])
 by smtp.gmail.com with ESMTPSA id
 n23-20020a19ef17000000b00445b8db3c42sm198171lfh.172.2022.03.01.16.52.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 16:52:17 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Date: Wed,  2 Mar 2022 03:52:10 +0300
Message-Id: <20220302005210.2267725-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302005210.2267725-1-dmitry.baryshkov@linaro.org>
References: <20220302005210.2267725-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 5/5] arm64: dts: qcom: sm8250: Drop flags for
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The number of interrupt cells for the mdss interrupt controller is 1,
meaning there should only be one cell for the interrupt number, not two.
Drop the second cell containing (unused) irq flags.

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

