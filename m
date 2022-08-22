Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8DE59C835
	for <lists+freedreno@lfdr.de>; Mon, 22 Aug 2022 21:11:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8F96A0457;
	Mon, 22 Aug 2022 19:11:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34429A044B
 for <freedreno@lists.freedesktop.org>; Mon, 22 Aug 2022 19:11:41 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id d23so12267830lfl.13
 for <freedreno@lists.freedesktop.org>; Mon, 22 Aug 2022 12:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=iMDkWm8TCfHT8OAB3OYo4HTW9w3Q76IKCWQmxSVeQpQ=;
 b=dv1C1kBV3HwxnFUuzxtwuwq+g/+pxFAKNhm6bbtQkIuG6ymC+D2X27JIrkmMSn6PpY
 G5WNxfRMk2JrEg0rMFpYXlG2vN4pbvuyGWo2ZECoAO12VqV2m3UHP/lzazBZHqYkzXgS
 bO448cCNv0vkRNCo75AXz/fOR5NMmRUINCSEQGUeMznKqRAyOLG3Ry/ErOcxg12Dhp7T
 wGdQqh0P5Jf8JFReBoxO/jJrum9rMq0PRjOOwDoMiGhw4tTPTaRLIjl9LbKleB1e01Rn
 kXBaY9ZekMF32f+j++mt85Ahvblf9NzaU/tLI+cwHdCKd5FVXfIyr5j8lre58O5JtmVh
 jRXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=iMDkWm8TCfHT8OAB3OYo4HTW9w3Q76IKCWQmxSVeQpQ=;
 b=ByOPGQvHsUtQgeNS1rb/H1+/Y7Gov6bJtBeISoXRAxOkMUn4ixxYUV7BhjcUp8leo3
 ZAZdnAbAm34ywnIV3MlO7UowSUq/GSzOr5EBty7RHKyexVpAjK9a0wwScvihyrqUb4x8
 XjMwN7pB/O3x4Dhw7+/lR9iHYOOBwdw3kVJNmA22F9KAcpyeeZ7O8WWV1c8zIuMCLabZ
 DeSxSNyHTcOWO1OaTT62hzDJBoGktfJQMxEOzMpm2bOM2m6zTVria2XaRIdPMM8ArYwk
 osha2jPGJh2aZy8mFm+hZ50DTT3FjCqLXgixFw3aYDzDdWP+VlcXMO/0HP3UVa/coz6x
 xa1Q==
X-Gm-Message-State: ACgBeo3zTwMx2oKgl0GzQLTmHXnbUJsaoKbh6AWQC0anQ3MPWXwCkmwV
 fDauwfGS3egdQn/cVFj2BDGoVw==
X-Google-Smtp-Source: AA6agR70vuKeOo3/CtRRcy/X8xj4wYkOtmS/jyu+Q6qlyjuX+3unBEUBymLpNpcfmWnefXqlX0oXKQ==
X-Received: by 2002:a05:6512:3faa:b0:48a:f17a:579e with SMTP id
 x42-20020a0565123faa00b0048af17a579emr8136533lfa.30.1661195499573; 
 Mon, 22 Aug 2022 12:11:39 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 w18-20020a05651234d200b0048b193041easm2059691lfr.209.2022.08.22.12.11.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 12:11:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Mon, 22 Aug 2022 22:11:38 +0300
Message-Id: <20220822191138.316912-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] arm64: dts: qcom: sm8250: move DSI opp table to
 the dsi0 node
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

It makes no sense to have the OPP table for the DSI controllers in the
DSI1 PHY node. Move it to more logical dsi0 device node.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 38 ++++++++++++++--------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index bc773e210023..5843e46a3164 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3571,6 +3571,25 @@ dsi0_out: endpoint {
 						};
 					};
 				};
+
+				dsi_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-187500000 {
+						opp-hz = /bits/ 64 <187500000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-300000000 {
+						opp-hz = /bits/ 64 <300000000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-358000000 {
+						opp-hz = /bits/ 64 <358000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+				};
 			};
 
 			dsi0_phy: dsi-phy@ae94400 {
@@ -3663,25 +3682,6 @@ dsi1_phy: dsi-phy@ae96400 {
 				clock-names = "iface", "ref";
 
 				status = "disabled";
-
-				dsi_opp_table: opp-table {
-					compatible = "operating-points-v2";
-
-					opp-187500000 {
-						opp-hz = /bits/ 64 <187500000>;
-						required-opps = <&rpmhpd_opp_low_svs>;
-					};
-
-					opp-300000000 {
-						opp-hz = /bits/ 64 <300000000>;
-						required-opps = <&rpmhpd_opp_svs>;
-					};
-
-					opp-358000000 {
-						opp-hz = /bits/ 64 <358000000>;
-						required-opps = <&rpmhpd_opp_svs_l1>;
-					};
-				};
 			};
 		};
 
-- 
2.35.1

