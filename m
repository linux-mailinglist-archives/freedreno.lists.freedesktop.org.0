Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C62D1A72E
	for <lists+freedreno@lfdr.de>; Tue, 13 Jan 2026 17:57:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DD6F10E51F;
	Tue, 13 Jan 2026 16:57:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="madejXzh";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OZaMO/F2";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1EC010E51F
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 16:57:34 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60DCW4fj3815839
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 16:57:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hAD3t824tdcwEOLVZWqxMKdxBRPHELtlY/iZHePT5Uk=; b=madejXzh4uc1tB4k
 3DyD5z8f6SMhnGpiKPkDIOK4EpEWUYevdm9MjY2TkB1Nul8CyIXONtZzE7fIfaOs
 O4ZrErUNXCUuE2gOKfE+krCjaCfkN/16qkIrpOb86nB2YYvnhqExOuy2SwAlU9u5
 jLiQPSbpdmctYEgAwc/FQ6R8JQUsMIaCx/Tcj7L1SxUWMOjPimYKfnt7TDSx3TXR
 oeJSxcVp3HXxq0X4I7XWxNU/SAD2p6h5jHIXCPG0TURfwhUfMaExyHaMJNNwYPwa
 3ZkhPdsjRvIBi3LErColwNUXqyYaa/59BHEjoKYO6dHcSmVxHdO1A0mR8NRL1rXd
 geAAMg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bng55t7ae-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 16:57:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8b2217a9c60so2496441985a.3
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 08:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768323453; x=1768928253;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hAD3t824tdcwEOLVZWqxMKdxBRPHELtlY/iZHePT5Uk=;
 b=OZaMO/F2jdvvz8l6qjMGjpAOriN+3pEY9/TA3FwteZcHk7UB2a/PlclTB0Bfu/xOog
 ktB4IYQ0jO/e6im9LCZybs2NnYS2kHEw3FM/w7qFGv+Aqq25edS5W3+JgQaHu8pU5/fy
 LjtEvN3Xqo/QKld6HSq9vZe2MjfoVOpGSuOkB/vau4ybimbwz3p/7LJq3OnBk8KayH9X
 aA0JvEYlmogJGDfQDBWcRPUW8hdsTNO2McoOngEsG309R+eiVlzM61xGZU8jqy/zzIkO
 LdFEmFbUNZaWromQPVEwpCFdUVqaFZCvx2EvN0t0CEvKlmbsVZ9qgcCce+VdApAkpW0n
 7w9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768323453; x=1768928253;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=hAD3t824tdcwEOLVZWqxMKdxBRPHELtlY/iZHePT5Uk=;
 b=n0kT8ViQUHCUjWL3aCvcNw8krtCsedjDI3iyrXa8jcEVhap6oGWJkr7dt8uqH0Bt6R
 Qltcn6q9bV1YM6w/isNKEVDPRq6a+JeI2a1EmrpwWZqqLU/glcUKGWA09I3W9ADnr1/z
 iVBxhnQLXG9cNuHZ8dZ3RUDtpN6XtrIrjzwFuTwVDdZ/RigWetg/V0Jx3BbD8+XW+KrT
 WDVAnDOZVm1N+zRcIGnPbSry1tq/3RUBYd2hjCYrkQBtZqmJ+6unhQr0IYOA6S3VzvPV
 x7ykZZ/H2hfiRq2oUcPoMWS44irie1I8NsEjoGtLtrwJBd9i9TXos14OZ+rn9HGt/XLG
 37Zw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVWcjDedgubuVSIGeYlLhZo6XA2QD6nDclTrzhTbccE/gPJZgJi1dIEZzIG+iX+QzJI0a2x4SGUxI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyL5osJxSCgpnHkdSVWP7lL7amM+RjE0sPa4MzLkvs/4oY2d0gZ
 k8S9LmziBlKWX6N6TmSX4VBOPnr8SyTzC6j04VfDlc08m4f6h/vNOd3LyAcwZe0vZTaWCdPnJLO
 sCRkn3Ma7r0D56gRab/9U5Rs53/teE/x5LWUT0MLljx/NBZBK1N2YC/IMFf5xVjBDOviJJy8=
X-Gm-Gg: AY/fxX5savEcvz/Q4IaHdneg4BR7SCcWYmRRsKqniAWRNuZY8A+/62kvfUILDEYJo9Z
 ZkmaesLPybzf8N6Z8b1AYS0uZu2wlN1QGnsewl6wdG7aVR++dWVVp+wMP27axy25NSzayTXbkvN
 AyfGeVW8QtE6R4Y48Ide5tpTM/NnhHfd/fr13cDKqZPS88ZraW9pAyALwqTIifbr9Xm7AIXNH7p
 97V50x4tM1p/tzQK6ypUqE3LzpqYc7rdIsPyaihx41SI/P5/YSlTfG7CKDZ18PheRBTLRHdwaVa
 InVjVLG1qfT4tX1oIYkTj+rPaJcrUwYauyQ1oG8AK6naH932Tk+cbXh7XulEpUcaXRl7ftz0lII
 LbsBZIh8uXwnuk6ZLxjp8eBjvOyOdvpMFpkyePMlewvwFf6KcmrcEc3lKtobmkrwQkM1bA/SfUl
 efaFGWZm3odlMpxbPJFNxyB1s=
X-Received: by 2002:a05:620a:2954:b0:8c3:55bf:735b with SMTP id
 af79cd13be357-8c38941de7cmr3129015685a.81.1768323452931; 
 Tue, 13 Jan 2026 08:57:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFzABrhjIiz68f42H+KyJlrj7ATlYywKpQYCMtXQALfTAzDdPFy4bgFmJXrf3a4G5QttWZWIw==
X-Received: by 2002:a05:620a:2954:b0:8c3:55bf:735b with SMTP id
 af79cd13be357-8c38941de7cmr3129011985a.81.1768323452433; 
 Tue, 13 Jan 2026 08:57:32 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b72af5ed2sm4788677e87.58.2026.01.13.08.57.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 08:57:31 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 18:57:19 +0200
Subject: [PATCH v2 04/11] media: iris: don't specify min_acc_length in the
 source code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-iris-ubwc-v2-4-4346a6ef07a9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2913;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=HMdQGGXMoxAFlMMe/K2Cq5GmygslrlUf47OHT0fh34c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpZnlz4MHU02rMucG+cyZiLqJlRZWRz6g5HU4W+
 KfbfV1BiDSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWZ5cwAKCRCLPIo+Aiko
 1fIXCACTE42T0FJo5xNb39ByhGFcdrV8xverwN05Qjuhb2jVPNg9926oLQ/wvG8U3GZcIcenLo3
 UAwLo27BulYDZ1b4e/7plg3EYDmEsrFti8FsPMMGPPnEBkBr06ll7RxNWoJNrcLNov1QGf39Js2
 KuUbntx21eZkLoI7aHUxIa5JwVEh7MHulA0QRMomUhZGi42jEZ8/Pje5rDNhiH1r7aL1yRX9isT
 61+939iKmPzrXBjBWB6aP8zrmLKW3+BvwG50e09+ZxGdDi6rGCUg6Xou59rdu5u9sKqV8R7D3y3
 lUj0dl/keUVzGO/KdJ0UBenoLtJWeg7Pwy1xLRjfjZJd3ep1
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: XtxWOQvbRl5xq6ygmClRbw-u1yvnVBcX
X-Proofpoint-ORIG-GUID: XtxWOQvbRl5xq6ygmClRbw-u1yvnVBcX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE0MCBTYWx0ZWRfXyJ+I5VnW3hq4
 KWelFCGXWfmTPAJpzF4CiWWD4snYGddGzaP3ZUn0aHWhjujPSNqsoYKh51r4TkwW9ATd2dLzzoY
 54V/s3ZZy2ZDeEVEJj8GBAqBN6lfFU2AIYoJzd0iDXcotrlh63rnnIpLVu7RR/CO5Ff2Hi02PhU
 aZ7bGhgopxsG3WK8IGL8Jrp7CCmtyPBey0sslyxLKKXyLQ4aa03wxLS23EciG2K8K6tRj5DDdXO
 3sfWV5Al+iHwkLQ8l3uUtOkV5TgHDkX2tl+WxrKkKuMZspPAxcM7FSzx6rJS8sRk9D54KsMCkEh
 /chRnPYdfJN9zvoyxqACsjZp0NqrLxH0m/xUEgGEC+5DMS/K2BYHMh329x0XWhe1uVrpCmQLMJ0
 asqqnZt6cL8Tou8I6xioGOtARxX5DpZPZNGB0r73LTvC2DmdipMbohZq1zuVS/bVXexF5WiXpMH
 MGcSuD9rZ1yEKuPePkw==
X-Authority-Analysis: v=2.4 cv=IIsPywvG c=1 sm=1 tr=0 ts=6966797e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=tw3gK4E_mqRpSwCFd0wA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130140
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

The min_acc length can be calculated from the platform UBWC
configuration. Use the freshly introduced helper and calculate min_acc
length based on the platform UBWC configuration instead of specifying it
directly in the source.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 5 ++++-
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 1 -
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index d77fa29f44fc..878e61aa77c3 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -3,6 +3,8 @@
  * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <linux/soc/qcom/ubwc.h>
+
 #include "iris_hfi_common.h"
 #include "iris_hfi_gen2.h"
 #include "iris_hfi_gen2_packet.h"
@@ -120,6 +122,7 @@ static void iris_hfi_gen2_create_packet(struct iris_hfi_header *hdr, u32 pkt_typ
 
 void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_header *hdr)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = core->ubwc_cfg;
 	u32 payload = 0;
 
 	iris_hfi_gen2_create_header(hdr, 0, core->header_id++);
@@ -146,7 +149,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->mal_length;
+	payload = qcom_ubwc_min_acc_length_64b(ubwc) ? 64 : 32;
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_MAL_LENGTH,
 				    HFI_HOST_FLAGS_NONE,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 8d8cdb56a3c7..3c5f3f68b722 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -73,7 +73,6 @@ struct tz_cp_config {
 
 struct ubwc_config_data {
 	u32	max_channels;
-	u32	mal_length;
 	u32	highest_bank_bit;
 	u32	bank_swzl_level;
 	u32	bank_swz2_level;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index c1989240c248..c70cfc2fc553 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -633,7 +633,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
 
 static struct ubwc_config_data ubwc_config_sm8550 = {
 	.max_channels = 8,
-	.mal_length = 32,
 	.highest_bank_bit = 16,
 	.bank_swzl_level = 0,
 	.bank_swz2_level = 1,

-- 
2.47.3

