Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A52D9ABAF77
	for <lists+freedreno@lfdr.de>; Sun, 18 May 2025 12:55:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBBE510E2B5;
	Sun, 18 May 2025 10:55:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xw0THK2D";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1D1510E2AC
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 10:55:32 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I4kuGE029016
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 10:55:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xqg908SIWMwTmLhHkCP5zPeST6KmZTagNBLZ1+txW/k=; b=Xw0THK2DYxZapX/5
 8Bvvqgw1m2Pj4ZxAFhdlWZww3vJqXA0fEgdEUUM7EftA24lebNK1VC6RwnxkeZAh
 fe5ajC2VW/A3M9W9NUS5GC88PTB3rhBl53MQGZ0gYnB8LeikbJjuyLVwtADQAoKp
 kXC+vHXX3C9PAAJkrb3NTtsVDh/WxstsG4eTqdXyTyvJMJA25AiwQTHoticRqdI3
 6zaSsjJrhFcU6VG0PtNQSaxccbWaPQpJ1nTsOMWz9rYwdWR2HOGZ9enk1FmMXW9I
 9pGMsVoqDU1SU9kbyxUHyL+GMxbo74rrQN0mWq4onn8YWyjk00y7Gj8m1G538S1Y
 l9dj5g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjkyhvmq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 10:55:32 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6f6f5104d07so93369656d6.3
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 03:55:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747565731; x=1748170531;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xqg908SIWMwTmLhHkCP5zPeST6KmZTagNBLZ1+txW/k=;
 b=N6/7ztqRrkS6N8HW3bYSnq9exNtVqfHTnq/V8VbvJwp92F/tASijCfoXvMCUhS1ERu
 8av8WiX5Pvmj0ekKfzkbvY7/M8QJBHT+xYrqoZJBngbVZp+zddrzIGpYMa/gFh27KfOK
 09PwEiZP6mEAiYh1k6ltVRiVrjkFsJ0NEZ+n6qBTCdPWMpqB2tnwi2T8hmW06ec7juGD
 CX95zFdQ7e8duNm9DO3Rb8IiDAmQwNjG/KcUo5Qj47niHt73V8Q51+UiB9M1pEj1abjL
 Wyw31ZEcLqaT1S7jhCjJYoSSe8ElrDNUGejKWHKI7b6cpEMCoz5Eo+JvocX1eO/tltCq
 GrGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYBu75ujdsMXqNMyvrWHrHe6ZlqA+WT6PEoJsTO6NFZwYUrDSVJJEr39ccIKq659vFslrTbkDCZ0A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+8/9DchMPEsgyRg/J1/OGsmbzRGEyMXhVaza1FSX5gaEaai6g
 poEwbzw+/j2mOb1HU7IBKAe1HWJ97U1DCM3vN6ibkpm/HWorCikF3KWbenzbKjEMiu/U7A/4kgd
 OTMeIhVpuwUieR+XDTVFWjK/RFlYInXP1n498U+r+cOaMFT5xtBA3W6s7a0htsTPPTjCLPgc=
X-Gm-Gg: ASbGncu8cU9lfo/HmR9ATyntfUhF5tQz3lX8olNSYRNu+Kx3UJevQ5ov0tDgHTsgqWh
 tDyCpSpGv40D8yAqCZwm/cMcpq3JsC+h/EkfEsiuKhQc/CQySOX7NICHV4vQf1md0C7HHgdHnJZ
 mGTAlryes/LkQUSmA5BpgbpXpHkXbmI8c6sSeiEZEvNjHaiYwMkYSBu1izfU27+xNnxGnNruT+M
 rA/GKBFFWR59lw1jh7qy/6CFjZtBvwpdrWW8kmhIMZn2s1IsqOEghG4JSkk9QE3SiUifm7GGJGE
 X/Hf2tYP4xlWwjRLb6VZa6yhS4lGfnvphuLricH9JwBVwsz0f4EepTXMD8pUCFe3ra9R1u+AFeO
 +FwPaA338asYE/NR4jhZwvuSI
X-Received: by 2002:a05:6214:2403:b0:6f6:33aa:258b with SMTP id
 6a1803df08f44-6f8b2d44cb2mr140231246d6.45.1747565730882; 
 Sun, 18 May 2025 03:55:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXoM28if7sYXzUkFwaBeiJZo18ZBacr6n7BqUWIfTncmRbxTxibA2dK/WBE+vif8r8n0x4DA==
X-Received: by 2002:a05:6214:2403:b0:6f6:33aa:258b with SMTP id
 6a1803df08f44-6f8b2d44cb2mr140231096d6.45.1747565730525; 
 Sun, 18 May 2025 03:55:30 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328085cf8ccsm14314451fa.99.2025.05.18.03.55.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 03:55:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 18 May 2025 13:55:22 +0300
Subject: [PATCH v3 04/11] drm/msm: get rid of msm_drm_private::num_crtcs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-msm-gpu-split-v3-4-0e91e8e77023@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4461;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=x7cM2Rqp4n6JjfWiK8DuKNRjLhu0g1Po0+oqCeMtWC4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoKbyZbh30C4JhYyxJ4td66FMwIaNh03JQnEkr2
 U9GM45OlxOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCm8mQAKCRCLPIo+Aiko
 1YSGB/0QqTLIKnlxnKjVLFWgvFjQkgvPmi5SS16cZKNNEDETG+QYGFz9gL2HTAVQZb+/w2sYxIL
 W4y0P90TYuDD6bF5Bd1lMhqCuqONGzZvTlj6RMuc2Hz5YVN4CcJS8Br4t6vz9VLVBo84L8JEnnn
 Dyg1J1TrX/wMOk4TVrQyv08SATIi5tOWkIJ/sdWjoo1gRFmnZQ2OwemlzTeWCiQzlzKslmvrgJu
 xSLkBr49/erVwFa4GG7TywjROrjVUMU9bsHyqLWniw1tMrKP1b5GGcTj2jDOHCpRcII/I2D4lWa
 +YLYP6xJYwdjpbnx24Vstqpdc5Ngth6SfH7Jbd8rU6Xodc+b
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: q6h9oc29Yd-ypCAwqAJy2PIvE2QCpwCv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDEwNCBTYWx0ZWRfX5XxBNn342NuA
 K9fIyHU+yF79dkXSCNFWq/VvS1IMurnjAIgUXWc3HMz4pNV0dxuT4CRX/EaoMYHh8n4HE3dc/c0
 ly6YJVisi7tMJTsRpB3cTGOsh1bTN95ly3YD8Awuk0fdJj3/3GWSZEHotx9AVMp55R9Doq7QHXW
 6wTlcDB+4556OPknRXCqnWcqdgOehAvhyKAVaMEDdG+Rvx83qqFp72p9jjlHs/YuMyLlHNqhy8p
 c+IIePmc0Uzx0ogIl2k2lcSWw1sND6TJF4NYbb1LFV/ASqUaYAk566nubkon6UvRRERAqmCs71s
 aTNO745lz/lomP7ZTC/clV3Q7Crjc5R9WiHlOYA1Wwqg34ZeUtR4Qvl2M/i2UPDXmsv+utcZHAM
 3kr9+n0aJjmqqZjm6OjqUKsnnfYbCsq3dMbKHG0b8x2diIDyLpJSMdO4ZwzDJevX+rwvOHp3
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=6829bca4 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=F-HcN3iq_yGV61sY1bgA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: q6h9oc29Yd-ypCAwqAJy2PIvE2QCpwCv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999 adultscore=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
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

Drop superfluous msm_drm_private::num_crtcs in favour of using
drm_mode_config::num_crtc or MAX_CRCS as appropriate.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 3 +--
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 3 ---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 4 +---
 drivers/gpu/drm/msm/msm_drv.h            | 2 --
 drivers/gpu/drm/msm/msm_kms.c            | 4 ++--
 5 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 1fd82b6747e9058ce11dc2620729921492d5ebdd..4b95fbbda8e120c1eb86a23e5397db30145d505a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -874,12 +874,11 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 			ret = PTR_ERR(crtc);
 			return ret;
 		}
-		priv->num_crtcs++;
 	}
 
 	/* All CRTCs are compatible with all encoders */
 	drm_for_each_encoder(encoder, dev)
-		encoder->possible_crtcs = (1 << priv->num_crtcs) - 1;
+		encoder->possible_crtcs = (1 << dev->mode_config.num_crtc) - 1;
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 00920bd44f6f73099ff2c293473e427caa49b873..99ca1d6c54b2c24cde39de44bb55151576dbe188 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -296,7 +296,6 @@ static int mdp4_modeset_init_intf(struct mdp4_kms *mdp4_kms,
 static int modeset_init(struct mdp4_kms *mdp4_kms)
 {
 	struct drm_device *dev = mdp4_kms->dev;
-	struct msm_drm_private *priv = dev->dev_private;
 	struct drm_plane *plane;
 	struct drm_crtc *crtc;
 	int i, ret;
@@ -346,8 +345,6 @@ static int modeset_init(struct mdp4_kms *mdp4_kms)
 			ret = PTR_ERR(crtc);
 			goto fail;
 		}
-
-		priv->num_crtcs++;
 	}
 
 	/*
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 3fcca7a3d82e7aaa74379b19763c22eb43c953dd..5a706be17e2e5af2148366eacdddb378b2f69dbd 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -374,7 +374,6 @@ static int modeset_init_intf(struct mdp5_kms *mdp5_kms,
 static int modeset_init(struct mdp5_kms *mdp5_kms)
 {
 	struct drm_device *dev = mdp5_kms->dev;
-	struct msm_drm_private *priv = dev->dev_private;
 	unsigned int num_crtcs;
 	int i, ret, pi = 0, ci = 0;
 	struct drm_plane *primary[MAX_BASES] = { NULL };
@@ -442,7 +441,6 @@ static int modeset_init(struct mdp5_kms *mdp5_kms)
 			DRM_DEV_ERROR(dev->dev, "failed to construct crtc %d (%d)\n", i, ret);
 			goto fail;
 		}
-		priv->num_crtcs++;
 	}
 
 	/*
@@ -450,7 +448,7 @@ static int modeset_init(struct mdp5_kms *mdp5_kms)
 	 * crtcs for the encoders
 	 */
 	drm_for_each_encoder(encoder, dev)
-		encoder->possible_crtcs = (1 << priv->num_crtcs) - 1;
+		encoder->possible_crtcs = (1 << dev->mode_config.num_crtc) - 1;
 
 	return 0;
 
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index cc603bd4729e909e9381a3c277db262b13361de6..09d5f57e9343cce404d4f8a3a6d8a285f662f60f 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -177,8 +177,6 @@ struct msm_drm_private {
 		struct mutex lock;
 	} lru;
 
-	unsigned int num_crtcs;
-
 	struct msm_drm_thread event_thread[MAX_CRTCS];
 
 	/* VRAM carveout, used when no IOMMU: */
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index 49a56873100b2fdcded3eb6adcc7032bf404212c..9dfe0fb4755ddd11277f524234297ccd5ea96001 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -245,7 +245,7 @@ void msm_drm_kms_uninit(struct device *dev)
 	flush_workqueue(kms->wq);
 
 	/* clean up event worker threads */
-	for (i = 0; i < priv->num_crtcs; i++) {
+	for (i = 0; i < MAX_CRTCS; i++) {
 		if (priv->event_thread[i].worker)
 			kthread_destroy_worker(priv->event_thread[i].worker);
 	}
@@ -313,7 +313,7 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 		sched_set_fifo(ev_thread->worker->task);
 	}
 
-	ret = drm_vblank_init(ddev, priv->num_crtcs);
+	ret = drm_vblank_init(ddev, ddev->mode_config.num_crtc);
 	if (ret < 0) {
 		DRM_DEV_ERROR(dev, "failed to initialize vblank\n");
 		goto err_msm_uninit;

-- 
2.39.5

