Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00468ABAF72
	for <lists+freedreno@lfdr.de>; Sun, 18 May 2025 12:55:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97D2110E29D;
	Sun, 18 May 2025 10:55:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FaTtxHJP";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C17E10E1EF
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 10:55:28 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I8upJx009385
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 10:55:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 sEr7zBFz0n6zl511rF6sE9zKKxRwyqeRpnXZOdeaNiQ=; b=FaTtxHJP4Kv5xuW6
 e5v1mYTHGgulz2HXvx/QaTEPV6rZSRmVt1IYtRbARP2OBTyUknmzDmX/w+zQMoDc
 uxndCi58u6XOUaGfjq1iryLi3GGsjUGFd0JHJlAQBb3Z9z11eyoQn0CleKQQi/Ey
 9vI1umgCpwKun3uacsdiHkclZBQw9CNtKRWcO5i5x/NCPnt8y1oo7sYr4JYUyzjN
 m7oVU33fzw8QGd+AsDTvH+/majIWE6mXAGwTJ8yj6sNzkNrFOa4vZqrZOiFgsHr3
 y7Xeu1cwwNhXrX3NH8vU3SgJOUG7NBQK5u0fElNFQSHc8nArXIuXbnfQ0zIfJuIO
 i3TF3w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjnyhvr5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 10:55:27 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6f8d448a7f3so4584466d6.3
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 03:55:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747565726; x=1748170526;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sEr7zBFz0n6zl511rF6sE9zKKxRwyqeRpnXZOdeaNiQ=;
 b=rqmt6H4oj7wU11qFCTCdw90P8MqpY5Jso5fajIaM4MsuG+xsetU/03r9I4RBKdVKEf
 WxIM3NNINRcgqh+BNmMDQsvdb/5wHbXitRg2YqwHdyUx91i0Izfv/K2SWSBaT9hoJT2X
 3p6WJT2lWSXUgmW6dyUa/jhnXxSb6l1eiAhUk5mNrzaiUg/dE358Duuhtwp0G/XEdagI
 g3v6E60qUznCXMbCgN7M3JqXVh4SAjO77QqtmqJ1pfdqohg1o48bHrBhgpwIjuE6gyWg
 P49vpyGEW2BNQI8BL/B7r2pW9y45t9V1MjhvHUFirEbn+dGUBXYw50oTciIxm5kvzKAs
 o4zg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGDpFcT4R9T8YOjO++oI2lycNsajOJdWdQodA4hyeo0oWbroRXuQgmBZ1BoZdjvDRxSrgL6DT9hN8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3LwlsB0umhpziJvfOx7HgZ9GVw8z1XVCFCpo6MidF9FlOsjX1
 kwTErGKmboqASbeH967NoUi07cNDyykF4M6DOHKOOUkDIHsoy+PUpPzw1q9IPQNH2WcxJncfvp+
 YdkfEpZvpUrmu2ZuptFeKyPNNXLt1ArJ1lTpS4Wxs+J7A2GvVGKXBg48l4Z0zsiT5AlMw8O0=
X-Gm-Gg: ASbGncuc7RgBmrZFWC/G12Q42xzOAa9Px2RhytdcjqC10aTDn53sQO/p7xu6Ka90Q9+
 WMIKvEfgfvbCiTiPO/UI3ufVADUhnfIu5mcwlRLxjDHD4gnIXAD1H56hQhrnQ8cqhe5TLoFr+AI
 GDHzuAFVv3yfvEFgNpW6BndV+FnqMA2Jjspi9NU/r9jGj9MTBQCe693wEFO3obS4uSYOSzXdbG0
 BcfHJ8kJMRrHcGcQLh7ck2d4yP6N9Si3lARtcrFEMkZx9QvOYbpBIruI8ca3MbFw4l9LLjAVM7o
 YHCerq8U3F6+ST0MkkSybPLEm/ysD9qbnIBYdl/DBU+1FkOB0qf5ZiAdm2TMa6QIa/lV0KDaQEO
 8sbG1QYp2mmQ4VfGDKe72qu2D
X-Received: by 2002:ad4:5f0d:0:b0:6e6:6699:7e58 with SMTP id
 6a1803df08f44-6f8b080f7f2mr142533216d6.1.1747565726458; 
 Sun, 18 May 2025 03:55:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8jDRSLyHu8Beh4Rs+WkdKbU/y1DKOHysgVhdac3LhO3zY/2F3wcKcQzkFruFC6WQ6HiTdsA==
X-Received: by 2002:ad4:5f0d:0:b0:6e6:6699:7e58 with SMTP id
 6a1803df08f44-6f8b080f7f2mr142532976d6.1.1747565726041; 
 Sun, 18 May 2025 03:55:26 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328085cf8ccsm14314451fa.99.2025.05.18.03.55.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 03:55:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 18 May 2025 13:55:19 +0300
Subject: [PATCH v3 01/11] drm/msm: move wq handling to KMS code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-msm-gpu-split-v3-1-0e91e8e77023@oss.qualcomm.com>
References: <20250518-msm-gpu-split-v3-0-0e91e8e77023@oss.qualcomm.com>
In-Reply-To: <20250518-msm-gpu-split-v3-0-0e91e8e77023@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7139;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=zJfl99w8gPUfrdwYMYw+1yKgLUvglxsypWiv2LeoqZ8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoKbyZa2rYnl2nhExspdmC9BS7VsDmJ1JWaTAsK
 ccOyKBqJn6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCm8mQAKCRCLPIo+Aiko
 1avvB/oCplnUwEGLIc7F3z3QnZAbryimLiMtzlRC4ZxS0Ms5oEiYu7uLSsk194PIV5ddITjOOFR
 lfRHFmSgBKUWut+hnhvSw9WcewVxsIaKAeKbuNX7HtAUN6P1eavS0Tolzgfh3eXdhE/zCNi5AIY
 8+K9cHSraqUODdc8/Emv03KlU7ASh+CVF4fN9X29LgWN3M6Xp2YZcw3MEwnCb34KOigtjvxVPw4
 SJqHFuzKkzUKNVy89vfYZu4xgAQBWzL1Ci3edBsySaY8l4IkaSNOFvBoKrZAr4WBQqujvLEKW+2
 krOa8+AfyInJpwoQc59C+/xbVjakh7yuqvl5wDgP/tNWR++k
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDEwNCBTYWx0ZWRfX8EBqAoMX25DI
 Oo85oHBLkiu8drCRXwk+Fkh3N/0B9BjFVGrKYyfId0FAg6PbRH8Oayx1pyli+UrsBQf26amgvrQ
 ZHmv+XshtrEPWTsVmOS5vvuO7J4+oEgS6zjvYcRF1wiaviVd1ai/K0/1F/XlhYIWQLsvG0LIJdy
 E61FkNsISjr274Hj+2rKY71TPUI5BuJ2Z/I8av4Szfh5Gl7B/kBDjKLgymeQRb5SDRmmuPFcYeq
 NgUqcD2UPrI8qGihjgu8qJlcuJfKny0V2/q+zgbyv/vVDWcgJ5YuzHUiCrKEyuUpWNF1DFXl1Mq
 +rydpqcPDsK0IdRxyPhUdoVjs5/DaQVj1HHqiKzgjsOIw9L5sP2W/BKmQ+w5FzJPZ41ml7df4LA
 CcUlRo9ZFNFgYaiR9b+ZKlGgz2hzIvK+iuD9ewQlcFfsR44CKZBK72OkCkwN/0krEAPYaaP+
X-Authority-Analysis: v=2.4 cv=Z9XsHGRA c=1 sm=1 tr=0 ts=6829bc9f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=lygNIV2IR02mpmLRnqcA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: ZpjtxBycQV6kUTvQVKwweFv9ZWDA0go0
X-Proofpoint-ORIG-GUID: ZpjtxBycQV6kUTvQVKwweFv9ZWDA0go0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180104
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
index f9c46180b8f7ace9122e74015244334c1f13ef2b..1aaed1cd9ec58fed3230acda4c283f0eedf3a9f0 100644
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
index b8610aa806eaeb540e76a6a17283faea6f482a99..5e1e62256c382426f70d21a5312fb40dda68d695 100644
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
index 0f653e62b4a008e3bafe09ee7fb4399e1fccb722..fce2365753e22850e56521e82b9d9dca29c09280 100644
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
index f316e6776f672e7a97268f716040d0cf73256c4b..78cea9d4999488648b4131a2da425fb349d1b664 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -82,13 +82,6 @@ static int msm_drm_uninit(struct device *dev)
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
@@ -104,8 +97,6 @@ static int msm_drm_uninit(struct device *dev)
 	ddev->dev_private = NULL;
 	drm_dev_put(ddev);
 
-	destroy_workqueue(priv->wq);
-
 	return 0;
 }
 
@@ -227,12 +218,6 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
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
 
@@ -253,12 +238,12 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	if (priv->kms_init) {
 		ret = drmm_mode_config_init(ddev);
 		if (ret)
-			goto err_destroy_wq;
+			goto err_put_dev;
 	}
 
 	ret = msm_init_vram(ddev);
 	if (ret)
-		goto err_destroy_wq;
+		goto err_put_dev;
 
 	dma_set_max_seg_size(dev, UINT_MAX);
 
@@ -304,8 +289,6 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 
 err_deinit_vram:
 	msm_deinit_vram(ddev);
-err_destroy_wq:
-	destroy_workqueue(priv->wq);
 err_put_dev:
 	drm_dev_put(ddev);
 
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index a65077855201746c37ee742364b61116565f3794..cc603bd4729e909e9381a3c277db262b13361de6 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -177,8 +177,6 @@ struct msm_drm_private {
 		struct mutex lock;
 	} lru;
 
-	struct workqueue_struct *wq;
-
 	unsigned int num_crtcs;
 
 	struct msm_drm_thread event_thread[MAX_CRTCS];
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index 35d5397e73b4c5cb90b1770e8570277e782be7ec..184a4503fef0deff7234a3ce332e0bf564fbce46 100644
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
index 43b58d052ee6aae0ce34d09c88e1e1c34f9c52ef..e52649bbee7dc6a80abfecf7f8d5bcfad3d8f60b 100644
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

