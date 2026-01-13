Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85ECDD1A740
	for <lists+freedreno@lfdr.de>; Tue, 13 Jan 2026 17:57:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66B5310E523;
	Tue, 13 Jan 2026 16:57:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oY6JolT9";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pv1lzoX9";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B992010E529
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 16:57:39 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60DDH78r3868700
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 16:57:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KRFOrzDHl7Bw008RFEPBz4bPzE+gcbq5KL52MRaHq/8=; b=oY6JolT9I0bdB834
 OAkCxvkKSxiPh82IaeQNhYWatcuEMtj4MG+fJwYXVG7SZMjTuQuDN2WZ1K/B8I6V
 QcDxoABgcx/p/6kotNjkK/B9Wp+zQKeqgQ++xVHXBb+/O4cbc1mHFEzYt1s5Inpz
 OK7O2WUGzBIIwXZkDa+AqeZLidq3c/4R35TKi/PTwuN77ejXKzW/BOT5Xlug06OA
 k7HIBES0TJseoaaAIULW4eVbGiI8LisYVSDun+/wjcQMbV4MOsZg60P4l66MENSt
 BZPzKF7EgeVlylR+dZEuFa4dGc3e89PaVVNslg3YBfjjFGIPjdB+wO3VfPQyJ51I
 rsUlCw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnfxka556-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 16:57:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8b2dbd36752so1971507285a.0
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 08:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768323458; x=1768928258;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=KRFOrzDHl7Bw008RFEPBz4bPzE+gcbq5KL52MRaHq/8=;
 b=Pv1lzoX9cnSdG09ifrsKv2hVCLvMl6s+5eXoTou6lrUQ+ET9MVkHxBML5G59oXAj7e
 z+rlMlyV3NGQK/cylV0pfnuBuug+pq8bhZFLXdsFHIZT2F9+mNKsZUC9+sEKzWSrSZ+J
 erUUvDUktULh3521Xq5WiBYD0KMNw+S5W6E5vxou6v9bJQMmaV9HfkTfqXx5U41JnvVk
 32Bon3mNsoCE1hlybjSe+KPIknJmXYEmwkB6J33cEizcbt3EG0jJeRPi5VVmcRLGUgLI
 3Jn/V4I7xLotTCknDLS8GYpd3f6D0bPV6jAXWc/tjG7PNSzOlsK2TlRSCYqjM9c0PDi1
 c8MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768323458; x=1768928258;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=KRFOrzDHl7Bw008RFEPBz4bPzE+gcbq5KL52MRaHq/8=;
 b=M0EjHKD6OUMUSaeMdnr4DVf3T4Adz+H3lfOZ9FdmqcnHyk+hNNeB8flZwfi9ECdA5H
 c5Y7WJIrfZXWOnL8uUZv3qvnAOfRzFXLWhJWKMgWWD/82DDX5hagt/eUmZ0QWqs2/mvo
 szkUb0/Q7TXKaQblIF2/6I2ZR8VE2iHOcmBsyECPjMPs5CBtTdkMzudMBrltPkG0xv9+
 Yrt5QAlf6JU58gY64o2YmW1BzWkoW1sQ6ZZAJDqmfgIoKG39wlx3unY3oAo0Oi2a/Ct3
 v4qUfs4fZpU4fk+EkBT+rev87AyhmjfPleUGK1I2VJXrxHcqwKz1xv1AtXl+Vz2g21rg
 3zEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRw4Xyjhje+LOG1dW+1dd6T8TL0qmgNvFkkuPz9K2sr5t+2bUurmi6s0aWc+osD5pLTMCVk417V58=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy85rjbJF1A4CA45Jmfv6Xb69eiI8q+YTX0Wj87IWxNsmD7fSJo
 gB2ylgkMT/Ds4M+aFfJ+Zt41EyuyAUmCEXVP10nceDssTPq6Yus+zpSmSfiEonkSDtUlC5wqO3a
 Jxs46wZ4J1hO52daB32BVpiwasjKymAYCMgQau2JxbTtl2y9/ielXVfQNckHXaM8s7+odNk8=
X-Gm-Gg: AY/fxX7kwlaSphq9i/TShTaCiw+5wK9GZYW/6gXIqRSX5D9f2h7ksWeCVwvUk53aORO
 KXyQfVgdabAi1TBw1YWU3sFCqHR4Zw3IrsQJGzdDPLlLdrGrJiI9jVFl1Npn6uUlyqQaFw6g8im
 O4B3+XanGv5DM9rgashp7B3JTeBT4NKzy8RvoP1PfeL5vgwQ5sM3DD3TP7LUpFTCZoMbJ1Q1S4T
 Z8T1XSpWUID6LA4f1P2ycMAGg/eKFGyTu2eoqEJQcGjH+WHLOidzWMo0wChDEE2aPQWj18mdZRd
 IK4JBS7FiRO2QETxCeJv+FRxlISbfIyDjHcW5BRVSs63ovT9s7IVkl/J1kS6hh5eyuGJjCekRuG
 c1gRto/Wz4vUwgBKE5p5hsFTzPyLmn/CuXFuWISNj1EYlPbQcREWVlwvjuR9BsEPwqvwSvvH1Gc
 Y07g6gWAnE2uZpGbjpM+a3mI0=
X-Received: by 2002:a05:620a:1901:b0:8b2:1fee:4029 with SMTP id
 af79cd13be357-8c3893eb52emr3097257985a.47.1768323458063; 
 Tue, 13 Jan 2026 08:57:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCnhBVZqobojQVLXPQjzAAmSKy7O7umppS6eUXYFfY2Ev9oYVzzadqdZ3a+yy/xKodNNnH/g==
X-Received: by 2002:a05:620a:1901:b0:8b2:1fee:4029 with SMTP id
 af79cd13be357-8c3893eb52emr3097253985a.47.1768323457373; 
 Tue, 13 Jan 2026 08:57:37 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b72af5ed2sm4788677e87.58.2026.01.13.08.57.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 08:57:36 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 18:57:21 +0200
Subject: [PATCH v2 06/11] media: iris: don't specify ubwc_swizzle in the
 source code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-iris-ubwc-v2-6-4346a6ef07a9@oss.qualcomm.com>
References: <20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com>
In-Reply-To: <20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3157;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=fQxY8GjWVfh28Faxz0ICvLnZ7XfYjrCODr7t/XZ3IT0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpZnlz+/4rfxjX3nufGM9uL6JiabX0uiE7N679R
 /W3MXRZu8qJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWZ5cwAKCRCLPIo+Aiko
 1ZtWCACFa3FyEBbxtmnzw4nZsrVqgP+RQ90bdi2noxWSxt9Jv0Vu8dID28c57bkGJ4DXg7W5tDs
 whZCQvQgz2ACep+5MFJnQsVedpWDix0GBymlqJ3ddLERrjK0oYRvnxjAEG1INCvyBCn7krhos9B
 BGU+msHovll5fZ4X2aKmQsJ6AMulnTjzYc83msqWtPdQInGJe2qu9/eNY595ydBEGmkFPXaG32K
 lOamVuI9Zv8s/UuBg+cbiP9Lb08iqRiNhxnqVME9haId/SuHGiTMdmLgrUNWJoPFBd+jzTeK5f6
 pyCQEVprkq3/9sBHMdsi7Bq+Nw2c8/EJcc507SDOxQ/IAndn
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: pPECPUbrQa7Qvd-j5hidRuyhkU8--C_a
X-Proofpoint-GUID: pPECPUbrQa7Qvd-j5hidRuyhkU8--C_a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE0MCBTYWx0ZWRfXy2flIShH6pXy
 wVwTssJ0+o+ReMC2pNpqSCsLg8rr6/QWdLVKRmOOdpDhbAOkS9d49lyHsmrbKIeVIx6lLuVDrIP
 h6Tz6azAcslUG3jxWuSKYNEVAQCIcr7tI285ar1WWH81OmrZxfWgtG6+dMLLbMxvfJJas3ysXSi
 y6/EVimclS21kDZ1Kj0PaMGY6uTDQtZxhk7x6UQfU689E8jDtOBdOFoksJxl4boDiaM5P5c+gy5
 6Bq/XG2JPdhUWQVcN2fyM1ppVh458KmvGsnT6Luk03qUf3HVlFyMvu2rbtrLRM2/36S1e4gfQFc
 FFeGwBfBWRLKTZydY9QteuNtK9X1BWWrHSNOr0FJvvkd/IAGEM4d1lAhjfqaidXRBnpkWmTlTSd
 VKZjIk+407EC54wmdcAtOlTGkCBdoIWPZCi8QnhT4334mf4kFhWqt6dAZfOGjZguUIeOUMX5B8Y
 9D1PHEOMFk+i9PyHrrQ==
X-Authority-Analysis: v=2.4 cv=PvSergM3 c=1 sm=1 tr=0 ts=69667982 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=19NtJfuW7GRvGFya53UA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130140
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

The UBWC swizzle is specified both in the Iris driver and in the
platform UBWC config. Use the platform UBWC configuration instead of
specifying it directly in the source.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 6 +++---
 drivers/media/platform/qcom/iris/iris_platform_common.h | 3 ---
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 3 ---
 3 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index a4e60e9d32a4..a880751107c7 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -169,7 +169,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->bank_swzl_level;
+	payload = !!(ubwc->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL1);
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_BANK_SWZL_LEVEL1,
 				    HFI_HOST_FLAGS_NONE,
@@ -179,7 +179,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->bank_swz2_level;
+	payload = !!(ubwc->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL2);
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_BANK_SWZL_LEVEL2,
 				    HFI_HOST_FLAGS_NONE,
@@ -189,7 +189,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->bank_swz3_level;
+	payload = !!(ubwc->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL3);
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_BANK_SWZL_LEVEL3,
 				    HFI_HOST_FLAGS_NONE,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 8421711dbe60..9f9ee67e4732 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -73,9 +73,6 @@ struct tz_cp_config {
 
 struct ubwc_config_data {
 	u32	max_channels;
-	u32	bank_swzl_level;
-	u32	bank_swz2_level;
-	u32	bank_swz3_level;
 	u32	bank_spreading;
 };
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 5ae996d19ffd..0f06066d814a 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -633,9 +633,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
 
 static struct ubwc_config_data ubwc_config_sm8550 = {
 	.max_channels = 8,
-	.bank_swzl_level = 0,
-	.bank_swz2_level = 1,
-	.bank_swz3_level = 1,
 	.bank_spreading = 1,
 };
 

-- 
2.47.3

