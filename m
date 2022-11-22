Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 102E8634B39
	for <lists+freedreno@lfdr.de>; Wed, 23 Nov 2022 00:37:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D611910E4AC;
	Tue, 22 Nov 2022 23:37:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66D0510E49A
 for <freedreno@lists.freedesktop.org>; Tue, 22 Nov 2022 23:37:06 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id b9so19645528ljr.5
 for <freedreno@lists.freedesktop.org>; Tue, 22 Nov 2022 15:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sPVJTDjd2xUbT1EVwZ8K5CXf0vs2sTPC7eU4qBWDs5U=;
 b=fPpiLqPI806jm8YPMkw1hWfsfu7fkbK/dGLtFK0YimCA9reWwAmU5dmkW5N/Y8Puvz
 HW7clDd3O/0vNf9wWehUp4xiJwkOm6hwaxuuiVEMjE48kRB0ipYaT5n1FtPEu+Vsx5su
 G6Z2V6NEZYLvm5fBmdvuoEficjMDlD6RABF7HwUfwXCt9A9bppvZrGdrfQ2SIA97djWN
 LCP9U5UJ/zzqpSpICwbFNne+69OkhAS3SQyyseeVLX0hwqb/qTu88q9o3KmHYro25skI
 Hz5JD5nDEo9tMLIVPp3MBShR5gy4wrjRPXpYqD9VFXjrU5vY/MKaYz8NQeVewFLky03T
 G2uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sPVJTDjd2xUbT1EVwZ8K5CXf0vs2sTPC7eU4qBWDs5U=;
 b=WclQu/MTo5I3WAov4GHnK0SKwgiGjlady8gAk0QlGebJPPCZmvLypgzT1IYcUb+08A
 nXFuOtdfHrfwZ2XTLVqaaCDPoMo7jKbUdc6osY1iZS0UEe9hWNt2wRusEFVFW7iJYKQq
 BsgBnqF7NfFW65qjeNAxY/73XxSsvBC/soiI5yrHBeZNLD3/lhNntx/qwDr7SysX8O5c
 DNQLsdffg+yqcX6yxWjYeG28KL2rnhtCSeZH2Qk8erBXtsNH5IcJE4cOb13hPaTAX0f5
 Csk+dbM2eXYgNeuH3CSSIrCg3zSCwuIUmhYgCtcM/lJ37ymjbBxFZflQvYIoR93HBBVX
 MnRw==
X-Gm-Message-State: ANoB5pmEascNaxuZ7EAXoWFZMlSGdqdo0psoU7P/r/oSDCpGPvagObZW
 DcKqfL/akn/xwsPGkrvQu+n1GA==
X-Google-Smtp-Source: AA0mqf55ZYf37eIMcQj+RS7jDuAKKcv1Lzm98k2aIlZO+llxYLLijwT6AOAf6KcsrXk/Yx5Z9F4rbA==
X-Received: by 2002:a05:651c:220a:b0:277:2428:3682 with SMTP id
 y10-20020a05651c220a00b0027724283682mr8835362ljq.291.1669160224548; 
 Tue, 22 Nov 2022 15:37:04 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (dzpbkzhtyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:a302:8a1a::1])
 by smtp.gmail.com with ESMTPSA id
 h3-20020ac250c3000000b00492c463526dsm2666454lfm.186.2022.11.22.15.37.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 15:37:04 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Wed, 23 Nov 2022 01:36:59 +0200
Message-Id: <20221122233659.3308175-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221122233659.3308175-1-dmitry.baryshkov@linaro.org>
References: <20221122233659.3308175-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 5/5] arm64: dts: qcom: sm8450-hdk: Enable
 HDMI Display
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Vinod Koul <vkoul@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Vinod Koul <vkoul@kernel.org>

Add the HDMI display nodes and link it to DSI.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 36 +++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index 6b6dcd0e0052..709cddaac781 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
@@ -20,6 +20,17 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	hdmi-out {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&lt9611_out>;
+			};
+		};
+	};
+
 	lt9611_1v2: lt9611-vdd12-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "LT9611_1V2";
@@ -393,6 +404,26 @@ lt9611_codec: hdmi-bridge@2b {
 		pinctrl-names = "default";
 		pinctrl-0 = <&lt9611_irq_pin &lt9611_rst_pin>;
 
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				lt9611_a: endpoint {
+					remote-endpoint = <&dsi0_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				lt9611_out: endpoint {
+					remote-endpoint = <&hdmi_con>;
+				};
+			};
+		};
 	};
 };
 
@@ -405,6 +436,11 @@ &mdss_dsi0 {
 	status = "okay";
 };
 
+&mdss_dsi0_out {
+	remote-endpoint = <&lt9611_a>;
+	data-lanes = <0 1 2 3>;
+};
+
 &mdss_dsi0_phy {
 	vdds-supply = <&vreg_l5b_0p88>;
 	status = "okay";
-- 
2.35.1

