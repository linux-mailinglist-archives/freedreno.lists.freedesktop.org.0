Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B99D38CE7
	for <lists+freedreno@lfdr.de>; Sat, 17 Jan 2026 07:36:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B924310E251;
	Sat, 17 Jan 2026 06:36:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="T2gYMz8j";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bmq3YddN";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41B2A10E251
 for <freedreno@lists.freedesktop.org>; Sat, 17 Jan 2026 06:36:08 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60H2Beks3743275
 for <freedreno@lists.freedesktop.org>; Sat, 17 Jan 2026 06:36:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /NThq6KSUJeukEL9pMouMMZw++r4/wpGPMWQ27LsLSs=; b=T2gYMz8j2ONQNJ3o
 hWYBszQOTJd/zdTcGiIVqNeTY9BYcS8tQpzgJc8quajCh3nztuRGf51hcCQQMWYB
 dsmWdjOJjLCdIndAxduSTqHlQEj3KoDIKKuctKL03+Lmz+9cVtVyf7uvCw4lsTfW
 2lug7JVRp4opxaTQQEgddhUBX+NxuvHNvm5cRVrKZcgxfpanp2mC5l615suczTos
 His4Mtz+vt3dtsZ7vaJ+mSXhhUlRs1gomgLqBTYRe+uhqAEBR+pd7TEcMVrS6IMT
 HwsFYUFrS/3iYripUxZfzpcwYj6SEpyiZ4ffiqMnowPfEeHeYVGagtUG98ThGFJ6
 6rBn6g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br1e5gfjw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 17 Jan 2026 06:36:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c52f07fbd0so1177720985a.2
 for <freedreno@lists.freedesktop.org>; Fri, 16 Jan 2026 22:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768631767; x=1769236567;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/NThq6KSUJeukEL9pMouMMZw++r4/wpGPMWQ27LsLSs=;
 b=bmq3YddNhkZKqhwtYFER0EO9bvPLV0aR7G1YzKWFcFHhYsRlmYOC5kQtDlpW6fIEAJ
 q/3735NBN/V16sELEIQcxbz8d1NPxKLoh03R7PT/2GWes5CXt/nP0jHMIsIaliH7UDB0
 ctZH0KhljqEdFNWjxTR92VcIt/UDD5a2kCpjBCFXmU9T41EPIIk3ZhnObg/QZMcW9SNp
 VJoGKabzloC9zGf+JmMgarS558isT80Xu7/6DONEhvgKxvWJGhDW3YMmwzVbGiABnFCb
 473AeXiJvf6++QNInLNTY4xJYobAadhHj+WMPU5dlM7+6Zv+wKHDJDAkw6TussQ9ijv7
 wz5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768631767; x=1769236567;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=/NThq6KSUJeukEL9pMouMMZw++r4/wpGPMWQ27LsLSs=;
 b=Lm2+DkERlYWQKSmHa6AXuobOEHugyfOPeDnOkQOVqeeyzDPR5Fcaf0kD8cYhxw0hZS
 ZkKGP8r7IPNtDit/wEzZi2PuUMcLLZpfIfW5EeJI4rl4z7kVQdUdHgS1WbOgOvF4xzV2
 SzkRRLHskoSyGh6jtavOp604TF20RZB8l+5Nl2fck8yPHrCpO4U9Oxzyg6X2c7715O07
 XrrrmNy7FvnggqL9CW0BT6GLV2mEXuPkeY1hacGPghI5jRSy2a9SZTbCggOdJ8lLDUeh
 1qQg/h3BDVqeB5LQw+SwWT3tQYg6d6pMw6kLLe/P7uf54bTheqQY0arXAnMFPDkY5Hxg
 7N+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVW9l8LDSTK/O1inQuhwIKB1r225bFROLJa6uSU7ZFNqeWGjf6kZ8TNvEM+5vl2QN3atMQoO7sMowI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzIyj7c5HzxNscZQqFMGb9XvbaOMuLc6R+bAQsJgDLa7Iy0jCEb
 rsZ3anmOrWTyURBTTyNtrjQFdXuY2dNAPN6vtd1YLGqSa6tzNRojKaVH7DBko9GWaU23fNdkYDk
 ylkzHozAp5UBsaXDdUwQEihhOyr1A50NnzeobTeYPW/3elSEyzd/lizuuL+eXE9wxoLcHkUk=
X-Gm-Gg: AY/fxX4UGAhfrUhELJWoleyWdJfKS3/Szv+R1ZZvDtz12IPHJ2qQHsBcLOB81OfgigD
 GwZvB11zLS0lBjlTBTp/uQSGQAHQWVOEb1XKHpbZSTDodfYMTyia35mxIcThcvO3G3LNkVd9OuO
 W1PHMLTqzF81mnjsK5NLQOghVL4PbEUqhNmCnEIG6dgcHShEefrmpIcerqqTf6F3sJ0qbMPGRlm
 Or8pGC8qJWvURp7OnACg9fk7Lkc7JZaS/NQ1LrYKOKl9gLTCfTOkDGHqjk3zab98NhFFw5yR/Ue
 maFGhmYe5v+t8xspO5wRN3tK0AzA4vtpq8tcvgKjguKc/9Z0T3OtaHS4kqE5eQd4J5lmxv3CMZL
 N/5s2/nIi7Oyx0FeCzKXNGgII0j4iujIYFHrS40JR1IpFrrgwO4u95grX/x3PcoJo1vjRH7c8Qc
 KwcxM+iAWZHbOHvykW/ec9Yuw=
X-Received: by 2002:a05:620a:178d:b0:8c6:a67e:61bf with SMTP id
 af79cd13be357-8c6a68febfemr761758785a.35.1768631766667; 
 Fri, 16 Jan 2026 22:36:06 -0800 (PST)
X-Received: by 2002:a05:620a:178d:b0:8c6:a67e:61bf with SMTP id
 af79cd13be357-8c6a68febfemr761755485a.35.1768631765900; 
 Fri, 16 Jan 2026 22:36:05 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38384e790fdsm14049851fa.23.2026.01.16.22.36.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jan 2026 22:36:05 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 17 Jan 2026 08:35:56 +0200
Subject: [PATCH 3/4] drm/msm/dpu: program correct register for UBWC config
 on DPU 8.x+
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260117-msm-ubwc-fixes-v1-3-d5c65ea552c7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2979;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=nlqM4pS5tehTmTBqQ+prrjj8JpfEcAuwIhsTGK973JQ=;
 b=kA0DAAoBizyKPgIpKNUByyZiAGlrLcuiL8MkgPFSm3o4qmPlZP11oUebtpgD/SJwLhgu7To09
 YkBMwQAAQoAHRYhBExwhJVcsmNW8LiVf4s8ij4CKSjVBQJpay3LAAoJEIs8ij4CKSjVQw4IAInW
 3Ud8Kly5piacDGSG67f1XD8kBrTVNYzH+daL0OOoid1NYcYu+6e04YS1FRmgxV9A4EMbieuVUiJ
 5JTH55BdEJNXMZCNGe6+hk/brfvRNlpgP2YiM2Xda6EFSBqxHPQj6Bgs9FjphEdFveUDbAAf8HO
 lDXWEnWNQX48uXCcghWrquoJfmfNNyVDu8h9H3wZcfFiTpYMyerxioJDhkYc+DMAaa4pXp8vyWC
 A+NcwUIrQFBaQyBvebJrJ0fP27Bum4GSHFf+c7iwbMU/0mXF0cBaOrdiu7Mo4KZTlWKOGjGZptO
 LibpxAowXKlxsSSbSIwY8e5G7cxM1YMFJDuD9Ys=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE3MDA1MSBTYWx0ZWRfXy2xn+NuPiOyr
 H6ReSkCqqVyU/+xxb2C1XtqR8+9ZsZYNPGL9iVj5lOskfRacgRhj7EnYcbTKEjRu4ddUXShTkZ1
 j1OE/Q5twbj3PKNZoBzWtRtLIYLhTe3DAtAehZm23G21YKwbXM5HFQzCiNuR0HK10bDIChdxkR6
 DYRR1i2FRcUeEVvm6hDnH6U87GaCHYSnRBArjOKp39SiF/LQOd3RvuIHTMtx7+lY3qmCY6Aab/j
 n/+2eNq59xevbPQ0fG9KN26SPfFio5y3YVKCGQYnVs2vxqtj8BG1F8iFBGpX65hY02IeQu9lKv4
 N9VWHHcJvX2DCutHRJSb82UqJTc0XvekQ4aJk/RnhVdvu6xqFRXmETXx65NR9ykIxNSV55tgNR6
 uB5C4+IiWs3cOqRyp6joRYHOz8T9eTRrxsm20pjK4Dm++sfq5fHsvn3wV2q0MnNkVW+1zw/pmOS
 nIy8ZLmBva/cd8ukC7A==
X-Proofpoint-GUID: _mkWdbNThDAF-WsEl6WOOFfKHoCz41ds
X-Authority-Analysis: v=2.4 cv=U5yfzOru c=1 sm=1 tr=0 ts=696b2dd7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=7tap2HhiP8zdS8EL3YEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: _mkWdbNThDAF-WsEl6WOOFfKHoCz41ds
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_09,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601170051
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

Since DPU 8.0 there is a separate register for the second rectangle,
which needs to be programmed with the UBWC config if multirect is being
used. Write pipe's UBWC configuration to the correct register.

Fixes: 100d7ef6995d ("drm/msm/dpu: add support for SM8450")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index b66c4cb5760c..a99e33230514 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -72,6 +72,7 @@
 #define SSPP_EXCL_REC_XY_REC1              0x188
 #define SSPP_EXCL_REC_SIZE                 0x1B4
 #define SSPP_EXCL_REC_XY                   0x1B8
+#define SSPP_UBWC_STATIC_CTRL_REC1         0x1c0
 #define SSPP_CLK_CTRL                      0x330
 
 /* SSPP_SRC_OP_MODE & OP_MODE_REC1 */
@@ -215,7 +216,7 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 	u32 chroma_samp, unpack, src_format;
 	u32 opmode = 0;
 	u32 fast_clear = 0;
-	u32 op_mode_off, unpack_pat_off, format_off;
+	u32 op_mode_off, unpack_pat_off, format_off, ubwc_static_ctrl_off;
 
 	if (!ctx || !fmt)
 		return;
@@ -225,10 +226,17 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 		op_mode_off = SSPP_SRC_OP_MODE;
 		unpack_pat_off = SSPP_SRC_UNPACK_PATTERN;
 		format_off = SSPP_SRC_FORMAT;
+		ubwc_static_ctrl_off = SSPP_UBWC_STATIC_CTRL;
 	} else {
 		op_mode_off = SSPP_SRC_OP_MODE_REC1;
 		unpack_pat_off = SSPP_SRC_UNPACK_PATTERN_REC1;
 		format_off = SSPP_SRC_FORMAT_REC1;
+
+		/* reg wasn't present before DPU 8.0 */
+		if (ctx->mdss_ver->core_major_ver >= 8)
+			ubwc_static_ctrl_off = SSPP_UBWC_STATIC_CTRL_REC1;
+		else
+			ubwc_static_ctrl_off = SSPP_UBWC_STATIC_CTRL;
 	}
 
 	c = &ctx->hw;
@@ -281,24 +289,24 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 		switch (ctx->ubwc->ubwc_enc_version) {
 		case UBWC_1_0:
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
-			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
+			DPU_REG_WRITE(c, ubwc_static_ctrl_off,
 					fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
 					BIT(8) |
 					(hbb << 4));
 			break;
 		case UBWC_2_0:
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
-			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
+			DPU_REG_WRITE(c, ubwc_static_ctrl_off,
 					fast_clear | (ctx->ubwc->ubwc_swizzle) |
 					(hbb << 4));
 			break;
 		case UBWC_3_0:
-			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
+			DPU_REG_WRITE(c, ubwc_static_ctrl_off,
 					BIT(30) | (ctx->ubwc->ubwc_swizzle) |
 					(hbb << 4));
 			break;
 		case UBWC_4_0:
-			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
+			DPU_REG_WRITE(c, ubwc_static_ctrl_off,
 					MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30));
 			break;
 		}

-- 
2.47.3

