Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F20C83E166
	for <lists+freedreno@lfdr.de>; Fri, 26 Jan 2024 19:28:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC1AA10FD35;
	Fri, 26 Jan 2024 18:27:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0917D10FD18
 for <freedreno@lists.freedesktop.org>; Fri, 26 Jan 2024 18:27:29 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2cf354613easo6851741fa.1
 for <freedreno@lists.freedesktop.org>; Fri, 26 Jan 2024 10:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706293587; x=1706898387; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3oS3e08i9+4napyM4Cx2ITHLfZ0NtaHlzp9IZJ5e4DI=;
 b=G7anLSh79H55DpIbLtRKg7ZL55+TReXuwtPqxOjAAa08TpvSLwMb0TmjtKpDGAfKOu
 Q3C2WfKzm+L/gRMrOef5swNaU71nkURWRL/o6w6GpBvphRSsm1NxEYXvpacL8VYSWojB
 wlsBZdkmbmlIWAOnQNmUrDCSR2Fhbgd/9pJzZjdM/LbB9K90+uwdg6yEZiRhGP8Jj1xK
 nk97b7YvpySDUhpOTigft3fgNe0x9EIb8UcYAXu3H9xUa/8/qr3h//8OHr5mddzEAysC
 2qJnjd9BihQAS+TfIqbmjBt4XB+stbDbwa5N2A0UvY6j7pSjfXcWwj0hPVjmIzdjnxt2
 7J6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706293587; x=1706898387;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3oS3e08i9+4napyM4Cx2ITHLfZ0NtaHlzp9IZJ5e4DI=;
 b=TwkfOkKGKGwbWMz7Z47ufUuC05PY1Z2c1H+rgJoaqXau/Bx3zQ5KR+4rWJmgFvMx1r
 7ahUEMmIsJz8siyMuBKs0xtqzSmM36kAau14rsH7q1ADtuqPbIiljYGOveXiF/l2WWn8
 TwyzXG9LEWr1ASvc0Kmm4m6SLOZr8uH48toYXfetwHRFlV8dU06ewNQR4XnwooHySdIQ
 pKQ3fPMb+6gyhBwd99EDaJPliIDVoadIsMzAu6phBqfdmp30vIVFFLDcO/mK0HMzzvmp
 /7StjDWuoPX2PZSm9f7LtTyuN6OIZOiVLvJZuHz33kWasXjQN0fjeMivdu7qe7j3cBGE
 wjag==
X-Gm-Message-State: AOJu0Yy9t/8Gg+ZA0IjTV0SFXm/C8IcajHLeexPTnWlmfm9vfQT71NRD
 MKg7HHvbddQ++sXcjGSxQ45XERv2svhu2lp3Hj59yx7t3yPyayMaSbKIMn2Xw1I=
X-Google-Smtp-Source: AGHT+IEjwBaqC2fPBa/bAz9/T5mw/biJlp2Hq5zrXGrLEabCZhlsIh0GbkHRacokvUrtT0eWuzdmxQ==
X-Received: by 2002:a2e:7801:0:b0:2cf:1c74:9bcb with SMTP id
 t1-20020a2e7801000000b002cf1c749bcbmr112743ljc.106.1706293587342; 
 Fri, 26 Jan 2024 10:26:27 -0800 (PST)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 l25-20020a2e8699000000b002cf30f27698sm232218lji.91.2024.01.26.10.26.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jan 2024 10:26:27 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Jan 2024 20:26:20 +0200
Subject: [PATCH RESEND v3 01/15] drm/msm/dp: drop unused parser definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-dp-power-parser-cleanup-v3-1-098d5f581dd3@linaro.org>
References: <20240126-dp-power-parser-cleanup-v3-0-098d5f581dd3@linaro.org>
In-Reply-To: <20240126-dp-power-parser-cleanup-v3-0-098d5f581dd3@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Stephen Boyd <swboyd@chromium.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2918;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=yVyRmmNda9mfXwPWksVdLkO9SsjdUAzlZBACGcKQbRg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBls/lPOJbzNIqeApQ8DbgE/UP/idD/MUc3Ag/NF
 99jdcF4k52JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZbP5TwAKCRCLPIo+Aiko
 1d/eB/9FpFX864Yjm80sEUWwzzg25jC/nJ5LbwAhFLUf2BNJlzCilUSxv2x/hVpOO2muGkgqHWA
 T/OFelIcZL2xD1sJPBJESu1REdVZ/Zlw7FDUQiQMk1ZbZ/4RtZq8W4wW5TmikDrft9WkqOntPHo
 vy105O9vosbmNLYpALFUfYfZ1fol8HUMSqTuUDJUZarjOLuvCgHhNN8O4IjH6raya3uzyig7Tp/
 mm5ftptfZGFpClbNkJ+tPLi1qQZUJ6GD+JPwxb28VZslj6p/4ljxCr3kSOfCYm692RJWiv59vI0
 d7wx6GjlUoTwrwmB9CkjVHPIRpjDyVqRGC3vZ9xqEkZf1kJU
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Drop several unused and obsolete definitions from the dp_parser module.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_parser.h | 46 --------------------------------------
 1 file changed, 46 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
index 1f068626d445..90a2cdbbe344 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.h
+++ b/drivers/gpu/drm/msm/dp/dp_parser.h
@@ -12,7 +12,6 @@
 
 #include "msm_drv.h"
 
-#define DP_LABEL "MDSS DP DISPLAY"
 #define DP_MAX_PIXEL_CLK_KHZ	675000
 #define DP_MAX_NUM_DP_LANES	4
 #define DP_LINK_RATE_HBR2	540000 /* kbytes */
@@ -21,7 +20,6 @@ enum dp_pm_type {
 	DP_CORE_PM,
 	DP_CTRL_PM,
 	DP_STREAM_PM,
-	DP_PHY_PM,
 	DP_MAX_PM
 };
 
@@ -43,28 +41,10 @@ static inline const char *dp_parser_pm_name(enum dp_pm_type module)
 	case DP_CORE_PM:	return "DP_CORE_PM";
 	case DP_CTRL_PM:	return "DP_CTRL_PM";
 	case DP_STREAM_PM:	return "DP_STREAM_PM";
-	case DP_PHY_PM:		return "DP_PHY_PM";
 	default:		return "???";
 	}
 }
 
-/**
- * struct dp_display_data  - display related device tree data.
- *
- * @ctrl_node: referece to controller device
- * @phy_node:  reference to phy device
- * @is_active: is the controller currently active
- * @name: name of the display
- * @display_type: type of the display
- */
-struct dp_display_data {
-	struct device_node *ctrl_node;
-	struct device_node *phy_node;
-	bool is_active;
-	const char *name;
-	const char *display_type;
-};
-
 /**
  * struct dp_ctrl_resource - controller's IO related data
  *
@@ -77,28 +57,6 @@ struct dp_io {
 	union phy_configure_opts phy_opts;
 };
 
-/**
- * struct dp_pinctrl - DP's pin control
- *
- * @pin: pin-controller's instance
- * @state_active: active state pin control
- * @state_hpd_active: hpd active state pin control
- * @state_suspend: suspend state pin control
- */
-struct dp_pinctrl {
-	struct pinctrl *pin;
-	struct pinctrl_state *state_active;
-	struct pinctrl_state *state_hpd_active;
-	struct pinctrl_state *state_suspend;
-};
-
-/* Regulators for DP devices */
-struct dp_reg_entry {
-	char name[32];
-	int enable_load;
-	int disable_load;
-};
-
 struct dss_module_power {
 	unsigned int num_clk;
 	struct clk_bulk_data *clocks;
@@ -109,16 +67,12 @@ struct dss_module_power {
  *
  * @pdev: platform data of the client
  * @mp: gpio, regulator and clock related data
- * @pinctrl: pin-control related data
- * @disp_data: controller's display related data
  * @parse: function to be called by client to parse device tree.
  */
 struct dp_parser {
 	struct platform_device *pdev;
 	struct dss_module_power mp[DP_MAX_PM];
-	struct dp_pinctrl pinctrl;
 	struct dp_io io;
-	struct dp_display_data disp_data;
 	u32 max_dp_lanes;
 	u32 max_dp_link_rate;
 	struct drm_bridge *next_bridge;

-- 
2.39.2

