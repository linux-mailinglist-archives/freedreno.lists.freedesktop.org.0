Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6B7B25D0A
	for <lists+freedreno@lfdr.de>; Thu, 14 Aug 2025 09:22:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C10E10E7FD;
	Thu, 14 Aug 2025 07:22:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XeYe3BPg";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E03510E7FF
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 07:22:34 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DNMqWu021243
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 07:22:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Iala9fw+bbdaJ5tA57DCC4sJNCfBziddLdxHkkyCCYQ=; b=XeYe3BPgqDtWOMj0
 4buMmIgjIar6qVZulmzVVU0bEWBQ05mkBL4EqOEWGinzSGoA4RJVlSbkMhRCc+vq
 lGPliE3mPeVz2r7dp3dtPzaiiVdk9NlWhH4X1vp/saJDo//bTZ/QngruIc3YGdgt
 opu00X318gfdsEeyeOKyWNvuYBQXunrplHKdBPQYd6MU0vIhaLHcNIHgRrMdW8vN
 RL6EiyB4XfMtoLEXsrLq5Vmx9lsNSeYiJ24LcsBTShYfuJ5hBmHk+hXsoujhX8QX
 kWOdjbQ60rolw+SS8zzTqBckpMrDpp3fqCOEANk1l0VczIPxV1fLZqr3YhYQOCwu
 cBWjag==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9sxynm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 07:22:34 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b109bccebaso17610711cf.2
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 00:22:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755156153; x=1755760953;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Iala9fw+bbdaJ5tA57DCC4sJNCfBziddLdxHkkyCCYQ=;
 b=T4NHScHgHTt4OPNp2ZGSJuezxg3qaln5c6LV6AbhI9k+YdqHMRiarSZNhiNKu1wZNa
 GaCrecuUSdQWsCeONhEThk+S/AYS/6fHipYGn9B9kCZ4++OcjZXp/D8woKylRZkmMuMC
 2wBJCWBEPQQSlUeOr008ZfmJjJxZSzIUmtrwBP/GukeREyHX5PZB0iOYl2ru3bVwnff8
 7vivjPWX0xzxoHh7ZjQXdN+PVXR2lBhrMj1xZ3iFOVAW2B80f0D466sgj2btGkJvQ0lG
 bFT7XcGu1mXBvoZBzE3iFEAfUfYhhyALZ5gKSf73o/zXZfrMNuaLaBHJNcXt4MlOYB7o
 5kJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHpNmS7/UAEtwUVYPGZEbSiGsZ4WChLA4e565nJnu+UBQhglorjpUajeIalTDP/5Xk+BwpIBJDfGI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNSlQbKFEi/WY5fv/VK0wwAl6ck3TWWFiFMHZ/sradb5ZU6KN2
 1daI1Sg4Wj3PZzwyRCfpUgeQJBruHonLXfiQr/gsjYwRb8ZLSgNVaB5GhZZnl5l16qxU9jY/nO4
 8dvF+ypqL/eVvrL6gQUp71Q5FHsCDI2k9ThCCKEjr1kbkT6h34BCMx+VWPbQTMjQbPt2MALg=
X-Gm-Gg: ASbGncvpytnm8XmXp3xzMmJfv3apWG3ZVUHCaY+HUiqg9BmOF2plvqGFkv/IElxqSAm
 ErgZGFpD0HEhwEQf9vSGxzQKmjQcYo6Xp5XCznrALOc3KZ0P35zJY6/5YYJ2S8uCtRmGIKQT6g/
 rjibiESWwME7Up8cEYGjvFmrnwEJ9gdssOUQr2yh7xA+Nb0IPjSU/3tNSrTZNJvMEAsTEI+g0Ah
 +xcjhiOwjRTCQQUOuD4RyX2JDYYbVwG3pa8giuhWbQNzDKvE9mJNWiqzT2byzxypyjMHLUHYf/x
 d0mOVC1qg5dPfWvDEXG5umYNCsOaGwVabfwEWmeKuIAdiv6biDSSoZzopWfx4JKo/11JX8XbjXn
 wVHUFEASim4j9rthxkPAmu1ZGMWkZHCEYvIflJikWpSn46irFl2l6
X-Received: by 2002:a05:622a:1f9b:b0:4b0:743a:b4f0 with SMTP id
 d75a77b69052e-4b10c594815mr16459221cf.41.1755156152661; 
 Thu, 14 Aug 2025 00:22:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1sl7ib4c5kKM6P/fyARJ7qBtEqOl5rM55p7yXhUuPoBHjBKCXG45d3uCaonUJQ6Db5KP+Hg==
X-Received: by 2002:a05:622a:1f9b:b0:4b0:743a:b4f0 with SMTP id
 d75a77b69052e-4b10c594815mr16459021cf.41.1755156152190; 
 Thu, 14 Aug 2025 00:22:32 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b8898bde5sm5648258e87.3.2025.08.14.00.22.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 00:22:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 10:22:23 +0300
Subject: [PATCH 4/4] soc: qcom: use no-UBWC config for MSM8956/76
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-more-ubwc-v1-4-d520f298220d@oss.qualcomm.com>
References: <20250814-more-ubwc-v1-0-d520f298220d@oss.qualcomm.com>
In-Reply-To: <20250814-more-ubwc-v1-0-d520f298220d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1427;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=TtT0Nf2zRlo5tUth7b9XaXrqg4IP4hWtUayIq6Mc8HI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBonY6uR3H78dQvhyGcDcCaUJ7qPD3Xru3SjfvV3
 tXRN/z8wTaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaJ2OrgAKCRCLPIo+Aiko
 1cphB/9smaFAM7NADBVO6fZa++P8hH9+w0gPru+ONWB4peljrSZiX8CnO8npayp6z8RsETV8MGH
 Jyt5LAbeveLTgKKeSLa0k+MX8AuKWdWLXtA4ipvNyVyw4Pes05Gw0jXFDxrH8zuCHDNKHPnqEbl
 eH/XQ5hczMUwFVs70fgh8WQxc7+frMb6BJtMdRpwufyWM1AKvj1MwfVg3oY8vI9CxqlTjCkS01q
 07hegfbemKwn60pS5LcdBcnlf8dlelBoZHJkHFKlNI4prJ0KAUJAkySizsEqe77WazXqvwuVQ+n
 2HAMoZqv8COj0JM58vEulTArngfbn5ylZ4wXmKFBdCJDzXZX
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=689d8eba cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=XT48RGDP_DIob0G9p0AA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: flr4ihxyUeLhvIjK9RcRs_iuvWz4PDGr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfX/bh3iYs0foa8
 ZPtKjaz1BAt0RkSo57iJLHgb39W6FJD0aNHnXGyUY1gXtoJ4kZh6es8K7aXU67v6zrnPgvhbAaB
 yCBjRsWFusme4xlxxLjp2pQLGID3cYS4w9eCowWx3ryZklq2cMPGjJLdnSHOnd2tUMaagxSA91w
 KhHMRxyxkKqBYKlKfsFjBiQSnKsWwsxHHASnBTW8KNwbKVGJRd5pRm0ze18PSZs71T1scoaBOif
 46skpb7pfxS9kV8sT3/z6h3Aa1zlFTXu7nX8I25PYyIZZVRmCftwX+PPOnUWndumJdLn+xKo6t1
 A9njRj1mNiG5rZkUgSTx5x0w1GevUjzBqhOus8SxQTB1Iezz4mwhFF7Eb6LFbOth8KsDalofDsW
 L2mfgwk+
X-Proofpoint-GUID: flr4ihxyUeLhvIjK9RcRs_iuvWz4PDGr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015
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

Both MSM8956 and MSM8976 have MDSS 1.11 which doesn't support UBWC
(although they also have Adreno 510, which might support UBWC). Disable
UBWC support for those platforms.

Fixes: 1924272b9ce1 ("soc: qcom: Add UBWC config provider")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 689e333ae44308cec178ff343bf09cc89bf9fce4..15d373bff231d770e00fe0aee1b5a95c7b8a6305 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -230,9 +230,9 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,msm8929", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8939", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8953", .data = &msm8937_data },
-	{ .compatible = "qcom,msm8956", .data = &msm8937_data },
+	{ .compatible = "qcom,msm8956", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8974", .data = &no_ubwc_data },
-	{ .compatible = "qcom,msm8976", .data = &msm8937_data },
+	{ .compatible = "qcom,msm8976", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8996", .data = &msm8998_data },
 	{ .compatible = "qcom,msm8998", .data = &msm8998_data },
 	{ .compatible = "qcom,qcm2290", .data = &qcm2290_data, },

-- 
2.47.2

