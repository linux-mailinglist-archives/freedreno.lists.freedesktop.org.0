Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D59661E42
	for <lists+freedreno@lfdr.de>; Mon,  9 Jan 2023 06:14:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1389810E279;
	Mon,  9 Jan 2023 05:14:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 556BF10E276
 for <freedreno@lists.freedesktop.org>; Mon,  9 Jan 2023 05:14:07 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id bp15so11246450lfb.13
 for <freedreno@lists.freedesktop.org>; Sun, 08 Jan 2023 21:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EAxq034OgfxUipqwETVV7Sy0Fik2MnAZjCzMBugBu3E=;
 b=T7/poY1QhmqKPzd579h/kBbIg8nygrFOA2fwHI9uE6uGTqG8GNXhLbWpDneJiA8+rO
 FQhO9YfHfKJHXrHoKrzDHxe7oYUsNc0+9aW9U/Htj8y8iXhsGuQbuXe2TrlS5B92oG4B
 DnKoiOXRj0kf/cPKuJiGgWCq20awiQ4V5jQqXykiuQF7MRaRyrHP4HHwQ9FOSR8sALSG
 vfZ/rPfWVl6BEMVRFJV3XMqWC28iorcJbdQafAUsQFLgpb/5DlogkckekktwdELKHsGV
 ORIDSmML5mXMzOGRRGwRBNCo/4JSnoBaU4TYiszkd8bWVeQKP1dP1rHpOeiBVmfEqg/L
 AXYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EAxq034OgfxUipqwETVV7Sy0Fik2MnAZjCzMBugBu3E=;
 b=gAd8iWOBfJzU/JrX9XnqalwHGTOfn/AAITNPmujAdBsuCBn8QAzxNAqx/7WWRy8YYB
 uTfR96xVU3m31lYfipw56mtpnTC19XsO8goQWhNOVfMYxqgEenJRQcc1HtyE0ZEgHYUq
 FP9uVoSmtiwwYqh3JT4sOmrIBsEt9g1EApl/ngqA67vPfQ0ER0QT4sQcEVxZuiuhp/mp
 bPSWZEJ0+0dgZ/mP0F2SthnSq6fCAriwBaylunbGxvwHgHdjlxbJxMSOZYwcD/ij3JiL
 v352SeKaTaQKhxmB1Xmm4OhhPMTFTEL/ybWuvkJF0wgGX3EXbG5rYKB5OrY82W4OD78z
 /NhA==
X-Gm-Message-State: AFqh2koC/muMq9aT+awyuPAC5r5rDBoudqiHExmHstEZv6HckB5eednt
 QB1ayMgRBpKnO0Omdyi6NsHPBg==
X-Google-Smtp-Source: AMrXdXuXaajJKnDAKPif1tDGE/K2iX1nu1h/lH1gLquiBgvEfngbCyQ4iV34+hlDjzoO4NLB66QzvQ==
X-Received: by 2002:ac2:50d9:0:b0:4cb:2c19:ec21 with SMTP id
 h25-20020ac250d9000000b004cb2c19ec21mr8552578lfm.0.1673241246933; 
 Sun, 08 Jan 2023 21:14:06 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 w4-20020a19c504000000b004b5812207dbsm1426880lfe.201.2023.01.08.21.14.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 21:14:06 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Mon,  9 Jan 2023 07:14:02 +0200
Message-Id: <20230109051402.317577-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109051402.317577-1-dmitry.baryshkov@linaro.org>
References: <20230109051402.317577-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 6/6] ARM: dts: qcom: rename mdp nodes to
 display-controller
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Follow the schema change and rename mdp nodes to generic name
'display-controller'.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 2 +-
 arch/arm/boot/dts/qcom-msm8974.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index 363e75078a0a..5fdd78477666 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -1492,7 +1492,7 @@ hdmi_phy: phy@4a00400 {
 			status = "disabled";
 		};
 
-		mdp: mdp@5100000 {
+		mdp: display-controller@5100000 {
 			compatible = "qcom,mdp4";
 			reg = <0x05100000 0xf0000>;
 			interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index bb69247d7ebd..96b78bd85f35 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1548,7 +1548,7 @@ mdss: display-subsystem@fd900000 {
 			#size-cells = <1>;
 			ranges;
 
-			mdp: mdp@fd900000 {
+			mdp: display-controller@fd900000 {
 				compatible = "qcom,msm8974-mdp5", "qcom,mdp5";
 				reg = <0xfd900100 0x22000>;
 				reg-names = "mdp_phys";
-- 
2.39.0

