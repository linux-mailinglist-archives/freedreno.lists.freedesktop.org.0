Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B9285C2AC
	for <lists+freedreno@lfdr.de>; Tue, 20 Feb 2024 18:31:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 178A210E5D8;
	Tue, 20 Feb 2024 17:31:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VKB6eJEX";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33DA210E5D6
 for <freedreno@lists.freedesktop.org>; Tue, 20 Feb 2024 17:31:07 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2d2505352e6so5889641fa.3
 for <freedreno@lists.freedesktop.org>; Tue, 20 Feb 2024 09:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708450265; x=1709055065; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XTun3sjeHoZPuUA68W/Q0xsVB+hQlqb+IVl/9LKFQL8=;
 b=VKB6eJEXLurqReVH+RyA7x8u7y02gjRZTTMDncF4Lpwp3TTDuzOjjKcfA7wScUGAuX
 eZQgokQpzoLgrRAGIJBoxI2otxexR2oCKqWtw8NH1A8JZNdFd6wTCuy4U2OkfvSwMDKq
 nkR32rsdE8MW3z3lyiiIuz7YQTpLmGJuBJK2gr/rXXf7kVn9M+WLJ3sdGoiA5llkevzV
 5yOlAdmZP1ayNkUfWn0kYZgInquxV4bu9qdNM3OT4Wc24NJgrWecu5f81HY90q6fWw2W
 wO/L92QmQ8/WrjcbjFgoYCEEbCWvkiRL8zNpERf8LJDOXk/vEW3gPuNxGf97KnP6Vvqw
 D78w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708450265; x=1709055065;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XTun3sjeHoZPuUA68W/Q0xsVB+hQlqb+IVl/9LKFQL8=;
 b=Y5AguzFgAOGiWvz80j0SQ4p1nq8QCO2U6yfpkFKlcwSZ1L4jKeWZLiNZ2NnzHDIsc4
 1HfOqZS4/xDyO8ZWI+2P5lkz0cmvd/Zuum0XnmpEv7uOm3sj+5l+Qb7QWkfOZQ3yQL7o
 Z8toYaUPgbjZCBkFbwK+yqIM+6qvNoQZafH5UUpoeuryQK0TuwCLcdqLslGEEt8C8XQz
 TMGhdCvKNZIXxqlD3LpYJeoXH5Dk8IkWYb7sVqBPY0RDarvm2VGWES2SyUL1ZDPYYhlx
 zcM8/Z6MzPzp3Cno1BPxOnrysZOtUViS08LzoeBVret+fSBlCfFA1J4f1lqLmQHgpaEx
 E9KQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwRoh7UOvGscTWlgPN8BUDpU+s2ink9xifSloHZ9coLr3CfDOKMOYG9l3P4hQE6kz4HOzK3ynMMw8+DOMs1vt2xnZT4MWTxcA03gXRcyHd
X-Gm-Message-State: AOJu0Yx2SoaC2Dwt7DzGHnsw/EpFxav4hcYdMEXWzP/suG7uijlSwmSu
 wzYhnihaCrbXsqnhIKULTTa0LAZfV7ncDzSUvJMqTR8KC5lMuG1cu0kXTqpw1ao=
X-Google-Smtp-Source: AGHT+IF6Im9KKVZF6BrPLUUt83T7OwbOQ3FD2cFzceJ+n1jrzoKNH62XjIkgG0CkuvB6WON7bbYxkQ==
X-Received: by 2002:a2e:9e10:0:b0:2d0:e331:8d2d with SMTP id
 e16-20020a2e9e10000000b002d0e3318d2dmr10769775ljk.37.1708450265047; 
 Tue, 20 Feb 2024 09:31:05 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 w4-20020a2e9584000000b002cdf4797fb7sm1585042ljh.125.2024.02.20.09.31.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 09:31:04 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH] arm64: dts: qcom: sm6115: fix USB PHY configuration
Date: Tue, 20 Feb 2024 19:31:04 +0200
Message-Id: <20240220173104.3052778-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The patch adding Type-C support for sm6115 was misapplied. All the
orientation switch configuration ended up at the UFS PHY node instead of
the USB PHY node. Move the data bits to the correct place.

Fixes: a06a2f12f9e2 ("arm64: dts: qcom: qrb4210-rb2: enable USB-C port handling")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 42 ++++++++++++++--------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index ee65ab073ba6..b344f6f6d556 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -884,10 +884,31 @@ usb_qmpphy: phy@1615000 {
 			clock-output-names = "usb3_phy_pipe_clk_src";
 
 			#phy-cells = <0>;
+			orientation-switch;
 
 			qcom,tcsr-reg = <&tcsr_regs 0xb244>;
 
 			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_qmpphy_out: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_qmpphy_usb_ss_in: endpoint {
+						remote-endpoint = <&usb_dwc3_ss>;
+					};
+				};
+			};
 		};
 
 		system_noc: interconnect@1880000 {
@@ -1213,29 +1234,8 @@ ufs_mem_phy: phy@4807000 {
 			reset-names = "ufsphy";
 
 			#phy-cells = <0>;
-			orientation-switch;
 
 			status = "disabled";
-
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
-
-					usb_qmpphy_out: endpoint {
-					};
-				};
-
-				port@1 {
-					reg = <1>;
-
-					usb_qmpphy_usb_ss_in: endpoint {
-						remote-endpoint = <&usb_dwc3_ss>;
-					};
-				};
-			};
 		};
 
 		gpi_dma0: dma-controller@4a00000 {
-- 
2.39.2

