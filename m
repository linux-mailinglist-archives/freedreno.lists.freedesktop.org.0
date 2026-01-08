Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1D8D01B2B
	for <lists+freedreno@lfdr.de>; Thu, 08 Jan 2026 09:58:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3632510E6BA;
	Thu,  8 Jan 2026 08:58:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="T3c2MTur";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LgUrlDL/";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C5F110E6BB
 for <freedreno@lists.freedesktop.org>; Thu,  8 Jan 2026 08:58:43 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6087VbVI1838799
 for <freedreno@lists.freedesktop.org>; Thu, 8 Jan 2026 08:58:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=spUvP9KtaKx
 puV9gvU3CBlEkc10n78zM/UgyhPno/GY=; b=T3c2MTurXhuBHk2gXAbpOXsTxac
 pELoWfDyoGXs9qi9S+rXeDic0kLxWJSYHSSoApGP6qqeNMt2pbsvtEE9UyNAm12U
 I+p6Hzwt9yq0m+Zf+FDIjM4ErlO8kGRbWjYPVpn+FdPFzh5cX8JQwBJ4Nja/pPL/
 860ab/IWS46VI18ILOzj+/Tn7Heakb6M+o69T+DbGjcZgkn08ZelX6YcIFHPlf8y
 cCDZv5Bdn2mR+ZTwedglm0j991O9+N6XyFt4eZFCtp2tocsKOQ+pI0eiNhwAio8V
 0fk9/32FN/UYVA3M9f7rFfeIKJRnEF39BwBSw6u2fhL1VufFuPzBcbKStJg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj8920825-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 08 Jan 2026 08:58:42 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ee1b7293e7so108010271cf.0
 for <freedreno@lists.freedesktop.org>; Thu, 08 Jan 2026 00:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767862721; x=1768467521;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=spUvP9KtaKxpuV9gvU3CBlEkc10n78zM/UgyhPno/GY=;
 b=LgUrlDL/wh4mmtUMZyKQyDSrHOKH4Bc6D7rHFznH0j9xztbNUIhnaEx8y/6nocRqVS
 cSS1n4IoKm6imPHfU45jNww/F+8i7sZCqA9MtiGu/esrAd00p5j9KzH0AwPmZTFvVF0l
 3gpXguCvOuKS5nwmj3LzE8y5P/KMI8VXhhbbSKZp39T5iMaFN1D8C4fX1UPzCO5/rdT+
 UIeLG4UJ2sor3HuqaUU2SLp2Y35x6bKQKodXQZx7lEruDtiggAI7x+EhDnI+D7Cg+4xU
 ImIyXkRlsGnj2nyF1h6pmKhmx+r1PyKeGUkqGO0EevwSLcdR11YHaeCI0JDGY4gxLI02
 pZ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767862721; x=1768467521;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=spUvP9KtaKxpuV9gvU3CBlEkc10n78zM/UgyhPno/GY=;
 b=LUXM3bU4ZOIkbcaRGx0ThedRoyNCxgR3YObMO/Ze6m63dJRC0LGbx+Xb68BS7HU5Ps
 O3LK8E2onyPDUuIg/ZEWtLn+hyIW4KLyZ9+N8BJOPT+bys/R4ZYA9T0+ZXGqAiL3jf41
 LJwh8nmw6exVkASc5W1soJe8kl9n2GVabS2BriKJ8AghpsRgfkd6fWq+5CkrE+hJR369
 FCSR7wT3a/I227VM5OYKY2T7l/NL33XttTjbBXo88qn6k6IkSR3I3YgeuFxhswy3apHn
 1pX9s09Qf0EIrmsThpKmnTL5QOtwmHTDKsUNY208vpFZTji04s2uOHqRBsGVD8k2++jN
 4lfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCT1jGqWhF+SrrCDODYLrWhO6azkHHs2kaU5jHe1o4VcWGfehfw5g/xhCAb0V8M/KaGn4lIbxjglE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJLCNvMCrlXuvmNKVl/0+z0AUNtcwx0W/j5755vWjZK99Ta38C
 aO+qABJhU1qRiP313e1PetymkXhgDdTJlvAlpXdHcRcFri4K/e4c1U4Smcgb6GZRLLneNnFllUr
 UuKBMWOO0u/0y25a/ZB2W1YF5DjJoO/A3uOta2+K8CquxPLw2D3w3vi3r4hl7XPrazm00ilM=
X-Gm-Gg: AY/fxX6tWXs1FpvJnJLdYlaECa9ujTFnR7gxZGx41FFN1QSyyXYmHF3QNr1tNqTqrWQ
 jXEO7vbKRjobpAAVcXOoI2V404AkE7K0bNapBToDmgT2IxzjgRkmQrEWBQKsXWGVPas1DPvnvb0
 CmhmmYoHsmqon/LF4Pqkx8HXPmFeurK5UFjEbo5hnWn164wfTETK8B0d6kxavp5Xvv7J741Roo2
 vSHP45pNumwyJCH5L0NNYMIg6G9xYyfuUoHMrE3oZ2VA/9/ilB1mv57RGwaCoh+C71TKRpLbZxe
 esOeDknPkVIVv56eQG9aXKmMofbrGp7166JgpICSLNl3el6UQ3lOzyrMLmgG7EmbDQ6XICNeFeU
 kxrCn0fCHnyiyLeVddSs5CfeipSwCfag7mn2Dt/sq/Bg9T9Zn+BlmiJn2FMX7Nn4Z1l8=
X-Received: by 2002:ac8:7d48:0:b0:4ff:9737:dd15 with SMTP id
 d75a77b69052e-4ffb49c6156mr78381691cf.60.1767862721547; 
 Thu, 08 Jan 2026 00:58:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE1h1UJUlyhZhZrTCku8ARy7se2OJDfzNtUl4xt73QUuwB1CAZY5wgP1b32MtfmrHfoqHfFJw==
X-Received: by 2002:ac8:7d48:0:b0:4ff:9737:dd15 with SMTP id
 d75a77b69052e-4ffb49c6156mr78381471cf.60.1767862721073; 
 Thu, 08 Jan 2026 00:58:41 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-890770cc7eesm49680326d6.2.2026.01.08.00.58.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 00:58:40 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, neil.armstrong@linaro.org,
 konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: [PATCH v5 09/12] drm/msm/dpu: Refactor SSPP to compatible DPU 13.0.0
Date: Thu,  8 Jan 2026 16:56:56 +0800
Message-Id: <20260108085659.790-10-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
References: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=M45A6iws c=1 sm=1 tr=0 ts=695f71c2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Qg1eW3vjq6ATntrd7kwA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: nPCKAzcMCvaNCv2qWSmkQxSkRJpYDdak
X-Proofpoint-GUID: nPCKAzcMCvaNCv2qWSmkQxSkRJpYDdak
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA1OSBTYWx0ZWRfX8Kv6OJtfI+jA
 V9hu/DtI1u9t7y3CaRe0g2Xr95pNuTX/TXxBirYyf4hzVt2VP8ITaRPI0tFDG9FQ6fY/OvKyUOV
 4vnAUKWqaBtHOtmzYXfOOhSBfYVATa+t4lEuzC0IV4iw8LbVU/dF8fiWgUmHnzjzGqr8/a0zksE
 +dssr6Rfpsltx1cPH6aRXXmgYIImN2AA2+XNGRcEdeWt+nz0Vi4vc0HkuyNApCKx1ky74ZdO8BL
 KMICSjfOtkagZy81k++89cHnG3wQ8wAHNdcnJmUaF83wz0eAfihaKJcRrdkOxUrVkIR/3R1YwIh
 xS2FGB2bTHoMAi2k3EzfRXgVP9bUmJRKWztAT7vwstux7RZjv8IRQuU+DUg3Xb9GpXd7pt4tAVg
 rg3ZEj34CJfVu+3w/J9vZvrc+Xgz1TbqGOooMd/KUEcozIigXAGp33CV3+XZvLF3sSk1E9tGW5X
 mIyHIqPH3KmKyOwJQDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_01,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080059
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

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

DPU version 13.0.0 introduces structural changes including
register additions, removals, and relocations.

Refactor SSPP-related code to be compatible with DPU 13.0.0
modifications.

Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 110 ++++++++++++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  52 +++++++++
 2 files changed, 116 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 6f1fc790ad6d..197a2c584c73 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -145,11 +145,18 @@
 static void dpu_hw_sspp_setup_multirect(struct dpu_sw_pipe *pipe)
 {
 	struct dpu_hw_sspp *ctx = pipe->sspp;
-	u32 mode_mask;
 
 	if (!ctx)
 		return;
 
+	dpu_hw_setup_multirect_impl(pipe, ctx, SSPP_MULTIRECT_OPMODE);
+}
+
+void dpu_hw_setup_multirect_impl(struct dpu_sw_pipe *pipe,
+				 struct dpu_hw_sspp *ctx, u32 op_mode_off)
+{
+	u32 mode_mask;
+
 	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO) {
 		/**
 		 * if rect index is RECT_SOLO, we cannot expect a
@@ -158,7 +165,7 @@ static void dpu_hw_sspp_setup_multirect(struct dpu_sw_pipe *pipe)
 		 */
 		mode_mask = 0;
 	} else {
-		mode_mask = DPU_REG_READ(&ctx->hw, SSPP_MULTIRECT_OPMODE);
+		mode_mask = DPU_REG_READ(&ctx->hw, op_mode_off);
 		mode_mask |= pipe->multirect_index;
 		if (pipe->multirect_mode == DPU_SSPP_MULTIRECT_TIME_MX)
 			mode_mask |= BIT(2);
@@ -166,10 +173,10 @@ static void dpu_hw_sspp_setup_multirect(struct dpu_sw_pipe *pipe)
 			mode_mask &= ~BIT(2);
 	}
 
-	DPU_REG_WRITE(&ctx->hw, SSPP_MULTIRECT_OPMODE, mode_mask);
+	DPU_REG_WRITE(&ctx->hw, op_mode_off, mode_mask);
 }
 
-static void _sspp_setup_opmode(struct dpu_hw_sspp *ctx,
+void dpu_hw_sspp_setup_opmode(struct dpu_hw_sspp *ctx,
 		u32 mask, u8 en)
 {
 	const struct dpu_sspp_sub_blks *sblk = ctx->cap->sblk;
@@ -189,7 +196,7 @@ static void _sspp_setup_opmode(struct dpu_hw_sspp *ctx,
 	DPU_REG_WRITE(&ctx->hw, sblk->scaler_blk.base + SSPP_VIG_OP_MODE, opmode);
 }
 
-static void _sspp_setup_csc10_opmode(struct dpu_hw_sspp *ctx,
+void dpu_hw_sspp_setup_csc10_opmode(struct dpu_hw_sspp *ctx,
 		u32 mask, u8 en)
 {
 	const struct dpu_sspp_sub_blks *sblk = ctx->cap->sblk;
@@ -211,10 +218,6 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 		const struct msm_format *fmt, u32 flags)
 {
 	struct dpu_hw_sspp *ctx = pipe->sspp;
-	struct dpu_hw_blk_reg_map *c;
-	u32 chroma_samp, unpack, src_format;
-	u32 opmode = 0;
-	u32 fast_clear = 0;
 	u32 op_mode_off, unpack_pat_off, format_off;
 
 	if (!ctx || !fmt)
@@ -231,6 +234,21 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 		format_off = SSPP_SRC_FORMAT_REC1;
 	}
 
+	dpu_hw_setup_format_impl(pipe, fmt, flags, ctx, op_mode_off,
+				 unpack_pat_off, format_off,
+				 SSPP_UBWC_STATIC_CTRL, SSPP_UBWC_ERROR_STATUS);
+}
+
+void dpu_hw_setup_format_impl(struct dpu_sw_pipe *pipe, const struct msm_format *fmt,
+			      u32 flags, struct dpu_hw_sspp *ctx, u32 op_mode_off,
+			      u32 unpack_pat_off, u32 format_off, u32 ubwc_ctrl_off,
+			      u32 ubwc_err_off)
+{
+	struct dpu_hw_blk_reg_map *c;
+	u32 chroma_samp, unpack, src_format;
+	u32 opmode;
+	u32 fast_clear;
+
 	c = &ctx->hw;
 	opmode = DPU_REG_READ(c, op_mode_off);
 	opmode &= ~(MDSS_MDP_OP_FLIP_LR | MDSS_MDP_OP_FLIP_UD |
@@ -279,24 +297,24 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 		switch (ctx->ubwc->ubwc_enc_version) {
 		case UBWC_1_0:
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
-			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
+			DPU_REG_WRITE(c, ubwc_ctrl_off,
 					fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
 					BIT(8) |
 					(ctx->ubwc->highest_bank_bit << 4));
 			break;
 		case UBWC_2_0:
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
-			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
+			DPU_REG_WRITE(c, ubwc_ctrl_off,
 					fast_clear | (ctx->ubwc->ubwc_swizzle) |
 					(ctx->ubwc->highest_bank_bit << 4));
 			break;
 		case UBWC_3_0:
-			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
+			DPU_REG_WRITE(c, ubwc_ctrl_off,
 					BIT(30) | (ctx->ubwc->ubwc_swizzle) |
 					(ctx->ubwc->highest_bank_bit << 4));
 			break;
 		case UBWC_4_0:
-			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
+			DPU_REG_WRITE(c, ubwc_ctrl_off,
 					MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30));
 			break;
 		}
@@ -313,10 +331,10 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 
 	/* update scaler opmode, if appropriate */
 	if (test_bit(DPU_SSPP_CSC, &ctx->cap->features))
-		_sspp_setup_opmode(ctx, VIG_OP_CSC_EN | VIG_OP_CSC_SRC_DATAFMT,
+		dpu_hw_sspp_setup_opmode(ctx, VIG_OP_CSC_EN | VIG_OP_CSC_SRC_DATAFMT,
 			MSM_FORMAT_IS_YUV(fmt));
 	else if (test_bit(DPU_SSPP_CSC_10BIT, &ctx->cap->features))
-		_sspp_setup_csc10_opmode(ctx,
+		dpu_hw_sspp_setup_csc10_opmode(ctx,
 			VIG_CSC_10_EN | VIG_CSC_10_SRC_DATAFMT,
 			MSM_FORMAT_IS_YUV(fmt));
 
@@ -325,7 +343,7 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 	DPU_REG_WRITE(c, op_mode_off, opmode);
 
 	/* clear previous UBWC error */
-	DPU_REG_WRITE(c, SSPP_UBWC_ERROR_STATUS, BIT(31));
+	DPU_REG_WRITE(c, ubwc_err_off, BIT(31));
 }
 
 static void dpu_hw_sspp_setup_pe_config(struct dpu_hw_sspp *ctx,
@@ -385,7 +403,7 @@ static void dpu_hw_sspp_setup_pe_config(struct dpu_hw_sspp *ctx,
 			tot_req_pixels[3]);
 }
 
-static void _dpu_hw_sspp_setup_scaler3(struct dpu_hw_sspp *ctx,
+void dpu_hw_sspp_setup_scaler3(struct dpu_hw_sspp *ctx,
 		struct dpu_hw_scaler3_cfg *scaler3_cfg,
 		const struct msm_format *format)
 {
@@ -405,15 +423,11 @@ static void dpu_hw_sspp_setup_rects(struct dpu_sw_pipe *pipe,
 		struct dpu_sw_pipe_cfg *cfg)
 {
 	struct dpu_hw_sspp *ctx = pipe->sspp;
-	struct dpu_hw_blk_reg_map *c;
-	u32 src_size, src_xy, dst_size, dst_xy;
 	u32 src_size_off, src_xy_off, out_size_off, out_xy_off;
 
 	if (!ctx || !cfg)
 		return;
 
-	c = &ctx->hw;
-
 	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO ||
 	    pipe->multirect_index == DPU_SSPP_RECT_0) {
 		src_size_off = SSPP_SRC_SIZE;
@@ -427,20 +441,8 @@ static void dpu_hw_sspp_setup_rects(struct dpu_sw_pipe *pipe,
 		out_xy_off = SSPP_OUT_XY_REC1;
 	}
 
-
-	/* src and dest rect programming */
-	src_xy = (cfg->src_rect.y1 << 16) | cfg->src_rect.x1;
-	src_size = (drm_rect_height(&cfg->src_rect) << 16) |
-		   drm_rect_width(&cfg->src_rect);
-	dst_xy = (cfg->dst_rect.y1 << 16) | cfg->dst_rect.x1;
-	dst_size = (drm_rect_height(&cfg->dst_rect) << 16) |
-		drm_rect_width(&cfg->dst_rect);
-
-	/* rectangle register programming */
-	DPU_REG_WRITE(c, src_size_off, src_size);
-	DPU_REG_WRITE(c, src_xy_off, src_xy);
-	DPU_REG_WRITE(c, out_size_off, dst_size);
-	DPU_REG_WRITE(c, out_xy_off, dst_xy);
+	dpu_hw_setup_rects_impl(pipe, cfg, ctx, src_size_off,
+				src_xy_off, out_size_off, out_xy_off);
 }
 
 static void dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe *pipe,
@@ -497,7 +499,7 @@ static void dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe *pipe,
 	DPU_REG_WRITE(&ctx->hw, SSPP_SRC_YSTRIDE1, ystride1);
 }
 
-static void dpu_hw_sspp_setup_csc(struct dpu_hw_sspp *ctx,
+void dpu_hw_sspp_setup_csc(struct dpu_hw_sspp *ctx,
 		const struct dpu_csc_cfg *data)
 {
 	u32 offset;
@@ -519,21 +521,31 @@ static void dpu_hw_sspp_setup_csc(struct dpu_hw_sspp *ctx,
 static void dpu_hw_sspp_setup_solidfill(struct dpu_sw_pipe *pipe, u32 color)
 {
 	struct dpu_hw_sspp *ctx = pipe->sspp;
-	struct dpu_hw_fmt_layout cfg;
+	u32 const_clr_off;
 
 	if (!ctx)
 		return;
 
+	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO ||
+	    pipe->multirect_index == DPU_SSPP_RECT_0)
+		const_clr_off = SSPP_SRC_CONSTANT_COLOR;
+	else
+		const_clr_off = SSPP_SRC_CONSTANT_COLOR_REC1;
+
+	dpu_hw_setup_solidfill_impl(pipe, color, ctx, const_clr_off);
+}
+
+void dpu_hw_setup_solidfill_impl(struct dpu_sw_pipe *pipe,
+				 u32 color, struct dpu_hw_sspp *ctx,
+				 u32 const_clr_off)
+{
+	struct dpu_hw_fmt_layout cfg;
+
 	/* cleanup source addresses */
 	memset(&cfg, 0, sizeof(cfg));
 	ctx->ops.setup_sourceaddress(pipe, &cfg);
 
-	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO ||
-	    pipe->multirect_index == DPU_SSPP_RECT_0)
-		DPU_REG_WRITE(&ctx->hw, SSPP_SRC_CONSTANT_COLOR, color);
-	else
-		DPU_REG_WRITE(&ctx->hw, SSPP_SRC_CONSTANT_COLOR_REC1,
-				color);
+	DPU_REG_WRITE(&ctx->hw, const_clr_off, color);
 }
 
 static void dpu_hw_sspp_setup_qos_lut(struct dpu_hw_sspp *ctx,
@@ -547,14 +559,20 @@ static void dpu_hw_sspp_setup_qos_lut(struct dpu_hw_sspp *ctx,
 			      cfg);
 }
 
+void dpu_hw_sspp_setup_qos_ctrl_impl(struct dpu_hw_sspp *ctx,
+				     bool danger_safe_en, u32 ctrl_off)
+{
+	DPU_REG_WRITE(&ctx->hw, ctrl_off,
+		      danger_safe_en ? SSPP_QOS_CTRL_DANGER_SAFE_EN : 0);
+}
+
 static void dpu_hw_sspp_setup_qos_ctrl(struct dpu_hw_sspp *ctx,
 				       bool danger_safe_en)
 {
 	if (!ctx)
 		return;
 
-	DPU_REG_WRITE(&ctx->hw, SSPP_QOS_CTRL,
-		      danger_safe_en ? SSPP_QOS_CTRL_DANGER_SAFE_EN : 0);
+	dpu_hw_sspp_setup_qos_ctrl_impl(ctx, danger_safe_en, SSPP_QOS_CTRL);
 }
 
 static void dpu_hw_sspp_setup_cdp(struct dpu_sw_pipe *pipe,
@@ -609,7 +627,7 @@ static void _setup_layer_ops(struct dpu_hw_sspp *c,
 		c->ops.setup_multirect = dpu_hw_sspp_setup_multirect;
 
 	if (test_bit(DPU_SSPP_SCALER_QSEED3_COMPATIBLE, &features))
-		c->ops.setup_scaler = _dpu_hw_sspp_setup_scaler3;
+		c->ops.setup_scaler = dpu_hw_sspp_setup_scaler3;
 
 	if (test_bit(DPU_SSPP_CDP, &features))
 		c->ops.setup_cdp = dpu_hw_sspp_setup_cdp;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index 3822094f85bc..df3a320a9151 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -332,5 +332,57 @@ struct dpu_hw_sspp *dpu_hw_sspp_init(struct drm_device *dev,
 int _dpu_hw_sspp_init_debugfs(struct dpu_hw_sspp *hw_pipe, struct dpu_kms *kms,
 			      struct dentry *entry);
 
+void dpu_hw_sspp_setup_opmode(struct dpu_hw_sspp *ctx,
+			      u32 mask, u8 en);
+
+void dpu_hw_sspp_setup_csc10_opmode(struct dpu_hw_sspp *ctx,
+				    u32 mask, u8 en);
+
+void dpu_hw_sspp_setup_scaler3(struct dpu_hw_sspp *ctx,
+			       struct dpu_hw_scaler3_cfg *scaler3_cfg,
+			       const struct msm_format *format);
+
+void dpu_hw_sspp_setup_csc(struct dpu_hw_sspp *ctx,
+			   const struct dpu_csc_cfg *data);
+
+void dpu_hw_setup_multirect_impl(struct dpu_sw_pipe *pipe,
+				 struct dpu_hw_sspp *ctx,
+				 u32 op_mode_off);
+
+void dpu_hw_setup_format_impl(struct dpu_sw_pipe *pipe, const struct msm_format *fmt,
+			      u32 flags, struct dpu_hw_sspp *ctx,
+			      u32 op_mode_off, u32 unpack_pat_off, u32 format_off,
+			      u32 ubwc_ctrl_off, u32 ubwc_err_off);
+
+static inline void dpu_hw_setup_rects_impl(struct dpu_sw_pipe *pipe, struct dpu_sw_pipe_cfg *cfg,
+					   struct dpu_hw_sspp *ctx, u32 src_size_off,
+					   u32 src_xy_off, u32 out_size_off, u32 out_xy_off)
+{
+	struct dpu_hw_blk_reg_map *c;
+	u32 src_size, src_xy, dst_size, dst_xy;
+
+	c = &ctx->hw;
+
+	/* src and dest rect programming */
+	src_xy = (cfg->src_rect.y1 << 16) | cfg->src_rect.x1;
+	src_size = (drm_rect_height(&cfg->src_rect) << 16) |
+		   drm_rect_width(&cfg->src_rect);
+	dst_xy = (cfg->dst_rect.y1 << 16) | cfg->dst_rect.x1;
+	dst_size = (drm_rect_height(&cfg->dst_rect) << 16) |
+		drm_rect_width(&cfg->dst_rect);
+
+	/* rectangle register programming */
+	DPU_REG_WRITE(c, src_size_off, src_size);
+	DPU_REG_WRITE(c, src_xy_off, src_xy);
+	DPU_REG_WRITE(c, out_size_off, dst_size);
+	DPU_REG_WRITE(c, out_xy_off, dst_xy);
+}
+
+void dpu_hw_setup_solidfill_impl(struct dpu_sw_pipe *pipe,
+				 u32 color, struct dpu_hw_sspp *ctx, u32 const_clr_off);
+
+void dpu_hw_sspp_setup_qos_ctrl_impl(struct dpu_hw_sspp *ctx,
+				     bool danger_safe_en, u32 ctrl_off);
+
 #endif /*_DPU_HW_SSPP_H */
 
-- 
2.34.1

