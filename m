Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A189BAB834
	for <lists+freedreno@lfdr.de>; Tue, 30 Sep 2025 07:49:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D76F10E4E0;
	Tue, 30 Sep 2025 05:49:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="M/FmsapB";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D1D410E26F
 for <freedreno@lists.freedesktop.org>; Tue, 30 Sep 2025 05:49:50 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4HW8D024448
 for <freedreno@lists.freedesktop.org>; Tue, 30 Sep 2025 05:49:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=Pb4sLzARJd5B7XzZQvs/kr
 vXg3UPDBK/QIaQV6v0I4k=; b=M/FmsapB4tu6KqzsKB2br2TFDRoxqn5MAPxDgn
 2E5RyC5RHDCRm141Gkikocm2LwPGIs8V1eC4g2aCScNpKsiMMv9StnvPb8FsLpjy
 3UyLTk+9ZQUYJS+LcC6+rm70k6G4ZnhNQucO9FPS/1lqfH25P3/Mnb/ZA4ZAnesV
 WA9TJ90STIFC0wASMV9HcFbmUTF2+cHXidI1fAxj360YwtGdhFZpvhZihCOfKX7b
 MoW2MCuLj9ikUst/3yFE0y9dZKcm8WQDT8xHWycxZvdKaeCsa7FyYrDL+M60JC1m
 U4DnzFDjx+/Cn/aqFw6dkOp/u0evtwyOUN8Pbds9IOFXszfg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e59n04v9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 30 Sep 2025 05:49:49 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-33428befb83so6267282a91.1
 for <freedreno@lists.freedesktop.org>; Mon, 29 Sep 2025 22:49:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759211388; x=1759816188;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Pb4sLzARJd5B7XzZQvs/krvXg3UPDBK/QIaQV6v0I4k=;
 b=PRNZLmUAVBjOHwHbswv4I8QCIdbo5Qvf1/GS4htbrJdzcgmc40X1F4aWbSn1pm7vrx
 pHwGtiwTV4lzSE/g4n/ZbIMh6Wt7PlHwo54ibarKYm0LV17W5FYAH9nqwnyZ9ObQhJhW
 oD5ExYJWKIJ0N7kLWGWhGuK8CNOBedRv85/qAesSe4qEBP7nKzoKjxlu7qx/mAmkhbj2
 PuoNEaKuiQJ9fVufMxi9uIPEbjtCrvYw2Fo90autNiHo2cpL9iN75eailzKCbgJ1b5QM
 8hfG3C35Ik2THVlu0vGFWHE6DOOX6nmQxHtLr53buILSA71Nd1dgc8gtn2GWrrzz4+Ai
 vbIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgs2+GJCRxUew15NCsgkGvA+ySIACBJBjJ1A76ne2sEYDplKg8rig+zcrQvf3tgO5iCCuFly97U+k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzTV1oDU2kM4zfgvoNGicPK+JCsbWb88orBaqwghsQf1xtGI+d7
 E9KHgshDKMMBABiZcRVafuweCfw/sVvpJEFFz8RAC50hfvcJ1goBpNo0ePDglv2A2OO13fXWv2N
 qwJtRTKSdymw2D55fcCuaVPbGyaRL7qhB3Wluct5sud+lvL9EiUmfXx8g8d7RHtfVMMUlxMM=
X-Gm-Gg: ASbGncuoNa/q7KGmNDnfxOu6YwxEgeMdlSnJ1fIlnUrCo2cG45U4X1/bVAnSY8Sc8xJ
 KYxbXxNKIPaJvcDdWMIZQCabMVEWIBCznvrLj1tuDgWoa+6k2D7v00NS8ex3qCX/Xvc4uxsZzOD
 IbXoQeQBFfA1+h90jPcYHh7q1dBh2RX04nslLLtko9gZFBa7d+dkz5xIZcx2jFEFVvVFtRGkFD/
 6KFz2yZsT/EqDlLjMqjhtX5pNef8jVwsUzO1BY8m2wa0LscFIK+crWwxnYdtx2Qp5VbG49qnfpv
 a6fpo4leg0K7cpAZilf8k8xD11hfB7P93xRKgTTjthm5jVzEafo7baoR4fjrdGS5diM9EA==
X-Received: by 2002:a17:90a:dfd0:b0:32e:18fb:f05f with SMTP id
 98e67ed59e1d1-3342a2bed85mr22004241a91.20.1759211388103; 
 Mon, 29 Sep 2025 22:49:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE94h1e81GyuUho3hOpRoy66Of2Qjfb8fh6V3evXvP94fDjZdRApWnY55kzGb2iOYaWRqSQRg==
X-Received: by 2002:a17:90a:dfd0:b0:32e:18fb:f05f with SMTP id
 98e67ed59e1d1-3342a2bed85mr22004194a91.20.1759211387608; 
 Mon, 29 Sep 2025 22:49:47 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3341be23412sm19029779a91.20.2025.09.29.22.49.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 22:49:47 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH 00/17] drm/msm/adreno: Introduce Adreno 8xx family support
Date: Tue, 30 Sep 2025 11:18:05 +0530
Message-Id: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABZv22gC/yWNywrDIBBFf0Vm3QEVCjW/UrKwOkml+KijJRDy7
 7XN8hy45+7AVAMxTGKHSp/AIacB6iLAPW1aCYMfDFrqqzTa4MvaZHEtHbmXkmtDpbxW7rZY5R2
 MXam0hO3fvM8nV3r3kW6nhIdlQpdjDG0SvkaMHDHR1vB3g9Kg0jAfxxcgGqa9ngAAAA==
X-Change-ID: 20250929-kaana-gpu-support-11d21c8fa1dc
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759211380; l=5672;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=Fo6yGEzkiN8eYG7gq04qwtqFSBGkYiT3ZCOWgbqhGrk=;
 b=Jtl6CTtd0UHf6SsKad5aFW2GIGUoFJZUEncA4YV9colT9zAhd5q3JTFVkeq99abCsD55G4UEp
 aoljmlBZ6I/CfOOelsWr4T++9S3FSoCjiZrDiQR0qvbUiVc0N9pUkdM
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: ulJ0QFPwtajawur3gGqjCmLd8sLXXH12
X-Authority-Analysis: v=2.4 cv=O4g0fR9W c=1 sm=1 tr=0 ts=68db6f7d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=qC_FGOx9AAAA:8
 a=o6C-eYizE2q8LWGfbNMA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: ulJ0QFPwtajawur3gGqjCmLd8sLXXH12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwMSBTYWx0ZWRfX+RI1wn90kHT1
 WUOUWTg5vClR5dQq4iYGNtQsGGdmnRJUA1yyyzVvxe0WJPKgQm2ymAoWSglYwHudz/lnG0kMN5S
 NdaBKgWw0DKRSQDLIR4+4y5mlChCm0oobpSNMLRxMSUqSWSUfrM25TBeUBofLFWn3IqJ0nGwECR
 rWSe5UzVL9WiuN6rZd53ih4l96Giinh2gMGtOLeSXjBgQ10fwtw2M7zfjhxs71B8AXtNngvxw2E
 vo4iSWQ/74Es6xXbCUlHTQ8nldANVBSgWEmto7SGYpwDS/JVRvsa6Ub+bgM6sQRFIbPOkY55xwu
 IsFryFdjxu0L16+f4xVNZj+d7yqlaFAKBEG5f+DkOGqQkpM/RWyD1E9GncQgaejzVpqFcBd3Bgo
 Ch9IIiIhU2vE1gk/P02iAFXQgC236g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270001
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

This series adds the A8xx HWL along with Adreno 840 GPU support to the
drm-msm driver. A8x is the next generation in the Adreno family,
featuring a significant hardware design change. A major update to the
design is the introduction of 'Slice' architecture. Slices are sort of
mini-GPUs within the GPU which are more independent in processing Graphics
and compute workloads. Also, in addition to the BV and BR pipe we saw in
A7x, CP has more concurrency with additional pipes.

From KMD-HW SWI perspective, there is significant register shuffling in
some of the blocks. For slice or aperture related registers which are
virtualized now, KMD/crashdumper has to configure an aperture register
to access them. On the GMU front, there are some shuffling in register
offsets, but it is manageable as of now. There is a new HFI message to
transfer data tables and new power related features to support higher
peak currents and thermal mitigations.

Adreno 840 GPU is the second generation architecture in the A8x family
present in Kaanapali (a.k.a Snapdragon 8 Elite Gen 5) chipset [1]. It
has a maximum of 3 slices with 2 SPs per slice. Along with the 3-slice
configuration, there is also another 2-slice SKU (Partial Slice SKU).
A840 GPU has a bigger 18MB of GMEM which can be utilized for graphics
and compute workload. It also features improved Concurrent binning
support, UBWC v6 etc.

This series adds only the driver side support along with a few dt bindings
updates. Devicetree patches will be sent separately, but those who
are interested can take look at it from the Qualcomm's public tree [2].
Features like coredump, gmu power features, ifpc, preemption etc will be
added in a future series.

Initial few patches are for improving code sharing between a6xx/a7xx and
a8x routines. Then there is a patch to rebase GMU register offsets from
GPU's base. Rest of the patches add A8x HWL and Adreno 840 GPU support.

Mesa support for A8x/A840 GPU is WIP and will be posted in the near
future.

[1] https://www.qualcomm.com/products/mobile/snapdragon/smartphones/snapdragon-8-series-mobile-platforms/snapdragon-8-elite-gen-5
[2] https://git.codelinaro.org/clo/linux-kernel/kernel-qcom/-/commit/5fb72c27909d56660db6afe8e3e08a09bd83a284

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Akhil P Oommen (17):
      soc: qcom: ubwc: Add config for Kaanapali
      drm/msm/a6xx: Fix the gemnoc workaround
      drm/msm/adreno: Common-ize PIPE definitions
      drm/msm/adreno: Create adreno_func->submit_flush()
      drm/msm/a6xx: Rename and move a7xx_cx_mem_init()
      drm/msm/adreno: Move adreno_gpu_func to catalogue
      drm/msm/adreno: Move gbif_halt() to adreno_gpu_func
      drm/msm/adreno: Add MMU fault handler to adreno_gpu_func
      drm/msm/a6xx: Sync latest register definitions
      drm/msm/a6xx: Rebase GMU register offsets
      drm/msm/a8xx: Add support for A8x GMU
      drm/msm/adreno: Introduce A8x GPU Support
      drm/msm/adreno: Support AQE engine
      drm/msm/a8xx: Add support for Adreno 840 GPU
      drm/msm/adreno: Do CX GBIF config before GMU start
      dt-bindings: arm-smmu: Add Kaanapali GPU SMMU
      dt-bindings: display/msm/gmu: Add Adreno 840 GMU

 .../devicetree/bindings/display/msm/gmu.yaml       |   30 +-
 .../devicetree/bindings/iommu/arm,smmu.yaml        |    1 +
 drivers/gpu/drm/msm/Makefile                       |    2 +
 drivers/gpu/drm/msm/adreno/a2xx_catalog.c          |    8 +-
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c              |   50 +-
 drivers/gpu/drm/msm/adreno/a3xx_catalog.c          |   14 +-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c              |   52 +-
 drivers/gpu/drm/msm/adreno/a4xx_catalog.c          |    8 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c              |   54 +-
 drivers/gpu/drm/msm/adreno/a5xx_catalog.c          |   18 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |   61 +-
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |  284 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |  233 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |   25 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  389 ++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |   24 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        |   18 +-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c              |   53 +
 drivers/gpu/drm/msm/adreno/a6xx_hfi.h              |   17 +
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c              | 1237 +++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_device.c         |    4 +-
 .../gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h  |  420 ++---
 .../gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h  |  332 ++--
 .../gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h  |  470 ++---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   35 +-
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml      | 1942 +++++++++++++++-----
 .../gpu/drm/msm/registers/adreno/a6xx_enums.xml    |    2 +-
 drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml  |  283 +--
 .../gpu/drm/msm/registers/adreno/a7xx_enums.xml    |    7 -
 .../drm/msm/registers/adreno/a8xx_descriptors.xml  |  120 ++
 .../gpu/drm/msm/registers/adreno/a8xx_enums.xml    |  289 +++
 .../gpu/drm/msm/registers/adreno/adreno_common.xml |   12 +
 drivers/soc/qcom/ubwc_config.c                     |   11 +
 include/linux/soc/qcom/ubwc.h                      |    1 +
 34 files changed, 4890 insertions(+), 1616 deletions(-)
---
base-commit: 09c49a960070d0cdf79a593f3cccb830884f4c76
change-id: 20250929-kaana-gpu-support-11d21c8fa1dc

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>

