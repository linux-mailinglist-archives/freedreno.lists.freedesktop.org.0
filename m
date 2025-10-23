Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 932D2C014C1
	for <lists+freedreno@lfdr.de>; Thu, 23 Oct 2025 15:16:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A058D10E900;
	Thu, 23 Oct 2025 13:16:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CUTK7RzH";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB34810E032
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 07:54:57 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MKNB23022116
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 07:54:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=6Lbr2daX8xkF/1kS4qxmCLzZgVGCm7zt4oN
 vPQplLYA=; b=CUTK7RzHp3zeSX64hdZf5pRkit27f6Fg3hvjQ6pwjahf5nJU0Q3
 866HSTqEP/KN7IfKDfzodGaeuNyi38HOGKfYqQ4ecalAgRy47PeSI/PkFcTHMUA0
 7TXNc+Mng4TqQuvTTx2xM7+CJf4d0JgPI60MrQJEeTFYjqTCxYI78Yq8op3tUkVG
 /dDtySRATizJW21IpdsxmE+/GuVGGyLkwXuD254m4RR4RaGU8OFc5V15iorQ7EkK
 fTFWis5TCqSgLoSvuxidR+mtX2iAaC22V2hH5bBo+YrL4N5gO0bYYX8O6bwJ/H+C
 YuQo8M4xeo6275K29vqyip7fSC0twyy0aug==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y67qhfs1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 07:54:57 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-33baef12edaso539755a91.0
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 00:54:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761206096; x=1761810896;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6Lbr2daX8xkF/1kS4qxmCLzZgVGCm7zt4oNvPQplLYA=;
 b=n9dHJ7C7dwQWIV1/3aKA3nWKsaN7A7U1NBOQZ8td6zWdWfGeF6Q/VmnqeP6Hu7gUca
 B2xeI8DDIxlEyqbAs74bHzZLkqqzK7OkpjPj+J9TXUJCZFikcacXzx4JA21RhgU6ITPL
 YVaQYukiyWRDjHtLFeDq3CeRpinH4rlhmaKB/YFryvH39x7xP7kvwDSNk36gEC3k9szM
 rgAEjc7hdpzcN+M1qlymRddjw5Up33GZlefc9AeJEFymG4XvoqM6PclmSWmlKxC2oMFZ
 5EOFZrXQBvrwsB4D/5RJQByaPUheXbRtkHppXDWXq3JCvbjAmfS+SWjeLvo4MlWLtnvo
 zt0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUn02saUF4ftWoG5PYXzs1hzGaYl0o0gDCgdpmjgPqbGqMDe8KxfWXOmm1XbRxcldccRYBy66J7iuw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHczqcor8vuTSVq4FmsnqumEaB/T4+2WvGYpRKeSflQXP+lW6U
 MMHRVeYI0DEoTnrwyQeGSg58Ka8Ygm/C1+Y+WWxtsdaL1hsM5HA/ZfK5IeHvRpNdz2Kls4Y/MWg
 wlpDwVwGc8qFq1yZ2ohzlkw1KrxFOaZkG8MHDM1REYX3COn7CZB/EcLucyM6al1vpTg6z9TU=
X-Gm-Gg: ASbGnct9BVLNF3DtixTIyu4/D+KluG8L/R11JHwzPwrV6xHGerqG9wTxoRWnWvscTx6
 IrL1pFDW+gRdJ/65vbv9I/eDpGoUk/d6FvNj5R1aJ4LNORlo9533Bj/G/dhd/wMzuzWpwFgvi+u
 m13m0xeVTee77SeLmbCdU42GfALzTw8p7A9UmuHv/2afBio1DYBC6TUErqlGSkn31++MGH0jJic
 KAHdDpBbqHakUGU6ghY9ep4EsP1mvMSWtoSOC+8wiwugBh3lgco39U9XeQDzezJexlwLneQz6z/
 tqLdLQdPHZwD8dxKEo4qXztka3BwFt6KwKt3e/qSGxUpYtna0ZQGhHeuGXdJtYna/ICtaeABiVI
 EC1c046uVgCCYVj+eo+XaW+xBMcepFOaOaPScL4im/DL37x4qsw==
X-Received: by 2002:a17:902:f78f:b0:290:af0e:1183 with SMTP id
 d9443c01a7336-290cb65c5e7mr246510575ad.51.1761206096467; 
 Thu, 23 Oct 2025 00:54:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXkPk3uNLjCPJhL0E9s0WI1/sscyOiEu7tjyhLUec8kdLXEBCR1sYQQ35k5N1MZj1grhg5pg==
X-Received: by 2002:a17:902:f78f:b0:290:af0e:1183 with SMTP id
 d9443c01a7336-290cb65c5e7mr246510135ad.51.1761206096039; 
 Thu, 23 Oct 2025 00:54:56 -0700 (PDT)
Received: from yuanjiey.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2946e1231b0sm14371265ad.97.2025.10.23.00.54.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 00:54:55 -0700 (PDT)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: [PATCH 00/12] drm/msm: Add support for Kaanapali
Date: Thu, 23 Oct 2025 15:53:49 +0800
Message-Id: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE2OCBTYWx0ZWRfX8J6mj/9c8KQt
 VQ48ZO8/oIyk8+4j6KfSpRw4ds4PkyRC6wBPNqko7uo1D6vOAKjvT7f+/jgB1L3bMMSgY0af/F7
 4UdryWfp8BlZowLkOa2+aG3Opc7JhkoaePPVxttXLvC+VM61XtQ+mAAbmcL919qmXUGfqMsAAvR
 WnwJ7a+Qfo098HRPdrihYvCOs0hTXEUXxeknDulypdM8Fit9gYKmrUE+WqmjR2bkFobEOpe+F4H
 eMksuXhZDQihiK3hAWCsYuzPpQNRVg8VttROAKsFZs7pCcL2m4MiDtBIMwMRuOhWHfQj6AU3iMl
 o44uNf982Eyd7kS/L0svDoWer8/HfXzJbM0uVhkKn1nDtSs/8H+rqnNk/ql91enMegGwQWfwWd8
 +/1aqakjCzm8NkbDHMA2yJr7jlrYDg==
X-Authority-Analysis: v=2.4 cv=LMRrgZW9 c=1 sm=1 tr=0 ts=68f9df51 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8
 a=6eNNNA5uUPZGPwET1o8A:9 a=iS9zxrgQBfv6-_F4QbHw:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: -OUeNHj7EtdlDhz6xln8B609IrAWAs74
X-Proofpoint-ORIG-GUID: -OUeNHj7EtdlDhz6xln8B609IrAWAs74
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011 priorityscore=1501 impostorscore=0 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220168
X-Mailman-Approved-At: Thu, 23 Oct 2025 13:16:01 +0000
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

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

The Kaanapali MDSS has some differences compared to the SM8750 MDSS:
- DSI PHY/DSI base address have some changes.
- DPU 13.0:
  - SSPP layout has a great change.
  - interrupt INTF layout has some changes.

This patchset contains DSI PHY, DSI Controller, DPU & MDSS bindings
in addition to the driver changes.

We have already tested the display functionality using the Kaanapali-mtp
device on the Kaanapali branch of kernel-qcom repository.
Test command: "modetest -r -v"
kernel-qcom repository: https://git.codelinaro.org/clo/linux-kernel/kernel-qcom/-/tree/kaanapali

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
Yuanjie Yang (12):
  drm/msm/dsi/phy: Add support for Kaanapali
  drm/msm/dpu: Add support for Kaanapali DPU
  drm/msm/dpu: Compatible with Kaanapali interrupt register
  drm/msm/mdss: Add support for Kaanapali
  drm/msm/dsi: Add support for Kaanapali
  drm/msm/dpu: Add Kaanapali SSPP sub-block support
  drm/panel: Set sufficient voltage for panel nt37801
  arm64: defconfig: Enable NT37801 DSI panel driver
  dt-bindings: display/msm: qcom,kaanapali-dpu: Add Kaanapali
  dt-bindings: display/msm: dsi-phy-7nm: Add Kaanapali DSi PHY
  dt-bindings: display/msm: dsi-controller-main: Add Kaanapali
  dt-bindings: display/msm: qcom,kaanapali-mdss: Add Kaanapali

 .../display/msm/dsi-controller-main.yaml      |   2 +
 .../bindings/display/msm/dsi-phy-7nm.yaml     |   1 +
 .../display/msm/qcom,kaanapali-mdss.yaml      | 298 +++++++++++
 .../bindings/display/msm/qcom,sm8650-dpu.yaml |   1 +
 arch/arm64/configs/defconfig                  |   1 +
 .../disp/dpu1/catalog/dpu_13_0_kaanapali.h    | 492 ++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  44 ++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  29 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c |  89 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 474 ++++++++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |  23 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   4 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.c             |  13 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.h             |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     |  23 +
 drivers/gpu/drm/msm/msm_mdss.c                |  22 +
 drivers/gpu/drm/panel/panel-novatek-nt37801.c |   5 +
 include/linux/soc/qcom/ubwc.h                 |   1 +
 21 files changed, 1507 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h

-- 
2.34.1

