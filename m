Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7BC636F32
	for <lists+freedreno@lfdr.de>; Thu, 24 Nov 2022 01:48:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E81A10E679;
	Thu, 24 Nov 2022 00:48:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C652D10E672
 for <freedreno@lists.freedesktop.org>; Thu, 24 Nov 2022 00:48:20 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 o7-20020a05600c510700b003cffc0b3374so202797wms.0
 for <freedreno@lists.freedesktop.org>; Wed, 23 Nov 2022 16:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dzy/pv8LpfaZCGMyLs3UqXEZ7XhwmH1hafdtceOiRFg=;
 b=nNNNpAopz04epdPTLI7bA8NLeMA+bEcIIo8WK68m7TDI8HnfxQb8+yDsfu5TNqJfof
 H0uNz/m1D3ygTnXntdSQlhOTtNSdtmjL+kcbWax3p6M4frv5ZprK6m7P2Lp0Ewiw0Z+X
 mNdTqOZA5FozFQGGRbFQEzIo7lawjN48VrN7uUSMOKxf+uVs9aOzsT0fXDui/wHzHRfI
 YsK0KBN4vBSbGNdJUlRs2rc8uqDUVg8nCUZI/6MsU+vKwsbzb72UyVMMyIsqhmyij1QV
 1RQ8nTZVsnIzQ6E6jd2t3FMA7nc3oVmLoeLhmWaabdpvdWJ8hFgZvHtuSTziDHZtcTKS
 kKUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dzy/pv8LpfaZCGMyLs3UqXEZ7XhwmH1hafdtceOiRFg=;
 b=ZlBovGV6aS5y1wx8GKwYW56nDa6zEVUWU24bDhzx5hR1t3epBHbHzqA9bt0AY61FPF
 8Yh7NoTh+GgSDfcNV+EBu+WBNXuXb+hgw866ZUpk/wouwat8KhNZSdTXg3J9yqMIVSb3
 SuHlLHAyI0lMQQnc9ryhXh5hp8Q1Uxs9IyB1A6IZZhTzSFVTt7KecjFF+3JOKEQ2H9DK
 S7VqDlOutFlSYcSC67WLBMa8wy3f0BequUTIHgvBYTE/sBKjjGY3wyT/FJjIXofRTl6H
 45usn6ZyhCvoI93N1p3FTq0UA8RiGREd1pEvmtnRfkWAQ1XBlYGMsHISATsakWmYa1gA
 2Jow==
X-Gm-Message-State: ANoB5plwV/TyrQ3qylpebimZslLdU5c6LBoN8WaG2NmudFIgSSU/EQTk
 ybfiucnRgOTTYFjBmb7PHJlX0A==
X-Google-Smtp-Source: AA0mqf78tVK3fum1F/dXUdTtS3hTH00hrnLPbUdoCb+RptxefA0TpwgIu8uEsk/h/PHFXYBVd4VUiA==
X-Received: by 2002:a1c:7214:0:b0:3cf:7b65:76c5 with SMTP id
 n20-20020a1c7214000000b003cf7b6576c5mr21825295wmc.166.1669250900396; 
 Wed, 23 Nov 2022 16:48:20 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 n38-20020a05600c3ba600b003c6bbe910fdsm5245076wms.9.2022.11.23.16.48.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 16:48:19 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Date: Thu, 24 Nov 2022 00:47:56 +0000
Message-Id: <20221124004801.361232-14-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
References: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 13/18] arm64: dts: qcom: sc7180: Add compat
 qcom, sc7180-dsi-ctrl
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
Cc: dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sean@poorly.run, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_abhinavk@quicinc.com, david@ixit.cz, dianders@chromium.org,
 robdclark@gmail.com, robh+dt@kernel.org, agross@kernel.org, daniel@ffwll.ch,
 dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org, swboyd@chromium.org,
 airlied@gmail.com, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add silicon specific compatible qcom,sc7180-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for sc7180 against the yaml documentation.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index d2c374e9d8c03..cfe44afc52b4a 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -2985,7 +2985,8 @@ opp-460000000 {
 			};
 
 			dsi0: dsi@ae94000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sc7180-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae94000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

