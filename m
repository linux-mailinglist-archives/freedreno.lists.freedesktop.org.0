Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BD867126E
	for <lists+freedreno@lfdr.de>; Wed, 18 Jan 2023 05:13:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 064FB10E671;
	Wed, 18 Jan 2023 04:12:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6973610E66E
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jan 2023 04:12:54 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id v6so37255951ejg.6
 for <freedreno@lists.freedesktop.org>; Tue, 17 Jan 2023 20:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cKUFMUuC1mjW2I+55wNX6rF9nT8cDKjOOif5GeIpc7A=;
 b=wEwM3ODNU0MowFecviicvfnDW0dJpG75Qv0ExZ3a3pelAnpBJasRKpOnZ6j6+devK9
 HbVPw2a7RTyw0ZVqCywthztmlTNs1lHeNCL6tx/zvKdeBUJzlcT8EzYq9nHnXJk2RBgm
 Jz3v4CmJQmEkyTwBgZleRXccoDE3WQqi1rTT8gdjxOs+YsuzHhyRgVjJ6/BjBxXpGPOw
 kmRPRI+I+tVVCv3v/pnI7Yk1iuAtDywHHXMmEQdTOLTQGgUMeA10rOPPjUgmOLf/Okil
 911bIZkfxJ6axICvWAhMJBQp15XR2wcNAkbow09GzWWcb0cD4S4k7b8llqHod74Fscd3
 HLXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cKUFMUuC1mjW2I+55wNX6rF9nT8cDKjOOif5GeIpc7A=;
 b=oOFH0+qCOSOLIpReW1FEEPybMT+zu550uzZgQItfUJnUQmC9qbgSWxFP1x2Hgm4TmF
 q6srYIzH8sXMkMSShTZ1W/a3ex07Rm2cDfzIk4ElUUPLhAMLNE7HJOUwNG3j0bZCOukN
 vvubZXK9kDqPkH9GhJz7b4fnRIt2Y+Xg9G0H2N+oUCnTlf63RKeqsh+PgRIDjuXpJ9xv
 LELxd0pZUwQzgyCPRbfm3DbsYct5DosuhfneNPXgGQ19mLztO+99Z9PZiMyPVZ1Z4vx6
 XBG7XfLAjtig3gyKMJaxtKdOMihzc7Rhbg12+e9Ci/caQV09RyIsUvqw9m0j7xCoMHGN
 LLrA==
X-Gm-Message-State: AFqh2koxoAU74Xe9g8osI6Bn6e8VvMe5y5cJpXc1xLJP7AF84wUye7E4
 vyq2dT0Y0P9Dfs/MovPbp4Z2zA==
X-Google-Smtp-Source: AMrXdXvN1wWQAbY/8RhWhTDjJ4y3Gmo4ScpVY5GcZ+s1FciLYFRvitJ90f6oITqDZ2nrIsr5sPAzxA==
X-Received: by 2002:a17:907:9623:b0:869:236c:ac40 with SMTP id
 gb35-20020a170907962300b00869236cac40mr6677727ejc.31.1674015174016; 
 Tue, 17 Jan 2023 20:12:54 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 hp24-20020a1709073e1800b008720c458bd4sm2314100ejc.3.2023.01.17.20.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 20:12:53 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Wed, 18 Jan 2023 06:12:39 +0200
Message-Id: <20230118041243.1720520-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118041243.1720520-1-dmitry.baryshkov@linaro.org>
References: <20230118041243.1720520-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v7 07/11] arm64: dts: qcom: add SoC specific
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
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
index cf248e10660b..68cdf255c474 100644
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
index b8cf5c461d98..c05d2a85247e 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -935,7 +935,7 @@ mdss: mdss@900000 {
 			status = "disabled";
 
 			mdp: mdp@901000 {
-				compatible = "qcom,mdp5";
+				compatible = "qcom,msm8996-mdp5", "qcom,mdp5";
 				reg = <0x00901000 0x90000>;
 				reg-names = "mdp_phys";
 
diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index e08ead06d4d3..d1542335be74 100644
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
index d6908aa4c6e1..f0f27fc12c18 100644
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

