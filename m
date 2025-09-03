Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EC5B41C3E
	for <lists+freedreno@lfdr.de>; Wed,  3 Sep 2025 12:52:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6650210E765;
	Wed,  3 Sep 2025 10:52:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="e6U74QPb";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CB9510E765
 for <freedreno@lists.freedesktop.org>; Wed,  3 Sep 2025 10:52:04 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583AUEEL012191
 for <freedreno@lists.freedesktop.org>; Wed, 3 Sep 2025 10:52:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 OwmE1FNHyvfTAhAmN4j1rp824OtCLZj2GOAqHhiwg4A=; b=e6U74QPb/N7zGnP6
 s+sxCMTohZzHnMvhKBWCdKwxmvW/SDpeKZGnK4VO5JfFiIfQa2YleN9/hqDoPtLl
 0B5SsETXDzYGzN+nSMmC53mJWDK9AEh7a6PCezm6mNT+ix3zDu5NFRROVuYEBsTY
 0DO2KD7bsPiLae0KI7Kq02d+Hnxn41JX5BZUJ+dCVaW9JTI4MO3duHeD3k3FADnY
 JkoMZ7/uiI9aYBApmN8aG9N32PUuLx7W2Y2/xX0sw4JQ5z2x/Sq/yCk75TvSQFXv
 Tv+Bvh9MlvzzLdqYt9JFuK5Ek7UtX0zXywJG/xz1TvRaKa/z1DsmLNO/B1SWBqvn
 CMlyBQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2fk85h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 10:52:03 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-720408622c3so28389246d6.0
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 03:52:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756896721; x=1757501521;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OwmE1FNHyvfTAhAmN4j1rp824OtCLZj2GOAqHhiwg4A=;
 b=PRgx5aGGMRciGFzS2GHdlKm/6OGSuH/8gaFesIwyJwxhcqDi2LbEPH+yDwEQ8YRvyj
 JFVxmD3wVcrHyl4MH+Cg4gJR8fTHuKEpZK+FE3+U4+n4fG9Ql93Wt9klEaj8n54BLdCR
 WInBZwvR2kNjaEtzDTocedXi8gzHOvtPoTMvB9Rai2QTf0vS+FPiCc3ss8bgq4IPidKw
 Ysqja4jOC/Ri+EIc18TPOIryNVsd96SBcuOxnFs5LwBdcsG74mSbts9ajYhHkEY4XUjs
 DQ6cj6hKYFatF/D8+eEiD9UG7hGIARv3CKcR+dzTg2l7igyYDkkQTsdcXDeVISonsARB
 rB/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUp+KFMZlLLqAm1/40iOtVrXEKn/mnhr+NPeJs6QnbDbRdQnqTpnSSnMieKyOGmXlHisk1LB1kCSJM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxB/ydCpsQP9d8oADRk/FyxRp/QOZ7KP8IIneJygovXTm0MP4r7
 PoPGvG9JLJA+6DUgNGyVXwGHWWQfOIV3/mDMt7clxUr87yefmEwQuT+p0sgcYMTXl6oMuUeTdWZ
 E3jW3TDotm/09uT15b2GkNPH8g1RhqznZoB9tNd/uoG6w9oUr5WI2+Gk2tqBnWy98oGde0t4=
X-Gm-Gg: ASbGncvXd7hHs1vsKU3dwpeq7SKln3qz2D3VF3Ojgwpdx9YopvP9RPqjk1V5JpwLlJ4
 fcgtGOwIBUgYlEqraO+yfsbfSl9c6wphJUvuF32wMoPpVH+33kBlkKEIhVQTNahwJBfJA1B9Cap
 UN0z/x0p/bFndwRUDkL80SAHC85X2LGRYB3kCijOLjVLpqEzGvF/6X/wFuxMUslP8Puj36D+2lp
 sI/4DoDlXWgOIULb1ng7E4wl+C0KNYs5Ovz2bfmSxyjzvIc1VEjzmtNvC8uoYZ7Vy2s+Dpf9dnV
 MQtpw/L20aPH3uYOcfroOZLY55v55MrBpUzMU1fo3n1L7ajFaPwBrbcfbOrMHYh6Xn2Akwe0+bo
 DLjnHeUj6MocRd2LlThYcBzndU4wniey3IecYQa4JfiAy1NWS1JFf
X-Received: by 2002:a05:6214:1245:b0:704:f7d8:7030 with SMTP id
 6a1803df08f44-70fac8e562fmr189976766d6.50.1756896720632; 
 Wed, 03 Sep 2025 03:52:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFz3YLnuQheLnctM3oOo4lxrx9NLlPPW3v2YzHyl9FZ5QeuhI/S48AL9YBg7OeJCK0FwoFezQ==
X-Received: by 2002:a05:6214:1245:b0:704:f7d8:7030 with SMTP id
 6a1803df08f44-70fac8e562fmr189976356d6.50.1756896720171; 
 Wed, 03 Sep 2025 03:52:00 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f5032df6sm9373431fa.39.2025.09.03.03.51.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 03:51:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 03 Sep 2025 13:51:52 +0300
Subject: [PATCH v2 4/4] drm/msm/mdp4: use msm_kms_init_vm() instead of
 duplicating it
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-msm-no-iommu-v2-4-993016250104@oss.qualcomm.com>
References: <20250903-msm-no-iommu-v2-0-993016250104@oss.qualcomm.com>
In-Reply-To: <20250903-msm-no-iommu-v2-0-993016250104@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5112;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=AgKTuTphksgFdjbRBscbGOKdDdsPzucjkQBsXfU1L0U=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBouB3Hyns3bJmUAeJWzCRLgAN6ruv2VcZVu6b1W
 St6rwyfI9mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLgdxwAKCRCLPIo+Aiko
 1ZmICACBatdifNHq+RNnmtvLJqxuWiOBZ0gmol+G/G31x1B9tK7hwPbFI/ZneQuj9aQuFtTQt68
 r+Is4bOuwuS53H25Zj9SIWKWFbUgwvg23l117x+Se9C8FYpg/Vi8y9aYRzMYNfrHamGQcqxH8Qp
 XMyRMpe2S9c+V1fRmxXb/4wlAceycYENzRnheqQu8mqxmDPDxA5Y85trDxynmALGTXpvoAOtSRf
 GCPGbkOUUM4fDSbNtVJW1sH21f5S1BELVF4oVChcnBrV1etTzBO82HkD5YpzdmNrOC3WDe6akkH
 wp6m+DF960c+UGTRu5NK+u5kbu09PuQjrEtaBqJPKMBNoGPU
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfXyn+ESOttv4IT
 yGOkvzMxf0qo51TdK0cHTHq9IXasMN2khPZ0vacHXxx8/Dn3QSrmALDai9P/C36F9opeMxeAJtF
 HZVU7y03r2+GMO/4M4Z7LWuZFD0qzzw//Yfz8/pnMNweNQMAstJpZ6JBq0I+6e9VkBvVCN2APu4
 8SiXmcKNy6jkPMIj5g6WALymyxb4N/Vr9b/f4j3TEBsFBPos9BmttGsigHrVzzGzJ2Wd6nuth4J
 xpVACsuH69rdK6Q4YAyl8AGlBvxwSQwtbXkAr0xZaaXINcTtR/837Kvt3sCOpeCnSvj3EMV2vlw
 7TwsMlRsNJ14BWfrqrsd3wDu2W2xXGWtumTGV1vVjzgqEV2spj0uvT5R++mqeZUTjxJcqDXF0ED
 /Y7H9dQe
X-Proofpoint-ORIG-GUID: i8YJMAl8fh6gUNGCwcTEaJf5lEqpP711
X-Proofpoint-GUID: i8YJMAl8fh6gUNGCwcTEaJf5lEqpP711
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68b81dd3 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=gwGsY3v9svKR4hS8clgA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300038
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

Use the msm_kms_init_vm() function to allocate memory manager instead of
hand-coding a copy of it. Although MDP4 platforms don't have MDSS
device, it's still safe to use the function as all MDP4 devices have
IOMMU and the parent of the MDP4 is the root SoC device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 27 ++++-----------------------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  2 +-
 drivers/gpu/drm/msm/msm_drv.h            |  2 +-
 drivers/gpu/drm/msm/msm_kms.c            |  5 ++---
 5 files changed, 9 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index a306077647c317af9345eeff13082230906b5767..4e5a8ecd31f7570beb45fd1629a131e70aaefea8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1110,7 +1110,7 @@ static int _dpu_kms_mmu_init(struct dpu_kms *dpu_kms)
 {
 	struct drm_gpuvm *vm;
 
-	vm = msm_kms_init_vm(dpu_kms->dev);
+	vm = msm_kms_init_vm(dpu_kms->dev, dpu_kms->dev->dev->parent);
 	if (IS_ERR(vm))
 		return PTR_ERR(vm);
 
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 66bfa96965be275270751cba770521cfde2a7004..1d2a1e4f6ce7d02516b9497a494bb1e46297f55a 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -391,11 +391,9 @@ static void read_mdp_hw_revision(struct mdp4_kms *mdp4_kms,
 
 static int mdp4_kms_init(struct drm_device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev->dev);
 	struct msm_drm_private *priv = dev->dev_private;
 	struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(priv->kms));
 	struct msm_kms *kms = NULL;
-	struct msm_mmu *mmu;
 	struct drm_gpuvm *vm;
 	int ret;
 	u32 major, minor;
@@ -458,30 +456,13 @@ static int mdp4_kms_init(struct drm_device *dev)
 	mdp4_disable(mdp4_kms);
 	mdelay(16);
 
-	if (!device_iommu_mapped(&pdev->dev)) {
-		DRM_DEV_INFO(dev->dev, "no IOMMU, bailing out\n");
-		ret = -ENODEV;
+	vm = msm_kms_init_vm(mdp4_kms->dev, NULL);
+	if (IS_ERR(vm)) {
+		ret = PTR_ERR(vm);
 		goto fail;
 	}
 
-	mmu = msm_iommu_new(&pdev->dev, 0);
-	if (IS_ERR(mmu)) {
-		ret = PTR_ERR(mmu);
-		goto fail;
-	} else {
-		vm  = msm_gem_vm_create(dev, mmu, "mdp4",
-					0x1000, 0x100000000 - 0x1000,
-					true);
-
-		if (IS_ERR(vm)) {
-			if (!IS_ERR(mmu))
-				mmu->funcs->destroy(mmu);
-			ret = PTR_ERR(vm);
-			goto fail;
-		}
-
-		kms->vm = vm;
-	}
+	kms->vm = vm;
 
 	ret = modeset_init(mdp4_kms);
 	if (ret) {
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 5b6ca8dd929e1870b7228af93da03886524f5f20..61edf6864092664afe474cc8d1fd097ca495ebb8 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -534,7 +534,7 @@ static int mdp5_kms_init(struct drm_device *dev)
 	}
 	mdelay(16);
 
-	vm = msm_kms_init_vm(mdp5_kms->dev);
+	vm = msm_kms_init_vm(mdp5_kms->dev, pdev->dev.parent);
 	if (IS_ERR(vm)) {
 		ret = PTR_ERR(vm);
 		goto fail;
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 9875ca62e9adb12dca9bcc74e2825b0364372a54..f4c20dc91cc600d8ab72bce002cbe6b9fdf9a720 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -229,7 +229,7 @@ void msm_crtc_disable_vblank(struct drm_crtc *crtc);
 int msm_register_mmu(struct drm_device *dev, struct msm_mmu *mmu);
 void msm_unregister_mmu(struct drm_device *dev, struct msm_mmu *mmu);
 
-struct drm_gpuvm *msm_kms_init_vm(struct drm_device *dev);
+struct drm_gpuvm *msm_kms_init_vm(struct drm_device *dev, struct device *mdss_dev);
 bool msm_use_mmu(struct drm_device *dev);
 
 int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index 725367157d90e45854cb8a22ea25a3fa3bb218be..6e5e94f5c9a7474d014e73b0b7bd06a94939ed1e 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -177,12 +177,11 @@ static int msm_kms_fault_handler(void *arg, unsigned long iova, int flags, void
 	return -ENOSYS;
 }
 
-struct drm_gpuvm *msm_kms_init_vm(struct drm_device *dev)
+struct drm_gpuvm *msm_kms_init_vm(struct drm_device *dev, struct device *mdss_dev)
 {
 	struct drm_gpuvm *vm;
 	struct msm_mmu *mmu;
 	struct device *mdp_dev = dev->dev;
-	struct device *mdss_dev = mdp_dev->parent;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_kms *kms = priv->kms;
 	struct device *iommu_dev;
@@ -193,7 +192,7 @@ struct drm_gpuvm *msm_kms_init_vm(struct drm_device *dev)
 	 */
 	if (device_iommu_mapped(mdp_dev))
 		iommu_dev = mdp_dev;
-	else if (device_iommu_mapped(mdss_dev))
+	else if (mdss_dev && device_iommu_mapped(mdss_dev))
 		iommu_dev = mdss_dev;
 	else {
 		drm_info(dev, "no IOMMU, bailing out\n");

-- 
2.47.2

