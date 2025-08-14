Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F229B25D07
	for <lists+freedreno@lfdr.de>; Thu, 14 Aug 2025 09:22:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 794DE10E7FC;
	Thu, 14 Aug 2025 07:22:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mLHFlrFq";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAAF910E7FC
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 07:22:29 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DMK3M1011995
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 07:22:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TQc6bIMTdxAC6yFDpDqhMe0BhKN2QLBxitGDduPp3Lg=; b=mLHFlrFq7xPKYeGD
 /gxkYUZfP9nDkU49zg6LplmyyNyT4fEy57gHo06/agQ08Weda2LZ835LdSilTCE7
 emFfJx+GRlgowkiS95obz4+r/dCv21d8FgDFWmAATW3yKxYm6XlqZ+HM/vhjP3+v
 FTInK7jn7LOEiGrX4ZxWaKHsvA8ya0nC6pMGa6ee2m19LxtOBY2hYsu1OvbMlqmP
 pAqAli+gmB9AWkviDHQVRtUWZ7ckUgWedJ8bhNY5rGCxDUq9t82CxxqHzy+8c9He
 jIetqOi/CgyKaCu3F9pIslbCLo5t8zrHpHKCbg7AETyzOqyfqb6ylHVHPpW5c2oI
 mLWP+Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g9q9wtkp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 07:22:29 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b109a92dddso18715961cf.1
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 00:22:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755156148; x=1755760948;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TQc6bIMTdxAC6yFDpDqhMe0BhKN2QLBxitGDduPp3Lg=;
 b=XPdaSomRi8CFwxTdJCcK9p097gvsyPqsr7g8kIEls3g9btVYP8U5XWCtQWjraBNxSO
 BoMtP2MvGlecc2OBK9fZRgpS6cm2mNvg8dNkuakw0xPg7o8qpN24heWR0C+DigmmDUyM
 Du39nBDI1Y9DyAaOWxnWuUeXuW03Zg8nKa3r8qdgDazq5aJt6CFve4mlnFiNhsvXc8xd
 1vB2kBWrQMu5jKWgLsYJHzYg/qGTmfsdTo/8ukmhDGNsINqwjMhpXWHX4XGq1HVGD8Id
 cBqqroh3swxtn0562k/dnIqXDLNlJy3jnLUu0P3cTdFe/LwGPDAYLK6bPyHtlLDYZ72J
 MlCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUitUNlpZlZOquz0QufQOmbv74V1/q4QyUe2hsnOVnowvZPA0VigUYsieNYYZyiB2QM3DUskyFV8RU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwyoKXL/LyFdecA8Bj6tkBt/brXYgQRPl3RhWcLuuoTtUe2kVqA
 ZjzJ3ufR4fJj593DspQuQ0I25VYXzR+6VpgzOdzqi/MdnUVDHRXwEduVRx+fCSSH2Io14jY3n5h
 dpni75ayBsAuf/0StbfAZtMwHlJcj0tQy05DiC+mSQ2I2pOTWvBrXOdYdm9tL2XQQVD5IqBw=
X-Gm-Gg: ASbGncvGYfpTsiQ3XEJ1bOXIqcjZKDnsDewq920X2PvIrEDHbm9TR/3PIXWMrIFOjDH
 XyqX3Ya9DQ1/l9F5a5aGU1luErdmCfTKfTIaCL1v6w33lAglaGUB4OG7c7vGreaBjhembkRGZXa
 zgoIECGi+LNNDRLn5FgDOlLWX+RfswLx9mK/CCHNlp7sUV0axn6zAgZN2+N5VBRP18NHDHh62Ae
 nub4d6HLK9+eEpMLQOplcrH/XAQQ4sbQCnSP+5kttIUVTfW/FP0SbM1WH+IOCB8z2Ab4HGkcR4f
 lwCyN/Qy5246H5tymoTlzeExWqdSHlwTQkCrDCIoYDIBxGHLwMAtdKugqEK87/A1zqLp9JQH9y7
 KVn4TakwypQjVX/RU7mVwCR09ON7qf+SKPR5pZp3jAmAh/9DY/RLQ
X-Received: by 2002:ac8:5783:0:b0:4b0:692a:d430 with SMTP id
 d75a77b69052e-4b10aab672fmr27451051cf.43.1755156148095; 
 Thu, 14 Aug 2025 00:22:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNFBrlBr1dNMCyhmaJIm96Smu0B1IphGMBdlZj0GJem7QsVNBtQvGX3YL14smSqPKLK7uA/A==
X-Received: by 2002:ac8:5783:0:b0:4b0:692a:d430 with SMTP id
 d75a77b69052e-4b10aab672fmr27450711cf.43.1755156147622; 
 Thu, 14 Aug 2025 00:22:27 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b8898bde5sm5648258e87.3.2025.08.14.00.22.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 00:22:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 10:22:20 +0300
Subject: [PATCH 1/4] soc: qcom: ubwc: use no-uwbc config for MSM8917
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-more-ubwc-v1-1-d520f298220d@oss.qualcomm.com>
References: <20250814-more-ubwc-v1-0-d520f298220d@oss.qualcomm.com>
In-Reply-To: <20250814-more-ubwc-v1-0-d520f298220d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1222;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=BdCL04OAptKdQWGchPijTezBT64XWbmizjFr1nay0y4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBonY6udRYZ5ORJnkEqhveAjpyCwQyXvyjNpd42F
 vIs9mOUiXqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaJ2OrgAKCRCLPIo+Aiko
 1eDhB/91ysi69q80sRB5MQBUiIr8YwpDizYVm78VUvgFL/feN4Yw4bb1gcseaH3A7wdrJIzDR9L
 U7q3/oE8UNEQjP/8rc927Jb0lXSTUfUgFBXUt8k1YjETmyfanKP2jLo0z4LkiwKydFgGcjOGuld
 aijspVK0wHJgL3r+DvjkF59fieNIYg6FtvQrkCsxKK4yczRA8hn85WGOZ/xJvkcDYn6bx7TUyOR
 tZwuD0Fwkxj4iXm4ZORtSwizuKCV0HEZQe5WGOVECTBQi+LwUGuJ7+PzrX1TFlaVmuVtndL/pz6
 df6Ca97aKVUBebAVHio2u5Ofsn6qEK1etaWQgJhcNiQs1KIN
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=CNMqXQrD c=1 sm=1 tr=0 ts=689d8eb5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=MyDQx4m5f6BJRij3LbIA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: JkVgQorbrbgvIrJvSIHZIs55dJBe3whB
X-Proofpoint-ORIG-GUID: JkVgQorbrbgvIrJvSIHZIs55dJBe3whB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDE2NCBTYWx0ZWRfX9gKudueQ/ak+
 hW45V4eDak2Ech1W+j2UJcQiRvMRyZCKK/aFGI3pdSD11Nxdth8QI+LDr+knd8RVYkA0jWAGOWE
 X1GYSeUPd+L7BeN9TayQ5jF8S3ChrrPJP2eqlhEiofZy18cl29Y6venpW686l0peclW1Qs7us4+
 D7iOo2SicqV/VBBZd9SSWbbo7sGtapkWqEIZHbwl8F/u3IGjMf/I3ziEycHixt51lUEk8/PJ8fW
 RKJq77Oorj40L9nYetxsk1APFDXFU/MZyi+SH1haDMIeKnP48WfpvOD+la6vazj68DsO/nNvog0
 02E4mCuZkQd2Oa77hC7hja21uw+pto8UucQLUFnNWwiuxq91QstGpO/r9ipPyswATEHrKjvFsEo
 tjByhjYc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120164
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

MSM8917 has MDSS 1.15 and Adreno 308, neither of which support UBWC.
Change UBWC configuration to point out that UBWC is not supported on
this platform.

Fixes: 1924272b9ce1 ("soc: qcom: Add UBWC config provider")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 1490a7f63767bba176e8e2e76891d7d2c424bb7f..5113c2902bf2ba3711bb14b35bbbb8a2b49b8cfe 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -225,7 +225,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,apq8096", .data = &msm8998_data },
 	{ .compatible = "qcom,msm8226", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8916", .data = &no_ubwc_data },
-	{ .compatible = "qcom,msm8917", .data = &msm8937_data },
+	{ .compatible = "qcom,msm8917", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8937", .data = &msm8937_data },
 	{ .compatible = "qcom,msm8939", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8953", .data = &msm8937_data },

-- 
2.47.2

