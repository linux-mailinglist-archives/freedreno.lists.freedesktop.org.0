Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BCCD1A764
	for <lists+freedreno@lfdr.de>; Tue, 13 Jan 2026 17:57:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D99C610E535;
	Tue, 13 Jan 2026 16:57:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CiJRy9dc";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cluB3sGv";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82C2210E52D
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 16:57:45 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60DDsrAX2071628
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 16:57:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9ln+HxvUbm17UzFH53D4M7bFPebJ/beboKgAcEXWZ3Q=; b=CiJRy9dcnIbnk+bV
 stUMsfuWAJaVHkzK/H6VNN7SccgDAczR5qhRgLCTZGxqQZVJUCCLhaDANk7VttEX
 c0gtwreQi1LkwG577E0zK+IJhLHeBMwAdminnWB668LHCsJsmVqm3Y0SxooNfXYm
 3uzqaF0n23FjmhMMBmSq/IHI+SMRiatrYatE8DaZWREJfLMYH/qhyUSJzRB5D530
 36QJ3x5odjj33quKOqo5/PHN8WqAExkfs1DMbMnvw6sQrr1IhG+pvIA3HS4hbcS8
 /6HtUD0U5TsdTGoRoHwz9RuBIHLQu5RAX9GeMCzwo1iJNLrIeuX9V+7yjms8uaQA
 jEPBNQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnqbm8neh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 16:57:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8b2e235d4d2so3029011085a.3
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 08:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768323464; x=1768928264;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9ln+HxvUbm17UzFH53D4M7bFPebJ/beboKgAcEXWZ3Q=;
 b=cluB3sGvFmOzOYSql/pN/3BTOkUxnyqfApYCBDeQ87NhlYJ+xb8Uy+sJf7BZwC1/p6
 3SgbaFLtuwLuNLxJ5kR1KaGBU4KysOBvwmiZrb4sF2TjIjd0nh3H7eVWWuRJ1A8zqkfq
 GZcmeJw95qck+HMOkFclaJGSqWE51XqLyg9wzNGsHiZG4F1kH5VmUIq1s1yk8rm1axfi
 W/wt9jR/9edSP/2lo8gHTFEA7fBVTqO984zMqrjtKVox6eEw1cAjdorHkMEo8w3ol0i/
 etWjDW6rRb2ETf9+OSeZ0UVTvsz2SNnX4HR4gDbSnlQ13IYtfF+KQ3Xl0p4y5P4jL+uH
 S2EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768323464; x=1768928264;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9ln+HxvUbm17UzFH53D4M7bFPebJ/beboKgAcEXWZ3Q=;
 b=vARui5t6F0p0qLaHhSFPkCLnelODJmBgXDMsSREIEzo36FDZM2UrxkVPPP7U+Jw1Tm
 Ckvp0w2w9Sjcp6pQ85JkvwPO5NIKx3P0tF3phMH77Bm7nz9M3MQt8/3LaPYvUUBmVdG0
 WbZ6VHdSm573CQAUPPS0jSH21klYy6PqqUilkHboGlP7vX60ObCN+XoJbeZVRg9Fd3QZ
 Q/cSU8TCNmZRwiNoBlwuyVxtlVM5Eu8zWaGeRnHvOaiWH6NPEva9l7w1uLHXMijqm3Tb
 9CeN0fdCNB5k02FlLAYl9qU8aH4mZFIJuev8XccGclwPKpw0rMzByFHbivjFLTTw8vnZ
 NzYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8a+dGJIQO58jHdEhdcCaykoYHpwcaHv+fi5qcBq5JEVHkhgOFOWVjlpI/mk9djrfRj/lJ3IrEnKo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFH52LEwlqKUCwrMwpQHRDQQiliqhTI47Nr4asUVgAGHP6NOkg
 ydgTFF7vM/9NdiiZsZBnO7FLv6/UaXA4CVX71QHG4XWAwKooVhqmAMKgOr8BmZDejxXj8GTcNxh
 15pQ0MO+yjLWuOxmsbg/t16eNU/kZ1hRJnbCj8iS2Bs+CnbWhA5wSV5yJrl1a+BrRp43Yckg=
X-Gm-Gg: AY/fxX7YD7KFspfLwpsC0iCbI06jrh4vpChAEoJZjm9RAAXJ0RXX5YmbNcvJqmgIsac
 Qmu22LmKq7qtZp2NRhVhNLJKseiBlRXhQyXsc72lag0OfxTM/KlL4x8UBqH9vqfXU1T9vPebOtk
 tbGVIKu5LJzYfkkhGTXqHHg+Rdl460qDSZPm8/eXl/lAUuJE6o64qi1uIYqqgDzftLHfNnM43F7
 rmw5r5tGtRRWeQO2FC7J5WWXN1/s7MZ62+HgnW6ZvJQfDXpo7dNdKrl/RM+aF5eBX11d9olxrmF
 e+3ahTU72iQTocCCq2cQs5wOu3OqtUsuDfHeW6du1GXZxAwu1mlxM/8p5JIYtSeGASwoPEI2+oj
 TzZEjqPYVcpbTKRPm+ObCHKSxax2oHkzoiwP0SUkiPfFwmWP5qvsKSQBaEPGkPpgNDtuWVKd4KN
 iiqzdnJEjVfD4plGMtB+dK0gY=
X-Received: by 2002:a05:620a:4508:b0:891:a6b0:7cda with SMTP id
 af79cd13be357-8c389421ca4mr2991198585a.81.1768323464086; 
 Tue, 13 Jan 2026 08:57:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGD/VzWtFUF012GOVfTS2hWslL26e4LFDs4fm8YOUqIn+Z0vpR8oG7HeQedj+KqHXV1pPkbog==
X-Received: by 2002:a05:620a:4508:b0:891:a6b0:7cda with SMTP id
 af79cd13be357-8c389421ca4mr2991194385a.81.1768323463585; 
 Tue, 13 Jan 2026 08:57:43 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b72af5ed2sm4788677e87.58.2026.01.13.08.57.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 08:57:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 18:57:26 +0200
Subject: [PATCH v2 11/11] drm/msm/a6xx: use new helper to set min_acc
 length
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-iris-ubwc-v2-11-4346a6ef07a9@oss.qualcomm.com>
References: <20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com>
In-Reply-To: <20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1349;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=h7MMn6eoIT/MLTtBQ0NByysAANWVyaCDgHBC25L6vPE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpZnl0qQzEujC0Os2qq3L19Z8ETx14X5sDCLumN
 QrOk+2NC6GJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWZ5dAAKCRCLPIo+Aiko
 1QNbB/9KFj3Ho6JZZambhNWCFaRf5CMzHvKhgD6aAHu/3jrbNWTIhWCZEZ6DHPQ6+581Nfl2fBj
 ViJ8+XB6bNZOyMTaJjbOzcvjWXi30dI+b4P2hH6cuJjkyH8BPxAMbBMQ6i4bgLZzYCYGEa0lp/N
 Z6WvrkerxNaudzOyUcJwlFnoLhzy/Ehvy0bSnKIO6AMEGlWbGjGSVZBaQjd7jp7LC/j3GlGhndR
 Tn35YWUmeO+YHWngHqxDCxEWf8qZDMgq2R0JNdeNoYsZvPcfyP9+UaXIm6IDzoMJwLDeeeJGE8o
 7am1BUVE1uZ43IdeV1qn8nBJTqu+EVGZUR5LSraprkj8zXjp
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: RwsS33qUU5SMh5TmhicOGMjdcpYNU7Kf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE0MCBTYWx0ZWRfX4fW9D8dEz0+/
 KSk3hHY1ZBxoS0DnE79/e7BqBZKlK0bQhslwLJV3TnKThxvXYpUX6MT/QS9IzHG3wacjU67THxl
 InEGSeK/n0pAs36+Ka6AR+nsySmVLAujUd97bK6cZ5rKyAC2K6t7NWbr/BROUiy5gnh0yD0Pfd2
 86wCr9ChRZyd51y/Jgq0cqmOUXmimg3k++pKKY3XM0EY8AGJiL+n6cPRFjcrW/X4BT/pOWMY2en
 mmq+JZ+qaOXtR4nALshulI5jm5EncDxNgeRKeA4GabDPHu2MMWmFZdnKrJP7L/OEhbeTVtGi6sB
 fNfvgSEGcJXLTqos5VVmcpp1bYlRwLn0UwBoDeJutsZBSToIwndtoraZ9hH0FJdU3WqIXg3dRIV
 yj0mIGbs81pC4BvZ2iQ+EWBI9QZ8+G2Ooolverrwgpe+RclbZcLQmYwyN2MNDzQzgD/Z3Q1QtgR
 c+MBkh1b8pW7u8nHFEQ==
X-Proofpoint-ORIG-GUID: RwsS33qUU5SMh5TmhicOGMjdcpYNU7Kf
X-Authority-Analysis: v=2.4 cv=YdmwJgRf c=1 sm=1 tr=0 ts=69667989 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=X-e67srwgh_QgMMAbO4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130140
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

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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

