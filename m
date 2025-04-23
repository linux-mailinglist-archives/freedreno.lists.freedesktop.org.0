Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7ADA99A3E
	for <lists+freedreno@lfdr.de>; Wed, 23 Apr 2025 23:11:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBA9F10E6FE;
	Wed, 23 Apr 2025 21:11:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SO5dfwEU";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A42F710E6B9
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 21:11:33 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NKOO6H011871
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 21:11:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jgEvwNkXOjaXMod39QuXEIdmoOiJSEft3Q5NtapnQtM=; b=SO5dfwEU9/1eetet
 j1wJ9kpjfl0ZlQHEiZ5uAP/stc8EUwhhhOG4yf6KGkNZZOzSWhS4byHl4s8w0NTo
 6BNcCrrYouv+Yv17AzjhIM8F2kLHnH4pF/OPfG8zbtuklof99wEvD6ELCn34Wo7C
 MFnMimQSvIGxS1BMpkL6pIiPdIGaJOnXuwOqnP2rUKYY12hkdLkSm+8ZNZPbjhNF
 8m9KWwNO4rlNMDQLJPvNhvaG7TlmXaMPujPO9wTzEUeGYO26zFZOUKNCun8wFsGZ
 OQ/YIhr69kAmw2Dg2rkBAW5/qOvXtvl0fGeHmCJz44TJkTt96c3zvDAXBDayYsji
 yplIng==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh1kdr7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 21:11:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c9255d5e8cso46714085a.1
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 14:11:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745442691; x=1746047491;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jgEvwNkXOjaXMod39QuXEIdmoOiJSEft3Q5NtapnQtM=;
 b=n/11EHJFcU2OHdDBM0gSQZHebR+RItcB+KOGcL8bvkMzaSSqmJ5cTsnCCaR2WLlJs5
 wmDbC0nWjE/aL9qY+idO020iEHR2nQXVXSzTT2tI9gCEXcGDQqf15Pfysxo+oB2F1LCC
 0bEkT0qjS+ICHwK15LlPp/aObl7yID07+S7fbCurc9G2Oes8S6r98ReRk1PpeycWWPTb
 jfMXDgCBIJquDmYQF+kh+gQBXHbQ2Q/qcfy6dRhckAScBmBWh0F16gGLfqxBcYYD7+n/
 H0XXvBz7h+v1WamlrFhm/2C3MB61QeZodHnF+lLTZDAGChqr4bJPmZmIVKKYeMRBx5y+
 NqaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0FmaBMEGlLn+Z5TZe7t7Csa+BVudm6c/lnQE5eGzAcmnduah6EuAdFQ+Q806/RvrMCYZbJEaCCtU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyEw9soSkvTPTE9CGEzviUcKzx3uFUZBSD3LwRXPoCB+QD1LPuX
 UTom33Md2wEjSywof4GF7Xs4obQMDnRt0l4l9Pyn5Lc+5Js2hMWfHdpQE0kixYwR07D0gIjJfH+
 NxG2j7ESSz8MjzCfAhYAdZWCec0ThpqGPnBDcqDOaj2nG/YakNnQJz+rwAFJSlraS9to=
X-Gm-Gg: ASbGncuAIAnMxxvtE3nLZEbp2ioN1eipmDL84/VToffCc3UQdBNsH812oFgbqNwd6YM
 gEs+1/XRe1pyNlfxpmElzvHR/9ZiMcBXo4oHuIBi/ePMJPEBhV9ae0ufSnQ9axv3CO8XeVGu6gb
 RrLdCntTHtMqb/AgJj7e4pEBYJzGKfhC+puaoND8z5Wdh93xBmz0G+LzQrm8a4POuCz2gBzPqJ9
 PvYj4vmBWguE1Ix1ywu6SxStUVny85yRKvR8N1wDMhejGVvZR5+wWPtdFPU/2XXift3u2/plsBc
 8WRpZ6PVnAtb3Hg9GKzF5gQVJwkLJUKUYaFE07h19flREZuFZGzOjADmGhHj+X6aG/ONTX10R/O
 8rcTQqrX6+IXgyoDeojguPV8P
X-Received: by 2002:a05:620a:4542:b0:7c5:6ef2:275d with SMTP id
 af79cd13be357-7c956f3ffa4mr53963185a.52.1745442691017; 
 Wed, 23 Apr 2025 14:11:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHW2ePxZMKGcrIPEGEnfspG8OTRvWwwqz0nE2fFB6SPB+gZgxxA2lywd2kNj8KtEOCZ718yLw==
X-Received: by 2002:a05:620a:4542:b0:7c5:6ef2:275d with SMTP id
 af79cd13be357-7c956f3ffa4mr53958185a.52.1745442690462; 
 Wed, 23 Apr 2025 14:11:30 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7cb3987csm3852e87.59.2025.04.23.14.11.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 14:11:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 00:10:27 +0300
Subject: [PATCH v2 31/33] drm/msm/dpu: get rid of DPU_DSC_NATIVE_42x_EN
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v2-31-0a9a66a7b3a2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9210;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=19/sQF6QrfTaWj5BCZQZWlAaWBLn1zVu4zT1/dnr23I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCVcvSVX3Fl1q19ysQzBAKNvkB0UpGJyQwd+RE
 CUDAJSvQBuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAlXLwAKCRCLPIo+Aiko
 1XaiCACix2jsUApvtFxwkZJdFtUTSLX4Qf5+v2nGdUS2K/p0L9doTAknG+O9aZEqAdBG34RjmUA
 QjpGXoPpleSNIIire2g0SnjXewH9sQ86xaEFWHr66xpNoouEf8qLGzPIgogCsIKvDalumLjVDuS
 AvbnT2gc0K/dMlCCc4/PGaMXPBjAD7BeNADtTk7RmpEMbhD6aVlHMOVzHdDGEWfvf0r7t0Y0yhu
 Ezz8cYQEXBteJM8r1MJAOiF+YQoduYG8SWE7Ej1Z86RHqokpnlB2ecdHZxM5IGAEsVOJBHfL/k7
 kLfjRnfPTYiKkL24tygwj3RiHkbgovPjfQ5OeEm5J/uG+1jg
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: j5FyU696obxTgHD1klbZcteR9iTMPQn2
X-Proofpoint-ORIG-GUID: j5FyU696obxTgHD1klbZcteR9iTMPQn2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE0NCBTYWx0ZWRfX82b9JcqNMjJ9
 +lYKyTYS7/VGMDcuxEP7Exx5q0xbuQDmKyOfmhUI7A6alInR21JK2QV1LgxydG3NcHEHUaWCuul
 iB+Kbfv1OGVhm63W6Wa+E3RBA0MA744hSbSqGNZG26CBBKrEsckQTu+gASHN6PwLLTTFa2/YWIl
 UB7kzAhO1OPNGyZKBCFeSN15egeeuXTDf6erK3bwzSD8pkIQ+K1TCYftC02G+jGvFh0vNKxe8w7
 nCgzsQJoRyMJwtrLtWH92Wx7prTo9PtF2XCLHUfT40GM2jwsfG4oDiFecSzfxfjTd8OaWUi0wpD
 4tCZhA04028kH36jEg8SPOl5roplw2WkgKXOUIacm4xRdVrFE2+TwJ6OBQWmqVp7IaisFVTKpMo
 Wf5HVutMw+iLB651e/rC5T0sLS6CqeHDVrftx2i5UtNcp/Ebx8mpzH777qt+UB6b7GEs7HnO
X-Authority-Analysis: v=2.4 cv=ZpjtK87G c=1 sm=1 tr=0 ts=68095785 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=bDEOCHsu97kwrKHOfzcA:9
 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_11,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 mlxlogscore=999 spamscore=0 impostorscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
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

Continue cleanup of the feature flags and replace the last remaining LM
feature with a bitfield flag, simplifying corresponding data structures
and access.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  |  8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           | 12 ++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c           |  2 +-
 10 files changed, 20 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index 2007aedc0526854d3d8c4eface5b507dc5c62c58..b8cac2dbec3c963b1a15337c64810a23ac6afc9e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -289,22 +289,22 @@ static const struct dpu_dsc_cfg sm8650_dsc[] = {
 	{
 		.name = "dce_0_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x6,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_0_1", .id = DSC_1,
 		.base = 0x80000, .len = 0x6,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_1,
 	}, {
 		.name = "dce_1_0", .id = DSC_2,
 		.base = 0x81000, .len = 0x6,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_1_1", .id = DSC_3,
 		.base = 0x81000, .len = 0x6,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_1,
 	}, {
 		.name = "dce_2_0", .id = DSC_4,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 2c59f0b77a75880df18900fa406f1ea7006927a1..26266d36520e7499feb26da0f3351405bbd2f87a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -274,12 +274,12 @@ static const struct dpu_dsc_cfg sm8350_dsc[] = {
 	}, {
 		.name = "dce_1_0", .id = DSC_2,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_1_1", .id = DSC_3,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_1,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index cbc7e9081288fb8125438ad1cc0016042bf70661..3881dc839db71dd798863067a8469cdf3045719c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -150,7 +150,7 @@ static const struct dpu_dsc_cfg sc7280_dsc[] = {
 	{
 		.name = "dce_0_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x4,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_0,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 0238eb019d98ad5599cc301e47bda43de762b24d..f9c572be7fea9660d03284d815067a17ac4abe4a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -273,12 +273,12 @@ static const struct dpu_dsc_cfg sc8280xp_dsc[] = {
 	}, {
 		.name = "dce_1_0", .id = DSC_2,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_1_1", .id = DSC_3,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_1,
 	}, {
 		.name = "dce_2_0", .id = DSC_4,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 3b2d99de20621a5c47a31212d7fb236e0b784d0a..08d5273554500a00a55adbe144b50fb4f8296ce7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -287,12 +287,12 @@ static const struct dpu_dsc_cfg sm8450_dsc[] = {
 	}, {
 		.name = "dce_1_0", .id = DSC_2,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_1_1", .id = DSC_3,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_1,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
index 14a1781c19bd8060d338ea52684f756258526996..d4eaf89821722bfccefe930e834cbd83d52123e0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
@@ -286,12 +286,12 @@ static const struct dpu_dsc_cfg sa8775p_dsc[] = {
 	}, {
 		.name = "dce_1_0", .id = DSC_2,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_1_1", .id = DSC_3,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_1,
 	}, {
 		.name = "dce_2_0", .id = DSC_4,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index f6893c7ea13bc0ac84b46d50a132e18e1c575a3d..83dce1aef9d991afb7f30f75724a822854be3e78 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -283,12 +283,12 @@ static const struct dpu_dsc_cfg sm8550_dsc[] = {
 	}, {
 		.name = "dce_1_0", .id = DSC_2,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_1_1", .id = DSC_3,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_1,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index f2a09026abf324a3c66c17264c8a5d8f2d75a580..2938ff15299ecc5002aa1bffd02292212fe51f03 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -283,12 +283,12 @@ static const struct dpu_dsc_cfg x1e80100_dsc[] = {
 	}, {
 		.name = "dce_1_0", .id = DSC_2,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_1_1", .id = DSC_3,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_1,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 51b330f37c901b99c7db640a0b77149c7ac8cdd7..0f78958ac4476de414d07b727c08feec1c2e9f44 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -128,16 +128,6 @@ enum {
 	DPU_VBIF_MAX
 };
 
-/**
- * DSC sub-blocks/features
- * @DPU_DSC_NATIVE_42x_EN     Supports NATIVE_422_EN and NATIVE_420_EN encoding
- * @DPU_DSC_MAX
- */
-enum {
-	DPU_DSC_NATIVE_42x_EN = 0x1,
-	DPU_DSC_MAX
-};
-
 /**
  * MACRO DPU_HW_BLK_INFO - information of HW blocks inside DPU
  * @name:              string name for debug purposes
@@ -474,10 +464,12 @@ struct dpu_merge_3d_cfg  {
  * @len:               length of hardware block
  * @features           bit mask identifying sub-blocks/features
  * @sblk:              sub-blocks information
+ * @have_native_42x:	Supports NATIVE_422 and NATIVE_420 encoding
  */
 struct dpu_dsc_cfg {
 	DPU_HW_BLK_INFO;
 	const struct dpu_dsc_sub_blks *sblk;
+	unsigned long have_native_42x : 1;
 };
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
index b9c433567262a954b7f02233f6670ee6a8476846..42b4a5dbc2442ae0f2adab80a5a3df96b35e62b0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
@@ -62,7 +62,7 @@ static int _dsc_calc_output_buf_max_addr(struct dpu_hw_dsc *hw_dsc, int num_soft
 {
 	int max_addr = 2400 / num_softslice;
 
-	if (hw_dsc->caps->features & BIT(DPU_DSC_NATIVE_42x_EN))
+	if (hw_dsc->caps->have_native_42x)
 		max_addr /= 2;
 
 	return max_addr - 1;

-- 
2.39.5

