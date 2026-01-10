Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D43D0DB93
	for <lists+freedreno@lfdr.de>; Sat, 10 Jan 2026 20:38:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD0DE10E202;
	Sat, 10 Jan 2026 19:38:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="E6VOGJUG";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HT7Gr9H0";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38AB810E1DB
 for <freedreno@lists.freedesktop.org>; Sat, 10 Jan 2026 19:38:07 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60AIgYlR607056
 for <freedreno@lists.freedesktop.org>; Sat, 10 Jan 2026 19:38:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gK+pnJ21j1i9U/bbLvHtPo8Y26e9MJOkY3Hs+TWsP98=; b=E6VOGJUGy61sVQhC
 sTL6ONEeLNvGbeqIEZSCr7OTYTbQQKSl3okuOUlb6Ptntc4xzteoRxhxUZQaFXVm
 2RRSkCuTUdH6U0C/yz9XjzGgt84YdUDtukdixmVfzQ+Yu6vdUY6+Tiz/mk8in0zn
 uRXBI7v49eCpFQnRyIVh1GY5sY6lIDAMgH4HJUelFLIE84mD36TPNUSpUNYqmbSv
 JpaO1Cn5n5wkV6xrCLGJQ0WV60idtUdXl8ZH5gB4bMQ2RWr+vjFchfgPwaj/IlYZ
 vWaCmBZBQAXKATq5U9fFmQQJ1xZhaJ9BpXBROTmu2ZFdFs0dTsp5Nwmn6PsbT0xk
 +jgc9g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkdqqs9kp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 10 Jan 2026 19:38:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8b234bae2a7so1472432485a.3
 for <freedreno@lists.freedesktop.org>; Sat, 10 Jan 2026 11:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768073885; x=1768678685;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=gK+pnJ21j1i9U/bbLvHtPo8Y26e9MJOkY3Hs+TWsP98=;
 b=HT7Gr9H0YQjQ4043x9XQ7Bpva7TcinAaFLJJq1TjX+7fRDAAqOTEiUfqgj34471xBJ
 tCQ7yQWGxgjyxTfBuhmxm2gppP9TkaOTlRIvVxZh68bb2XuHAbX7fUN3q+Mbb6ZI1olP
 x7DECQO3sfBU7dA4MQ06oC+KrVe8Fcr6qqUuoZHQgl5kBNEOMXrfyn1EwUi1TeKtqB1W
 31ilyAW154N96pghPTmxRo6qde/uRhNXrpT1P+f50/VWiHf15NIG91jd9cVpasCltn1B
 R3ASlWaZjTIvu8/GPAercam/DtdP8yIiGHN2auZBxn1gM1801GctqH+cYqIz+HL5QbGX
 7QRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768073885; x=1768678685;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=gK+pnJ21j1i9U/bbLvHtPo8Y26e9MJOkY3Hs+TWsP98=;
 b=vC21Sh9DFThshpGHDfwkn515GtoiFlJeVM21KIcayhBkSfrkxlrMUeQzPvy44yqZ3B
 rnhQ0VHpPSd196oFSZdC98xmX0gutUt0CbBQDmfupi26uecXe8jYdRMrS+Ktlv43lIiB
 5gexdU6sR2CUchPLu0mZr0Ono5UdFwDNj4MfzRo3fHIBf8Yl18IWCIHP0IUg5NckWcTY
 wznYIUSc/Uw51RivP9B3+sRR4mDZjmRqr73cFF6ZOfnCyv7hu85KsD1CLAv+mo8dR+27
 ezHGm4V2U5e6Z7KW2lJBqyJ0rZK/0trYGtRkSR8UFb0Kbw6mo++qxEQq/6ZhPjSCZcW8
 +vSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDCYhTo7Lt2044b0poX4OElpXLjYLRBprrzKrGXSfbRWVN1cxWbmRNM5Lvl09GA7w5YG6UKe5W30U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwMssAZfxnovI1t3oKHTcTXzfSR2+0OM2qYmCIpxYZCs2pH3dJ7
 LqGYTRhiT4NRgyKMivKaeJD1ctg80UJFG4IdKsF6/y2JNl2+4dSOfKhmPa2OKNGRUCXKWoiUU6l
 ynrym8BQK+A3yBHOWRbhASNvdLcJEU7fGjgS0edH5h7eDtDVK68OzCwnS+iiI4AxtyiHt0Ww=
X-Gm-Gg: AY/fxX4hswCNp9DOfXDp5wrPcPT7gbVuSDr+9LPqkuvMsK72AzY9l1VdjS9cBdJz6/m
 EeMr35GTbrkjRQd0s5eKoUZRCPkcCV250y0OCwUKk6MDP9cON/+G8/sCUZTGrIUOgkHTbjNWUWX
 Am9flC5sdl/4xbomO6zo3ZTrDVc8LBgD2XP/F8/ghuKhPB3Ao/UPAmTFCvOckrRWE90t1Om1oMg
 zgPDPKr8nXsRUWi1HWFAAUcNqEF0HR3wWz02APWEMZsGOuCoPL2BOtnbxuSRA09dN/0nyo/oIe9
 NTMS303sgrQmhskPTqwD/DwPAqH5qsjCjpBaO4y96VH277mw05Zyx+R6fOfXE1WH3SUvrfrgoK+
 9g/QX8j8fnBqMk4iWbMxPHPwEVyAUe4IPqeckkg++OMOMX7d0jGgZoLRBH9y3TOLs7KdAZTCHkk
 O7c4+8A69QWmRaLREtnek1Ic8=
X-Received: by 2002:a05:620a:1925:b0:8b2:ea3f:2f91 with SMTP id
 af79cd13be357-8c38941be22mr1791695385a.81.1768073885491; 
 Sat, 10 Jan 2026 11:38:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEIKWgn/ESS0qupy6xBZrxuNNEEt1VDukrNT5CaPVcHGZGReo2NFsBi2b+nv6ZXh9qRMm0aJg==
X-Received: by 2002:a05:620a:1925:b0:8b2:ea3f:2f91 with SMTP id
 af79cd13be357-8c38941be22mr1791693585a.81.1768073885052; 
 Sat, 10 Jan 2026 11:38:05 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b65d0f6absm3539700e87.42.2026.01.10.11.38.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jan 2026 11:38:04 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 10 Jan 2026 21:37:58 +0200
Subject: [PATCH 06/11] media: iris: don't specify ubwc_swizzle in the
 source code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260110-iris-ubwc-v1-6-dd70494dcd7b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3036;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=wPApkxuh4lfLkguH9VNNQc3BFntt8VOiO6TMdbr3Zds=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpYqqTqJmApBFFw10nL1vWSv+/MlslTeTh12Vy7
 IceARZggeaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWKqkwAKCRCLPIo+Aiko
 1QHuB/9SDh8YAvc7H5s3wL2CsuB8vGeKPCPurzevmcKRHH1YnrOFa7QKcZ37MhNPhXNFF6K1xxp
 jsh+JHZLsbflUJExjO1oH36XdfZg2hDrpk47mqwbOhd6x6RKZJBVUwJOxbYS+qofypTKBbliKEw
 qMJfjCjO8jHHO7/a7U5SSxk+QREto7FgnTdDPK0DbjzWAPIh9E/RX05mQmDDqq/VFCXNHyk8YJR
 Ka8rPLLcuK6cTDY8ZxwEhTMtt8934hmWXJEikYkHY90pN6ShtsSOU0N69ORl5JUbekwAuxb9nHz
 bCX2FMRAD/6/NTjuZQvhq8GbuxVkYsnoaCdJ8cwYzGuYjoPH
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: hpfhV4gi2u6LrYp8gQVyB5i4hM2qB9Rc
X-Proofpoint-GUID: hpfhV4gi2u6LrYp8gQVyB5i4hM2qB9Rc
X-Authority-Analysis: v=2.4 cv=a9M9NESF c=1 sm=1 tr=0 ts=6962aa9e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=DVbmZvK3Bkzfg3EmCNkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEwMDE3MyBTYWx0ZWRfX5kEQcaZBVnCI
 6YlYle2UnnOrlMcSXgzQSlaV6gN5YzLyaBytOj3XGnKZDMdIT+FxEXw7YJ8nLVHnw/BKFOvC5aV
 HU82M1pUBEQwJrtRS3EhFKQFHW7XtIHYEil824MZlKvLbrBfUWms2NGyg/uSWaqiXCtPMMd9WbE
 8HG2aQuGVZqbG5etoji5YB0uGMSYLROCRuppZ6pCF8wUMlDEtpqJ9rSTPuBxT6PE1bsWU8MYNnq
 eMDWy/yyByg3Q53JMrrPw2TBl7Qj1yWcV2FWjLWCwtOk5s3b/5Ao6TbspgNqRZSzP6xcWZcUewd
 auti/w7La+GXKVpmOzUxYVS9Nb7afesXbtZTmcAnQIxUaAUeqbWfUXgU1TwadDZfjjKSHJ+6Oh1
 Xnh/9g+yc9hL60+hoz/mqJxEsXWNyO+9EqhLuJo0D1x12goYNEhsgAIot00E6Je2FUKwEPeVzP5
 AKkddZf8DCn/AWcHgVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-10_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0
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

The UBWC swizzle is specified both in the Iris driver and in the
platform UBWC config. Use the platform UBWC configuration instead of
specifying it directly in the source.

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

