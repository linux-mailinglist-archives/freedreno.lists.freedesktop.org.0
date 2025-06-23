Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 396A7AE4622
	for <lists+freedreno@lfdr.de>; Mon, 23 Jun 2025 16:14:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 149A310E3BA;
	Mon, 23 Jun 2025 14:14:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="n0zf6cHg";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92BD210E3C4
 for <freedreno@lists.freedesktop.org>; Mon, 23 Jun 2025 14:14:11 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9Q1th032648
 for <freedreno@lists.freedesktop.org>; Mon, 23 Jun 2025 14:14:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=bJuDNW+sOIaFWmexDpUOQY
 PnvJ+qO7KFFcDuPlTFSvg=; b=n0zf6cHgUqWyvZSX6hwY35G+LbOQnAVdV0ufkN
 /BTw8wrgP3ATupnsVy4EScZWUiPpMYNOQtw1QUh6DMWlX/pV6nCl0yJXFFL71xMa
 2WdP9z9FXY+g95e09Tuo9ecq7w0fPZFWnEIvWZ0qSDYj8C/7p7aNCDopm07nDVDC
 LKw4OC6mxmonhzJ3GLvJfEgL1GePXOI07E0EWxDic6zzmvjhEYgTyXbP43rJuhgR
 FU1PLczN/zCMVmuWpOa+Q0HsOjlJKQIhNZdSs7RvTKITfnmUCL0qv8XxVDXb0Yvf
 BIjbaKdyrJt6dRDGdaiFbNGqZ4HvZkiIorTBNQyyWxQLu0Zg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec2633yt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 23 Jun 2025 14:14:10 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-3132c1942a1so5990419a91.2
 for <freedreno@lists.freedesktop.org>; Mon, 23 Jun 2025 07:14:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750688050; x=1751292850;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bJuDNW+sOIaFWmexDpUOQYPnvJ+qO7KFFcDuPlTFSvg=;
 b=vfVI0gsG2jdt45Rdz9/1ghARIzGqDX9VltP6tNDVv+2dtYhT5mDWILDiFGuYptFhmE
 KOjao1hUHNFM3KV6/rzbE3Wdb7nsJyKci06fIeTmErZAyqcTf+SyGErNiV0o1vvLMX/a
 Svb0VCVjbj8wC8Elm/XT4hckuoJ1rrkJDd8DZgJMlBxgKvswiIe5yYu/0Fz1O6G9j8EN
 +rE5VrIrWwR0QzimqrLkL8NOMKmye2JKzAFPfgwo3HfnqAFHMxHSxAOkaLsGTq16Wcg0
 nK+N67rLgG0Y8nsv5MBBQizh4GzFSrlwcAdiK98SlM6E+qHHpTC2dS9JSqTaxu7X+rdn
 OiBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUx5gGdQGe6u35f0WqncC1QhgQoJA+wiYsoiMFqVMlVXW62bZKu1E8H2XLjx34hBOXVpuXkGkEONbY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxWfpRHKIyo2e8lb0AUCAJ6ccqbiqqJx58FCEjZ5BkhyzR8GeKT
 E4gsLlAQTyL4uE+Z5tflvtEKP1l3UPeLWUG4T10IoMllcrSsObF1V2+vO/DSwbgqxuf+r2Z+hQ7
 xAE+ZgwzS14iD5Y0R7GzgmzVW8WDgv20DLsq1K2g0EslolZqL3Ki2egmD7PbcmnJ8yUvPhSQ=
X-Gm-Gg: ASbGncsBT+iHMuspuOGi7akVik62yMHFOEbYQEcujdP5QTnoaXB4rw558U0Z8VrA8Wu
 zOH6SRp6uJcVNts7oHsRcAldG6NRQDqNCJNNTxo70MWiNIAxXGOdei/7zlqBjVCp33shcMj8NGS
 xDeI/+1whBGZonLCbKZxGBThCljkI/xazove7YFSmhzNliOzwat40F1piZfRUy6CAguL+aSiiBx
 BizaQ407Ao+BqXsYxRK+4Yk2bmz/KP+a8vu7d1KKD7eXlbSCc5hdVM2OrguCFF70C3vibYf62yd
 MRfswy/x+iVvNSbndDnIc2/0JFh9pdKk
X-Received: by 2002:a17:90b:3d10:b0:312:1b53:5e9f with SMTP id
 98e67ed59e1d1-3159d8d80f9mr20426444a91.24.1750688050065; 
 Mon, 23 Jun 2025 07:14:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9J7ED3U9fTLEsv4tSvQ6M5GTXVIyg9vk4m45JNqQJMWlwWEhhOz4sDmwr32GURMlMnchErQ==
X-Received: by 2002:a17:90b:3d10:b0:312:1b53:5e9f with SMTP id
 98e67ed59e1d1-3159d8d80f9mr20426392a91.24.1750688049594; 
 Mon, 23 Jun 2025 07:14:09 -0700 (PDT)
Received: from [10.213.111.143] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3159df71c4bsm8112049a91.2.2025.06.23.07.14.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jun 2025 07:14:09 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v4 0/4] Support for Adreno X1-45 GPU
Date: Mon, 23 Jun 2025 19:42:05 +0530
Message-Id: <20250623-x1p-adreno-v4-0-d2575c839cbb@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALZgWWgC/3XOzWrDMAwH8FcJPs9BsvPh9NT3GDv4Q1kNa9zaq
 ekoefc56Q4pbBfBX0g/6cESRU+JHaoHi5R98mEqoXmrmD3p6ZO4dyUzAaKFDiS/44VrF2kKXOD
 gtBhdY3XDysIl0ujvG/b+8cyRrrdizs8mMzoRt+F89vOhyl2NHY8W2Tp88mkO8Xt7JOM2/Xuz3
 9/MyIFrRVrBKA0qcwwp1deb/lrZupRNy2InIL4Ioggt9M0AvSFj3D+C3AkCXgS5Cp0clIVeWWz
 /EJZl+QGBoqXIXAEAAA==
X-Change-ID: 20250603-x1p-adreno-219da2fd4ca4
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750688040; l=2002;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=Rp6x6KxtK4aGFpq43ixsYLX8y1+s/PNcztPAPycm16U=;
 b=yvWYMl8LTmjh2jAlMPFUt8F6zsyk5RJJACb/bjP/3PKp2regoKw8/xBSRUgguHhfRnFJvEpUx
 +vyFBQMYNQ8DwPNqtHOWOD77DxcUrX1e+sk1sWuRAJ1KuMtyhLhozQ1
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA4NCBTYWx0ZWRfX8z7NRe/pW8X8
 vDYyFMloZEUvveA6fsEEkKasHKff286DinY7NJFMDiwV8qf1gu98tksN7i4V1hBRsLad/hCu2sj
 gzIMAyNBMAVN87elB6NpfoDWvnLhISrQW1UZYjRjU0cfob2cvS23KNp+ryLP8vvVtM60zmVc9w3
 q1OM70B1v9YF1jtwU6TmvkSts9j5PDGAe8+MnxUYK/i5BmeLAzU/cwlSrp9A3+KypL7no3wzN5g
 R1UJxLtghh9C8RN4m51Uyl9EUkZ2N999gISSACObdxJCnIh8FgeD/58q9VO2p1GAozOXL3gDmUT
 AYXId5raG/QE2F+tTKlvHcqgNcJR3szzX4uuU6xYdklOJKLOmiCytDVM0aUhYOK0R2cJAhlF1aJ
 R2vN9j8i7RdYFkmvkQSyXuYliW1c8AqULS7KZcyyXmSvc2DLpbPwF5Eo2raQmMG+M+rLZZuQ
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=68596133 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=vb8sKYNj6oKrwasmUUsA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: qO5nVN2-17RiPywWmuEGf6k5P4cCMqJi
X-Proofpoint-ORIG-GUID: qO5nVN2-17RiPywWmuEGf6k5P4cCMqJi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230084
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

Add support for X1-45 GPU found in X1P41200 chipset (8 cpu core
version). X1-45 is a smaller version of X1-85 with lower core count and
smaller memories. From UMD perspective, this is similar to "FD735"
present in Mesa.

Tested Glmark & Vkmark on Debian Gnome desktop.

I think Bjorn can pick the DT patch and Rob Clark can pick up the rest.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Changes in v4:
- Reorder the new entry in defconfig (Krzysztof)
- Link to v3: https://lore.kernel.org/r/20250620-x1p-adreno-v3-0-56398c078c15@oss.qualcomm.com

Changes in v3:
- Rebased on v6.16-rc1
- Fixed speedbin table in drm/msm
- Corrected the regex for the adreno opp node (Krzysztof)
- Replace underscore with hyphen in DT node names (Krzysztof)
- Link to v2: https://lore.kernel.org/r/20250611-x1p-adreno-v2-0-5074907bebbd@oss.qualcomm.com

Changes in v2:
- Skip 'delete-property' wherever it is unnecessary (Dmitry)
- Reorder dt nodes alphabetically (Konrad)
- A new patch#1 to fix the dtbs_check error
- Link to v1: https://lore.kernel.org/r/20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com

---
Akhil P Oommen (4):
      dt-bindings: opp: adreno: Update regex of OPP entry
      arm64: defconfig: Enable X1P42100 GPUCC driver
      drm/msm/adreno: Add Adreno X1-45 support
      arm64: dts: qcom: Add GPU support to X1P42100 SoC

 .../bindings/opp/opp-v2-qcom-adreno.yaml           |   2 +-
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             |   7 ++
 arch/arm64/boot/dts/qcom/x1p42100-crd.dts          |   4 +
 arch/arm64/boot/dts/qcom/x1p42100.dtsi             | 120 ++++++++++++++++++++-
 arch/arm64/configs/defconfig                       |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |  39 +++++++
 6 files changed, 170 insertions(+), 3 deletions(-)
---
base-commit: d9946fe286439c2aeaa7953b8c316efe5b83d515
change-id: 20250603-x1p-adreno-219da2fd4ca4

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>

