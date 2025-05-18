Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FD6ABAF6E
	for <lists+freedreno@lfdr.de>; Sun, 18 May 2025 12:55:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FE0A10E1DE;
	Sun, 18 May 2025 10:55:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iBnZjxmW";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5558110E17D
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 10:55:27 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I7xGqL019209
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 10:55:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=dygG9Oa2sBG+0KNu8dtwTW
 0rUBxsgf/WDp4kxnn2PEc=; b=iBnZjxmWb33dujTpgQWz2pa4msBoR+5Q5sz+VY
 LWL7CuN176Dd2I3kPi547zC8OoEoztQqojRLfS4FAEk2L4as6MK5g73fXnwCaZof
 EFhzA1PDaJ9cAIFtVbJsszpzx1du6L39T8EBY/9E+sUapMKelKwxDGo8/gATSf2E
 RzsSGUuLjRIiefScvFdMzX0VBptzQBBFF6qwyRdTRthSm7/WuH7on+wtIW9HgKJN
 uuwyPnJqzahb45W0M3EeqAnOJ2udftZ6zHxDTu/dDDpHiu7bv1giE0z2BglxyRKO
 L5+wRb6gxsCk+Ul8EFV4h0rPXtzkO6vYOhKsYnhyjQ07CyeA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pk7g1tu8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 10:55:26 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6f53913e2b6so54671646d6.2
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 03:55:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747565724; x=1748170524;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dygG9Oa2sBG+0KNu8dtwTW0rUBxsgf/WDp4kxnn2PEc=;
 b=HYEzvrCk1YSoerESSXxmZoY8qnQakLS+OR73F7gUuKCss3daGKXdfG7/Z+GA9JRLE7
 3PelfiwyYeV2UYCvbfksloUfdkeIyRG9Ql9eivLkIZvSB2Kuk0q33PuiT+NBu4z984iQ
 QTGkY2Whr494XF2Hrf+gTrKHF4whVKvyvCLE+9ZL6ExQDoOOqpqC8kWFj/8b5EDjkZcW
 592QI2pU6QE9FS8JKNzGIBvfTXbVzg/1G96awmQledkg4L7llvwhvTN5g/+HTsmQv00F
 451fZOVNhBrPAqh1N4sjH5FSYfCk1qruZgUhhEXoqF7XEjMVdfzwEal7q8AkeJkOJZ03
 nFIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDDI4J+2DJTLAQUgp742ptK2VgPo/YbOExJbtlXLj7cy5gFEkw6/EpqaSVwvFLPU2a0KphdLBmhKk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZadYQvoL/k8DOugJJNUkYft2x5bpg0MeAhhuDFH6uHGdrTBqp
 8brE932apATj/jzJMMFyoMKy7brwH7J43bkBYTRmLWkxxx81xA8hYoGcbSFhx6np6oXzs5RiJeS
 BJqt21ptXQnbLRVBGSQdqi+Q1glVQLvHgwzgu6ONW0+dGlKw5WXlbhXgEP2d+R6CD5f1l4bVRbg
 1gqwU=
X-Gm-Gg: ASbGncv6HI4pM8xLStZPsg9Hfwx0hu2FcMSDtvsgGVcAts9yXWeYBQMK3DJImoU7ukb
 hNnITFM9TYgygHJtkR7IAWlp8yI+jPYXd1/5fZbqs45fjC987PO64LQhSR1/jxs2j9vZ+RiHdme
 OmvGA3TEU6isNCy2kDRlM0URRNVTF3MRfTjaqys7mu+FOH2GBzFpM61pET49HZb9JYaT5AfnQXh
 nCbWJKxJE6wMKq06Jgcr0hcRXZh39gONVJa2K47iTcYag74K6nMg4ehOscu+KuCS6B7b1WoNng9
 2L/pnSU92zKeN0pOyK+jkikNcZR0MIuBkeTPTtcrYViL49oDr9IhglRRYap0OVJgrygPhpmk7OI
 n1ipYPFP4l1zpkTF9ZRp9Ybjp
X-Received: by 2002:ad4:5aa3:0:b0:6e8:f3af:ed59 with SMTP id
 6a1803df08f44-6f8b0881b41mr150111526d6.22.1747565724601; 
 Sun, 18 May 2025 03:55:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1waGEaJBOHUK/hXbXkrMHI3pyZOv6MMf2NSoKVTkW0bnd18eZ3+aO951TZ4oxQfBZX6BEjQ==
X-Received: by 2002:ad4:5aa3:0:b0:6e8:f3af:ed59 with SMTP id
 6a1803df08f44-6f8b0881b41mr150111226d6.22.1747565724202; 
 Sun, 18 May 2025 03:55:24 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328085cf8ccsm14314451fa.99.2025.05.18.03.55.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 03:55:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 00/11] drm/msm: rework the ties between KMS and GPU
 parts of the driver
Date: Sun, 18 May 2025 13:55:18 +0300
Message-Id: <20250518-msm-gpu-split-v3-0-0e91e8e77023@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJa8KWgC/23MQQqDMBCF4atI1o1MYlTsqvcoXcQYNWCMzWhoE
 e/eKJRC283AP/C+laD2RiM5JyvxOhg0boyRnRKiejl2mpomNuHAcxCMUYuWdtNCcRrMTHkJTIt
 KC2iBxM3kdWseh3e9xe4Nzs4/Dz6w/fuWsi8pMAqUsYy3oi5YocqLQ0zvixyUszaNh+xg4B8kh
 x+E7wivuKoltLls/iDbtr0A1rWx0fYAAAA=
X-Change-ID: 20250411-msm-gpu-split-2701e49e40f0
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3517;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZMPdcJDb4Sai0ElGNUE8wg+TZJqFVZ/UEtHRRg56ccM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoKbyZIHkrqMMH0USJE6kCasx6u1cWMm0W79nDq
 jl6dI9t7rKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCm8mQAKCRCLPIo+Aiko
 1ZomB/9y036miSvgEAw9vHR7r7LrHb9fxll6SJ3eLtFTnNiffFNDOi2NN/AWOJHGVd8jeEZMWa+
 4OTSYknrf6+bWW4fLwXSLuiJa627h/P5K41g/PStC+sn+J3FsD/W2HEsj9/5dvPSwZPZmVEejwp
 2fhW+gphC3CTVNrr4jBYxAUxmLX6GmNQIXBbkJTRQYndpjoO0q+kEFHvdSjBEDKzVTd/xauPkGv
 eqSrsVv39o/fXKGVdQaxEHj27uyc1JSnXgAinziyHiEj081TYokrx58H2Z9nu3dK8yH7dPFX7cD
 hpgPbParfyHz2O45FcY6iUSjxq7ChCJhAMaRKtkVGWhy7jg6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 5Rb6dM5docDhoGLuRHNCBALTjyPnAcyG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDEwNCBTYWx0ZWRfXz8k9ocT9HBPN
 pe5JcWnnqmuZcsd6SSNusMkmSi9dlu65NfL1cLgdzZM2MLCYYPc2SySQoBBzpk9MCPIwaJUyfCz
 IQ125qLM6XUZMZ8sjylWUDw5XRX/0XtSqBlg64qDSJf4tVH+e7EAPD444F0vCtGoGPa83HPCnxX
 E63gEhvEbkoU54Ioby+X1pVZqZdeiUXSsGCSIqEscQLD450CT6rPApKg4okJeASz8uhr0X9xg9x
 iiFGRYzbq8SYRe68ve7U8IQpk3dv24e50RGhi422NF+bjvBp+oPOqGkwNSuLBDheTeBs9t4xnaF
 NPRpPXtc9bnHPL/tCHwtAikekMqlQ5xxIYj8s6keQbTJ3PbowICWhfgPzPgXKETbnBUBLgnoDV9
 xLQoLwCbh5trdgMefzHTr2wUPhhMi1Ddp/I8cv7Fwd8qkGYW4gQbl0QGbLuKtsj5elj6/pm7
X-Authority-Analysis: v=2.4 cv=CKkqXQrD c=1 sm=1 tr=0 ts=6829bc9e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3aS5ecUQXdRO32CnfYUA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: 5Rb6dM5docDhoGLuRHNCBALTjyPnAcyG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999 suspectscore=0
 spamscore=0 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505180104
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
Changes in v3:
- Disabled SYNCOBJ / SYNCOBJ_TIMELINE for KMS-only driver (Rob Clark)
- Further refine Kconfig dependencies
- Link to v2: https://lore.kernel.org/r/20250503-msm-gpu-split-v2-0-1292cba0f5ad@oss.qualcomm.com

Changes in v2:
- Got rid of mdp4_crtc.id and msm_drm_private.num_crtcs
- Moved msm_drm_private.wq and msm_drm_private.event_thread to struct
  msm_kms (Rob Clark)
- Moved HDMI / DSI / DP pointers to msm_kms (Abhinav)
- Link to v1: https://lore.kernel.org/r/20250413-msm-gpu-split-v1-0-1132f4b616c7@oss.qualcomm.com

---
Dmitry Baryshkov (11):
      drm/msm: move wq handling to KMS code
      drm/msm: move helper calls to msm_kms.c
      drm/msm/mdp4: get rid of mdp4_crtc.id
      drm/msm: get rid of msm_drm_private::num_crtcs
      drm/msm: move KMS driver data to msm_kms
      drm/msm: make it possible to disable KMS-related code.
      drm/msm: bail out late_init_minor() if it is not a GPU device
      drm/msm: rearrange symbol selection
      drm/msm: rework binding of Imageon GPUs
      drm/msm: enable separate binding of GPU and display devices
      drm/msm: make it possible to disable GPU support

 drivers/gpu/drm/msm/Kconfig                       |  59 ++++--
 drivers/gpu/drm/msm/Makefile                      |  31 +--
 drivers/gpu/drm/msm/adreno/adreno_device.c        |  39 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c          |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c       |  13 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c           |  35 ++--
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c         |   9 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c          |  13 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h          |   2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c         |   2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c          |  17 +-
 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c |  12 +-
 drivers/gpu/drm/msm/dp/dp_debug.c                 |   4 +
 drivers/gpu/drm/msm/dp/dp_display.c               |   6 +-
 drivers/gpu/drm/msm/dsi/dsi.c                     |   4 +-
 drivers/gpu/drm/msm/hdmi/hdmi.c                   |  13 +-
 drivers/gpu/drm/msm/msm_debugfs.c                 | 222 ++++++++++++----------
 drivers/gpu/drm/msm/msm_drv.c                     | 203 +++++++++++++-------
 drivers/gpu/drm/msm/msm_drv.h                     |  34 ++--
 drivers/gpu/drm/msm/msm_gpu.h                     |  71 ++++++-
 drivers/gpu/drm/msm/msm_kms.c                     |  41 +++-
 drivers/gpu/drm/msm/msm_kms.h                     |  46 +++++
 drivers/gpu/drm/msm/msm_submitqueue.c             |  12 +-
 23 files changed, 550 insertions(+), 342 deletions(-)
---
base-commit: 8f5264d302e803e7ef82a61f9632a0d2ef67413f
change-id: 20250411-msm-gpu-split-2701e49e40f0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

