Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B269D2D2B7
	for <lists+freedreno@lfdr.de>; Fri, 16 Jan 2026 08:27:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60D9F10E814;
	Fri, 16 Jan 2026 07:27:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pg/8+jaD";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i7LbNStY";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C10FC10E813
 for <freedreno@lists.freedesktop.org>; Fri, 16 Jan 2026 07:27:50 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60FMbXBc1240899
 for <freedreno@lists.freedesktop.org>; Fri, 16 Jan 2026 07:27:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SZ0iwrehLKaUcajId2K+vtohdRW3UYKAHqXQkWw5X5E=; b=Pg/8+jaDveFD4Lrw
 f7e3NY6djZyZlaQNPfS6yvwZF+iLu8hJ0Gf6d+WOJk8pwmXkCEz2rMZV9+TFxtuj
 tuAOkB2ror5Rn4iVl2wFLlmVgJGjMOn2rWVfv1+N4X9Mz295NlYoFuSRAMy27+i0
 Vt2yj41lEVWAOWJtPzQdHojuKDahZG+PDqsayMbVsq8drFvrI+SMiGgscne0HpVz
 Z6kOVFZ0CLKB+P4o6tC8fIu6MfV2NqUp+Nq0JHrvHOfX2Z00479wbDuuY137C0Zn
 bW6VtBO8QhYca8LUzM2i5ulSVmNOWikgKwWayyj7bRGWlK/W578sh0sfuZ1cs08R
 il6Rig==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq96ss7b6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 16 Jan 2026 07:27:50 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-88a2e9e09e6so67059576d6.2
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 23:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768548469; x=1769153269;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SZ0iwrehLKaUcajId2K+vtohdRW3UYKAHqXQkWw5X5E=;
 b=i7LbNStYETJ0kQefHOFdZiHe6z+vc99hXa41y9e+7UIkAcggGNyOMUZR71W5dnAw/3
 yg8p3RibWXTT06B8OYnKSavnBp2NSjf/jI/FWfuxKhYi1GvAspJHYLgS7wKLDklNW66C
 R8p845jOOSEyFamIHOmzp8BxvuAzsRs5tJkcMfriAIfjcGAjcfKXzWOZdnNEsUXe5Ocy
 CyQasqKK3TWjx01+1D9duHxmHl48O8MdTRyyJMH2vG+YehqqjZoMV3Op5fsU+3dR9Ade
 SKRGtzwCx07jQayg9oKcjUjUaQrgseawRaF2zZvpjrBwDC+T6ZYi2F8iHM2gy5qI2Sv9
 KX4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768548469; x=1769153269;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=SZ0iwrehLKaUcajId2K+vtohdRW3UYKAHqXQkWw5X5E=;
 b=KVp12gFfEuXkqPb7yNUVtWZxxIFxZcsMj9FJwve6xpzz/27CPHvwLJafBGKgA1soFM
 ljpu16pYYyUdVDABBRQ88bOFX3IBG2VIvWv6gz5aGRK8/jlsjhPrU+NCLzQ4eAq8bemD
 pkFsO0VY/SMXtd7LXUdHgVDYhHGR4ZXWPErINBPU96ofYRTS47i/F5o0CXvCZ8/AsM8n
 vmah60duqIS6TYExS0/0VwSfqrZLO6FH43MwT5hHe+0BI9KFdGk4cbmuCVEzMLaiE4qR
 hNLvQNCgG7UeWeyEtH039SSmdtUdFaZx4SeFfKWIZp/BSp+mgB0nwZnzvbroqP/aNOb6
 EiTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVg1KTZ4J6B5hrnQUaK28NgBne8CWkp5R2qh7Se+ZSp9Ly6sacp+p8G/eJuTVbhSmr9LLI1Mc/9AKs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzuTPqthpl2rnVsVHad2lVQvXZuiWIPVRSYXnvO3pUovyQFg2Gx
 ws1obixVWRqRovGFNjzTTuZZCPEvXu/2+3CvjfDgWVP7GlJVyewqP7kr7Nt71uh9ik566WYu8Mh
 QogkjZMDRkZSpwlL0n6fvtsG1gSoFulzH6qhmckRIgGZruV+xFAx9QEoX36gItkdWdB5pYXs=
X-Gm-Gg: AY/fxX5qAL+T19zugcixbe0+rmJPNlXO562brJuS43VuzvekAT7NEd27279jEZ6s0oh
 n37XQYtngwy0fiLDUysZcHFdZmeq7IZyXQ31f/ABP8LkeQurpe8uGCDYf7k+u6X3QOx1W4aMR7y
 V+q6h5mLv56x8SgOIQfMJR4bBhTtDm1ycnXlC9A1KVcytMwsenyy+aBmoFFHk/z//C0eivX5QXr
 wEXm+/2tWhrE453ERI9rzwmOKVZzvugyBLSLCDIs3Gevce1oobQKt3TKYQwa2CjyezDBZPUjbCk
 CJ6BMRZN6sEYv/5puJR1SLDigUxwLBkIVS24EzMUAwlG6NPyiLTXa2YpWixxz0RYyadfWpu8+Lt
 u3d8DHSmIFGh+LrAwDOmh70k6tVfgbxjjVITLm+mysKLX5HhgAE5FZj8Wt5YyismpcGrzVGw83D
 nRCwQKo34pszbKpIESZs0rk7E=
X-Received: by 2002:a05:620a:2915:b0:8b2:e638:7dce with SMTP id
 af79cd13be357-8c6a6965342mr275659285a.75.1768548469346; 
 Thu, 15 Jan 2026 23:27:49 -0800 (PST)
X-Received: by 2002:a05:620a:2915:b0:8b2:e638:7dce with SMTP id
 af79cd13be357-8c6a6965342mr275658285a.75.1768548468955; 
 Thu, 15 Jan 2026 23:27:48 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf3976dbsm516941e87.66.2026.01.15.23.27.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 23:27:47 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 09:27:40 +0200
Subject: [PATCH v3 6/9] media: iris: don't specify ubwc_swizzle in the
 source code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-iris-ubwc-v3-6-662ac0e0761f@oss.qualcomm.com>
References: <20260116-iris-ubwc-v3-0-662ac0e0761f@oss.qualcomm.com>
In-Reply-To: <20260116-iris-ubwc-v3-0-662ac0e0761f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3239;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=CLwtGbYMk7JPP0q90MTX23YSmAwj3tjnRTfHx1oOcwo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpaehqux+edbq6z3a9Wwtvn4DrpEkdkreFomTW/
 0GyHvpNqbOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWnoagAKCRCLPIo+Aiko
 1fzFB/9pnnNJp6fEXrEne1FHN5Ync/IFqS/ZFBzmZieZpTw/pBAe6HMkip31brV2LXiZyM2Spbl
 Z3uUdfVSWgBHzCAZL4Y1BpMnHaNKQ7nyZv9GFFzTBAVkAfIJcKZL+8G1E/JjV/ocDcwhqkFXJmQ
 4LT/65d5sIOcB/eau8UROFDkSi3pqw3BXmISQZYQBi6EfhycwuUQRjyKtOOu76s6Vf0pCQq61qj
 hDwfOJFu576VddZN/81TifqFo3cReZLLZtJM8al0buBeDbOMisdEC05Uze8bf1wFlQWeK+VyvTp
 YWYaZQQe4wnVYjcyMoTZvBSVA+9vK233vviPiZIBfYvd/rk4
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: eNvZI_UEjCANm-8vLyxZZtSyoBAOKdhV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA1NyBTYWx0ZWRfXwUplOpL0VBNw
 szpddgXNz8I97Zipta0zHAC0d2DmPQPSf5Uw0bqtfwJAthTzysqYZjfNLJgRwLt/kwIf+ZAnLPx
 FXGoank6mLO7S6y3l99JgNOy6wKW3w8DnYRACqXlAKPm28cD41ZhDyuRA5Mr0Us6puCEKdXT0xY
 7jlklVQ3LkRrminrz+GtnJw/hY+ct6VK3ZIvjF/Cjk15Jbb79cIQNlO0zBkTkUNkQqNwlpmZPsg
 NpA2wH0eGdLXiCI3aqWtSR8rWbRlLqleFTz1My0zuNozj4cQMPWxAhdzsk9EFm4ErGo3pZonQEG
 /Emf28Yk35mGbCugRQhOGapyteZf72tQ3aENZVYutM0tQDLpojxaa1CWbu4EpAKahkYoRRQlAFO
 FzyJOFGggVo+TpZErNkzUPzF5/NHfBEAzrt/b1VqYalqxi88reD0mSrHwS4YiBTrRS8Wr8kSPgT
 PcKlOpzPiW8EgDFpYOQ==
X-Proofpoint-GUID: eNvZI_UEjCANm-8vLyxZZtSyoBAOKdhV
X-Authority-Analysis: v=2.4 cv=M9tA6iws c=1 sm=1 tr=0 ts=6969e876 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=19NtJfuW7GRvGFya53UA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_02,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160057
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
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 6 +++---
 drivers/media/platform/qcom/iris/iris_platform_common.h | 3 ---
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 3 ---
 3 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index 6dc0cbaa9c19..a4d9efdbb43b 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -170,7 +170,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->bank_swzl_level;
+	payload = !!(qcom_ubwc_swizzle(ubwc) & UBWC_SWIZZLE_ENABLE_LVL1);
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_BANK_SWZL_LEVEL1,
 				    HFI_HOST_FLAGS_NONE,
@@ -180,7 +180,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->bank_swz2_level;
+	payload = !!(qcom_ubwc_swizzle(ubwc) & UBWC_SWIZZLE_ENABLE_LVL2);
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_BANK_SWZL_LEVEL2,
 				    HFI_HOST_FLAGS_NONE,
@@ -190,7 +190,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->bank_swz3_level;
+	payload = !!(qcom_ubwc_swizzle(ubwc) & UBWC_SWIZZLE_ENABLE_LVL3);
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

