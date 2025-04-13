Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 059A3A8727F
	for <lists+freedreno@lfdr.de>; Sun, 13 Apr 2025 18:33:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE53D10E235;
	Sun, 13 Apr 2025 16:33:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lFxlRlw9";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E200410E235
 for <freedreno@lists.freedesktop.org>; Sun, 13 Apr 2025 16:33:01 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53DDvfCk031473
 for <freedreno@lists.freedesktop.org>; Sun, 13 Apr 2025 16:33:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=YBl77YCXWG4OvagfLRquKk
 7aupLLR8079UVqKJKZGMQ=; b=lFxlRlw9zR4dMXfQHbQF8y7GJN3ACKQN/PNHRa
 QJhhlQeX24tVvBIUCRQlv6X9zFqROhnfSxnm3izl3XZbBL6thntR4IU7gJXEtV3L
 JfB2QyKMmGVclOEn1tQ3AlkQ8S3MMZ+vRfXMwjnDuIoUMg4rh1N9JjSGOVMgyRJb
 eZSNdIPkSJXghARosTj4nZi2jgfwtHSkIYpOPZegsf0C+wc0fnvtW4060gZl6qhV
 mQJiQqJOBnUM4ThSGSDJ7PxaFyDAh5pNQf05cl9IGo8qR315ti+2VPJF0GQcHhpd
 vfjVl7GcigZe0+c1g7CFk20HQ8ubeml3XEAqI/lxH+SbMgZQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfgjadcd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 13 Apr 2025 16:33:00 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6e91a184588so109734306d6.2
 for <freedreno@lists.freedesktop.org>; Sun, 13 Apr 2025 09:33:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744561980; x=1745166780;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YBl77YCXWG4OvagfLRquKk7aupLLR8079UVqKJKZGMQ=;
 b=CirIpySsB1bieVC6EfGpA5AtEJvg/0z3taXW2sifnekYF1tkKJw6nCMyZ6Xrx5BIGl
 nHazgPlXDzn+FHnK4b4cpEcOnL9lAQfA56F7RVSUpIlWe0uTi0EBYhPIBwndfrab6ehW
 zicIA67cDu3rnGdtrdsD8M57Vlg1X783NpUlZFYzL+/XjbtbR2r21sf7UmO8fwBbin9t
 +uDmXe700wEbmobvyVutvG6suKHXI3OfOu16TygQs6AA1DZpYaNf1ISJB035mdHZbDYA
 j7ipJtOZ9UPnhvS5hJbyDURnPN8+YQ0PwLWJKsf4RlV1C4xrpWG1mirXsHel4Gmo1mwN
 0znQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKdRHrxy53p+6pvrlrgXcIRSZIDg3pPGQWTmtg3r4ZjR/8myGmagFLZef3FVXeTlpXa9rDZvl7MN4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6h7K4o+Ypf4qtOc51UmRC1+bEqw6VOQTkfiSIG5DwPeSsDFYe
 vZ42TgLR/8m3m9eR0N/P4Nsyn4nW4ldUsp7afQmrPqYIEwEYJWrj4m+MmKoVJ1GCuRSmXoNjUtK
 yiFJMElIWomQt+dsHia+aVH11eRagysd1XQevKso+1Iup4DgBJ5HUJ9qzrTwHAsLBRMg=
X-Gm-Gg: ASbGnctMp0vKpWBvpuuQT6G1JjyiaVs2zKPtOxoQhZGTZgIOO0Vusi1tDEkPwG0IKT5
 /Tm7rlh2cuLk3mCdB3umrxIAqrGQWilqt3SJVgPpxVqAU/zOgZ7qrfYSikUMsc0vfNw48mLJ8/4
 J/VmW1rpoayw6QWVQZxp6OtCcrRbR6aaL6P/PBMYC6wewIH4PGV51wZnJJqjo7UczXsBice9ibI
 M3GMfbEM5Ag0WWI8K8xiMfZ0Pi4b6a3RPNtZgU0+mQfC4T91+vILfKf4vLi1cp1s3L0gXb7ePbQ
 +K2MG9KxcFSgf8mgdcMuMSucdmaJ8d+aXx15yRG67FsBbrwxTMAU1Q0rDNbtDnIY1wsF/BK7PSt
 8z3ojnb43q8DDc+i810CSmjG6
X-Received: by 2002:ad4:5be4:0:b0:6e4:41b3:497e with SMTP id
 6a1803df08f44-6f23f16f311mr145153086d6.40.1744561979960; 
 Sun, 13 Apr 2025 09:32:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtCj60GSXxfWYW6yCvFGLGwmwV2r19VcaQu0T/FGwl59yVWji21Ut9R7m3Ll7RuSOvQbKz3Q==
X-Received: by 2002:ad4:5be4:0:b0:6e4:41b3:497e with SMTP id
 6a1803df08f44-6f23f16f311mr145152756d6.40.1744561979496; 
 Sun, 13 Apr 2025 09:32:59 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30f464e9812sm13345431fa.49.2025.04.13.09.32.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Apr 2025 09:32:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/7] drm/msm: rework the ties between KMS and GPU parts of
 the driver
Date: Sun, 13 Apr 2025 19:32:54 +0300
Message-Id: <20250413-msm-gpu-split-v1-0-1132f4b616c7@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADbn+2cC/x3MSwqAMAwA0atI1gbSUhG9irgQjTXgpzQqQvHuF
 pdvMZNAOQortEWCyLeoHHuGKQsYl2H3jDJlgyVbkTMGN93Qhws1rHKircmwa9jRTJCbEHmW5/9
 1/ft+QL+XvF8AAAA=
X-Change-ID: 20250411-msm-gpu-split-2701e49e40f0
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1842;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=9yxMEHvKcP03zKtalrD4vW6AanrAlYnI7Y8o1GM4qBg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn++c4vA3nd9QkmmdiQrZIPvD22E3LjnDqLpDGA
 ryY5j7Da7qJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/vnOAAKCRCLPIo+Aiko
 1aPSCACvx9Tr29RYG5QYv4mlFUzXExNlNdqg2FBYwRpglLSvUiiNhiLE/JINv+O4UNIDQIAl67N
 QXDf3cOGw5+9GuPQWMZfDZ6zIO5uUXnmyLUlbv4lmz2zmaqB9K3ddfls6oIot9C12zfu5nRx3Jf
 fGW1FIUAAN0cbGD/OPwER5sX2wCcW29UBzkOzPDHaxmqTTuUhhchVxT1ieZQ+m16x+nGQkvrAeO
 bK1QTCWmym68tB/O58e4YiQib8OtH4f9OkC0xqGRgGfFx2ni3684pkZFSXjYHuFuVs5P0tp9ZFt
 oVMNVLYEApTa2H0Etq2VaYlo8TTjVDpQjh+Y1M726qplCqDe
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: AK5gNSEuOGmEzAds72SXOLz6VrFSu_D_
X-Proofpoint-ORIG-GUID: AK5gNSEuOGmEzAds72SXOLz6VrFSu_D_
X-Authority-Analysis: v=2.4 cv=Cve/cm4D c=1 sm=1 tr=0 ts=67fbe73c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=gunw-TT0iufYsHqiWz4A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-13_08,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
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

Currently the KMS and GPU parts of the msm driver are pretty much
intertwined. It is impossible to register a KMS-only device and
registering a GPU-only DRM device requires modifying the DT.  Not to
mention that binding the GPU-only device creates an interim platform
devices, which complicates IOMMU setup.

Rework the driver:
- Make it possible to disable KMS parts (if MDP4, MDP5 and DPU drivers
  are disabled).
- Register GPU-only devices without an interim platform device.
- Add module param that makes msm driver register GPU and KMS devices
  separately.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (7):
      drm/msm: move wq handling to KMS code
      drm/msm: move helper calls to msm_kms.c
      drm/msm: make it possible to disable KMS-related code.
      drm/msm: bail out late_init_minor() if it is not a GPU device
      drm/msm: rearrange symbol selection
      drm/msm: rework binding of Imageon GPUs
      drm/msm: enable separate binding of GPU and display devices

 drivers/gpu/drm/msm/Kconfig                |  34 ++++--
 drivers/gpu/drm/msm/Makefile               |  16 +--
 drivers/gpu/drm/msm/adreno/adreno_device.c |  39 ++-----
 drivers/gpu/drm/msm/dp/dp_debug.c          |   4 +
 drivers/gpu/drm/msm/msm_debugfs.c          |  97 ++++++++++-------
 drivers/gpu/drm/msm/msm_drv.c              | 168 +++++++++++++++++++----------
 drivers/gpu/drm/msm/msm_drv.h              |  13 ++-
 drivers/gpu/drm/msm/msm_kms.c              |  36 ++++++-
 drivers/gpu/drm/msm/msm_kms.h              |  25 +++++
 9 files changed, 285 insertions(+), 147 deletions(-)
---
base-commit: a4e1d05abd6847ba11edf46734efecec86a1fe2c
change-id: 20250411-msm-gpu-split-2701e49e40f0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

