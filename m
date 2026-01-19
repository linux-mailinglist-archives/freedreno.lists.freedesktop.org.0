Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14001D3A115
	for <lists+freedreno@lfdr.de>; Mon, 19 Jan 2026 09:14:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC90B10E38F;
	Mon, 19 Jan 2026 08:14:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="b8Ckh+nQ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Czi2ucWe";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AF7A10E389
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 08:14:44 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60J85Kma3566507
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 08:14:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2tTHPmj2NBaJb//qs7JmAmt97xPSCIRHJxgVnBNp34c=; b=b8Ckh+nQruCBx6g3
 Yv5/PMCoCm3zn5m4yKZVY8bQmfKpDg/eL0MlBGND1hmbffxHP7cPhbS4fEgNpxH5
 V4UUpIZxikIvZIYP0FF/q4TEq4Nu6uLoSyE2YMYishwGk8V3+5DIG7bB8ZpA6nNE
 K3CtVz/Y/EW5Ch3dDiDCSK/pU8uyj2RwPuuTdeBBFRnEncUUWbBsmNBc5NYOgcCF
 9NTb+4b2YxOaF5cIuS4UrzaRmitT0bmABZSFz0cTs6J4TVFrJA6HfIUowSgBZKVd
 jaTv4EEQ1VmpBS7j4QFC9SLMn7vlgAJGsRLi8xrVxrcwwdKARG0tg8WDxD/E+1tY
 ktrqfg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br3q9c4sd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 08:14:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c538971a16so910314885a.1
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 00:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768810483; x=1769415283;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2tTHPmj2NBaJb//qs7JmAmt97xPSCIRHJxgVnBNp34c=;
 b=Czi2ucWevX66iiA9ciZTnvcvxgZZwBrr6nIhXQUwwv0Nnb4IL7n4fMscxdhS7nFX55
 w3Wrbt/7EfsmpQTDQEcJj3MmAPom6l1t3A0amhREhUlbRqrsOVeX8HFbALBIUPL0ehSm
 dOWnBV2uC1BtBRph9TJNbTYZzgQ9kxOzNZhCXw473HbQ686nCRYtUYuFGL4V8B4rNn4j
 pGB7ALWvDLk3Yyf/vFGaeGKwYZH3ezgyih/tkmElOS44VfpGldNrwma0yM9mQIiGKLr2
 +abFEUol/waN/+975OpUqmlWBV3Tk7ZeygCSe11BXhOFs5F3tNMlHMRA+XIM5We9R2q3
 x3Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768810483; x=1769415283;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=2tTHPmj2NBaJb//qs7JmAmt97xPSCIRHJxgVnBNp34c=;
 b=U7dwr4NH+fEdo76F0odZWWFMBndHAqcKdFcLtD5Sjp0QCOvmyOO+esZQ39N8xg4VQB
 1cyMjgA/yYJrBXEtplTRrboo5UCEvcQhrjg5EH7mgBd9SEccdisP/tkEDzWHkD2cJTVJ
 kX6M7N8oXFyDxe6ITUPNmqdKw6OJJwLKU4xbtUWcKqazR1DHHbvTaoaEUKo9kAjR0Bs7
 GCcdE4z3fyu5cf4gOcMOhrxhKjaXQ9Ikb/m/mVzmEzWql7nKWJ//W/zYOt7LQ1TuDW2P
 iGsSDcD+Q3YQtGVM0mVOlR4tk8DhMBgMzebDhs9Fy5sWE6d87Yyj+I41o/NtWWq3FMqi
 mLjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVL5vtSH9bqT81i4W4W5Ubw7znAl6pBpuNobkHX4JAX07z/Osycfi4KOYMJwwc13b+W+r4Deac63O4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy34GGa7NaseuHUZsnqEf2XQ2J7ONvfdhqUrEXTvm32L5Z6G9lA
 h3xYSWTbX09SZCv/cqiGczW8cHgA8g0Jbe5aKxmcU/u2PRqCbZ2iP45NQ+ugV1iKQwFV06Ad+Wz
 EPNWYR0nnvk5LJk0rArqm9ryHxg73pLTbpGqCD+4M7HkZVjF+uUK5oWFzp4wSthEu1oRqHdE=
X-Gm-Gg: AY/fxX7JG03RZ2judbMdqsCIRpt6odm4tlDv9boNfe08vRLqObS29Rd7e1GYe1yYYoF
 VE9vdn8mfVnPXmzrH92POWZsNCj79qe1gE50/g/L8qodAjMUZoQj3Z2Cw+YbY9xixubnzJl/VAO
 T/yjm85i5DfP5tz4SaAiwxrG1QF/ZXq45J+Aq3bGgJgJ6JtnxFDkkUGBQLJx+J8ANBGHCJLTB5r
 Z2AgLGnuVaA1FAEBRZwblaCWWuLtoATYcP6oBxTQZsUt/TMXp3vue9HPtAbfjIiY2cpNW+gNl0c
 iuVfbCnqVoB4+rskdQD2PAjcdGhQ0ZAil/vP3GWjPM/HqFPTtr2lPjso2yYnUFGz71Ddw8pwJ3x
 t2qm/P69VV2hYnAfhCK+GJ8S0RuePi5zU1DeM+uAngIsfLiKTeIs7VjTBQweyMHMJnZfsXmd5BI
 sJKni98NB/kHo3Vd5yriaC7/0=
X-Received: by 2002:a05:620a:3712:b0:8be:88f2:5b15 with SMTP id
 af79cd13be357-8c6a670f6e8mr1458673785a.38.1768810483127; 
 Mon, 19 Jan 2026 00:14:43 -0800 (PST)
X-Received: by 2002:a05:620a:3712:b0:8be:88f2:5b15 with SMTP id
 af79cd13be357-8c6a670f6e8mr1458671285a.38.1768810482685; 
 Mon, 19 Jan 2026 00:14:42 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf34d572sm3063845e87.24.2026.01.19.00.14.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 00:14:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 10:14:37 +0200
Subject: [PATCH v2 1/4] drm/msm/mdss: correct HBB programmed on UBWC 5.x
 and 6.x devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-msm-ubwc-fixes-v2-1-e0c8c630fdd3@oss.qualcomm.com>
References: <20260119-msm-ubwc-fixes-v2-0-e0c8c630fdd3@oss.qualcomm.com>
In-Reply-To: <20260119-msm-ubwc-fixes-v2-0-e0c8c630fdd3@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1114;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Rj8iAyMfVncSKRo62kAtziE4yMoYdmQABsHSh5kDWEY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpbefuQyz/KDw5+L2NGZr/8tgfTvkCZZ6LwB57K
 VEiKShTdROJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaW3n7gAKCRCLPIo+Aiko
 1dL+B/47onnFk9FOGKSyu2tzszeBJMJknaST8XNmfVXnyT8fSrNmF7Tcug9qjZ+iy/tW8/viW8n
 kcj8bw+OmmOeCpqvAxBfzRbuTJBuI6EAZt60h9SqdwdyJ4lTE8uGF4Z1TRvSD+psuBqrNBYCmYo
 0Em1AMukV4Xw8gYOnQmrW64huNldZEFeeDGulwGIJOVqNDj4cPMn+UZPVFu2mlkdndXp6FhxuiA
 8zuGRmL5u8zO1/BCirhUE5Y66fxqpYt/x2Dukek7vZ/znMnhqHY2kRClGWeA8Ez3RwLC1a+HQ2n
 4MA591fvbGA8hFNktnhBKeLPYe0FhbMsAqQxsdqTG7I+XEnl
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA2NiBTYWx0ZWRfX8Pjf+NZo8top
 wvgLAWPbkuppCGdO2mteKzHlxpTvBjK8gBFvDM9O9qJrJhRGUbAeURP2dYmnMW24Y/x2Kfz+/o+
 4iKQnT9FgUSwJhNnwWxnJ9Nft9vkQYe+iWDAWg4YjeVzj8mBKWio6q6my5dK8UrB+7gsP2sAAmD
 PIliHSLxr74AWOtwmehuw1G13LrNsD8sq3XILoBWt0GWFR2DXVKPJ/1ejCQEuQjTkrmwhAO3iFe
 yJBCNNp2tKIdd27HI1nG2mMcovs43HTnlTaYTg0Wml7D99o540gcYvOBT4EEYqV4Ki6kYQa1Opv
 E3aNjaD3p7sF/ytnyBlrGaTkKh5SpZN9PcNMKLGwqZUdGqnuDDEho4YWi914/iz2n17Cl9Iz+zb
 06LfxFmgGKXuNezcDURZ2JoDAuzb1s11O5oIEJzSep+KKkpvVqRxcMZwH8OUhMgDcbRhNxzmOXk
 W9/JGsMG34kpvmRodsw==
X-Proofpoint-ORIG-GUID: jIGeOPgembxaF8ZkyII3vbnW0yD_CWx6
X-Proofpoint-GUID: jIGeOPgembxaF8ZkyII3vbnW0yD_CWx6
X-Authority-Analysis: v=2.4 cv=dPurWeZb c=1 sm=1 tr=0 ts=696de7f4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=iGWu5DhtBPyiFZBs7r8A:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_01,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190066
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

As in the previous generations, on UBWC 5.x and 6.x devices the Highest
Bank Bit value should be programmed into the hardware with the offset of
-13.  Correct the value written into the register to prevent
unpredictable results.

Fixes: 227d4ce0b09e ("drm/msm: Offset MDSS HBB value by 13")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index bf9a33e925ac..910242f5a71f 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -229,7 +229,7 @@ static void msm_mdss_setup_ubwc_dec_50(struct msm_mdss *msm_mdss)
 {
 	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
 	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
-		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit);
+		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 
 	if (data->ubwc_bank_spread)
 		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;

-- 
2.47.3

