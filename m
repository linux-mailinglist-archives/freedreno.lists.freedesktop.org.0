Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2517FA8727C
	for <lists+freedreno@lfdr.de>; Sun, 13 Apr 2025 18:33:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97E3310E228;
	Sun, 13 Apr 2025 16:33:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mNFxRR1m";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D383810E228
 for <freedreno@lists.freedesktop.org>; Sun, 13 Apr 2025 16:33:08 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53DDvWpr027280
 for <freedreno@lists.freedesktop.org>; Sun, 13 Apr 2025 16:33:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0RmOWcHlDb4JuPwd3mnRIUzvSzQKCWsI013jegbEojQ=; b=mNFxRR1m3X4F/rfZ
 SzNyS/4UrnRiqZQFXlnmARW3+J7zlyctBx+auILE8jjyTVP0mAszsWi2ue5GAcUH
 T53BKEtsjA+czQUJsGBavS4uTDc/+kyvRFJsKmHvZT2nx7A0vuak56XkoeFm4HkD
 6zjpGGwZh5VqbLmI3ajBp8cBCn2nmdMvGgkmfP86W1jy8xeWfJ79g4CLu6U3IvJ4
 415CxRmDYwTFHnWrUxXILhKaCvyOv6Zc1xBPlphTk8gcf5jy+Rr32zUXJkwcpCcp
 M9Dl5kg2fC8xRQ4OFBTSpb7CBtMkAEAnyNLY+KkAH//fsNRyuDLXYPjYpMYRWNsJ
 Pr/NQQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygj92bv9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 13 Apr 2025 16:33:07 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6f0c089909aso65221316d6.2
 for <freedreno@lists.freedesktop.org>; Sun, 13 Apr 2025 09:33:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744561987; x=1745166787;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0RmOWcHlDb4JuPwd3mnRIUzvSzQKCWsI013jegbEojQ=;
 b=bh/Vg8hwxFIG6at9+x2eJ8AhK9MnUkvuqINXUFRLcwxgr4ViUfD6DYL66Y/4BxCbxm
 so/ASk34/6xT6X/gZZsd0uqVv0X2wJ6/9pk9PnWZafrSz4WuWxjDmLjvIwIbbaUyDsU9
 sfEF5AllA5dttTMa/OSO069LSXt7wtEIWBsF1qn19Ttvjbz2CpfGgl/KmKnUF1yGuG2l
 sts/5kN5VVKiT2fkbQ1azsRlZ75mS27YQzMPI5l9EbXqKFiRbcPkp4wdYardGKZBLNyL
 EFPEBMyQtaMzV9IomVL3zwMUs1FWgXIse32A3SX3axjrl2vQWfIYWYQiMKQKgk4jTbg2
 pMUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGJmMoen34vbn/PEFNFwMKN4EvfIi8vyfG3sAaLQX2pBvEM/Kv1xUmJbmVodJC7h9MYctN5+tjgBo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxfKitRGX7iKIMXCB1kEu4t+gaPm58/MMfBNwPhZ/9StvzlxO0i
 b89LGc7BKs8w/4ZZXEXRzWaPkKrkdQe7iA6b8gIZd1WRKNofJsFj210q2U9Dsn3WACJJv0NXZE+
 8xvRqiZTufyesErzCHIMrqjWG9y4zap279aeFjjiRcsdV9sHlSrwnniJmaz9VUVR9yuc=
X-Gm-Gg: ASbGnct2xyEWz8r872sCt0Bx/dy2Db8jHMXHWytY7fQEGR7UwEzQozT8ITomGRTLtuO
 A32gcYJRCciNpHObF0so2t0K9tC/AvhQE8QDJVmIiDKzJLuUhsfNiu3u2hLQHCe37uXlnucbvqv
 B0fdKddDI0k7l9ZSVxJHrCI7RU12du7rgFIw6OhBYJ/wpNr8hElJP/KjETY7bHAyj1u3zlJMSUH
 u9exp7tLgaOM2McJ52zJDczzDvtkodzGXzTwk6Un3Ga9/Yw6QvrSRXK0bKg1m4D0noTkhywQSTp
 wo6eS58ML3C+Wp7e0E/I/D2zWuAJxpQu2YQR34P+xVO9TybWZU+wzROcyqnSl4+GBbSCcKsrR/N
 loJVQa4AEhBy7aqthkGo55+pd
X-Received: by 2002:ad4:5c6a:0:b0:6e8:9525:2ac3 with SMTP id
 6a1803df08f44-6f23f1188admr152015366d6.34.1744561986929; 
 Sun, 13 Apr 2025 09:33:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGLodl/w6+GHQYPiMmhn35zt6NHmgJcWNBOid2Hlk9AhNDjaBExDvTcFzQwqXWWmtQcU0lIg==
X-Received: by 2002:ad4:5c6a:0:b0:6e8:9525:2ac3 with SMTP id
 6a1803df08f44-6f23f1188admr152014846d6.34.1744561986403; 
 Sun, 13 Apr 2025 09:33:06 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30f464e9812sm13345431fa.49.2025.04.13.09.33.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Apr 2025 09:33:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 13 Apr 2025 19:32:58 +0300
Subject: [PATCH 4/7] drm/msm: bail out late_init_minor() if it is not a GPU
 device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250413-msm-gpu-split-v1-4-1132f4b616c7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=978;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4jhdmFiEq7O5wiS7dzxOzMOcZAnlZvPI9pm8jbvDrqs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn++c5I7hkNUFspsI06/XZ8R8h9Li5mG5fqSSyf
 SjGe4M9r5qJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/vnOQAKCRCLPIo+Aiko
 1RnMB/9pV6fJTmE9QLlRbc72gU5cp9CDKzI2cO0Ye6XCaZ/bqfpv1aTYAKtPFFa2t/1tB9tY7jK
 70eMELu1I1l95w9Hifvki8tRXsCdT5DNAY7im3qjeYvreuE8Y/WfacKOweJZ2n/pjJIEh2ubl8B
 oRuDMx6SMc08WiOJrAGnj2MmXNRleIRSLrcekS0fpJnXeYjrkRxImZOheaAWwcswwyZapf8F8T/
 kJWigmJ0yWsjDMO2ojx5o0qGf6ssP8tJTVgPTjb/goTnRIJZiZPiSaSxPP3HAR13nDz0BaDcgUi
 TTjK+Ub+RejLZ0huYFCb9ToGBqs2eGcL1lx91btlTqlMQT/g
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: CFdH1O8ACe57Pk6NcxyAp_TaK4blVqJU
X-Authority-Analysis: v=2.4 cv=PruTbxM3 c=1 sm=1 tr=0 ts=67fbe743 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=blY4ScjC_F2vtqdRJt8A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: CFdH1O8ACe57Pk6NcxyAp_TaK4blVqJU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-13_08,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
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

Both perf and hangrd make sense only for GPU devices. Bail out if we are
registering a KMS-only device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index 2b12f2851fadbc3c924827e11570352736869614..6e60a74b13d72c47e45cb9dc65ed67b977e900fa 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -296,11 +296,16 @@ static struct drm_info_list msm_debugfs_list[] = {
 
 static int late_init_minor(struct drm_minor *minor)
 {
+	struct drm_device *dev = minor->dev;
+	struct msm_drm_private *priv = dev->dev_private;
 	int ret;
 
 	if (!minor)
 		return 0;
 
+	if (!priv->gpu_pdev)
+		return 0;
+
 	ret = msm_rd_debugfs_init(minor);
 	if (ret) {
 		DRM_DEV_ERROR(minor->dev->dev, "could not install rd debugfs\n");

-- 
2.39.5

