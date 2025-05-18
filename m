Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8A0ABAF74
	for <lists+freedreno@lfdr.de>; Sun, 18 May 2025 12:55:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A57F10E2B4;
	Sun, 18 May 2025 10:55:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ETZPnM02";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4612F10E2AC
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 10:55:31 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I7b3qQ023302
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 10:55:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 R6N0tvqMMnaFd6rXphyiPbtd6QUTPIJgEbiauM+ZAzk=; b=ETZPnM02ZjSAu5J2
 JEVcF4H9kQ/0c7Yi+AUdLIUokRsCDmC2DYcbXUwCQg+OYr11L6KefBQH1dnf3fL4
 BSwkQuwjpg9yXDpthOn5lGzJ5n30fFcSorYrzf8T5W6aqP4sxWFA/IyODlQ+DEzW
 3iAvnVQwMOypqDwhp95Z08saFNy9KWOlKd5XXg2NY/fuoa4rhhhUCH8TGeTT453G
 LnoRQDbhgII1x0Djlm1D1F7InYIOaAWfjVGdZ6zbJZPEj6ndVgqXPR1aGbymTJjn
 ewB38+ZBxfEoFNNWf92qtfqcS0I/fIrAMPfMZRe26hHJORYDd4UUEGT/4dbfb+e8
 CJVQAQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjmesv1t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 10:55:30 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6f8b14d49a4so28464486d6.2
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 03:55:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747565729; x=1748170529;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R6N0tvqMMnaFd6rXphyiPbtd6QUTPIJgEbiauM+ZAzk=;
 b=cRUU+RaiOfWhqrs29kHBvDwssBnOHUr33J6uOa1KHtHWhDtqIDPGGUznnwLa04uYIn
 /Q2IkTrayztBE/drRo+hnwEkpcBIIZsHGpDMp54P1ub3SHwE8bsBX1oBGbsirb5GowaI
 bBJmmWPwanu0CYuaTN76wsHMb4U1p1/achxifO+gg2H0jPn3TpeXwmkPAasAUrKa8K+Y
 c9h1SKkzbx5FevFrUIikXDjC4JtXtB9qH1clDdphgQVxdj/Lyjtw5F/gPQ0u4Atm1aqb
 YQj4wP/JW9jVwQMKIPv/Npy5i7Pyidf+PxoDclFusluACN9O+W0y6VTe/FkXDZaeP2qH
 JIkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTd9YBch+XDO0Z5s5yW3GmfeAJS8WHUUMIvMflsZZoHwKl6DUwgKEP/ScdhSipl/UNFSEI2FW8Sic=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJlLaJ4Bpl5XDMpCSIqB7VetGXflbAduJveg5c0BA0dZHu1bqo
 l28/L0adVY0vEI4TfwrbvbKNoBVPL7i4fJ/iGETEzFMvyvaw8JwGDatmqy+hrW5aCy3KUMJKvvQ
 iTkubnxb9zJTtPXi2hNpyGrdpLbVZjuHypzlRFQfEEFgUVRQa3Bufj/e6S4wNCBYoAz8MKY0=
X-Gm-Gg: ASbGncv7l5k3uz1SdnsX69tJhUh6Y/e2oId8ynRzDKjyiw6iYiDMaaCt7cXb+66W6a0
 0Wz5+kSiHiEXf7V/TQAeAZ6aldokJW7svEQtx6scHpMjXA8HeAlU4r389NYflrjpsodeTjRJqmY
 b4ClIFMCM+6LP5Ot99XT7P1ZfLEUoNC1p1LbOUuGQjtGL6cOIoyLjUsOfGu1+K27SxqXvSIl43/
 UUsmxvOlXR8Yl9GaMMcMlXVA9h+KOgDQNLhKohdE38Ze6/jc9jQcMEdpHyu5uCanYEXaCyYtSao
 aumRf6YpezmVPB3rAuKKs4470s5IMwmrdgeLEDwN8mtzNrnenAaUJzepfg2MV82+ikcbOrOjnsc
 CB6+I0aODSSkGKct/4eDxwEkE
X-Received: by 2002:a05:6214:2303:b0:6e8:ec85:8325 with SMTP id
 6a1803df08f44-6f8b094a1c1mr132319726d6.39.1747565729525; 
 Sun, 18 May 2025 03:55:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBrNgDaAWSJPUXl4Pq1ttzJ470HNM0rC+ZfMUsp3qTG5xgKN+t5e9KePjsQljKtP2aOM6tPQ==
X-Received: by 2002:a05:6214:2303:b0:6e8:ec85:8325 with SMTP id
 6a1803df08f44-6f8b094a1c1mr132319546d6.39.1747565729174; 
 Sun, 18 May 2025 03:55:29 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328085cf8ccsm14314451fa.99.2025.05.18.03.55.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 03:55:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 18 May 2025 13:55:21 +0300
Subject: [PATCH v3 03/11] drm/msm/mdp4: get rid of mdp4_crtc.id
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-msm-gpu-split-v3-3-0e91e8e77023@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3130;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=npSuxvWMmhzKLh8mAO06E84f1kOeMHWURDV7gpjmnuQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoKbyZ9AeY7obsJ4wix1fDb2P5WNV2DJztH7KUX
 3sUn48fmuSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCm8mQAKCRCLPIo+Aiko
 1YPGCACN8kXmecU+jG3vEQvTISfrFHslcPAcRaXFPhbbi4VHPcFPFd/CUJ/AH9rrZnpVoBDZy6V
 1PVdYXdiazunhHd8l+Q+3DK0QPU3kMNS7CQWosLuWXXsk+mo5dZDEZ1KEee4yOFgZhp/wah9ghu
 /pNvAk4d7lrD/lYKjbjsyIBNPDkTPHdmS84bFJmCl1Us5guAjcT0Nev6LbOl095c/43foQOEUhk
 BCkAL6TS7XGsy5N6W9lb7lQG1n/f038edX+/tL13aSCY9xS8+K2sIzLP/rdwzJb0lSlEyncAhaa
 2jjXKhtiP5QnmxP+LTFc0s5aIZLqn+wQfTqgjpyhyYUH7ely
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=RoDFLDmK c=1 sm=1 tr=0 ts=6829bca2 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=JeS6effYNUkig2QXyjUA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: AhxI0rxBfxXlf5PiYpw8Z7qRNiIG-ODW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDEwNCBTYWx0ZWRfX7sNBFHUkZltO
 UbnQDPkKeq6LiZib88+wO4hT8Obv8OWZ9XtKvyhWDr6UNhHSY4yZws3SRG++07QvO+nSRBqvh+z
 kwcpfK/nMjzXA27iadZVsU62ovH6N/UaCbkfCNZq8FSyp/scZ9DW0Wd3Qae4W8yZ7zEDzRtJbum
 uoiexNfBT3iU0rIxCk9BPcM4xprj1SUzF3X0E7so9Dw8KIeaRWwBMVNMS3q52yCYwzh7IEy/Wtz
 j0jU5iTVO3f5msci75xowm6pFSdXtR1Ea9qzqAIMo6gkjA8gTWI+WqjUt5zXbA9yOevGJ5BKXOj
 gCQ13Fw1HFEoMZvlQS/rc47GaWZfWDc9FABo7NNesCXglWcG8vN/2tk2v2XDDIPGoTQqoA8dw4T
 QWYMIF7u1OGUPWkAnwtdTobLeDjH7yiV4i4aAadjs4ssSxQqNDrWL/MOphxwZxLd8M2rpCRY
X-Proofpoint-GUID: AhxI0rxBfxXlf5PiYpw8Z7qRNiIG-ODW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=999
 phishscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
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

There is no reason to store CRTC id, it's a part of the drm_crtc. Drop
this member and use drm_crtc.name for the warning message.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c | 7 ++-----
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c  | 2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h  | 2 +-
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
index 5e1e62256c382426f70d21a5312fb40dda68d695..7596b45e234bdcf1b7cf37c4a8d39862f48819a8 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
@@ -17,7 +17,6 @@
 struct mdp4_crtc {
 	struct drm_crtc base;
 	char name[8];
-	int id;
 	int ovlp;
 	enum mdp4_dma dma;
 	bool enabled;
@@ -539,7 +538,7 @@ static void mdp4_crtc_wait_for_flush_done(struct drm_crtc *crtc)
 			mdp4_crtc->flushed_mask),
 		msecs_to_jiffies(50));
 	if (ret <= 0)
-		dev_warn(dev->dev, "vblank time out, crtc=%d\n", mdp4_crtc->id);
+		dev_warn(dev->dev, "vblank time out, crtc=%s\n", mdp4_crtc->base.name);
 
 	mdp4_crtc->flushed_mask = 0;
 
@@ -624,7 +623,7 @@ static void mdp4_crtc_flip_cleanup(struct drm_device *dev, void *ptr)
 
 /* initialize crtc */
 struct drm_crtc *mdp4_crtc_init(struct drm_device *dev,
-		struct drm_plane *plane, int id, int ovlp_id,
+		struct drm_plane *plane, int ovlp_id,
 		enum mdp4_dma dma_id)
 {
 	struct drm_crtc *crtc = NULL;
@@ -639,8 +638,6 @@ struct drm_crtc *mdp4_crtc_init(struct drm_device *dev,
 
 	crtc = &mdp4_crtc->base;
 
-	mdp4_crtc->id = id;
-
 	mdp4_crtc->ovlp = ovlp_id;
 	mdp4_crtc->dma = dma_id;
 
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 7e942c1337b3597d557abd3e2e418c3958e5eb3f..00920bd44f6f73099ff2c293473e427caa49b873 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -338,7 +338,7 @@ static int modeset_init(struct mdp4_kms *mdp4_kms)
 			goto fail;
 		}
 
-		crtc  = mdp4_crtc_init(dev, plane, priv->num_crtcs, i,
+		crtc  = mdp4_crtc_init(dev, plane, i,
 				mdp4_crtcs[i]);
 		if (IS_ERR(crtc)) {
 			DRM_DEV_ERROR(dev->dev, "failed to construct crtc for %s\n",
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
index f9d988076337cb6fb63af8e76be59b2eb34ab327..fb348583dc84de5c57c77fdf246894e9334af514 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
@@ -185,7 +185,7 @@ void mdp4_crtc_set_config(struct drm_crtc *crtc, uint32_t config);
 void mdp4_crtc_set_intf(struct drm_crtc *crtc, enum mdp4_intf intf, int mixer);
 void mdp4_crtc_wait_for_commit_done(struct drm_crtc *crtc);
 struct drm_crtc *mdp4_crtc_init(struct drm_device *dev,
-		struct drm_plane *plane, int id, int ovlp_id,
+		struct drm_plane *plane, int ovlp_id,
 		enum mdp4_dma dma_id);
 
 long mdp4_dtv_round_pixclk(struct drm_encoder *encoder, unsigned long rate);

-- 
2.39.5

