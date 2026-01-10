Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2A5D0DBB7
	for <lists+freedreno@lfdr.de>; Sat, 10 Jan 2026 20:38:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29A2910E1D7;
	Sat, 10 Jan 2026 19:38:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BGIbUD+g";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MXeKbHmQ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E71410E260
 for <freedreno@lists.freedesktop.org>; Sat, 10 Jan 2026 19:38:15 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60A82IGW3264669
 for <freedreno@lists.freedesktop.org>; Sat, 10 Jan 2026 19:38:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3MZnpYwI4AmU8ANsdt4IQetHLgrS69gpAaiV0A4L6G0=; b=BGIbUD+g0rST4H/0
 s+fwuFwEO+V7UWy9ZYxzanQD0tevxxu8zdc5G/CXdCLVk1bCRPK2GI1Y/f4lZ1MJ
 5TAnuANtmUMfvUmbmEFOTrVI5g4uPTVw1cuI0dL5XLqYySOgH1M1fXdKY0KJiLeW
 YMHX6jWZsrxFMs5a6TFAnolwIqs2BGtnVbarfXXLx8urJrVdKBxdxVHikPf6HApK
 jDpq0203gSs3aIfvOsiAmUJqSJU77qCRQbfEozXUpY4f2QJ1RYYCbHNzokpcZ9HZ
 288QB0F4J8VDQ/mJc3xB3Ko/1r1K8lFS9dTqA02wpP1EAl5dAtgGm28OFKRHDnoe
 vXhE0w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkjvxruc4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 10 Jan 2026 19:38:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8b2de6600c0so1440945785a.1
 for <freedreno@lists.freedesktop.org>; Sat, 10 Jan 2026 11:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768073894; x=1768678694;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3MZnpYwI4AmU8ANsdt4IQetHLgrS69gpAaiV0A4L6G0=;
 b=MXeKbHmQKGZCfN5Zr0mLX7VIL2Uq+s6wvy0dhXpL93qieDd4SISlVvftvaAuJHgcH2
 W1oC4eGAQ0nOqVqORjj9xD5FvtSdRkotzZnwTjylGbdZfV8fYNGFIk2HwL5nVvm3Wb1K
 ou/vz95olps09bMqJjhvRfIl4svseneIG3GHyrgAUDn1dR3RnIDEUQ682TDXbSpNA1fs
 n0RPg5dah8TjraATPKUk5ODigXeRg1hgbUVUqeRgNyMcIH124Ro+HKsX1ncjggFeE1/N
 mDsf/KMoDAVWs1lBRzywVsKzJOrDXV7rfj/vxjFHhCSPq+iEpD9Lor3R/c1xbRfdCKb4
 hmug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768073894; x=1768678694;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=3MZnpYwI4AmU8ANsdt4IQetHLgrS69gpAaiV0A4L6G0=;
 b=DThCfjvkyrxpJ8OpO0YE44TJQH7vETBEtzhHbOwxYvr7CS+k3BFUCzUts4Fp/bb6MN
 MgyUT1Pg0ZEdgOviayvI/1oKZMpzTX4+EZ4O+fHAQf6NfCRQpFiAcouCsLRVXqhpeDnD
 dlPYoG9J0ir1vezWsW2WPZblU7158U7W/qP/ivLnY0TW54GHmkJjl8X63X+qg+T+xgDM
 DwJFdlOsifGS678pe7RN4xKnwzTKWzV+sNXwpz3sZeJsrl9wrUnJfOtJce7yMudr2Uh6
 XjqZrplWeucHNUuKMnUxlwLmKH9g3k3PYCehiHlfOZXy8z2ocuxeRPGJLROg6okvYQWg
 fMXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWA9fMcn1DR5grdS1vJi6Vf3ynM+ydCY5py+NxheQ5+qZF93Wf5JmnhBXxL22shhWX88VoNyLVN20E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBNNL1ARP0XVP5sazxmV+78ZEIvXW1SY4b83D+wkZhEBOn44sU
 LTOu4wLJYllg3ekPiSy/3aRbdNlxoNomVWqmhLedXF2O6r6lxH7GoDF0aRFIRhnwyq9sYqjSYre
 dMmjpb1HZsVsYh8E7WqtjKEkTACMp3VtPfQ24KkeDTn1pv+T4uWNH3tkonKk/hUQUxsnRvNw=
X-Gm-Gg: AY/fxX4t8BT7yObNObAO53SyVeoz8bVeYDWdDmLO+dGKAPYKeyf7XRgUczyyG41sZgb
 6ZW9CXBRhRbBWmii2wXBj6Mv1UEmgG36sRyjBjSKnL2iFU4MfA2yqN9DlxEgGDZEjpSUYnhcfsX
 wJz03mvSqyqMdL9JZDgsS69GSJUHczmphRk7JGUzjGvm53xiOjoT6zn3D8hmUYuVty4znC/2Byg
 cqSiqf9WNhoMwI44SB0/10H7J5EztqnQ8jWnkZCEPBY4IBMnkQJuPg+G1BPWkRy5CR6Cjovrs5T
 cKs+Z8b9Mw+psMvNLtWd5PLBvY76QQYMviPT3ydsCMX64cf6eyE9/2ncUZ4ofbATHr1shC5SXQC
 okAeZx0AXOJrszhMVaFiDnJoJxiwQgWV1QLh/u27bO0v7c6wwL4FGfqLfstvyBrF6d+gWFptSWI
 hY7eMQ7JZYKTzf1Xb7lGUjers=
X-Received: by 2002:a05:620a:4607:b0:8bb:a346:8c84 with SMTP id
 af79cd13be357-8c38939268amr1573221585a.30.1768073893660; 
 Sat, 10 Jan 2026 11:38:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6d8vv7wylVfOWH9XQwmhfMHQFtcvp3+FKXUkq+XGELB6EtqNJ4uUpNaqA9VrR4pcXeMsvqQ==
X-Received: by 2002:a05:620a:4607:b0:8bb:a346:8c84 with SMTP id
 af79cd13be357-8c38939268amr1573219885a.30.1768073893190; 
 Sat, 10 Jan 2026 11:38:13 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b65d0f6absm3539700e87.42.2026.01.10.11.38.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jan 2026 11:38:12 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 10 Jan 2026 21:38:03 +0200
Subject: [PATCH 11/11] drm/msm/a6xx: use new helper to set min_acc length
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260110-iris-ubwc-v1-11-dd70494dcd7b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1288;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=mAfr3Sv0Osg0wOtrPrsuwPv22YVUtw2MtmFVrPEbyq8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpYqqUQ96O3LFNjh39OwqvwVcUbZj9dUUmpcH1J
 kW0A1CPy/eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWKqlAAKCRCLPIo+Aiko
 1Q2vB/0cdBzIwbndH4UQREwf5CUHqbknV4FAHJoUp5nO2uiqTVR8KYcDVnNu/4bKaMWr9woUW8t
 bF33MrWi+KMVp1eVQm2pX1121AYflOiZrCRIvHZN2hZYrurraQMn2mDTXnhU+m1NC9KhXxBwwRv
 PudYpa2EfTtBI+yk3QITE49ai9QD4EC3nKu6S/PgWjUvvcOi70Q+jtgN5iNkPjO9XzCikktzLfT
 lhv8kOuKWh2o3wZqkIVUz6wACkmV0EWKGfSFKdv70gYqRh6UQ7CnlqC5llSFJM5IX2vdNI0B89e
 CmzEyN6Wq3HSblaiiSn6JxcgRLdg6ggEL3OfDMOpM8ZYyg3N
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Wrsm8Nfv c=1 sm=1 tr=0 ts=6962aaa6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=F1F9tmq6QbaLjm51Hh4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 2-BPC069Rh6s9grSfUnyXzd8qUNoGOS6
X-Proofpoint-ORIG-GUID: 2-BPC069Rh6s9grSfUnyXzd8qUNoGOS6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEwMDE3MyBTYWx0ZWRfXxj9cxMufsxhQ
 6+uXMPXgjgZS0IdfHPLEN/vyPtaPqCwKbmV1ZKJj/sn0qe/1J87XJtjV3UpI40fJhlYJc/v28U9
 +B5LZ9sXK3OcT6Tk3HRdZgyCbFcQK5DNFYPk+GuorFyTFzykSifLsn6KJgFfF8K3wCeWzYyzjhi
 A6RmA7EuswNn71yxv9S59uiM8FUAemLMOSppJkEjSSw6SYTAx8W8mYroEXvtT+yLdHkeR2GavNO
 /v3hnatXoTAtqY6eefmT+wM+6r479W5aeU10jsNWVw37qQj6oLYBCPv+sNZgSlIB5JnC40pqBUu
 udD1HLsxuedRtc+UcZUHahPazrjurs0GEUhXNmCoLEMMrCt8aTGbi8bs1rxiWpLSKvQbtHfwgEH
 7cGZ3DZjvM4nWKhxoIGxcQRLklNN0IncOF8hvNlp8KTgW9SlbIWnpOpmEBsqaf3AFfZPpnPWmUM
 q8/tZSnLL21WAIKBXUw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-10_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
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

Use freshly defined helper instead of hardcoding the checks in the
driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 2129d230a92b..04de4d598da0 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -820,7 +820,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	u32 level2_swizzling_dis = !(cfg->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL2);
 	bool ubwc_mode = qcom_ubwc_get_ubwc_mode(cfg);
 	bool amsbc = cfg->ubwc_enc_version >= UBWC_3_0;
-	bool min_acc_len_64b = false;
+	bool min_acc_len_64b;
 	u8 uavflagprd_inv = 0;
 	u32 hbb_hi = hbb >> 2;
 	u32 hbb_lo = hbb & 3;
@@ -828,8 +828,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	if (adreno_is_a650_family(adreno_gpu) || adreno_is_a7xx(adreno_gpu))
 		uavflagprd_inv = 2;
 
-	if (adreno_is_a610(adreno_gpu) || adreno_is_a702(adreno_gpu))
-		min_acc_len_64b = true;
+	min_acc_len_64b = qcom_ubwc_min_acc_length_64b(cfg);
 
 	gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,
 		  level2_swizzling_dis << 12 |

-- 
2.47.3

