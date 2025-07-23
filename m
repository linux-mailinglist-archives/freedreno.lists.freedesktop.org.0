Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7291FB0F414
	for <lists+freedreno@lfdr.de>; Wed, 23 Jul 2025 15:33:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40D1810E7CD;
	Wed, 23 Jul 2025 13:33:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ke4SeYrx";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30C3D10E7CC
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 13:33:49 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9PVsF007918
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 13:33:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=WTQFEIPLe1Tpen98i92mSH
 rOdL5Ab+xN4wlWiokaT5c=; b=Ke4SeYrxSPuS3KhWMpA1fQDAXHQ28aH6A3J2XM
 jC9GLrMYFnTk/tUuAizSb8UUCt70kr3tRk60m9n21xNsRndAArbSe1YfAv63Yr66
 +E9V9hLlI3mrDkbpjOGF37hd4yTiQMIbZu2xM2hGxY/hOPTkSemVUsKffcITZSvS
 Sd/UiLsCTrM3zilRL+WM0eLvNmciZsmcmnLAxNUFCwLJSJa8JX+NKHunuQtak9Dz
 M1kKp7b7YdZMKICEGOuZW1f9QQq6yM2AXqCCAOFLHx0/fbU01rUhCPAsSZ/H+mvB
 0QilctERmpLqkI5t3ZP7P9/sOAO9Pu2X9TtCPOJl0+m3o4NQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482d3hua8x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 13:33:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7e095227f5dso1045235485a.1
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 06:33:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753277626; x=1753882426;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WTQFEIPLe1Tpen98i92mSHrOdL5Ab+xN4wlWiokaT5c=;
 b=bNd2WxF4FKjHWNrp8JGKwUOsLQA5TsDl4+wxEWV3yFcr4ttIVNntPSXpgaNmlD2uzZ
 EAuvHkvBfnm03QGfGu2AWxoZJsvJ/RXOz/mNTckTX2DDY0sEy0/1Yf/IomAolnPmANht
 +pNoetyLyONAgPP3AcMIogUIBZ+ncUJ3v0RLsVDEuT/DZ2ahFYCR3VeSa4aqf9jVyY+V
 h14UkDckOsRUoggxzuTub8fqRhdbkVl9VlM3RfI30whStZBBBQlB4YAEavKUkdYXeLkg
 IiQhlXOFfPeaM88OVhHyp+vNcoE4OL1Kq5I1J9JWXUoptq+has7FbGbtdhOJqRayn9Ab
 XiWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYDmcOyVDWiiViQAdk/DdFeKAY8bPXP4WSozB1ZLOKjtANQA/D0WVJ4x0b1t4AR+6TrI1YYun4exU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxR9k+YIbBjV6mMP8AsZN4+lobzfcm15EnoNCCj2OYe6GEvktNE
 vX3vj2Pcbmzilix4sUQ6nXVZQ6Ybx4sev8rQso/CzqXggx6rigogOmABbnxxMgvP5BPyhl8ekTp
 3Qok4+b3yICoGDwIcIL+XlIP0lB4w6ILgoOBIdvlnUJrI7R9I1/Mqp9Vs1mEHXFYaw6L1Qoo=
X-Gm-Gg: ASbGncubBArVmiEL/h+cju/iezhnSULhv2LPQgZmDfJ1VV984xl9Mw+q3wJqDsFGi2n
 oYMHnv0JdrK0nyw1A/mo49LKM995rsU8MTQuzoJFL2mt7UfMjaujkNtiYbHkb38wSjyzevBSa7Z
 GvtqnhmU+13aTP/SIiHE5hP6jPE8HNTC/rvRbO31NnO4d26YiaoacwC2fGMHmHBBDGwReZPc8LA
 uPvSrVf6uegm39MVvAbGKavF6NBxw2I+VA8BimuR+WjcJXJWVSLsW3dptgoA9jtmfl5M26ZTbk/
 zmS52MYpvULOLVP4PYFkXAuiFLmu9pGlh0t+LjEevPPE4TD7OQmu7gMChTLamMMpALaOaxGuDx0
 +WfPtv+ZNR8GNdA+MdJ92xfisBteXYeyA3Z9lP6+NQra975GBJJn6
X-Received: by 2002:a05:620a:698a:b0:7e3:4804:6d6a with SMTP id
 af79cd13be357-7e62a0961b5mr389689885a.7.1753277625795; 
 Wed, 23 Jul 2025 06:33:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIbu3Pi8x0OiP43SauVb8JeZIBxt/dr12pb52JW+xXRmOZK0s8yrai9klZTjw4uI2IfxS83A==
X-Received: by 2002:a05:620a:698a:b0:7e3:4804:6d6a with SMTP id
 af79cd13be357-7e62a0961b5mr389684285a.7.1753277625278; 
 Wed, 23 Jul 2025 06:33:45 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55a31d7c76csm2304535e87.122.2025.07.23.06.33.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jul 2025 06:33:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 16:33:43 +0300
Subject: [PATCH v3] soc: qcom: ubwc: provide no-UBWC configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250723-ubwc-no-ubwc-v3-1-81bdb75685bf@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALbkgGgC/3XPSw6CMBAG4KuQri32QVVYeQ/josAgTaSVtlQM4
 e4W2Bijm07+ycyX6YQcWAUOFcmELATllNEx8F2CqlbqG2BVx4wYYYIcyQEP5bPC2myVVyKnOTt
 yIBzFlYeFRo0rd7nG3CrnjX2teqBL9w8UKKYYeC4Ek5JkdXM2zqX9IO+V6bo0PmjxAvswGP8yW
 DROTAAFEFkpxQ9j3o600A/xq367FJXSAV6GlC8SDaPfd9J5sHF+fgPOz8vXIgEAAA==
X-Change-ID: 20250706-ubwc-no-ubwc-3c5919273e03
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2890;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=SBUY/V4xLs/7I4TRnpBK02us0MpTJs5s79N5xrPclI4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBogOS4B8xLRc/tP2mWUM8pLag/D25jq2Lvgx7GI
 NfVsxwYFzuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaIDkuAAKCRCLPIo+Aiko
 1Qw2B/9Px8qUpaP6FZLiIa1oy9vHbRSAdE/D598x7ufikpHqguT389LRl/BhbSAJ/REpVvOaVv/
 TCr69PwL/Cr68jpyQJ0+ryJ0kwnppxg6lUSI/IKbZ6eF2FD+TvD9Uc7KpAMKogSY0JxOUzNpF9b
 esuvlWT7zaErklWT39eNRobaxclJ5RrfG9hSlD/yVfqTgV+ds/+yXyVw4MglBRgmGA2T+SNrcwj
 /SwbJdfRmR7ZHW1IYyLQ+5MvurVxNH+kyp9Rw2VCHbXfuuiFvgNnXTh5oh6Qdjc18EwY4U/uC1U
 IGWJLjAV2MEVZM4NupwE6ot0slIQoxmqnsaH8Y47t8w7nGx0
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=G8UcE8k5 c=1 sm=1 tr=0 ts=6880e4bc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=HI9FvKZQ5624IJQzk6MA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDExNiBTYWx0ZWRfX9xqGdEakL4Q1
 u2W5wSYItvRF3pevGMj+dVn8UWB3lunE7nXR8wNfIF/IfkIwqjyIg8naOsd4vyyditWxCpfb8tK
 f65fA3V86Qi+PFTGt7X5D+06cnY0lCcKPPpXR95bZhz3US0upJXyrJlmTduVwlz1AZdipInm+3S
 Z2LWPU4b73jJ/eMnAQvLp7KVX01t+Yv9om+WRFQulJ/TZwvUmcDz3pgjMfZGvkZfUkySFwRi6EZ
 hTO3qUjFeJIwU+IusI4KiOWJNlW9R39GTqFc1N87CPHIPxCcCUhoYHGvsmVSsOMHAt+b5ZtJUhi
 w/WgFKceLH+66HCHakxy6CqlI4BtFeGc5CPLQGvy1Nm72JH+Mn2R0ermpL1+Qo2uJMDkm8nVLMk
 kB2hvG9DOIVPJWxk1a0Bbh67r78P+/yu67Sl/bpSF5gqYSnunHNlffMOELZFgB9CUctBXDYs
X-Proofpoint-GUID: yWIEislPGwhQunNcw7j-26WTo3_1o08e
X-Proofpoint-ORIG-GUID: yWIEislPGwhQunNcw7j-26WTo3_1o08e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230116
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
Acked-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Rob Clark <robin.clark@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Note: the driver is a part of drivers/soc, but as it got merged through
drm/msm tree, this fix should also go through the drm/msm tree.
---
Changes in v3:
- Just picked up all R-B tags from v1 (forgot those in v2)
- Link to v2: https://lore.kernel.org/r/20250723-ubwc-no-ubwc-v2-1-825e1ee54ba5@oss.qualcomm.com

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

