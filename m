Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A01D2D2AB
	for <lists+freedreno@lfdr.de>; Fri, 16 Jan 2026 08:27:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7C5910E811;
	Fri, 16 Jan 2026 07:27:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UqFTB/gk";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BEU1iEcs";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93D5210E80F
 for <freedreno@lists.freedesktop.org>; Fri, 16 Jan 2026 07:27:48 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60FMbapa3596328
 for <freedreno@lists.freedesktop.org>; Fri, 16 Jan 2026 07:27:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zJCnfFwC3vPDsJEo8QDX6Qy4iwhrLPmMctTCzdExcZQ=; b=UqFTB/gkSqAqa4vg
 bOMjaPzAclNHYHPxJbbrlhngh6bPPNfU1cTvy+xVuvgDgTagtCeLXrQVzo5JYUeB
 AnJXAAK2B5VOh4NtNjWgwfdFtXTywQYlGZHUtEqHjK6fHQhoOaST5lP2T6r5TWpW
 QLNDG+Vv7x7s35ZNicnEbkKxyL83CQZV5vKls9Wi2vbYEp/vCP9MyMSH1bZwQHFZ
 6Or+TgL7LIlLQh/GKtIuvJjfSzQdrn5WqT9qR/AK7MGwXaJH9xmQ9YscmU4jdBLp
 w4XqbjdPXeuFbEG9GjOsyz7SKusNESEERIv7S1PN8e/hM5sVeNmE8pa/6l5sGAkX
 xteTAw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq96rs79n-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 16 Jan 2026 07:27:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c52c67f65cso651593685a.1
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 23:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768548467; x=1769153267;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=zJCnfFwC3vPDsJEo8QDX6Qy4iwhrLPmMctTCzdExcZQ=;
 b=BEU1iEcsNwP0U6jkZleq6QbqAbw7LjLS72CAvsUErcJMn3x9E6oUAFAZVmINeLGOpR
 Jp4u1vIl0/9bccOdqmLfsJMveltaK8wX6v3IoBwAuulLZX3T+NT2W4XPJEsaJmV+0a21
 t9JujiXVxZLkasRlovooYSDx6UASF2RKX9JubznMxQVAsHaeGtYyetcmwIbHP7cIY7f1
 intuuf4Bbia3zzUpT/SplfIXwVz2BcMIH6kVtkGmIDd2s7ENC1/GVRUXfkFkhzxsaCnN
 8ZYpAAYi9s3oWTCr5ngubArJDTg8oKc2Xlr0d8BWzHfF21IbKBlFBF4soXSbHJbCjjwi
 Ha0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768548467; x=1769153267;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=zJCnfFwC3vPDsJEo8QDX6Qy4iwhrLPmMctTCzdExcZQ=;
 b=hj/S45tVU19U8hjluQ3mfkFCLdZXVjmkexJT+3INLQzwxhEjz7CRzo+54ZyWozKq0z
 DLTZ64BB1VlLAHf2kXmgQw8Mtoo5EkPPspTRz7pAFUMCTaA5F1T32FjsMHQF6IaWW14U
 92EmeI+aMflIpLlrJmtMZAf4g0Gfrc97oRyBGz+qls237YJgSHWcR3/dFL007fALuwVk
 oZa5i+L43SVDyDCMw0pBQ5SgGc+8K+J5vjGxfjXV9VKMEfZrMqrpC5DdIL08bJe3JaNO
 xTwwq6pvLLz4wOU0z0vj1mp/UBvBfc6nvaEJUG+ZqsvOupJ4JJZgHodYpkymy6wXQyEK
 tOKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8mJG9S7Y68whtywQt0iBkcm1Kd9Zi4Z0zfecUIzTPInEfQzI3HbZzXZbK5sdrxjyhiD2YVjAqaVQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzuRN0Q91iZFoSA1+jXpHt4l4SLGqxDHLOZlWvCogr/YT8I8jKi
 CPgVgR7CSVde3vT7vCaOJ/rOmZhVN2FXQ4GmmYARP34OGoCpcuNpchRksHFAroI5wYAXjXPturI
 6YPhyRYNXTVC6AXzAkUsPM9NkefRMVk1viF4mLGS+d8YzgFfZ6kf+QiLtO+eFRa3Ctv3fnTI=
X-Gm-Gg: AY/fxX7jo0p6oioflyeoz1bwYaEdaHCmnfneWBmhLqhkKfvhK4LPnMPglmsnAPdjaeC
 VFbWTiEaTncbVkWiZkReh9uROurSk+xOEr3W31m8odbGe4aVoLN5/X1Cd3X5GLTngSGn1Q4fOz5
 UCYLtTFT4VDq45KcL6noosBKn7EybsakrX+d07P13ChQDcu2GMPuLer7qPr2tT06Xp/78Biwr8c
 AQoAxEohj5zK7rRS+TBYoh87u9bmg3OxQ7fOdFjoyVlkJ/dXUOgxJ2ktXMcOOHxGhcERBaG8bG9
 QekTi0Bp0LtRv/G2DZ5IJ2tbvT9lWOKgyOV0wfAh+nIs1N9crjv7XXSOxd6Ev4s6vd3tlJ8xUD8
 5GAVLJUW5rzbp7CWJAd+O6M9NZ7j3gAr43KKFPKrv/k9Xcls+jRZZAuXMOBXmm3h5cBMLCH7tf1
 cqHihoZfW8mra2u/tukl6DPK0=
X-Received: by 2002:a05:620a:1a94:b0:8b5:e783:933a with SMTP id
 af79cd13be357-8c6a69623a5mr244572285a.77.1768548467079; 
 Thu, 15 Jan 2026 23:27:47 -0800 (PST)
X-Received: by 2002:a05:620a:1a94:b0:8b5:e783:933a with SMTP id
 af79cd13be357-8c6a69623a5mr244569685a.77.1768548466707; 
 Thu, 15 Jan 2026 23:27:46 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf3976dbsm516941e87.66.2026.01.15.23.27.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 23:27:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 09:27:39 +0200
Subject: [PATCH v3 5/9] media: iris: don't specify highest_bank_bit in the
 source code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-iris-ubwc-v3-5-662ac0e0761f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2393;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=NrDJ4X9mZsaFbnaH7GQn0AlXZA75xOGKUcWuV9qGUhE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpaehpQM4ilw+6GYwUK40BKUo+N7LqRwkaFjElo
 erSoDAH75CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWnoaQAKCRCLPIo+Aiko
 1R/LB/91YhzqEwbPpRYGn/20VhZeN4fQOegNQlRPhGRZjQOErNtthcy8er5gqD06knYOtO8A8O2
 3QFIxiibB0nYOfwl5WV8Zx8T8oqZTA9Qxpl8xsRz0wT6VEg/rGv8QUCW3oVjVC0aV6OB7Vux/bM
 YIRWkLuViBKro/sDvpLzMZjdNF1EZYbEmBt1IfcMYJBVmvV0mzMQfSrfE73feNAl43/D8JpsHev
 /hEmBA4d4Iw2ryo6y/hS8Mf+v5W67zd1jYWJN6MxLK0/PneyK0UtYElwWpDgb3vRS4FUVPSs/sp
 sYkF9wKPy5EFSCLz8oE14TRRS0xgHdQgWEs8vedgvqPhXQnL
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA1NyBTYWx0ZWRfX8m+DOt+ynVXR
 uWQxCizrFRVF3ChI224zNTscwueCrEJv+ZplcnzBKf+9MaPhBQGzXhcN1xotr6oqg1JCZQVxtIx
 fRByB3k0KBE6cmRSs4u93blg9kjY2KBepTrjl4eXnkpStQJoAkkul1/226xOvd/TxFl+bdC6cu/
 J8wT4oyoHGAcj2A+ydUQ5zSYEBX0vs1PvSonExy8hFM35iyONShT4D7sRYlg55ux9kk0PrA8aOJ
 BnChiBfdX4mzoMRdAAVCt5OyH/KGvBm0M+i0sFmRlw0n+KzYAs5x2wqBgn9MIQbB1ac7vbZsUfl
 B07/mtNdFCNU8GPcfeAH/2X0JGs65MezjpHg/I0qxla23sZtXy5H+Jz9tZ3WPdRP/ZdVD1+sheL
 4CXv26jEclLas1wfTVJ/xdgVgo+mbqA4jdYUHjwZoBrnUQAVUAe6chgf1jbvkwwCoXGDc/ecE4H
 hL92QpwrRiN92R/bUwg==
X-Proofpoint-ORIG-GUID: Hxmw89v78Uy7KSvm1Q7H8ct_VCMv8-Fc
X-Proofpoint-GUID: Hxmw89v78Uy7KSvm1Q7H8ct_VCMv8-Fc
X-Authority-Analysis: v=2.4 cv=TsTrRTXh c=1 sm=1 tr=0 ts=6969e874 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=2VIzI6ABkMI1kr12n-IA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_02,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601160057
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

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 2 +-
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 1 -
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index aa4520b27739..6dc0cbaa9c19 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -160,7 +160,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
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

