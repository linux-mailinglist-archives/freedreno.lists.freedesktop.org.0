Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA97C83875
	for <lists+freedreno@lfdr.de>; Tue, 25 Nov 2025 07:48:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA62910E34C;
	Tue, 25 Nov 2025 06:48:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="irHJg6WD";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AijA0Ohy";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8813C10E348
 for <freedreno@lists.freedesktop.org>; Tue, 25 Nov 2025 06:48:23 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AP2gebq2148640
 for <freedreno@lists.freedesktop.org>; Tue, 25 Nov 2025 06:48:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=dYOLaJjZrmBTHo4tXaOJpcaKaQKHs0XP9i2
 DnE5mRI8=; b=irHJg6WD7cntxoKTNohfvDV4zyRu0DBDOQPFKb8UwalMUrsB+LO
 /Eug3cKOk+ulkjhssTjJ2KuPwvIwdwp9TwNWNEwCn02fyfG+j/bJtkMOmLRjqPXl
 IQ4mSbmA+TGaFv99Tnt0iu7GP23kIj6zd2asjagicIcKCyQJxxf0DF7a0u4uUJ0e
 fUw6KlwkcexO0bNXVFcTj6RJ6acBzPnT2Htpq0UrV14vnNEXMAS0YqrySRgtCzAN
 OUisu0XkPJ2lXchwbho3b/cNCGd7h0MfU0bfX5dgVIfk2ZQq+0WcFO/fZ10aFcJw
 hxkWaJFIxdcNTtCsV7cZfaOWOVOSNBGrLIQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amr8sang1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 25 Nov 2025 06:48:22 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ed6ceab125so154627911cf.1
 for <freedreno@lists.freedesktop.org>; Mon, 24 Nov 2025 22:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764053302; x=1764658102;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dYOLaJjZrmBTHo4tXaOJpcaKaQKHs0XP9i2DnE5mRI8=;
 b=AijA0Ohy9WoGelvep3AcAlyXp+MThU43v6FsrXizNxrhF6W0Iigj41SFTSZeE/fINC
 u36vvc0PsRERvlpbclL252zxvn9PDByvG/gIR80M2oM+0UsJiXLnbeqPUzev9DzY3Vqz
 iY3dOhtRZegVzWxL1rNWb+AzC/kVWOyoy4omscO/mlmkdIft6KXv+OM/z45wn69QZ/6Z
 DI8h+wrZCz3IMQd5DB2mh5UYYagiScTtQ5C0AoJ3AkvbzE1W5SgCa3CN11pSPmp/VQwo
 zaW/aBW4apP1O2z77qgZsc3dtbbw84DwFa2oI4dUe8VrlTQc51m1y62+9cYSvMnUzeR8
 lfCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764053302; x=1764658102;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dYOLaJjZrmBTHo4tXaOJpcaKaQKHs0XP9i2DnE5mRI8=;
 b=Exa84Qru+a9fUppnE8zxPi0bU+12OHQhAHYmNmWMXjm/OwMSwNAygJwqdla9UVgRdZ
 ueDVNNpfgPTtxRSOQgYuC05tQ9Z2sO8E6GsMHUVAZ92vrjlhi/cZRcgKIpoodbxx1FM/
 SE5yfDeHNzL+T86Sl0XXDJR89WVFQlfPzHr8zY+PK+mHJaDYaQQ3Tiv7tTiTFMvPFnG8
 x1Cd6NCplojkFabRB8FFfBhwx1DRWNDmHAGBviUFIGB4C+38YS9dJMHgK/DADhrc7dJ4
 VqqJkQ8tAbLmf5KcD9RUlVCVO0vQana4TsPNkUNeJ5XEcpuJyMmyNz2a/V8Odhv89u+a
 dxEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4+5eEGli/DTrZ1JsQpAOyC9dSa46XGjyVd+IhNFS0Is98EmxX+EV7hVxDLqhdwn/m5MTcAkxfMpA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyC08BTcp9n48pdjev4dF8DN3Mb5On3z6zXh7l+/nMgflaOw+hN
 wlHn3yly6P83v0KNdwYY8HkuJVs50+IdUnwdjRkSD4Z5lJQg6PDjtg/iEvfmlK+i6wRNDMuI0v5
 9OI1t6tArnSLDTGxXr8PsYzkrhTqSsGq8C4aQJ8TPnYSDvSvqVSt1Rv+QN977SO/cEH4HgiQ=
X-Gm-Gg: ASbGnct0xk0r+ezuPOCTsUtP89lwSwsC0wfH08rcejBYunnuib/cXdrJ9a1rxO+s3cC
 rg2hhClSEIc8kIaUqboYZFa6mLFvEejrrYwzg+6GeLcGW0CSDm23DNgeixyC3OIiW3NSl/Ms54/
 bddwEVuQ/9eYed72AK86frw9+KeaKHcV65l4xZzcmc3LFrmPwO48FYWyqyqL2un+Wb6lJN4rt73
 x8O4SCaABgT6Gix94jiABEmIIDGzwENiRcu11oIRv0QjN48WUvARqUaSFvPzryXKq2mnxM8jjGO
 A2QCS5prQHat8Did3MyutWbw1sbSlJ2HpNNZZlmD4bFFLHZtwwWlPzB9S3QpFXG0/5o0gSiQ0r5
 GpFruQW11r3dnWEGX3MT0I4QqIeClFqII2LYr+Hb5+eneJs/BFmTDfWiGNsYO/qyg22OJeOk=
X-Received: by 2002:a05:622a:178a:b0:4ee:2080:25a7 with SMTP id
 d75a77b69052e-4ee58890015mr175373651cf.38.1764053301903; 
 Mon, 24 Nov 2025 22:48:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEUrdLr9BYpmQGzwmJ0SlyS3ENg5HvEmRUR0WaX5UbjFnWzh16r0Uou0347IEKlQMLAz7iT3A==
X-Received: by 2002:a05:622a:178a:b0:4ee:2080:25a7 with SMTP id
 d75a77b69052e-4ee58890015mr175373341cf.38.1764053301424; 
 Mon, 24 Nov 2025 22:48:21 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4ee48e3edb9sm100645971cf.22.2025.11.24.22.48.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Nov 2025 22:48:20 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 yuanjie.yang@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: [PATCH v2 00/10] drm/msm: Add support for Kaanapali
Date: Tue, 25 Nov 2025 14:47:48 +0800
Message-Id: <20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 26Q2beaxZs8u6XsoauCnmqa3RI4aZAyi
X-Authority-Analysis: v=2.4 cv=KP5XzVFo c=1 sm=1 tr=0 ts=69255136 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=qC_FGOx9AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fD7pSEWciPXgxqq5vjEA:9
 a=kacYvNCVWA4VmyqE58fU:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA1NCBTYWx0ZWRfX6nqd/5RxJCxo
 kHyVJ2zlqXJMEIbI7/J8TQHOs4ZQ3aVH1t/5Ez0vMi4GRyNS6VmIIaH82c9oonJmq5tTMHVcJNF
 n9S6LfB/UltMlUNS8XzfGF8A33HAfGkeHHeN7VK5cPlIxpOeLu2QOdMwPfKJB4dD+95MYjDKyr7
 bSNbaWVtf5nVV6GxitfihC6D6JD0MoNCsBfed55AwU6F5VM+8JnrK+pMp3U4hvj+OOuKLQDaR57
 j29VOjtt3dDgx2o/nDEoC9Gow5UdOzB9liw0DcViAaEIKiZm9qCnD4bxZk88KWG21wt+k4eNDon
 hWG549pqfosFVPMbi9G7+Qlti1xTHTHd2QtYdJ8ffBdkflGnUm4/h4iGOGMWR4jX8tcq3wq5HRC
 I7IGPbe8/jDiWrJCDkt6a/TJQlB8jQ==
X-Proofpoint-GUID: 26Q2beaxZs8u6XsoauCnmqa3RI4aZAyi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_01,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250054
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

[PATCH v2 05/10] drm/msm/mdss: Add support for Kaanapali
compile depend on qcom-soc tree patch: https://lore.kernel.org/lkml/20250930-kaana-gpu-support-v1-1-73530b0700ed@oss.qualcomm.com/

Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
Changes in v2:
- Drop panel patch
- adjust patch order (bindings then drivers)
- add dpu_hw_ssppv13.c to complete kaanapali SSPP function
- fix bindings example dts compile error
- fix other comment
- rebase on top of msm-next
- Link to v1: https://lore.kernel.org/all/20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com/

---
Yuanjie Yang (10):
  dt-bindings: display/msm: qcom,kaanapali-dpu: Add Kaanapali
  dt-bindings: display/msm: dsi-phy-7nm: Add Kaanapali DSI PHY
  dt-bindings: display/msm: dsi-controller-main: Add Kaanapali
  dt-bindings: display/msm: qcom,kaanapali-mdss: Add Kaanapali
  drm/msm/mdss: Add support for Kaanapali
  drm/msm/dsi/phy: Add support for Kaanapali
  drm/msm/dsi: Add support for Kaanapali
  Add interrupt registers for DPU 13.0.0
  drm/msm/dpu: Add Kaanapali SSPP sub-block support
  drm/msm/dpu: Add support for Kaanapali DPU

 .../display/msm/dsi-controller-main.yaml      |   2 +
 .../bindings/display/msm/dsi-phy-7nm.yaml     |   1 +
 .../display/msm/qcom,kaanapali-mdss.yaml      | 297 +++++++++++
 .../bindings/display/msm/qcom,sm8650-dpu.yaml |   1 +
 drivers/gpu/drm/msm/Makefile                  |   1 +
 .../disp/dpu1/catalog/dpu_13_0_kaanapali.h    | 492 ++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  41 ++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  28 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c |  89 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 276 ++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   | 264 ++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_ssppv13.c    | 224 ++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |  23 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   4 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.c             |  13 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.h             |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     |  23 +
 drivers/gpu/drm/msm/msm_mdss.c                |  22 +
 21 files changed, 1631 insertions(+), 175 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ssppv13.c


base-commit: 45a11c04b1a6fa180e37c4a2011cabbcc50cb48e
-- 
2.34.1

