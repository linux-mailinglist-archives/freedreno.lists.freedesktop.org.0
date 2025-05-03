Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABA6AA7F09
	for <lists+freedreno@lfdr.de>; Sat,  3 May 2025 09:17:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 128AA10E1BA;
	Sat,  3 May 2025 07:17:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="USQTKPJB";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAD9210E338
 for <freedreno@lists.freedesktop.org>; Sat,  3 May 2025 07:17:07 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5436xE04011261
 for <freedreno@lists.freedesktop.org>; Sat, 3 May 2025 07:17:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=hNcb6Gt2GU+K2Wi4MQP5kS
 7q72CjyKeIq2SG9MvFUcI=; b=USQTKPJBPplgMjd97YJLDJckRumEbguqRAhtHB
 9BrkHmawrsgkpLKvkPlk2nuyzZp92z9+9k+B/gqYLT8KZUJZpDVA1ih0uUEEqQ16
 LhOR8vborCjdH1/nbJi14vL5kMQ/5J9OizSZHSeunjCW03aPWjNZVsVpmMVVKOa2
 iNnfeDLBEA00KDOK5de+yVIAa7Q0mfHN5XMdHJ9rGrz2KhGqZFFciPnd1MqHdwnC
 sV2iYtK/GwmR9V+HNqbZskLD0oNaFjJifNVVN688Dpzb3L7clDw7W1CDgTcKWEar
 4diYZY5cBUEFLvz3HQzIRtOLCLnoO97c7KJkXQDRKJwanNjw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46da3rratn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 03 May 2025 07:17:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c95556f824so269983685a.2
 for <freedreno@lists.freedesktop.org>; Sat, 03 May 2025 00:17:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746256625; x=1746861425;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hNcb6Gt2GU+K2Wi4MQP5kS7q72CjyKeIq2SG9MvFUcI=;
 b=tfbp8JiqnUQcIxJT/RDekJA4bcrFjwmmLc5bWGkWa3/r4/rz+hv86lKK7dAXOAJIf0
 H4+NOWU2R1Sg1SHBv/R7KnvohhCAFQkLuy9g/DQ3MpXMsXE4Z3Z+D0QTq0edORhnsvrA
 PVkZ8J7xci25XAtl131cz0R9HDPLWqGFaLWZ9DS/oTLcOA+Lku9hHvXwB5KPQIa4DEag
 a76ZB5hLen0QTwRtFrMJlPYPDCQjnfFul9VWjjB9CqO5O+J+rJ3phvEROmLCa9uNbvch
 +r9X8QvRAEoiwAXe4/WSxHnNm30DE9lvdmw6+HA0AG01ijJJ4bng8ewJp1sxFdfnjZjW
 G4Vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVK4BQ507ODnsio57/SVn/YgMZYcFJ6BOVwC3qC8SC4P2tBr2umTMAQJbiMcQVL1wHkgL+f28TA3HQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwweW/WG4+AOEWTUn6mppcpZfqKKzkGRWX9fEXInpgU2ARdtx+Q
 H/KYRod2zoCSBRHxgOinaapf2XGrZGAsf4ZNWyo7Q80C1zNwi1oxI4vMcbnc/BGewjWZ5fvKIbh
 dhPMJtRckqBkVXSHuJd7P8rJFNOQqLv1g65K4rJYBN8q4aXfHW8HvFC+Z5uEoHzQ75PIB0UnWPX
 k/EA==
X-Gm-Gg: ASbGncs2V8CHHgIv+714EywEQ+/+s+c3oz2+BLqrCl/3GKtTlwmkgP6E+FhA3cKBqIX
 mg2nT3XPfAZ6u43D1U7UUdrRzq4Nv6Gd6//abMl95WIuftZWzzYbYJpos6MwBpShI7lWJwSIT85
 MvxwCYDeY4SxbszU8WWUvAFVVVVglwKK+Qnp3m4nVoJ8ee1qpQTDeQZz1bvlypHvFUuKVp9Keod
 rmUejRgsPtjT87zP2YeFaUjRqUf1O2jlGCLVK4RtYnuP22YIzaRUcxzd48flwzHMbJ7oASrMssc
 qztLXnv7ZraTap3U4lPkytH4uYYBQXNRWopSz6vcYIbHWRxU7b2SDoV7B95tpXDZFhrksxeuex6
 ZAoD0dZ88QKJ98XdrTNGITLBH
X-Received: by 2002:a05:620a:4711:b0:7c5:3e22:616e with SMTP id
 af79cd13be357-7cae3b05993mr23304485a.56.1746256625526; 
 Sat, 03 May 2025 00:17:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzZAh6r7yk34zBACICarYn+7ksNe9H7A/jXSfVMrZqR4QFbAiT+CavYkAqQqGM9qu4e0Vd/A==
X-Received: by 2002:a05:620a:4711:b0:7c5:3e22:616e with SMTP id
 af79cd13be357-7cae3b05993mr23301485a.56.1746256625139; 
 Sat, 03 May 2025 00:17:05 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94c5557sm692816e87.84.2025.05.03.00.17.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 May 2025 00:17:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 00/11] drm/msm: rework the ties between KMS and GPU
 parts of the driver
Date: Sat, 03 May 2025 10:16:59 +0300
Message-Id: <20250503-msm-gpu-split-v2-0-1292cba0f5ad@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOvCFWgC/13MwQqDMAzG8VeRnBdpaqdsp73H8OBc1IK12qhsi
 O++Tthll8A/8P02EA6WBa7JBoFXK9YPMfQpgbqrhpbRPmODVvqsDBE6cdiOC8rY2xl1oYjNhY1
 qFMTNGLixr8O7l7E7K7MP74Nf6fv9SdmftBIqJMp0Yx455XVx8yLptFR97Z1L44Fy3/cPq4nWm
 LEAAAA=
X-Change-ID: 20250411-msm-gpu-split-2701e49e40f0
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3290;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=zpaWzihcAkuFU7mOqkmcCp0zLATW5X8ucLZXXq16CRE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoFcLs8czfk2fFmfLywbFlWfcNnIy7EbvZg8VT8
 /qJGFPSEjuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBXC7AAKCRCLPIo+Aiko
 1ezOCACf61qvE4g158ByABGSe5jNgTEE03FziSvWkgJ8Q6a1kEDquwUWSM+kLn2Fw082s/18auQ
 GaFv7xvox6sh1/lYH9wKmeBMHF1XdEjN4mUVzdN9C9ex6tltonKwfXNMtTH3WT9XPC5awHbif9P
 kfdavGnHZjbnmaqkVMCrpy/GQ7z+QNgjvZXlPTd+ymoDjeFiyCgYZSpwFknfPo0/Ob838jBaZ7H
 soAlQGItpaUhPixnN45BHGXaM18QwU+56sKMJHMgTmqKP/rsj+1xFT4280eDV/087Nag/YvVebH
 EYwuNOj2xV9kWyrdDW8W22TeY14O4EuXGWQFqCfnRrc6ik5Q
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 9cIuz0gm6DFb8gF7Fu4BMVDLBiH1aM47
X-Authority-Analysis: v=2.4 cv=cpWbk04i c=1 sm=1 tr=0 ts=6815c2f3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3aS5ecUQXdRO32CnfYUA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 9cIuz0gm6DFb8gF7Fu4BMVDLBiH1aM47
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDA2MSBTYWx0ZWRfXzgNf6WGemW6B
 llwdhoArcbtmRnuBKkvKybNxCSUZ4qUFv0h1B3lFwKN6LPfqW2OAA4FFrGBCaNPkEwb00fCghU9
 6l6nljmfp5WxMqu6TKQ23HaEptyOoGuRFDEfYST54bgVyazKQYuCmPtmXik22RDxaY5plpBmRvo
 gr+5tskeBWo2V+9a7UrLMvg/VTG+8R7wlSfxGczrixc1p8D3hfjQlwKpqM9aYd+AofQVPrlId/X
 jhqHjB/+xEgbLYzbXKD1ZEfoZikc1v1Mz5KB3Uz71aFXz00ppTULAgJliPlQRh5gaczzv18Ow+/
 aTAIgh6s2GpZaukpaKZPttlo/P7zyVu90gTvTTHE8yARm3vMBZy9tN/gXlUSnwAFrAd/JhK9B4j
 UhNto4N3RKcXiJI6ZmeNLOs+PQPqapsmfVH4N8dzc/0CcNjIwMSb5SQVkJX9UVdlEKGcPpqY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505030061
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

 drivers/gpu/drm/msm/Kconfig                       |  54 ++++--
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
 drivers/gpu/drm/msm/msm_drv.c                     | 205 +++++++++++++-------
 drivers/gpu/drm/msm/msm_drv.h                     |  34 ++--
 drivers/gpu/drm/msm/msm_gpu.h                     |  71 ++++++-
 drivers/gpu/drm/msm/msm_kms.c                     |  41 +++-
 drivers/gpu/drm/msm/msm_kms.h                     |  46 +++++
 drivers/gpu/drm/msm/msm_submitqueue.c             |  12 +-
 23 files changed, 549 insertions(+), 340 deletions(-)
---
base-commit: 37ff6e9a2ce321b7932d3987701757fb4d87b0e6
change-id: 20250411-msm-gpu-split-2701e49e40f0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

