Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F3BB25D08
	for <lists+freedreno@lfdr.de>; Thu, 14 Aug 2025 09:22:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AEE010E7FE;
	Thu, 14 Aug 2025 07:22:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TygObaPa";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DC1B10E7FD
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 07:22:31 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DNKxmm012988
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 07:22:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kjeDTlRvqKRVSDE2XA3jPNpD7W2lMMrCoAkGvvLiNPI=; b=TygObaPabM5k2Ffv
 CfZrgVnWwAL9bhiYVaNQ/McKao2NXDnJkM3bOzFcVPIUT/d0CfLbmOlNsPcIlrSw
 4mj5yDriPrv0+c71lY1LtTzSGFY8yWWs+QYXmQorRCZ7WhnBZQ87q4GaZ4gIuaXi
 0y7f8vzUJ9B3A8T3QtGQwOns/OKO9cpUSzgc+1UTjn0s/i9Mpt+TpAROPhZJkKG1
 c0LKdKuDqkMrQr8FOuuIlBWvHU6xTDQ6GMgAswHw4XE+2piCNnZlTmnz7YUSeTBV
 eZqHpSvF5NiittwUH0eCaz3DtXatroFaao0Co+lN3e+galEBKqywQWmYW6c3z0lD
 /wuc7Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffq6tkw3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 07:22:31 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b109bc103bso17152281cf.2
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 00:22:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755156150; x=1755760950;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kjeDTlRvqKRVSDE2XA3jPNpD7W2lMMrCoAkGvvLiNPI=;
 b=ve2RtQvzVKmvoqgBdE3RIOj+kvgE9nYPfN6K81teJoovq0CuTZakfAMu8l6Ah8kMiT
 1keiEfcOO737vrNEvf+ZABDnBPPzipy1Cdaiq9ibwDwFRD6cVvc68UcFOs3QvbRLTn0W
 sbkjRy38aJeI2rnVWpNlh7E3cfH6zhqjueI1t7wnNMrkOZK0SyOn7htVyDj9UyY5Nrla
 j1OwI1PG5kROsWAiWbFJ8MitJP0wCJFBQe28qTQTBzp9RGC6tvc3eHszEVS0MLCBnvxP
 hjsaON/Y9Na7dR1qKdAebEwknxyAAM8MBPq9i6cTM2ywAd48NbuPmwESZFknFB86pldu
 SifQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIgju8zvlEDzr8977iljNXbdxEQLly+G5Rcn43sNNSP5Wwz1Dlwg7vv958CEH05g3anoSL+UeUiNM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzgPOTH6QqsQRz+drh8A0ckbZTHz1/WefgJaET8wuA6REoPdANy
 fz9yx5TRjHylw2m3fhq4ReXCavrdac0YvPY2ME1BFFJaBhj6DlwAYB/CJWa3R+0Mpil/aeZddd+
 6WfrIJnYQ1gXhPU/v/TfiT690o+viXcBkEmV1bDEcJHvuwo5Go2Yx/oLz3bz0SokQ0xThJA0=
X-Gm-Gg: ASbGnctGGFUaBffFgSfW7zNQSDPaKNCIacKuQE31x8HHw/5PqjvEkXYwaYQ/7ESXmd/
 bpdTa7jLoV3BXRTvEpIVsfIvc4LZu+RMd2QnmtMB99+vMYKKwzb/bKGthg9mqjZ+LRHzetOLrSq
 swdpeErUeCcFbJtp/2JD2CLEw6c6BiQCbRQ55tpmUcDm6MH6YkZ0BT9eGo8R3EFscm0cuPdAMv4
 pw7liXQ1UbDZP4Jc042ZMsHmr8kfqriKJYh+5ZZAuPrE6XJrB9gtqoMD3oVhHLd8gMPPcSN1eBh
 qC0gUdoS+zkNSYK9Ifcwdl0GQpd07oCxZ2v+5HaHjvNBoVGPjHPmgkOp98ss4c+th46iYK9qS3c
 ABjTdN8mHmYXNq/mX2IaeaPXMq3Mw0CSZi9Y7XQjGTMtdDrJagTGI
X-Received: by 2002:a05:622a:48f:b0:4ab:37bd:5aa7 with SMTP id
 d75a77b69052e-4b10ab1b12bmr23384911cf.24.1755156149594; 
 Thu, 14 Aug 2025 00:22:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRvrkglzi1fVUqbShWj1Qq5gaJUsbufZ0ky3HjrRVHTsX7RFPTslpdjFRNw5jy+cv/Bih+qQ==
X-Received: by 2002:a05:622a:48f:b0:4ab:37bd:5aa7 with SMTP id
 d75a77b69052e-4b10ab1b12bmr23384781cf.24.1755156149171; 
 Thu, 14 Aug 2025 00:22:29 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b8898bde5sm5648258e87.3.2025.08.14.00.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 00:22:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 10:22:21 +0300
Subject: [PATCH 2/4] soc: qcom: ubwc: add more missing platforms
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-more-ubwc-v1-2-d520f298220d@oss.qualcomm.com>
References: <20250814-more-ubwc-v1-0-d520f298220d@oss.qualcomm.com>
In-Reply-To: <20250814-more-ubwc-v1-0-d520f298220d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1834;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=btgYT7isNyxSHT3vBtmVm8ZFwJQkF6zS599ztboiirE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBonY6ucq0xjkspQWc5hMwEep4/eGUZEqCniAZTF
 k+59f9u2ymJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaJ2OrgAKCRCLPIo+Aiko
 1fzeB/9oieIeCBGm4gLbZjhPLy/Xat5Ex0qygzGC2GJuQCqCNNAC7Yf3GtGNm/FGqHI4Whc7EqG
 XxxaovLv5V2AqbBQF5cCU4m1VDNXWghrOd1j5cpe3XWOjXcSpbyc94/GiFhXVluFv7XV/a/vswT
 RJFrLplVU33bdWcM2qXD+QMb5nOVQcg3ph1/A4V5UqVq6MBuraC8+TRUVvhjZfodYUNqOSgQ17u
 ndZNAObnJO5PG/0YUEhs+/n3VczgrPpTumTwjDL27lvarq1JL2nA8VeU0paqGbXd8UrvzTd/gY3
 KNJ6l/C7RCBV/+2B03kYIFJ/qURV24ekAAq252w4HHetKQT1
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NSBTYWx0ZWRfX78kGK2KVva/k
 t/Dm6nXZho7+Ek69wYuz9D+sbJQL49vtBmZjDgmQfdYya8UqVlHvjouH3G6rmi+PuCFVrHMbEhQ
 GLe/LSqG7s1etb0Q4BvURcWEoKU6BRVEZBwVEb1H56LEBi3EVq7Qo0Iq55eNCBShfzcHjUEeMo8
 pICO92p7KOCM/MNFBVudDXYw7OEzMKHGmHh+FGtblevnVNeeoM+6FSesSIS5pX43BBEpEeqPl1w
 T+o0d8xJPvY53lI3pNd5F20KuXPrEjfhtU40aRiN3dcxbXStpmsgC5DegYd5uEHCSLd9eIjPB8L
 Jwvbg+o0sP6TVaJWWsGkKcYvP91E+VRl/E/bp3X5dGzG0ADFpZiKK1R/7b1bR+WQCRlLfoDWal0
 KA9aneON
X-Authority-Analysis: v=2.4 cv=TLZFS0la c=1 sm=1 tr=0 ts=689d8eb7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=loNKmxCBzsa_v9sKRHcA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 474Tug7-pdI4q8yaxyljz2ucbPa-8XDz
X-Proofpoint-ORIG-GUID: 474Tug7-pdI4q8yaxyljz2ucbPa-8XDz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110075
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

Add UBWC configuration for SDA660 (modem-less variant of SDM660), SDM450
(similar to MSM8953), SDM632 (similar to MSM8953) and SM7325 (similar to
SC7280).

Fixes: 1924272b9ce1 ("soc: qcom: Add UBWC config provider")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 5113c2902bf2ba3711bb14b35bbbb8a2b49b8cfe..8b23b4d4e3989a7170a9f44f3a5e466cffd70157 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -244,7 +244,10 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,sc7280", .data = &sc7280_data, },
 	{ .compatible = "qcom,sc8180x", .data = &sc8180x_data, },
 	{ .compatible = "qcom,sc8280xp", .data = &sc8280xp_data, },
+	{ .compatible = "qcom,sda660", .data = &msm8937_data },
+	{ .compatible = "qcom,sdm450", .data = &msm8937_data },
 	{ .compatible = "qcom,sdm630", .data = &msm8937_data },
+	{ .compatible = "qcom,sdm632", .data = &msm8937_data },
 	{ .compatible = "qcom,sdm636", .data = &msm8937_data },
 	{ .compatible = "qcom,sdm660", .data = &msm8937_data },
 	{ .compatible = "qcom,sdm670", .data = &sdm670_data, },
@@ -258,6 +261,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,sm7125", .data = &sc7180_data },
 	{ .compatible = "qcom,sm7150", .data = &sm7150_data, },
 	{ .compatible = "qcom,sm7225", .data = &sm6350_data, },
+	{ .compatible = "qcom,sm7325", .data = &sc7280_data, },
 	{ .compatible = "qcom,sm8150", .data = &sm8150_data, },
 	{ .compatible = "qcom,sm8250", .data = &sm8250_data, },
 	{ .compatible = "qcom,sm8350", .data = &sm8350_data, },

-- 
2.47.2

