Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2A8D3A130
	for <lists+freedreno@lfdr.de>; Mon, 19 Jan 2026 09:17:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74C8310E3A6;
	Mon, 19 Jan 2026 08:17:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wi7Wu3Ls";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a5oz0qTe";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD13B10E39F
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 08:17:23 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60J7hX1D039938
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 08:17:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ySBe32B9dFLBxykveI4xu5ZLa7Kh8Fdd134UNyMzTpw=; b=Wi7Wu3LswO6H6Rk5
 nxBvkHFRXwtsp7kyLPXPOWzAHWb+zqVDX7ATsczThru5sIFe/QTRPlUhujMS9lYq
 BbXDSmOP/zHQbPyDXBunAUecMYqGoc5Q12Zjw9t5SqqljDjxXJK1Kxj0FstDGKwj
 EH2u1h174oQmcYsXBN6haacMucXF7stD4SYKfON+wdrALlLbcUeHy/1Q+9DOMOaw
 WVbhzCuOn+U4Lddq+HXPZAZ5lR3cWlep1MnVcISBILaOB/w7DJosl+6nwAf/zhz4
 bSiOB3yA4qzPfxD/KTjNE1w5u8BVPnkgp4+2NFm6KxfwDD8I0cRO8XoXhFhivQ0P
 zaaqdw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsgfr84k4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 08:17:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c530da0691so911757685a.3
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 00:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768810642; x=1769415442;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ySBe32B9dFLBxykveI4xu5ZLa7Kh8Fdd134UNyMzTpw=;
 b=a5oz0qTe2/CimQWKp8j0+B3Y+rI5D+xSBOtK5RdnisFK3z4goH8BMtQhRI0kx/iVsV
 hFaUB+SP8RXganHBSn4zB27IF/gNnVPyH+pCIGRme76zXbwqNXRsrKnUOIm5BB+S43KB
 sAaRHENW80m6U3WhJX/JC6W8Grnh8kzJfdP+/yMfT7Q325ExZecxixC6x8pNUBxmh2bj
 KqNaocd1Qp2N7ewDfIUpQ5E759IPaVjWuEFJay6J/REcM+B6wJ9eSZrxYPLF2EqQnmPG
 qLRrH2EaOxu1zwFTH4nKcnTHJFQqBJGDMSDNodC1oILukcLiaCsLyeLMDj56tBFbwL7E
 QC8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768810642; x=1769415442;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ySBe32B9dFLBxykveI4xu5ZLa7Kh8Fdd134UNyMzTpw=;
 b=LlGA2MmntkN4Y5J3/THXjw7tLCcblIsxLrAkmho/5DlpKOFQ8lTXm0GmrcDoRuMJYh
 6rLSKCTXfbLSl9Bl5PlQqhbHV9iJGN+l9j74yYQ1pJiEitwqetrkm7VOyvreBpqsPdRu
 kVCXcfLULrFpNga7cNf7BfZVjzt2KqLpZiYxor3sRbLZ2iOKAE1tO/zrewmcFVgkCvce
 I1gbpnnyp/Lf93cS+pUJanA6cD1+BB7mOda47Xqr6TkWXvgbaR621M9XKKIcjPvZq8uu
 MJZDEszBJxXPz0LUeQpFy5lBXmVbGtSDYZXdCHajA2m61T9z5xXNwCHMC7fxhRzyGFdY
 EV/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrAnlzjEDXdwpTu0CgU+aWtm4KE0UVkWy5bZvIEzr8XMBEQTkIfLFG6COlOc1wVILhvVfpOSqV3IE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzbaGh6SfFm2fwTGDC6v6jpBu6BZjwttfLMdLx8lVGJRIzFrQYu
 jKGYg99uxVqDYFOK6PuQv6q3GHpCe63fJ/4R7TzaU+5bntXalFm35NXKzw2QJ1g5RMaKjWFhdN9
 EcktIKFjzzPDr1k4Ig6RgRLv86bU5aHR/YZO2cp6dXkUOtCgKdtJqF9H9C/fKT7yI5VfHq2hF6F
 JIOwo=
X-Gm-Gg: AY/fxX6ZyB0rjG5MkfC6Du/NB4/RPDrHr9STZaYlHa28KdiEVZthQ/yR6yjXaf6S3SP
 CA81CqeQmMdfwrX2PWY/bQ2AFaaa0f79QXNOiakyXBJds1VJxqUscQi9KttNMtR+VhpyUd/A1oK
 yy1mGdml4f3uAgCtTuvuB82DKDAikIrI2UzePyGh7wXoubBsQ7c6Kbt8ogUoe0jYpNCWMOuVh69
 swk/Si8cG72mOL8yUAdccn+F3fM67xApmBFgQEH+N/YeIUPLld2jcdSsNlEG2A0EdEUqTN/9q0c
 GMjqVf6aknCgQHulHMY2ysv1OoHH645zMi4UntlcMY7gRaYG5eeGH2oZ1R08bDhPZ4spdus5AjK
 ihfEUg37CgFwO8xtnrAULQINc+aiPO4Tk+fh76HqIvJzgE5DqfWKlE+9SO//bB0ve8rT9HsWjnc
 i6jV9fxCfAh5RpmI7WTiQ+C2w=
X-Received: by 2002:a05:620a:2982:b0:8c5:2ef1:7d4e with SMTP id
 af79cd13be357-8c6a6948240mr1557611085a.73.1768810642029; 
 Mon, 19 Jan 2026 00:17:22 -0800 (PST)
X-Received: by 2002:a05:620a:2982:b0:8c5:2ef1:7d4e with SMTP id
 af79cd13be357-8c6a6948240mr1557608685a.73.1768810641589; 
 Mon, 19 Jan 2026 00:17:21 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38384dbec4dsm29636391fa.20.2026.01.19.00.17.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 00:17:20 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 10:17:16 +0200
Subject: [PATCH v3 3/4] drm/msm/dpu: program correct register for UBWC
 config on DPU 8.x+
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-msm-ubwc-fixes-v3-3-34aaa672c829@oss.qualcomm.com>
References: <20260119-msm-ubwc-fixes-v3-0-34aaa672c829@oss.qualcomm.com>
In-Reply-To: <20260119-msm-ubwc-fixes-v3-0-34aaa672c829@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3052;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=lo3imQhUcYZeiROXs6LS6r/XOzlEgkEUmatFOrZKrog=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpbeiL/WY6dQq1hsAiruVmlJNpw57IWcvKI0mt4
 N7D1QNofs2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaW3oiwAKCRCLPIo+Aiko
 1UOrB/9IB96KEZsLVA0GwmxwgpsTgczf0JVTDWkX8qtyDLCq0z/ZfbuEcCSmPHBhsKwFIVJ5yuA
 kN7oHWAkFgGWtbC2eu4yoTaTyAHwKgjYE65CzizRgOGqUxF8EO+Ap/2WUsuBWvM7+F49uDQkelh
 6Ei4TGLrMuMnkQwBWpn6TrsLHI7LC81RbZTnqRDpg7ARWgP40sF1JjnKrnokaOYXLXOeachxtKA
 V73mG2sOraF9fHqtEMvyJTkwQJLT0Jaj9/iF/C7fVlcUjcSIB2oRleJZaurod5mC7vKxwvm0zr9
 3GqjoaiCca4Idd2hujFK0ERRWqepS1ZchB9uT5loLrVXi/NT
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: MS-xPsE1UNY89qc5BYOR8SgB_y_aP3rA
X-Proofpoint-GUID: MS-xPsE1UNY89qc5BYOR8SgB_y_aP3rA
X-Authority-Analysis: v=2.4 cv=c4OmgB9l c=1 sm=1 tr=0 ts=696de892 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=7tap2HhiP8zdS8EL3YEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA2NyBTYWx0ZWRfXwmTqGUmkXQGg
 jhWjkwi0QA+EpK2EpEPnQCueME0liiv2Fkkar21Fgafr39fDs51FLMBfSHfaYAzCpeSzLGj/5hG
 4svP24f13IsHSy+JREiIwI03zFvA4h0A2XcxATdB5Yi7VWmE7BXUustdCPQbzbCBbVPvPlhjz3K
 FqqWxwpDmXSEfURxHVns0VNpODwJeD70iRSOQzilnBbVK9dN95IdSJo/q0LtokuQXX0sJpLgPGP
 x1OShvuKhGj5AIuLowojCUdvvM+9arclIBJ1M7Em9PNO/fVD+Pasv22eAolr4WCTlH9iFmBeHQy
 T7nfu7/leHB5ENiRZiSxbs+v21KXBlDjN7BVxgOwqCEDvBpNnB6aM/P1b1/i2Ga816BqnO6syol
 sF7cTbK2dkzxrZPUnI7ueKxbfsryEMR4gP1mOZwR5ZLJytuQE5rzf1H/2UAOq4pMtQ+EXWjC4Sb
 Jiv0Butt2M6iA+jmKXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_01,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190067
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
Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455
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

