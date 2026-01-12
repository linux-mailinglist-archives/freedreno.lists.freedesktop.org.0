Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A62ED10774
	for <lists+freedreno@lfdr.de>; Mon, 12 Jan 2026 04:23:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D909B10E1A1;
	Mon, 12 Jan 2026 03:23:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HhxD+gz6";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S2Rhi7vo";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B74C510E2A2
 for <freedreno@lists.freedesktop.org>; Mon, 12 Jan 2026 03:23:44 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60BJWH5B3998948
 for <freedreno@lists.freedesktop.org>; Mon, 12 Jan 2026 03:23:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AWPQkW6ManqnzeTA+2it+mfHza22MJO4SHb9zehP0EM=; b=HhxD+gz690Gkw35C
 C+5QUVhCp6p55guklKkhEou5UfEYL/HBwzApm6n5kYQG+1sp+XMXwsKRk775YSXe
 K6TIlsP62u5nWPVKAlUmaoFg0wbYYdD1SSpq6K0m3HOd4fgKgp2uIyNQ+HqRBfWv
 poxCKSyAfh44wM2+KW3D5VTyrzSNL/3eqmrlK1y46wNoABFSVY75xXQdSPTukLyP
 yTppD+pefGMq2s0jxz3IMU0tLVCbWpUYfVnwc/D8khRJEt2+rs+8JT9GYS1ul1sN
 k4Pk0XkLG1JkvkJMd3PgBxrciwPS3oz4VqbUwHrrgL4O4S3EFo5qLLLysM+V10sJ
 //gS+A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bm8kyscw4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 12 Jan 2026 03:23:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8b2e235d4d2so2319504685a.3
 for <freedreno@lists.freedesktop.org>; Sun, 11 Jan 2026 19:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768188223; x=1768793023;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=AWPQkW6ManqnzeTA+2it+mfHza22MJO4SHb9zehP0EM=;
 b=S2Rhi7voTkFmKyzBojPv/DUhQ12m+0Sv/tXtTwgjYebJiuKbQgf8a3vtS4abKYozu9
 3pqR2uQQ60k1A6N7eepJvjTfpxRlaQixjy3BXgtMSnxAjXeiw1FpVQfZrPquWF8RTXON
 rg8outXPqPBEswYSoGVYYAVUqtizxEkOjfPI9ksl5J5jEfwTE9i5AoYqa9b14Sa5IkEw
 Z9639uNCtTp9xBqiGH+Ma0MxodvsZvnmjFsCAS/rCn2MZkzjFMNSd12SfVi0URrlPgtc
 mXcgYeNXXUqdWUvgmna2GJj8zRXQHhPllPqKR5j0SzyWE/lxcjAX/LGu7dil++OyGWjn
 74Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768188223; x=1768793023;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=AWPQkW6ManqnzeTA+2it+mfHza22MJO4SHb9zehP0EM=;
 b=cEUQiQ6i/9cPRUCRUIIpgVvfnMsemsHW+XwmLZ4GTO5t4cZS9UxVkHtvxpZn4eJleJ
 sXj4G7mVjnayhzeyt9U9b4lK27wHEiWJH2AO5WRVSUkXZk5Iqtr8aYRlYU0QtAFG4V5X
 UEqYJne4s8fnb5Tqk2MOvaSm6k/A13WKSjDeKk/PMuTb/vj9MDaPzt8+UZ1Vx1GGlwnw
 wbY8R8awKHcyGz1tZKuWPQFc1ac7N4U8/qKtdN+kbmn4/F46nqoAMfbRKraQlLRPA+Sl
 oKgvoNthx4JUqw2GKDlzGgDzSC96HiqR2HSaOYfRm8V9rX05s1UjzjmtfwZGG0qLvhzD
 uuAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXHame6cBH9qSH8fHGJsuBlsus0/d9DN+FmiFXxgBaC4novL4G86m+RvDuXafKEL2EG4jss9D2fSU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyM/XK35ugr1rTL1Rg4aUxZy1EL5A+BP4iFImUKQ0YkV730SWeO
 dXi1gHNrerpSiScEYv0KuAqc9EizXXo5bXGN3LP8eWSgS0NiPFv035K1toMEZlT4uCg3YV7Kbg3
 QoiVdQ7vDLWe/mbyblv6HmunLwiZjh5F0lX98kt/5AJT6lrBWY9AL/q8iRLrNR3fLSn9aAFE=
X-Gm-Gg: AY/fxX4yvvrhB+zK8llTIsY9cMgLfRnjeVgAV6xuwsNb7tIdtWMuRLxKXzHToU95d1I
 jqkgfcMSjIj9Sog/j8FtzQcvnz2vv6m4rt1XEmuNUxgrQW62mh1YVpNPQwxkMJjENnb5rtNFzwk
 JXjvL8AoVnIG+Nds83LBN8UQ0MEXWTwNsERd8GmhJSdtTz3fM6v0U3KeNR1Y03Cw80NUHQQfvWv
 5NE4yBtIR5fp+Fwxu8mUsu0+94vhfHrxNGKVM/2P0sxBDvBhyxmxnmtk2oDCPDntoD0XIsxmlrV
 LudHGjf1aGlNFwNSG8sUmQknRNdUv60jrWPcaaG5gdRL4NNGwHZeMoPtLeZTgyekIpj7C1Gpuyc
 hUAYLgWTzAZN/p7YHSvyQXUBrFfKkr/L1jW94wlDk36XpKZpdx3CFPNW0SVs1NFwk9nZaYHommn
 NzF/EUo92maaI9mkMchT/7FKM=
X-Received: by 2002:a05:620a:4541:b0:8bb:a06c:2610 with SMTP id
 af79cd13be357-8c3893f504dmr2386522185a.57.1768188223122; 
 Sun, 11 Jan 2026 19:23:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEkwq+L94YOuPHViATz0Y3xI2gsPvs0GF5XC7iZYoiEC+/UGQquo2RxeOAPhT+SPy0pgNabZA==
X-Received: by 2002:a05:620a:4541:b0:8bb:a06c:2610 with SMTP id
 af79cd13be357-8c3893f504dmr2386520885a.57.1768188222730; 
 Sun, 11 Jan 2026 19:23:42 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b7c2dd9e2sm2373045e87.5.2026.01.11.19.23.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jan 2026 19:23:40 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 05:23:31 +0200
Subject: [PATCH v2 2/2] drm/msm/dpu: use full scale alpha in
 _dpu_crtc_setup_blend_cfg()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-dpu-rework-alpha-v2-2-d168785911d5@oss.qualcomm.com>
References: <20260112-dpu-rework-alpha-v2-0-d168785911d5@oss.qualcomm.com>
In-Reply-To: <20260112-dpu-rework-alpha-v2-0-d168785911d5@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5356;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=wVzgQvj4XKBtkSLhvRIrDRSYnT6jGkVdSMihboRjAGk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpZGk0nqmrZXcI8g9JEWG9kqjQWiUqm4blxk4KX
 D8YedEddQ+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWRpNAAKCRCLPIo+Aiko
 1VUbB/928UmgbNSFQOdbBS355affEJPu8oHSvNiHbmf3wVEWKPNncCUQ6vGP8vznO5DZOX16i82
 UW+EpOeGha1lj9kFV6V3en2jejc/THJaBL6DCrclQaPkxKtvKlO4VvU2J/MX8IETP1f4+Ntx9pS
 RoTQQjKi3iPEiffc4GcteQOqfvzxKf2xYBblBsBZkYa5SUuzYcb0+F+Xjf5N2W9mcFz96990QVC
 YmO3giRvHYknronhY/8UZ3VzDPsnFoUvKq7UpCs1DTYJYCl4UPKmuzJyu0qOSzNLXmEvLvGmEow
 Rab71nSjAVGDKRowKla1ykWb2Y/aK4vT9B5ORM7CWYYXgC+G
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: poIjCVEopl5GlXp0OXUBZCpV-DX3P922
X-Authority-Analysis: v=2.4 cv=ZuDg6t7G c=1 sm=1 tr=0 ts=6964693f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=9g_qaOd13HrosajSYkoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: poIjCVEopl5GlXp0OXUBZCpV-DX3P922
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDAyNiBTYWx0ZWRfXwFQHNMgqmEWc
 2XZJ1fjfjsgp9n5lUOhdj7Wp9kStv42iOIugWhnvPUkFCKB9YAos0wyHR/uUkn5owpQReW0lQmS
 owmeXF2nptsGY72IfH+jm5wbDjRihnSuDRXvTCV6tI+DlYGO7ml6bYcURPKlCQHtnCKaDLzsxUZ
 lFfo8VDmX8WVzWbYzScCniufgKlUafCpmbJHawarUx6JqYcrhRZ91+hn/fH5/xB5HdD5/Qyi0je
 MPfrexyu0xIO3qCx0TXgqwAiKah3zyMlj+rk/rg/9BCy2Y/khxKHGpGEkQ3n68G2P5QOv42V2GX
 xWziOAsWKdOSmtFDxjcDLp8+o1lzs1IU1TabdGF8usGnM/BmCFakT6j+moOR9HJdCZpLR3rZnqV
 wSTYMH3xkyD1h5aUKX9vh55HGppdipr9dqxft77pLf0K0in9Z8zE5i8Dzd4jCsqqrv+cM3kLhX/
 kO3Mgm7LK5Wu879Qk4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_09,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120026
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

Both _dpu_crtc_setup_blend_cfg() and setup_blend_config_alpha()
callbacks embed knowledge about platform's alpha range (8-bit or
10-bit). Make _dpu_crtc_setup_blend_cfg() use full 16-bit values for
alpha and reduce alpha only in DPU-specific callbacks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 16 +++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 21 +++++++++++++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h |  2 +-
 3 files changed, 19 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index f6827ed71f4e..61af96fdd7e0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -326,26 +326,20 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
 {
 	struct dpu_hw_mixer *lm = mixer->hw_lm;
 	u32 blend_op;
-	u32 fg_alpha, bg_alpha, max_alpha;
+	u32 fg_alpha, bg_alpha;
 
-	if (mdss_ver->core_major_ver < 12) {
-		max_alpha = 0xff;
-		fg_alpha = pstate->base.alpha >> 8;
-	} else {
-		max_alpha = 0x3ff;
-		fg_alpha = pstate->base.alpha >> 6;
-	}
+	fg_alpha = pstate->base.alpha;
 
 	/* default to opaque blending */
 	if (pstate->base.pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE ||
 	    !format->alpha_enable) {
 		blend_op = DPU_BLEND_FG_ALPHA_FG_CONST |
 			DPU_BLEND_BG_ALPHA_BG_CONST;
-		bg_alpha = max_alpha - fg_alpha;
+		bg_alpha = DRM_BLEND_ALPHA_OPAQUE - fg_alpha;
 	} else if (pstate->base.pixel_blend_mode == DRM_MODE_BLEND_PREMULTI) {
 		blend_op = DPU_BLEND_FG_ALPHA_FG_CONST |
 			DPU_BLEND_BG_ALPHA_FG_PIXEL;
-		if (fg_alpha != max_alpha) {
+		if (fg_alpha != DRM_BLEND_ALPHA_OPAQUE) {
 			bg_alpha = fg_alpha;
 			blend_op |= DPU_BLEND_BG_MOD_ALPHA |
 				    DPU_BLEND_BG_INV_MOD_ALPHA;
@@ -357,7 +351,7 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
 		/* coverage blending */
 		blend_op = DPU_BLEND_FG_ALPHA_FG_PIXEL |
 			DPU_BLEND_BG_ALPHA_FG_PIXEL;
-		if (fg_alpha != max_alpha) {
+		if (fg_alpha != DRM_BLEND_ALPHA_OPAQUE) {
 			bg_alpha = fg_alpha;
 			blend_op |= DPU_BLEND_FG_MOD_ALPHA |
 				    DPU_BLEND_FG_INV_MOD_ALPHA |
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index e8a76d5192c2..b7779726bf10 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -126,7 +126,9 @@ static int dpu_hw_lm_collect_misr(struct dpu_hw_mixer *ctx, u32 *misr_value)
 }
 
 static void dpu_hw_lm_setup_blend_config_combined_alpha(struct dpu_hw_mixer *ctx,
-	u32 stage, u32 fg_alpha, u32 bg_alpha, u32 blend_op)
+							u32 stage,
+							u16 fg_alpha, u16 bg_alpha,
+							u32 blend_op)
 {
 	struct dpu_hw_blk_reg_map *c = &ctx->hw;
 	int stage_off;
@@ -139,15 +141,16 @@ static void dpu_hw_lm_setup_blend_config_combined_alpha(struct dpu_hw_mixer *ctx
 	if (WARN_ON(stage_off < 0))
 		return;
 
-	const_alpha = (bg_alpha & 0xFF) | ((fg_alpha & 0xFF) << 16);
+	const_alpha = (bg_alpha >> 8) | ((fg_alpha >> 8) << 16);
 	DPU_REG_WRITE(c, LM_BLEND0_CONST_ALPHA + stage_off, const_alpha);
 	DPU_REG_WRITE(c, LM_BLEND0_OP + stage_off, blend_op);
 }
 
 static void
 dpu_hw_lm_setup_blend_config_combined_alpha_v12(struct dpu_hw_mixer *ctx,
-						u32 stage, u32 fg_alpha,
-						u32 bg_alpha, u32 blend_op)
+						u32 stage,
+						u16 fg_alpha, u16 bg_alpha,
+						u32 blend_op)
 {
 	struct dpu_hw_blk_reg_map *c = &ctx->hw;
 	int stage_off;
@@ -160,13 +163,15 @@ dpu_hw_lm_setup_blend_config_combined_alpha_v12(struct dpu_hw_mixer *ctx,
 	if (WARN_ON(stage_off < 0))
 		return;
 
-	const_alpha = (bg_alpha & 0x3ff) | ((fg_alpha & 0x3ff) << 16);
+	const_alpha = (bg_alpha >> 6) |	((fg_alpha >> 6) << 16);
 	DPU_REG_WRITE(c, LM_BLEND0_CONST_ALPHA_V12 + stage_off, const_alpha);
 	DPU_REG_WRITE(c, LM_BLEND0_OP + stage_off, blend_op);
 }
 
 static void dpu_hw_lm_setup_blend_config(struct dpu_hw_mixer *ctx,
-	u32 stage, u32 fg_alpha, u32 bg_alpha, u32 blend_op)
+					 u32 stage,
+					 u16 fg_alpha, u16 bg_alpha,
+					 u32 blend_op)
 {
 	struct dpu_hw_blk_reg_map *c = &ctx->hw;
 	int stage_off;
@@ -178,8 +183,8 @@ static void dpu_hw_lm_setup_blend_config(struct dpu_hw_mixer *ctx,
 	if (WARN_ON(stage_off < 0))
 		return;
 
-	DPU_REG_WRITE(c, LM_BLEND0_FG_ALPHA + stage_off, fg_alpha);
-	DPU_REG_WRITE(c, LM_BLEND0_BG_ALPHA + stage_off, bg_alpha);
+	DPU_REG_WRITE(c, LM_BLEND0_FG_ALPHA + stage_off, fg_alpha >> 8);
+	DPU_REG_WRITE(c, LM_BLEND0_BG_ALPHA + stage_off, bg_alpha >> 8);
 	DPU_REG_WRITE(c, LM_BLEND0_OP + stage_off, blend_op);
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
index ecbb77711d83..380ca673f6de 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
@@ -41,7 +41,7 @@ struct dpu_hw_lm_ops {
 	 * for the specified stage
 	 */
 	void (*setup_blend_config)(struct dpu_hw_mixer *ctx, uint32_t stage,
-		uint32_t fg_alpha, uint32_t bg_alpha, uint32_t blend_op);
+		u16 fg_alpha, u16 bg_alpha, uint32_t blend_op);
 
 	/**
 	 * @setup_alpha_out: Alpha color component selection from either fg or bg

-- 
2.47.3

