Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 919B956A797
	for <lists+freedreno@lfdr.de>; Thu,  7 Jul 2022 18:12:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED23911B1F3;
	Thu,  7 Jul 2022 16:11:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4C9211B1F4;
 Thu,  7 Jul 2022 16:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1657210318; x=1688746318;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=Qgry4ruyTQ3cr6aDgMN4Adk0Rw6bWhgUBj7xtKHRZQ8=;
 b=UlK96L142OfzGtwoyLytb/GUu5qUHiNyNNHCsu5hgHFYK57JuMwRCEdI
 OYsUiKcBViF7evN4oyGn1xFEtcTDVVcYuvpTHXpz1KxhbBeTdan3X+xwf
 /oP4YIc4MgoaJqzzPy7Gtf1abhHG4R2MuMukyBB403f0vQuYLgs2Id/eq A=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 07 Jul 2022 09:11:57 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2022 09:11:56 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 7 Jul 2022 09:11:56 -0700
Received: from hyd-lnxbld559.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 7 Jul 2022 09:11:51 -0700
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: freedreno <freedreno@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>, Rob Clark
 <robdclark@gmail.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Date: Thu, 7 Jul 2022 21:41:00 +0530
Message-ID: <20220707213950.5.I7291c830ace04fce07e6bd95a11de4ba91410f7b@changeid>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1657210262-17166-1-git-send-email-quic_akhilpo@quicinc.com>
References: <1657210262-17166-1-git-send-email-quic_akhilpo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Subject: [Freedreno] [PATCH 5/7] arm64: dts: qcom: sc7280: Update gpu
 register list
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
Cc: devicetree@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-kernel@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Kaehlcke <mka@chromium.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Update gpu register array with gpucc memory region.

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---

 arch/arm64/boot/dts/qcom/sc7280.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index e66fc67..defdb25 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2228,10 +2228,12 @@
 			compatible = "qcom,adreno-635.0", "qcom,adreno";
 			reg = <0 0x03d00000 0 0x40000>,
 			      <0 0x03d9e000 0 0x1000>,
-			      <0 0x03d61000 0 0x800>;
+			      <0 0x03d61000 0 0x800>,
+			      <0 0x03d90000 0 0x2000>;
 			reg-names = "kgsl_3d0_reg_memory",
 				    "cx_mem",
-				    "cx_dbgc";
+				    "cx_dbgc",
+				    "gpucc";
 			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
 			iommus = <&adreno_smmu 0 0x401>;
 			operating-points-v2 = <&gpu_opp_table>;
-- 
2.7.4

