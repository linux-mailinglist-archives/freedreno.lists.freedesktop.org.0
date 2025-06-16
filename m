Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD7AADB43B
	for <lists+freedreno@lfdr.de>; Mon, 16 Jun 2025 16:44:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C364310E34C;
	Mon, 16 Jun 2025 14:44:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="noK6lW0J";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A9E510E341
 for <freedreno@lists.freedesktop.org>; Mon, 16 Jun 2025 14:44:45 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8keJw002743
 for <freedreno@lists.freedesktop.org>; Mon, 16 Jun 2025 14:44:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:message-id:mime-version:reply-to
 :subject:to; s=qcppdkim1; bh=OF+xq6A7Vha67Y6nxaav1VkwmNZVPUuwRDl
 u8Vsm1S0=; b=noK6lW0J5TctLLigmSZaskkWSpI3D1IpnexZQb3M0L/6J1D1JcS
 FRk39hw4bUkfZ1eZVUFLQOqrQqS8TczekM1fnrjDpiKskB0uIVspxSC9wIfJO/pr
 3VSjpGb6XJpcVr/sF1x8j/pbT3gtg7n5kG23CtWfT39Pk3CNtwh04Ww4meFpNw1Y
 EFhgN0Sj0q3maU9rYg8pCiiv5Rxbp82ZWIAimONy8sH3dTTLs/T996xQ4B1cq9E/
 lwpXqJF1peAYVtir93Y9Yk3H1zMYg2Qy1XJzc0JLXVXwIiRhKePeh8p9P1fya0Rq
 XvPVDCIHwHRMvCtQuaaG6XwXFZ1Y0+ZaIqA==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ag2312dg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 16 Jun 2025 14:44:44 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id
 586e51a60fabf-2e94cfbbbc1so865293fac.3
 for <freedreno@lists.freedesktop.org>; Mon, 16 Jun 2025 07:44:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750085084; x=1750689884;
 h=cc:to:subject:message-id:date:from:reply-to:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OF+xq6A7Vha67Y6nxaav1VkwmNZVPUuwRDlu8Vsm1S0=;
 b=EF33q96Guu25BSm01YYQH8+amQUmVidPfWa7WKzNsfhAMlXGLMdXDs2aSUpPACO9c9
 0ytvyW8euJUiUIcIx76No/o+iTrHHwAPBGPXOMtFQnsmNobZENWuMgXeA57ylV8C+xop
 D8XTogp1xYWPOvKY945X5+MFmiFI0RFzGwETCQmoekfij4AW0UtopkoYWk71iHA/KRHT
 ALRKInqiKyMNKsZrL5pyUW39cBWxxSIOZHdYwlX5nXlf4zm9Ln4U9Ihds/Og5vvktA5V
 RCI0wbjj2542ff9c0/TMZty2YZEEDru4Z3QFnhsgtQUjI0HBIiPepaTlA0uMC2EBj1P5
 0vow==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1eqMd9+5qr4Qa138XHpxEtYu7BKw14NjRThPzH7CvCMJGB6Epy3WMQ4k6Pd4hWyOfn7R1ungfToU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw0ejAFnB1fgRS3c1ia9xWWSI4j1NMZWa/aipRMY18pFMyJ4+rq
 yW3uL8byQzg+HNHQGpJ2dj55g4XoTHo3MydmGCiqGjCZH9tZ+MiP0vCej8Ln5CNfLC4OQyQY97b
 7ZFyD9yMWry+8jYZ9fnBuB2LrLyF5QWl7ZM6iFDN4YTreiuJvj/JqhKswzT/2UHNoEwswnlLT7z
 BboSGDqIDDPNK7nvFQWndllJVRJ6p186VOFFP0Rkzuc5tN4Q==
X-Gm-Gg: ASbGncsGYTMITWdidZtRTuILGxMlJO+2AzV7ZdaxR60ZIQZNX3CNK/QyQIV+LlR+G2F
 H7THlzxJti1wryn/MWC/dugDG76exPJktfpFbBEBm3R/NOVpqlLEs8qr5ffpehlyJTgTGyUGqCw
 wksDECGB2dsvliJkjr/J5TL1ShQyOuAFJ+rkc=
X-Received: by 2002:a05:6870:1cc:b0:2e9:512:ee1a with SMTP id
 586e51a60fabf-2eaf0835465mr5709593fac.4.1750085083847; 
 Mon, 16 Jun 2025 07:44:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPyxd/ZCna+fivSUS1vT9j9EBiQJj04kCv6BQd+zEIl13TKyJNAt+sPYBirqLvu+a3UFqX+NCdq2I6N/FBSFg=
X-Received: by 2002:a05:6870:1cc:b0:2e9:512:ee1a with SMTP id
 586e51a60fabf-2eaf0835465mr5709578fac.4.1750085083424; Mon, 16 Jun 2025
 07:44:43 -0700 (PDT)
MIME-Version: 1.0
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 16 Jun 2025 07:44:32 -0700
X-Gm-Features: AX0GCFvt5LG4Hp3T6ZAjQtUtoIr85DmoyodqDFDNkakh-GWvcoJA7D6CJENh8xI
Message-ID: <CACSVV03=OH74ip8O1xqb8RJWGyM4HFuUnWuR=p3zJR+-ko_AJA@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2025-06-16 for v5.16-rc3
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: "open list:DRM DRIVER for Qualcomm Adreno GPUs"
 <dri-devel@lists.freedesktop.org>, 
 "open list:DRM DRIVER for Qualcomm Adreno GPUs"
 <linux-arm-msm@vger.kernel.org>, 
 "open list:DRM DRIVER for Qualcomm Adreno GPUs"
 <freedreno@lists.freedesktop.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Connor Abbott <cwabbott0@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: 4krQ3WDJTT8kGqVient03IpIHa6ZxC5F
X-Authority-Analysis: v=2.4 cv=edY9f6EH c=1 sm=1 tr=0 ts=68502ddc cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=e5mUnYsNAAAA:8 a=Y02TM-CbU_CDVPOd8LEA:9 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA5MiBTYWx0ZWRfX0n+uhJv3bqTA
 xZ5SRGN0qVZWGwAntXPhQQLJDrDUYIcGirdMvT7WJ4qN8c0+BCwmlESo5nwnKdyRM7snVd6EyKG
 cdeOueduMspbIeeMLBo7ZKBlXM6PKCeE95xXct0grRPH5YzBGrI2X2uTViFvU8Wt3JtRLtVyiAy
 8F8xGGGeD5ey7woFDzXIoY5xsD0n5r+mbgCEepPwePRJ0rP1yCk9Q2VfviEJJJClfELZqDxBbng
 ov/ikj4JuNPljmIt3gYkGJ7iFwfBEF0w0lxmnDo11gu3pQcafAejjjsT5MmWHxekmvUzmhfLQuy
 Az+hDQBx7SA/rNQnXqC7p9egR/I1kRCMc81Q1uo1uaLHb/p/RcQz5PNT85vI2wiU/zFXAv2gNl+
 ZpMQjDaPtTgBfbKv7wPmfdmuGrc/UQb86n23jHO9Xch0Flly5bT692pwYIAlLTCfD9gn5Vn5
X-Proofpoint-GUID: 4krQ3WDJTT8kGqVient03IpIHa6ZxC5F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_07,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 clxscore=1015 mlxlogscore=999 malwarescore=0
 phishscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506160092
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
Reply-To: rob.clark@oss.qualcomm.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi Dave, Simona,

Fixes for v6.16-rc3, as described below.

The following changes since commit ee11d953fd230b4e1c28388913826ca832ae8444:

  MAINTAINERS: .mailmap: update Rob Clark's email address (2025-06-04
13:26:41 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-fixes-2025-06-16

for you to fetch changes up to d3deabe4c619875714b9a844b1a3d9752dbae1dd:

  drm/msm: Fix inverted WARN_ON() logic (2025-06-14 08:10:44 -0700)

----------------------------------------------------------------
Fixes for v6.16-rc3

Display:
- Fixed DP output on SDM845
- Fixed 10nm DSI PLL init

GPU:
- SUBMIT ioctl error path leak fixes
- drm half of stall-on-fault fixes.  Note there is a soft dependency,
  to get correct mmu fault devcoredumps, on arm-smmu changes which
  are not in this branch, but have already been merged by Linus.  So
  by the time Linus merges this, everything should be peachy.
- a7xx: Missing CP_RESET_CONTEXT_STATE
- Skip GPU component bind if GPU is not in the device table.

----------------------------------------------------------------
Connor Abbott (5):
      drm/msm: Don't use a worker to capture fault devcoredump
      drm/msm: Delete resume_translation()
      drm/msm: Temporarily disable stall-on-fault after a page fault
      drm/msm: Fix CP_RESET_CONTEXT_STATE bitfield names
      drm/msm/a7xx: Call CP_RESET_CONTEXT_STATE

James A. MacInnes (2):
      drm/msm/dp: Disable wide bus support for SDM845
      drm/msm/disp: Correct porch timing for SDM845

Krzysztof Kozlowski (1):
      drm/msm/dsi/dsi_phy_10nm: Fix missing initial VCO rate

Rob Clark (6):
      drm/msm: Fix a fence leak in submit error path
      drm/msm: Fix another leak in the submit error path
      drm/msm: Rename add_components_mdp()
      drm/msm/adreno: Pass device_node to find_chipid()
      drm/msm/adreno: Check for recognized GPU before bind
      drm/msm: Fix inverted WARN_ON() logic

Ryan Eatmon (1):
      drivers: gpu: drm: msm: registers: improve reproducibility

 drivers/gpu/drm/msm/adreno/a2xx_gpummu.c           |  5 --
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |  2 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 18 ++++++++
 drivers/gpu/drm/msm/adreno/adreno_device.c         | 39 ++++++++++++----
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            | 54 +++++++++++++++++-----
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  2 +
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   | 14 ++++--
 drivers/gpu/drm/msm/dp/dp_display.c                |  7 ++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c         |  7 +++
 drivers/gpu/drm/msm/msm_debugfs.c                  | 32 +++++++++++++
 drivers/gpu/drm/msm/msm_drv.c                      | 10 ++--
 drivers/gpu/drm/msm/msm_drv.h                      | 23 +++++++++
 drivers/gpu/drm/msm/msm_gem_submit.c               | 17 ++++++-
 drivers/gpu/drm/msm/msm_gpu.c                      | 20 ++++----
 drivers/gpu/drm/msm/msm_gpu.h                      |  9 ++--
 drivers/gpu/drm/msm/msm_iommu.c                    | 12 ++---
 drivers/gpu/drm/msm/msm_mmu.h                      |  2 +-
 .../gpu/drm/msm/registers/adreno/adreno_pm4.xml    |  3 +-
 drivers/gpu/drm/msm/registers/gen_header.py        |  8 ++--
 19 files changed, 217 insertions(+), 67 deletions(-)
