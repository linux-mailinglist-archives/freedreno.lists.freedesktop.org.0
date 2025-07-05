Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A868AF9F88
	for <lists+freedreno@lfdr.de>; Sat,  5 Jul 2025 12:02:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22BC010E381;
	Sat,  5 Jul 2025 10:02:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hlxieKwj";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B762A10E380
 for <freedreno@lists.freedesktop.org>; Sat,  5 Jul 2025 10:02:42 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5656U0OE014633
 for <freedreno@lists.freedesktop.org>; Sat, 5 Jul 2025 10:02:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4F90/3W/LUSFn38dXcUegvIFvXJs8yXbN6RnwBBqeTQ=; b=hlxieKwjlAhXJ2wM
 kaSl17R9dNl5jCLRHVouR96BkS6q+FcU83GvxCa500HtX9zVo/IWYT9hVtR9xqV6
 XeJ34Gngz9dyxzI4pIHBGB362Q1Di5vJbzvWDenmMrk4bRFqqMB7071oUForoJnB
 VUq4F+SaVt4Bdb7rwZjFNOth+bHFHX3qGszj9BNOdDSbFh6zUuJB88HU+EWQSMHj
 Okta6NioMo4Dn1xRX0o5bvODou++SSHDF+hLfwPbDBX9kSp7XszDqmBzCTrHcJ73
 vlMWDF8SGTJyUh7TYQC4pizU8Phbuuwk+DaItnBEQhhjzUEaaDBg7FQXjpRnGzyK
 f8P+Hw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pun20mba-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 05 Jul 2025 10:02:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7d5e345a3fcso105499185a.1
 for <freedreno@lists.freedesktop.org>; Sat, 05 Jul 2025 03:02:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751709761; x=1752314561;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4F90/3W/LUSFn38dXcUegvIFvXJs8yXbN6RnwBBqeTQ=;
 b=D2F6MzafddjEXurz4nDrOedVVA0qk75hv/eRboT/zorKjgePd7Ijerrxb6ZXbM7D8n
 5vMQy3IjNaHH2JNzQ2B4AbI2jd3aasWaT1+GRvEnb3GTyieFbUO4Ll1XLvyIbzzZpmak
 qyI4gD2fkhSDoJHEvb2YYX4cygumYwE8uYUSqSK1SlsOQ1R7pLG1ZrMrXfvBy6w6AeEq
 MIJpatd5vaj0Q6/EmIdLbd50hN0rfngB1FZeIBeds5VKUNnSf6YAj7XY231Koety+ipa
 FLTzub2z27sg2/6Twl53ygiPuZwPucWX6v3U4t/NszMb+gvCDVthq8rOE080UGEuvQ1m
 XMrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUThuKjLBGL9dfFNO6f28xIoR/6INP0Iyh9wsMgILzRAnQpTADGhfo5ax/I5VhLPgSFX87xnWkehfE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPwF0adSXMwhCAB7O1T3A25dfDJf6ElKqPiF1hJEQZtXyjnFak
 i4n0elvTTSYPp+b2x4TeT9pvmTgHeXHSdLrwcOWwX+Gm/yEC37qrG2TwH+3kXZJoeX/cRmcUEGK
 ad9m1//hGWmU4LZ2K+B/FiHqDUFej2OnRRIZAFrkEiVqM4VkZIdv4hLXe/n+mpXUkN7f9UoQ=
X-Gm-Gg: ASbGncvdjs6MgXljTG+x3jtwfmHIxfnqd7RZp4tOYzjtVbZyjoJuWCLr4c7Cg/5UwrG
 N8mcnxJdDzJ73u25buBQiFDfiF5r5KFIsN+x3kAa0Rt8uglqC/bdDuN0rFRtn2N1DIbKmrAM9Tc
 +Sjwf3CouISrMnBqYIvcK4S0fbYmh9j8RCShgRURlwKZNZT2J2xkY++lqj0HTrAlqWvn2tr8c9J
 N5Ze02ySt3kGMAGujBTfiu+jBZ6bL0EUpXnuCceLKEUFz9oANCfUTzk0cneRAFfHnZhD8h/wRbi
 dNw67H7Dg4QSsC6ChzKfNuvTvhz0M04TGG/lMEDyq8c6jDK5+DS/khdIeShxTMVv5EaPW9VuBEW
 6CI9RZAt0koiGCQnIK30y/jYSg2q5M6HQRRE=
X-Received: by 2002:a05:620a:2915:b0:7ca:f02a:4d2b with SMTP id
 af79cd13be357-7d5dcc7295dmr751767485a.12.1751709760467; 
 Sat, 05 Jul 2025 03:02:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGulStBJHLwU8HwDOIF+guVJVHi5pOC4lXhzr0md3WFCORD6oDXM4sw08Hi8v5tjavsA5Phzg==
X-Received: by 2002:a05:620a:2915:b0:7ca:f02a:4d2b with SMTP id
 af79cd13be357-7d5dcc7295dmr751761785a.12.1751709759816; 
 Sat, 05 Jul 2025 03:02:39 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-556384c0558sm526274e87.209.2025.07.05.03.02.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Jul 2025 03:02:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 05 Jul 2025 13:02:29 +0300
Subject: [PATCH v4 04/10] drm/msm: get rid of msm_drm_private::num_crtcs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-msm-gpu-split-v4-4-fb470c481131@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4457;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=TPCljJOCE+lAGVk6fcBbNqkJA6qavoaTCAklWifT78M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaPgzYU4YT/9DG03zg0Djt3R1PL8JY+Bj6d5l7
 Jy5NeZZsRWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGj4MwAKCRCLPIo+Aiko
 1RNICACdfxbPAPjg77KvBwb9W88X1WwjulbLAGup29/00hSU5LfPUKuPHIC1AGOb47UA8NQkDgU
 csHLBA/YtesFD/a8GBOrrsPD/+U4hvdxgz1zB7pCYWEaQ6KkaIV8Ik6dYuq+IM9AyFot6npA+3q
 kNrQyx4GsanMOM/yabLUABnMF+FN6qLhWWIQuVjaylxysF6nfmQacD+bhsGweItMagZdarQN1Ei
 t7BBFBE6BsX0MzZu655r3l1k5VNRPfEoni093XRWjYqKspik/l318q1/jC97N3ucZBiNrO96DTZ
 Uvucvl2Bde5N16GieoyH7eLmNenk4HeTMwhg79l4TGcaM9Ko
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 5lyZ0zMXj-m0kS2YQlSDlEBVRRtj6bg6
X-Authority-Analysis: v=2.4 cv=GdUXnRXL c=1 sm=1 tr=0 ts=6868f841 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=F-HcN3iq_yGV61sY1bgA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 5lyZ0zMXj-m0kS2YQlSDlEBVRRtj6bg6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDA2NCBTYWx0ZWRfX44LSndcEck43
 S3Pnfx4j4Pvjd/mKYWkDhpSNNdWywQZjg6hfvHCQfEIzlL2nxK59LID35WSIhNkFidLszO1zD1l
 FQ0D++IdggXseNMxU9QIpCBtU5bX1NWI6yL3QPR5ncy0WdgyvSGccdV8Dtj/uGiONqbAEzILm1d
 g5AM8tSZFeXcH7rSf9t8n/+sf8A3pN8wWrLu/B/hWvBkQRLFIyf55G6stQDFcirRTRa6RGI+Ixp
 dzsKT45ENIQ5mY+THba9HfS7rwGEH16VH9pDnIoGbbChMSNagpQpb4Eman/BmuQjur+kzCKErF5
 2d/OI1Qje1qZfPF4fNlyr5NRb0VXrV29S99gjB+hoA/u8a1ySFWdNULa7UeTPEafpOqS9u6DETV
 EF0qHaNkx+MW+XDCKENpZQc4iDEJF3HWAVizIVK0+acwhGtC2PE7wmen6ba9HVUvtvsLRHZe
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
index e63a62664f39d73033e65adab5a90fd43c844a78..7025f521b70e501eefa69ddcdba64d38e0ca5465 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -875,12 +875,11 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
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
index 6d938abe29ee7283de2b1535d3d0159bf09d6dff..1aa7d65afbd0b4e8a231d1d4ff7a7120e8b7391e 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -297,7 +297,6 @@ static int mdp4_modeset_init_intf(struct mdp4_kms *mdp4_kms,
 static int modeset_init(struct mdp4_kms *mdp4_kms)
 {
 	struct drm_device *dev = mdp4_kms->dev;
-	struct msm_drm_private *priv = dev->dev_private;
 	struct drm_plane *plane;
 	struct drm_crtc *crtc;
 	int i, ret;
@@ -347,8 +346,6 @@ static int modeset_init(struct mdp4_kms *mdp4_kms)
 			ret = PTR_ERR(crtc);
 			goto fail;
 		}
-
-		priv->num_crtcs++;
 	}
 
 	/*
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index b6e6bd1f95eebf890a8dced129854e8e19e60c9c..4c9e79fc00e9d8ca8de294c83559e72a2e48d1d2 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -375,7 +375,6 @@ static int modeset_init_intf(struct mdp5_kms *mdp5_kms,
 static int modeset_init(struct mdp5_kms *mdp5_kms)
 {
 	struct drm_device *dev = mdp5_kms->dev;
-	struct msm_drm_private *priv = dev->dev_private;
 	unsigned int num_crtcs;
 	int i, ret, pi = 0, ci = 0;
 	struct drm_plane *primary[MAX_BASES] = { NULL };
@@ -443,7 +442,6 @@ static int modeset_init(struct mdp5_kms *mdp5_kms)
 			DRM_DEV_ERROR(dev->dev, "failed to construct crtc %d (%d)\n", i, ret);
 			goto fail;
 		}
-		priv->num_crtcs++;
 	}
 
 	/*
@@ -451,7 +449,7 @@ static int modeset_init(struct mdp5_kms *mdp5_kms)
 	 * crtcs for the encoders
 	 */
 	drm_for_each_encoder(encoder, dev)
-		encoder->possible_crtcs = (1 << priv->num_crtcs) - 1;
+		encoder->possible_crtcs = (1 << dev->mode_config.num_crtc) - 1;
 
 	return 0;
 
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 33d668a18ff3613b40341df540d504ffff65b2a7..88ce305792fd89f280b39bd92888a18abd0343e3 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -175,8 +175,6 @@ struct msm_drm_private {
 		struct mutex lock;
 	} lru;
 
-	unsigned int num_crtcs;
-
 	struct msm_drm_thread event_thread[MAX_CRTCS];
 
 	struct notifier_block vmap_notifier;
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index 9541dd7f56c9ea0f1d63c77b8ad8e7bc8cb46508..a63d014c19039835de47fb3fb610ce67652b5d2c 100644
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

