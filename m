Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7832F9B8593
	for <lists+freedreno@lfdr.de>; Thu, 31 Oct 2024 22:44:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 556C710E93A;
	Thu, 31 Oct 2024 21:44:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ndEO95SY";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8589F10E93C
 for <freedreno@lists.freedesktop.org>; Thu, 31 Oct 2024 21:44:16 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-539fbe22ac0so1492712e87.2
 for <freedreno@lists.freedesktop.org>; Thu, 31 Oct 2024 14:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730411055; x=1731015855; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=OqNSFMIgIgV5OpXdR/7l7nRGQJoQyaD3983y+et4GC4=;
 b=ndEO95SYCPZx7yZjiktIc2RsV3Ue+J2KFQucOBMYRVaIc3dfPhUfyjlBIoUZXf6D/F
 wDBLrsgbM80EtIPXCMlJgqdh+Y8fJ95teSaAA+ZB7vHeC55TPDFJjBpYVXbGwE9RV8YR
 3WGhnl1G9adh0yiee1IeiJn1vxW1GeWzmU19+CVerTV6em5qAHsqp78iwn45G8QSvpxy
 gXpQETyvhdXPsblUqT/lJbdhKfMWNYoXrUmIcOP2jbChn3NfiPbQ5bJCrMT/w5E6ULhI
 J+NLEn58Gj5l+X9DIVhvZStct1cTygk8xwOOUZRMK109TdEGnQafMy9iFfNj1QmohQBn
 /dKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730411055; x=1731015855;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OqNSFMIgIgV5OpXdR/7l7nRGQJoQyaD3983y+et4GC4=;
 b=LI3QaAOpWNpO4QSrUPL7TcpKs8//CiskaNdPzWnZpBG5/ktbTiSJNIHlXXvMXNFhRx
 wZtYo9H4v/YsgWQ3zWZ5Lpr6Rcgx/PnCckQAWGMODtVaNCj0yNwl9idiqJEkuXrCNPNS
 HTJzCFkuxycUQ+sktWE5HQAD6m8sEIbKE3pNai5PTGv09NQGXRpzSHqWeB7NOVHisYNP
 /kN2VDThs6uOPM4L82L8TRcPz8sT+h+C85hhoZf+Px9ZqWYSR9xr0ER7NhGpnEe0Vceh
 Ftgm4gIxW8RdmFUznAzU/BpVAHbkbyMV5dzb1iP0y9r9AfmxQVPk68I+jBLI1rhePixK
 Q3Dg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLet/loa+bGzHFk0kXusl3CZhioPZzycRhlvMhdE9CkbD4QW3cA4Vz3S60WcPIKhEgr8vAgSMWPYc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzyIiW9t6MUWhAJZusz76q4srxkRN4THiwJc0piUFJB02VFvAVW
 OL50N7SejSB9F2eZ35H3AOASibRPmyXFiufvEgjMH90S/w/lLfu3ksI+IUOY4ak=
X-Google-Smtp-Source: AGHT+IHwHI39pMLKJYKB/wJbzqMugbwMOcaMVOgXGw6qMYzh2l8oGIsERY8Roc/3xeyAXemPUVpnHw==
X-Received: by 2002:a05:6512:3b1e:b0:539:f37f:bed9 with SMTP id
 2adb3069b0e04-53b348c38d4mr10744771e87.8.1730411054650; 
 Thu, 31 Oct 2024 14:44:14 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53c7bc9c162sm339567e87.96.2024.10.31.14.44.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 14:44:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 31 Oct 2024 23:44:06 +0200
Subject: [PATCH 1/3] drm/msm: move msm_display_topology to the DPU driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241031-dpu-move-topology-v1-1-8ffa8122d3b6@linaro.org>
References: <20241031-dpu-move-topology-v1-0-8ffa8122d3b6@linaro.org>
In-Reply-To: <20241031-dpu-move-topology-v1-0-8ffa8122d3b6@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2272;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=3gmgqvAjzCSSavAjV5jJg0GKqDw6X9/s8Cl9bedoQdA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnI/opyJCRQfXjqH5VCLGGgyhtrc2f1DqM69JuU
 HJU3VI5uniJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZyP6KQAKCRCLPIo+Aiko
 1f+jCACrvoUEvzZiGZj7CBTSY3ijv0NmWwvH4XePIES1czqYUu6Z+pxY1CCBpm1SLUQZd1qDCC3
 dDcLfo7lktlCYzwkNA/N0fiycFu8tzXvBKIiKQ/MBlbdOdcUok+NkoeP3KsvEctlWeBei9QB2U4
 r+zSJD2mRsj81j3kxzDwgoG0GvsOtfOJ4Ph+TKn4a/steVHjOijVUMJNJit7mo9sjIt6hZ81jp4
 xy763WiGofpM9ofjrzNQMo9ut3d43pWs00jd7RknOTmg9pujEGu1TsmU/W6pPcbIQyqpk1Dii+9
 jWLamaVNSz59rGQUbw0kwUzjftva87JP8IS6i/jZBqNf1rtc
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

The struct msm_display_topology is only used by the DPU driver. Remove
it from the global header and move it to DPU-specific header.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h | 16 ++++++++++++++++
 drivers/gpu/drm/msm/msm_drv.h          | 16 ----------------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index e63db8ace6b9..14220ba04a78 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -37,6 +37,22 @@ struct dpu_rm {
 	struct dpu_hw_blk *cdm_blk;
 };
 
+/**
+ * struct msm_display_topology - defines a display topology pipeline
+ * @num_lm:       number of layer mixers used
+ * @num_intf:     number of interfaces the panel is mounted on
+ * @num_dspp:     number of dspp blocks used
+ * @num_dsc:      number of Display Stream Compression (DSC) blocks used
+ * @needs_cdm:    indicates whether cdm block is needed for this display topology
+ */
+struct msm_display_topology {
+	u32 num_lm;
+	u32 num_intf;
+	u32 num_dspp;
+	u32 num_dsc;
+	bool needs_cdm;
+};
+
 /**
  * dpu_rm_init - Read hardware catalog and create reservation tracking objects
  *	for all HW blocks.
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 133e47bea7d5..ae3adb0f68a8 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -73,22 +73,6 @@ enum msm_dsi_controller {
 #define MSM_GPU_MAX_RINGS 4
 #define MAX_H_TILES_PER_DISPLAY 2
 
-/**
- * struct msm_display_topology - defines a display topology pipeline
- * @num_lm:       number of layer mixers used
- * @num_intf:     number of interfaces the panel is mounted on
- * @num_dspp:     number of dspp blocks used
- * @num_dsc:      number of Display Stream Compression (DSC) blocks used
- * @needs_cdm:    indicates whether cdm block is needed for this display topology
- */
-struct msm_display_topology {
-	u32 num_lm;
-	u32 num_intf;
-	u32 num_dspp;
-	u32 num_dsc;
-	bool needs_cdm;
-};
-
 /* Commit/Event thread specific structure */
 struct msm_drm_thread {
 	struct drm_device *dev;

-- 
2.39.5

