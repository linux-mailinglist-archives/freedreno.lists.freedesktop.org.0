Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B1DB82CDA
	for <lists+freedreno@lfdr.de>; Thu, 18 Sep 2025 05:51:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD92D10E02E;
	Thu, 18 Sep 2025 03:51:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="X3y7Y/dJ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89A4310E17A
 for <freedreno@lists.freedesktop.org>; Thu, 18 Sep 2025 03:51:16 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HGOHLi029779
 for <freedreno@lists.freedesktop.org>; Thu, 18 Sep 2025 03:51:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=le3hcgVXjn8geHN7AQBsWT
 xvYkhBX1Lcw++MHyY4VEk=; b=X3y7Y/dJmEZaNlp4uMoE94qP3P2nxCu4BepXJf
 jfFi5ZXwIn+PxTpvLMGPRR8ChVjwwRK89iHg7gk/nbqo2V7DyZnzzfxDIaMIwrR8
 Fi75ZKd/Wr3c6y18aHk68+dlqxa1dG8Ms/Jzw/sSHpmIFDC8Smeu+RCsZMAp+Edi
 9zsbGXrXjpqkU/33HRcuQh0CUpGVihxATJXdYuWGdTMQN8KQK3S3yt38VPXExaSL
 +GCg3M4QeBnT6/I+a19Yq/6AY8ajkWoKk4EScTshkYivX2pn2u8Dr9LOxQlR+Ug1
 aOFmf6/cFd9hW802oVa+Rol2o3x9L+1p7U6eTVCUhkpmH9Vg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy0vry5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 18 Sep 2025 03:51:15 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b49715fdfbso16359191cf.2
 for <freedreno@lists.freedesktop.org>; Wed, 17 Sep 2025 20:51:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758167474; x=1758772274;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=le3hcgVXjn8geHN7AQBsWTxvYkhBX1Lcw++MHyY4VEk=;
 b=Gug/0PxTxmhbXtXG/NRzZbcBgvthiLw4hFSDaA/wVrgJCv75zjuFfjeHhLmrU75w5f
 +4EmzAYuzLtXyJATgyDTTh8cuDEWBad5R1tv1kH6309UkXyfwy9UojNgTnEqgh0kzkfO
 KqzOWmurIoiXVtwCY6R7UShCwYYb4/XPsezpbcI6T4Y/m27+rYCeVM3xjsxiNT6coBa3
 xDFHcdpsqOt7WVMLs63Fc5ZwxK+KqVN3Zli1uXr/wddJt28N/G0J0KKXOpKdWikokHAu
 G9b9xm8kLo6MXTbtbng+hM0NLiQLbeYSUEZNU1Wj0tF0wrCli0xNiZcUMqhH5x93JRax
 sjwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUn7SDd3xSzadBWb/S0ImcXo2nZDFahd5q7yL0vN+LHOH15bpYNHdUEKeE68jD7bAj/gLIxgX9f2uo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YysohtL9bI6ztY5hQbza6CGCYHfhDtwn0vrCVz7p5yOr1pxhgIE
 t90mpc0VsOe/n/8agqgLrMvdu30t/ji43UTLJ6pePFW+OKUqRl7SOl0rdxUBfsdxdmV5cH1SB81
 vh3M8SbcsKn7JgWv5P3bFGkzpBhCANyAt1nmUX3+muGF+DjBDNBbldWJOJxL/LJNi/KwUDDA=
X-Gm-Gg: ASbGnct2p9ALJgUO6J5r540FLeIL7NzPngTvDH1KSYONQju7w6dAiDNPtuwAoLSq8qD
 KyD5JPwOYwIBVvMDVqu3uw8Lu3GZQmkQYWTSun6bNCV/bAsF8zkGeq9jVMu3G+OmDt4LS5FKcFV
 ycDFvefCXC78Lko2WH1/7SDhMOBPk4HAX3JjRgReiaed6YAM+1+Cy8yltfUCVlwwBOoS80xG560
 VvhuxwiBkNcJgBIidTr0R954rAYXLnAElmDFH7kN8WMfqs5LLxcEI4aXHjMewx974W8x+e4SddG
 IXfiimQbEXjvYTUXCszi6Bwefm0eDftV90krePcOzNfat+5fw/JIS3xflv2MtTNGClKqF078G/E
 LI5J/AM2URtt1Y78Qdl6mWZnEqDxG+hlu/Iu23So+XK/sIOcDLNfC
X-Received: by 2002:a05:622a:410a:b0:4b7:aa31:3c54 with SMTP id
 d75a77b69052e-4ba6d819d77mr56422751cf.55.1758167474431; 
 Wed, 17 Sep 2025 20:51:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHk+JT0nmGXpYlGzcsiZnvebGGF+RyXL6mJsOObPCr7jEILfS/0AWa9sVdxR5sxI5O0qDmEZQ==
X-Received: by 2002:a05:622a:410a:b0:4b7:aa31:3c54 with SMTP id
 d75a77b69052e-4ba6d819d77mr56422661cf.55.1758167474005; 
 Wed, 17 Sep 2025 20:51:14 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-361aa38c4f7sm2799911fa.62.2025.09.17.20.51.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Sep 2025 20:51:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5 0/5] drm/msm: rework the ties between KMS and GPU parts
 of the driver
Date: Thu, 18 Sep 2025 06:50:21 +0300
Message-Id: <20250918-msm-gpu-split-v5-0-44486f44d27d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH2By2gC/3XPwQrCMAyA4VeRnq0kaWs3T76HeNhqqgXn5jqHI
 nt3O0GUqZfAH8gHuYvIbeAoVrO7aLkPMdSnFGY+E+5QnPYswy61ICADGlFWsZL75iJjcwydJAv
 IOmcNHkS6aVr24fr0NtvUhxC7ur09+R7H7UtSE6lHCRJRkdflEpfOrusYF+dLcXR1VS3SECPY0
 xsx8IXQiFBOrizAm2L3B1EfCGZTRCUEOEfO2Fog9QfRb8SCmSI6Ib7UFpzO0lv4AxmG4QEbzZH
 1gAEAAA==
X-Change-ID: 20250411-msm-gpu-split-2701e49e40f0
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3268;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=N12mAH4AEAt7MmcqShE1P3CEHF675u7xLlRmXgGx5Xo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoy4GtJ5eB/xL4gUiMVxXXYJu5iL4TDfPX2/WvQ
 AE2GvhevTqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaMuBrQAKCRCLPIo+Aiko
 1bGaCACrcfl54E/NPTAiqJJvaiIh87+3wEmrZe5uAs+zCxfSkb/1/O3vl7fIMGOxtOchxgYTAqi
 cNlwfhGmodkeo+b5qM/8DyUuYNje1wRgr4VF1LosjPB1sV4b4V6Hju7/mTqEWi6sImMBFvw9BlD
 ce7JM8BemdWIzrE5XQj/DSR4vFIyxU3nCTq54eOx5bz/uUgnm2jA9TxaSS8hBYyevK1Afifm3tO
 MdYoYTOUQ+HZdQ5hNk0qGui7mAGxKRDkdvddYmBm8AgYLvWSwDL/0nUg2iJWiXAM6SRI8NCZQV0
 J2WFGYHxG6s4TooNwqEc5jy2TQwwR2x4k/mFvVXYy/TEtp+h
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: oAM-nv_VemscYF7e4SCHpDBss0njaYsp
X-Authority-Analysis: v=2.4 cv=btZMBFai c=1 sm=1 tr=0 ts=68cb81b4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3aS5ecUQXdRO32CnfYUA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: oAM-nv_VemscYF7e4SCHpDBss0njaYsp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXyBKVm0gr/yHJ
 NnwBJUVGyWqZMkDrlA94QHKwCu7dJZuGD28xvof5iOpTwiYGjehAdkvpiVXVacVhB4o55fmTK98
 sWvNaCoAlYvt0V5RTDk2OHxX49oyxx3fRks1JbM/+jsVRvfSKP2intfo7yrCGd3sWsX0vmAdpet
 0WZ9YADTzmRM4u6CP7rmzY+7ImLGXsCAaleu1h/0bFknkBz4ryJKZMa6qGX7aRhYeAtvqY8Pa6c
 sTKB0G91ivIwVgClcdNXWVDJ6emqDjJGKsAxfsFhBqbP53s6OjHZVQ1ELINcfinQ8KRuEAfMgxj
 i3rhVe/HJYWiNCiFApy+HMDJTu4hQCdyjMFgAioWmVumrBsQwR5WMn5uCtQC7HprEeNV9VutW6F
 qNqpTCVm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 spamscore=0 adultscore=0 phishscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202
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
Changes in v5:
- Rebased on msm-next, dropped applied patches, re-picked up no-GPU
  patch
- Rewored debugfs, GEM VM_BIND and ioctls code to reduce number of
  #ifdef's
- Link to v4: https://lore.kernel.org/r/20250705-msm-gpu-split-v4-0-fb470c481131@oss.qualcomm.com

Changes in v4:
- Rebased on msm-next(-robclark)
- Temporarily dropped the "no-GPU" patch, it will be reposted later
  (Rob)
- Link to v3: https://lore.kernel.org/r/20250518-msm-gpu-split-v3-0-0e91e8e77023@oss.qualcomm.com

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
Dmitry Baryshkov (5):
      drm/msm: correct separate_gpu_kms description
      drm/msm: split VM_BIND from the rest of GEM VMA code
      drm/msm: split away IOCTLs implementation
      drm/msm: split debugfs implementation
      drm/msm: make it possible to disable GPU support

 drivers/gpu/drm/msm/Kconfig           |   27 +-
 drivers/gpu/drm/msm/Makefile          |   21 +-
 drivers/gpu/drm/msm/msm_debugfs.c     |  420 ------------
 drivers/gpu/drm/msm/msm_debugfs.h     |   14 -
 drivers/gpu/drm/msm/msm_drv.c         |  645 +++---------------
 drivers/gpu/drm/msm/msm_drv.h         |   16 -
 drivers/gpu/drm/msm/msm_gem.h         |   10 +
 drivers/gpu/drm/msm/msm_gem_debugfs.c |   96 +++
 drivers/gpu/drm/msm/msm_gem_vm_bind.c | 1116 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_gem_vma.c     | 1177 +--------------------------------
 drivers/gpu/drm/msm/msm_gem_vma.h     |  119 ++++
 drivers/gpu/drm/msm/msm_gpu.c         |   45 ++
 drivers/gpu/drm/msm/msm_gpu.h         |  111 +++-
 drivers/gpu/drm/msm/msm_gpu_debugfs.c |  213 ++++++
 drivers/gpu/drm/msm/msm_ioctl.c       |  484 ++++++++++++++
 drivers/gpu/drm/msm/msm_ioctl.h       |   37 ++
 drivers/gpu/drm/msm/msm_kms.h         |    8 +
 drivers/gpu/drm/msm/msm_kms_debugfs.c |  129 ++++
 drivers/gpu/drm/msm/msm_submitqueue.c |   12 +-
 19 files changed, 2463 insertions(+), 2237 deletions(-)
---
base-commit: 05af764719214d6568adb55c8749dec295228da8
change-id: 20250411-msm-gpu-split-2701e49e40f0

Best regards,
-- 
With best wishes
Dmitry

