Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E13661E4B
	for <lists+freedreno@lfdr.de>; Mon,  9 Jan 2023 06:14:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AA8410E281;
	Mon,  9 Jan 2023 05:14:14 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE1F910E275
 for <freedreno@lists.freedesktop.org>; Mon,  9 Jan 2023 05:14:07 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id j17so11287504lfr.3
 for <freedreno@lists.freedesktop.org>; Sun, 08 Jan 2023 21:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QUdirdX7P4Wo7cXSRmpMI1Qs3iZu/Yop9djIK4BzOsE=;
 b=PCCnebfhaqmKEGpaRzEdSbxSOE9ISfelUMBSWPSYtLGZ3tlKAFogpLnU5FICz5OhFD
 sFYZAHCZQIFCSHdlZ5otgrfeBXQHoQ/eG1XkslOe0CpSyZ11EtnxvkUhPQgFMTKmaYHY
 7LJaeWrIK07PL/DwiU/CT5a1jHWL72NH8rcJ+fc0WQ7urah7Kc6NMOFm2t/Yblo3V5DF
 jY+WpPdRq6/5svaOsbvnB7IXX2VlBxwIcyRjHbQv/mrHb9Z3YCGe29olRi/sW9QbfH0L
 v4jTC1NSR6fiC//DvgNvMWb+xa7nygjKn6TgCcVH8KCuQAQkFuY8Um1ICZi2seANadUL
 5skw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QUdirdX7P4Wo7cXSRmpMI1Qs3iZu/Yop9djIK4BzOsE=;
 b=KqZWHraPbvr1P9ouDerEd8RYG4QhniBSA0/KpwvvjJX8wUzX4sW37e7DHBWZRwmTqa
 GBZbO8vOrrgv3Mcu3R180X90woFIzCQVIXfaDbKal0E1vgBgT+554IXyhgUuEImXxOOq
 LVT4DcPgcGx3m58B7IkXMyMeK7G9PLIQqbpI4jJvh6hnjK6h4aES78dKGWP3YXrZ84Y/
 9CaMDwTDSEI8ZL0TduUKSl2M3yP1SMqVnCEmNucv/WXHjjan4lwVZRJJU0HvcDpEY34H
 XgFrHXVLoDUBJh2cGhOE36Evv3XIq2P+lF0eJmd0dd7xUPrKHMpJQw+v6anjHp8K8bCF
 MUuw==
X-Gm-Message-State: AFqh2kpmmZMbKLCECcyEZa32WI+juvmQH0UWQ+RO3k3JnGn/zsxOlGae
 ZbAhuAhyRmAS1pzYKxP6In3ukw==
X-Google-Smtp-Source: AMrXdXvUAN6buFz4rVx9MWKd8qnwUf1edVie3ZcCVzojhygJZhe6/HposZHRdsbvebYjd407eICksw==
X-Received: by 2002:a05:6512:e9f:b0:4cb:3b24:8390 with SMTP id
 bi31-20020a0565120e9f00b004cb3b248390mr8585769lfb.59.1673241246337; 
 Sun, 08 Jan 2023 21:14:06 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 w4-20020a19c504000000b004b5812207dbsm1426880lfe.201.2023.01.08.21.14.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 21:14:06 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Mon,  9 Jan 2023 07:14:01 +0200
Message-Id: <20230109051402.317577-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109051402.317577-1-dmitry.baryshkov@linaro.org>
References: <20230109051402.317577-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 5/6] arm64: dts: qcom: rename mdp nodes to
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
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/msm8953.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi  | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 8f29d7e49423..591f5552c59d 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -988,7 +988,7 @@ mdss: display-subsystem@1a00000 {
 			#size-cells = <1>;
 			ranges;
 
-			mdp: mdp@1a01000 {
+			mdp: display-controller@1a01000 {
 				compatible = "qcom,msm8916-mdp5", "qcom,mdp5";
 				reg = <0x01a01000 0x89000>;
 				reg-names = "mdp_phys";
diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
index c07b707ff454..dbe506815310 100644
--- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
@@ -755,7 +755,7 @@ mdss: display-subsystem@1a00000 {
 
 			status = "disabled";
 
-			mdp: mdp@1a01000 {
+			mdp: display-controller@1a01000 {
 				compatible = "qcom,msm8953-mdp5", "qcom,mdp5";
 				reg = <0x1a01000 0x89000>;
 				reg-names = "mdp_phys";
diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index b30c35fffe68..409c3c34e8ee 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -930,7 +930,7 @@ mdss: display-subsystem@900000 {
 
 			status = "disabled";
 
-			mdp: mdp@901000 {
+			mdp: display-controller@901000 {
 				compatible = "qcom,msm8996-mdp5", "qcom,mdp5";
 				reg = <0x00901000 0x90000>;
 				reg-names = "mdp_phys";
diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 0bceda788341..9409ca3f3485 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1497,7 +1497,7 @@ mdss: display-subsystem@c900000 {
 			ranges;
 			status = "disabled";
 
-			mdp: mdp@c901000 {
+			mdp: display-controller@c901000 {
 				compatible = "qcom,sdm630-mdp5", "qcom,mdp5";
 				reg = <0x0c901000 0x89000>;
 				reg-names = "mdp_phys";
-- 
2.39.0

