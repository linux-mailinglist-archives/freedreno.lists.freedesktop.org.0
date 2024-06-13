Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDF7907964
	for <lists+freedreno@lfdr.de>; Thu, 13 Jun 2024 19:05:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07F6E10EB4B;
	Thu, 13 Jun 2024 17:05:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vc3QpDTA";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D54410EB43
 for <freedreno@lists.freedesktop.org>; Thu, 13 Jun 2024 17:05:10 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-52ca342d6f3so794972e87.2
 for <freedreno@lists.freedesktop.org>; Thu, 13 Jun 2024 10:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718298308; x=1718903108; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=OhwbgEjW/QLY+kHfdqlRN78b99hU6NvAVoZ8GSomDCA=;
 b=vc3QpDTATw3OZeXNoCZrRhXtfnLmpphzjtchJqn5RNDO4WTW/khJcGlKsiluB5/3Ze
 4LyRhRwftI7+Eb98ycTnAE3XFu6XZcx8n5vlY4SuBCVGTTKC+EOY/yU5lxYSNN9zt8vG
 EyLuykhv+gIAneDrbFrRJ8kNXnbFTMhTEVoZe3bBYIMcB3DOJlEU5CLDO/rOvf2uiT7R
 ooyj3xhmlZ2Qyr7Et1/+I7m+cfEMGHGLuy1Z42eXGeIKC3wkAg7aIG1fjzCgQnjnZzMR
 bt2PVD1pxh7CLupz259ZT8SzP3yJjzK1vHAuQjZ/gL/t9PSGHs/753VJ1dtz0kkU3CYv
 rX+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718298308; x=1718903108;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OhwbgEjW/QLY+kHfdqlRN78b99hU6NvAVoZ8GSomDCA=;
 b=Fzf2p1WcxsBRUShcEpCq2Tvhwx12N9kHVqSOklCgoJyPuS5ze35JUbiG/SQ3uY22ia
 bcqdkzuZmtFHM0pN4DPiOSPeK6ANnNV+A4Ez9tb5Ldvq2Sb8sWyIsd5afivqjz0LIb/o
 O8BVhW0cB7saz3Lo5NHxt7ZAo3CTNnzbMhO/+zj8W43NMWg9Hj+np/19GhimJDI+S8RC
 77SlBMF+Irn7uqP+lJnl7ejR1Gz0m42aJOsjhFWWM0nMlaIEvPkI3jHyx15vakXwauzC
 E38fPOVg3KmKKGsEfR0YWFfAoCTsZmrSQhxcySRYWiZRyrapErGWKhk4uz8xDiGf6d9I
 7cmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVh/ZtjuvM3fIK5qpCBj0INqyy0jYuu4HrkFC07flUu/fqZCd9jDk/z/beNCCF9OwxF8XFtAdrg4pRQeORtqFts5IOVnIod5QLPCGpR1Ets
X-Gm-Message-State: AOJu0Yxa0SF0fIOzV2ATxZswQ5VFVdugL8/8srHkATa2kdt6gSRYo7tH
 Fbm24LXniTErQLJvssSvt/oVccaGRthqbi/UrHpgf3NI/kda8ZB8ozV32gHWvtk=
X-Google-Smtp-Source: AGHT+IEsJKb5bvd45GyUFp0N3RqKEgpVRQeya0pL+OOPCw7+ZH/dI4KempSqROqmP9BdCpMrPpwyEg==
X-Received: by 2002:a05:6512:3b22:b0:52b:9037:9966 with SMTP id
 2adb3069b0e04-52ca6e946b0mr273073e87.46.1718298308332; 
 Thu, 13 Jun 2024 10:05:08 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca2825733sm287312e87.60.2024.06.13.10.05.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 10:05:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 13 Jun 2024 20:05:05 +0300
Subject: [PATCH v2 2/8] drm/msm/dpu: convert vsync source defines to the enum
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240613-dpu-handle-te-signal-v2-2-67a0116b5366@linaro.org>
References: <20240613-dpu-handle-te-signal-v2-0-67a0116b5366@linaro.org>
In-Reply-To: <20240613-dpu-handle-te-signal-v2-0-67a0116b5366@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4018;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=iVWU3jhrqIkLmAdHf111uwd8+bERfdhbeqvffmzo/50=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmaybAD+Zs5dZPEDYpczTWc6NXXMQpshDtsx+ML
 bUsZV0VC42JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZmsmwAAKCRCLPIo+Aiko
 1VCFB/wIvO27zB2nyuoHGXu9+wmNO7eGv+fdwU2OILQknely5Ybeb5eMkx7Gxv9vYgB46Tl5ScF
 bRA+yySYvFdaosRbla5V6UKCh2NXtn8nKP2uKPRKYM10yIcZWvMX0OaNw2LOpUqmFGehMOEZ2py
 drzG9c95Z6pGu6NfTcbc6NYYHJs9ejBUIDGcI4rIr1vWor/68j8d5o0kzGEMazY+xIelSk9/Gw6
 RWaLk7OLb5XU7YYNwIpd0qXwoTZQ7nf6KdOt2/2vr0eExB4J++iXoszuIuSh+xxrbfSDq/7nImO
 91z/dkXB/DywtblgD2JXNm4/t3867CoxIw8u9g1TEEKERNo7
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

Add enum dpu_vsync_source instead of a series of defines. Use this enum
to pass vsync information.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h | 26 ++++++++++++++------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h  |  2 +-
 5 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 119f3ea50a7c..4988a1029431 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -747,7 +747,7 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
 		if (disp_info->is_te_using_watchdog_timer)
 			vsync_cfg.vsync_source = DPU_VSYNC_SOURCE_WD_TIMER_0;
 		else
-			vsync_cfg.vsync_source = DPU_VSYNC0_SOURCE_GPIO;
+			vsync_cfg.vsync_source = DPU_VSYNC_SOURCE_GPIO_0;
 
 		hw_mdptop->ops.setup_vsync_source(hw_mdptop, &vsync_cfg);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 225c1c7768ff..96f6160cf607 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -462,7 +462,7 @@ static int dpu_hw_intf_get_vsync_info(struct dpu_hw_intf *intf,
 }
 
 static void dpu_hw_intf_vsync_sel(struct dpu_hw_intf *intf,
-		u32 vsync_source)
+				  enum dpu_vsync_source vsync_source)
 {
 	struct dpu_hw_blk_reg_map *c;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
index f9015c67a574..ac244f0b33fb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
@@ -107,7 +107,7 @@ struct dpu_hw_intf_ops {
 
 	int (*connect_external_te)(struct dpu_hw_intf *intf, bool enable_external_te);
 
-	void (*vsync_sel)(struct dpu_hw_intf *intf, u32 vsync_source);
+	void (*vsync_sel)(struct dpu_hw_intf *intf, enum dpu_vsync_source vsync_source);
 
 	/**
 	 * Disable autorefresh if enabled
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index 66759623fc42..a2eff36a2224 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -54,18 +54,20 @@
 #define DPU_BLEND_BG_INV_MOD_ALPHA	(1 << 12)
 #define DPU_BLEND_BG_TRANSP_EN		(1 << 13)
 
-#define DPU_VSYNC0_SOURCE_GPIO		0
-#define DPU_VSYNC1_SOURCE_GPIO		1
-#define DPU_VSYNC2_SOURCE_GPIO		2
-#define DPU_VSYNC_SOURCE_INTF_0		3
-#define DPU_VSYNC_SOURCE_INTF_1		4
-#define DPU_VSYNC_SOURCE_INTF_2		5
-#define DPU_VSYNC_SOURCE_INTF_3		6
-#define DPU_VSYNC_SOURCE_WD_TIMER_4	11
-#define DPU_VSYNC_SOURCE_WD_TIMER_3	12
-#define DPU_VSYNC_SOURCE_WD_TIMER_2	13
-#define DPU_VSYNC_SOURCE_WD_TIMER_1	14
-#define DPU_VSYNC_SOURCE_WD_TIMER_0	15
+enum dpu_vsync_source {
+	DPU_VSYNC_SOURCE_GPIO_0,
+	DPU_VSYNC_SOURCE_GPIO_1,
+	DPU_VSYNC_SOURCE_GPIO_2,
+	DPU_VSYNC_SOURCE_INTF_0 = 3,
+	DPU_VSYNC_SOURCE_INTF_1,
+	DPU_VSYNC_SOURCE_INTF_2,
+	DPU_VSYNC_SOURCE_INTF_3,
+	DPU_VSYNC_SOURCE_WD_TIMER_4 = 11,
+	DPU_VSYNC_SOURCE_WD_TIMER_3,
+	DPU_VSYNC_SOURCE_WD_TIMER_2,
+	DPU_VSYNC_SOURCE_WD_TIMER_1,
+	DPU_VSYNC_SOURCE_WD_TIMER_0,
+};
 
 enum dpu_hw_blk_type {
 	DPU_HW_BLK_TOP = 0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
index 6f3dc98087df..5c9a7ede991e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
@@ -64,7 +64,7 @@ struct dpu_vsync_source_cfg {
 	u32 pp_count;
 	u32 frame_rate;
 	u32 ppnumber[PINGPONG_MAX];
-	u32 vsync_source;
+	enum dpu_vsync_source vsync_source;
 };
 
 /**

-- 
2.39.2

