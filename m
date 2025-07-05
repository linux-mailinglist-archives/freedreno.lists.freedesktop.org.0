Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F7EAF9F82
	for <lists+freedreno@lfdr.de>; Sat,  5 Jul 2025 12:02:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0D8A10E37E;
	Sat,  5 Jul 2025 10:02:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="T7/FkzG8";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2666810E36F
 for <freedreno@lists.freedesktop.org>; Sat,  5 Jul 2025 10:02:36 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5659mDmS009786
 for <freedreno@lists.freedesktop.org>; Sat, 5 Jul 2025 10:02:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lBMihF+DEg5f9iNk9vITa0K+ZaoVMfarXuZqca9z/1Y=; b=T7/FkzG8fdvEe+5x
 MdWUNGCk4YZf43VDgg99XIdViFmHnwHGM8Rs/nd5KwB0niapvJ2iHPMtTVID6TiF
 C01rkcOpRNvCFLfeFNSWWsIjgnF77+pEhXcblk9Lj9q3ueIFT0a2OWwtH2hMVJze
 pGTzk043ur2AOAaQQ2a1MPegPICUV40bU243f9OCkRDkKAcLV65UQmdz4i2ou4Gd
 7OsNjNDslTqK+uu1LVDk86cqRC45wzXr31nv0IYD//XEGswQaC+MQnYp9fbi2nQx
 ZKuJkXXvUy3EJYlJMRNVHdu6YZNuASMbAos+KXASoUShL9ck6tJt2CEWauymsYHS
 uWKHtg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pun20mau-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 05 Jul 2025 10:02:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7d3d3f64739so362580185a.0
 for <freedreno@lists.freedesktop.org>; Sat, 05 Jul 2025 03:02:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751709754; x=1752314554;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lBMihF+DEg5f9iNk9vITa0K+ZaoVMfarXuZqca9z/1Y=;
 b=mWQReqo/s7+xAPD/gqTQPNEspUMdy73dif5kZrwWhxlcrY92BKc+ybru1xrxqW6GI6
 vUjjzcxAiMHZqGCdUAjv7WOmG0r/Pv4LtHMMKPYKGcwQAO777BInBx/zEL2D0UzbzW1s
 KtZjhkXEczWjChFMRQN+mxQ6MjLihMdzgzhMzT6X/vpGfNIwSXTRH2GvL39DeruoqK1I
 cawI3vW6SoI7HlGE/tiMyapdzikhdlyKG4N7msO3CyKHXy3Qb1E3RFrunhhYw6kXDNP9
 aRQ4kqrD3lZXXwcqo+rUY/LqDtAGXADTqEhpGrpygAAdTD72a789GuDj/+v7rUyo/fQt
 vN4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3SlwPevciZz7rJYQeQvohXl/GB7SqyAzeGwSDlL46edDlthvOjW+2PBq+t07gQQtq1Y1yx1IJeTk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxl1cpc++pcDujB3vERFdeCwcgI67KYZxtRZBJsWdaksGw7ybfM
 wB0mvxEROIrWr3jsOgfk6iDn6Xq2A0TK0Fa5nehnT/h/MqXwv8qCfS3t+NBE3DUfKWTs9vZpX+J
 t6YHjFHooKTHjS4oVH5AhpHYQSJMKuw49BNq3XafQHqeOby7L9T8uWY2tXpISvXsnbCQDX3Q=
X-Gm-Gg: ASbGncv9HZX5Sm5Do2eHWawnDvDXDKAPyYwEKkeXI+dUPS5cKe1HINx4HWr37670kP+
 3VH7Jojb7aU1dqgOL7GyL6XfodwCvKnltI4jbTLhcdVIcNh24ft4e0i1mR+/BCVsaRy0Ygh3Jqh
 KaHuyt0EKLzelzvkDDoNHAQQqV2o2EEQyyDHJgsp4sBAcuaJIRsC1EyOvHgrYl+7xzDWEmbo4YK
 kCWaxHux8dhOFtGZPZBl0vgcZIJr7aXU3z7GAH5RwwJUvkozquxsdCvWfAqwafmnPG4eaJ7zi9X
 QQ3Iaq8/ikouymcY8nJy0US9miA1O9w2AIFy0HpY1FbBEwGsX9KUF4GdsFNy/fcJinDBcmMaaxm
 TpA/5Zb7hCeye1xgE3AppwrqEfRuNy+7SzjM=
X-Received: by 2002:a05:620a:4888:b0:7d3:ffb2:c732 with SMTP id
 af79cd13be357-7d5dccf4b23mr705984585a.26.1751709754209; 
 Sat, 05 Jul 2025 03:02:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgEkPw6egpZkeXs3+oSTsOMarZKkHaBnKx+D9TwlcSnQbSBEqiF9VocFE4fHXvCy72VoGacQ==
X-Received: by 2002:a05:620a:4888:b0:7d3:ffb2:c732 with SMTP id
 af79cd13be357-7d5dccf4b23mr705981985a.26.1751709753660; 
 Sat, 05 Jul 2025 03:02:33 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-556384c0558sm526274e87.209.2025.07.05.03.02.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Jul 2025 03:02:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 05 Jul 2025 13:02:26 +0300
Subject: [PATCH v4 01/10] drm/msm: move wq handling to KMS code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-msm-gpu-split-v4-1-fb470c481131@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7299;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=BlPzvety+GReSb5ljsBIzhJtL2i+9ttmfQU5dRgJaXM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaPgzHuOQATM2sXKXLoo1JJqXX4FG29PDSjVg5
 /7l6d0HDWGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGj4MwAKCRCLPIo+Aiko
 1TYkB/wL94YGKmC+l+nvVDramZxf1vgXqJIEqFNHI2UNNiH3A4n+2rHYDJqz7d7pniEC/WkS6ao
 jkhi+kNKJTS3ZHshb0283AIUka8ZK88syYytcrsagud8pvsS3XBpO9Q4UR5lGt6zr2jRWPCpYSR
 wxudm8oah5WwNeAkGf16d9Y569OBjxpERYcRL+yM/zKCIDmCfrfqHDPpEcODw0UJNbzcoDT1mBx
 XbCQ9beycTskjWmxXT+h1B0YxVEtoID0RLROaxTJ82WG04LnyCPq8M1a2qNNVgZkIsZ0AwP7oMg
 AcMytt6BjC9V4vkhpnicKLLZLnfr2HjBUbPcYzYYJ932KZ22
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 6nw3E6hFqMZSBvJVWf3RUG5qtYFqmsUJ
X-Authority-Analysis: v=2.4 cv=GdUXnRXL c=1 sm=1 tr=0 ts=6868f83b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=T1fEnJx6pJBI0EFA4NgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 6nw3E6hFqMZSBvJVWf3RUG5qtYFqmsUJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDA2NCBTYWx0ZWRfX8XKVcHE/Opcv
 GPFpmeH1PaC2SvAdGKkxmRsvX8V8h27qvVQodUWGuDTeZ9Y5y2+LIAKr0OFNmzfGjBhMVMZZuSr
 sJjbZ8vGqIOi7xO37ExAMJclymr5c65IPpKKmO9OkUePADTKBrZMVZVFv+bmccKTAcdvL32NqfN
 gO/saoMiT5cjmMPVWEHbYclKKxPILjMyueOXdQvzjPrpy2aMyUG2ccGDo5MdtO3d85MB7YQZ+Ok
 JuJZdPbhjNljHgIwfhZtI9zhY40ZrKhJKZyxBQ5mUx3FARko+VQv5RR6Ondm7HwyVUqckyI4vXB
 ZUF0cZsP8/of3W7H9kwr8FSaHVwYLRU4W0B7Tu3vhJasF/DjseLFgLm5weafk7ZPS5HXWjzOZ5t
 Y9kblzKjQRkvIR1G5qYtf0h0+37njujrSb1QzeSZU70qHql3+AgVPZ7jr46bmDVQXILxQ+EU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 malwarescore=0 mlxscore=0 phishscore=0 impostorscore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
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

The global workqueue is only used for vblanks inside KMS code. Move
allocation / flushing / deallcation of it to msm_kms.c

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c   |  2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c   |  2 +-
 drivers/gpu/drm/msm/msm_drv.c               | 21 ++-------------------
 drivers/gpu/drm/msm/msm_drv.h               |  2 --
 drivers/gpu/drm/msm/msm_kms.c               | 11 +++++++++--
 drivers/gpu/drm/msm/msm_kms.h               |  8 ++++++++
 7 files changed, 22 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 078d3674ff411cf07614ae68889d8d0147453d10..f7abe8ba73ef0899ff1985ebf26571b7c459a52f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -980,7 +980,7 @@ static int dpu_encoder_resource_control(struct drm_encoder *drm_enc,
 			return 0;
 		}
 
-		queue_delayed_work(priv->wq, &dpu_enc->delayed_off_work,
+		queue_delayed_work(priv->kms->wq, &dpu_enc->delayed_off_work,
 				   msecs_to_jiffies(dpu_enc->idle_timeout));
 
 		trace_dpu_enc_rc(DRMID(drm_enc), sw_event,
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
index 0133c0c01a0bcd619089a5565719d764d88b63f8..2ee03ce2fd398be4f5b101be09c6dfb495324128 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
@@ -511,7 +511,7 @@ static void mdp4_crtc_vblank_irq(struct mdp_irq *irq, uint32_t irqstatus)
 
 	if (pending & PENDING_CURSOR) {
 		update_cursor(crtc);
-		drm_flip_work_commit(&mdp4_crtc->unref_cursor_work, priv->wq);
+		drm_flip_work_commit(&mdp4_crtc->unref_cursor_work, priv->kms->wq);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
index 298861f373b04cb4f7a37c42d0648a1c40d2aad1..4c4900a7beda8f7bd3184230a1c1b5f7ebd0c588 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
@@ -1196,7 +1196,7 @@ static void mdp5_crtc_vblank_irq(struct mdp_irq *irq, uint32_t irqstatus)
 	}
 
 	if (pending & PENDING_CURSOR)
-		drm_flip_work_commit(&mdp5_crtc->unref_cursor_work, priv->wq);
+		drm_flip_work_commit(&mdp5_crtc->unref_cursor_work, priv->kms->wq);
 }
 
 static void mdp5_crtc_err_irq(struct mdp_irq *irq, uint32_t irqstatus)
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 2283a377cda14fc08aaab71e093b71f8e3954eec..8f79f5b9a61eb39dbd63b4ff225b96e63ee9a5dd 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -77,13 +77,6 @@ static int msm_drm_uninit(struct device *dev)
 			drm_atomic_helper_shutdown(ddev);
 	}
 
-	/* We must cancel and cleanup any pending vblank enable/disable
-	 * work before msm_irq_uninstall() to avoid work re-enabling an
-	 * irq after uninstall has disabled it.
-	 */
-
-	flush_workqueue(priv->wq);
-
 	msm_gem_shrinker_cleanup(ddev);
 
 	msm_perf_debugfs_cleanup(priv);
@@ -97,8 +90,6 @@ static int msm_drm_uninit(struct device *dev)
 	ddev->dev_private = NULL;
 	drm_dev_put(ddev);
 
-	destroy_workqueue(priv->wq);
-
 	return 0;
 }
 
@@ -119,12 +110,6 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	ddev->dev_private = priv;
 	priv->dev = ddev;
 
-	priv->wq = alloc_ordered_workqueue("msm", 0);
-	if (!priv->wq) {
-		ret = -ENOMEM;
-		goto err_put_dev;
-	}
-
 	INIT_LIST_HEAD(&priv->objects);
 	mutex_init(&priv->obj_lock);
 
@@ -149,7 +134,7 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	if (priv->kms_init) {
 		ret = drmm_mode_config_init(ddev);
 		if (ret)
-			goto err_destroy_wq;
+			goto err_put_dev;
 	}
 
 	dma_set_max_seg_size(dev, UINT_MAX);
@@ -157,7 +142,7 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	/* Bind all our sub-components: */
 	ret = component_bind_all(dev, ddev);
 	if (ret)
-		goto err_destroy_wq;
+		goto err_put_dev;
 
 	ret = msm_gem_shrinker_init(ddev);
 	if (ret)
@@ -194,8 +179,6 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 
 	return ret;
 
-err_destroy_wq:
-	destroy_workqueue(priv->wq);
 err_put_dev:
 	drm_dev_put(ddev);
 
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 2b49c4b800eef039bb49907058c426b152e0f7f1..33d668a18ff3613b40341df540d504ffff65b2a7 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -175,8 +175,6 @@ struct msm_drm_private {
 		struct mutex lock;
 	} lru;
 
-	struct workqueue_struct *wq;
-
 	unsigned int num_crtcs;
 
 	struct msm_drm_thread event_thread[MAX_CRTCS];
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index e82b8569a46846fbd212c987f9f0d3e7939e12a2..c6c4d3a89ba829e161b060b52c91f5323cb5a806 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -137,7 +137,7 @@ static int vblank_ctrl_queue_work(struct msm_drm_private *priv,
 	vbl_work->enable = enable;
 	vbl_work->priv = priv;
 
-	queue_work(priv->wq, &vbl_work->work);
+	queue_work(priv->kms->wq, &vbl_work->work);
 
 	return 0;
 }
@@ -227,6 +227,13 @@ void msm_drm_kms_uninit(struct device *dev)
 
 	BUG_ON(!kms);
 
+	/* We must cancel and cleanup any pending vblank enable/disable
+	 * work before msm_irq_uninstall() to avoid work re-enabling an
+	 * irq after uninstall has disabled it.
+	 */
+
+	flush_workqueue(kms->wq);
+
 	/* clean up event worker threads */
 	for (i = 0; i < priv->num_crtcs; i++) {
 		if (priv->event_thread[i].worker)
@@ -261,7 +268,7 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 	ret = priv->kms_init(ddev);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "failed to load kms\n");
-		return ret;
+		goto err_msm_uninit;
 	}
 
 	/* Enable normalization of plane zpos */
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 7cdb2eb6770035a8bbed548de3dcbebf94188fff..e48529c0a1554e8b9bf477dd71f59286b388de73 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -153,6 +153,8 @@ struct msm_kms {
 	struct mutex commit_lock[MAX_CRTCS];
 	unsigned pending_crtc_mask;
 	struct msm_pending_timer pending_timers[MAX_CRTCS];
+
+	struct workqueue_struct *wq;
 };
 
 static inline int msm_kms_init(struct msm_kms *kms,
@@ -165,6 +167,10 @@ static inline int msm_kms_init(struct msm_kms *kms,
 
 	kms->funcs = funcs;
 
+	kms->wq = alloc_ordered_workqueue("msm", 0);
+	if (!kms->wq)
+		return -ENOMEM;
+
 	for (i = 0; i < ARRAY_SIZE(kms->pending_timers); i++) {
 		ret = msm_atomic_init_pending_timer(&kms->pending_timers[i], kms, i);
 		if (ret) {
@@ -181,6 +187,8 @@ static inline void msm_kms_destroy(struct msm_kms *kms)
 
 	for (i = 0; i < ARRAY_SIZE(kms->pending_timers); i++)
 		msm_atomic_destroy_pending_timer(&kms->pending_timers[i]);
+
+	destroy_workqueue(kms->wq);
 }
 
 #define for_each_crtc_mask(dev, crtc, crtc_mask) \

-- 
2.39.5

