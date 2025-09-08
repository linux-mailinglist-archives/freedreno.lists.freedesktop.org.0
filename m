Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E309B486E8
	for <lists+freedreno@lfdr.de>; Mon,  8 Sep 2025 10:27:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7435B10E3F4;
	Mon,  8 Sep 2025 08:27:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZAHkHQUV";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B93B210E3F4
 for <freedreno@lists.freedesktop.org>; Mon,  8 Sep 2025 08:27:24 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587L02Ig017440
 for <freedreno@lists.freedesktop.org>; Mon, 8 Sep 2025 08:27:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=s0HdkjLRf4rWFHG8fw/KFe
 35He2ooBJYXRAeELbJy0Y=; b=ZAHkHQUV78RJbC4YOWYTKrUh+QVpBk/f+3ozph
 +yhCXryjieBw/LUqnJFcpSrRVF9BXt5r262GgEJ2ZHG4u0FlrF3YFpUtw5cJg5OJ
 fCzwyERGFdbEmcBXcw8bM1b2T4VqIU+P3WmwFlxSolWQPIi7cbJXySe6v224Uu0b
 TMHEC5tfNx5j4ic2nwAIFFGhg8SMLc8QkKJLKFkI2/APVG0jxwcYN3I5iCAqJj47
 jMhdXT8PNecCwQH7fF03+99LybjfPGMGi9jKozsKT5eNrZ6h4xBbugGZn7rrQk8/
 2FxSOQoUzyKiXT8Y/zz5lrOfX96Q6cs531yooPLspFldgK0g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj0ku3s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 08:27:23 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-77283b2b5f7so8999054b3a.0
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 01:27:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757320042; x=1757924842;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s0HdkjLRf4rWFHG8fw/KFe35He2ooBJYXRAeELbJy0Y=;
 b=vxocjr48UtGQnHJ20H2azjaekepc0HPxkdXwv+9ErOxnAc1mj9NoZy0utatis9xuPV
 0z4C5tIgbAdA3e70x7Xie/syGOG9NchRMLVWTsEDtj5AqqCkRbokwhvP3+tqRQTfR7YK
 bIficnCEIXG9LqB80Rbpw47PYMSBVypxg8sMQLPK2toSCX9X7soURdc8S3cVzPuYUINh
 jh9nZQs4luJykqzLJ1R9XkrZnKMZXqeuShQWBL/3Itxv6h1mD4qHH9b9Jy725jSZeaDi
 DPoT1bTmx5qZULyVa5FLGAzIhNy/R+1CSQ/3Zo9tJ6nrkJPyvA6mFTMKMrOOn0j8b2ZI
 cndQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxq5NJmg6VbM3ypy7U330VbHBLmTC+fCl3jY27mmrZyQ3Aw//IVHEbPqMccWt6+/8XzjJUlpC/uOI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzgIylveVNr16PSywv1ZTsUIfFg/9HcnadPKWG2H8ivA947B8T5
 2Kwz+KHXS55trr6uAAJTTfxaOiKTJd9g+pEXMjs4gYcQhHnv5Es1qZmgwJ92a1L+FUuWZQB/vPF
 KQeSVqy5Ouiq5UvRDViq7NKjW+NVM/Eht7PoCHIniIGlM5nGT36Vy1S+m6bW2zagOOBExADA=
X-Gm-Gg: ASbGncsji0IXw7s53J7hJxSnGjo0VLKMteVzquyb60dHgV2dGMi/A4YtlG5F6m2oop5
 z4H+BQGgzcxxmCP7w7U9Hl4f5M/3OL8sM4G93l2LDm7HOdIjvJtho+t43ZMGQ73j0P8bRPnsoA2
 zL2Pjn7q4GcW1TcwB45iuzQQmU5qis7n+co5WiCqJwoWTenKNF3Ae5ZMvJguFowiTnYgUBi0vFs
 imBIeNMzzwQVDFpNLAED1EqX4ff7E0e8sSQxXvtPVNcek3r8Q3eAv8FMhmoe4cquALc8mwVETww
 kCaJHUHt5b09LW1Ddn5SUOxusxT0XSupvMExpjdPT7hfuaTxqS6xFEDnfAmIRVii
X-Received: by 2002:a05:6a20:9151:b0:246:3a6:3e62 with SMTP id
 adf61e73a8af0-2533fab6f41mr11097701637.24.1757320041908; 
 Mon, 08 Sep 2025 01:27:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTu6FUJWMDyx42YFJIOanrZsIeCjqwwjeQS99oYxeMrv4GV1H/SJVyxH58y7tccyCgdXQuag==
X-Received: by 2002:a05:6a20:9151:b0:246:3a6:3e62 with SMTP id
 adf61e73a8af0-2533fab6f41mr11097666637.24.1757320041412; 
 Mon, 08 Sep 2025 01:27:21 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7722a26bc9csm29157523b3a.18.2025.09.08.01.27.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 01:27:21 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v2 00/16] drm/msm: Support for Inter Frame Power Collapse
 (IFPC) feature
Date: Mon, 08 Sep 2025 13:56:53 +0530
Message-Id: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE2TvmgC/1WOyw6DIBBFf8XMuhgeiq2r/kfjAhArSS0ISNoY/
 72oq24mOZM7584KQXujA7TFCl4nE4x9Z6CXAtQo3k+NTJ8ZKKYVoYQjMziFwuKc9RExecWEN5L
 VjEI+cV4P5nPoHt3JXs9LtsZzCVIEjZSdJhPbIvGSNMirCvbwaEK0/nu8ksiRzq01bij+b00EY
 XRjVSNELZXs+d2GUM6LeO3iMg/otm37AewTYvPcAAAA
X-Change-ID: 20241216-ifpc-support-3b80167b3532
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757320036; l=3999;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=HOqcvWr0rv3WcAg+DTG1pbJ/S3XKe3NEf3UHxczsHq8=;
 b=tzHepRDApKgq5JJQo9Ne4wWNomu5jVbmaMEEEsd3Ysy12/oclkgRhp6BVffPayXxbWrew0RRl
 ezHC51sUE/CBopYK5qwpNvRerf3JydryUdyrNpeFn1Qtvhe++B9Xv9p
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: dsFNqeQ-kqu4oD3NasM4zaeSeA3PsYoE
X-Proofpoint-GUID: dsFNqeQ-kqu4oD3NasM4zaeSeA3PsYoE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfX+8CF3g/3AAwc
 vhdf/txv6JFszdGop69TlgwJou3dr+d6tPwJbsFZm/bt6bNJVuD7CrMiA8XAFUi/NotekvSsOwR
 NcxlHeTypqTcJQGY1VnX0aNGgPUEBbQ7dC2uAGrnb0NMlJPirV1RaPClQtztfqUEaKQhLjjmCYo
 58dZuJmv9vSoQ37sbbrMvU3ivrOET3tGyDJXfyd7zBlP9rbncy2wnNcjrRDeDhprpWDEnlalU79
 dRlYI9nJHH2vwjVbtwTg2x1jN2osYKlGdvtK3EkFhYUzSfQTiX8TFhsf90hGhH0z5YTSBoalSxA
 wH75AQ3kfN3KbaU0+4Zc/0dTttr9tu5rY9nhyRTFxkkZfdx3YHmxyScKtHi28RJvMmFuzHMUWXI
 Xq/5MEW4
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68be936b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=tVI0ZWmoAAAA:8 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=e5mUnYsNAAAA:8
 a=sLhxGqmu1eV7p1u-_mQA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=-BPWgnxRz2uhmvdm1NTO:22 a=cvBusfyB2V15izCimMoJ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_02,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024
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

This patch series introduces the IFPC feature to the DRM-MSM driver for
Adreno GPUs. IFPC enables GMU to quickly transition GPU into a low power
state when idle and quickly resume gpu to active state upon workload
submission, hence the name 'Inter Frame Power Collapse'. Since the KMD is
unaware of these transitions, it must perform a handshake with the
hardware (eg: fenced_write, OOB signaling etc) before accessing registers
in the GX power domain.

Initial patches address a few existing issues that were not exposed in the
absence of IFPC. Rest of the patches are additional changes required for
IFPC. This series adds the necessary restore register list for X1-85/A750
GPUs and enables IFPC support for them.

To: Rob Clark <robin.clark@oss.qualcomm.com>
To: Sean Paul <sean@poorly.run>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Dmitry Baryshkov <lumag@kernel.org>
To: Abhinav Kumar <abhinav.kumar@linux.dev>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Antonino Maniscalco <antomani103@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: Antonino Maniscalco <antomani103@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Changes in v2:
- Elaborate commit text and add Fixes tags (Dmitry/Konrad)
- Document GMU_IDLE_STATE_RESERVED (Konrad)
- Add a memory barrier in fenced_write
- Move an error print in fenced_write to after polling
- %s/set_keepalive_vote/a6xx[gpu|preempt]_keepalive_vote (Dmitry)
- Add an "unlikely()" to read_gmu_ao_counter() (Konrad/Rob)
- Define IFPC_LONG_HYST to document a magic number
- Add a new patch to enable IFPC on A750 GPU (Neil/Antonino)
- Drop patch 12 & 17 from v1 revision
- Link to v1: https://lore.kernel.org/r/20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com

---
Akhil P Oommen (16):
      drm/msm: Update GMU register xml
      drm/msm: a6xx: Fix gx_is_on check for a7x family
      drm/msm/a6xx: Poll additional DRV status
      drm/msm/a6xx: Fix PDC sleep sequence
      drm/msm: a6xx: Refactor a6xx_sptprac_enable()
      drm/msm: Add an ftrace for gpu register access
      drm/msm/adreno: Add fenced regwrite support
      drm/msm/a6xx: Set Keep-alive votes to block IFPC
      drm/msm/a6xx: Switch to GMU AO counter
      drm/msm/a6xx: Poll AHB fence status in GPU IRQ handler
      drm/msm: Add support for IFPC
      drm/msm/a6xx: Fix hangcheck for IFPC
      drm/msm/adreno: Disable IFPC when sysprof is active
      drm/msm/a6xx: Make crashstate capture IFPC safe
      drm/msm/a6xx: Enable IFPC on Adreno X1-85
      drm/msm/a6xx: Enable IFPC on A750 GPU

 drivers/gpu/drm/msm/adreno/a6xx_catalog.c         |  71 ++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c             | 105 ++++++++--
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h             |  14 ++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c             | 221 ++++++++++++++++++----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h             |   3 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c       |  10 +-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c             |  34 +++-
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c         |  40 +++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h           |   1 +
 drivers/gpu/drm/msm/msm_gpu.h                     |   9 +
 drivers/gpu/drm/msm/msm_gpu_trace.h               |  12 ++
 drivers/gpu/drm/msm/msm_submitqueue.c             |   4 +
 drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml |  11 ++
 13 files changed, 459 insertions(+), 76 deletions(-)
---
base-commit: 5cc61f86dff464a63b6a6e4758f26557fda4d494
change-id: 20241216-ifpc-support-3b80167b3532

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>

