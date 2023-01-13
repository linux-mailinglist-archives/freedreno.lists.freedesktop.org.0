Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D8C669143
	for <lists+freedreno@lfdr.de>; Fri, 13 Jan 2023 09:37:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF27D10E9B8;
	Fri, 13 Jan 2023 08:37:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E88F10E9BA
 for <freedreno@lists.freedesktop.org>; Fri, 13 Jan 2023 08:37:39 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id bu8so32086963lfb.4
 for <freedreno@lists.freedesktop.org>; Fri, 13 Jan 2023 00:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ygam0JtyGSNqoL4zyLZHudwzPBEZFe3ZjPaOEcOI9x8=;
 b=InN2T44q2+2QlbqDPvQDP5dFLI3SPGsIZuCrAFLih5Mn10C/HPbykwwdX2TAuQQpI7
 B3aWoPh+RyI5e5CHkfS64U6+sAZ9UdLCSleL8kumsDRmz1HM1i5Wf9n/j6z+tpTOkXnA
 jD9erakVtIAzAJysuorCZ9R8d4DyHowvKUUBHRJndh+Iv+sArIU5TmYtQ79oqZLpZe0p
 KKjAXjmVsMekZPCH8Lyrf7jPdqmsuGEHA9ypdkz1iE+6qCtuqG3tzCdLZj57oBrrrNkV
 EhnRfu/tvujR3VBf2UGvbPR2MM9c76C206r5UKexFxsS1gttZnvV+DH4K921E99k8w3A
 OeAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ygam0JtyGSNqoL4zyLZHudwzPBEZFe3ZjPaOEcOI9x8=;
 b=HHqTD23jpsz3GkyeifLsOAv6QwC+v1WYY15I1hjXEge7jFePDsNNwiV0fySlVqx6+Q
 Vgzh2AjD7EOauLQBCHj0MokgUzXZPcBpvyaruF2OZh+lh1HXnWuAIJd5z2fGgcQUuWSf
 KvRtCA4uC9i9MrfZkeUBG/H9s/r6ZCDpE6igOMmPYqVrQoV7TBB7jFsqdnPkRhJcC5OG
 aiWMme/Rc8y3y5FnPGMix1CmKLFnq71CR37xpHlOqKfPzhn6taVf594t7rAbl+HCkd0X
 HlByO2+ZrXPKt8r4LgHGkQHTlffBeR3hT8whz6kqXvrCBtNUQ8awEaFuXUANV/8TqYI+
 sG9g==
X-Gm-Message-State: AFqh2kquC0XyotHlkLSydX1PoWIpKnwSu2rQOm2Cn5IpR2pq7O5Q5g8G
 WBJw9i8K8nHayQmiXQDFHm14Dg==
X-Google-Smtp-Source: AMrXdXuf1vf2Ydl1TyNZ/2incZgzsnd0vwxj+MNY81XQB2uiaCvgUWIpD5RbZZYPnQZH0qiwzOPnGg==
X-Received: by 2002:a05:6512:318d:b0:4b5:70e0:f2e6 with SMTP id
 i13-20020a056512318d00b004b570e0f2e6mr5754158lfe.24.1673599058652; 
 Fri, 13 Jan 2023 00:37:38 -0800 (PST)
Received: from eriador.lumag.spb.ru ([194.204.33.9])
 by smtp.gmail.com with ESMTPSA id
 o6-20020a05651205c600b004994117b0fdsm3748038lfo.281.2023.01.13.00.37.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 00:37:38 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Fri, 13 Jan 2023 10:37:19 +0200
Message-Id: <20230113083720.39224-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113083720.39224-1-dmitry.baryshkov@linaro.org>
References: <20230113083720.39224-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v6 10/11] arm64: dts: qcom: rename mdp nodes to
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
index b688df272207..027eb99340e2 100644
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
index 9d4b785409b1..4e17bc9f8167 100644
--- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
@@ -699,7 +699,7 @@ mdss: display-subsystem@1a00000 {
 
 			status = "disabled";
 
-			mdp: mdp@1a01000 {
+			mdp: display-controller@1a01000 {
 				compatible = "qcom,msm8953-mdp5", "qcom,mdp5";
 				reg = <0x1a01000 0x89000>;
 				reg-names = "mdp_phys";
diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 1be9a92fc8c1..50cc6f125557 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -932,7 +932,7 @@ mdss: display-subsystem@900000 {
 
 			status = "disabled";
 
-			mdp: mdp@901000 {
+			mdp: display-controller@901000 {
 				compatible = "qcom,msm8996-mdp5", "qcom,mdp5";
 				reg = <0x00901000 0x90000>;
 				reg-names = "mdp_phys";
diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 2ca2f75f2aa7..5827cda270a0 100644
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

