Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4844EA47277
	for <lists+freedreno@lfdr.de>; Thu, 27 Feb 2025 03:25:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8913C10EA23;
	Thu, 27 Feb 2025 02:25:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="acGYGp3T";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11C2D10EA1D
 for <freedreno@lists.freedesktop.org>; Thu, 27 Feb 2025 02:25:33 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5485646441cso422977e87.2
 for <freedreno@lists.freedesktop.org>; Wed, 26 Feb 2025 18:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740623131; x=1741227931; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qq9MmRx9UTHcwOJg2plfoPnrstGHmU+KXfgGIfhmApo=;
 b=acGYGp3TCmAHWR7R2SNlwn/6PtOYryVZEg0Px2yIy0p3slcqGOgs7kKRZ0UDOapJPz
 OCYYeFZNT+XkErGqlIOlqkD+0RiDLUtsHYjWjrQB6kCpnHxkVaBqY7djw5HFttRh19TT
 D7m5UdowQ7SeqxArMGWq6+EO4NJjQ2lNOGyKdGctRmp5+4yLEP9sCbtbCm2Tyf0ou/ei
 NJubSu/dMnsi94srYeUQzOTzuyXs7K3Y0+xN9VsWp4zbIHUMHK0dbyiOQ3FYlSwM+D74
 bGwHb201c1gQJy/XXqnDbT5mFXTtAnLMW3HwNUO8e/+P+jGiMngBk/DU71iiCCgMa/RK
 MYBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740623131; x=1741227931;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qq9MmRx9UTHcwOJg2plfoPnrstGHmU+KXfgGIfhmApo=;
 b=f1Fztcwt2SeYOkbbB8uaGy7slzJgt+oeNMMwgZ21mKRiiMWfKeMSWL77DT1U5LCo/W
 ujRIJk5dpKx/yz6+eEiTygYyyg87kMs9UmJ2jNWRSUxRuRgjUMXExh5tP/8hcXzS6Y8Z
 vVOF8swDYH+ToxbQ4VI49MCjPT4edXduWK5DtUD32xoBJJX5l09KY9jrPWACTYViah5A
 2RoXmCQQQ70Q6lsXCcmXb33V5zuIV40Dm2M6NVKQPt27Ls0qCP22G00DlyD/TBt1/nCD
 q47BpXBItMX26aYn4wN2kz+UNnivZH6LzOEGk3u3rN6WA1KZbP9bHwZDZYLDWYDZzXp5
 LiNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZ3qnWme0HzpiG0+a46B31/3V+N94f3ZOYM0MAHOhto3dx2UM1HpnLh26xrQuTtxUjYeETq3/CAmw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1DL71NDQ6858HBf1InEjszALCxnkVjHn8tFeu5yTkP8ryrtv8
 jQIwTWLNR07BlHziCZBVlb24nePWe8BhnHwcgTXkHtrQrN9GoGQHqlxFQ8rlz2U=
X-Gm-Gg: ASbGncteToSVrRi2hYGFVhvgDR55q+jYjnDnkuCI/z8R79Q1JQ+10TxlpKgXkWO1wq8
 uBZBGzM3pOcsUSUUG1EaBTyi6yf6PCl5t2lIQgqIQpNNyvfNUTKADaGXT/Df5V56Vvwpx0dDI4N
 kLu7i+X+NBn963TpuyhHKlL8kfnx5Rqj2KgCOWPKOZ86rHJriko4E5jBdo7gR3hVDXpMJY/HSNc
 HcBv7ZgkDLQQUVNdfyg2AZLVu7zdNd3hhUTh9BaGqWowHTupIEmQaAfTXuySWIr/9e2Q0p9uw4Z
 CvyEnSvRjysuBV6SlegBKioZ3SkyhwNLmQ==
X-Google-Smtp-Source: AGHT+IEfNBpBj/ziCw82ad5v30aNPQAqE97K5Ze93xNXV4raP7uNtPDw2CsgCTSSUsjHK8YDRWNp3g==
X-Received: by 2002:a05:6512:114d:b0:546:2ea9:6662 with SMTP id
 2adb3069b0e04-54851109c6emr5818345e87.51.1740623131341; 
 Wed, 26 Feb 2025 18:25:31 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549441742a0sm48067e87.5.2025.02.26.18.25.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 18:25:30 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 27 Feb 2025 04:25:15 +0200
Subject: [PATCH v3 7/7] arm: dts: qcom: apq8064: link LVDS clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250227-fd-mdp4-lvds-v3-7-c983788987ae@linaro.org>
References: <20250227-fd-mdp4-lvds-v3-0-c983788987ae@linaro.org>
In-Reply-To: <20250227-fd-mdp4-lvds-v3-0-c983788987ae@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1695;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=gTQKG0fLWpD8Mjgk4DoVlbsZZVw4cfaJYQqKJoHiGbg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnv80HWgZt9T8wm96Mnxu2uLkRoQ+p08Vp+8VBB
 DjQRLaZ80yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ7/NBwAKCRCLPIo+Aiko
 1ftqB/45YhkzEZkAfeOFiXyfNAE94XiLoA1jUXvCiK6882ceMMQbxiQuvNpui7zQpA6uvNM9zi5
 8lJvqdPEbKx+jgF9481iin0lE+yv7k0HqBf4GhTPfb/6dQCCYdtAXtAIJOQLAOZ/lvD8QSQ+G/Q
 pYsckfnly5UpsZLhIjafPx5mAZzVQBxup6O1PjZeERDQJm5UJlPaO+CCWGSvbb8UrqmH41M9u8x
 7jnsmXpjy5UD49Sx9S3SI0tv1jgw2Qi64uj4s9afgN30VfwTSLE19phN038/IBCYcRrqEuAFXf/
 jmRndD8vaNxweMA++NIyVi8MRVVYgBGgsyJ8/Vi7Qx3PETtr
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Link LVDS clocks to the from MDP4 to the MMCC and back from the MMCC
to the MDP4 display controller.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index 5f1a6b4b764492486df1a2610979f56c0a37b64a..b884900716464b6291869ff50825762a55099982 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -737,7 +737,8 @@ mmcc: clock-controller@4000000 {
 				 <&dsi0_phy 0>,
 				 <&dsi1_phy 1>,
 				 <&dsi1_phy 0>,
-				 <&hdmi_phy>;
+				 <&hdmi_phy>,
+				 <&mdp>;
 			clock-names = "pxo",
 				      "pll3",
 				      "pll8_vote",
@@ -745,7 +746,8 @@ mmcc: clock-controller@4000000 {
 				      "dsi1pllbyte",
 				      "dsi2pll",
 				      "dsi2pllbyte",
-				      "hdmipll";
+				      "hdmipll",
+				      "lvdspll";
 		};
 
 		l2cc: clock-controller@2011000 {
@@ -1404,13 +1406,19 @@ mdp: display-controller@5100000 {
 				 <&mmcc MDP_AXI_CLK>,
 				 <&mmcc MDP_LUT_CLK>,
 				 <&mmcc HDMI_TV_CLK>,
-				 <&mmcc MDP_TV_CLK>;
+				 <&mmcc MDP_TV_CLK>,
+				 <&mmcc LVDS_CLK>,
+				 <&rpmcc RPM_PXO_CLK>;
 			clock-names = "core_clk",
 				      "iface_clk",
 				      "bus_clk",
 				      "lut_clk",
 				      "hdmi_clk",
-				      "tv_clk";
+				      "tv_clk",
+				      "lcdc_clk",
+				      "pxo";
+
+			#clock-cells = <0>;
 
 			iommus = <&mdp_port0 0
 				  &mdp_port0 2

-- 
2.39.5

