Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD04AD5377
	for <lists+freedreno@lfdr.de>; Wed, 11 Jun 2025 13:16:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24ACE10E61E;
	Wed, 11 Jun 2025 11:15:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HxXrh9Do";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9974F10E624
 for <freedreno@lists.freedesktop.org>; Wed, 11 Jun 2025 11:15:57 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9DD7j023917
 for <freedreno@lists.freedesktop.org>; Wed, 11 Jun 2025 11:15:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=6bcwvX4gEpvYIjcBEapn8g
 GSYzu5mivrPS7uygKQxHA=; b=HxXrh9DoaapoHyvbZTEERKhkYjwPTYRb1wFUpV
 Qw0ee7jPdhV5kF5iykjlS+oAAwRVI1bAZ1TZxmCmrYXsx4lA+s8QkzcgU1MIoltC
 v5PXVqgWDGVxOpeEQsvSrU2FE9rU17ilM47eC1pDZzv4YAIlAmZncOP0fXCL6v7w
 iPCHYaTaf7vu7jTnVG8PCU5roiw7EzUAS7CA5Eo/9ObNOKCwrm3MGg4KUf4dvhjg
 4JFlmA5x0tOAlQhUni8ctyHXANZTuMIDsxvyBsGMD/5VJ3KEiF/YTqKUC/rCasu6
 htulFI8VimDqlmGpe3jE1iBjbXC3+ZYWJ/17g0xN9dfjhHyA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2tfc30-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 11 Jun 2025 11:15:56 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b26e6b84a31so3941090a12.2
 for <freedreno@lists.freedesktop.org>; Wed, 11 Jun 2025 04:15:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749640555; x=1750245355;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6bcwvX4gEpvYIjcBEapn8gGSYzu5mivrPS7uygKQxHA=;
 b=Ef/RsRBD2Cz10bmmFfns2n7ep0m2BBm4agisWbqF7P2tX8Uf3g2svesBD7uzj0avbS
 Cs8T7JkbMp4lGnOv/7flcnPkGEJiWCttKSz87s9lNHmQIWuKW5s78ezOMK9g8KNOLeG/
 /zfXI2ja6/+ErGhRl35tg2xRHEs0/1Ne83ZxDJxj11hb2puWGhg6cJeQSpF2eRveEIyp
 yDkELqf6rajcZm5b2Z7PQ336/dCD9upd9k1SSPXth4k1KYgOF85EiTunZaSJYXVcR3Bp
 vjNTWVwUe03qKXQsKHqFlQhdASg5H9R/HNVShwJRnpASxvNBlHMXh9e7/8aSDtrZ8B19
 lL2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeon/KJhAyped7kBre9nti+uLQVULgzI3gVc4P9rTIwjOyjvwnOGNOtY4GmMZYHE83tY253jp8G3w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzPRdzf16yyYidLHH35p47iLd0Y0QNA1NhDwHsfG3/2hEv0Ve6Z
 wx+avNhwP/QwPiWdFlL/pzZUZtuW/ulJB5VI+cfN/Zyine0Pl/UV67FylgX6jJ+7+W3JeQzNOSn
 2hHjYfXZqAQ8kepKTf4zWxFxbpLcwmGgc3+vIg552XF5WOisgt/GK9QQdobRUbQkIk+OyVOk3dx
 sa2Zk=
X-Gm-Gg: ASbGnctPOjSExknhtzBmhYR2dbCyiH5SH0jK6vsWsFkurkkCN7NaUYXu/iEwlH/Pn7C
 zcLpICQiXSpFHErzGOwVU9tLmTh7rIhl0aSSOqJH48BeUN1gfwE5T/vWPLgM/+BIWqgECrXyqdb
 0bevC2pLMCCgCrZJ7VJbWUnKoNv1HUkPJ/JVex8NBhSNO+EN/6CbJfADqJ4KUsBlbBCaihVaUGK
 Nx6FUOoDPKWW715akQ1Vgtavw/O+fXfotIKO2gCM8E7ksQDTFL0XxnSVsPxnxeFhATR0Oh2Zf5E
 lvIuWnBQYbMzH6WuRivBcV127ltic+Zk
X-Received: by 2002:a05:6a20:1443:b0:21f:4ecc:11a9 with SMTP id
 adf61e73a8af0-21f8674384bmr5182062637.32.1749640555061; 
 Wed, 11 Jun 2025 04:15:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCzs/EwozS2+jM3nfZzo8sHxEcKNC8JH6C8JAdHxa5QTI2A6Hb8d3Gp3f9wRZbV5iIW6Heew==
X-Received: by 2002:a05:6a20:1443:b0:21f:4ecc:11a9 with SMTP id
 adf61e73a8af0-21f8674384bmr5182020637.32.1749640554632; 
 Wed, 11 Jun 2025 04:15:54 -0700 (PDT)
Received: from [10.213.111.143] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482b0e9d57sm8820772b3a.160.2025.06.11.04.15.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jun 2025 04:15:54 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v2 0/4] Support for Adreno X1-45 GPU
Date: Wed, 11 Jun 2025 16:45:30 +0530
Message-Id: <20250611-x1p-adreno-v2-0-5074907bebbd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFJlSWgC/02OMQ6DMAxFr4I8NygJlFKm3qNiMMSUSIVAEhAV4
 u4NlKGLpWfrP/8VHFlNDopoBUuzdtr0AeQlgrrF/kVMq8AgubzyjCdsEQNDZak3TIq7QtmotMY
 UQmCw1OjlkD3LH1sap+D0vyVU6IjVpuu0L6KeFs9ObwZ7oNXOG/s5ysziSJz32//fWTDOMCfMe
 ZNUIq8exrl4nPC9q+MwoNy27Qs9+9qt3AAAAA==
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
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749640547; l=1468;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=tir53TSjkw3/xfxcfRmGyJDlmk+DY/g391WffwmPdjI=;
 b=boSdoAmoFVFkKeAEz/t/ojFWCig1NztCZfwP8qlXEYtkZ0rhoNdUnxkTTjyrf8ntYT+9A+S68
 e8DQZ/kjg/kCF4HThVdDLAPhzajXNLrZGgxYS+L45XpzVh0R/cEUiN9
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: tLI6Ew976niNjpGBbfw8-9Lh999DEZEy
X-Authority-Analysis: v=2.4 cv=GoxC+l1C c=1 sm=1 tr=0 ts=6849656c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=vb8sKYNj6oKrwasmUUsA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: tLI6Ew976niNjpGBbfw8-9Lh999DEZEy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDA5NiBTYWx0ZWRfX65+EGAnvPWPf
 3Qj9/am0D279brmEeH8VAkDxTtIFaboKl0Shir2ZIdmC1yTi48nW5pzHo8q3bzWMb7BE5BY+sVH
 2hSXjjTp1l8K0uNEH57q5w9eBx8gjqvI3EPf8dJkCeANXsOtOmHJP17K3skn61C/B+umoyZktjs
 oCtXRkUjc7wOw1U2+E+Nci4hdGEJqiAvUjbJmdJd31/Oy7ytmZztXyzmH25zmWrQptFP6y7kSMR
 HWmUi9iRw+twQB9la62q7Eq1dLVYasyx1kacp87j3vA6VrcHt9P3wEPxohqoOqWmC9Qb0D1Y9Ui
 SEq42V4UcFmgpfdtmnXp/Ff/VLs6WiWF3HM4oBaAGqUCKeboegjbK1Aqny8oeRVa41s/dSDL8VV
 YNr8PXdMVOc0kHK81jtJzo6SlK/AN7/21UTdgGZrSf81NDZbq5hP9dwSyXH/H23gqiVb1rN1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_04,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=934 adultscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110096
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

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Changes in v2:
- Skip 'delete-property' wherever it is unnecessary (Dmitry)
- Reorder dt nodes alphabetically (Konrad)
- A new patch#1 to fix the dtbs_check error
- Link to v1: https://lore.kernel.org/r/20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com

---
Akhil P Oommen (4):
      dt-bindings: opp: adreno: Update regex of OPP entry
      arm64: defconfig: Enable X1P42100_GPUCC driver
      drm/msm/adreno: Add Adreno X1-45 support
      arm64: dts: qcom: Add GPU support to X1P42100 SoC

 .../bindings/opp/opp-v2-qcom-adreno.yaml           |   2 +-
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             |   7 ++
 arch/arm64/boot/dts/qcom/x1p42100-crd.dts          |   4 +
 arch/arm64/boot/dts/qcom/x1p42100.dtsi             | 120 ++++++++++++++++++++-
 arch/arm64/configs/defconfig                       |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |  38 +++++++
 6 files changed, 169 insertions(+), 3 deletions(-)
---
base-commit: b3bded85d838336326ce78e394e7818445e11f20
change-id: 20250603-x1p-adreno-219da2fd4ca4

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>

