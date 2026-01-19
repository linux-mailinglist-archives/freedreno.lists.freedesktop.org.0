Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1806CD3A11A
	for <lists+freedreno@lfdr.de>; Mon, 19 Jan 2026 09:14:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD0D310E395;
	Mon, 19 Jan 2026 08:14:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jYOUEt0B";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gD3oybRR";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E348B10E390
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 08:14:46 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60J7tD0C3449140
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 08:14:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /NThq6KSUJeukEL9pMouMMZw++r4/wpGPMWQ27LsLSs=; b=jYOUEt0BYWuVrhzB
 fHkc6UXZhpeuA8O4ZWwd+20yM34hs5Fkdm4bMxJ2yEYjxSBz3YnlXAne8dUIvXqw
 yfwT5NW79P0QJMmUv4NMzYJdVEvJSVZauBX3QhP3a0fkKO95Gla6t7v1D3rijGrq
 UkULtt66gjyfu2Yt1/3uG2RyVPoe0/adIDZ1RDQHQL9YFmkDlonEwxqzt6iaB8ZA
 NM7JZvid1SCVP/BIazkURbpdNAai35ofENsedKhOSP97U2CQy/djp2N6x7vQ/ZSH
 VbS+ZiZTmck25sjJW+U2/8mclwZ556KuEZmJfJKRsGgHkK0cNLP6e3Hr885b1t2D
 vxwXKQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br3q9c4sr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 08:14:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8c2a3a614b5so1005064085a.0
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 00:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768810485; x=1769415285;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/NThq6KSUJeukEL9pMouMMZw++r4/wpGPMWQ27LsLSs=;
 b=gD3oybRRWeG7jwL4QdDNuYXA4fFFmpBg4xfqCCM0wZPyCJBqul0GOCeoVMTJvHo1Cs
 7FCN+y96DRgz2OrFMbE55Tl4WU+kVKgZN/6xSQL67iBdpgb7urxYYIavIdRAbFBUe7i4
 yqaGfRlKn8ciiKST7IfuLPa0n7/2J3ZaKM0SEEZG2WmDCUFapGdeQy2I3YTMVRNAqmvJ
 ukgIjralgLA+VR/NKmZRFE3Qf/1Ps0uUNv/JL7td4uqByS/eBEEZeUnRMdaAb4WyWGWH
 vt0Q6XgPSivzxR58p2iJo8eCIDrbRnVsNAmdvMSUh3w5CFRjJkd5czPIi/wnjbFd9yet
 xgiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768810485; x=1769415285;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=/NThq6KSUJeukEL9pMouMMZw++r4/wpGPMWQ27LsLSs=;
 b=YusDh2xbWp64IfCvtD8LYki0NS373OlshcyqYQjCaD3A65YbCkcUFXVgEm4XLlrR7Z
 G5pYN8z01VQStE9ah+urJJpCNDhkICCfWkqlpA3mmA+qmBhXZrYAcY7H13b6Atrbs+4J
 50osWeDddogwjfrYAhztJJgA2n2/oFqTKgmEEpMoPYSjvE8ucMTfLNOmT/jSTBAWVk/F
 opk0TWMgqd8a0gG1Gdp/IQMH9AXRv+7EaZlJ6W3mJRE36i8k0a6oT9nhQPvRPK3L5u69
 Fj054P0TPNYzSFZwYmg+Tjf3/4L5xYp6HMoIqcVDb9m+Oakaky+5dsdT7Uwz1YpFd2E6
 E/wg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIfowO9O4J3Iy+Pu+MFtnqVLVmmyR2xMQ0qJiZ1qM2x5iur1cjP61arTGoqcwPztx+HrKREG04pl0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFHqV8nE++WLEhgZzFBByPmSrIA0mDyFbuJD/VSCVELGnKVEsy
 wJNtXd8qdYFObiFmmTTxcR9iX6iQIcIN1zX+rDPn89JJADXlmdNeaoxS2fe9yvYiZmc6nlAsYaZ
 1UjN2/lan7ifNs+JThBPV09QEQ5Ifovp+dRUNKFb8tW9XBaZ+r3PC05G121E5K6mVXBdm9lE=
X-Gm-Gg: AY/fxX4+8BxJBrUOeE5w5UbkGlEGoaUOxvmNifX2WFxQpQv9xrlXrLu163Nv3PASwXM
 m68wcPdDdbBp8H64DdY8yZiVbsWv+S7GhAdxGSfxoMYpkT6lIlvDBrMcj599oK8wc/vZqT3S7xV
 UgpOJd3KoU2FfpQ4PAl2BK+gXVgBb+A9QWboLpV/c9T5ZB8Pv6J3ZFs6yvr8s0jxNj5/IYDJffd
 1zurekyzpy2zw5fuFCQxHF9tV089nEuiBnesFqjoqJTyHNDbTNS/PZxX695eQ1x4xs9kcwwEG8M
 KCq62rX7EtSs3ZlJwrul3wk1O/uHUoVxBou2D8fsN3Wanoua4QTg28szDC6A/fyvhzFyALSR/op
 ASGce5hvSs7sZdQa6iP61Rf2eBnrFG3jBGkwfAalSP6ZN3fu0TPTVSjblIN6/7ttUMnFUYMyj7W
 pKi8kGImGerhhj14aBexNDhqs=
X-Received: by 2002:a05:620a:450b:b0:8c6:a587:377f with SMTP id
 af79cd13be357-8c6a58737e7mr1730834385a.36.1768810485418; 
 Mon, 19 Jan 2026 00:14:45 -0800 (PST)
X-Received: by 2002:a05:620a:450b:b0:8c6:a587:377f with SMTP id
 af79cd13be357-8c6a58737e7mr1730831685a.36.1768810484957; 
 Mon, 19 Jan 2026 00:14:44 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf34d572sm3063845e87.24.2026.01.19.00.14.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 00:14:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 10:14:39 +0200
Subject: [PATCH v2 3/4] drm/msm/dpu: program correct register for UBWC
 config on DPU 8.x+
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-msm-ubwc-fixes-v2-3-e0c8c630fdd3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2979;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=nlqM4pS5tehTmTBqQ+prrjj8JpfEcAuwIhsTGK973JQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpbefvWPciqvjeXggjI9TRGgYthCdanfv4U7egB
 9Iij4swhm+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaW3n7wAKCRCLPIo+Aiko
 1VJ1B/9YNyZABfqXcN2Uyf9qCt6ZDrbYTxPKKdlQWj1xVwUsjAVwyWSRdpOT+5ryjmRjqlf/kKt
 AG4lFvLBZALJSOitDQIAFXj3TjTKi26Mebk4IkVjAiYUYTxhwWwR0qWp/RxVgyP9V1A2luxImxr
 FUb1yNcGq22/w6TcmEFHp7bamENlqzo9jI7kzrPBoisVdY3a0bb6lL1bAT5MigvnAFck3ebnOpk
 SrG+az6YJ4ea9ovVfwpkWtT6Hdlnhqn9RTC9ahEuDEd65xTb6EY1ISBtle674JDXzQX8p93PCTB
 CTcqBHmL0nrmvIPtAwWDji43ZMCzExr1u1uzpwVbuKihq+dr
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA2NiBTYWx0ZWRfX0bqThz4/Mg0G
 +qpKPgDFWWuVuTQ/wwMrxoAgOEOuDyiRTrL/qUXp2VW4s7+UufZzUdxpzpc9LBVy7fJkogNT01P
 YEDidUSGJTh6MTFEHjJnxdBYBOA0inzVg3KFPS2PlONhdaPealkuT1j6pTZqpqwBulrZhrb+6iW
 gwrzd7WJX7Xwis0okRLykallKeXpWXWK/tehlHalZvJLevRCvNmoIgEp2+5DxinGMBYMjbyDeVC
 oMrIcqTKpwbp65zzMmteDu0EezRlsmUxyhPSyGDmaruTEg9Qo/6cix5f40wXJxikxUXD4iEE4vY
 IBciC27PPgvPK3+/Vpw2VyI4RFgXZYEi1jDQVKw4eG9lbEoQ5cqpDgXAfMRg3Dr9+1D7RGkuCjG
 gW5OOy5sAchoipwK1zUfy57g4t/t23GWTOiNbWfPj/eaO+1iyupoZk5GE0BBejUqF/BGwZenqCb
 /EiWBxz3d8h/isWnQkg==
X-Proofpoint-ORIG-GUID: zHtI_0VKWfCK8MBZbJZ9L5R-m8ersbvL
X-Proofpoint-GUID: zHtI_0VKWfCK8MBZbJZ9L5R-m8ersbvL
X-Authority-Analysis: v=2.4 cv=dPurWeZb c=1 sm=1 tr=0 ts=696de7f6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=7tap2HhiP8zdS8EL3YEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
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

