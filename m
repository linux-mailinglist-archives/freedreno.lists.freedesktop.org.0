Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C1DABAF73
	for <lists+freedreno@lfdr.de>; Sun, 18 May 2025 12:55:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A32E910E2A2;
	Sun, 18 May 2025 10:55:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nahe8YxR";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D23B510E29C
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 10:55:29 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I803Sm007090
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 10:55:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2XRxC+rcd4lvez8neQ9jCV1W0aJMb78tI+WpAHrRAYk=; b=nahe8YxRHW5xg9PY
 dXbIVB/TrD8zdCizJb8GHcupO550BKaGOv8QR3LQzTXbmj5omcdhp4FHBySECvkF
 lzkFQIK3B1YnxBW2v0kuFheHrpmH4/3G0OtTNl6+8LVxnuA2VB7uxifRjEJ/EUPn
 m9XuvYzU2O5XCfwArnxbCodmFsbBnuCkSxUq/EOhOrcmlWTUg1aFTx4h8adrBLZX
 JZycjE7CamaZurPG2gGMsdyociQjb77zX3LArgiQyvzgo7BxjeDizFkos4IWJBAs
 ZdnpDz6AfmYf9wwdaybR+FX413ik3Z5ye+s21yQ7esJjFq2ptA0EKVgBbHMZLS92
 /gDnXw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjnyhvr6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 10:55:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4766afee192so105689481cf.0
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 03:55:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747565728; x=1748170528;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2XRxC+rcd4lvez8neQ9jCV1W0aJMb78tI+WpAHrRAYk=;
 b=TU4zoCgXBA8mfiL1FqXAGi6K4Wsi0pbrCF7hHwQOLoGr6U5eUW4FA68Cw4N8pf7xgu
 eVg337gSBR2zYhzomas7SrDPE5zI99kTjMT9H0hIFHF5bNvfSkY46FNK09oFoQOed7ko
 b1OJs86H7k3KqS3jjM2fOvZt2F5PlWEC5ev/eGVMOXjAiTNw3mkbYLzCw8QkTqp74LiJ
 6OqAXRPsk4DD499G7SxYUkNpgydaQ4wlmkmFZ8kfogGZ1aRIexzQtgV7WMnHU7yquos5
 1Cg0EqLhiD0r3bttWwFY1TdHYoLA6XjIZ336e6xl/Mhha+JsPuaZcvQ+n6J2hqTl0q48
 ny7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtvljEdc0+xRG+ovQBjBE2P9s/HHofYR7/+Ovva2iWbU7UAtTzIlSCe988Y0txbl3VTSY6mqjzd0s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyVntZEuOqpU4g/dYV9nda9B9xmMBf/RDwG4PIi3uXaX9Jo33/o
 URl+anl+6DBGt2WmhJyQGiEw18/FQg/KLerWG3Y9b1fqL73mShn2Y1KFF5VsEnWaWULMpk0DWHp
 dz2+hPORwPkF3G0A1zvak+xrinJVkD23c4etMBYc1T2bUPVe1WrY2km4AnxKJGVkntrB+QlE=
X-Gm-Gg: ASbGncuUacNbMTbPaDwMmiC7KfYc9Z/fr5pduvHTKstwPwNcTa6MN/8FoBZXQ57oCA/
 MZZxQSLqiXNQlrufERunlRYmvGCHnnZlXjZ5eFrfSVTnUifO6JOw9YEP5ZiArirjdcpzDNocjZ/
 4QCQjlc4+3VPxgoKaXjVFK4qtJIVjgVpRIu6hh2UESxVnX7kBBHIZVlPJZ7UdnVWGg1XBd9QEL4
 1u2wMs27j+piF6H7Wg9KlX4jOWXzeBnD0SY/EL4+4o6ka46UH6FKjzypIBRugEjgLc3KzRuPFZq
 WZVrhL8HV6y1OgVJWO8Q4ZB3o9Ardo1NUCD4MzhjSdgLPM9zzr8zm+S5bjH8IC5D9gMgOTjZC/u
 pXd136wtl42fIhAwR1qswhIK3
X-Received: by 2002:a05:6214:260e:b0:6e8:f470:2b11 with SMTP id
 6a1803df08f44-6f8b2c95b78mr153800146d6.23.1747565728045; 
 Sun, 18 May 2025 03:55:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfwzLMkmBkdbwjFViOIMLrKHJUrUiuLpJ8M0qtJYTrZeZHRoKtHam4c0qJtlboNh/7FpPSgA==
X-Received: by 2002:a05:6214:260e:b0:6e8:f470:2b11 with SMTP id
 6a1803df08f44-6f8b2c95b78mr153799976d6.23.1747565727641; 
 Sun, 18 May 2025 03:55:27 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328085cf8ccsm14314451fa.99.2025.05.18.03.55.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 03:55:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 18 May 2025 13:55:20 +0300
Subject: [PATCH v3 02/11] drm/msm: move helper calls to msm_kms.c
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-msm-gpu-split-v3-2-0e91e8e77023@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3518;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=AdrdjdzHPQQcBxZ5qmg59kaGK1b5+B2F6XfHvaKYS9k=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoKbyZDa8XSHH8mycqheTvtaIQ9DTALExlx1ErQ
 VrWxLqtNBOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCm8mQAKCRCLPIo+Aiko
 1bufB/9xNZEFnQ3iUAr5/qfQECmudD+538OkFFnwxzChSUqhOVDUvBNMhKH9eMIKYqXiLTyXbnr
 NXQh5FdSYae51nMVEfLiy/HVdJJ9kUtpxF3iB2aV3dhMYiGvIppuxe3QrXX77Cd+d2ovZNCtf6E
 O9qjdbopuZWbMr/1dE2f7aNOJPsTb6Ofl6L6pNnLTRIiHSQ9mpVLM5q9qumb21edQiWxtqKlWwc
 C/TuIQ5Uk1moxvvnCTasRV44BeM5UGg4oIz+NJHjU6iUTSKi0pKXvp/sw9SS9AHQ+owMLqmNsOa
 spGY/zt8ns9QKuPTUuDuYflG4mXrcFZgMMKdfreD94+z+NXL
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDEwNCBTYWx0ZWRfXy6IndEca2p0s
 BVtc2z+y5ldrnxNP7Eu/Jf+InVyQfiR8j25CosGewFJOn1fvNJK3f1LCOK2U/FXHA7lq3BtNGDE
 Mmt31ENVtvWCqTe7bVcBn+r7iKc8lvJqm7wa2p9UQt/2DW1M/GK6t+JSpXfvkJ3ptNKQKvDFVij
 2xA7qsSXiiFIzHZin3MoKcz1qxvV/i2IO0uOvwKmhHGEAlhelQpF+CgZbWIg1GLGwWAWMkCjuJv
 9MfcIu3BTGfObgKWrOFs/9QeHQuOKmERpRvi3npt7oAezmJ2Dw5RlGzWKiWIFCKp+fJLykjGhFJ
 pAO+pFQiEvirAv7GABFHLLTfRj+uuDAd9lyrn+zUCBBy0Nq9ioOqe5bR1FTazMdEuj+WG/TpwU6
 coIE753y3xok+H6rxZAvvZMcrEolCU7GkQ+XfVbXRVh1B5Fz0qODPLuH3oiyrmINhjozjlWh
X-Authority-Analysis: v=2.4 cv=Z9XsHGRA c=1 sm=1 tr=0 ts=6829bca0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=5yuRF9vT8A_X6ws8YtoA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 5cyYLQat7R42zlt3ew4a7n3WzHTPpJcb
X-Proofpoint-ORIG-GUID: 5cyYLQat7R42zlt3ew4a7n3WzHTPpJcb
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

Extract two more KMS-related codepieces to msm_kms.c, removing last
pieces of KMS code from msm_drv.c.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c |  9 +++------
 drivers/gpu/drm/msm/msm_kms.c | 20 ++++++++++++++++++++
 drivers/gpu/drm/msm/msm_kms.h |  2 ++
 3 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 78cea9d4999488648b4131a2da425fb349d1b664..2c6997c85fbbc3767315ca3a166a99b322f1218a 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -11,7 +11,6 @@
 #include <linux/of_address.h>
 #include <linux/uaccess.h>
 
-#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_ioctl.h>
@@ -79,7 +78,7 @@ static int msm_drm_uninit(struct device *dev)
 	if (ddev->registered) {
 		drm_dev_unregister(ddev);
 		if (priv->kms)
-			drm_atomic_helper_shutdown(ddev);
+			msm_drm_kms_unregister(dev);
 	}
 
 	msm_gem_shrinker_cleanup(ddev);
@@ -275,10 +274,8 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	if (ret)
 		goto err_msm_uninit;
 
-	if (priv->kms_init) {
-		drm_kms_helper_poll_init(ddev);
-		drm_client_setup(ddev, NULL);
-	}
+	if (priv->kms_init)
+		msm_drm_kms_post_init(dev);
 
 	return 0;
 
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index 184a4503fef0deff7234a3ce332e0bf564fbce46..49a56873100b2fdcded3eb6adcc7032bf404212c 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -13,6 +13,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_mode_config.h>
 #include <drm/drm_vblank.h>
+#include <drm/clients/drm_client_setup.h>
 
 #include "disp/msm_disp_snapshot.h"
 #include "msm_drv.h"
@@ -217,6 +218,15 @@ struct msm_gem_address_space *msm_kms_init_aspace(struct drm_device *dev)
 	return aspace;
 }
 
+void msm_drm_kms_unregister(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct msm_drm_private *priv = platform_get_drvdata(pdev);
+	struct drm_device *ddev = priv->dev;
+
+	drm_atomic_helper_shutdown(ddev);
+}
+
 void msm_drm_kms_uninit(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
@@ -366,3 +376,13 @@ void msm_kms_shutdown(struct platform_device *pdev)
 	if (drm && drm->registered && priv->kms)
 		drm_atomic_helper_shutdown(drm);
 }
+
+void msm_drm_kms_post_init(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct msm_drm_private *priv = platform_get_drvdata(pdev);
+	struct drm_device *ddev = priv->dev;
+
+	drm_kms_helper_poll_init(ddev);
+	drm_client_setup(ddev, NULL);
+}
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index e52649bbee7dc6a80abfecf7f8d5bcfad3d8f60b..26cbb662e7533fdfd55fb7f200b99c79c3fd3211 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -200,6 +200,8 @@ static inline void msm_kms_destroy(struct msm_kms *kms)
 		for_each_if (drm_crtc_mask(crtc) & (crtc_mask))
 
 int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv);
+void msm_drm_kms_post_init(struct device *dev);
+void msm_drm_kms_unregister(struct device *dev);
 void msm_drm_kms_uninit(struct device *dev);
 
 #endif /* __MSM_KMS_H__ */

-- 
2.39.5

