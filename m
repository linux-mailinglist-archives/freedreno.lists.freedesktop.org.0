Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CF0D0DB8C
	for <lists+freedreno@lfdr.de>; Sat, 10 Jan 2026 20:38:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93B7610E1D9;
	Sat, 10 Jan 2026 19:38:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JDQ3fhvx";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QuR+X3hB";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C292010E1D7
 for <freedreno@lists.freedesktop.org>; Sat, 10 Jan 2026 19:38:04 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60AFdx6j3767101
 for <freedreno@lists.freedesktop.org>; Sat, 10 Jan 2026 19:38:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TlhwL1AanJnnOonkZZ2qXptmUOEaroWb0NZ1rA7+PLg=; b=JDQ3fhvxZFqJs7+7
 /xyl9fTT81ulEBVhF8rYgpfULcIkmuo0v8hQvjdIv2SA4JYb5T3td1Sy+XUL6stH
 mW5rhlzU3+qxFz4BLpW7eHL5sIq9L/TY3Mq9QPO6RJL/lkFXsGzP/vAW8sa6hzMJ
 t5FSWA8UV7df9mUp0BhBeVfkfdUHRJ/5+ZmisFjCMSX5DwVU5MaRGGNnT5OpYuHB
 5H4V/CDSp6iC3K3vw+9eTwY/VNsZyO/00Q3K8xreBtkfGn7eqw2UDvH7WmkAADoq
 yHvGPXXUi/p+JXYmPs4T8NqFsgK7O1r4+TRatwN+Hn6pEnrIOuMY0HlNHdTJqRLf
 sXIMQg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkntugkmg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 10 Jan 2026 19:38:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8bb6a7fea4dso1248730085a.0
 for <freedreno@lists.freedesktop.org>; Sat, 10 Jan 2026 11:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768073883; x=1768678683;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=TlhwL1AanJnnOonkZZ2qXptmUOEaroWb0NZ1rA7+PLg=;
 b=QuR+X3hB4ie6/zkX1CvjEcRe9ATjr96X9vgW7Lf3ME7v1cYW11r86lTCTU1/9hAjCH
 rBWDcJyicas2KSbCNSt5gk3WX3p/F1pq+FRvuUP+o1tqWXBpQ8Vdk8QIlaIzO8bTMwDU
 w4y2TCYeEPpB0duI1apHf+SbV+v9oLSnRsvEKaPUDFlB5wcCI6asFJLyZ3vkS82nrHfV
 vU7SZXE9+Vlyp19tydXz7qtWctqC0edbFsuRU21OVkP+V7SU7zq8xhjJ7hHWw/rqJR8M
 vWPg6FLmaQ3gy+ahq/snON7xkMelU9ORu4R4372djGkHEC5giqK5r/xX4NZ3xidlR6rp
 uguw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768073883; x=1768678683;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=TlhwL1AanJnnOonkZZ2qXptmUOEaroWb0NZ1rA7+PLg=;
 b=j+Jl2Zjx55PLNTkUCVJmBvjNMi0bkqyL+QykjKEqXn3liNB1rqvJx6kls6KZygpqHl
 SoAH+USrt3ehceZWK9/wKJ7/MqksD7/r/5S3a4wmaX8M2yS5zq4DimMWAFILt6G32u3+
 OfLm5gk8mi7QgzyQmArj650GgpJkcnPev4S42rQ7YvqPvrrgDK6czpgsDQIcLdXKdGgq
 i7xCvQHTXLevxJ6F9HqldcyTcyfyAIfJwxEWoY50akRi5KH1odqFdQtl7VKH+IvcZHoP
 HPHb41syiJIObei9sVXWcnV34v0+yb/uc4XkLuhwlndMyHj6wwUbZKo51wWmSCCLXpuV
 IIpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOMBJogyRk1m9w9P+4wPeA+hHdrj5l68ebEOYDGb4IR3Bfb2QtT10kfmLE+0kxEVeClDVclCNEHs4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyezP75wgw7GJPRAJMo/+oievC3lPeTsObVdMvGlXiRI4Nf/bLR
 pTp87oZ13N0nHUCadf6ORkHdU6VkGWRJoyNh2CH7MyEaBXGN2D4icYB/vTfVt8fRGgy4qxk17ZJ
 nHv9lptdkVZ5SLCZjDeJMV+XIQQOubzHaLk3T54psLkF+d4FeE7ytfPLbDSgo8Zd2WKHYDQs=
X-Gm-Gg: AY/fxX6I5vW/EThsn+RqHwUw6oWkjVMJHEoYlMiwHJ+98fMwQOxuPz8kaoZi3hhK0J4
 QqcjKutEBYlDOZdzZvl9f4QXZLlfAGDAa3zHtUBLTQ2QJaZj89AWtk3KSXbW6xZfybALB+dLgQI
 vpl6kcnf6wkm9LUpJ+te9sr/IdiBD4z1o0p+cS7zVeJz4PYjPFROVQLTU4q0MA6/lH5x6VnSuW5
 /gHZGM1rPaYax0l1qD1GO8pJyNAxXsg2kLSkNMk4j76gW+/TYJuUJtTzkVi9MasePY4L5VL9hQe
 JAZZjUoFw7pJKvbXbsPOtqR9/k9wu/F474g/k4t1oA+1wfNq5cvl558s1RadibBl0YvVFoj+u1v
 jDInBLDMNAjIlfgYeM61Rpxv6RdEZQLyVXsV9r1g5qsVKzbT3L8GnjhSQcdtoAl+EE6oykv0sbK
 Ou2r3gsixdreX7ni4E1FbaAcY=
X-Received: by 2002:a05:620a:448a:b0:8b2:eb83:b94 with SMTP id
 af79cd13be357-8c38938409emr2071093285a.25.1768073883285; 
 Sat, 10 Jan 2026 11:38:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7Fhu3fI/rHF+8/VARZB58+5uap/6Yh/hs4XYGBO8bGPn2y09pUiKUokJLfjBWQZIQw3Taxg==
X-Received: by 2002:a05:620a:448a:b0:8b2:eb83:b94 with SMTP id
 af79cd13be357-8c38938409emr2071090085a.25.1768073882841; 
 Sat, 10 Jan 2026 11:38:02 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b65d0f6absm3539700e87.42.2026.01.10.11.38.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jan 2026 11:38:02 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 10 Jan 2026 21:37:56 +0200
Subject: [PATCH 04/11] media: iris: don't specify min_acc_length in the
 source code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260110-iris-ubwc-v1-4-dd70494dcd7b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2853;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=gpcocHCUXsXafKyVqfZhuRHgjdviZ0p9/GuqdmQE/lg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpYqqTjEmTAg2fFw4dXnV/yfZCtjbevCqTOR4Lv
 uzYk/iRzDKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWKqkwAKCRCLPIo+Aiko
 1f6gB/94jLwTW2nfUZCMX4NIsS6AIuAIpXej+mAyN67FL9OzGClBIulunDjh5KAOY9TL2ZD9MAe
 qFofyQrofFYiIwZAGkQ6qyYd8aM+oADSU2ZkO5Avrh24VWvBSxdTKIsf8Dmf8wtx6MntOqml4xT
 8dXMnM5arSSOnfp5PTuNojYXC3bddT5YDktG5A9dmzIfAY+MXls8cXgYhFB6ZL4vy0OMOtlv00/
 g62jUUaEu9b0M1c8vWmB7KVcIWVtMcXxv7Pha6PPnZkjNfuZBNn192MPA9gYvexhV8GmueIzNKL
 nD8KeY/C/ra1QsbnaR+9ubdRo6ZQwAZbNqO5y3NoCbHgeKuu
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEwMDE3MyBTYWx0ZWRfX9KVKkWy/D0TG
 mNwd6b8LWLuVD6JUIS8WEODNsbPkeygYSEzMB6AxLQaO6RFDOFD7NNj2UEg41Tyjx40FvWt6q1Y
 Z3LUdJR17w8UNlZl3mFXZzYUQl7LC0B4wZFOA1gj+ilsTYyKz6zBqnEsdpu4xYtsxRtlLVqbq90
 Y2AT/Vx9+P5q1f1vEyCTmJBW4ViFFtTwSg+nOL7z698w0uVAeM3wBz5C391+KwK/I1pX2mr5Jly
 zc0B+W45a/atcJVoHyWREnx3AN8BvJYua2BybMkPGjBEQBEazw7VrS0O6UfafXhFM2I5XTi6PA3
 Tuyx1dYp2YVDiHJhJH9iErAGdWkszk0qaXIRPWI32vYkh14YHg9a9sstI77peOVMqpEG9OCSKWp
 59qgdDxid/L9S8xr+OM/urd407i0bGezpc084Ad5zgBG6IBBI7RUiliw44mqp6u1+KMVqDkGQ7v
 i94dQ2oZhbiPz1tB0tA==
X-Authority-Analysis: v=2.4 cv=R6AO2NRX c=1 sm=1 tr=0 ts=6962aa9c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=dSCyfi1qUYuBuoX4_vcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 9jaPOS636Vqhxtsow2-C7gIv9kAYI__w
X-Proofpoint-GUID: 9jaPOS636Vqhxtsow2-C7gIv9kAYI__w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-10_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601100173
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

