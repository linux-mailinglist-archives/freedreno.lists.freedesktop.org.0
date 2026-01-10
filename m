Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3FBD0DB92
	for <lists+freedreno@lfdr.de>; Sat, 10 Jan 2026 20:38:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A3E310E1DB;
	Sat, 10 Jan 2026 19:38:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="meN+wm9H";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eQTylc8w";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF0D410E1C1
 for <freedreno@lists.freedesktop.org>; Sat, 10 Jan 2026 19:38:05 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60AGkIWR094947
 for <freedreno@lists.freedesktop.org>; Sat, 10 Jan 2026 19:38:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 phFObqSVTNQ2TW4bvrM5rdj1a9b0rssNIUHLJzOhHY4=; b=meN+wm9HFNYDDdz/
 bah9j1YQ2f6Yckc/k/3X4dNb1O7NwaR/boY+2gbznFpxUv+4YCfN/zmPcwlBo4/p
 40ACkzEieN7VwR10VYXfV+E47z6sEfS1Exh6/BTWrQ5H6tgccXpCbfh7FvZqhXFx
 gBar0a9gdXydIEKs5Ip9HqVcAOTOazT1Hx+CLlfC4BDN6G9Y0ocHYbntLzXAsxPC
 bclZoPq+URZoiAVAEXBRMuNkLcKFZLFtVspepeP+QPYd3lfMgdO6OBFjaQMrSLDa
 rOlT5hmuV8l6mtCF5oAS+b83WrDga+BduJ+0Pd8u0N22iKN79SjVUGON8sr3+WKY
 vyGgIw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkjvxruay-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 10 Jan 2026 19:38:05 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-88a2d8b7ea5so62142986d6.0
 for <freedreno@lists.freedesktop.org>; Sat, 10 Jan 2026 11:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768073884; x=1768678684;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=phFObqSVTNQ2TW4bvrM5rdj1a9b0rssNIUHLJzOhHY4=;
 b=eQTylc8ws3VvBL7PmxJn7uBxqi4vN58sv595Iot8FBu9xthbuTuCjixF9CBJAO7ULA
 U4xotnyIaC94VSJcdZzV3N0Txn9OX7y1dthnYQlQJp1y79MumM0M2m+ye08u40j8y3a0
 pwjggrGpOTE0que6HbzJJPLVCgyZu0CYKZ7cTg/M/s6Tj6U4OtgiVD2c+5NhdMtbpl3W
 tmQM184d7uZthh3YfD2HlCS8b5L1gu+eyD+hOzgPOdALi0fnHBWHETVKLN3QuMXvvy9G
 8S9MtQNHAFQ8ocxFub3Dy5BMfVeXh70VtqI9Nnmu9Mmop/GJUzrwYxv6dEVaYb2N/5xx
 RTtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768073884; x=1768678684;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=phFObqSVTNQ2TW4bvrM5rdj1a9b0rssNIUHLJzOhHY4=;
 b=pk3wZeM/+JhfqqvY0hxKXiHDAr9awCRsvQ61pKOrFcTyfCZolsq9LEZGRU8QUsw3cj
 ANP/7Yk03iobwiZilEm/aUP93tZJbtuAf2qRA6zlABPPtOq9aeL+f1Pcr0dkN8Ol6Kty
 TQvSUlh1bfEbyBblzTyC7Spd4Lf0Pz8fFzJWvX4PSw1wVAOiU70RUhhh/7i3zL7YwOQP
 DrHZxVGAHNwQxZ4v96t4VsM5TgurTQS6/7wfR3H7g8Nbegvb7jXzIozoEq11YGqLOr3s
 BKhcPABJFbAO4YLbsSNbSnton1t9L+RqJI48rkoHVwObDHogcyISRdc23EqzoNas1Hk+
 C3Ng==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDrNii0zqeV8LFeuucp26RlSFos9lPQRKT2VfKoHLe2/hKsQetawSiIGG0hTnTT5+OhTHklTmtGXA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywp3HpHoKZLJkug+iVAPGHth+uw8hzLlDM6fGWf2YQFPYysHwHS
 1CVgbvMHygXMzv3jtt6fxpl2ayPp7+aEOQCek8MrSU4rqoY9LEfLO4BqK7b+0KFXkzdfL+LVD6X
 f/Hsxb93bhzq7LDNhROMYe/tz4g6Nn5z1RltRMUPcJerlpz3cET39uWDd4w0dPvry9h/3VOE=
X-Gm-Gg: AY/fxX5he1XRwc1Gc5sV+7UT4vGEufUxGY2zcP+RQzXCS+N0iHqsAS6PPtwyn9WF4kC
 JuaWVIJQ1GtUQK9eQio+HQL8fmlAIwbQem7TLaO9xUlOl17LoEVwGfZCjVQq8aE92Q10tN0z6Sw
 icpgASeYKk7IlYmtxhr4pKWAfoGR4RxdClh6mGyMGrP5X1ywBVcxADH1VZiEQgmWNQO8n09/nuV
 41vOLlgND+LPCnfDEpXPNQExzHgJW/tiM4Lx/q/wf/tp9NOTYvODpLdR0YtlbXm0A2QiS8J0O9w
 pUc6xtTlP7bLDDVNvsnleUZNrx0fAySkTvi+Gswirvz4LmhtmY9MWa6iW7n/iQ9fAM90AAzV5Dk
 dDG9NllB7+RQ2YxoOiS5QqpElToqsFeTKSp7penI1h4yPFfbxEiBre37SL3pFdF3ng21gHcDnuo
 aGEVTGqUgtXe5NVb033CP46JY=
X-Received: by 2002:a05:6214:202b:b0:87d:e456:4786 with SMTP id
 6a1803df08f44-8908426ab50mr179708656d6.45.1768073884427; 
 Sat, 10 Jan 2026 11:38:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrvCJxK5E/lItE74kRDCtOeI+UlaEXrEZFIHoPd9qyQkcxz9NSymG2Cfr+eVovwlWWnTIhyg==
X-Received: by 2002:a05:6214:202b:b0:87d:e456:4786 with SMTP id
 6a1803df08f44-8908426ab50mr179708326d6.45.1768073883937; 
 Sat, 10 Jan 2026 11:38:03 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b65d0f6absm3539700e87.42.2026.01.10.11.38.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jan 2026 11:38:03 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 10 Jan 2026 21:37:57 +0200
Subject: [PATCH 05/11] media: iris: don't specify highest_bank_bit in the
 source code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260110-iris-ubwc-v1-5-dd70494dcd7b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2205;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Vy9tVwOAA5YcL1Np1wJJTKlwneoNR0tSHzfBWTZUVqY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpYqqTpbtQDEaVekUIxIorLinJK+7zjJlGSZMwM
 IVJk9KPFVqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWKqkwAKCRCLPIo+Aiko
 1eHlB/4kUeCqrKqRYoiDCTdAHwW+RQxJdDp+scPXwVIAisZhOAeXVsPpYM+t0YOd1l7pRcUZ1nh
 KKM5HfETppQXrnooOWhfprp32HjTruoZvQ/ySA7bMZk7n8IaLyW+Z7Ute1JeebTfVfWWm+p+Sc5
 nAOeI8+T/0TxChsPUAgiucmG8gotqLveV4inEzeyoUVZTuZ7abJUn/3CG5NmlakEt321MQy15VI
 80fRTK63d3lAwlw1js6cuGlSp1PTyWK2bk3B56afJghYwHnKg3mwE6nK6FVjrJ8gf+4EEMNGB2r
 NahK5yVFqDXNOzCLivlIoHa9GoccIsmhk01fIiI6MXDJQceA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Wrsm8Nfv c=1 sm=1 tr=0 ts=6962aa9d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=DVbmZvK3Bkzfg3EmCNkA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: NoVO33JgT1uP9oRaph0bYz4NPbcD-IJO
X-Proofpoint-ORIG-GUID: NoVO33JgT1uP9oRaph0bYz4NPbcD-IJO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEwMDE3MyBTYWx0ZWRfX/Z8OmsRxnvcs
 Cn87jUUA5UWYzTlRFAB95/BIGHm/sSKrDnb2Mh7ESKMQAZr81PJU+LcFF/hRFA/9gKTfGsMjf6g
 P8PsvpqQ/9eo9AljqpdPslMXf5DwsXFZ3iXlgnRaf0q3FsN9xpH6OQuFZSjyTvyL3MsF1EPtcdg
 u1nimj34TuKgu7MU3ovwtLzrou3j0Qmr1WmgSRfJWPW/6AF2ZYDGLMgRrdOEmSmRh03iYphZiGE
 I5KrZcUnuVBklojttfs8P6Sg4xjpQ1zL1H6uAhhR9x5QGfc5KB1hC32jKz1jDn/NsPjTddwPZFM
 wOPKG7c7+dBE0V8h90v8h4+u6MVUHmbfIl01gGrDF4yCgVJp96ieMSqxOxkJl8IQpIjrYf6WR0m
 n8TPiECbpUxMVfagkZIvCB5Aa2QvNi7XG4BXD++U166Rp/Xh3jM1a7GFyhBR+E+gRD3vNSuJUKt
 Q4Zkak8UVcxbmDIzjqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-10_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
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

The highest_bank_bit param is specified both in the Iris driver and in
the platform UBWC config. Use the platform UBWC configuration instead of
specifying it directly in the source.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 2 +-
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 1 -
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index 878e61aa77c3..a4e60e9d32a4 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -159,7 +159,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->highest_bank_bit;
+	payload = ubwc->highest_bank_bit;
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_HBB,
 				    HFI_HOST_FLAGS_NONE,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 3c5f3f68b722..8421711dbe60 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -73,7 +73,6 @@ struct tz_cp_config {
 
 struct ubwc_config_data {
 	u32	max_channels;
-	u32	highest_bank_bit;
 	u32	bank_swzl_level;
 	u32	bank_swz2_level;
 	u32	bank_swz3_level;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index c70cfc2fc553..5ae996d19ffd 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -633,7 +633,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
 
 static struct ubwc_config_data ubwc_config_sm8550 = {
 	.max_channels = 8,
-	.highest_bank_bit = 16,
 	.bank_swzl_level = 0,
 	.bank_swz2_level = 1,
 	.bank_swz3_level = 1,

-- 
2.47.3

