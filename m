Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C44AE4629
	for <lists+freedreno@lfdr.de>; Mon, 23 Jun 2025 16:14:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E232A10E3BE;
	Mon, 23 Jun 2025 14:14:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qr0/5Lmn";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A13010E3BE
 for <freedreno@lists.freedesktop.org>; Mon, 23 Jun 2025 14:14:34 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N97Sx9024850
 for <freedreno@lists.freedesktop.org>; Mon, 23 Jun 2025 14:14:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 IDdT8GmCmZBkVRDlqMB/TVH3NvJZR5f0rOeZUeSRtHg=; b=Qr0/5LmndzZH7Vy0
 9zK1b+MKQSOhlFsqy/SIVY2SW8wRk3lCJJPoRedx8FZgxUr9nRT9mRUdal33qRpD
 SDPDSp74oKrjJfRHJO3BoSK1Js292xtn1hZQ4mAtC5mJ8LuF/9OFKax3y2kPjC4h
 t6QZf0UYD2JkojDiq2Ao7RYqWkiX41bTauRD2ImU/LFnD5w0JZzry+IQH7L/pOxe
 0Zr+kE1jJeWEGnW/OQaEhU/JjSJ29RSzWfaWfTk/bB41Nitf07qf1Ge2k5/cEXZ8
 QbNnFZm0mTCPILf43q4qVNf2vE5ePBMEUrQOjHHq27WwFKEV5HM5HTpsbkMQ92tI
 7MBqIw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcmjh47-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 23 Jun 2025 14:14:33 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-313d346dc8dso5803863a91.1
 for <freedreno@lists.freedesktop.org>; Mon, 23 Jun 2025 07:14:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750688073; x=1751292873;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IDdT8GmCmZBkVRDlqMB/TVH3NvJZR5f0rOeZUeSRtHg=;
 b=pvWV6FYiWkdmDkeFuSc9X1rwMAHoagVSFRLe5wBFMbT/gMcTjK71PudaNy2TnvxAHE
 AaTROAm5ou40T+sIS/ej1FFBIA7n24JSFRrwzN7eIqG9fLpvLF0/hzfai8bmNEyx/+/H
 vpIusJIjpVPqZLuH6HFpT6xwBAbnEdx7hIUypIZ9c6iGcr30rhxYvWfolUlBWZDL2IGx
 uFhhVAUBukA5OMhIDQRI2qwUhbhQxDwNB5M7bBggD2DGM8u2Wj+GH5cct0Cp2QHGIYBo
 7L5dFG5RG365jO6n2xRe7ZdmScd6nm/wNgsT5NAXfUcIOGnUHuD3Cz+BjRfLPN/J5UPn
 y0Dw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlGnZbOhawTsXleXRzATqqi1yeiGuhX/XI96T6GkKoK97gVcMlBftBbQCyWNxtkby64zeGD6HEvcM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwcY2OsezvYP545RkpGZ9lKOig5Tofq3rhbuxht/H//4OTnnUWf
 5XPaSpo0ImkIx8eZbl1tEi3LI3PGgjXb9lQwqTS9JJNmNua97RMP0mo3hWaTa05DEIJJY4OGu8k
 3eweYibFrq6FXrtwugxoTO1Em7gR/bDgbwOP0wDLPCle4ILJgvcN2nL9p/O9mFf7qT0MJT8w=
X-Gm-Gg: ASbGncucWhghImEqBFBpCm6vVLQfhIvxcgugg8EUnLZ4EeyL+tMNbjfuIhamd4gl85h
 1fKhQfwrxDj5WRL4AQIbSQKT6HY/kR+GrM7YGlKo6Zt5ScUJthWKk4WPiKnuOmYxBb4ZJag8IT1
 NMZ9YQJyxXt7BLjWSTr9Qvm81a9l6cK7AWXFSqAMK3RPNFm88k9AHxi5iVD29vtFt8MN5/rxVvW
 vzvIuwyrrcKmP3UXOieiII/tFdZVt0ZOcQHjf5suxebhmvdveelpSyYNH0q6+8/gCsgknCh+kLd
 HCQRvd93UYmmA7PDEGC/lIqbSOMLxeQk
X-Received: by 2002:a17:90b:2651:b0:311:ad7f:329c with SMTP id
 98e67ed59e1d1-3159d7c8f9cmr24187393a91.18.1750688072970; 
 Mon, 23 Jun 2025 07:14:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFohlIbDHPnzGFzoVo8IyUWv275ozTxbFgCP3ruQsyFrF9oyTg/DjA45LUYjJ+1geRNvBXBeA==
X-Received: by 2002:a17:90b:2651:b0:311:ad7f:329c with SMTP id
 98e67ed59e1d1-3159d7c8f9cmr24187313a91.18.1750688072479; 
 Mon, 23 Jun 2025 07:14:32 -0700 (PDT)
Received: from [10.213.111.143] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3159df71c4bsm8112049a91.2.2025.06.23.07.14.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jun 2025 07:14:32 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 19:42:08 +0530
Subject: [PATCH v4 3/4] drm/msm/adreno: Add Adreno X1-45 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-x1p-adreno-v4-3-d2575c839cbb@oss.qualcomm.com>
References: <20250623-x1p-adreno-v4-0-d2575c839cbb@oss.qualcomm.com>
In-Reply-To: <20250623-x1p-adreno-v4-0-d2575c839cbb@oss.qualcomm.com>
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
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750688040; l=2172;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=xKZ9Xj4qiPD/2Zmj4aELMu3Uy4uODXqfzQQwFPTWu3E=;
 b=nyiUEqvVCW+25SYZKCQtGlM9mIdhtcEW0YGblasDdcsi9vA0hNbTrMnvW29/s2M5+bGhB9XUq
 aFcV0xh4x86AEvTj2u6wD9wWN3yobWDJ/JNXPBpIQzwfyk7yvN++lw5
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: xuTwWyh-Q52aA_2C92FHYhAQPF6hZk-v
X-Proofpoint-ORIG-GUID: xuTwWyh-Q52aA_2C92FHYhAQPF6hZk-v
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=68596149 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=gxl3bz0cAAAA:8
 a=pGLkceISAAAA:8 a=xcvD53-FQScLkYWh0o0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA4NCBTYWx0ZWRfX9e9CHMRgjHDh
 ThbJ8lQJ8sA7a7iYkbRl+CO9hpukqxkIXcBtHcvpfczEnYZlwE5/BSLU80d6okjoWjtshHfE/6f
 XBlpRh/Q0U2fOvn4GpJp8DfMjE/lHlASvsuyI6sz5vJOk3bzDR3wWuFYeK0Fzz9hiinHBvpEQ5p
 J9NB6HONmuf4mrKQ3Qf14+0Ikl7/yAxPwtv5QxNhPd5kFlk6LGbgY5g58Cybsnf5p7yc91TfOA1
 +nL00R/6YeBQukcLEfMRdihyuRJEQKTVtGnEMrTWsjusyCjU9AN+Xi9WNXfzcAWD2QPiXtpaqiG
 WgR0myxtY9XGscg1++W7FTpwKqDRyVM12oumv2H1YPIrHL9UxMimoliFEoCnsxPHoN00pNReIrZ
 qCngrZd2rjPDunxBpW3khpoGOy4euS5s8Tt69154rR0l5JiTfSO6K88blLa+g/elvaj+Jjv7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230084
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

Add support for Adreno X1-45 GPU present Snapdragon X1P42100
series of compute chipsets. This GPU is a smaller version of
X1-85 GPU with lower core count and smaller internal memories.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Tested-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com> # x1-26-100
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 39 +++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 70f7ad806c34076352d84f32d62c2833422b6e5e..7748f92919b883bbcea839a61158ab52e6e4e79d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1474,6 +1474,45 @@ static const struct adreno_info a7xx_gpus[] = {
 			},
 		},
 		.preempt_record_size = 3572 * SZ_1K,
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x43030c00),
+		.family = ADRENO_7XX_GEN2,
+		.fw = {
+			[ADRENO_FW_SQE] = "gen71500_sqe.fw",
+			[ADRENO_FW_GMU] = "gen71500_gmu.bin",
+		},
+		.gmem = SZ_1M + SZ_512K,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
+			  ADRENO_QUIRK_HAS_HW_APRIV |
+			  ADRENO_QUIRK_PREEMPTION,
+		.init = a6xx_gpu_init,
+		.a6xx = &(const struct a6xx_info) {
+			.hwcg = a740_hwcg,
+			.protect = &a730_protect,
+			.pwrup_reglist = &a7xx_pwrup_reglist,
+			.gmu_chipid = 0x70f0000,
+			.gmu_cgc_mode = 0x00020222,
+			.bcms = (const struct a6xx_bcm[]) {
+				{ .name = "SH0", .buswidth = 16 },
+				{ .name = "MC0", .buswidth = 4 },
+				{
+					.name = "ACV",
+					.fixed = true,
+					.perfmode = BIT(3),
+					.perfmode_bw = 16500000,
+				},
+				{ /* sentinel */ },
+			},
+		},
+		.preempt_record_size = 4192 * SZ_1K,
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0,   0 },
+			{ 294, 1 },
+			{ 263, 2 },
+			{ 233, 3 },
+			{ 141, 4 },
+		),
 	}
 };
 DECLARE_ADRENO_GPULIST(a7xx);

-- 
2.48.1

