Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D5CB0F3DD
	for <lists+freedreno@lfdr.de>; Wed, 23 Jul 2025 15:23:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77EA210E0F6;
	Wed, 23 Jul 2025 13:23:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BbU9twkP";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2148010E0F6
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 13:23:43 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9Tw88004801
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 13:23:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=tWG9Dumj/u2sl28Vz4MuVl
 d5C6QI9r+ImLKTNYl6w7s=; b=BbU9twkPFMHVO/SFlrrP3+Ksf/2+0K8h5zZ3BH
 s3iws3Tl8SCPAp/+Y4amI53WANmwyx2vmC+QA4S+ObxDiU03FvjQv8rvvX9qP87c
 0NIUpyYr7VWk32olhsRNnYJnKHe6mQL3UVUhJ0q8LHISEHynmIdH9wMhPeyMZJ90
 gOQyAPkRIR4z8jwYZTyOYJ7XLNJRqmn95PExRiANjCBsYmE+J8v3KzQPajWT9ZeT
 MEgXG4cqipvvRWvAg0iKukmgGkZ+ADUSXXEg/5WvW095c3idUU6tghwvZpZlN5W1
 C+KbHQp+GTfmNr5wpAzY0yd/0GOevyiIhvA/awRunHiTN5uw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4826t1ck18-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 13:23:42 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-7070645452dso8417086d6.1
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 06:23:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753277021; x=1753881821;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tWG9Dumj/u2sl28Vz4MuVld5C6QI9r+ImLKTNYl6w7s=;
 b=ftSBCRkEni0s0jAFFkxRxh0NHsqdn82/eJ79xq1V5+WBOj1c+Pjn5aZ8Q4UcTqaddC
 zXC6Xv/auqPqsLctNYQpQFOcJu04VkX8Pma78bgTROoDNbLKvpcGlvPzqkhpT92kyCzt
 a9SrwB0KGY3wUyVcGJBalthixbFp1PwwPRCKWodMFMGA7qZCJqjDezXQrQ1l0nT1o9NM
 30vKxTD9LGE2tsN7p0BvrWuuLYDF+kMunosXH8zH+B8NRjDM2ovXAal7xZW7OekwUGXD
 hwKM09JE1//oFdnIMu7DlFCFa9QIOuxVzH7VCwfnkEzrTN82eSnod36FVvN8/Sd9kdP7
 8DYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeCGejcC8Jy3f64XBHE2fN40w4r3sUXELFDrm3qld2+3YuaP+tKiTpoq11U97yGiOScBWyQPHpZzE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwHkSzX3M84b14smRUu26judgMw+N/PVVnTw+42MNyScEkjeqq8
 Enm2bCcybRtn36Vl2wSOS23a7FEMaFgYQQ+R2Xit28CcwlSYPgQdlFxlXPPc/HO83m9s3ohxlzv
 IqlZ2Mw/15ywlhiZuhSn20idn7fLFD5S1B0BCG86b3WEjCTBYt6rv3bq7UegkTaAU1FLqk7c=
X-Gm-Gg: ASbGncvJJZ1V+F4jnB+hWuk9njJjGwhkJtgE5VTPwjxQdPoUMq9dacRqdRfXxQm3CYA
 JBkY2Urk3Fw+cSCi45bLBg6pCpbJHZmSgw3lmsslKmQqwz0Arz/sLk4aB5JXQS8zysFWby+xFUX
 AjL5NzBuXJHUM5s3YHfFsWL4epe2Bj/JYvZNfVa++fDQPQLjTFns0VNhEAwBB+8cje1MvwB2VBN
 L4haHfNcsmyJl5uyX4EWJCyaszMd4whaiZTetiGuRE+cPVSfjqP/A47YNklVqXW63y5bjwOs/0E
 5VgahdpqrI5WBqFidZLcWCMq4Dal7Us5DTytGTyHLUlSB0f4NNcl6CQzqp/B4C0zGkPvkKnK162
 Nf4S9UsSURb94Lb5YXfLbeUeSwWTZZWHX0qxuFoGBuv8OjcQOawys
X-Received: by 2002:ad4:4524:0:b0:707:9b0:e5d6 with SMTP id
 6a1803df08f44-70709b0ea25mr11477976d6.25.1753277021363; 
 Wed, 23 Jul 2025 06:23:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9onlt4Azln72h1nDQG0ZF4ChtAfnqCYnLW93SKDW+UJYzjfRVMDoSUYaJ5uhPs4CUJcl8FQ==
X-Received: by 2002:ad4:4524:0:b0:707:9b0:e5d6 with SMTP id
 6a1803df08f44-70709b0ea25mr11477336d6.25.1753277020608; 
 Wed, 23 Jul 2025 06:23:40 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55a4ee536ccsm387931e87.179.2025.07.23.06.23.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jul 2025 06:23:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 16:23:37 +0300
Subject: [PATCH v2] soc: qcom: ubwc: provide no-UBWC configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250723-ubwc-no-ubwc-v2-1-825e1ee54ba5@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFjigGgC/3WMyw6CMBREf4XctSV9WEld+R+GRS0XaSIUe6VqS
 P/dims3MzmTzFmBMHokOFYrREyefJgKyF0FbrDTFZnvCoPkUvOGH9hyeTo2hV8rp40wslHIFZT
 LHLH3r013bgsPnh4hvjd7Et/1jygJJhgqo7W0lu+7/hSI6vtiby6MY10C2pzzB6AKU5CvAAAA
X-Change-ID: 20250706-ubwc-no-ubwc-3c5919273e03
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2548;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=anIv7UBD8VLP4vJM5h2MZC00iJTIhwQ67w6K2o8NnI8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBogOJaxaCr/gcCZWyHuVgzn/MgGo//mAlSYqc6X
 HFfMWJc15SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaIDiWgAKCRCLPIo+Aiko
 1ceJB/4xh1Vu3lQYPxaXIi48J72Xok30pM63ksfuWfGthvySMgGbAcQYPIUvf9S00BGBXPRHJX2
 pOPZ7+tKVnnlJjTCrbJ+QGijPcp+Y1hdN+h6QIO9sZi1X0BqSF6aoAWPz+vphJN/1floLXmFqM3
 zc2by4aBVCZgzQBrX5LpKRtjfUfQryJJdhQ24lLnWtxSC07olg+nrTGowKG2ohKQSk8cFeJf2/z
 Zca+1Tld0AjzbA3HsP6T9BQQA9BQy9QgQU2cGcCJkLPLqP2nrJdelJ49C4mjO6aDp1cqKs046jt
 pUteGkrTOb1KQoncaPackjaFXSxAq27VYTVi1foDgRiC2K5h
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: BuesW_t3a8xgT5B2smDAQPArq4x6iF3Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDExNSBTYWx0ZWRfX9KhXLtadHHDJ
 Rl4KZA7z14GYoJOZaos26hTeM0fzaDkSMY5iw85rFmDqV5lofLpTXqEkQ5i0eGtIMpxFu4PHVkS
 OQsjqfSXWAdBf2QSATNHwmYhSjRl38t1jUvQAQGjSTvMgqFyO+3o/kgXgwMK20jxdOwPjOSNvf7
 FmLI0IpOflasZjO0lFyISHLXnPLGwbBd11PSCc5/S4/4tJ2y+qtyeLkNTwIvxMa5RIRauPI+93X
 KYH1qzgZU5wXKsdi1PGCpF+Gm/ZILRu7Cgo8PcOG2cNXBm1jfKeVfhdQxLkscnW+tPlg76g5Gq8
 1B+UbJx29AS2bzfcdfgqYif9VLmbFFkIXNrgqyIFaQ/jL47Vwf6xcQzZ/ugZaJ4a7DUMyCr3is9
 OD1C4uRfEGpGKcynkZdwhcq7gDS1hE8QoL4zDYPWhq4u3AH9xNnKmgJXSAtCJYQC3hBPMBJE
X-Authority-Analysis: v=2.4 cv=E8/Npbdl c=1 sm=1 tr=0 ts=6880e25e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KmBlSpI0m1EwYyTWySQA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: BuesW_t3a8xgT5B2smDAQPArq4x6iF3Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230115
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

After the commit 45a2974157d2 ("drm/msm: Use the central UBWC config
database") the MDSS driver errors out if UBWC database didn't provide it
with the UBWC configuration. Make UBWC database return zero data for
MSM8916 / APQ8016, MSM8974 / APQ8074, MSM8226 and MSM8939.

Fixes: 1924272b9ce1 ("soc: qcom: Add UBWC config provider")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Note: the driver is a part of drivers/soc, but as it got merged through
drm/msm tree, this fix should also go through the drm/msm tree.
---
Changes in v2:
- Added APQ8026 to the list (Luca Weiss)
- Link to v1: https://lore.kernel.org/r/20250706-ubwc-no-ubwc-v1-1-e39552aa04df@oss.qualcomm.com
---
 drivers/soc/qcom/ubwc_config.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index bd0a98aad9f3b222abcf0a7af85a318caffa9841..9002fc9373ce349c129889ab58f87cd59591de63 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -12,6 +12,10 @@
 
 #include <linux/soc/qcom/ubwc.h>
 
+static const struct qcom_ubwc_cfg_data no_ubwc_data = {
+	/* no UBWC, no HBB */
+};
+
 static const struct qcom_ubwc_cfg_data msm8937_data = {
 	.ubwc_enc_version = UBWC_1_0,
 	.ubwc_dec_version = UBWC_1_0,
@@ -215,11 +219,18 @@ static const struct qcom_ubwc_cfg_data x1e80100_data = {
 };
 
 static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
+	{ .compatible = "qcom,apq8016", .data = &no_ubwc_data },
+	{ .compatible = "qcom,apq8026", .data = &no_ubwc_data },
+	{ .compatible = "qcom,apq8074", .data = &no_ubwc_data },
 	{ .compatible = "qcom,apq8096", .data = &msm8998_data },
+	{ .compatible = "qcom,msm8226", .data = &no_ubwc_data },
+	{ .compatible = "qcom,msm8916", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8917", .data = &msm8937_data },
 	{ .compatible = "qcom,msm8937", .data = &msm8937_data },
+	{ .compatible = "qcom,msm8939", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8953", .data = &msm8937_data },
 	{ .compatible = "qcom,msm8956", .data = &msm8937_data },
+	{ .compatible = "qcom,msm8974", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8976", .data = &msm8937_data },
 	{ .compatible = "qcom,msm8996", .data = &msm8998_data },
 	{ .compatible = "qcom,msm8998", .data = &msm8998_data },

---
base-commit: a933d3dc1968fcfb0ab72879ec304b1971ed1b9a
change-id: 20250706-ubwc-no-ubwc-3c5919273e03

Best regards,
-- 
With best wishes
Dmitry

