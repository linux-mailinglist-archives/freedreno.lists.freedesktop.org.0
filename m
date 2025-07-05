Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C51DAF9F96
	for <lists+freedreno@lfdr.de>; Sat,  5 Jul 2025 12:02:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A0F910E385;
	Sat,  5 Jul 2025 10:02:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Thb20Ejc";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B281310E224
 for <freedreno@lists.freedesktop.org>; Sat,  5 Jul 2025 10:02:51 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5654eM0d025059
 for <freedreno@lists.freedesktop.org>; Sat, 5 Jul 2025 10:02:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xpieUQjCAob3oLlQXRGz5T12XycG9BXDdnTujA4EfOc=; b=Thb20EjcqqbYijoU
 P7qSSBdTEV2xrIRciJFW+ZcBnnpUQGZQmEKF4UZlHQdXMgbNzwuZ8zKg40rP+Axg
 OhkxXpaQ32hY3y4u1eyzX4nKyd1ezZ4AEkE586aIkcxRUizrMWCPA9HXX7WOIMNQ
 fd3TNH/zmQThfr0bTWsuIaep7EN55z+G4TmcpR7l94QwSjfQf+6sDYJrAuqMeMjT
 3/7gVQo+WfIPgPag65vWDwJ6i0HVJd4oBQsbpw7F2VsiYgzGXLeNE+gr+ciil7oN
 AzE31iK9L4apHv/DMtz9taf+sRYbUJu0zDbbmEZEQ/mfjv3hVZ5t0LfyR6yYOCit
 qM1xzQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pw7q0fyv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 05 Jul 2025 10:02:51 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4a441a769c7so30795161cf.3
 for <freedreno@lists.freedesktop.org>; Sat, 05 Jul 2025 03:02:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751709769; x=1752314569;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xpieUQjCAob3oLlQXRGz5T12XycG9BXDdnTujA4EfOc=;
 b=VCReV6orLbrrXCurn1FF13G9z8n7WUd+qQFUtb/uygZg25st8Ra2wxk8LnZXDjaPv4
 BHnRqWhoxNBSXgUxwS1MykbTREeLq7ZkrTQ4FFdFrl2zOxAN+340PmnkgykVQbqNJApi
 BS8f11Z0ztTmepKNRX1uPxmNCgiMI5w7b7mMpW3eEv9g8fHmv7Kga5xor1sLgyo7tcrY
 06EoULZfYnJatgUGxxCkiCCzr6PQWFDFo73Ni/bzpjAN4Ccou92SRroAVW5sjCIxMU5k
 RfNpWKgvzpYHpkzkdHuIVwDLz3RQXN7Y6YUkpxIx4ENiTk9EqjoZu7gYx2sdNXKEwLma
 EZsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiLrL7wg0LE01NRBv1Gli77Yge1ldJVvI0uDlaMSMwmhieNkg/gMPeGn2K/4X0NM4UVylEOKPLis8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy91y6mhodm1oVg1uTViu6XYzkF6JbxoaSjNDBSLFzKfTi3+Mlt
 TrV9HGhyAoOdEMHPHvDG1+sTK1gUMpZA8cYyjGg+PNxUHVB5++955x2bmKy9tH4t7MOKsPwuCo1
 4oRuJy2HEkEqHwZu046fLGMBe0z1g8JB2PfTGZqV+woYyVDIEMTexW1utdidEKkVyvWWA55T0dO
 KfQOdSrg==
X-Gm-Gg: ASbGncvkk3edU21gCSCfE4SfIemLF5h0KS5yFdamuorzYSCra9KP/P6tsA+2TaHvPuW
 EhPCqHwgIh5SQyvbiHCOMShdINtjNccgmzP5eL6Vvw8YY51+abv5r8eLbL2KOjy53I1dFAN0fFF
 zV/rn8jee8ZQ/4q9ugE3iVQQLDtUKoDoVN06FWme1TrhO9/pSfFI49bL/GCx3cLnGeUMfgrOlTf
 yD3kK7vYwXHG4CboMvEvR6FQ3VIJ2eihObjUPhdaFSIFARy3Up0UhGjcxBaQraH/UgjleBFLDGd
 oQHKFBbCwZgZTnTv2qln1RWw2U3gndkgFb8Tay9sg/nNjVpZNFMqAP+B/u+2FrSD+rozcSyTNuJ
 xJy3TzTK/jla0Qy5xw33H4w8aOUpCp9JV6fc=
X-Received: by 2002:a05:620a:46a0:b0:7cd:3b13:c5b4 with SMTP id
 af79cd13be357-7d5f0286caamr235694785a.24.1751709769442; 
 Sat, 05 Jul 2025 03:02:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLFY60CQNpL3C+yvQakg2k85gAZCLriNkaPNQyhvp8oKtheOso4rDEGIWdjnPNdKdgNtluIw==
X-Received: by 2002:a05:620a:46a0:b0:7cd:3b13:c5b4 with SMTP id
 af79cd13be357-7d5f0286caamr235690685a.24.1751709768808; 
 Sat, 05 Jul 2025 03:02:48 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-556384c0558sm526274e87.209.2025.07.05.03.02.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Jul 2025 03:02:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 05 Jul 2025 13:02:35 +0300
Subject: [PATCH v4 10/10] drm/msm: enable separate binding of GPU and
 display devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-msm-gpu-split-v4-10-fb470c481131@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5219;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=fG270cxV/2q7kQa6T4r/dHwrEGN9NSQeGPoJADDDa3w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaPg0D8TLyxpxyMP5ZOm6f/GyJWsJzX6ZcuA4r
 FCYCYgTH++JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGj4NAAKCRCLPIo+Aiko
 1QvtB/0f5DxO5BvqdVoPXZaDjS6R3QfljCGAuivAD4aP8SahrZOkfS8yC5L+862G61Kl1A0QwoZ
 pOocaIuIDTdq3a2U7PP1gDB79IUrNh+Jj5YkWOqE0q2d+jiaVlcdhySbrYhXm3Nfwwbw79DKeBg
 r8J2pylstkUlBHQtdm2Z+0gLbp2cNQEISwi9xHI3cO8f6KVtAmYoPgbSJclsfyHnk65kB2qUo1K
 WVd+P+dJJgmrk/YI9ID0FrmiBvXoputJ5iXF0V75jZ6KK9QtWOGFiNml93xgpea+j8Xk/JkzaZd
 f/1Uz7I8ICTvR7k6pPB2lA5Vjf6xSTcKP41+AHWcspLFx+0k
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDA2NCBTYWx0ZWRfX7UHH51RfMDyX
 DMAax2LvNhI9pP82d5INiEphWppWCR2laY6YZS8OVDR7NGdxw/eY/XqfNy7mcnqAF48fLkP+JGx
 jiqIQ0Kw8eNzGkxfEqj86Qy0Laftlpd35i+IaEnf6dVa2x/snI8JzpSqky6hQ1oADNKqyGetUq9
 RE/cMqOzIoC8FTr5TnW6NjaIdEhFqbY6G4ktGjYPd0FSkhe6xoeJ0x/tVt4+LhNBGjs3jx1P9JE
 gK+jxu45jVFpA5QkPZTngAMh7VtKneZmRFeGVipeLY1hrhB40xj4IAn3WrVFpGclQYBtch6D0Qq
 s1fXoe18QgNfqfeuZF6gqfd+BV+lbYnN8VF6/lu7Fxu2Jo8edQUZzw/t8DZuJ2t6bXuN6aJVg4H
 PoQHVQOzkKnlrWbqylR6KQKg36bhemLquSjErqzlmQZK5hWXImqG9SHg+dDgbL/Apyxzq4jQ
X-Proofpoint-GUID: kssL7KpbUzaDvqrwF4uHfJDbqPRxGrja
X-Proofpoint-ORIG-GUID: kssL7KpbUzaDvqrwF4uHfJDbqPRxGrja
X-Authority-Analysis: v=2.4 cv=SOBCVPvH c=1 sm=1 tr=0 ts=6868f84b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=d3EbUlffPpwbv2rupc8A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507050064
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

There are cases when we want to have separate DRM devices for GPU and
display pipelines.
One example is development, when it is beneficial to be able to bind the
GPU driver separately, without the display pipeline (and without the
hacks adding "amd,imageon" to the compatible string).
Another example is some of Qualcomm platforms, which have two MDSS
units, but only one GPU. With current approach it is next to impossible
to support this usecase properly, while separate binding allows users to
have three DRM devices: two for MDSS units and a single headless GPU.

Add kernel param msm.separate_gpu_drm, which if set to true forces
creation of separate display and GPU DRM devices. Mesa supports this
setup by using the kmsro wrapper.

The param is disabled by default, in order to be able to test userspace
for the compatibility issues. Simple clients are able to handle this
setup automatically.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c |  3 +-
 drivers/gpu/drm/msm/msm_drv.c              | 47 +++++++++++++++++++++++++++---
 drivers/gpu/drm/msm/msm_drv.h              |  2 ++
 3 files changed, 47 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 99c8d2f4e4b49fda912fa49429399cf207eccead..50945bfe9b4992118f23db3cd17ac348be9f9c9d 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -262,7 +262,8 @@ static const struct component_ops a3xx_ops = {
 
 static int adreno_probe(struct platform_device *pdev)
 {
-	if (of_device_is_compatible(pdev->dev.of_node, "amd,imageon"))
+	if (of_device_is_compatible(pdev->dev.of_node, "amd,imageon") ||
+	    msm_gpu_no_components())
 		return msm_gpu_probe(pdev, &a3xx_ops);
 
 	return component_add(&pdev->dev, &a3xx_ops);
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 0ab005a7d5e99e46fe47c9e64514434416898d20..2966ba086b2cdb3232a7fa0445b953787cfad2b0 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -54,9 +54,18 @@ static bool modeset = true;
 MODULE_PARM_DESC(modeset, "Use kernel modesetting [KMS] (1=on (default), 0=disable)");
 module_param(modeset, bool, 0600);
 
+static bool separate_gpu_drm;
+MODULE_PARM_DESC(separate_gpu_drm, "Use separate DRM device for the GPU (0=single DRM device for both GPU and display (default), 1=two DRM devices)");
+module_param(separate_gpu_drm, bool, 0400);
+
 DECLARE_FAULT_ATTR(fail_gem_alloc);
 DECLARE_FAULT_ATTR(fail_gem_iova);
 
+bool msm_gpu_no_components(void)
+{
+	return separate_gpu_drm;
+}
+
 static int msm_drm_uninit(struct device *dev, const struct component_ops *gpu_ops)
 {
 	struct platform_device *pdev = to_platform_device(dev);
@@ -836,6 +845,30 @@ static const struct drm_driver msm_driver = {
 	.patchlevel         = MSM_VERSION_PATCHLEVEL,
 };
 
+static const struct drm_driver msm_kms_driver = {
+	.driver_features    = DRIVER_GEM |
+				DRIVER_ATOMIC |
+				DRIVER_MODESET,
+	.open               = msm_open,
+	.postclose          = msm_postclose,
+	.dumb_create        = msm_gem_dumb_create,
+	.dumb_map_offset    = msm_gem_dumb_map_offset,
+	.gem_prime_import_sg_table = msm_gem_prime_import_sg_table,
+#ifdef CONFIG_DEBUG_FS
+	.debugfs_init       = msm_debugfs_init,
+#endif
+	MSM_FBDEV_DRIVER_OPS,
+	.show_fdinfo        = msm_show_fdinfo,
+	.ioctls             = msm_ioctls,
+	.num_ioctls         = ARRAY_SIZE(msm_ioctls),
+	.fops               = &fops,
+	.name               = "msm-kms",
+	.desc               = "MSM Snapdragon DRM",
+	.major              = MSM_VERSION_MAJOR,
+	.minor              = MSM_VERSION_MINOR,
+	.patchlevel         = MSM_VERSION_PATCHLEVEL,
+};
+
 static const struct drm_driver msm_gpu_driver = {
 	.driver_features    = DRIVER_GEM |
 				DRIVER_RENDER |
@@ -982,7 +1015,11 @@ static int add_gpu_components(struct device *dev,
 
 static int msm_drm_bind(struct device *dev)
 {
-	return msm_drm_init(dev, &msm_driver, NULL);
+	return msm_drm_init(dev,
+			    msm_gpu_no_components() ?
+				    &msm_kms_driver :
+				    &msm_driver,
+			    NULL);
 }
 
 static void msm_drm_unbind(struct device *dev)
@@ -1018,9 +1055,11 @@ int msm_drv_probe(struct device *master_dev,
 			return ret;
 	}
 
-	ret = add_gpu_components(master_dev, &match);
-	if (ret)
-		return ret;
+	if (!msm_gpu_no_components()) {
+		ret = add_gpu_components(master_dev, &match);
+		if (ret)
+			return ret;
+	}
 
 	/* on all devices that I am aware of, iommu's which can map
 	 * any address the cpu can see are used:
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index e3dfaa156307dcd8bb675f865985a0888be8fb87..9875ca62e9adb12dca9bcc74e2825b0364372a54 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -554,4 +554,6 @@ void msm_kms_shutdown(struct platform_device *pdev);
 
 bool msm_disp_drv_should_bind(struct device *dev, bool dpu_driver);
 
+bool msm_gpu_no_components(void);
+
 #endif /* __MSM_DRV_H__ */

-- 
2.39.5

