Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E48AD0DBAB
	for <lists+freedreno@lfdr.de>; Sat, 10 Jan 2026 20:38:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC14D10E25A;
	Sat, 10 Jan 2026 19:38:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cM0rv2L7";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eG8Z0qVh";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4665010E209
 for <freedreno@lists.freedesktop.org>; Sat, 10 Jan 2026 19:38:13 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60ACrWMV013954
 for <freedreno@lists.freedesktop.org>; Sat, 10 Jan 2026 19:38:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hmMTvh72OFH8FK9hNkeC+EXJs6ndcsPRG+SpIhVihcQ=; b=cM0rv2L7FzHFwqx3
 5xsBMgokLqYubG/twV09VpVAINuUEz+vV6TQr6xCto2pGIxTSRegI5eQQuv5G9U7
 Of26l3Yydm/RRPmVXKgbRK4KDt7k55yv619ls1VxHlqRN9xJhpF6AIJD6jD3TF4A
 waNGPZHS7kh5EDzKH6QjCk4c8JFQpJcb66dx9PwBgSUOQtPww9zyX0sGwbVLps5G
 Rp5WeDxWROxJBUs44Ns7c6Uy8ijIKvqWRBwN9g1UnOFQ1744R2k9hoRfCnIBzTUA
 bR3k3cAkGycdV6UEIdgiiUYy/NsOyVepJsgNcAtxmOzV7olJFkhWMKTch929Ln4L
 TyDgYw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkeush6nh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 10 Jan 2026 19:38:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c277fe676eso1587514885a.0
 for <freedreno@lists.freedesktop.org>; Sat, 10 Jan 2026 11:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768073891; x=1768678691;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hmMTvh72OFH8FK9hNkeC+EXJs6ndcsPRG+SpIhVihcQ=;
 b=eG8Z0qVh8w9LnhB6rBcKucoxusGvBa3YwfQe6Hb+JWtsk2w/X3tcjUm3DOBKOWbxcY
 H1sublB4hlrFeX+AQuqE7g1g4A+arCWYUrVhw3kIWSev5VV7qtENH+38rzfje+nqGHUX
 1h6yDA6aWv1ESMnNHueSJ0jRS0EO/jGfZwVKllbpvcG/gVUX6xRXW2qQP/Rqtw8mW6kA
 Vcj9feEwT4jqw35p97zNW1tSEE0n9oowkJ+G454NSapqW48Eszc78/7D7lkR5hM/7rDE
 e702c0P472tgMNu5MlSRG3dfofJFLGSM8V9JWDGr/JY1Qvj6KEYGnrzA+4/NaKTb0ah2
 rWOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768073891; x=1768678691;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=hmMTvh72OFH8FK9hNkeC+EXJs6ndcsPRG+SpIhVihcQ=;
 b=j/AFz0MJHl0y5RIwASNg9SnckvK8L7Uy3//0B3pkOjEP1jcyYD4Z8Ue1mu6WEs25Sr
 I036c6v8pHkfnToDv8VRnzJh1DLRYL+iap2I1CibBprzDu5zLYeJMgvwY01FQI4R29Qt
 SW7nyZX3wDCJEzNfKcHUfRi/DlHmaOPoFyuLUkMDPzeW7/3TmnMHlI+fDbXn9t0cjkCc
 TsGmLqoeSaG01PCRHu0igwpNXRLUkg2Z+cex1NdDd92b6UGbrlq06Wn6k+uc4yHz0ZMy
 nS4tv/x4nNS6C1G5Zw8dBOnzc45ejOZBiCWxZwGzEpPEep/hFuSqdate5MyZ7ZwBNrHf
 N+Bw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW95daw3T6c/RtboLrUq3ur1FvT1zJu09ugKusNxmvqI3jnSTiVEUT3oIfrmfBMfsOD4b/Q5oes6tg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyii7BvtM/WSdcFO5zjohGasAERhw9PqVFfNVw/2IYtyPf+84KQ
 9p8DUZQVS62MXT3kPtlcOLzrtbikopZf4F/sn3NG2VdshDuo6irU027QFZPQH5TqrGK5xMe4iYi
 fYxDr99MMlx2PdWPv62nx+hc7aoZLWAJMawD0VGq4S31QScybxDRS2hjhZOSlLeSfRaBh2z4+cE
 OZ9DQyoMRa
X-Gm-Gg: AY/fxX4CP9O2Mlmd+ewSkp3E1vWepfmO0uSJg/3gsmIP7IVZwSBLEFfveG2epzu8AbN
 5VRDLNJKsLnr3cpMe3I+cHc2pcC1f6TLYosO4TJ98mFiezDtFdhsLFIoqXuK2Jy4moUplnL/dOI
 wFt9Yh74Sr+88Q/FlqewLZI/4zKJVlJlUnOnWN/GJV3XweFpxvwmZ2b8TEMq9ppbraJ8CkQQoCz
 JaKkbBKCyqg6v7u/YFrwlDy3TdwXoCtno35plOrCB5hY5PgIOp2nGQ46uJthYp6G2XV7+ZdfqKn
 vACVHIpb0r36OVi1Jlirlr0Uoea7kTmXSoRxs8C37x23Y8bR+nH6vEWt5fc2cEHJKHFwVbBj0JM
 TjPaGTOHTqJI569kQpI7JRCzVcbnA2SORE2s8iPaZWMiPsVtmdsvLeLwi08mAQTLhprOYCDbv7S
 ArJvW8NDLZKg3AGmxtlJPh2T4=
X-Received: by 2002:a05:620a:1927:b0:8b2:e666:70d with SMTP id
 af79cd13be357-8c389408f8amr1840281185a.43.1768073891373; 
 Sat, 10 Jan 2026 11:38:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFMsd7h31KX1mnTrGNWla1MwkNmRGDFHNZeJ1PT0MjzybGjjVFj5LqvVdzivB0mlUVpjdv3AQ==
X-Received: by 2002:a05:620a:1927:b0:8b2:e666:70d with SMTP id
 af79cd13be357-8c389408f8amr1840278785a.43.1768073890922; 
 Sat, 10 Jan 2026 11:38:10 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b65d0f6absm3539700e87.42.2026.01.10.11.38.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jan 2026 11:38:09 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 10 Jan 2026 21:38:01 +0200
Subject: [PATCH 09/11] media: iris: drop remnants of UBWC configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260110-iris-ubwc-v1-9-dd70494dcd7b@oss.qualcomm.com>
References: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
In-Reply-To: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
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
 linux-media@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3040;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=yWAITFzIqCVqkhPtfTK3lcYC7LituzgMl9ErY9SPTQQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpYqqUdOk1GN3B+fr9J8h//iZ8sbN9u3DK0Nfvd
 3L6vfx/WmOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWKqlAAKCRCLPIo+Aiko
 1bdCB/9sdjozx6Pz6/pggn/5UdIs4Hv+8ncK4PPaFiKEAwQoEaOogM/Lx9l4rUjddfcxllUL5RU
 7WhCAuVjAfywRtkD0x4KrNS0CZuoi7mamYGUZj/e7ThvKJvczCeGPBSwm9VporfBkQWrH0RNYn4
 XIHOpIv3KtwllwrylmYLkzMzFIRAxiVIQENxYoTBlKK9ez7bQbiA/A/FqqPq24BTWorAtJRm9MW
 7XIvyt37Z0QuSjsFg2LJyY1EAOxwdWXhakhpoW8npwKo3pqGRotjyqgiSqQwYMqAFy9WwFWv/mo
 xfKiM6nLtbrxaE5aW+/NlX1key3GFp8zh2QzYiG0MFKqPNAt
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: FzIIdLvUbPa1F9Q_G7r34700PJvxd_Yc
X-Authority-Analysis: v=2.4 cv=GNMF0+NK c=1 sm=1 tr=0 ts=6962aaa4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=1FtADzHzBfM7Pcki91sA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: FzIIdLvUbPa1F9Q_G7r34700PJvxd_Yc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEwMDE3MyBTYWx0ZWRfX3gTVOpncbsiV
 /dgapk9C5kLzbVH6/a1VXY11kTdNjrl519MxuFUlA+SCTLms1VkyaNQ3IAFHMOxzXRdWAYsFC+4
 VqcCyQi3wPB+9cCKt0eb0kSMcnTKlWpghMwX7PCq9f0CKl76/qxG/ZGejr+F8ZNI7qMunWPRTuB
 YfQ3pL/T09m07gmlxkOyjExj3ZeTOjt73JZRppYmBAWzzy+sYq29NDTPKB247y7QObdYrgfcdu6
 JWUlfSYw3wV+zlNMWMMIxEgWhiFB6S67nvrGlh3eAlcQ3rVrjRYLo+G4CniYRDowGQeAvg8LXQc
 nrBrw/Cu3p2pUUNwYQO0gktxNhsJRzE4SJRFHsxodXCCNAPPsreeUAJxfT3JFMiLmDOUnFoDLxS
 dI2y4n9LBpJeagHo+9Uz6aJGVG6FdaXMlYA428HwX0cAWVQ86UVxT8alIXeZ/yF7++oqrN8hWEJ
 QuJXso1riOAmir0ckhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-10_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601100173
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

Now as all UBWC configuration bits were migrated to be used or derived
from the global UBWC platform-specific data, drop the unused struct and
field definitions.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_platform_common.h | 4 ----
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 7 -------
 2 files changed, 11 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 4abaf4615cea..3b0e9e3cfecb 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -71,9 +71,6 @@ struct tz_cp_config {
 	u32 cp_nonpixel_size;
 };
 
-struct ubwc_config_data {
-};
-
 struct platform_inst_caps {
 	u32 min_frame_width;
 	u32 max_frame_width;
@@ -218,7 +215,6 @@ struct iris_platform_data {
 	struct tz_cp_config *tz_cp_config_data;
 	u32 core_arch;
 	u32 hw_response_timeout;
-	struct ubwc_config_data *ubwc_config;
 	u32 num_vpp_pipe;
 	bool no_aon;
 	u32 max_session_count;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index e78cda7e307d..5c4f108c14a2 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -631,9 +631,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
 	{IRIS_HW_CLK,   "vcodec0_core" },
 };
 
-static struct ubwc_config_data ubwc_config_sm8550 = {
-};
-
 static struct tz_cp_config tz_cp_config_sm8550 = {
 	.cp_start = 0,
 	.cp_size = 0x25800000,
@@ -760,7 +757,6 @@ const struct iris_platform_data sm8550_data = {
 	.tz_cp_config_data = &tz_cp_config_sm8550,
 	.core_arch = VIDEO_ARCH_LX,
 	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
-	.ubwc_config = &ubwc_config_sm8550,
 	.num_vpp_pipe = 4,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
@@ -852,7 +848,6 @@ const struct iris_platform_data sm8650_data = {
 	.tz_cp_config_data = &tz_cp_config_sm8550,
 	.core_arch = VIDEO_ARCH_LX,
 	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
-	.ubwc_config = &ubwc_config_sm8550,
 	.num_vpp_pipe = 4,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
@@ -934,7 +929,6 @@ const struct iris_platform_data sm8750_data = {
 	.tz_cp_config_data = &tz_cp_config_sm8550,
 	.core_arch = VIDEO_ARCH_LX,
 	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
-	.ubwc_config = &ubwc_config_sm8550,
 	.num_vpp_pipe = 4,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
@@ -1020,7 +1014,6 @@ const struct iris_platform_data qcs8300_data = {
 	.tz_cp_config_data = &tz_cp_config_sm8550,
 	.core_arch = VIDEO_ARCH_LX,
 	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
-	.ubwc_config = &ubwc_config_sm8550,
 	.num_vpp_pipe = 2,
 	.max_session_count = 16,
 	.max_core_mbpf = ((4096 * 2176) / 256) * 4,

-- 
2.47.3

