Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D59BA9A7CB
	for <lists+freedreno@lfdr.de>; Thu, 24 Apr 2025 11:30:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 794EA10E7A0;
	Thu, 24 Apr 2025 09:30:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hIEdzb4e";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15F5A10E799
 for <freedreno@lists.freedesktop.org>; Thu, 24 Apr 2025 09:30:49 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F6Q6028369
 for <freedreno@lists.freedesktop.org>; Thu, 24 Apr 2025 09:30:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 F8KVHsnOFRuRXpiK5xU3zOFSxJprJgrKOnBMKsdyke4=; b=hIEdzb4eMmuSaOHA
 yEbM75WBCRel+WJd/KLG6NDt/JEN9bA8HS14Ek+BuMsGZgduP8Bud5r1i5uZEonW
 QlNFPZe7GJY0NxH/j3JnbCN1OlThe7k8LTieo5mdr4XftxUZumk4g9wiDByzBHp1
 urE2fc4MmR80LSmRXAlzoPrB3M6aRILYAyMDsbZE4s977czUWsxiP7cHBuuaP2Jz
 sOZ5eMxEPNZ/xR6VdKCYyku6Q3gUCPMZgkkESA269dTuH/1yfe0WIVkKHuQ6Jjno
 H2J7Z25LTLrw7ExeNudvotCNpm2IpZYGFJAWz74SOOpSHpmQiMOqbGJi/MNRiUCP
 DBToLQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgy4yyh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 24 Apr 2025 09:30:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c5cd0f8961so168760385a.1
 for <freedreno@lists.freedesktop.org>; Thu, 24 Apr 2025 02:30:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745487045; x=1746091845;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F8KVHsnOFRuRXpiK5xU3zOFSxJprJgrKOnBMKsdyke4=;
 b=mE3usOZnL+cCU2zbXc2A00qKbPW8lZHYPpbJYFcqBPWHeQqwEbRo6ivFaZNb6mKldf
 fztWzEAq2FxmPAj41XoDli1YbM4jDjfk+kCA+3VITQ+l1anQhPPV5KT33zXf2Nm55lwG
 +19X72bQ2+UjWQpfPDxuw5Ib9y2VmBGBhSJoWeQnMpz2OIl2cYaPADt+F/vpE1ypz5++
 obeYbPnbO+4Jo1HYFB4RwZIssJTtHtaUFmtm7fAOFad3ahjvzl2FCeIba+Vh3EtXb+f5
 ewEByRCQJY+tjQlzijiRHDH2e5L9tL4lgvfTfFuHyFyR9N+TofNc7fq+coK0VAZLp8nI
 L5tw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWdJhtF0onxu3dPYmTKJwrBvGksYHUjcMcgtJKcMV24urFYMewikPCimE3yQ003wlGaselVNqltac=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQ1sjA/0ANfKNT9s3FtL0lRhI+7gA2ToT/wN31jDJRw2TuHM7T
 HysqViAQdHfD9cs+eE3I8NWe62f5VcL3SexhSsSt33LiZaOCixPXDlknyff4+2X4Tv+W2GKtf9I
 kvTlqPNgrwgF58zkyfOxrNfXwPajWD6bH3Z7vm4cP7YTufykNDEDmrH2EAFQEeNAEXU0=
X-Gm-Gg: ASbGncv0wqDkvTbZ6UIcIe4nGdM9Ak/l63QgW2aFefTgh5DfgZC35ZAvJqN6o97RKBA
 GwyYAl/iXM5C27yeNWbByTRlW1yjpAcqwaSv1eRoeukW+Astj9il2c1lB+vK/t09SaYpntLyM30
 QuTm5eF8H4B0ZhqdhEqRYvX8OAsLqk0/Wz3Om21ovIt9EqVW8YQsRsX9e2X/0jgAirDcRA2o52P
 kSeRtwDC03qbWfYaR2MJrVUlqyVob9RoBzVyQRokBFYDFun/V8ZX6QkIZOVqYho/BXLgXnc6uhB
 O+DFHxjE/GHK2HVmqlsAbVrpOXh4Tw1B+eqityi39NyQkiQ8vbYkmQN3yLkIT38HwcjBiRen08U
 cIGZttU5XRWA1oggCBGrQpeNA
X-Received: by 2002:a05:620a:45a5:b0:7c5:5a51:d2d1 with SMTP id
 af79cd13be357-7c956f471bbmr358947685a.55.1745487045449; 
 Thu, 24 Apr 2025 02:30:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3RLd2OURtEpN0wWDOYE5ic2brd8ZkWNHntUUWiuO8CTO8D04VBoDT1b6r9TMu75McvCBNyw==
X-Received: by 2002:a05:620a:45a5:b0:7c5:5a51:d2d1 with SMTP id
 af79cd13be357-7c956f471bbmr358941585a.55.1745487044824; 
 Thu, 24 Apr 2025 02:30:44 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-317d1b9a304sm1820461fa.99.2025.04.24.02.30.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 02:30:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 12:30:16 +0300
Subject: [PATCH v3 12/33] drm/msm/dpu: get rid of DPU_CTL_VM_CFG
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v3-12-cdaca81d356f@oss.qualcomm.com>
References: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
In-Reply-To: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=15065;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=47KdKwzl6eJzgTGC1PmI4bMv2JSspbmc7E5cJjyGADw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCgSsWXxVoelQh9KOS2QBoqkyOEMQ/S05yitO3
 m06qh/tUcCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAoErAAKCRCLPIo+Aiko
 1fngB/wPLtPCJAbuRTfyphNxLy6j7cBmbnL0V88C+v6ubzJHlWGd5XZ38SflD7uV83TSyUlXyfH
 0SyWe1Hoh5QdNtH2TpuBFJKVM8DfZatfBOPQ15cGiycKxBi8GEndthoAPCE2wIc+GMPZpaT57WR
 xaK6RsKfmfBPkazBQml6cxGWkG49l6awPZSIxlsMz4EkPcDU5HYTZRsqK0PXoMxx+Hepv/xRLtn
 izqlmZ+Q9aY5zYmNhClArIaw3J7UT1SXA4pxmKVeenKXBxAW/eSZrJ5KR4CDyGgqcUTx+BVKeuC
 0IiDZBklX21KgvKBJUaQPWdNbUCnTEaSs/yKg9Qn5w2dL2bC
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfX+6a/afT1lqAp
 2jnt0jSG4c4WsXB2HHMBWQeSxHd/0BadLmNeni3qa42l4WGvooI40hDI36X5wl7k/Xn8SDcUMCg
 mHSHe4rIfQ6uYBsAuSV+lcphfhzi+jKfpJVgKIvixRwzp/iDVg/srlECOC4LaqirQogcEM1B0KN
 g4cJqWRNuTjdLSEAroFs4EOOPxGXppeGlqMyrDwpgGJNfiLs5uJ8FnEWhEqf0rvxtbBAidimWX0
 IwZ6mX3dy4JOw7kC2lKWzUA1Qe1WzMl6Hla+LgZGpLTxBhlGJvu4/CT6Rre9X+BvbSfWlXvncas
 VBkeZBWmfDt5yZBAi6WfSivnmGdd+tNzu0oyUQvPaAzB6zHiLPPDvJ21Z/kv9PEhP0ozPGHgkP0
 aQCXLmZ05vm/w/h6/45Db+khXxpuT8+0q9eiU3BaadpMuYDLcMcbCZ4idWafPb5oHpNECI8x
X-Proofpoint-GUID: GzvCEL44vpimXtEtU02QxCHywLUIeRLL
X-Proofpoint-ORIG-GUID: GzvCEL44vpimXtEtU02QxCHywLUIeRLL
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=680a04c8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=2tDT8zELnxangoEIUYcA:9
 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240063
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Continue migration to the MDSS-revision based checks and replace
DPU_CTL_VM_CFG feature bit with the core_major_ver >= 7 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 8 ++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 8 ++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 8 ++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 8 ++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 8 ++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 8 ++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 8 ++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c               | 2 +-
 11 files changed, 15 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index 922c9c6ebd82cdfc7f948df590091852282c9f64..4ab361b7c977c2c97927543154d5dcd00091879c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -32,32 +32,28 @@ static const struct dpu_ctl_cfg sm8650_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x1000,
-		.features = CTL_SC7280_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
+		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x1000,
-		.features = CTL_SC7280_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
+		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x17000, .len = 0x1000,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x18000, .len = 0x1000,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	}, {
 		.name = "ctl_4", .id = CTL_4,
 		.base = 0x19000, .len = 0x1000,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	}, {
 		.name = "ctl_5", .id = CTL_5,
 		.base = 0x1a000, .len = 0x1000,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 6fc6083607403be8ad2287952c99c7bd4d30f2e4..490ddf9880103fc853b5187256c4b960739820bc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -40,32 +40,28 @@ static const struct dpu_ctl_cfg sm8350_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x1e8,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
+		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x1e8,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
+		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x17000, .len = 0x1e8,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x18000, .len = 0x1e8,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	}, {
 		.name = "ctl_4", .id = CTL_4,
 		.base = 0x19000, .len = 0x1e8,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	}, {
 		.name = "ctl_5", .id = CTL_5,
 		.base = 0x1a000, .len = 0x1e8,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 281826170da082fc90a05c641060901ece0fbed3..2ee29c56224596b3786104090290b88cecf7b223 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -32,22 +32,18 @@ static const struct dpu_ctl_cfg sc7280_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x1e8,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x1e8,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x17000, .len = 0x1e8,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x18000, .len = 0x1e8,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 957e92d63f07723c8834bbb6e9c5a4d6449999a4..dac38e0ade971876c2ed73b6d46cd4055cb77d2d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -40,32 +40,28 @@ static const struct dpu_ctl_cfg sc8280xp_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x204,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
+		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x204,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
+		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x17000, .len = 0x204,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x18000, .len = 0x204,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	}, {
 		.name = "ctl_4", .id = CTL_4,
 		.base = 0x19000, .len = 0x204,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	}, {
 		.name = "ctl_5", .id = CTL_5,
 		.base = 0x1a000, .len = 0x204,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index ec0cf30306d2adbd5f07a2b6a6a443d29e11f712..db332286a0a92cfda434571a2a582c45460e5300 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -41,32 +41,28 @@ static const struct dpu_ctl_cfg sm8450_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x204,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
+		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x204,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
+		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x17000, .len = 0x204,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x18000, .len = 0x204,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	}, {
 		.name = "ctl_4", .id = CTL_4,
 		.base = 0x19000, .len = 0x204,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	}, {
 		.name = "ctl_5", .id = CTL_5,
 		.base = 0x1a000, .len = 0x204,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
index 4bded17f2e371a48a5b21808b9f0c55c00efbecf..826cd366495139e0e4cf1862e923ef0ece0d7184 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
@@ -40,32 +40,28 @@ static const struct dpu_ctl_cfg sa8775p_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x204,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
+		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x204,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
+		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x17000, .len = 0x204,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x18000, .len = 0x204,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	}, {
 		.name = "ctl_4", .id = CTL_4,
 		.base = 0x19000, .len = 0x204,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	}, {
 		.name = "ctl_5", .id = CTL_5,
 		.base = 0x1a000, .len = 0x204,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index e17345d954f26b234ef6cd65843e1cb349376ed3..f5f018381b4f0f59c2751b18528994ff79555d58 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -32,32 +32,28 @@ static const struct dpu_ctl_cfg sm8550_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x290,
-		.features = CTL_SC7280_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
+		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x290,
-		.features = CTL_SC7280_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
+		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x17000, .len = 0x290,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x18000, .len = 0x290,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	}, {
 		.name = "ctl_4", .id = CTL_4,
 		.base = 0x19000, .len = 0x290,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	}, {
 		.name = "ctl_5", .id = CTL_5,
 		.base = 0x1a000, .len = 0x290,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index 4d37587d6a6374d9e6ed6d8f13837aae0ef55c34..ecda48282f52e0fc33b68117650b9f2b76c90276 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -31,32 +31,28 @@ static const struct dpu_ctl_cfg x1e80100_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x290,
-		.features = CTL_SC7280_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
+		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x290,
-		.features = CTL_SC7280_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
+		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x17000, .len = 0x290,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x18000, .len = 0x290,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	}, {
 		.name = "ctl_4", .id = CTL_4,
 		.base = 0x19000, .len = 0x290,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	}, {
 		.name = "ctl_5", .id = CTL_5,
 		.base = 0x1a000, .len = 0x290,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index a2dc353151f3e1a4cb8a9f4644e7fc2e037356a2..22ca093419059600f0ad7e1e7a0a4e443b977860 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -110,9 +110,6 @@
 #define PINGPONG_SM8150_MASK \
 	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
 
-#define CTL_SC7280_MASK \
-	(BIT(DPU_CTL_VM_CFG))
-
 #define INTF_SC7180_MASK \
 	(BIT(DPU_INTF_INPUT_CTRL) | \
 	 BIT(DPU_INTF_STATUS_SUPPORTED) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 1c6be8f93b54f28d370a379d1edccd178fe3cf7b..27422a5a340b90ee02f36a87cf1bab9d97504c76 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -134,12 +134,10 @@ enum {
 /**
  * CTL sub-blocks
  * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display
- * @DPU_CTL_VM_CFG:		CTL config to support multiple VMs
  * @DPU_CTL_MAX
  */
 enum {
 	DPU_CTL_SPLIT_DISPLAY = 0x1,
-	DPU_CTL_VM_CFG,
 	DPU_CTL_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 543fe12252b7887ce2bd28abafac3be7caf17ac4..7f6c548b626dbc5bcc3ddb27f185f336354dcb37 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -568,7 +568,7 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 	 * per VM. Explicitly disable it until VM support is
 	 * added in SW. Power on reset value is not disable.
 	 */
-	if ((test_bit(DPU_CTL_VM_CFG, &ctx->caps->features)))
+	if (ctx->mdss_ver->core_major_ver >= 7)
 		mode_sel = CTL_DEFAULT_GROUP_ID  << 28;
 
 	if (cfg->intf_mode_sel == DPU_CTL_MODE_SEL_CMD)

-- 
2.39.5

