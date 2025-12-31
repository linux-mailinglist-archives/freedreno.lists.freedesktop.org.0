Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AAACEB916
	for <lists+freedreno@lfdr.de>; Wed, 31 Dec 2025 09:45:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAC1C10E0D4;
	Wed, 31 Dec 2025 08:45:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QpIdT89B";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YZtXrdD8";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB1BB10E0D4
 for <freedreno@lists.freedesktop.org>; Wed, 31 Dec 2025 08:45:49 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BUNcXtr2551069
 for <freedreno@lists.freedesktop.org>; Wed, 31 Dec 2025 08:45:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=MFEYTE/GxjSOVuQS3as0uL
 2boHMn9lXpwSOtewC/1TY=; b=QpIdT89BFLA0K8hTfPo8L4t4l8PBcJ1pbZrnvF
 0WhGtCb+Sxv/NsqkXyvz9MyRs1CjDqfyO2Ilqvdkq2wvbCDDzkKm0kj5PFnTdsvD
 P0Qlt+5cf/qLJa+d6kuDKSw5+1sar4R+vvqENUfBOki2I9EYgDlgWiH0Lc50RTHM
 iL7gQUAEoYlluKgRIQFU+8M8Q5arJR+yspWplzBBqoHwVAfg1I78Yi/BO1VFgIDj
 rloFAQbql5FCL2o00DY5jnjdi+fI9hBvvQPtbEcyvCXyUHgA+7HaAD4xkz544ysx
 3t9jmqtMhzdmraN6RENsHDsfl7cDJqSAwG8xeu4SbeWzb9mA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc0skky3x-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 31 Dec 2025 08:45:48 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-34c5d203988so22500310a91.3
 for <freedreno@lists.freedesktop.org>; Wed, 31 Dec 2025 00:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767170748; x=1767775548;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MFEYTE/GxjSOVuQS3as0uL2boHMn9lXpwSOtewC/1TY=;
 b=YZtXrdD8KLZ8M/vJEBslc6pUTabBZZUuDuo0Fl/zDp4FZmd5fByv9Av3XLbPALpjCC
 BYjk5vMYoiq62SK1DkrZlmx8g2RysJJuN4GYC8NX2eQEq7LVjKHw3If996mRVWvv60wa
 NPXtRzwbfM8FugKb9zGPPouUuAQCll27KshqtINESpG75KJ6G0V88M6wZZZ9O8uk68lV
 h9XGGIGcdA4hZhZT4D3zNg2mXCX1Ep90p0xUs8jpFdWDbew2VRL4jLfkQXHKHDIw4LZZ
 zjdnLZKb4U4zq34pJ5CpGIjM//cmDd6cv+gK0vOFDObdREughEAT9H6MnRX/YLxlaEkH
 OGdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767170748; x=1767775548;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MFEYTE/GxjSOVuQS3as0uL2boHMn9lXpwSOtewC/1TY=;
 b=G5GW5juVg1krNNm7Yz/nQ3m3tWm7beNs2fpFeD8YZR0BRECG9aqe7oVFyxSmfNHa66
 T/afXsoaf5CtxfahePPF3DaM2sRFSkb0256uJJe4GFuHzqwsN4jzxPAAi//3+plKT9YP
 +14W5WDsxhbI4btSRg90cLY78fZf6IBwSQOngE2LBxqrNb7EKzAkpDCjlZFemJuX9y65
 +8BHoj3OppplGOY6O1aCpfLyxPusJbYow9J4NCA8csBZimKgMqMu3yLZYNh/OijXhzph
 dEMgE1/DoP+67PYwu0tLe7k+aseSj9YI6g5eFVhl5GpqotAMZJZuAsG+MC8ICg3dIeWF
 RzCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3brvWDPGLtbvJzYUdIFjJi9Beq8pBjmMNjYBMD0jbBT7KLyW+WLAETUF4wRua3NPY04yUuhdDjHY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnsjD3iVM3QL8xfzte9ic4nYFf9nK6+sEreUHN8n4IRGPFUK09
 Qv/p4kPLJBvzS+0BWFSNZyF3F+sOPSMdVpnplnc6AP2ay0qIJ5agikeV0SNmYwdhocXbYfrWT4q
 U+96v1/Lw7piv5MfAqK2ZnH7XDYVifAwvAUX3896BgYmqWxbn6rI/oL/lTCrhcjvJunk1g5M=
X-Gm-Gg: AY/fxX6QOKBsrClPnvinldCnFjudfS9u9dSOqPKxxrGZjQJOr2SXItlhJBF1DGA3OVK
 vSuox7tJhNaP7tLlhUJp+RexscevH1G0t6xpmFmgvSK89gCvzvHP/8lX6i+XIVOR2w9sw8FYsVo
 0ZxwuauTItvBnjuvKiZHQiwszP+x1squ9cYdPGS6oipx9k6gJVafKA6Xl9H05q7muOFlnTyqhio
 YiqT+KZhPwFu/drUxo3R8X+kNu5L1si5mYDBxuTncP8cV3efiaQZaLxrpaI3LCSmCyGaLTQjvxy
 WPEWaYRZTLhnxn/b+CihR/ONvtxPawU/nFTC8wwGit/HvqW4QaPqJXCg7qrjtZ4znNik9qKHwZb
 fYrWDlWnVAPTDVaiIxl05pSAAf6D7Dt0ahw==
X-Received: by 2002:a05:6a21:3291:b0:35e:bfe5:ee75 with SMTP id
 adf61e73a8af0-376a9ae285bmr39028258637.58.1767170747858; 
 Wed, 31 Dec 2025 00:45:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFfi7hggK7K0LhHxYNFjHNyK3XdM3xPE2W+C3PkYHaylR1lJfzZ8FdD1ailUb0AqWEEj51F6A==
X-Received: by 2002:a05:6a21:3291:b0:35e:bfe5:ee75 with SMTP id
 adf61e73a8af0-376a9ae285bmr39028246637.58.1767170747391; 
 Wed, 31 Dec 2025 00:45:47 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c1e7a018eb5sm31356070a12.16.2025.12.31.00.45.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 00:45:47 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v6 0/8] Support for Adreno 612 GPU - Respin
Date: Wed, 31 Dec 2025 14:15:21 +0530
Message-Id: <20251231-qcs615-spin-2-v6-0-da87debf6883@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKHiVGkC/3XOzW6DMAwH8FdBOS/ICU6AnvYe0w75XCOtUBIab
 ap496V0Uis2LrH+lv1zriS5GFwih+pKosshhXEoQb5UxBzV8OFosCUTDlwwYIJOJslS0jkMlFN
 nUWiwTvd9R8rOOTofvlbv7f2eo5suhZ3vTaJVctSMp1OYD1WWNetpNJzcho8hzWP8Xv+S2Tr9e
 7bdnM2MAgWtFKLvoAfxOqZUTxf1eZPr8qxg5g+EwR+EF0Rx2xr02ksnd5DmCeF8izQF6T1aNF3
 rBbM7CD4QDrhFsCBeKAAjtJSN30HEE8LlFhEFaQTaTqIEY/Q/yLIsP5dGA53yAQAA
X-Change-ID: 20251015-qcs615-spin-2-ed45b0deb998
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jie Zhang <jie.zhang@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Qingqing Zhou <quic_qqzhou@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Jie Zhang <quic_jiezh@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767170740; l=4625;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=x1EHBjIzwz6+b7ETWdXdN3+q/S85pvgXoKani4TE1ck=;
 b=YVYbe8IVZuknEabOiYxRhWuiMUzDjteF5Dp30vZj9Dk56WBSrYoi3CkatOGpGNBU49+OiVnAJ
 jZbTklFvNw7C+1JLHtPCUW7UsjOQESsJrkuxMiG/vC+mdrF2IL/vEMB
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDA3NCBTYWx0ZWRfX8JUWQLgd82JA
 R4ERQrSwLkNwLjjjY9GZcUWu9+aWFzVvmBXqhXA0xaTLzYbZzPaIS3OjoZJx7ltd2LbLUWfa/lP
 +FRv6zvvjEzV+t8d2zmIfMREnu1KeU23fyw5h8jGbI0JgwEGGQOmzm3+F7YzyeHgYTGlSrh/omP
 1CGxnnKC9iSeMQgT0Q1WMqDEj3nzQQ7WD5iGxgLPZ54d+rU8cv35MrMUzPhx767+s5neWEtgrKg
 ZK7jWOBmKg/UXXFowCE2ZSrQCZ1wftNZfvJ/PTfKao9vT6SpisCuPSZ4F/YQ6P+8pYETEyVdGDX
 Bf+C//j6G7REF5Edn35dqwcEWBXWgMOk7WkkuP0Zq5H6jN6QQ8sR5IBf67oi6YPGNb/fMyDWOSP
 ZL0q8hnFmo+MOgNfCB6h96CssvUsBeXRZmGO9G/mVXRo+d4rFaIhW2QD8GOyvVdZfIIwF//pai/
 USpeRCdWk6LEwx9vaOQ==
X-Proofpoint-ORIG-GUID: i9IiSodgJxaRVsFrdp7TGlbCHV1ZLVIp
X-Proofpoint-GUID: i9IiSodgJxaRVsFrdp7TGlbCHV1ZLVIp
X-Authority-Analysis: v=2.4 cv=FJ0WBuos c=1 sm=1 tr=0 ts=6954e2bc cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=nlYtN0jpdUqXxw8MpYQA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310074
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

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Changes in v6:
- Move the rgmu register range update from patch#8 to patch#6.
- Capture trailers
- Link to v5: https://lore.kernel.org/r/20251226-qcs615-spin-2-v5-0-354d86460ccb@oss.qualcomm.com

Changes in v5:
- Rebase on v6.19-rc2
- Make the reg list in A612 GPU's binding doc stricter (Krzysztof)
- Link to v4: https://lore.kernel.org/r/20251204-qcs615-spin-2-v4-0-f5a00c5b663f@oss.qualcomm.com

Changes in v4:
- Rebased on top of next-20251204 tag
- Added a new patch to simplify gpu dt schema (Krzysztof)
- Added a new patch for GPU cooling support (Gaurav)
- Updated the gpu/gmu register range in DT to be more accurate
- Remove 290Mhz corner for GPU as that is not present in downstream
- Link to v3: https://lore.kernel.org/r/20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com

Changes in v3:
- Rebased on top of next-20251121 tag
- Drop a612 driver support patch as it got picked up
- Rename rgmu.yaml -> qcom,adreno-rgmu.yaml (Krzysztof)
- Remove reg-names property for rgmu node (Krzysztof)
- Use 'gmu' instead of 'rgmu' as node name (Krzysztof)
- Describe cx_mem and cx_dgc register ranges (Krzysztof)
- A new patch to retrieve gmu core reg resource by id
- Link to v2: https://lore.kernel.org/r/20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com

Changes in v2:
- Rebased on next-20251105
- Fix hwcg configuration (Dan)
- Reuse a few gmu-wrapper routines (Konrad)
- Split out rgmu dt schema (Krzysztof/Dmitry)
- Fixes for GPU dt binding doc (Krzysztof)
- Removed VDD_CX from rgmu dt node. Will post a separate series to
address the gpucc changes (Konrad)
- Fix the reg range size for adreno smmu node and reorder the properties (Konrad)
- Link to v1: https://lore.kernel.org/r/20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com

---
Akhil P Oommen (3):
      drm/msm/a6xx: Retrieve gmu core range by index
      dt-bindings: display/msm: gpu: Simplify conditional schema logic
      dt-bindings: display/msm: gpu: Document A612 GPU

Gaurav Kohli (1):
      arm64: dts: qcom: talos: Add GPU cooling

Jie Zhang (3):
      dt-bindings: display/msm/rgmu: Document A612 RGMU
      arm64: dts: qcom: talos: Add gpu and rgmu nodes
      arm64: dts: qcom: qcs615-ride: Enable Adreno 612 GPU

Qingqing Zhou (1):
      arm64: dts: qcom: talos: add the GPU SMMU node

 .../devicetree/bindings/display/msm/gpu.yaml       |  89 +++++++++---
 .../bindings/display/msm/qcom,adreno-rgmu.yaml     | 126 +++++++++++++++++
 MAINTAINERS                                        |   1 +
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           |   8 ++
 arch/arm64/boot/dts/qcom/talos.dtsi                | 149 +++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |  14 +-
 6 files changed, 357 insertions(+), 30 deletions(-)
---
base-commit: 2408853dde584f01950a0f976b743739cce30eca
change-id: 20251015-qcs615-spin-2-ed45b0deb998

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>

