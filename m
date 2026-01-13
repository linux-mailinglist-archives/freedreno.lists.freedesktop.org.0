Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC95D1A749
	for <lists+freedreno@lfdr.de>; Tue, 13 Jan 2026 17:57:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 455D910E526;
	Tue, 13 Jan 2026 16:57:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GRm+XX8N";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aKSzqjfO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 105DD10E524
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 16:57:42 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60DDsQQV2071004
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 16:57:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zoh4+RntaZANZMlo0wGX4a/MmqOhckBF1Mck4hRE40U=; b=GRm+XX8NnW6VT/PC
 MTrlKH/VukDNzJkRFkNP8rxJlNAB656Yk04f30c1VUuXbLrcoUGYpFjU/4P7upuA
 Px0U0ZfUWXCD73S0hRvSqAUJMuGyLxDQjOh4O8GjieEafsCO+qjY6aMVxTRwSV5B
 kC14w6cHJgsl94PPTruQNl1WSBKAYLHfQ4SoCMIcfXRRpNL+wDKLQPdoS9rDuOyn
 rTowQr+xe2Rf/eiU25eXzhZfro3p8v9egJ11RMjP3PeRgZaf9TUKS/Vof5tO06RA
 +S8busvJi5ybrDjvOa4z2kTxZCCp1RqfFftm+dY3cR/0ua1z64+Oo9iNH2o0DIvo
 SjCEhA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnqbm8ne4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 16:57:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8ba026720eeso656266685a.1
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 08:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768323460; x=1768928260;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=zoh4+RntaZANZMlo0wGX4a/MmqOhckBF1Mck4hRE40U=;
 b=aKSzqjfOj0+TWRcolMvZmnZHZ2m8PcQ/ZTFdEPh0PO8/5962MSoYnQhz1LGufzlDue
 UYBoeANmezaf9qO2k08z99eawi42BBfHIbSuABTSEgLy3sqoOWESNVZGCmdIgmWxWroU
 lQBUygznhHmFLRTz5rp2Ul5bM5948dcXhIET3nQ9JxLlCEJxBzJPu13aB9sUKdXr6atW
 xlFLE21h5nMjaNpCWA0o1qbAvrH0KsNMZMQu7mjPOTGbtDaaQhocVtY2sY2BHAJ4rrcA
 2DaY+RLz9knKQPJg5DaJUHxZ+cJOokCPh3zvOHDWV93q4/uZZFiruQNAlO4CrAcNW/9U
 K3Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768323460; x=1768928260;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=zoh4+RntaZANZMlo0wGX4a/MmqOhckBF1Mck4hRE40U=;
 b=CYUBHcOC7FEMPC9KSN9BvgO1GUcHuCvGPBvTb+kk2C9TPs/pPDykuTyermrzCO2P+w
 jgvk0cB5WOQ0pshZZ9G5TuqQpuRjXuXcNWx0CDbs3I8SKtDrDfZ1T+oiGOqiUj3VV5nE
 0C8SO0JRgN+2CWZOsOgFQ4iEm8BSM4YTTzGk5p5yaQGB7sC5i8GkP0HH3X3OE6RfL12q
 wy8Ajc+tRV4Vu4KoV4WvbQfNGkCQh+DHH/VB4MHTAmo5n747Zj2G6Q36/XPLpoilr4Yo
 QvszpTJFLKboG8MgpmQ+ZTllWz2kphc3iqqLSvoUHMFEAP4K5Gefa1AXSCi4uomkJ3rH
 kqgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdwsh9lhvG5u8D82jNXWGw+bI8Ui6q1f6dVGMnbIoUkWcKtWbC4LAw6Jz4RS31K6aBK5iw7T5r7cM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxUV3oQ8NGTPMuAbdIFsTw70OrtlQ3oh/Knba/+wAvPHNJ055i7
 ibSRYlAofyXfXzD6H4OjQzKVhfqxfXU+x4acrSBgfIO8MzBKlPdVJl8vZX5z5VK2EAj4vj9nF3S
 h3Dg+1PledXZUsKtMaZP2xbv7aaaAx/4TB4llb1u+AGo0eP1CPq09ohKxnbueof5jSRVEnwE=
X-Gm-Gg: AY/fxX5/c4f5tomEA/Umh86Y7JyfKYwx06pHcDEVVG4NR4qbvFuTHvJwKXKOwme8+ie
 K41jeGCSduHBNWVNWcZ1a6OiEvWpe5uHKgF2Bms9KVsNGmtdNLB+H88poh7PpK5c5eybyNJRl5p
 xUPvVs+PvYWwvsxfulH3gjOE0RBMH8nZ8+mKKTmbJCIGTThSeSaKd8UfdGZ5hHKNPr05/9FOE1F
 kwSxNALDg0U5v98UxcFNEtMNVzTgZNtmiTcTMs2kDDrqQGlVfXj7KJxMfyjZnFRGDR1bdGjHoYO
 GIih8+57eiywyXgEW30J58EynTgqznwZ2BGcajwGhYP5l04rGtw+N5Ft7xOlyp7IbyJ7hpYwxT/
 zPjIk0ckDlCzxjIFRe3FL2JGmbkpOqr4fKNWB1pYur8Dwefx3AQOfzzmfx2ArnjeuKs1hTo6OTz
 HtHE0DJI2rFoYcA2f8ahnXaFM=
X-Received: by 2002:a05:620a:bd3:b0:8a2:6690:2417 with SMTP id
 af79cd13be357-8c38940bc02mr3196927685a.67.1768323460563; 
 Tue, 13 Jan 2026 08:57:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE7GjNkqy3WqZzA/o83vsr0LsFzAsfde4eD5c3ZdYChDFJVIr0SZbRBaTUWOIPjQYDWaKV2Ww==
X-Received: by 2002:a05:620a:bd3:b0:8a2:6690:2417 with SMTP id
 af79cd13be357-8c38940bc02mr3196922585a.67.1768323459955; 
 Tue, 13 Jan 2026 08:57:39 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b72af5ed2sm4788677e87.58.2026.01.13.08.57.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 08:57:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 18:57:23 +0200
Subject: [PATCH v2 08/11] media: iris: don't specify max_channels in the
 source code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-iris-ubwc-v2-8-4346a6ef07a9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2276;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=YJ8s7rg/pBWknDYmw6HVFvWkyXVJR/oPr1GbWJ+pCG0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpZnlzjwtS96w3QMPnMqqSb4hwiMO6ihseVVRgG
 gz5MShkrOWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWZ5cwAKCRCLPIo+Aiko
 1Rt0B/4+AcoK1NyIJhrsMtFwfpPsWlMI0gIUHpGK1s3Wj5+53t5W0iNpXpmv+eUJS8cGOUUK4SC
 rhiCXbQ8k4R6/RbFWWm2m2KDc1FjYd3UEetJYSkqSh/+qmChTmHTPmBsG3sx/myNr8RNdlWwR8C
 ZMJmL/yfDMYzzMr1D7mwdaRWM9qYMoOF/R27WV+abv6wT9O4oPqNAnMqRZXabVXQijQyFtGpfP3
 NhJ98Vax+ZRtnaRALQHXCXVSJRzxZWbFQFrjcXa3N8DLW276AlmxrIBe+K9x8T95Lks5xRHLT4L
 vUUQu5tUBlGBYXsgbmJksrOM+3waBqAW0W7MuAdK8MIPJ7GX
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: _8z4ETF2wIm6ATOvx0X-JrjXZ8UihKGF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE0MCBTYWx0ZWRfX52nX4r9kRUDc
 /p5Svmm0oymX8Yi7f2QWI03tWNVTBPZ42SJBiT8Q1ZeyiQhgRu9Wla914qyMieTxja/3r9bGQ68
 oh75bnuFu7TA0wyM5K5u3yo7KluPr1NoBG/F7rw0/3ObbRReqV9rk/bDfmr2XGF7BqDw71TSJZZ
 MXhCKX79EEa3RN5ZHkoJ0TKRF6psYqONnnuFELVxSvigrYKYJMfaCOcAiYe2mC8Efu31b9hHZxq
 FtW4kjOv7KOCTNQeiE37N+T3WyfrqITkJInwx+spbiM6+vgXtBUUXj+7I6+ooA+vIpKdZaq9wB6
 pMJCZ31/xd666Iyt2PkI0lc+K5LpuozfJi27MGtqCRBgaDdHqUKb/fsJJQymvKs6yWrs4oC8NBp
 Zgw2b2YV9Tv+nu+VVAOswW7Gfi8zxznHDUXUK633bg/REFzokU4hERCSThPdcBA91PefU5H8cgZ
 AdynuxfNnTg/B/tLM4g==
X-Proofpoint-ORIG-GUID: _8z4ETF2wIm6ATOvx0X-JrjXZ8UihKGF
X-Authority-Analysis: v=2.4 cv=YdmwJgRf c=1 sm=1 tr=0 ts=69667985 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=rTy9geyXzX0TkIcb0cAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
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

The UBWC max_channels spreading is specified in the Iris driver, but it
also can be calculated from the platform UBWC config. Use the platform
UBWC configuration instead of specifying it directly in the source.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 2 +-
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 1 -
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index 9945c939cd29..91dbea4c6664 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -139,7 +139,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->max_channels;
+	payload = ubwc->macrotile_mode ? 8 : 4;
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_MAX_CHANNELS,
 				    HFI_HOST_FLAGS_NONE,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index f99fcbb8fced..4abaf4615cea 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -72,7 +72,6 @@ struct tz_cp_config {
 };
 
 struct ubwc_config_data {
-	u32	max_channels;
 };
 
 struct platform_inst_caps {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index c967db452dec..e78cda7e307d 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -632,7 +632,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
 };
 
 static struct ubwc_config_data ubwc_config_sm8550 = {
-	.max_channels = 8,
 };
 
 static struct tz_cp_config tz_cp_config_sm8550 = {

-- 
2.47.3

