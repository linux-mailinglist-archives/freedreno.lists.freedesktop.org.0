Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B8AAF9F8C
	for <lists+freedreno@lfdr.de>; Sat,  5 Jul 2025 12:02:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAD6910E373;
	Sat,  5 Jul 2025 10:02:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FrCJY771";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE53210E37A
 for <freedreno@lists.freedesktop.org>; Sat,  5 Jul 2025 10:02:44 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5652Y8YZ006926
 for <freedreno@lists.freedesktop.org>; Sat, 5 Jul 2025 10:02:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TUgWQS//G5f5QquYkCwqI5pTNxw8irblkzEPLEXGj/A=; b=FrCJY771h9hRVhy2
 2yeJGMNm/rsLOTPSamUu9XClZvjmnBN/xJXR//ue1XxxcewpKeDDfrWtwv65W+QG
 HACcWqNcuW1TxuUvzm7r3qIKSwUdrYDd1ZOj2XmVcrcerVYgT1MHbcrRhc/eKXx7
 MqZdV1HNJYb+Uo/hNONDVWVa6wtsCy7UkrVDtnsC6yI3oupi1UPRsffzCVR7PmG2
 AlsrY2bgleEs4Cqmh/9J1wSY63Y32qXHaP+TeYKITIRzewRoK4+BClm1Vxw39Y08
 uPxNTG42uEEhf8Yqk5Fzqkko5iSUuszrwhFBIHkvBt0XBcx64onzIqgXGBLCnNTZ
 f9sKVw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pucm8mwb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 05 Jul 2025 10:02:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7d399070cecso265993985a.3
 for <freedreno@lists.freedesktop.org>; Sat, 05 Jul 2025 03:02:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751709763; x=1752314563;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TUgWQS//G5f5QquYkCwqI5pTNxw8irblkzEPLEXGj/A=;
 b=LNWgl4nODFUEBRJE1sw8q6G4f0h6IDuCGO6aWXZoA8sY5rXVM3Vp5GcrdFjDQb6Gz8
 5s9s8JnRlVDZDwL46Fgc0TQq2FoX5eMrgae6bKQD1hT15c4sfWBudglbKfM9lsZaaHuV
 QGPnYlxS+KKMYp0/8EpTOe6WBeLciGGdEkyHH6oE9yDLbZDhyYAoZGHELDVSbc0cavMF
 MrKCVmqGhYEmHiGCFA+dmwdXhlMc6SsZJCZ9tz/EzIgGgAMqRvikgmRYk1DyOoZXuq2c
 58vU4MZo4TLXvdJS8La7Dntt7ozkjgtGeFz1JOb6PoQxPDooI0BBd3PyWuflggPNh5UZ
 8pEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9Fg2cmebpOJTW5RL9l6DJWJYdyWJ1FVXsxmt0pJErm5A8cQ2/gXQnvEV20gu/qDve5QQIykaHoAE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwReqg9YKex8XiSKNdfnLilV8q/t+Wa7tUP/GxjVkipU+wG5U6i
 JB+aN8EoUfIOWQi/oAjnsfR611+mJpBu/G3XNt3FNvtg24Qs7bQ74GI9VnfxAbERgAXeJOhGOKt
 1EumT0bRFRbYGlw2KO5QcpjSgZPmeKaaDHt4PXcMA6GUYAoDOjmGWHtN0sftv9lONWhZU9F4=
X-Gm-Gg: ASbGncs0Wd9lU9VssjhbZFWiIP8mi3gMXMW3Ki6DNBImfdyG0T5Lny3YAxRo1ywb4Sn
 6Ux0FuI/MMeOxMZWockOl2/HnU1Kb3vKXuSIqzld8dP96n5/Qz7III0gSGCYaJEscXQJ6tGbolB
 FZTy0YImq6Vh2Xtyu0YEZBNpLoFzjCkeRmc1UTPOsscaJelSMJdMS9OdAajbdSKtGdvs3FG1XKH
 Vh/MwtNlFQDNRswQfu9p/fq7LbOVIZEup5Jviqa+rLgTbbaPw1KNVOiAz/yh/DVpf8v/6/PN5Ny
 Zy8mOzsuaEIGNO7RhwCKHj0ngdSPTuaDFPuhlYsT1W4lCRwxMK8Vz1T/EQERWIxhzq06n5mrgL8
 YJHgLsO2ja1b2Vu6r+36PHYnXqLbHcpPlaOg=
X-Received: by 2002:a05:620a:690d:b0:7d3:96ba:8561 with SMTP id
 af79cd13be357-7d5df0cd0b0mr673039985a.8.1751709762992; 
 Sat, 05 Jul 2025 03:02:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOhrc5RwdFsBTih3OXP9bNNl7G4Yo9g67Tf5+f5eKLQmnNxCobBF9EFsjp0T66230u3YlvQQ==
X-Received: by 2002:a05:620a:690d:b0:7d3:96ba:8561 with SMTP id
 af79cd13be357-7d5df0cd0b0mr673035585a.8.1751709762523; 
 Sat, 05 Jul 2025 03:02:42 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-556384c0558sm526274e87.209.2025.07.05.03.02.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Jul 2025 03:02:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 05 Jul 2025 13:02:31 +0300
Subject: [PATCH v4 06/10] drm/msm: make it possible to disable KMS-related
 code.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-msm-gpu-split-v4-6-fb470c481131@oss.qualcomm.com>
References: <20250705-msm-gpu-split-v4-0-fb470c481131@oss.qualcomm.com>
In-Reply-To: <20250705-msm-gpu-split-v4-0-fb470c481131@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=13609;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=0D6kJT+yXHsszE54CWySsslIGo0PaQaM3dWnrIckd7E=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaPgzCiMBmk93zRbp6Cqwr0/V1GLLjDjN9kM95
 TL8xeton5aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGj4MwAKCRCLPIo+Aiko
 1elHCACoTwJc6/PuC5UTtm8YmVoxkeRSvtIRBjkz/BHZGLxvMhqZdBdfe0/zgw0pi0qHUXvfsYl
 UXiuX5WDw7RcIML+/6WLaIBHjBgNkR892vpmGNPDe4IqidkVNALma2mDMx6sy8sgtMq/xvmTAhr
 gIs8l5nkZKxaTmF32M1u28iWtJ42ChtKvEwBYyqOmfEfYV0NT2YENvNf40psr9zbGMjCBlQ7nLO
 KwY9kcJMCjca99MJCGn1v0qcQKmuQETCc0ZoWbrX8GdRMtN5poUVVN0pCielYFGHaPFyAUcOk/W
 0+uucdCR5BnoILApGMNiHNdm6kLztjm0srrWHOIKn5iqkMI5
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=GdQXnRXL c=1 sm=1 tr=0 ts=6868f844 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=HLjn-ILLvqAx_VdQRNoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: LnuK-KqNA5bFg9YVSeXHQZW7IAhTv18M
X-Proofpoint-ORIG-GUID: LnuK-KqNA5bFg9YVSeXHQZW7IAhTv18M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDA2NCBTYWx0ZWRfXwczaJpD7n3xi
 OhMBYQWfZ3zpqq3xhiiJIiA812iDGSFGAyDUYxj8YE8x/adzE0ZMaItMNNVheXSzP0QGmvV4cri
 Djf6M8LLb5Ld5hdKwr0CQ8DgTm81H0RbSTjHsfFw4zg82YtHVnYAYvX73rJHc8+TajyJf6cUJG9
 WYXqFXrFoD5nkCZjdukefH46fxmIG4fNwtvOEoCQP14DCb65JuTQ6UpooKvOimsbCgO2i6wQFeg
 s4Oca0dXCKoW9zK9TBueGkGuT/oXK9Qw1Y4aHcipbHCxnbq6NWqeuoSHngMF9BQr7ear3If8SCv
 P1FmjBVjJxY3IOvl35BgzZBMS/ut4kg5IYo8JPl1xf4OHoYNs87sITAJHEhhjAdtYD0QYuWuM7g
 G/IrIqD6Bfz2bCIGhh68pZHV1zn0Vse2Z9zf6s5hJCzapa0F32XGM6nr2QwxvNP7QtNnK2Tx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 malwarescore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050064
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

If the Adreno device is used in a headless mode, there is no need to
build all KMS components. Build corresponding parts conditionally, only
selecting them if modeset support is actually required.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/Kconfig              | 14 +++++
 drivers/gpu/drm/msm/Makefile             | 19 +++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c |  4 +-
 drivers/gpu/drm/msm/dp/dp_debug.c        |  4 ++
 drivers/gpu/drm/msm/msm_debugfs.c        | 92 ++++++++++++++++++--------------
 drivers/gpu/drm/msm/msm_drv.h            | 10 +---
 drivers/gpu/drm/msm/msm_kms.c            |  6 +--
 drivers/gpu/drm/msm/msm_kms.h            | 30 +++++++++++
 8 files changed, 117 insertions(+), 62 deletions(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 8fb99f64a61548eae8ac74cf6cc99ffd2f3c7204..3a0a69f41153c5f32670e07f9728d9b9e947be92 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -68,6 +68,14 @@ config DRM_MSM_VALIDATE_XML
 	  Validate XML files with register definitions against rules-fd schema.
 	  This option is mostly targeting DRM MSM developers. If unsure, say N.
 
+config DRM_MSM_KMS
+	def_bool n
+	depends on DRM_MSM
+
+config DRM_MSM_KMS_FBDEV
+	def_bool DRM_FBDEV_EMULATION
+	depends on DRM_MSM_KMS
+
 config DRM_MSM_MDSS
 	bool
 	depends on DRM_MSM
@@ -76,6 +84,7 @@ config DRM_MSM_MDSS
 config DRM_MSM_MDP4
 	bool "Enable MDP4 support in MSM DRM driver"
 	depends on DRM_MSM
+	select DRM_MSM_KMS
 	default y
 	help
 	  Compile in support for the Mobile Display Processor v4 (MDP4) in
@@ -86,6 +95,7 @@ config DRM_MSM_MDP5
 	bool "Enable MDP5 support in MSM DRM driver"
 	depends on DRM_MSM
 	select DRM_MSM_MDSS
+	select DRM_MSM_KMS
 	default y
 	help
 	  Compile in support for the Mobile Display Processor v5 (MDP5) in
@@ -96,6 +106,7 @@ config DRM_MSM_DPU
 	bool "Enable DPU support in MSM DRM driver"
 	depends on DRM_MSM
 	select DRM_MSM_MDSS
+	select DRM_MSM_KMS
 	select DRM_DISPLAY_DSC_HELPER
 	default y
 	help
@@ -106,6 +117,7 @@ config DRM_MSM_DPU
 config DRM_MSM_DP
 	bool "Enable DisplayPort support in MSM DRM driver"
 	depends on DRM_MSM
+	depends on DRM_MSM_KMS
 	select DRM_DISPLAY_HDMI_AUDIO_HELPER
 	select RATIONAL
 	default y
@@ -117,6 +129,7 @@ config DRM_MSM_DP
 config DRM_MSM_DSI
 	bool "Enable DSI support in MSM DRM driver"
 	depends on DRM_MSM
+	depends on DRM_MSM_KMS
 	select DRM_PANEL
 	select DRM_MIPI_DSI
 	select DRM_DISPLAY_DSC_HELPER
@@ -172,6 +185,7 @@ config DRM_MSM_DSI_7NM_PHY
 config DRM_MSM_HDMI
 	bool "Enable HDMI support in MSM DRM driver"
 	depends on DRM_MSM
+	depends on DRM_MSM_KMS
 	default y
 	select DRM_DISPLAY_HDMI_HELPER
 	select DRM_DISPLAY_HDMI_STATE_HELPER
diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 514bacd5e4998a60da3fa9cb751220e96af0c2c9..0c0dfb25f01b193b10946fae20138caf32cf0ed2 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -100,18 +100,15 @@ msm-display-$(CONFIG_DRM_MSM_DPU) += \
 msm-display-$(CONFIG_DRM_MSM_MDSS) += \
 	msm_mdss.o \
 
-msm-display-y += \
+msm-display-$(CONFIG_DRM_MSM_KMS) += \
 	disp/mdp_format.o \
 	disp/mdp_kms.o \
 	disp/msm_disp_snapshot.o \
 	disp/msm_disp_snapshot_util.o \
 
 msm-y += \
-	msm_atomic.o \
-	msm_atomic_tracepoints.o \
 	msm_debugfs.o \
 	msm_drv.o \
-	msm_fb.o \
 	msm_fence.o \
 	msm_gem.o \
 	msm_gem_prime.o \
@@ -122,7 +119,6 @@ msm-y += \
 	msm_gpu_devfreq.o \
 	msm_io_utils.o \
 	msm_iommu.o \
-	msm_kms.o \
 	msm_perf.o \
 	msm_rd.o \
 	msm_ringbuffer.o \
@@ -130,13 +126,17 @@ msm-y += \
 	msm_syncobj.o \
 	msm_gpu_tracepoints.o \
 
-msm-$(CONFIG_DRM_FBDEV_EMULATION) += msm_fbdev.o
+msm-$(CONFIG_DRM_MSM_KMS) += \
+	msm_atomic.o \
+	msm_atomic_tracepoints.o \
+	msm_fb.o \
+	msm_kms.o \
 
-msm-display-$(CONFIG_DEBUG_FS) += \
-	dp/dp_debug.o
+msm-$(CONFIG_DRM_MSM_KMS_FBDEV) += msm_fbdev.o
 
 msm-display-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
 	dp/dp_ctrl.o \
+	dp/dp_debug.o \
 	dp/dp_display.o \
 	dp/dp_drm.o \
 	dp/dp_link.o \
@@ -159,7 +159,8 @@ msm-display-$(CONFIG_DRM_MSM_DSI_14NM_PHY) += dsi/phy/dsi_phy_14nm.o
 msm-display-$(CONFIG_DRM_MSM_DSI_10NM_PHY) += dsi/phy/dsi_phy_10nm.o
 msm-display-$(CONFIG_DRM_MSM_DSI_7NM_PHY) += dsi/phy/dsi_phy_7nm.o
 
-msm-y += $(adreno-y) $(msm-display-y)
+msm-y += $(adreno-y)
+msm-$(CONFIG_DRM_MSM_KMS) += $(msm-display-y)
 
 obj-$(CONFIG_DRM_MSM)	+= msm.o
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 782aa86208d54cc28c5ad51215ef458483ff3dfb..d4b545448d74657aafc96e9042c7756654b4f0e7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -742,7 +742,7 @@ void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event)
 	fevent->event = event;
 	fevent->crtc = crtc;
 	fevent->ts = ktime_get();
-	kthread_queue_work(priv->event_thread[crtc_id].worker, &fevent->work);
+	kthread_queue_work(priv->kms->event_thread[crtc_id].worker, &fevent->work);
 }
 
 /**
@@ -911,7 +911,7 @@ static void dpu_crtc_atomic_flush(struct drm_crtc *crtc,
 	dev = crtc->dev;
 	priv = dev->dev_private;
 
-	if (crtc->index >= ARRAY_SIZE(priv->event_thread)) {
+	if (crtc->index >= ARRAY_SIZE(priv->kms->event_thread)) {
 		DPU_ERROR("invalid crtc index[%d]\n", crtc->index);
 		return;
 	}
diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
index b65b358e98381488ecd0ecb8648dbe76dd6ff310..cf3838fcd154e67b6bd8f6321a8711419543abcb 100644
--- a/drivers/gpu/drm/msm/dp/dp_debug.c
+++ b/drivers/gpu/drm/msm/dp/dp_debug.c
@@ -5,6 +5,8 @@
 
 #define pr_fmt(fmt)"[drm-dp] %s: " fmt, __func__
 
+#ifdef CONFIG_DEBUG_FS
+
 #include <linux/debugfs.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_file.h>
@@ -234,3 +236,5 @@ int msm_dp_debug_init(struct device *dev, struct msm_dp_panel *panel,
 
 	return 0;
 }
+
+#endif
diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index 6af72162cda4c8d4bc8dd4c6473cbc29817bb3c6..4680ccf3e72fa5c31afda5665defe71d1f238dac 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -117,6 +117,36 @@ static const struct file_operations msm_gpu_fops = {
 	.release = msm_gpu_release,
 };
 
+#ifdef CONFIG_DRM_MSM_KMS
+static int msm_fb_show(struct seq_file *m, void *arg)
+{
+	struct drm_info_node *node = m->private;
+	struct drm_device *dev = node->minor->dev;
+	struct drm_framebuffer *fb, *fbdev_fb = NULL;
+
+	if (dev->fb_helper && dev->fb_helper->fb) {
+		seq_puts(m, "fbcon ");
+		fbdev_fb = dev->fb_helper->fb;
+		msm_framebuffer_describe(fbdev_fb, m);
+	}
+
+	mutex_lock(&dev->mode_config.fb_lock);
+	list_for_each_entry(fb, &dev->mode_config.fb_list, head) {
+		if (fb == fbdev_fb)
+			continue;
+
+		seq_puts(m, "user ");
+		msm_framebuffer_describe(fb, m);
+	}
+	mutex_unlock(&dev->mode_config.fb_lock);
+
+	return 0;
+}
+
+static struct drm_info_list msm_kms_debugfs_list[] = {
+		{ "fb", msm_fb_show },
+};
+
 /*
  * Display Snapshot:
  */
@@ -180,6 +210,27 @@ static const struct file_operations msm_kms_fops = {
 	.release = msm_kms_release,
 };
 
+static void msm_debugfs_kms_init(struct drm_minor *minor)
+{
+	struct drm_device *dev = minor->dev;
+	struct msm_drm_private *priv = dev->dev_private;
+
+	drm_debugfs_create_files(msm_kms_debugfs_list,
+				 ARRAY_SIZE(msm_kms_debugfs_list),
+				 minor->debugfs_root, minor);
+	debugfs_create_file("kms", 0400, minor->debugfs_root,
+			    dev, &msm_kms_fops);
+
+	if (priv->kms->funcs->debugfs_init)
+		priv->kms->funcs->debugfs_init(priv->kms, minor);
+
+}
+#else /* ! CONFIG_DRM_MSM_KMS */
+static void msm_debugfs_kms_init(struct drm_minor *minor)
+{
+}
+#endif
+
 /*
  * Other debugfs:
  */
@@ -267,40 +318,11 @@ static int msm_mm_show(struct seq_file *m, void *arg)
 	return 0;
 }
 
-static int msm_fb_show(struct seq_file *m, void *arg)
-{
-	struct drm_info_node *node = m->private;
-	struct drm_device *dev = node->minor->dev;
-	struct drm_framebuffer *fb, *fbdev_fb = NULL;
-
-	if (dev->fb_helper && dev->fb_helper->fb) {
-		seq_printf(m, "fbcon ");
-		fbdev_fb = dev->fb_helper->fb;
-		msm_framebuffer_describe(fbdev_fb, m);
-	}
-
-	mutex_lock(&dev->mode_config.fb_lock);
-	list_for_each_entry(fb, &dev->mode_config.fb_list, head) {
-		if (fb == fbdev_fb)
-			continue;
-
-		seq_printf(m, "user ");
-		msm_framebuffer_describe(fb, m);
-	}
-	mutex_unlock(&dev->mode_config.fb_lock);
-
-	return 0;
-}
-
 static struct drm_info_list msm_debugfs_list[] = {
 		{"gem", msm_gem_show},
 		{ "mm", msm_mm_show },
 };
 
-static struct drm_info_list msm_kms_debugfs_list[] = {
-		{ "fb", msm_fb_show },
-};
-
 static int late_init_minor(struct drm_minor *minor)
 {
 	int ret;
@@ -375,20 +397,12 @@ void msm_debugfs_init(struct drm_minor *minor)
 	if (priv->gpu_pdev)
 		msm_debugfs_gpu_init(minor);
 
-	if (priv->kms) {
-		drm_debugfs_create_files(msm_kms_debugfs_list,
-					 ARRAY_SIZE(msm_kms_debugfs_list),
-					 minor->debugfs_root, minor);
-		debugfs_create_file("kms", S_IRUSR, minor->debugfs_root,
-				    dev, &msm_kms_fops);
-	}
+	if (priv->kms)
+		msm_debugfs_kms_init(minor);
 
 	debugfs_create_file("shrink", S_IRWXU, minor->debugfs_root,
 		dev, &shrink_fops);
 
-	if (priv->kms && priv->kms->funcs->debugfs_init)
-		priv->kms->funcs->debugfs_init(priv->kms, minor);
-
 	fault_create_debugfs_attr("fail_gem_alloc", minor->debugfs_root,
 				  &fail_gem_alloc);
 	fault_create_debugfs_attr("fail_gem_iova", minor->debugfs_root,
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index e7872b752c6c8e5869927634184733796afa1967..5b276a4540753aa25d46e50f0957790ed39474ae 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -70,12 +70,6 @@ enum msm_dsi_controller {
 
 #define MSM_GPU_MAX_RINGS 4
 
-/* Commit/Event thread specific structure */
-struct msm_drm_thread {
-	struct drm_device *dev;
-	struct kthread_worker *worker;
-};
-
 struct msm_drm_private {
 
 	struct drm_device *dev;
@@ -165,8 +159,6 @@ struct msm_drm_private {
 		struct mutex lock;
 	} lru;
 
-	struct msm_drm_thread event_thread[MAX_CRTCS];
-
 	struct notifier_block vmap_notifier;
 	struct shrinker *shrinker;
 
@@ -272,7 +264,7 @@ struct drm_framebuffer *msm_framebuffer_create(struct drm_device *dev,
 struct drm_framebuffer * msm_alloc_stolen_fb(struct drm_device *dev,
 		int w, int h, int p, uint32_t format);
 
-#ifdef CONFIG_DRM_FBDEV_EMULATION
+#ifdef CONFIG_DRM_MSM_KMS_FBDEV
 int msm_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
 				 struct drm_fb_helper_surface_size *sizes);
 #define MSM_FBDEV_DRIVER_OPS \
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index a63d014c19039835de47fb3fb610ce67652b5d2c..6889f1c1e72121dcc735fa460ea04cdab11c6705 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -246,8 +246,8 @@ void msm_drm_kms_uninit(struct device *dev)
 
 	/* clean up event worker threads */
 	for (i = 0; i < MAX_CRTCS; i++) {
-		if (priv->event_thread[i].worker)
-			kthread_destroy_worker(priv->event_thread[i].worker);
+		if (kms->event_thread[i].worker)
+			kthread_destroy_worker(kms->event_thread[i].worker);
 	}
 
 	drm_kms_helper_poll_fini(ddev);
@@ -300,7 +300,7 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 		struct msm_drm_thread *ev_thread;
 
 		/* initialize event thread */
-		ev_thread = &priv->event_thread[drm_crtc_index(crtc)];
+		ev_thread = &kms->event_thread[drm_crtc_index(crtc)];
 		ev_thread->dev = ddev;
 		ev_thread->worker = kthread_run_worker(0, "crtc_event:%d", crtc->base.id);
 		if (IS_ERR(ev_thread->worker)) {
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index f4eb486531890f3351cf83670be801e8fd3631bb..8a7be7b854deea9b763ec45df275fab77d806e44 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -13,6 +13,8 @@
 
 #include "msm_drv.h"
 
+#ifdef CONFIG_DRM_MSM_KMS
+
 #define MAX_PLANE	4
 
 /* As there are different display controller blocks depending on the
@@ -127,6 +129,12 @@ struct msm_pending_timer {
 	unsigned crtc_idx;
 };
 
+/* Commit/Event thread specific structure */
+struct msm_drm_thread {
+	struct drm_device *dev;
+	struct kthread_worker *worker;
+};
+
 struct msm_kms {
 	const struct msm_kms_funcs *funcs;
 	struct drm_device *dev;
@@ -161,6 +169,7 @@ struct msm_kms {
 	struct msm_pending_timer pending_timers[MAX_CRTCS];
 
 	struct workqueue_struct *wq;
+	struct msm_drm_thread event_thread[MAX_CRTCS];
 };
 
 static inline int msm_kms_init(struct msm_kms *kms,
@@ -210,4 +219,25 @@ void msm_drm_kms_post_init(struct device *dev);
 void msm_drm_kms_unregister(struct device *dev);
 void msm_drm_kms_uninit(struct device *dev);
 
+#else /* ! CONFIG_DRM_MSM_KMS */
+
+static inline int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
+{
+	return -ENODEV;
+}
+
+static inline void msm_drm_kms_post_init(struct device *dev)
+{
+}
+
+static inline void msm_drm_kms_unregister(struct device *dev)
+{
+}
+
+static inline void msm_drm_kms_uninit(struct device *dev)
+{
+}
+
+#endif
+
 #endif /* __MSM_KMS_H__ */

-- 
2.39.5

