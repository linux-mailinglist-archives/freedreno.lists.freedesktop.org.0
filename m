Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 159E8B25D09
	for <lists+freedreno@lfdr.de>; Thu, 14 Aug 2025 09:22:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E595C10E7FF;
	Thu, 14 Aug 2025 07:22:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UkL0JQ7w";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49BF710E7FF
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 07:22:33 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DMTMMM013005
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 07:22:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CB8bmGdBNhI4UMshHOPhj6IVXl4P+wbGWYKdpfCUS4s=; b=UkL0JQ7wDH8XQSOj
 CfCEzweC3qyDsfuRDe7pI+FC4oNkRwIkj2Y65mz+guCTujlIHtb49rU4x8s94GGM
 WsoRwr8azWxCQSrGqzR4eJ3fEpvYoo2cbxrwNpGJZGuQE8nfP7CSohQjl6KYKWCb
 iKIex7tn67kWqWXKBxwH69nvQ7Iy8tJxN4J99CBcvYyXjv/X16Fk9WrZjDo6Z+F9
 awC3C8Z7H4O9ye8MBK501k5tMaQFh8arQzw1IZeeUMa8JJa94+NxEo2KsBSPsKNN
 IDwIPRnrT2oArO+cqDN3bDa7NdJBTJkO7A8FQyVgU2G4bervBGK6qhCGGg6Lld8M
 nZ1hhg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffq6tkw8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 07:22:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b109be41a1so26862641cf.2
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 00:22:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755156151; x=1755760951;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CB8bmGdBNhI4UMshHOPhj6IVXl4P+wbGWYKdpfCUS4s=;
 b=QOjg6xVRcGw9IJc3YeR5GBhKZTtfbd1UusL8D6dxo19A0yqalKSWrMbVUc1BbmZSf/
 XL7CFYebkL7DrhaO3+pDJJIm4WwNGdBwuI3uIwGF28h5alx2V08RJcsQm8hIJ/R5ZBak
 kNqqf6hs9oEG3bAqoAcYeVTs2ifLUImdXfZTkSBbbNjU43U0Z2gwxA09CJCIrTLhlWos
 hV5CYBeaFpMY23r/KX2nfKfqvE57Jd6FAbufrhTDk07InuIaxq16snslNd+cRrcaO/ye
 TVgLjXeb9wySou6X24R4OeNZnhs8GZnSSq0n71N825VwgxpmfIhCJ1uC8JTG17AJbyPo
 azjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxeyhlcbHxFxZEnRmx+ojJUKrYut5XiEBNe0DkLh7ebbGxxx40iFcLt6uMabDpa71+MtItlmYqExI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwzdlOgEqfxXdFc+MuPfFlLSaW9m8A7RkYSEynUMox5OSp8tEdH
 tqQTZJWt2WJzjna3XgOQi31jKczEXspCA20OkVXhgTg4yAz2v5cEwa8d7/LmfDpmq7UuUDIKE+M
 F7dJ/9U+Bg/YSpmid+1/ufZ+SaFiOF+jrng+wz0wu5WW5KY0nS18KmevIsli8Iu2SZkqtulswql
 GRbLRMjA==
X-Gm-Gg: ASbGncvoOfnq8Xg6ywbJo6Yu9Alkk91UWIBr5LylDy78fvcHNz5aZdBWRAk6vkQxzqu
 UwWNTreJlrWmNpSU+f2VdZ/4/7QqB/f2zGzAueBzUihK0wwEU5fygFaS6oBckZup61KAS8wMJDT
 /tg/3IJDisyrEYHMBs6droANnaKQVO41jjuuDNQvoq1i/61RJMTExDFJmh5BkyCnpojo0H6DLwL
 r0OWsrIanB/Y1Ox+7ljgcBThknRFT0b5yN+Lozoi9hMCAo5gsBiZTY3Vu2uUnCkeKsFCVf0bzV9
 j52PQGzxGMMo7BtnnyvMyEoBZKLGLkbsgTPKi0A1oPL5/R8XD/oJkBjOSmwR3qHR+orqpCMqm1w
 Uask8kUs1e/cVwXQzF/JdLoGC8Pl5kowMNndfjfEzWGGyRV9qDNTK
X-Received: by 2002:a05:622a:180e:b0:4b0:a07f:c1d0 with SMTP id
 d75a77b69052e-4b10a9df06fmr25849381cf.5.1755156151145; 
 Thu, 14 Aug 2025 00:22:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtOIqJE9d/sTcrcmqc3jqwvz5pGujMrFYQObf4gagrdYXX4fx4Q28OrN/xl0L4v9Zx2CcFEw==
X-Received: by 2002:a05:622a:180e:b0:4b0:a07f:c1d0 with SMTP id
 d75a77b69052e-4b10a9df06fmr25849081cf.5.1755156150671; 
 Thu, 14 Aug 2025 00:22:30 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b8898bde5sm5648258e87.3.2025.08.14.00.22.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 00:22:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 10:22:22 +0300
Subject: [PATCH 3/4] soc: qcom: add configuration for MSM8929
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-more-ubwc-v1-3-d520f298220d@oss.qualcomm.com>
References: <20250814-more-ubwc-v1-0-d520f298220d@oss.qualcomm.com>
In-Reply-To: <20250814-more-ubwc-v1-0-d520f298220d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1100;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=E3/N/WjQbiDmz0VMGmvjPdpgGB25WtC6B8H1wIC+vFs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBonY6uy+vSA/X4Kgke/NFHP7uLX88/xECGSb/oe
 5294f4V376JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaJ2OrgAKCRCLPIo+Aiko
 1apsB/9wSFENpXzI06HmIYvImbE8JcKi94PgOm0vB8p2X3CkXAr20neQwNHpq++EUtd3lW876d3
 vbADkOzr2s7S5epizeNWWm9KHeC59XGcDuJwBauSlg23Dc9Ec6dNaAs5c3+pl9WOY68l4H201yK
 +Hmf/tzCvy+bXBXCqMqqlufGt81LcJPpsIkf4N/lw0uxvwZX23YWFOXJBxb0piOMRBiLMW5jNMU
 nPMcEDq6zrdbo8T+bYLuSDo4LwBzVfBm4PMUIOxZVu8qXDCg3EcxhxmSn5JodzQcqX5Xg0eYJrl
 GlrJslQMU2XCMRoRDhyhGqY0ohk5LyoJV9D+GTaDr148tMR0
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NSBTYWx0ZWRfX9r3uYh39m8eH
 UnXkqUNt/6Y36MtHHLer/TbzVg/4QJ1trXtDXQLgap3LAJ+jUA3LmAyMenJowWk3yGFj5P/I6NX
 17yRB7g8JboURSrhQ2co1YjSCk6N3jxO5krzjDKH1+ghuawOJngcD16PFBBt7jTfcZLmsOle93r
 tj5zEifcDDffvaEz+yeN35jb85fhKUKHg8NmIMw8Xvt/AV4BKYsw1Q8mRka0o0t7J0NutLTTYM+
 cuFbGdWiL0qqpclqFBpmtykAU7lBeyWBfrg/iy5vJSOK4nQxZB8FBuliCY9hlxQ3YEjIqSTLvBX
 L5TbuPoiT9fARvWlsdi1Qfn6ehElNIwDCwS84J/2UwJtpGcivcusZAJNRItI9YUSBUoZiPR5fzF
 3NtVEld5
X-Authority-Analysis: v=2.4 cv=TLZFS0la c=1 sm=1 tr=0 ts=689d8eb8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=TTbi-_CV09467DSuNksA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: Hse0KnZg5Mi9LLa6Q2w9T6lL7xM6Ni3K
X-Proofpoint-ORIG-GUID: Hse0KnZg5Mi9LLa6Q2w9T6lL7xM6Ni3K
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

MSM8929 is similar to MSM8939, it doesn't support UBWC. Provide no-UBWC
config for the platform.

Fixes: 197713d0cf01 ("soc: qcom: ubwc: provide no-UBWC configuration")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 8b23b4d4e3989a7170a9f44f3a5e466cffd70157..689e333ae44308cec178ff343bf09cc89bf9fce4 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -227,6 +227,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,msm8916", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8917", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8937", .data = &msm8937_data },
+	{ .compatible = "qcom,msm8929", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8939", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8953", .data = &msm8937_data },
 	{ .compatible = "qcom,msm8956", .data = &msm8937_data },

-- 
2.47.2

