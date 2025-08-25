Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B08F7B34353
	for <lists+freedreno@lfdr.de>; Mon, 25 Aug 2025 16:19:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8099210E4D5;
	Mon, 25 Aug 2025 14:19:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cIlOjsgy";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9DF310E4D6
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:19:45 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8HJYn006732
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:19:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +jVSUKAsQPlwDM3u72L5IpcDx7MSfvV8k0RhLT9MO78=; b=cIlOjsgy0stORp13
 cMIr4V6yg1/MoiujKBG1ddiRRx5+xYE5duh2JB9t26bVmhCQxdwhUTqerYF7fpGN
 6FQplpc7YsSF1vce94Fj79eiH/x/Gh/uO55Km6tHl9PkFYmDVdEEBPrAA8qGMy93
 6xJMKVsyIM82LaFsL5pYk07NghQIoWIhWgroBI0fo3stsMLZq9vDwyRnjrvc1Bj0
 uJdL5gqP0+LTzvV74dd5pMmy5HKcqDUAHzqoaH8Ajhu5dJwn3L7tpW0kUrAsjhgy
 GIBxSYptfir27eh2pR4gU9XjkRCS5OdBHWUHLD2c8rHHdUAVwuehw97+Z81rNwfV
 6sLcIw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5um5eqv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:19:45 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-771e319a879so866767b3a.0
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 07:19:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756131584; x=1756736384;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+jVSUKAsQPlwDM3u72L5IpcDx7MSfvV8k0RhLT9MO78=;
 b=WYD5AboUEN4qIWNl62VKqzjDWN+CmLjkYVCq9gytd1rZ9eYbJQ3UoFm8yGJ8WNMPS9
 FVNwoV2INtLasdITVNKFo+pvFWamVzIjJavYZWNSumcSYDyF5HVi59lrPMCrqgs+6sjG
 xuVi0reDclcUDrcFoi1V8yTavaxLT8hIQ/tJ5pJMYeZZyRCn+qwT6rmhNJ7vIBmYpgZz
 sA8nvG6oBWDMX6XEFk1YyVjmSBAnfk5RSlxobFaa+5Bc4rpADKJm56O2PRbMsJ3wEze6
 cersfOMWoa0pJFJIe1VmAVnfkWFx0f/cjOhQQ2e7C0ENy45A0ddg8hBrMrdB3uXUJ8O7
 Dwpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDk5RRpBbs1JOmj/34BYJFftqcEBqxKlQoHW+k//beX6aPifqpHwW+KQKbqOaEnQIKDsHnlH5swTY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzzs46l8VrpVP3c0aXlsOICF9SEm9af2Qqin4rUiwcfbfMM6JDW
 S0+Ue2E/9zQeNIEs070nJatdAj7SUw3CAZS7bZEKXsFx8a8WvLlM08sDST/LkdKhZO+au/Fnvfv
 G3YjqCzv93M7vvxxtaQ3YGJcgtG8qLn2IErWq+Crsd5zBp7OWcjjQQDeg5a3mTgMWWgT/OeI=
X-Gm-Gg: ASbGnctTBRux/xok3w9NP04s9viiZ1bCViJBEeC6qwKGqm+lvyNUCQt7ANfRnU2C/23
 x4GKNjZPnnwVACGEObsvdHOIPWe5u6D71Gdd78EVcvyHcke6lOalAlsANyWrKTSx4G8SkdkCqG6
 Tnr6EpWH+63Lquq3QClN344DV+3r+KM60sZlj3bIBak2l/kg74LroLuyu1f1dvTg7/GSqG0HzKP
 XBPuezso5WbOpWwOkmhyhgR3UzwytTMV5wAplV16QRb3csJ+MonrnvYa/QFWSUHxKXnE4N0Jya2
 cbV5LctRSwypIB623DQC2qx5Y4XWs4boaVt6eK82/okqgF3Y/G8y5QVErvpD6l6gzmVffBc=
X-Received: by 2002:a05:6a00:22d3:b0:771:ebf1:5e43 with SMTP id
 d2e1a72fcca58-771ebf167e9mr2327037b3a.8.1756131584183; 
 Mon, 25 Aug 2025 07:19:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFe0YeC0P+4yC3N9AqqpH6lpU7B9stvJ/fZZOCIPAjAFRvUMYvzfHo9d1n1TKTLxwYU2PlooQ==
X-Received: by 2002:a05:6a00:22d3:b0:771:ebf1:5e43 with SMTP id
 d2e1a72fcca58-771ebf167e9mr2327002b3a.8.1756131583615; 
 Mon, 25 Aug 2025 07:19:43 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.19.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 07:19:43 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:16:23 +0800
Subject: [PATCH v3 37/38] drm/msm/dp: fix the intf_type of MST interfaces
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-37-01faacfcdedd@oss.qualcomm.com>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
In-Reply-To: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131425; l=5326;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=+Hotjobwxn+plNyiLv9VlefYm+B1NrsXftE9mGji/Lg=;
 b=JbQJxplIOcDHZ0JmbYy/iZFMTiBfTUSofsps0wDjfQJg8eNPyTt0NnzvDfdNie2Xv99iSPYrZ
 nMia26c0WmzCZHuZ1DfLEKOJnwqj97/VWBYwvNeyEKC8FLyajce/9Jz
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Authority-Analysis: v=2.4 cv=VtIjA/2n c=1 sm=1 tr=0 ts=68ac7101 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=LQ6fVd0KmpP54VAw49oA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfX+vjGJsCbucDI
 gDiQPXYkSMoUBZX7xM3ae+RB4ChvMapIfTxPMlDjf4o23LyCmNgqQMCcyQReN+LmG6IAt4wWA83
 GXagSCWF9Ngft3HDYI+CqIZ8RmcAWXB4GD1rGYRvq1VFra5X1A85CfNLg9/MkGMdWFwuyzuKnPZ
 6Zsef5nF40z9bJEgPlnorjObENNn8ZC8rzdsvgb/+AihGsFmew2d+2+31Ijg3HSdLNHgDNHavtf
 40HzASO6538yT+L14aDgR2tOecSguBW78t/Tfk4gK1q3xf6JNMw5gohbAnFcWvHtlb7IuXTDuel
 6vvqzKd4FVFgQgyRtP4DYfYtqJxAmoFuwc+qCxtPvD6CTHT/rQLoixQ9yzWA1i2wbFuxrszcgkd
 0QWXZifN
X-Proofpoint-GUID: BDFjuWPtEGnABzbDiFr-TQrFhbwDAh78
X-Proofpoint-ORIG-GUID: BDFjuWPtEGnABzbDiFr-TQrFhbwDAh78
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_07,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230032
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

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Interface type of MST interfaces is currently INTF_NONE. Update this to
INTF_DP. And correct the intf_6 intr_underrun/intr_vsync index for
dpu_8_4_sa8775p.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h |  6 +++---
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 303d33dc7783ac91a496fa0a19860564ad0b6d5d..ea2329f0b5e977bb0ee3035ec1b3a3e23bbe5b1e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -319,7 +319,7 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
@@ -351,7 +351,7 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	}, {
 		.name = "intf_7", .id = INTF_7,
 		.base = 0x3b000, .len = 0x280,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_2,
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 18),
@@ -359,7 +359,7 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	}, {
 		.name = "intf_8", .id = INTF_8,
 		.base = 0x3c000, .len = 0x280,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
index 0f7b4a224e4c971f482c3778c92e8c170b44223f..00fd0c8cc115a4a108363f6185edf93e771b2bf5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
@@ -347,7 +347,7 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
@@ -363,15 +363,15 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 	}, {
 		.name = "intf_6", .id = INTF_6,
 		.base = 0x3A000, .len = 0x280,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
-		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 17),
-		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 16),
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 16),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 17),
 	}, {
 		.name = "intf_7", .id = INTF_7,
 		.base = 0x3b000, .len = 0x280,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 18),
@@ -379,7 +379,7 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 	}, {
 		.name = "intf_8", .id = INTF_8,
 		.base = 0x3c000, .len = 0x280,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,	/* pair with intf_4 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index 7243eebb85f36f2a8ae848f2c95d21b0bc3bebef..826f65adb18b118cf8b70208837aa7979c5701b6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -335,7 +335,7 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
@@ -367,7 +367,7 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 	}, {
 		.name = "intf_7", .id = INTF_7,
 		.base = 0x3b000, .len = 0x280,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_2,	/* pair with intf_6 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 18),
@@ -375,7 +375,7 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 	}, {
 		.name = "intf_8", .id = INTF_8,
 		.base = 0x3c000, .len = 0x280,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,	/* pair with intf_4 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),

-- 
2.34.1

