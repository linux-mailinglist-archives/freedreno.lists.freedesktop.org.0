Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E18CA8727E
	for <lists+freedreno@lfdr.de>; Sun, 13 Apr 2025 18:33:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C81EF10E234;
	Sun, 13 Apr 2025 16:33:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gk5nmMT0";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEFB410E245
 for <freedreno@lists.freedesktop.org>; Sun, 13 Apr 2025 16:33:04 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53DFP6Kc030454
 for <freedreno@lists.freedesktop.org>; Sun, 13 Apr 2025 16:33:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 bOWXlqW2H1X69rbgrXv1oCon4lNL/6HLaxB38aViTLE=; b=Gk5nmMT0KFwOM/HV
 NH+rUzdU2YJ/bYywWdcFHSgokhC8yTvTMWm9RJTKL8M1Um60+x8zCmYUaAFikyb7
 Dmws9gYo+qA6bsJy1NpVTsL3pKQcegB5ONjRL3MHBUho6geDkMbxWvYgqwO+T4vv
 Hj8l7WVTd15fc7dZDEvqntMXZZxv41w3wXt3KbEDCsgShZhjofjqXRd6+Dg82GUj
 uCoVModH/qRjSYt/m6yJTsePuscCQ7Dfeh9E56PuJdz1C8sfRd/K3tgwcwg8aMNY
 uATP9NITvcALNgHGoM0iHgr5cXGh0I2hZq2+DbRAF6jnPBwWeZnh2pk+v+glgRXx
 TsqSOw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydhq2m7g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 13 Apr 2025 16:33:03 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6e91ee078aaso63898286d6.3
 for <freedreno@lists.freedesktop.org>; Sun, 13 Apr 2025 09:33:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744561982; x=1745166782;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bOWXlqW2H1X69rbgrXv1oCon4lNL/6HLaxB38aViTLE=;
 b=AZQ7mQyIm802r8qww8F+54YqqmhXSRSBzURsb7uYkzLukGy/yA37IKwhv4ihqf3H6M
 x4SbPJHjrNieChHVeWtbN+ahITqnPuHRIdPgvqiW1M7qiE95z15ST8f5LpwaS6cKxN/6
 cHrLXG66a4QGVBGSkFjqSlmy6mDllMZKOlBaChq9SZLiORA7GDiQNSZ+wCBmEzCY6b9v
 fXHJnWFLxVy0PrwwG9V0VOl5Sp7at97sf3noWZBAy+E9L8RbdLk49MJH7gISVQklLiK3
 QSjLfjJ26Sx4skPkXQTabZK1pyrZ0WF7O8drOuAI3iaYDgFqvVVNNisS88YgKRgXnBao
 rrtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTQgMqCXfsWUJTn6mMU+50Vz1jC+NjT6shJXngIPe0Mua+LB9abwTp0PCS+ikhLyYRWoarhkettiY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKUhXM1HQo2Qvp2KpNYz1iXVZNxG+BCU8FX4Q7Z9GVWnMSMP0k
 M+Ah4D28rzCfP0eL4f/eVJdGCc3hga/mD06ikmxhJpBQsAVuucEPJ7Hc814L6M/FAUsWCxB6TCx
 7l71OAudmAPqvB9AS4/q1exsAnrvQUqmtWKq3z8NbsHeeR9gZlG1Xq+WnLcrRz1PbYug=
X-Gm-Gg: ASbGnct/OhimmNb+lBcbPs9Z6XSpiIUoF3z7VAh5L03sBJzzxCgildoaIEZUx77WQTa
 0BkcxIkvds3EiKxF8R+Tw2+qR/LtcqAPUZx0xd6WEXkXsTmYLccGmn155s3CftEgaQprwLBGUHs
 7nFKYYDM/5D9CgQKoAa2lmJAkMQkT0tWJ4kEOLn49XS94s32HslG2hjLN0XSRT12DUN/5UYxQtP
 m6Hqpuzzwo5k57eVh013LNTfz4chkQDFDZfjwyHoN1LhYKYTnj4sn7FwOgWKed6eNh9mobI6snn
 CyxIFFUTDceGb5lYptpi6EINVrzcPOvRHmmcJZf8yDodRZ2cvLScbpDEZHYh0wX1ddcnGzFnibK
 PL2npSrzPZBih+raNHmfx9PIY
X-Received: by 2002:a05:6214:2387:b0:6e6:61a5:aa57 with SMTP id
 6a1803df08f44-6f230cf8f72mr137524606d6.14.1744561982136; 
 Sun, 13 Apr 2025 09:33:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYlIetlwLWD8fWLuwPElP336tSus44Q9FzUT8/6hvSsG59ryTL0vVnyXP15pLCLjXU2KHuEw==
X-Received: by 2002:a05:6214:2387:b0:6e6:61a5:aa57 with SMTP id
 6a1803df08f44-6f230cf8f72mr137524226d6.14.1744561981505; 
 Sun, 13 Apr 2025 09:33:01 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30f464e9812sm13345431fa.49.2025.04.13.09.32.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Apr 2025 09:32:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 13 Apr 2025 19:32:55 +0300
Subject: [PATCH 1/7] drm/msm: move wq handling to KMS code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250413-msm-gpu-split-v1-1-1132f4b616c7@oss.qualcomm.com>
References: <20250413-msm-gpu-split-v1-0-1132f4b616c7@oss.qualcomm.com>
In-Reply-To: <20250413-msm-gpu-split-v1-0-1132f4b616c7@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3644;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=OXKR8Bekin1jml/eRU8BDlgsy1eZQ5R/fWSgssRh70w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn++c539kpkZcgiwYj8YBtJ6U0W2bhkdYpBMw/v
 o5tB6Y2aWKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/vnOQAKCRCLPIo+Aiko
 1aPsB/9fRlpj+FblmlkY+PCOG4ByEVp4sWFeaROnjT2dfgoK3+QwyU/Llyo9oHzj8HactL4XoYq
 miaDayv3LVoxjcYvJeamoUAKf1zbIHcvs7Ld6nQuDU26dpaaH0iAD2sC5e1FWMGoCTI7x1w3z4I
 CpocIXGNsIPQAzcJkfd/wJYYJWk/+rw9VpGIQ50fA1BZ+j72jON015Hhl8xMcSgF8Wz9zVp3VBv
 c/jp9L/WphXV+pIhSouvXlFsarXX8HWMv1aCXHOPjpNtKjsUKo04/gF5InsNOvxRAu82hfqgi+e
 PVHtnO3PPWtW0u9oWzJXef04tRenRJLyUwpNS11wASpwI2S9
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Z688qgMnybjRT2LQ95AzlK2YUNhv_A93
X-Authority-Analysis: v=2.4 cv=C7DpyRP+ c=1 sm=1 tr=0 ts=67fbe73f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=4zMMb90fMlmLdFOEXiAA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: Z688qgMnybjRT2LQ95AzlK2YUNhv_A93
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-13_08,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504130127
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
 drivers/gpu/drm/msm/msm_drv.c | 21 ++-------------------
 drivers/gpu/drm/msm/msm_kms.c | 16 +++++++++++++++-
 2 files changed, 17 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index c3588dc9e53764a27efda1901b094724cec8928a..02beb40eb9146941aa43862d07a6d82ae21c965e 100644
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
 
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index 35d5397e73b4c5cb90b1770e8570277e782be7ec..821f0b9f968fc3d448e612bfae04639ceb770353 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -227,6 +227,13 @@ void msm_drm_kms_uninit(struct device *dev)
 
 	BUG_ON(!kms);
 
+	/* We must cancel and cleanup any pending vblank enable/disable
+	 * work before msm_irq_uninstall() to avoid work re-enabling an
+	 * irq after uninstall has disabled it.
+	 */
+
+	flush_workqueue(priv->wq);
+
 	/* clean up event worker threads */
 	for (i = 0; i < priv->num_crtcs; i++) {
 		if (priv->event_thread[i].worker)
@@ -243,6 +250,8 @@ void msm_drm_kms_uninit(struct device *dev)
 
 	if (kms && kms->funcs)
 		kms->funcs->destroy(kms);
+
+	destroy_workqueue(priv->wq);
 }
 
 int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
@@ -258,10 +267,14 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 	if (ret)
 		return ret;
 
+	priv->wq = alloc_ordered_workqueue("msm", 0);
+	if (!priv->wq)
+		return -ENOMEM;
+
 	ret = priv->kms_init(ddev);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "failed to load kms\n");
-		return ret;
+		goto err_msm_uninit;
 	}
 
 	/* Enable normalization of plane zpos */
@@ -319,6 +332,7 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 	return 0;
 
 err_msm_uninit:
+	destroy_workqueue(priv->wq);
 	return ret;
 }
 

-- 
2.39.5

