Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BA8A9D239
	for <lists+freedreno@lfdr.de>; Fri, 25 Apr 2025 21:49:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D53110E9BD;
	Fri, 25 Apr 2025 19:49:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iNjV2Yg6";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 287A810E9BD
 for <freedreno@lists.freedesktop.org>; Fri, 25 Apr 2025 19:49:19 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGK2ZW021900
 for <freedreno@lists.freedesktop.org>; Fri, 25 Apr 2025 19:49:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 yu1pJ4v7QyzpaLYH38MD+E0KLIvxpSKT0ukBB1qszW4=; b=iNjV2Yg65YPih9MY
 NHbRpmoFU78rmRnk+K+o9vaum4aFohzqowSEbaZccjKfyzN+5H9DMFNux1W7W3M9
 j6+/3dtIcSh1Ucm0CvVxIUjcphFnQpkmFiTL+iF4p9VXk8T/eEL5rAHMWdnWEdm9
 CC1M/akHf+P34ayA3xpHoKdXYiHWC1zY8gH7iRSskYo87dXBJATif+I+aWij8uUJ
 mENwPIBmB6jm7HisrVkBgb2Ot76KEoPLpCZ3HIZCO2fgvFyrBVwYk4a/plIVmCdy
 JdmOCRdY8wkDh8vwFUFV5ZswXS5z7IK+uqYi+yuF3NdvmLmLlpF8ECr4Nnww6YSb
 jsAimA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh5j6q4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 25 Apr 2025 19:49:18 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6f2b3e4c176so55819626d6.2
 for <freedreno@lists.freedesktop.org>; Fri, 25 Apr 2025 12:49:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745610557; x=1746215357;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yu1pJ4v7QyzpaLYH38MD+E0KLIvxpSKT0ukBB1qszW4=;
 b=GQ4yyLML0XX/zWWqgB9lzFQFUMIdEjbg4jmeXIs0mcNaWlfOzBldf6L7o5hSFtBDi4
 CRT9L8/JuACalxsXgQ9Rjum8tg6L5sBt5Vq+s6jdsP5b5/yltTr3I/8W3Gel4fzsNKvc
 CrDAQhM5aWNOwW2dJoXMRRNf+XCUqeTTDqt5O3NBZI5RSqyZs53axTUOqDo+Df8ylAFM
 20GX+kWYZAVlBnJHhXJRTabv4CwEB6CYqUc1VzhimmPTBJqDJFFMuC0je5L60G2aKNH0
 4OgmZ9G4JVMJrYA0Io5vZnpCtwPD8YA1uFPCJViW0f1r1UOpqXqkYfZnI5AmBFAw4Tts
 ZaFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEWDUQ2L64fIPQDFbjeF6jvH6cylGm1AsMbqq/DS2KzFmWY/3U5SI6f5RAqZJADCeIiF8UsiSAox8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwmFHzx9bndArcMDFKf0WF/smhG5YCr0tVEqgoRVtxhKMkbCS79
 jbPB9pPGDZRiHLFRgg5c7mOq1C7wfmjHVqahNx7q15czOiSxNYUr9z02YK/Eq3YrOAKtnuNUMMh
 Koepc1mGknqkhU9TzNUHG0FTw9IOpbyKX1bNhj7RS9Gy4R1eOMgslI12fxVvr9lGhKHU=
X-Gm-Gg: ASbGnctuUr5O8CRxXYB75wqUEljA3dTQztugWT5zvnbK++PcTbGXKPPXo8gIIOMqRmA
 J+nYUg0OaTSlC8fqd5p4auaqzyLj4g8x3qq6JfRbkhaqijsjLYZIkwHwGfa5eDJb30hJAxbJTHr
 WUn7/fZubRw5b1YbYRrjwVw/GJE9YCJXN57XeAnjBH7ooi24nM8ACwbujXXjB2Cq2ceHwlg3WZx
 B7Sfq21AuLDAX2jXOZRwukWqrYS5rGKBl87zari7ZTEAmEfGZctfHCxlKgjaY9nYpBYJNBFbO7C
 IXw8XANE07AwCg4jQgu31yygLxBJsZzVIHQjpHE0hGtmz8mPKgBbSZgjHtg6MJvRCtNe7++E65L
 Od7SOsopo5nSOMv7XArvS6Ba+
X-Received: by 2002:a05:6214:242b:b0:6f2:a886:7c6d with SMTP id
 6a1803df08f44-6f4cb9b917dmr61105506d6.3.1745610557410; 
 Fri, 25 Apr 2025 12:49:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWxy8OZVy+1G4435jkDv7x9KFSTI/TlWQyS1nZQqm5LJzAOkiG4ti14J6fup+ZqQ6Lmqkrsg==
X-Received: by 2002:a05:6214:242b:b0:6f2:a886:7c6d with SMTP id
 6a1803df08f44-6f4cb9b917dmr61105196d6.3.1745610557116; 
 Fri, 25 Apr 2025 12:49:17 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7cb258b7sm725313e87.22.2025.04.25.12.49.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 12:49:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 22:49:10 +0300
Subject: [PATCH v2 3/5] drm/msm/dpu: enable SmartDMA on SC8280XP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-dpu-rework-vig-masks-v2-3-c71900687d08@oss.qualcomm.com>
References: <20250425-dpu-rework-vig-masks-v2-0-c71900687d08@oss.qualcomm.com>
In-Reply-To: <20250425-dpu-rework-vig-masks-v2-0-c71900687d08@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3144;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=CUaIe3YjEScKzRmab1Pl5aHETuKQ1a9T+G7YnxZyaYY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC+c2fBKFWyeuvlxVupBYlHsabn1JoqhaF56EP
 A1a5Yl2OECJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAvnNgAKCRCLPIo+Aiko
 1VujB/0RH8hLC2/n5KPQjXGWQdbQPf/GoiGnrLDEdFtg/55BGzkZSIzNqJJMdmP+7vsHv9MPIcG
 YcyjarvTthBVQ2gwHC8m24VeVjCeGha5APWZv38Zq8g7jZZRW0IxctLvGgswDWh348JqBMuBmUi
 pHi0183XYOLlOK5LMrCk7RjngYk5XLViEtYyM8gy382OtyZ8/gn2L8/ThiJ1yJFI18mvBsqRT5P
 old7nzpGyj4oziK/5oe8fC+TM0PUDgvkrZ2M6wcRHK33oBvuIkwlAPIkvcJIoqL9qbP60RLvoSb
 1yRl43nTtcbz9GZQhJghSKXMIh8csXpawBcumJtujOHTnnf4
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE0MSBTYWx0ZWRfX1vQxMW0ZWY7i
 jWloR8EambzZ3rRkchsW+CFnWd4Oy9ROHX8fbb3F5PzN4TH3omcu4NLrrcHG0pZ1U881vQ/EcRZ
 hI5q16nLXvGCkc8rhqueVXxSjsBDQ9FszR9YK1xAI7VT7Dv+jUJW0CTzlr14d2alr6c3t3CkIGk
 co3YUTYxN1xf1FRLHoaqJowyOk4YZ86eP1GXrs68gc/+GqwFSM+cQCQ9TUAFupvmdqvdtJetINp
 CAtwlbSU8t5HmgocezIGxZ3Sa9xt3tPSUtdI3PNBj5ut3X6NG5VsXhwkpDlE+H0+iCQJcx+c8bw
 89W36NB0xAaRaS0YczPSEBHMNm3DPqJkYrHiOI0oT9Tktdf66onHcZQzyOjUyF3AIII1PR7oG61
 BUdK+Tjgtz/SRc3bkXoSPzUdEE9BicLJA9kPtrSdWEIUySBnJqhrwUXsBOa4px2O+viqvT44
X-Proofpoint-GUID: wY1rIYnE3cP5iGpFgdRiYNNUIrCVvI6X
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=680be73e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=fm35gGnZT3d3QFCnA_UA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: wY1rIYnE3cP5iGpFgdRiYNNUIrCVvI6X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=759
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250141
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

In order to support more versatile configuration of the display pipes on
SC8280XP, enable SmartDMA for this platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index fcee1c3665f88a9defca4fec38dd76d56c97297e..923afc202f5195fa15bcfc1e141fc44134c965e4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -74,7 +74,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x2ac,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
@@ -82,7 +82,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 	}, {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x2ac,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
@@ -90,7 +90,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 	}, {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x2ac,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
@@ -98,7 +98,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 	}, {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x2ac,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
@@ -106,7 +106,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 	}, {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x2ac,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
@@ -114,7 +114,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 	}, {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x2ac,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
@@ -122,7 +122,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 	}, {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x2ac,
-		.features = DMA_CURSOR_SDM845_MASK,
+		.features = DMA_CURSOR_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
@@ -130,7 +130,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 	}, {
 		.name = "sspp_11", .id = SSPP_DMA3,
 		.base = 0x2a000, .len = 0x2ac,
-		.features = DMA_CURSOR_SDM845_MASK,
+		.features = DMA_CURSOR_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 13,
 		.type = SSPP_TYPE_DMA,

-- 
2.39.5

