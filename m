Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BE7ABC38A
	for <lists+freedreno@lfdr.de>; Mon, 19 May 2025 18:04:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1726D10E257;
	Mon, 19 May 2025 16:04:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="o6y4cNCg";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71DC010E437
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 16:04:36 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9W3fg025924
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 16:04:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 N2Tg7c1G+Z0QIHjlc8Ku8NjO4J9KNx1R3YA3YSLQhSQ=; b=o6y4cNCgWSAayhmt
 Fbgzuml5qpIMmRrIpt4ppR0bLau1ob30/A2HnN2kWZ4j64rNuKQL4xv8hiot0K2p
 KrQ/B1XS4pk5q2yvqwRqCkARRlWQYnZ/2rK72GDzpWkjwp3zQHgNrzjJE/7oPhnC
 aa1le8CaLfyOrVNlMl43wrhKct9fhfokciuFDzWC9sY01QMlmC6h7BT96KLlMEsd
 XPrg5qnNF4LXCCoBZIcnuLvw/6HFJMfs1izYtSeG6T59h2TLAu7N71h/cshlzdbX
 +U9BZLoVKNIJpjuJIFsc0O+Tpdd6KxslrtSz/b34jgbutnHjTFwFNGZ218QzGojq
 x7P8gg==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjkyn14a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 16:04:30 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id
 5614622812f47-3fab1478893so1650294b6e.2
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 09:04:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747670670; x=1748275470;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N2Tg7c1G+Z0QIHjlc8Ku8NjO4J9KNx1R3YA3YSLQhSQ=;
 b=wdOndDecC2TVqgYHXLuiV303ArIVutY11taVYB9Gh9H9W8BqPqRkch/odqhu3IgqvV
 XU6Fb0nTdAhlOFhfN7JyfSu1iIMH5agYwm++fJax8Kgbhxk7TF19TS7zwWEwi4u7RCNy
 2IZLKOoe/wNv/leVT8O/vKHZ2SBotdCDU+oEOiE45zd7hcnkPUWQTpYdbeLjVOnvc6+c
 6oLt3wUxDIbEtTlp/KQO7kzy+EYVB4I0zkGd1RV+j0R5WLBeAX/FKBFCn9RCa3GiYr23
 SMIYaPA6k3AtNzR0rIXthxqYWnJ/BN1zi7xbmxgCuTPHgaXag2EFsPpNQFBSP0I0tzrJ
 u27A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIFtQ3O0ak1H+fTwLXGcs4poeWex/sWmYVuzlkL4nyo1dI5SjVT2AqPall9/zh90DYBs4/rGfqdCE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1UoALEfwNsdxslHLiaiWTioSKz8G0ogGlN01pcBHpAXk546Cr
 ysUG2E1UrdFjzbdwDim3C7rtE75wnF6PMNhmDb0EOpiRinqMf/ik1dsyCtME3OxLRs/mUABLC4w
 pS+pePqFxm9BJsW/IFHQMCNpAgDaUu/Rt17qxUX89u4Mpj+xZXE9+kwTztHEbhFNvNdSajo4=
X-Gm-Gg: ASbGncu7+O0u5yXhn7wSYZ4s19oSkjNowzCw6aEDURuGRBlgbL5wJCWKTC2rZmxrWaw
 RfyqRA1EjGINCRSQJ2PlWv8c7Dk4U0WqG567Z9m+cZ/YFV8zMtREaqrScl34BgCLGbwN1ijZj+Q
 uGsmkm1hcTZNN3ETXQXoirPGbxYADKhrwrI2D9FxbKBukro1XAtZD/so+MKkeBjGQtvPoEbO5fB
 CToHz3V3DMx9Xsv2S1RuP3LLPKQspllhiDHVxtD31cJVyX4FLT+DbZ79vjOGEwpnqb3EqB3xat3
 YFBX1UFeCauwuDC0GIzpztlDoiMvIc9PuHI8LZc7uSgHQb1UgpmT0S2/Za1pgBDNZrueFU72S7y
 vRfTXuBk5bFq6C8sVQXBAXirI
X-Received: by 2002:a05:6808:1191:b0:401:e69a:8af2 with SMTP id
 5614622812f47-404da6f66b3mr6853424b6e.5.1747670669498; 
 Mon, 19 May 2025 09:04:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPkPpyRe/s86BATbEkDXk+jkGuRwKXnXBn1Ikckc05vQa01ZO6iwLuphreRTynFI8c06W6Rg==
X-Received: by 2002:a05:6808:1191:b0:401:e69a:8af2 with SMTP id
 5614622812f47-404da6f66b3mr6853373b6e.5.1747670668933; 
 Mon, 19 May 2025 09:04:28 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e703f6f1sm1919378e87.248.2025.05.19.09.04.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 09:04:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:04:10 +0300
Subject: [PATCH v4 08/30] drm/msm/dpu: get rid of DPU_CTL_HAS_LAYER_EXT4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-dpu-drop-features-v4-8-6c5e88e31383@oss.qualcomm.com>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
In-Reply-To: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=12512;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=DenAajGfDlpCx9eZxx/Wm6vZSrwqGZ6us7Lzpqfm7Rg=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ4Z2WFWu+Nd7YQXeqou7zPj0OGasu5L7xXt5fG7ZTefSj
 TbXrTd2MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAitus4GHq46r3VY4q5Pt/c
 L/XN6V6ph9bq4m9ONvvkOptPX5jwuNp0wvoHeuc9rJo9CoXTr35ZPa15mc8fJ4tP+n1fVoXGvG0
 /U8w1Wzvr1yLDE/87mcq7Oqr1jq7aYX8xM3rz9QI3851nNR5frut8LBzv0+w5wc5zjmvLBd13in
 4/clL9hBufL5SK2R1zyZE7jOXEdKOcmY+vlO1VCf3YfnFSQPHpa+WGgj2n++/JmLIzd0rsKU98K
 vpxw9LTb7aUNuTYpck+fruy8a6vUEtBmuA6hmzNtwxTi2r83s15KdrVYP1ZorH+ANOu9Q897aym
 tKg99KribLir+/LSY8FHVmenHbvqsFFxewdz0R/miq1RAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: ddNacVBxqLOCuuxtnpsfx514Fn9WL-oj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1MCBTYWx0ZWRfX/9ak4g7b64wI
 gixxkrGeyegslFZndsU/NqaOdWFGbpJnNKqyBiTRAi1/9BAum6/dUxyw5TbtbqPdbufcJ/+uBli
 xRyrFBL3ZBzMkpUOKP1Aqdm/nMiFLp0LFIPIEwy/NRmQSUP4ZchoRa4bm0hsLQVTp4qxDg/IUGO
 fbNYud5f3jdcWFyqDhDpvYp8oLP1Z7rxvlY57Fu1Fs+34R86tlvgmlAYa3KnoIm7zrR5A3My/l8
 Bpb8fWXeATOs7k3xzynCEht1f0maUb8hSz6yJRkTZMFCTGMUu5DKupzfe7BCw7xPaZhoqGz6K6P
 lzppaq0Ky1BojtRxioNX2sVivHDNJLDT5vD1r4arwg9nsL8vN0MCzFMSzVxNUCkdOLUxyqfcQlB
 IGIfwlxa6p3VUIBG9OYQdJHktx7eqhlr4HG1mHP8fl2FXSLWGjp+lxwO0h1m+9fXJK4Ahq2x
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=682b568e cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=KCnXgIHxdjs5WteQjqoA:9 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: ddNacVBxqLOCuuxtnpsfx514Fn9WL-oj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999 adultscore=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190150
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
DPU_CTL_HAS_LAYER_EXT4 feature bit with the core_major_ver >= 9 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           |  3 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           |  2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c               |  5 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h               |  4 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c                   |  2 +-
 9 files changed, 33 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index b14d0d6886f019c8fa06047baf734e38696f14ce..52ad7e2af0148c9ea81a2c95b270be7058fbaec1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -31,32 +31,32 @@ static const struct dpu_ctl_cfg sm8650_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x1000,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x1000,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x17000, .len = 0x1000,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x18000, .len = 0x1000,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	}, {
 		.name = "ctl_4", .id = CTL_4,
 		.base = 0x19000, .len = 0x1000,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	}, {
 		.name = "ctl_5", .id = CTL_5,
 		.base = 0x1a000, .len = 0x1000,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 4c5785332b5240109af36a1256d4ea29c348bced..83f73c7cdcc3a280285fa32230796fac57167ed6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -31,32 +31,32 @@ static const struct dpu_ctl_cfg sm8550_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x290,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x290,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x17000, .len = 0x290,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x18000, .len = 0x290,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	}, {
 		.name = "ctl_4", .id = CTL_4,
 		.base = 0x19000, .len = 0x290,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	}, {
 		.name = "ctl_5", .id = CTL_5,
 		.base = 0x1a000, .len = 0x290,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
index 960c68f33074e0cec0f33aa7d4f8f3b4cc69bac5..b21aab274703ac1f38698bee82d5d28b0fb6a0d0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
@@ -31,32 +31,32 @@ static const struct dpu_ctl_cfg sar2130p_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x290,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x290,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x17000, .len = 0x290,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x18000, .len = 0x290,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	}, {
 		.name = "ctl_4", .id = CTL_4,
 		.base = 0x19000, .len = 0x290,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	}, {
 		.name = "ctl_5", .id = CTL_5,
 		.base = 0x1a000, .len = 0x290,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index 85dcf577b844995fe11322ec506885bc4a85e33c..d7e5f4dd3bccab125b0a42f67eddf194359dc761 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -30,32 +30,32 @@ static const struct dpu_ctl_cfg x1e80100_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x290,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x290,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x17000, .len = 0x290,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x18000, .len = 0x290,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	}, {
 		.name = "ctl_4", .id = CTL_4,
 		.base = 0x19000, .len = 0x290,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	}, {
 		.name = "ctl_5", .id = CTL_5,
 		.base = 0x1a000, .len = 0x290,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 00e6f3e56ed1f9af581bad9845971fad315ef83c..a162c4f9ebd79d3ba16b50117ee7462afdbbf3d4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -110,9 +110,6 @@
 	 BIT(DPU_CTL_VM_CFG) | \
 	 BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
 
-#define CTL_SM8550_MASK \
-	(CTL_SC7280_MASK | BIT(DPU_CTL_HAS_LAYER_EXT4))
-
 #define INTF_SC7180_MASK \
 	(BIT(DPU_INTF_INPUT_CTRL) | \
 	 BIT(DPU_INTF_STATUS_SUPPORTED) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 01dd6e65f777f3b92f41e2ccb08f279650d50425..3d6c2db395b65b89845cb7281195ca5ca16c22e6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -134,7 +134,6 @@ enum {
  * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display
  * @DPU_CTL_FETCH_ACTIVE:	Active CTL for fetch HW (SSPPs)
  * @DPU_CTL_VM_CFG:		CTL config to support multiple VMs
- * @DPU_CTL_HAS_LAYER_EXT4:	CTL has the CTL_LAYER_EXT4 register
  * @DPU_CTL_DSPP_BLOCK_FLUSH:	CTL config to support dspp sub-block flush
  * @DPU_CTL_MAX
  */
@@ -143,7 +142,6 @@ enum {
 	DPU_CTL_ACTIVE_CFG,
 	DPU_CTL_FETCH_ACTIVE,
 	DPU_CTL_VM_CFG,
-	DPU_CTL_HAS_LAYER_EXT4,
 	DPU_CTL_DSPP_SUB_BLOCK_FLUSH,
 	DPU_CTL_MAX
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index d58a0f1e8edb524ff3f21ff8c96688dd2ae49541..58bdd4d33b37d83f30931f09fdf80bef41e1f0fe 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -555,7 +555,7 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
 	DPU_REG_WRITE(c, CTL_LAYER_EXT(lm), mixercfg[1]);
 	DPU_REG_WRITE(c, CTL_LAYER_EXT2(lm), mixercfg[2]);
 	DPU_REG_WRITE(c, CTL_LAYER_EXT3(lm), mixercfg[3]);
-	if ((test_bit(DPU_CTL_HAS_LAYER_EXT4, &ctx->caps->features)))
+	if (ctx->mdss_ver->core_major_ver >= 9)
 		DPU_REG_WRITE(c, CTL_LAYER_EXT4(lm), mixercfg[4]);
 }
 
@@ -743,12 +743,14 @@ static void dpu_hw_ctl_set_active_fetch_pipes(struct dpu_hw_ctl *ctx,
  * @dev:  Corresponding device for devres management
  * @cfg:  ctl_path catalog entry for which driver object is required
  * @addr: mapped register io address of MDP
+ * @mdss_ver: dpu core's major and minor versions
  * @mixer_count: Number of mixers in @mixer
  * @mixer: Pointer to an array of Layer Mixers defined in the catalog
  */
 struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
 				   const struct dpu_ctl_cfg *cfg,
 				   void __iomem *addr,
+				   const struct dpu_mdss_version *mdss_ver,
 				   u32 mixer_count,
 				   const struct dpu_lm_cfg *mixer)
 {
@@ -762,6 +764,7 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
 	c->hw.log_mask = DPU_DBG_MASK_CTL;
 
 	c->caps = cfg;
+	c->mdss_ver = mdss_ver;
 
 	if (c->caps->features & BIT(DPU_CTL_ACTIVE_CFG)) {
 		c->ops.trigger_flush = dpu_hw_ctl_trigger_flush_v1;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
index feb09590bc8fc5c77c2c673fd888c28281a98b5a..9cd9959682c21cc1c6d8d14b8fb377deb33cc10d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
@@ -274,6 +274,7 @@ struct dpu_hw_ctl_ops {
  * @pending_cwb_flush_mask: pending CWB flush
  * @pending_dsc_flush_mask: pending DSC flush
  * @pending_cdm_flush_mask: pending CDM flush
+ * @mdss_ver: MDSS revision information
  * @ops: operation list
  */
 struct dpu_hw_ctl {
@@ -295,6 +296,8 @@ struct dpu_hw_ctl {
 	u32 pending_dsc_flush_mask;
 	u32 pending_cdm_flush_mask;
 
+	const struct dpu_mdss_version *mdss_ver;
+
 	/* ops */
 	struct dpu_hw_ctl_ops ops;
 };
@@ -312,6 +315,7 @@ static inline struct dpu_hw_ctl *to_dpu_hw_ctl(struct dpu_hw_blk *hw)
 struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
 				   const struct dpu_ctl_cfg *cfg,
 				   void __iomem *addr,
+				   const struct dpu_mdss_version *mdss_ver,
 				   u32 mixer_count,
 				   const struct dpu_lm_cfg *mixer);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 2e296f79cba1437470eeb30900a650f6f4e334b6..d728e275ac427f7849dad4f4a055c56840ca2d23 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -142,7 +142,7 @@ int dpu_rm_init(struct drm_device *dev,
 		struct dpu_hw_ctl *hw;
 		const struct dpu_ctl_cfg *ctl = &cat->ctl[i];
 
-		hw = dpu_hw_ctl_init(dev, ctl, mmio, cat->mixer_count, cat->mixer);
+		hw = dpu_hw_ctl_init(dev, ctl, mmio, cat->mdss_ver, cat->mixer_count, cat->mixer);
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed ctl object creation: err %d\n", rc);

-- 
2.39.5

