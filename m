Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CDBD3A867
	for <lists+freedreno@lfdr.de>; Mon, 19 Jan 2026 13:17:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3D1610E42F;
	Mon, 19 Jan 2026 12:17:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="C7zxh3D5";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sc2Kt5aO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9193810E431
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 12:17:26 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60JAR6Vh1661055
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 12:17:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1+R1NURe0aOQBp8d0tJX9/rPnT/UJh1DxdGIX1sR33s=; b=C7zxh3D5av3+lFSy
 TDVSFodXBe0LK+CdMRyvl+zIIZSy79R6llY5l4BiNEFbe/bJnLOukNGaQxj130xt
 9tymzsvPWCY+NVGZtW07cPhPfq+dklHbkGfKIWNjGDK7WkYvXD/+aE85/kKBXtmb
 hwtEkcyL1gaKRCH9KOV+64q5cl3sILjgGtV4+/a3Vxsjeyl1DGVHi5cZu6kaBEeb
 KfsucreD55oUBkp2U6T7kFQ0HQnipAdZaUTyJ7BVVR/73Lj5xnNDCuaxW/oFsd81
 tB69RpSQiTWOi1MnUAGZBTuuaeQbEvMg7ptXR1tIv2ZHfv7JH998pzkmsusAD1tU
 2z2kfg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsjvdra23-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 12:17:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c6b315185aso676711285a.2
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 04:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768825045; x=1769429845;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1+R1NURe0aOQBp8d0tJX9/rPnT/UJh1DxdGIX1sR33s=;
 b=Sc2Kt5aOTg8xRcrnJP3NS8FHyQTc3GHzLQwEFYaXlXc2O/x4pxcd1Zk1mwAp864Kwa
 /JFrh7Kid7gK2ZkMamcbbMRBaWpfll2Y+HSvj9M9P+K0RfsFYt0JX/XeImiIcMvrobCQ
 NZOzSS+cMRaofT8+LLSlGgRBfOUnZv1RIsD0rmfAC/b04g0+oDkunz8zNDl3u40at0Gw
 15hErChsaMKQVzD5GtrIDTm+mWVgOTNVWN/nCgf1PsrnR4AGqSvdTMQBBH/cNM9pOKHI
 +sVC25ugF/A/UE0bOjQURLDmgf5jVsUpMlHW5wKZfmMfFoIbzLaOOjVIUPyhMs0Cjbkq
 P/SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768825045; x=1769429845;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=1+R1NURe0aOQBp8d0tJX9/rPnT/UJh1DxdGIX1sR33s=;
 b=wBYgO4xmb0ZSznQhBhrlleln3QQr3zGtjRKxGPw7PKT8t15eCjMh81zkPt+j+XrOH/
 +6FbdxJj+ltIh2lOxb7KxyUdijvTxVeJWYSBlXIjY1UISDfxsZ1q095Tibj//UR/nbFw
 Sg7iw8cEvrxog6CiwiZX9ArJ9oXCTAnW80+IfnhAcsriPDbosHqgMULXK04wslmv5nP1
 hW+58xYacqFrVz/uDPMHjdlMzLuTeBrrkF1D+Hl1NNuWhaR1tFzvblTOrgnmENDlgNUF
 eZ1DO8H3y7UqpNdVVbZp0qDY70lb1BNFigz9eJYb6rMAViJOkZ/jY8AqcXx8TGFnA1nL
 s6ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8onTrmgCrTZSHJ2xYBaPbhVnMe3vOEmCQIES/viI+tTBB3JsG0G+QLy1H4a/+VGBpDtQz8UbO/0w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwbzVoQUP7zeOzp+M2pK8q7QmVEYseUqpnfmv5jptgF1QtNh7Np
 NZRlpJy7mA2moNP2+gWkZNBD7eAIskJ+XODuvsfei/cNmtplN+ruXN69xEl77RkkWIgEJnZ8Wie
 wUAmMOI+tNmlXB8fBYd8mMSzNfKWnh9B9kQGOoYWhCxOErg785HMYkcvdg0x6t6/ibOSr1kKcQK
 uKZl87/w==
X-Gm-Gg: AY/fxX5xCuTt8VDXPt/ZQDx9D4c2Ya/1hQuTpVqpeIOpYj3SDkFNwYPv/dnrwIlSqyY
 d4yzFTgMmoN2UL9AFWGCJ/oMszT714EOaKuBbOdO18BnEOxxnvnrVoGWZFMxTivdsuASB02iS0l
 yT91MUS1ihJnpZPNX9jMKsZJ7LqQ8xkmHsafdughnvdpWKdeFx+oQdWTMTD0UBS1hD1EvHMbSW5
 JuaD4PwpZTOfiuWEXVlosXC/JihX8n8UNoAzS1MJHIvWc1caKr9aS++r7w7hTkfpPMDd74gx3Ov
 xGucz09naVTHOFVGvVCXx8SBh21YWhMVTKS6wGMKNZQ7vVdVwL14BnfvgSqXx7XVX2jF6FVJ8Gu
 lskQjc8lmYtUv4RiJs6hR6P4kgEw/sDKeV8KAPSXz9Dy/RY3XIDo7n+sRXDKpff5KWKxkh4qtVu
 /FYa5O6nOZvmH+6CWABMmO1g4=
X-Received: by 2002:a05:620a:3947:b0:8c5:3495:87df with SMTP id
 af79cd13be357-8c6a691f35emr1541595485a.38.1768825044784; 
 Mon, 19 Jan 2026 04:17:24 -0800 (PST)
X-Received: by 2002:a05:620a:3947:b0:8c5:3495:87df with SMTP id
 af79cd13be357-8c6a691f35emr1541590685a.38.1768825044215; 
 Mon, 19 Jan 2026 04:17:24 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf3a17b9sm3274641e87.92.2026.01.19.04.17.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 04:17:22 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 14:16:40 +0200
Subject: [PATCH v4 4/4] drm/msm/dpu: fix SSPP_UBWC_STATIC_CTRL programming
 on UBWC 5.x+
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-msm-ubwc-fixes-v4-4-0987acc0427f@oss.qualcomm.com>
References: <20260119-msm-ubwc-fixes-v4-0-0987acc0427f@oss.qualcomm.com>
In-Reply-To: <20260119-msm-ubwc-fixes-v4-0-0987acc0427f@oss.qualcomm.com>
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
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Val Packett <val@packett.cool>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2999;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=hK4mO/cagHj3HVYjVR3i3QZO8ZbZgg9vO0ANe18SGRw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpbiDLpqeQzOXgyf3tXynVkxvGog9EgSHQgbY48
 /KeMdsJMhKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaW4gywAKCRCLPIo+Aiko
 1e/2CACcDaJ6s6kfm+vHnD/D6JZRlYJKgJpb6vVJ+CubGxlksC2JZK/iBXaKvdU435oeEqvlR+A
 Yt+GmgPjHbmDSGXVLx8gj8/vu6AtqxKz3yRy/WpPcEgOI9N2Yap9grQHG4IC1C4UPJwFHtUELzK
 CLmBgwHX8VLI/U9iqp34YeYlZLjAvpNqya8tAxv5zaoHoR+3mx7N0i1XzUmgK5OgtWFa9LYwFea
 XZLzz6LRRZH74S26+h7Ue79tjdrJ58maQ1Ic/d1syDvrKPI2ksCHPBPrPaIEoo6MhwayjVDqXhd
 gkNlqZWnjhlKc8SR1SOCwK/TmDh9XJ4m2GldNLuMdoY8AQW+
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: INeCafiev6lOlImT3-haOm2nD8UCj6Ak
X-Authority-Analysis: v=2.4 cv=U92fzOru c=1 sm=1 tr=0 ts=696e20d5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=7FpWx5GjbivZIX0HvvoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: INeCafiev6lOlImT3-haOm2nD8UCj6Ak
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDEwMiBTYWx0ZWRfX+ETeZ6UOd5Ip
 Ng+dF1ltDgGXO/+ILOl/peC+UBh4wR2X6qVuWdwrZCD5tFX8gNgAbaoWu+oX25pzwHN3CHh0l8k
 +E8AeCa3rEOsZ/ktlP3GWYD3NjVPI8uFHQ9q2sLHkPGg8LaVLB9fYk8pLnAfH5Q2pvwyH05DZgh
 97faqBm+kysY5vlImhnkmO0tf2iiv/zbOsZ+4a0WKMvyuMHkBVKY+8GcRbT5RKn7PHVH6I9ofIU
 itxhw/jGx5rrXzOX8uy8Lb8Wlip4keIzK0Rzy2ly1PopdsCpOj6a6yTPpFINJgZpuEePXmqMgWi
 0Kcvam3v/aN1Z9GH7o09qPAjANDDmxG+3qN/IOaVF+lGWN8hIkzf9c+CzwFyvTBwiVOJ1KUMWUk
 frKMnSd0yFjCTH8/zKybzWNXsYwBH6Dn9QA72v2qOJx3BIglaYTxqgXcKb1OyH9sfRkn2u9VV61
 Yz36qr7qU7ATKQ/TkwQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190102
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

Fixes: c2577fc1740d ("drm/msm/dpu: Add support for SM8750")
Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 45 +++++++++++++++--------------
 1 file changed, 24 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 6ff4902fce08..f275b14da4ff 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -284,6 +284,7 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 
 	if (fmt->fetch_mode != MDP_FETCH_LINEAR) {
 		u32 hbb = ctx->ubwc->highest_bank_bit - 13;
+		u32 ctrl_val;
 
 		if (MSM_FORMAT_IS_UBWC(fmt))
 			opmode |= MDSS_MDP_OP_BWC_EN;
@@ -291,30 +292,32 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 		DPU_REG_WRITE(c, SSPP_FETCH_CONFIG,
 			DPU_FETCH_CONFIG_RESET_VALUE |
 			hbb << 18);
-		switch (ctx->ubwc->ubwc_enc_version) {
-		case UBWC_1_0:
+
+		if (ctx->ubwc->ubwc_enc_version == UBWC_1_0) {
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
-			DPU_REG_WRITE(c, ubwc_ctrl_off,
-					fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
-					BIT(8) |
-					(hbb << 4));
-			break;
-		case UBWC_2_0:
+			ctrl_val = fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
+				BIT(8) | (hbb << 4);
+		} else if (ctx->ubwc->ubwc_enc_version == UBWC_2_0) {
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
-			DPU_REG_WRITE(c, ubwc_ctrl_off,
-					fast_clear | (ctx->ubwc->ubwc_swizzle) |
-					(hbb << 4));
-			break;
-		case UBWC_3_0:
-			DPU_REG_WRITE(c, ubwc_ctrl_off,
-					BIT(30) | (ctx->ubwc->ubwc_swizzle) |
-					(hbb << 4));
-			break;
-		case UBWC_4_0:
-			DPU_REG_WRITE(c, ubwc_ctrl_off,
-					MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30));
-			break;
+			ctrl_val = fast_clear | ctx->ubwc->ubwc_swizzle | (hbb << 4);
+		} else if (ctx->ubwc->ubwc_enc_version == UBWC_3_0) {
+			ctrl_val = BIT(30) | (ctx->ubwc->ubwc_swizzle) | (hbb << 4);
+		} else if (ctx->ubwc->ubwc_enc_version == UBWC_4_0) {
+			ctrl_val = MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30);
+		} else if (ctx->ubwc->ubwc_enc_version <= UBWC_6_0) {
+			if (MSM_FORMAT_IS_YUV(fmt))
+				ctrl_val = 0;
+			else if (MSM_FORMAT_IS_DX(fmt)) /* or FP16, but it's unsupported */
+				ctrl_val = BIT(30);
+			else
+				ctrl_val = BIT(30) | BIT(31);
+			/* SDE also sets bits for lossy formats, but we don't support them yet */
+		} else {
+			DRM_WARN_ONCE("Unsupported UBWC version %x\n", ctx->ubwc->ubwc_enc_version);
+			ctrl_val = 0;
 		}
+
+		DPU_REG_WRITE(c, ubwc_ctrl_off, ctrl_val);
 	}
 
 	opmode |= MDSS_MDP_OP_PE_OVERRIDE;

-- 
2.47.3

