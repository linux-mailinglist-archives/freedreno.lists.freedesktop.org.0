Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E30907EED
	for <lists+freedreno@lfdr.de>; Fri, 14 Jun 2024 00:36:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8DF710EBE7;
	Thu, 13 Jun 2024 22:36:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MXEiI+zu";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 371B210EBE3
 for <freedreno@lists.freedesktop.org>; Thu, 13 Jun 2024 22:36:28 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2ebe785b234so14693201fa.1
 for <freedreno@lists.freedesktop.org>; Thu, 13 Jun 2024 15:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718318186; x=1718922986; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0oXOVdRHNNnObgLlS+JRiMGauu/PqHbIdd79rxd9IUg=;
 b=MXEiI+zuLLU0aQpHusmE3iG2nHLVI3fGx9tnB4ONT6qAUd3kq6cNKZL99uy6UPLwRF
 UFtHPS2rP21Su1+Sf8umrxnFa8yn2IzI5vvLoNCDtSb12oKpji7rYQ/PRgbMkby/NL43
 9BjomWFh+ug6Vg49E4nedAQKuty4WuG5d/bpVNIzbZny27A6RR9Eme20dckX3BiNdW2W
 ZLBkjfgFxiTL8AOpnqWW3yVQkQK0Rke2bBpg1XHzds1IIW1MrQ9xiIdXruGHwPr4X6l/
 0CL0qM2mKfjkqlrw9Yq7HBqi8V5m5u0TiiTVR3WFAYFb7YOPtczNdAsatVRiPDQTn5CE
 9JSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718318186; x=1718922986;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0oXOVdRHNNnObgLlS+JRiMGauu/PqHbIdd79rxd9IUg=;
 b=Qfdd6XDkIQB8uyiIe3XgJWd+w0TkTQOGHAQbkatNcAQ8mgTxgFifvMrSIpDBw3DkNv
 AaBl4hwr+bzmYvykDB829dUbOCxnYEMhvqp7Vq1CVscBtMH5LYxADHljl/jEb36NhUEQ
 SWcDk8/aN9oyzqbBqozSxghOSygutPJ7wYrgbrLNztY4lhpn0K4p+FG4z/86xe0+BvQO
 eYSQLnqADxgodj1fTsDxrKe5qoIgKhlL4MOWzx2qHVi2Oygdu0nH3DkiC5G+5AuyAl0w
 bmygKIM+ea5fiYRsFCePuGES24UJU8KYwiHGsLzwGwZ0NuYyPdp1CYc65/P0Qa7qmImN
 q4Wg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeAhh90tpj1bQfQugwe7b4q3xw/36xtwmVaGh6txJM4y+mvPJxuElO9KlJrpeP2Yfy0pBZckrWlfDrQppv/ARBOwfyzWKZJ1rKxobjfL8P
X-Gm-Message-State: AOJu0YxrocpZStL/0mZEkZuOuAu6/CMrrNcZXnqA1XoFFB+8lIQUPv//
 APH8uuIl2v6SAgUU2NwG/3gSHuqPmKdFs/F6xi3TdLvatqMp05jQ7836cP+8x5E=
X-Google-Smtp-Source: AGHT+IGInrYLWQtlrQXLhQ4Fn4kMM+TkC/CKnLcZaun/7ZLsRJVyvJLpQDWNJbCrFaCALcESKJUw9w==
X-Received: by 2002:a2e:9b4b:0:b0:2eb:fded:a5c6 with SMTP id
 38308e7fff4ca-2ec0e5abf16mr6549171fa.51.1718318186257; 
 Thu, 13 Jun 2024 15:36:26 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec05c04a08sm3865191fa.29.2024.06.13.15.36.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 15:36:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 14 Jun 2024 01:36:04 +0300
Subject: [PATCH v3 3/9] drm/msm/dpu: drop dpu_format_populate_layout from
 dpu_plane_sspp_atomic_update
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-dpu-mode-config-width-v3-3-29ec4069c99b@linaro.org>
References: <20240614-dpu-mode-config-width-v3-0-29ec4069c99b@linaro.org>
In-Reply-To: <20240614-dpu-mode-config-width-v3-0-29ec4069c99b@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3293;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=b8kT7uNMoxyE9AV8a51TAAbK8IFnReILBdf2NuP/B5g=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBma3RlQ4b4UFtQ4hs13DaK5VdWZWyeacZvvgTSI
 rmJHgwS0xeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZmt0ZQAKCRCLPIo+Aiko
 1WqmCAChOYvOsWwRTgWuhRjG3petU3qQ51O4u5DNklC8Hq8IHtZ+fSuxnCiwdPdx7vWnSgqE+VX
 6LR9REmrxxt/uT+IrRUXNW8kReqN39GWOEG5prNQCXsIEKkiOIlfEnRVo9xp+hVKhpTbEO0egji
 auEjWflaqOQRkUq7HhCo3i5cfRPSRMhVewDvKndHSc9qEtCQpsWPPLOmv6/JdixnVbCEuWm3gWD
 Jnd7ShmuETOgQnzEzepbG54Cl0sgI29P8BYv+evqMKGx9Z2JLOaRAgt5M5/EsZcYG5cw+a/X/ba
 3GoliQbr8iURjjzbRMtiZDcBPWA5c/xB5bzdp2D9K7F9/jln
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

The dpu_plane_prepare_fb() already calls dpu_format_populate_layout().
Store the generated layout in the plane state and drop this call from
dpu_plane_sspp_update().

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 19 ++++---------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  3 +++
 2 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 1c3a2657450c..9ee178a09a3b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -647,7 +647,6 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
 	struct drm_framebuffer *fb = new_state->fb;
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_plane_state *pstate = to_dpu_plane_state(new_state);
-	struct dpu_hw_fmt_layout layout;
 	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
 	int ret;
 
@@ -677,7 +676,8 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
 
 	/* validate framebuffer layout before commit */
 	ret = dpu_format_populate_layout(pstate->aspace,
-			new_state->fb, &layout);
+					 new_state->fb,
+					 &pstate->layout);
 	if (ret) {
 		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
 		return ret;
@@ -1100,17 +1100,6 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 		msm_framebuffer_format(fb);
 	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
 	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
-	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
-	struct msm_gem_address_space *aspace = kms->base.aspace;
-	struct dpu_hw_fmt_layout layout;
-	bool layout_valid = false;
-	int ret;
-
-	ret = dpu_format_populate_layout(aspace, fb, &layout);
-	if (ret)
-		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
-	else
-		layout_valid = true;
 
 	pstate->pending = true;
 
@@ -1125,12 +1114,12 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 
 	dpu_plane_sspp_update_pipe(plane, pipe, pipe_cfg, fmt,
 				   drm_mode_vrefresh(&crtc->mode),
-				   layout_valid ? &layout : NULL);
+				   &pstate->layout);
 
 	if (r_pipe->sspp) {
 		dpu_plane_sspp_update_pipe(plane, r_pipe, r_pipe_cfg, fmt,
 					   drm_mode_vrefresh(&crtc->mode),
-					   layout_valid ? &layout : NULL);
+					   &pstate->layout);
 	}
 
 	if (pstate->needs_qos_remap)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index abd6b21a049b..348b0075d1ce 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -31,6 +31,7 @@
  * @plane_clk: calculated clk per plane
  * @needs_dirtyfb: whether attached CRTC needs pixel data explicitly flushed
  * @rotation: simplified drm rotation hint
+ * @layout:     framebuffer memory layout
  */
 struct dpu_plane_state {
 	struct drm_plane_state base;
@@ -48,6 +49,8 @@ struct dpu_plane_state {
 
 	bool needs_dirtyfb;
 	unsigned int rotation;
+
+	struct dpu_hw_fmt_layout layout;
 };
 
 #define to_dpu_plane_state(x) \

-- 
2.39.2

