Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B87661B99
	for <lists+freedreno@lfdr.de>; Mon,  9 Jan 2023 01:38:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FB1E10E22E;
	Mon,  9 Jan 2023 00:38:28 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6A4C10E22C
 for <freedreno@lists.freedesktop.org>; Mon,  9 Jan 2023 00:38:24 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id g13so10636056lfv.7
 for <freedreno@lists.freedesktop.org>; Sun, 08 Jan 2023 16:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mrb15vphKcBSHFcYnw0cLYDDRYFrhAD7+lVEbzPfwQ8=;
 b=pwfVBT2HYHe9BboGX1na7E1Qz6Ou2AoQIQHEYu0U71gTHI/eegQIWsjONRGZE+h1cA
 64UUdaaFYIN1+opOVxD1m9++F1NSCmSO86qoD0GqjsnOFJZeYruqWRSoFITijjTGPILH
 Auwcu47pCOxDbeVCA3p/smU9z3NUBeYtrHA+plyTg7+wgmOP/GoOWUnohMX5VLF3i0cV
 EIIa7UyF2DkbpNN0cfjxA1z6xqrZkqLBVQ5WrwsngdUDpGGD0nTOUSrzuDRtT8onyTHL
 NYsOBK/vxtfwfdlZ89JMkP6fb074Y0/ba1TPM7GbOn9ykYc6SwvikK9ksZog6NF3LIc6
 F+pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mrb15vphKcBSHFcYnw0cLYDDRYFrhAD7+lVEbzPfwQ8=;
 b=YBMYOaEnO2HI3h7EutUfG1faQEoG0Mx0pkOSZaUsaleShm7bItpo0R8oss2MBZQPb5
 CqysWvFp9wFsBsNTEdvtbRByjlc0fd+1YJpLxQb4Rg87wCADe9P03dzL4IpWJv5xHDsq
 2lJtrgTuV4N4gLhhX4yQIXT/gNAN/PPnj1IDvAKoCZVzo3UrKFhUG8rnX+vNVPqnvYHU
 jVU76KNjNmxc4NqW1JOdYpf9MXv8t3McfcbUGFjUrlzr628uklHrj8BsTxOh7nsYmBZ1
 Tqlqbcovgqb2PZmnELzlMIBJC2o9J0JvBssaYZBvci0UL6DEMPzWGL+dhcXh3Zz4Wt+Y
 U8qg==
X-Gm-Message-State: AFqh2koOshJg+Q9vB6xg72PqNDScf1xo/3nAxriCGnpLJV188hoNxfKY
 ZcfPn9ILNZSyFvqC2H00HbTAPA==
X-Google-Smtp-Source: AMrXdXthjuqBHR/XrsnzBmMj02IZ5w9/MZL41eQpfbdHMpqKuGEMA3pUrNwkj6lUM0VobgBEAgh8Tw==
X-Received: by 2002:a05:6512:3d94:b0:4a4:68b8:f4f4 with SMTP id
 k20-20020a0565123d9400b004a468b8f4f4mr22544458lfv.58.1673224704322; 
 Sun, 08 Jan 2023 16:38:24 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 v4-20020a056512348400b004b58fadba35sm1297469lfr.296.2023.01.08.16.38.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 16:38:23 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Mon,  9 Jan 2023 02:38:19 +0200
Message-Id: <20230109003819.245803-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109003819.245803-1-dmitry.baryshkov@linaro.org>
References: <20230109003819.245803-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 4/4] arm64: dts: qcom: add SoC specific
 compat strings to mdp5 nodes
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add SoC-specific compat string to the MDP5 device nodes to ease
distinguishing between various platforms.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi  | 2 +-
 arch/arm64/boot/dts/qcom/sdm660.dtsi  | 2 ++
 4 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 2ca8e977fc2a..0a23fb6efae8 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -989,7 +989,7 @@ mdss: mdss@1a00000 {
 			ranges;
 
 			mdp: mdp@1a01000 {
-				compatible = "qcom,mdp5";
+				compatible = "qcom,msm8916-mdp5", "qcom,mdp5";
 				reg = <0x01a01000 0x89000>;
 				reg-names = "mdp_phys";
 
diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index d31464204f69..b5cd1bcad5eb 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -931,7 +931,7 @@ mdss: mdss@900000 {
 			status = "disabled";
 
 			mdp: mdp@901000 {
-				compatible = "qcom,mdp5";
+				compatible = "qcom,msm8996-mdp5", "qcom,mdp5";
 				reg = <0x00901000 0x90000>;
 				reg-names = "mdp_phys";
 
diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 13e6a4fbba27..65addd4c672e 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1498,7 +1498,7 @@ mdss: mdss@c900000 {
 			status = "disabled";
 
 			mdp: mdp@c901000 {
-				compatible = "qcom,mdp5";
+				compatible = "qcom,sdm630-mdp5", "qcom,mdp5";
 				reg = <0x0c901000 0x89000>;
 				reg-names = "mdp_phys";
 
diff --git a/arch/arm64/boot/dts/qcom/sdm660.dtsi b/arch/arm64/boot/dts/qcom/sdm660.dtsi
index d52123cb5cd3..cdaa0d7a66f3 100644
--- a/arch/arm64/boot/dts/qcom/sdm660.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm660.dtsi
@@ -142,6 +142,8 @@ &gpucc {
 };
 
 &mdp {
+	compatible = "qcom,sdm660-mdp5", "qcom,mdp5";
+
 	ports {
 		port@1 {
 			reg = <1>;
-- 
2.39.0

