Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F060BAFA497
	for <lists+freedreno@lfdr.de>; Sun,  6 Jul 2025 12:50:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD7E310E392;
	Sun,  6 Jul 2025 10:50:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fHKp6e+E";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1892410E395
 for <freedreno@lists.freedesktop.org>; Sun,  6 Jul 2025 10:50:53 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5668QxmY011820
 for <freedreno@lists.freedesktop.org>; Sun, 6 Jul 2025 10:50:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8nwUz2+wfrG4Z9KqAAvjHu9al6EBZNSbjiTXJPQqpbE=; b=fHKp6e+E5wKL979D
 UnR1gN6ha9yFki6avKH/Fsri4APqx5kmjffLbIKqaSvrmfwanadRDoBT/Dt04oRq
 oMb6VxACsRFOktD2jkvuhypBnIJDDdohgkRBZ+aVx1C/XNZqg5Kk/cwaY+LmvxFI
 IwhpvbW0QpNqyl69fdMMeI1d+NxstMa8HstENuZo7CZkNVgYkVDmuSY9NZQSJHTY
 sYvjUhM1ylooZMp9AxAYU59qFI7k9oXduZTox3UVPLYC77yznQpJXnZCVlHFmvjE
 Xe52J4UPbyMmDgGoqHZPer9ZNQhqvJ/I+g2Ayh9AAatPB6NuconL3cE6fY63t0E1
 WzLm3g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu2akqtg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 06 Jul 2025 10:50:52 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4a6f89098cfso44129471cf.0
 for <freedreno@lists.freedesktop.org>; Sun, 06 Jul 2025 03:50:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751799052; x=1752403852;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8nwUz2+wfrG4Z9KqAAvjHu9al6EBZNSbjiTXJPQqpbE=;
 b=DzH0h7auYwhWwuv79aLrOuy+MfWk4XHw5fZzAmUyd33OrjjHgJxRfQ/QqFlv2g2JQK
 2NGgX7IIUWx8HdQfQX48Yj2CMw/nVjwR5tLErEb8luFV4YVhI1Ro6lfUiP+F8abE/urp
 xzsvNILJzyxq+2qr4X7GTT/0mPRjMPYotqunZ2+c36N2PsvgF75Y9w/QcQVQMicmdXyp
 BhCJg4rHqBc8aiNScfdG4a2gJi2y04uopsFglqKystu/wAheOn4qlCLtY6TgDNKEghu1
 I2jqXDvB3s1GWThH4VOPr6gEF8jvQVRy5+Xk4IBkEqjWiyghvIhQ1t1lnvVjZFThQt/7
 5f+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNuALd4lqIv2U2L+H7EvKCFoLTq2rQ5lLvaREQTfbQP1IpO4k5JuMlltujaDzCmaVMwATxSA4WbwQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzL+XW0Wv8VATr8GXyuIvWyNoDUaOm56NsS7fDg5rvyX3JvMPLm
 9nP2NxaIyn7DUm0wl3JGNVYlm8BmPVf2PUoMvPCLEqfWRmSpQnrkccPZoxbKShKA2+fNyCNysbQ
 w7VNT9Jn3BXlvIvMRsXpqn53BvtSATGVXWefwOCTK2V/RL9PgsQzCyw0z7exKxuhiUCfZAno=
X-Gm-Gg: ASbGncsC6gGiiONbsYAuW/85GcihbTrF0su2V/7eERprmVGrPHfjaUc6nAVjOYuIhA7
 aYPI1NFfz/oL6Ob3ZJvvU9czj6QNoqeR9J2Ox6EoHF3TBV6+Q8F2EZa3H1NT3HeKFy59n0/iTng
 uUKsIhRetyz2GSQKaLaujh+6o9/aYdOyENsQzDzau/K2RMwa9fakVjKVJykOlUPB8FdXzgDMkFg
 V1zBLXC97E3zpiPXReg61g8/ubipR4ZYfE4qBvbS5RTCB4iFtQSwOU9x4KhOajRx5n9v01pVT4u
 8DrIKPBuQ0kjZidOXHIrteK95EgNT96qe8O12ZXSlSP0yksMrTUZ/Fi+LMOQoiTokIiEhEihl8f
 hqsM=
X-Received: by 2002:a05:620a:4396:b0:7d5:d018:1bf6 with SMTP id
 af79cd13be357-7d5df119e79mr1104797185a.14.1751799049933; 
 Sun, 06 Jul 2025 03:50:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnbXcyMALNSAIMrbcV1bErIvj9gLgHlW+lpPLzxeJcvFUcUsGsOmoX7j1K8yEeXnyxMSvpeQ==
X-Received: by 2002:a05:620a:4396:b0:7d5:d018:1bf6 with SMTP id
 af79cd13be357-7d5df119e79mr1104795385a.14.1751799049538; 
 Sun, 06 Jul 2025 03:50:49 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-556383bb555sm920621e87.20.2025.07.06.03.50.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Jul 2025 03:50:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 06 Jul 2025 13:50:38 +0300
Subject: [PATCH 3/3] drm/msm/mdp4: use msm_kms_init_vm() instead of
 duplicating it
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250706-msm-no-iommu-v1-3-9e8274b30c33@oss.qualcomm.com>
References: <20250706-msm-no-iommu-v1-0-9e8274b30c33@oss.qualcomm.com>
In-Reply-To: <20250706-msm-no-iommu-v1-0-9e8274b30c33@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2046;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=EUOM9GC2j9wX5WPerbms/C/z2nxGawxsehEkeu7mMVA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoalUC3CxjmG2qO1jRWXx5gPkOE/BU/KfOLjFAd
 21zJFA0vaaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGpVAgAKCRCLPIo+Aiko
 1bLnB/9zMeuT+8VKzUaMNF0llrx3m3vtO2VrQ+Z5tjOtNMvw7pklBRfaSZrOrQEXcY8eVpcTjkZ
 byftNEf0tObHUHcrk2nwEsjJ5+F3HmLK9Iu2uR0cPW7nbMm4Pzu3foT+1K83LKrNYBvj4kWnMI7
 rkyeAiI7yqTKGAPFvV7Wp9JfzNqLUFxs1FL9FoZG6qaYtfxuWbyAlDYr0pK6ZkejjH8nb9JhLqI
 cBOweeTjQaTa2ltWjkv+vKbJxvLiHo2Ta49zkUdZ4EA3OBtbrDnVZgXc8aw1ISv1M5h0gQeczmZ
 /0NvYh4t+H2gxp1SabuYOj+1Hzfoqm0JF6ysG3FDegD10Kd8
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDA2NyBTYWx0ZWRfX3L0eYSkBNgG5
 ktrMKk4YCbSAfkA8CkyNwnMfcyhiOsnAF3xsHETnwykANJ9KRpXXOY257FwtADk84F8PPpRIzBe
 ajt9jTaXn6SiqTp52wQyDM3gSO8xqlGIxY2lwHINv9lyZV8oL/zuDS9V4UAehhHkrNp5U9hndAv
 AN4xlvD6SfhmrcsBS6MijlyxuDSwZd+C//HEaDVPTw9job2W5bfwdrXiFK0TTmyvWMtC1mpbwL7
 r8wqJ3ZPhUx2PZ2cz5Z65PVwNwuv5FHNdE+gc70MU/zOd8WNUUyssGEh0gnL2PBn5hjzZR2ABM+
 cJ2u/61cSQVHxEDZhhtqg7njw4IxMDj0rxtmjcEar6XlRBPL+Fe9UBYnycR7Z35yEhir6hI+bsw
 VMsdXHUQ/TeODNdtxjlutVWeQ9ZfnU33ABE+tJTKf5tfVDk11DMJDUXfbBBMcWFqiltdXBqU
X-Proofpoint-ORIG-GUID: KTUgEjWXfw2YvejjAJAFvIq60ByZIIVG
X-Proofpoint-GUID: KTUgEjWXfw2YvejjAJAFvIq60ByZIIVG
X-Authority-Analysis: v=2.4 cv=erTfzppX c=1 sm=1 tr=0 ts=686a550c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=OZ-Rx8C-MikYIJhCyHkA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507060067
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
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 27 +++++----------------------
 1 file changed, 5 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 88296c41d1a5eb0e16cb6ec4d0475000b6318c4e..41d236d30e71ebb6ac8a59052529f36fadf15cd7 100644
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
@@ -458,29 +456,14 @@ static int mdp4_kms_init(struct drm_device *dev)
 	mdp4_disable(mdp4_kms);
 	mdelay(16);
 
-	mmu = msm_iommu_new(&pdev->dev, 0);
-	if (IS_ERR(mmu)) {
-		ret = PTR_ERR(mmu);
+	vm = msm_kms_init_vm(mdp4_kms->dev);
+	if (IS_ERR(vm)) {
+		ret = PTR_ERR(vm);
 		goto fail;
-	} else if (!mmu) {
-		DRM_DEV_INFO(dev->dev, "no IOMMU configuration is no longer supported\n");
-		ret = -ENODEV;
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
 	}
 
+	kms->vm = vm;
+
 	ret = modeset_init(mdp4_kms);
 	if (ret) {
 		DRM_DEV_ERROR(dev->dev, "modeset_init failed: %d\n", ret);

-- 
2.39.5

