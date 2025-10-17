Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00014BEAFE5
	for <lists+freedreno@lfdr.de>; Fri, 17 Oct 2025 19:09:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62E8C10EC9E;
	Fri, 17 Oct 2025 17:09:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oHgOEreW";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 300FB10EC9E
 for <freedreno@lists.freedesktop.org>; Fri, 17 Oct 2025 17:09:00 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59HGlDk2010061
 for <freedreno@lists.freedesktop.org>; Fri, 17 Oct 2025 17:08:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=T/pxneW0GGPQT6fV2Oc8q6
 PoK83hK+J2n9XaZIObRAU=; b=oHgOEreWy24QFTZlUVBlwmW5OvR3dOWoGq6HKh
 293zIN+SJWqTOH2lWYOMklnmI6WCEXhlDc4cjn45WBhMx0woO6FPQfROKrNkbg+H
 HybTX3igTgms2DN/c3pXqKh/KG6TKjDevjYChtsF7fkI/rxgvcJWsDOMhL0Wk0iZ
 JZbENgUGB0W3YE1JgD4r1hGsqWm+q7PBMDfL5HdY/UjZTucmMsIwC27n8WeAmpwb
 vrtHMW4JMknXEsJSD0rMIBdUkllJp957fKMTan4oiBA3HHnzGW9KUbS4l88BmE0g
 DRI3Tlh9T5q141HcMgY+FyTUJ0Lk4m3EZyLNmTyRJUyFTXVw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0ccx6q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 17 Oct 2025 17:08:59 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2697410e7f9so53746955ad.2
 for <freedreno@lists.freedesktop.org>; Fri, 17 Oct 2025 10:08:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760720939; x=1761325739;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T/pxneW0GGPQT6fV2Oc8q6PoK83hK+J2n9XaZIObRAU=;
 b=NsQF6/CZIdEqqItxDbfHPGpbDkOQmksmcdKkubiR+2dTKrBwVqzacrny8SlWJTlwlF
 wAHRwmrW3awr5IOb0jGqDagiYe32wJk4eSd+L412sCL3Z0scFfjmvfxs+PT1YWSBY0E8
 TyRf7v+NZSC93DrKdo6cDEp9JM9zhWZAIId2ArI7jCDh8kYChf/e4PKpaJ3oSj6MnqJB
 JZytwxCDw2PtLeGUX4ZYGkDyfTYiB1C4JNzpZ5hN3FPJ36LFbuzBjmurQ0/dS5TZ7zZo
 wc3tlVfPBzCS57qAOG8CzWnojMuVhrmJOb+nrxm4KiJdjMeoVjxiL+0VuACjvxkkII5n
 nPKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaqw9RiJCv2QweMm0/y3bXxLg8BBN2iyKpZDI/+Raqcp8qV9uhdjkb2IADDQdPuNmjwySygcOTL7g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywj6fwYnalkvuYveTQAFA2vMGbW0d30+dloU6Qkie6q5nYu478V
 0RG8MawsWEG+ZS9kL4Oe0zM/1/UxRdCTFgu/nyiIPaB8n5MwOboBnQyfKyi4Mak8qUWnMFyh7vW
 s94AeCWDDoR1ofFON6B2MnHVBN0A+fVS/9yEQfKIaDNYpWfIOAdn2NaeETpDrSom9PpwjQ2E=
X-Gm-Gg: ASbGnct/DWcF/zRC0ihIC0xgD1laagJk/zhGqsOmk3Cau5aVdJhp3d45JTM1SKCU8Gv
 +H4Bp7Bfu+Kcit7KSCBzK68zMMlAFzgcoRN3NvCS65KKKVk0FOpx+X8I8s3USlDXE+QYjmZM7qm
 1IxllUbzPMi7N6PeKwou/G40HRsHIdX6IPqXE30C7tySa33RZH+CSeIdyIbh0spcomxaa9lyRo3
 Fp2g3a5fPfEGl0SYwJwiCt0yG9xQSJjoATFsSw7Z+7UG3IMZJD3uqwY/FxJ26c8q2nfe9ovaeMU
 QD7NFuseXsHyiXhmVI+70DNKc3g7i5DHNWHI8dDKIzrHiWPF/f0EgUSLnEqjc4Ctko+CKP17i/a
 Q/WhKUNQi4lMmAVLYL3WSRXw=
X-Received: by 2002:a17:902:d4c4:b0:26e:7468:8a99 with SMTP id
 d9443c01a7336-290ca121e99mr59640135ad.36.1760720938713; 
 Fri, 17 Oct 2025 10:08:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+KFNhG5PcZbke3N7Al16y0Yp79mNDUlOZzFtifVQr0J9r+kCgoWT/WU7gFhlnqZFx5kLQEw==
X-Received: by 2002:a17:902:d4c4:b0:26e:7468:8a99 with SMTP id
 d9443c01a7336-290ca121e99mr59639625ad.36.1760720938250; 
 Fri, 17 Oct 2025 10:08:58 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-292471febc6sm173625ad.86.2025.10.17.10.08.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 10:08:57 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH 0/6] Support for Adreno 612 GPU - Respin
Date: Fri, 17 Oct 2025 22:38:28 +0530
Message-Id: <20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAx48mgC/yWMQQqDMBBFrxJm3SlJaES9SnFhktHOwqgZlYJ49
 4a6+rwP750glJkEWnVCpoOF51TAPBSET59GQo6FwWrrjDYO1yBVGVk4oUWKL+d1JN80NRRnyTT
 w9997dzdnWveS3e4TfC+EYZ4m3lp1VE9TYw4Guuv6AffKjguMAAAA
X-Change-ID: 20251015-qcs615-spin-2-ed45b0deb998
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Jie Zhang <quic_jiezh@quicinc.com>, Qingqing Zhou <quic_qqzhou@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760720932; l=3877;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=TBtnh6miwgQv8qy4YxihSPZwnvBgSc+1qmJKsqgsLRw=;
 b=4vlqn1FI+5GLuRp7hEPEMU6tpBGe/cYZpbh7e15CysO9nwiTDdXKs7XfOcCbNDUQ9lpt5zfyz
 vOTIQvH0kErDs3BQI8ITy1aMbf68szIQY7oWYSlrtjxsDwvqSv8bPxn
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: -4YWIO3k344fHzpGSMTC7h1_POgZotYq
X-Proofpoint-ORIG-GUID: -4YWIO3k344fHzpGSMTC7h1_POgZotYq
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68f2782b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=tVI0ZWmoAAAA:8
 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=e5mUnYsNAAAA:8 a=vemyJuc05ARF21wryp8A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
 a=-BPWgnxRz2uhmvdm1NTO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfX9RlL0PMv5WDb
 6tYrE/j9n5XOnmJuvl1Z70o+00jBL4+L+gQq8Hw4K8f79xRC2t3oR0pyUxuewdfWMRlgtu4KbxQ
 dEUc7vKWgQQaINs7X8EeCZjhD4JKxKHVjdasDk4Ge0guqXrv2PTQDFSWxgancPoh9ECqcs5iFYc
 F7RCt8Qe17I3DeG/Phsi9bxhkgpLc4gLorbqY/2ddHPiNTqkfBFWlDuiUeGu81O+vzjr9w5FJFS
 gDfjRhhxEoYCHZcC6kU9771dbAjBySDpEZGKB1mxkYb28YJRoOs0Tl9SjRsPMhmigIgPgiNq0s7
 3SquuhC1Qcr6PWVz5/b8/U5YEs9aK0HR052vIFhLSqwuigQWeK1rNzCzjHu00UX7BNK7AVlHbFX
 +xL6n9VwntHvafWoysat+Jhuh8+GVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022
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

This is a respin of an old series [1] that aimed to add support for
Adreno 612 GPU found in SM6150/QCS615 chipsets. In this version, we
have consolidated the previously separate series for DT and driver
support, along with some significant rework.

Regarding A612 GPU, it falls under ADRENO_6XX_GEN1 family and is a cut
down version of A615 GPU. A612 has a new IP called Reduced Graphics
Management Unit or RGMU, a small state machine which helps to toggle
GX GDSC (connected to CX rail) to implement the IFPC feature. Unlike a
full-fledged GMU, the RGMU does not support features such as clock
control, resource voting via RPMh, HFI etc. Therefore, we require linux
clock driver support similar to gmu-wrapper implementations to control
gpu core clock and GX GDSC.

In this series, the description of RGMU hardware in devicetree is more
complete than in previous version. However, the RGMU core is not
initialized from the driver as there is currently no need for it. We do
perform a dummy load of RGMU firmware (now available in linux-firmware)
to ensure that enabling RGMU core in the future won't break backward
compatibility for users.

Due to significant changes compared to the old series, all R-b tags have
been dropped. Please review with fresh eyes.

Last 3 patches are for Bjorn and the rest are for Rob Clark for pick up.

[1] Driver: https://lore.kernel.org/lkml/20241213-a612-gpu-support-v3-1-0e9b25570a69@quicinc.com/
    Devicetree: https://lore.kernel.org/lkml/fu4rayftf3i4arf6l6bzqyzsctomglhpiniljkeuj74ftvzlpo@vklca2giwjlw/

To: Rob Clark <robin.clark@oss.qualcomm.com>
To: Sean Paul <sean@poorly.run>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Dmitry Baryshkov <lumag@kernel.org>
To: Abhinav Kumar <abhinav.kumar@linux.dev>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Akhil P Oommen (2):
      dt-bindings: display/msm: gpu: Document A612 GPU
      dt-bindings: display/msm/gmu: Document A612 RGMU

Jie Zhang (3):
      drm/msm/a6xx: Add support for Adreno 612
      arm64: dts: qcom: qcs615: Add gpu and rgmu nodes
      arm64: dts: qcom: qcs615-ride: Enable Adreno 612 GPU

Qingqing Zhou (1):
      arm64: dts: qcom: qcs615: add the GPU SMMU node

 .../devicetree/bindings/display/msm/gmu.yaml       |  98 +++++++++++---
 .../devicetree/bindings/display/msm/gpu.yaml       |  31 ++++-
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           |   8 ++
 arch/arm64/boot/dts/qcom/sm6150.dtsi               | 139 ++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |  16 +++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |  87 ++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 143 ++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |   3 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |   1 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  16 ++-
 11 files changed, 511 insertions(+), 32 deletions(-)
---
base-commit: cb6649f6217c0331b885cf787f1d175963e2a1d2
change-id: 20251015-qcs615-spin-2-ed45b0deb998

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>

