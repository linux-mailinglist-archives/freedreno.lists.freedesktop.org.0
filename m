Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2888B570836
	for <lists+freedreno@lfdr.de>; Mon, 11 Jul 2022 18:23:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D187A8BDB0;
	Mon, 11 Jul 2022 16:23:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61D3D8EE3C
 for <freedreno@lists.freedesktop.org>; Mon, 11 Jul 2022 16:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1657556616; x=1689092616;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=5W/cyp9V2EZN6jUCGc0So5pslzJEKD7nlHQUJeYIWQQ=;
 b=Zz3dFKUR5kotdqmNNQAdADA4TkJxq8eUCjkUNaitMGzyih9jeL/fPUVq
 BjmAAOOSj0y3ojtvWY3MIwg8G8D5oh120PSA8aXHPrLxL62dcKo7eZ07p
 NxxBzRFNys/ZdZ5ZxLIDhvaDjhtxWGNGGAFgC1Ov72g176Zvsb4mdT2Z0 A=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 11 Jul 2022 09:23:35 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2022 09:23:35 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 11 Jul 2022 09:23:34 -0700
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 11 Jul 2022 09:23:34 -0700
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <robdclark@gmail.com>, <sean@poorly.run>, <swboyd@chromium.org>,
 <dianders@chromium.org>, <vkoul@kernel.org>, <agross@kernel.org>,
 <bjorn.andersson@linaro.org>, <robh+dt@kernel.org>,
 <devicetree@vger.kernel.org>
Date: Mon, 11 Jul 2022 09:23:23 -0700
Message-ID: <1657556603-15024-1-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Subject: [Freedreno] [PATCH v2] arm64: dta: qcom: sc7280: delete vdda-1p2
 and vdda-0p9 from both dp and edp
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, quic_khsieh@quicinc.com, quic_mkrishn@quicinc.com,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org,
 quic_kalyant@quicinc.coml, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Both vdda-1p2-supply and vdda-0p9-supply regulators are controlled
by dp combo phy. Therefore remove them from dp controller.

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 2 --
 arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi     | 3 ---
 2 files changed, 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
index ed800817..3f8996c 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
@@ -435,8 +435,6 @@ ap_i2c_tpm: &i2c14 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&dp_hot_plug_det>;
 	data-lanes = <0 1>;
-	vdda-1p2-supply = <&vdd_a_usbssdp_0_1p2>;
-	vdda-0p9-supply = <&vdd_a_usbssdp_0_core>;
 };
 
 &mdss_mdp {
diff --git a/arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi b/arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi
index 4c25ffc..7adf31b 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi
@@ -311,9 +311,6 @@
 
 /* NOTE: Not all Qcards have eDP connector stuffed */
 &mdss_edp {
-	vdda-0p9-supply = <&vdd_a_edp_0_0p9>;
-	vdda-1p2-supply = <&vdd_a_edp_0_1p2>;
-
 	aux-bus {
 		edp_panel: panel {
 			compatible = "edp-panel";
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

