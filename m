Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB71AAF9F92
	for <lists+freedreno@lfdr.de>; Sat,  5 Jul 2025 12:02:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C681810E38C;
	Sat,  5 Jul 2025 10:02:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kfUaie67";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87A4010E385
 for <freedreno@lists.freedesktop.org>; Sat,  5 Jul 2025 10:02:48 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5654EVxn018077
 for <freedreno@lists.freedesktop.org>; Sat, 5 Jul 2025 10:02:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 v85XOlp6G22KyP3grDgfXY+/B0h4nwRKeUy1AK2CaOU=; b=kfUaie67mbW6FXvm
 DsoBw8fWFNd6fZYixJMvkxp/MxVN5JElfEAJvS35MQQdvUAuw2g1GhOHW8oVe6AS
 5uK7ZRe5xxcmpjRsAPOmODWCgW5SFEg6jPeRKRP45auxC37c5Dq5dCY7VOoT88K0
 IrC1J3guHUjOEbo+qWsa+sIkDf/D9gSO+DaX5dR603UlHTQHCkh37E93SiCRj52U
 GdloITm3NDw01YgW7v3yUKC1ssAToTKHGeW6n5xsf7zCvkRUQ8xubmulF/a9SVqz
 J8zXW5agY502KlQitDQBsNv/thY58JOKCk1uKBqrlwsVJBSmIzNPmOBUexEoxM32
 54Jcmg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu2agncf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 05 Jul 2025 10:02:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7d444d21b24so248055385a.1
 for <freedreno@lists.freedesktop.org>; Sat, 05 Jul 2025 03:02:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751709767; x=1752314567;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v85XOlp6G22KyP3grDgfXY+/B0h4nwRKeUy1AK2CaOU=;
 b=ZTRlMPCxxiqOleTgm5+Q5QPG0CXplzem5kT54QzGdcksn+anQNWVdc+xU7ctq+/COv
 /0+4Krkf5yKdcwZWRLtPQ2//xsEaQY3ZNPJfcu76spQ1Ab+xwovunEn+rhW822UacbCd
 k9+0TgAU5wjNZ6KTwjtDUboNToU7hj1XKE7uKToKI6DH7v8pTixbAS0oZ8y7aC2BHgBU
 TQiS7Z+cXPXx0OCOpbMjL+ktrsFyWkWakwn7taC1zcu6TiPwyhDG/fB+DpUhKQMcfMVN
 RaSkCUhLCfzVMZ+eZoWEWZZQgxs8HLeYpvPHLHtf5fJjgrAUB4+nkE2jXuhQXKP7ujew
 D1/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWedHJtYoyr7ilG4NmhGNnTqwGxBMMOmpl7ZcJKt+DwL2AXrGySTscbGouVmewlUkxdQMkQJr8hig8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwE2C1JgoWGH8Rj9G/U+BNZmvX4sHBx4BUDBn+gZcEiAZNEyldD
 mupBQSiNcFn1F/RLHuDUg+CwHBGQ7XSM/WKOJO3KCCieTCvhoQvXFYQb/a2dt9nJGtLs/W93+dA
 ZoRj9T88HTqQutlAExMYGMCb8IcRaxDD5ljPuuyzELcsaslNJhjJY5u9bV+FqkSGeeDg/N7o=
X-Gm-Gg: ASbGncvZzNW4PUJxfP3s3KgAEwtbmNtNMVQbAhl2+3HZbmkYXnfci4RTvabv8FWP8PH
 nDCcXiyWcY30VapQ4syPef5dLdvxlKb3oAyQMp8m+3rnMCQL1R5RyHPVXYLssKvMNtywshHZbl/
 Xw5HUZDDPTmqsor9cObhv6I4XoDm0pMQnCPMLvDt8ntJPfGjZss6oS7/dqJfeGTla8VTEwurnVO
 38kUxEwhKq2pl73pdYJHwf3gJt4RNjLHIyVGOdwmacLpfdpD+qKVCYDCRlRHNzc3BVH8M0TfUWT
 gyvJtWeOC3Hzjax/aKwgQVVjne2XyfJdm9UqZWDpPrUMf8i17EYLWqoXGtWu0OQ+6O52ZN2CsBz
 jHa00D72LCNRnydkl6er/HguBuocea51oOGY=
X-Received: by 2002:a05:620a:31a4:b0:7d4:2889:b456 with SMTP id
 af79cd13be357-7d5f15f64d5mr239816185a.45.1751709766756; 
 Sat, 05 Jul 2025 03:02:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyEbozZlrjhSQ3iied2i5GKQxbxxyAlBZWrqrOQXmdyuUtu57UO4K9M3gldjqkE0QGpWdjVQ==
X-Received: by 2002:a05:620a:31a4:b0:7d4:2889:b456 with SMTP id
 af79cd13be357-7d5f15f64d5mr239810985a.45.1751709766131; 
 Sat, 05 Jul 2025 03:02:46 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-556384c0558sm526274e87.209.2025.07.05.03.02.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Jul 2025 03:02:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 05 Jul 2025 13:02:33 +0300
Subject: [PATCH v4 08/10] drm/msm: rearrange symbol selection
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-msm-gpu-split-v4-8-fb470c481131@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1858;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=KwQ9Fk/ez5j7BPU4OcwnfOs/f38mi3dlimt1zg0gBh0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaPg0j7zdBjOLSrDl22Ex55JC6SmmlXYlMrJxq
 wMMvG/m3jqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGj4NAAKCRCLPIo+Aiko
 1e/aCACaV/t6Vw5KZ+eAanxu1951sFjQ4+RjZFkCY0/4NcQ31GHSeszc4BiUEILCbCK8syLF+D7
 RcMWhY+E+UXJrnABI3EP4bCejopES7I+ibcjedaSINikVJ71q2Y3/vTgTqIPWZgl0hdtG4vVRHa
 adZCY0oTJ3BvDPBGJ92eWVYwdz11qZoWLIQHo6SMwX8ShfWLl/RATYVz2gS10xVEHCKB9TrmNhT
 XvW4ccCY9QLdCKQMaMEh91MNQHiqdG0sMF5VtMVJzUbQxyvzZanP0ylOmkqC5cd8A/w+S95eyV1
 YWeRvqYd+7QezzXiPtsd2+cC/bIwpjy/nDq/rMuBglBgGLlY
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDA2NCBTYWx0ZWRfX1IRDUGIPght2
 dHZvO6BQDHFrgisqs5Fyr61eHfVIg7yMQNzvSe0NrsHsbkzzTQCdXjXXmtE7piENyAEqKh3L2a9
 bQZtF5It85FrFJB7aTqnCdIqCKDaVThEMGwFK7Ven4R7B2ybeOR+MlPchP91XvAeCgy/qtk5ew8
 7rmnZVZDcR6jA0SzXIahhbwEARFQZOCFLUGIVLtI6K60iQCtWANxLp5BLAHRYJYBn5ELYXoDXOb
 vOFD/LwNZ5v/RvBDsSQqzilNTismu7sDwZMdxfyWkkvd6k+sqjgPDf3LZsDgMvwQMd6rWzubcNc
 GohK4Z6GwxBICHXirfTHJ1WBLaqL58SKqwWvIpAQqL1L7h5SPNeuFDxMhn4QbI3WyS0RztrKlsn
 ZUcdQaEaPKgehslhpJmYpki0njc7bd1NtoBZnOKMvbCZq9dSUp29Nk3K6rDjyCMJDHteL915
X-Proofpoint-ORIG-GUID: Xz2u9zEpmQ2-6vZTovzH653zXUvL-KBA
X-Proofpoint-GUID: Xz2u9zEpmQ2-6vZTovzH653zXUvL-KBA
X-Authority-Analysis: v=2.4 cv=erTfzppX c=1 sm=1 tr=0 ts=6868f847 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Dibrpul-hQ8xFFu5PoYA:9
 a=7cPi-V01pGkjOeJz:21 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
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

Move symbol selection to be more fine grained: select DP helpers only if
DP driver is also enabled, move KMS and display helpers to the newly
introduced DRM_MSM_KMS.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/Kconfig | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 3a0a69f41153c5f32670e07f9728d9b9e947be92..250246f81ea94f01a016e8938f08e1aa4ce02442 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -15,19 +15,9 @@ config DRM_MSM
 	select IOMMU_IO_PGTABLE
 	select QCOM_MDT_LOADER if ARCH_QCOM
 	select REGULATOR
-	select DRM_CLIENT_SELECTION
-	select DRM_DISPLAY_DP_AUX_BUS
-	select DRM_DISPLAY_DP_HELPER
-	select DRM_DISPLAY_HELPER
-	select DRM_BRIDGE_CONNECTOR
 	select DRM_EXEC
 	select DRM_GPUVM
-	select DRM_KMS_HELPER
-	select DRM_PANEL
-	select DRM_BRIDGE
-	select DRM_PANEL_BRIDGE
 	select DRM_SCHED
-	select FB_SYSMEM_HELPERS if DRM_FBDEV_EMULATION
 	select SHMEM
 	select TMPFS
 	select QCOM_SCM
@@ -71,10 +61,18 @@ config DRM_MSM_VALIDATE_XML
 config DRM_MSM_KMS
 	def_bool n
 	depends on DRM_MSM
+	select DRM_BRIDGE
+	select DRM_BRIDGE_CONNECTOR
+	select DRM_CLIENT_SELECTION
+	select DRM_DISPLAY_HELPER
+	select DRM_KMS_HELPER
+	select DRM_PANEL
+	select DRM_PANEL_BRIDGE
 
 config DRM_MSM_KMS_FBDEV
 	def_bool DRM_FBDEV_EMULATION
 	depends on DRM_MSM_KMS
+	select FB_SYSMEM_HELPERS
 
 config DRM_MSM_MDSS
 	bool
@@ -120,6 +118,8 @@ config DRM_MSM_DP
 	depends on DRM_MSM_KMS
 	select DRM_DISPLAY_HDMI_AUDIO_HELPER
 	select RATIONAL
+	select DRM_DISPLAY_DP_AUX_BUS
+	select DRM_DISPLAY_DP_HELPER
 	default y
 	help
 	  Compile in support for DP driver in MSM DRM driver. DP external

-- 
2.39.5

