Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA4ED38CEA
	for <lists+freedreno@lfdr.de>; Sat, 17 Jan 2026 07:36:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8B5F10E299;
	Sat, 17 Jan 2026 06:36:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="alhhBRdd";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dbYerD8y";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D801010E295
 for <freedreno@lists.freedesktop.org>; Sat, 17 Jan 2026 06:36:11 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60H3PuiH3464972
 for <freedreno@lists.freedesktop.org>; Sat, 17 Jan 2026 06:36:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kDDelXBrEvb7s+N6wl54GgAwBWnoeXlC1C+qi++VsB8=; b=alhhBRddnYNXM3H2
 I2oLrclleXsei9fX4OGMXnR4JmGbg384oxIViAxFkdDy6TyQ7qjw5l1/1cxRCpZM
 DaigZhb1fVngZR5NutWaHgXrn2f69DH9gOLWh94Iwv5I0rofqf/QE9o7h7Pzwr9f
 yMp3HUCD5AiS1DPvyfuNLHD7sq981zQsFVT12ZlQuIIVf2yFtBy/okQxGeBFPA0n
 sqvdDb4rzhfN8Fr5tjU1x9/e+9W4wx327YN+uUhd3cGzkVo3ntZELPIWQohZu7vW
 BX863w6gmgkHDpG/LUZtG6dnCbEqNSDDpaaLlwwYCnd+Kn4iWVlEHVIfZkWByzhd
 P/+Ttg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br2gugatn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 17 Jan 2026 06:36:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c6a2ef071dso755442085a.0
 for <freedreno@lists.freedesktop.org>; Fri, 16 Jan 2026 22:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768631770; x=1769236570;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=kDDelXBrEvb7s+N6wl54GgAwBWnoeXlC1C+qi++VsB8=;
 b=dbYerD8yNtfqSbNnnZEl9o5dNuzRRZwuQagMkQVfcMyGXv8Ttv/hOPdUtQQYrDGLpO
 PYsKcrioFpFJ3oylB85zyb/CDwKJ/k9f50/8lYrYlvenF9XTy7UcVjCTj3DvFHaxErvH
 qWdQ25Mv+m28MCCOmj9uBJOtjbn9Ghn6CtQRH5Gu5m3MLjAb/uhjQIOtEgv2B+914rhC
 ViH8wnc/G5zhcKv9U1fnCfhshENwuPIRyAj/lTuY3PR2gZnLdVHp3rExvPIumRgBzH9y
 syK2x/Ym3L/Dk8JtbSmpiX6X0McbaieAiPsdSWfGCoiRglaRJu5JgycpanTCMKDV90SA
 YF3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768631770; x=1769236570;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=kDDelXBrEvb7s+N6wl54GgAwBWnoeXlC1C+qi++VsB8=;
 b=rvE8tSDExgwQKDMKUfG5Vh8UiICMHZ6vdxL04OZU//N460ws2dX6x8Ymg3Eze3WvHJ
 yezn/6eoyi8oOHsiGs+Hexlex3EEfe5RN4m6wPwbcYPw89iHCM9lBVKAjU3SZqjuy5hq
 8xnP+Yo9+BBluyOH6OOQlKI/sAHXxqslwVLIBoAWKSRcht1ePv6VXnZii0J2T2p/cmld
 1fGzxggbgvbck4Gq6hRuhC9qH1L5mWF7OYWkmlOXz33oLpmlSOgYzi0bOO9Y+fuNy5VU
 I7sAJvcqksi5KplLsz4EQc5L69s0I7flQmZYUVcoKVa2lOayFVWAufPAnUmmV/5h/U8g
 UyDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTwxdHa/j8A1Mmjf957TolcYOlWrlAuAhBLJ5nLWrXS0eJTFRNlTQ1/LfuaRTcuJ56ugcNKBoyf5g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzrLtxSkxqSvP369W08Haqxvv7asDaLwZi/rPhyCGFtildogYid
 Y0bT6YatgXWSLAky1cPKILkhNsS+kdYGT0A6D06JztwBBIbRSMcKGpWLhIWzDruS2viTyvVZLr2
 pZcOxP0VZWU/RSebUCDdv/N1pOEn0yzK6vpjIAGhgdO9tkqmR5coFpp4zVUBHmey0gL5qNa4=
X-Gm-Gg: AY/fxX6PtoWvrbzKUIecgunT1od0ydaOYD31cees4jzwqhiCAcDealsng5VsOChAC9c
 /qA94vCs+jXbHN/pNvNQcBtj51aF2gWcFSE8PXOZ5kOB6r28x3Am3iFYo3+s02kjRTPKFzyaBQU
 I0e+E4irtHzrq7G7w9VVxXrxoJFkz1tvbwdZyTomlKkbr5udxTQkzYAaQyDovlGRv1IQHALp65A
 PGyWiuxk6xOcmIszBa3nsxb702iUPIF2VP6x1sv67l6okiHH4qNLFsbZgB8JipeK1oNYDsohjKv
 wbWVwseFUnyc60B06Q+BdxT4d8YiZaG18JIxXtdcxeG56/D/Kvy2ln7TGS/s7mmL03/phXp32Jl
 4zwyiu5T2Z/avPSs2S0a43IyeIbkV7oksqxeSHq93Vbrl+PkslmIf41fup8dG75gOoBDARCvLSf
 t6z+ddH9q8tmnAaI/bZa4P+sk=
X-Received: by 2002:a05:620a:199d:b0:8b0:f04c:9f0f with SMTP id
 af79cd13be357-8c6a69633c0mr674357685a.63.1768631770254; 
 Fri, 16 Jan 2026 22:36:10 -0800 (PST)
X-Received: by 2002:a05:620a:199d:b0:8b0:f04c:9f0f with SMTP id
 af79cd13be357-8c6a69633c0mr674356085a.63.1768631769829; 
 Fri, 16 Jan 2026 22:36:09 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38384e790fdsm14049851fa.23.2026.01.16.22.36.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jan 2026 22:36:07 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 17 Jan 2026 08:35:57 +0200
Subject: [PATCH 4/4] drm/msm/dpu: fix SSPP_UBWC_STATIC_CTRL programming on
 UBWC 5.x+
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260117-msm-ubwc-fixes-v1-4-d5c65ea552c7@oss.qualcomm.com>
References: <20260117-msm-ubwc-fixes-v1-0-d5c65ea552c7@oss.qualcomm.com>
In-Reply-To: <20260117-msm-ubwc-fixes-v1-0-d5c65ea552c7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2678;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Nivgddh/dUUg9vaUGrpQO4Ar4VNMexa7P2jWIqnrNXA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpay3M9+mHB6GMiAL1TbuPcebrQTrgtuwmLGi4D
 GiKsoP1qW6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWstzAAKCRCLPIo+Aiko
 1TMgB/4jx9mONQw02I/OWAPUriWFeBex6wD887DlDc6s0+G9WkEZkdTH9Wu+/UBsAcvhtSvJpzG
 /90E5DUuS0HbdWP6sO9qw1nn8idesZSermRuXFGbHUpdzQ6u9kDt3bM9yliVOW0Jy3yyAgqk6v9
 veL16e6sq5TuoT1fLiAKNkr7qbdvK+bFjAkaw4RGCHkcAeXDWnkG+ioFavRYRTSD7pIn2XcaiFb
 jpupZkvbREab3jYC1aByrUt5V+yGDQaMFlWhXRh/uzFkK7oAl3wbQF5y718Ces3iB72USL3S9Av
 KELU4umFJl1Xp9wBdcAvJ82rn5z5wAsOC14IjbJRHjnz5z75
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE3MDA1MiBTYWx0ZWRfX4TZh53YUichq
 5o5E/XXAjDDUKexKYyPXa5HF2JKZ3SNAUJE1v1u/bCJtQ052fFM8m36CkK/jleMO5Va5M2E/4pR
 5LwTjdRo1+V90RBEcro52Sgz1E29V9dSq7m7GMLyt2syX2acXWq1wLH925hLJ+7qRUooPKWk/vh
 r1kWgab1WxexJHaHxkDWhbSfAg27O+RPVsAWb5gg+l8AKYF3Tejt5bcffYg7/EE0d+h79j5/z7B
 VDkJCbqQrDS7qTmMfPpmV1vdvPYhP6FfQ3o0MPJ/CejexwTBKNTIJdfpvUb1DlKqGuAg7JSe+za
 cPQkwiaZzLuFuwFHSAU1pZmtWrl1M5Gmuk6/4XwtJ/6p1gSc6g1DZmyN9KmVacH40vFNJtasLjY
 ZqTIjivqm/dMRXABEOlMIr60F8jAkTpTFTzfEFVmHP/ArFYZnueVBcqU/+EQ02QF+Q8uQyF7WBB
 Gp7oFsUwEb0Tv81n2eQ==
X-Authority-Analysis: v=2.4 cv=Sev6t/Ru c=1 sm=1 tr=0 ts=696b2dda cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=7FpWx5GjbivZIX0HvvoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: An4CghfacEBMSWt_SpUF8TTvLVujZ5sB
X-Proofpoint-ORIG-GUID: An4CghfacEBMSWt_SpUF8TTvLVujZ5sB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_09,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601170052
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

Code in dpu_hw_sspp_setup_format() doesn't handle UBWC versions bigger
than 4.0. Replace switch-case with if-else checks, making sure that the
register is initialized on UBWC 5.x (and later) hosts.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 41 ++++++++++++++---------------
 1 file changed, 20 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index a99e33230514..b0c97f5e47ea 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -279,6 +279,7 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 
 	if (fmt->fetch_mode != MDP_FETCH_LINEAR) {
 		u32 hbb = ctx->ubwc->highest_bank_bit - 13;
+		u32 ctrl_val;
 
 		if (MSM_FORMAT_IS_UBWC(fmt))
 			opmode |= MDSS_MDP_OP_BWC_EN;
@@ -286,30 +287,28 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 		DPU_REG_WRITE(c, SSPP_FETCH_CONFIG,
 			DPU_FETCH_CONFIG_RESET_VALUE |
 			hbb << 18);
-		switch (ctx->ubwc->ubwc_enc_version) {
-		case UBWC_1_0:
+
+		if (ctx->ubwc->ubwc_enc_version == UBWC_1_0) {
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
-			DPU_REG_WRITE(c, ubwc_static_ctrl_off,
-					fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
-					BIT(8) |
-					(hbb << 4));
-			break;
-		case UBWC_2_0:
+			ctrl_val = fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
+				BIT(8) | (hbb << 4);
+		} else if (ctx->ubwc->ubwc_enc_version == UBWC_2_0) {
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
-			DPU_REG_WRITE(c, ubwc_static_ctrl_off,
-					fast_clear | (ctx->ubwc->ubwc_swizzle) |
-					(hbb << 4));
-			break;
-		case UBWC_3_0:
-			DPU_REG_WRITE(c, ubwc_static_ctrl_off,
-					BIT(30) | (ctx->ubwc->ubwc_swizzle) |
-					(hbb << 4));
-			break;
-		case UBWC_4_0:
-			DPU_REG_WRITE(c, ubwc_static_ctrl_off,
-					MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30));
-			break;
+			ctrl_val = fast_clear | ctx->ubwc->ubwc_swizzle | (hbb << 4);
+		} else if (ctx->ubwc->ubwc_enc_version == UBWC_3_0) {
+			ctrl_val = BIT(30) | (ctx->ubwc->ubwc_swizzle) | (hbb << 4);
+		} else if (ctx->ubwc->ubwc_enc_version == UBWC_4_0) {
+			ctrl_val = MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30);
+		} else { /* UBWC 5.0+ */
+			if (MSM_FORMAT_IS_YUV(fmt))
+				ctrl_val = 0;
+			else if (MSM_FORMAT_IS_DX(fmt)) /* or FP16, but it's unsupported */
+				ctrl_val = BIT(30);
+			else
+				ctrl_val = BIT(30) | BIT(31);
 		}
+
+		DPU_REG_WRITE(c, ubwc_static_ctrl_off, ctrl_val);
 	}
 
 	opmode |= MDSS_MDP_OP_PE_OVERRIDE;

-- 
2.47.3

