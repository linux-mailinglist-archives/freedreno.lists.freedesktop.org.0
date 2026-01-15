Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0F7D23855
	for <lists+freedreno@lfdr.de>; Thu, 15 Jan 2026 10:29:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A06E10E71E;
	Thu, 15 Jan 2026 09:29:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ckG5dfao";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="im3ZiRXg";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A9D010E71E
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 09:29:21 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60F6g9iv1056300
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 09:29:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=ileYJt8Ryey
 ev+eOt3INPoOcf4+7lBchrZlog8PShvE=; b=ckG5dfaoMV/Z2/Hj9RdK/qKAs+S
 XMUJIrhf01W9P8GohWiU4c84zBaR0w+25+j0S8cV5bHUJyzRJMVwBeeEJrM2h0vX
 T4j16nCgFt8YJZZ1WLXGCNtz5/TbZGVWm/L3FXwFsttMf/Y/taJJlKWbUDLAY0tP
 jmCyn7dQAXqC7ehqfaCBFO/7/sNe7eStbXcsmB5jmX1xV70kKBwvhKiRXTLgIkvg
 nNKRO88XjEWTR3D8HqzoCcVLYgub7P0whyA2hTVN0Pv/L5Y3sUBfOAJQvOd3O+Cf
 q2iArfXGdpP2tZsrJNnFxA3XlKM/avhVpReaY2rM9sQC+5c4aJcs2h7vt2Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp8d344ch-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 09:29:20 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-88a366fa140so24435816d6.1
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 01:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768469360; x=1769074160;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ileYJt8Ryeyev+eOt3INPoOcf4+7lBchrZlog8PShvE=;
 b=im3ZiRXgwAOIwFH+LSUHHDfVW4ZhJHsPRrRZhunmo+244DvMsw7bouUDRtN+XrQEki
 l6DD3aN8nZ2lNsnRHeObqz+FwKNTikVK0tucaZxAoS3rijiYjnql1D/uSbtvJ7Lb79x6
 p0gwQSmxEKZz8ermkKflio0e4Pi0MD3XeGo5X2V1YtSCB861fwVGg3MhJhCAPysx3Nn5
 +46HFntlQnIYfN6p7cAEdt2nzE+yhDPT/YWsBha55JOKIqosumlke0tLcoyCuKs7bTZe
 eSr52h9dwTZVxMC+eEMxp1dfOQW4YxJNzAk63mRNCemo2JAtw/FhhwZlT/LKiBZ8OL01
 wMSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768469360; x=1769074160;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ileYJt8Ryeyev+eOt3INPoOcf4+7lBchrZlog8PShvE=;
 b=oDEUsvMpnY5SQe0fsuESIiTN0wFHrT9yv/USO/5+6+IrYcXCFDcSgUN03CEp3nj/sS
 NBM/kjcjbGEzxaEN3UHSTBKwO1pCrmI84toJftJ1vLhLXvPU5ATqnm/tQo8SiWJgFbuQ
 eNw8RspDPq0d50J/85WADaxmFQ/PiDqtI/Vmp7iTWqpMe5GCoEeXD9LSwSQrla6bQfan
 0RM6AVRrisId6HpUKIhrePJkQ1UopiewrBOr/9ge0GpK7ns2nra8LtQ3il/kGi+EpvoY
 ELYVVtLFyo6TBO/gOtMLuQSxXVdbq4NUo0qdMwE+U6G7HBH86vFWMfjDfiHms6MNRQGL
 3mqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4dxgrsqEfkCZ890U7q9PaU/c1uxoBxlFv7ZRLWO9df0lNkPu97GyebA2K3UZAN35RWfynttbbxWc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwibYLufG4h5xIUbNWnJbUpoQMd6BxRj7w2OSE9js9O9yczjpos
 qeGX0qehtZ0D51aF6Zrxw13+FqTbsyQYj9UhHu1wvotQCJSriAth8+oOZ2MiSNVtMKDZiYYra/g
 ZHKFf9vN3afzEpYZZzpUD0KUzWUhXXprEQrUXYRA7kAz82CtY6bdnnhQbTY++UrBAR1HTKH8=
X-Gm-Gg: AY/fxX6kze/O41E1eD3QIIRh13H7/1d+ftOHFSU4O+7S5KQz3RA0Nt1hJESpr5UBPIK
 a7YyOXTwKNrpI59+4MdfLJz1KvqWBlN3G9aiFRDPB60AGQGgsWCjlR/7LSqrSGIGfqRmAR4DrIf
 M6wXi/Bg0Gnp1Roi7HbW9XNIMjQfwQg6MX64NF84bx3RJcPPY30eVULes4reTWuRPFijTPg0EAG
 pv/0uCn2nR/9g4dyoeVvkRUGXLgtEutKoF7/x42neNqFC/lapw0MxlxNx1L56o1xOlQtQLVMQ/g
 PeuyNZyMqkBY/n6eambzqYBRqyW8Clf1Quc/M0AKKaq8AjBQhUulID+IvLhF5GVBo1A3BjOLpdn
 MUA0efvQeRu4QzWtNUt5Tv7DZJz9nzFEPhEdHYvxTX/BcG6o//YoqBHxM1FlB4PmX3nU=
X-Received: by 2002:a05:6214:3485:b0:893:348e:4126 with SMTP id
 6a1803df08f44-893348e4275mr36966506d6.61.1768469359815; 
 Thu, 15 Jan 2026 01:29:19 -0800 (PST)
X-Received: by 2002:a05:6214:3485:b0:893:348e:4126 with SMTP id
 6a1803df08f44-893348e4275mr36966146d6.61.1768469359336; 
 Thu, 15 Jan 2026 01:29:19 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-892668a2419sm64388416d6.30.2026.01.15.01.29.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 01:29:19 -0800 (PST)
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
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v6 09/12] drm/msm/dpu: Refactor SSPP to compatible DPU 13.0.0
Date: Thu, 15 Jan 2026 17:27:46 +0800
Message-Id: <20260115092749.533-10-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260115092749.533-1-yuanjie.yang@oss.qualcomm.com>
References: <20260115092749.533-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Mw1WbCJAgWaDyFzLgJAfuICdv0-xZ1im
X-Authority-Analysis: v=2.4 cv=fbWgCkQF c=1 sm=1 tr=0 ts=6968b370 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Qg1eW3vjq6ATntrd7kwA:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: Mw1WbCJAgWaDyFzLgJAfuICdv0-xZ1im
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA2NSBTYWx0ZWRfX8KDc3mBw/e1H
 sHqn/MSOb5lJpo4cei2x3GC+nlPCxzoHmjETmlHJa6aWDk+p1guhMOjh8cZlh4n1BXqO2AhYSiQ
 iDddBrIgK3gOrl+6s9tEQO6cZECop+cNmtNsJycH7zPHao0wlgdPg23AbSqReCX+FMbN9LbIsrQ
 O/WaMMD/bN0n7W5AOBLjKQzd1SeEaEeu9wxL2fexlYj/3LPuk0FqjAcRefbM/kd/zwFa31pnl9W
 pH/W2hCgIgLl5XNmuTZpeSZxpsHZn3L90P66PWZNo3YxKA4FQtqcLJ5R6PWRg5VREqHVRTB0oE0
 xT/OjoYcw2Cc0povjdHPKWBVpT3EVW2+xraJHiMB9uwtAPMBAoNaQ7xbSGonfPSk7Tx+jX4dKJ2
 +nG4f1mauKVUSjojqh+2ocCx3OTUkqg77lRnjPdTMxv0rGQJSOKiGFPYagJpUhkaF/HItFdEYTI
 AuzBTuxJ5/I2O87RTXQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150065
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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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

