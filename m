Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0569CA99A2C
	for <lists+freedreno@lfdr.de>; Wed, 23 Apr 2025 23:11:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C18B810E2BE;
	Wed, 23 Apr 2025 21:11:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cz+Pe0VM";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A576010E2BE
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 21:11:10 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NKsuCP016500
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 21:11:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KBx0IIwlE6kHNbdjV51MVQZY6MRAmSHziUCDNMFzOHA=; b=Cz+Pe0VMV7jrxPVu
 htzSnFG2U8Hp+4KvzbFrjNTyWrbFybm2djPSJtuaLCJ+JEC7qcc3DGDjuHfcLXf8
 Eo52kBb1a5lALw28BpZ1DXQdKo2htfva0ibuy9HkMUT8jXUX4QMOZ9jR+nk3nwet
 Wgk3+06MNdLRJ2td+MFYLFdU8vAhaDH7JbELEm/XfUp3hmScGcJMutueYgH+6MxH
 Nw4CgWv2GgFeCy3H5btDOsxBhsPX0KqJqYRg43YFxD2Y0+bn+pMqmEvEBhqvOqtU
 D68TpdGsTqA8xfT1t7NcCuQlLPU7JkaM/5+iJMcFecYeohP3C3rJWSz/Y4I4abbE
 g/rcCA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0bf28-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 21:11:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c5cd0f8961so63925685a.1
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 14:11:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745442668; x=1746047468;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KBx0IIwlE6kHNbdjV51MVQZY6MRAmSHziUCDNMFzOHA=;
 b=atziFW3vc50t9wsGToI7jvLC+lQ8rLKKO/12sQI5bwqC/HGN+hUhDLIwJW5BEfDKLs
 AppMMikDeFWdVBznP2fEpfbuc6yjeDcG9U1Xf34Q1zwwBcoTITYrChYeqlTtoKwEIfZP
 yR29c6fyPU3uxkdF9NZLzaweqmPJzLUEAxt99MK0tMLKUP/wVm29h4MV99XggaS+JZaf
 hxpgaplfPGDVJMO801RU0Bnjwr5Uf1/U9VQ4XTwYeGlh2O7Kcxf99RY+t/8J+vD91cVT
 KB4S4aagt0BA1njwAuwr1QUS4aoLW0n1LuCDHbZOrOowDHFDeIX+4rydRlCEoVyrSz91
 Z0sQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlBoCkOzmYZRwGWcqb1NY69SO8OMPr810gMX7NRew2DlF82vX+aYC4FxukxMEMek1c8VNCTIxY/wE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTWljaNulT3WYinHokKsepLK0ko+zPglFObkR4c/z3ZrW+QF4X
 oKBrkeMQVo+16T+qUSgOY9vO9P2fV4vofptwPGO99yQww6bWCQcsvoLOqNvthRH/WEDd78RsqOI
 RFPX6QfNzoYwdzXo+ptqLkwEsieFD+Parmc7eE/ZJJ+uEFrti/16AN40P8MHoaVJXBH0=
X-Gm-Gg: ASbGncu4HqD0M5sQ/w0ve2r9X5D2z73jaItSh5KyD1/IJPEv9+1d2aNWCt+kKHZwfbJ
 xXCdUBnTL0wgnv0sM8RisxTMeJFOj0wV5rYduJKjr+QgghR+Obfmr0xNkQGO6B+1qQV252tYW1k
 sxl4JlD9fklmNY8AJ6b9h4Gnci2uUTZLl12bsoUxbydrWYRYbU0+Bd295d/A9VGmyRpVbmjo0pb
 SQKTrfNfA3iAXYwAaDvU2SvDtcLrIIBGz6vc91FNiLTIt3T1O0Rz0YbS14AdYHiDCEAIl6a1ZBW
 k0LDDpWlEFBHQ3BompgzxzPRk7VWAFh99l0iD93tmgWAd4/Fzf4c4+i0OyNDNOkymVYjHTI4JvH
 X+rUXM6y3QSNhuHoO8x0W+fC8
X-Received: by 2002:a05:620a:280a:b0:7c7:a63c:319a with SMTP id
 af79cd13be357-7c956e7c5fdmr50051685a.9.1745442668407; 
 Wed, 23 Apr 2025 14:11:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOcujn1f1pN5wnkFBUAymhqnHRowVXS7nSEsU2cWCk3LZp7tigzFEk2SEbAqgFOYEMqvGYqA==
X-Received: by 2002:a05:620a:280a:b0:7c7:a63c:319a with SMTP id
 af79cd13be357-7c956e7c5fdmr50046885a.9.1745442667797; 
 Wed, 23 Apr 2025 14:11:07 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7cb3987csm3852e87.59.2025.04.23.14.11.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 14:11:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 00:10:19 +0300
Subject: [PATCH v2 23/33] drm/msm/dpu: get rid of DPU_DSC_HW_REV_1_2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v2-23-0a9a66a7b3a2@oss.qualcomm.com>
References: <20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com>
In-Reply-To: <20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <lumag@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=12855;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Q3MTIf4rQy+am/uHf/BMkZYmbIwxtrhN/RYvyuNUjQI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCVctzKa9fJu4DotHY6EFC71m03848hAFtkbHi
 rTcVurxiAqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAlXLQAKCRCLPIo+Aiko
 1Q3cB/0Sxn3FwqWTKfjpLAYxMM1PDjbruGyyi90Cw1OrkKBOEtRehZMQFpq+hlUgi08Thl0Y4k4
 YY/qjFhTO7DXxtJxlAk7bVPl7HNVZksR/ANnV6OZgawU1VxszbPsmvD29UcABIraNq9lvpxXJyt
 57EkE9bHworM6UiLTvj+2Y3enpWZ7hAkLXtGZGGoGXO/YRAwWOJkipmoO38gCmx3mOXK1D/yEy1
 Ke+OQD5Qlb8v5Y7Oa5B9RgxHrUWAIkwK+8YtreOh4DyAzcPmJzYWp76OtJty6FAClJPKaba5b21
 9mvA0R27BfQfRkNQocMhS1vlaJKsYJjss12wGzfWPtc8RKlF
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: e-CQC--TxZH1QEXlFVE_05Fsd9m99nrB
X-Proofpoint-ORIG-GUID: e-CQC--TxZH1QEXlFVE_05Fsd9m99nrB
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=6809576e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=C81KZioEkqZAcCmD564A:9
 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE0NCBTYWx0ZWRfX9IrR2zkyh9n6
 ddl8Heek7ZwKR/TkuT9XrYDoTrn8mruQg/MAZcGc3hWA/hk7DFbFm7SS/JyVACp8lL23q8zGpI7
 xcW2YugucsxMto7S5XCGeWInDx2RcXrflsYnHQ5AVV2zwbwYNaO8YgkW5YDFK1F+nKJTr3MTOB8
 4xfs3Adux452cUt/c1vH/+SkDQoa3LdtBNujF2VHQn6wFXeMPt/uR088KYzuOYSd4BINIH84e/t
 WvmQ0WBNMaKqa8NU+d/jaAUZs/dSJQEXtAKz4reElIosAwUpSQu9/wJjguFlGCGDkCBAqxiNZC0
 8enAf+qvxwQjEM4brpwjIu9ktKbuc9CwGoJiT0+kq+kGFC5LZ2j1vc3G9j/bVmNUXS7bqM97voU
 09d+rbBAkoJaZqwDEzojIIsGB9n/2Yc/f6Qgki1znu0xbSJF/xLTsWsH2B/+23ve8Zt51dQc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_11,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230144
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

From: Dmitry Baryshkov <lumag@kernel.org>

Continue migration to the MDSS-revision based checks and replace
DPU_DSC_HW_REV_1_2 feature bit with the core_major_ver >= 7 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 10 ++++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   |  6 ++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h |  8 ++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   |  6 ++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  |  8 ++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   |  6 ++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h |  6 ++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           |  2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c                  |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c                   |  2 +-
 11 files changed, 19 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index d64366f608ea673422bbf4e5b6ae7f4ad8570784..5f6b1251f30f3c6dfb20261a0d1bbf776ed5dd33 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -289,32 +289,30 @@ static const struct dpu_dsc_cfg sm8650_dsc[] = {
 	{
 		.name = "dce_0_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x6,
-		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_0_1", .id = DSC_1,
 		.base = 0x80000, .len = 0x6,
-		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_1,
 	}, {
 		.name = "dce_1_0", .id = DSC_2,
 		.base = 0x81000, .len = 0x6,
-		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_1_1", .id = DSC_3,
 		.base = 0x81000, .len = 0x6,
-		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_1,
 	}, {
 		.name = "dce_2_0", .id = DSC_4,
 		.base = 0x82000, .len = 0x6,
-		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_2_1", .id = DSC_5,
 		.base = 0x82000, .len = 0x6,
-		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_1,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 62de32268ee5528ff0fb16a3ff7c2baa5ea42466..bb35eea64a5af844965259cd96bef10d9955b493 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -266,22 +266,20 @@ static const struct dpu_dsc_cfg sm8350_dsc[] = {
 	{
 		.name = "dce_0_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_0_1", .id = DSC_1,
 		.base = 0x80000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_1,
 	}, {
 		.name = "dce_1_0", .id = DSC_2,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_1_1", .id = DSC_3,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_1,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 202de6f9b0c65c6f2caa9e9d5232f5b92d8bdf01..d21b2266909050fd20bf55b6fabe07351e445c5a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -150,7 +150,7 @@ static const struct dpu_dsc_cfg sc7280_dsc[] = {
 	{
 		.name = "dce_0_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_0,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 43916752cfd5836718a3770df4c8767635f77ee9..72110b2a2770435ac886e992b1ccce280c5ac3db 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -265,32 +265,28 @@ static const struct dpu_dsc_cfg sc8280xp_dsc[] = {
 	{
 		.name = "dce_0_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_0_1", .id = DSC_1,
 		.base = 0x80000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_1,
 	}, {
 		.name = "dce_1_0", .id = DSC_2,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_1_1", .id = DSC_3,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_1,
 	}, {
 		.name = "dce_2_0", .id = DSC_4,
 		.base = 0x82000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_2_1", .id = DSC_5,
 		.base = 0x82000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_1,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index d58d5b7ce79b8c069d111c3c2aa3e9cdb2c1a435..305a798768c60a2ec409c1021a91efc4eccc92fd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -279,22 +279,20 @@ static const struct dpu_dsc_cfg sm8450_dsc[] = {
 	{
 		.name = "dce_0_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_0_1", .id = DSC_1,
 		.base = 0x80000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_1,
 	}, {
 		.name = "dce_1_0", .id = DSC_2,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_1_1", .id = DSC_3,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_1,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
index 064546d4fd4538cd5a6b56fca3ee12d482a7dbb6..67aed1ebc78952c6dfce0cc9f1680fa75ec26e13 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
@@ -278,32 +278,28 @@ static const struct dpu_dsc_cfg sa8775p_dsc[] = {
 	{
 		.name = "dce_0_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_0_1", .id = DSC_1,
 		.base = 0x80000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_1,
 	}, {
 		.name = "dce_1_0", .id = DSC_2,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_1_1", .id = DSC_3,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_1,
 	}, {
 		.name = "dce_2_0", .id = DSC_4,
 		.base = 0x82000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_2_1", .id = DSC_5,
 		.base = 0x82000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_1,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 959f3e9dbc5455fe53c1bb240b5db57212f2d4eb..b54a208e48a8508c39b4e4e95c9e26ce28ba7c02 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -275,22 +275,20 @@ static const struct dpu_dsc_cfg sm8550_dsc[] = {
 	{
 		.name = "dce_0_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_0_1", .id = DSC_1,
 		.base = 0x80000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_1,
 	}, {
 		.name = "dce_1_0", .id = DSC_2,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_1_1", .id = DSC_3,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_1,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index 174cfdfcfdf9860ea86c983c6b6591ba98da5400..da2fdf01a17d29fd9a7ea46890db7a33fedee31e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -275,22 +275,20 @@ static const struct dpu_dsc_cfg x1e80100_dsc[] = {
 	{
 		.name = "dce_0_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_0_1", .id = DSC_1,
 		.base = 0x80000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2),
 		.sblk = &dsc_sblk_1,
 	}, {
 		.name = "dce_1_0", .id = DSC_2,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_1_1", .id = DSC_3,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
 		.sblk = &dsc_sblk_1,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 8e6fcb51aad8278eb80570a44a423c2443744c61..ee8dd66a68f421161961495dd68d39dd4622ecf6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -178,13 +178,11 @@ enum {
  * DSC sub-blocks/features
  * @DPU_DSC_OUTPUT_CTRL       Configure which PINGPONG block gets
  *                            the pixel output from this DSC.
- * @DPU_DSC_HW_REV_1_2        DSC block supports DSC 1.1 and 1.2
  * @DPU_DSC_NATIVE_42x_EN     Supports NATIVE_422_EN and NATIVE_420_EN encoding
  * @DPU_DSC_MAX
  */
 enum {
 	DPU_DSC_OUTPUT_CTRL = 0x1,
-	DPU_DSC_HW_REV_1_2,
 	DPU_DSC_NATIVE_42x_EN,
 	DPU_DSC_MAX
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index f3f84c8c302fb1bfe6e6d70e4110d0b89259e55c..d44461e7e1641b25c5181bf7c0c9bbedffcc869d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1043,7 +1043,7 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
 		msm_disp_snapshot_add_block(disp_state, cat->dsc[i].len, base,
 					    "%s", cat->dsc[i].name);
 
-		if (cat->dsc[i].features & BIT(DPU_DSC_HW_REV_1_2)) {
+		if (cat->mdss_ver->core_major_ver >= 7) {
 			struct dpu_dsc_blk enc = cat->dsc[i].sblk->enc;
 			struct dpu_dsc_blk ctl = cat->dsc[i].sblk->ctl;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 5d55b246b32f0757281d8743ae2d1a23cc6e333d..f917ffb85d2f1b1a0ee826f125d02980b7a79052 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -166,7 +166,7 @@ int dpu_rm_init(struct drm_device *dev,
 		struct dpu_hw_dsc *hw;
 		const struct dpu_dsc_cfg *dsc = &cat->dsc[i];
 
-		if (test_bit(DPU_DSC_HW_REV_1_2, &dsc->features))
+		if (cat->mdss_ver->core_major_ver >= 7)
 			hw = dpu_hw_dsc_init_1_2(dev, dsc, mmio);
 		else
 			hw = dpu_hw_dsc_init(dev, dsc, mmio);

-- 
2.39.5

