Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCB09F240B
	for <lists+freedreno@lfdr.de>; Sun, 15 Dec 2024 14:10:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70E0510E1BD;
	Sun, 15 Dec 2024 13:10:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BqblZiN/";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5BBD10E21F
 for <freedreno@lists.freedesktop.org>; Sun, 15 Dec 2024 13:10:27 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-54025432becso3239301e87.1
 for <freedreno@lists.freedesktop.org>; Sun, 15 Dec 2024 05:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734268226; x=1734873026; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=W2S/zehdszrYe/6HUukpuBZ2KgVEa4+0Sundmnl7SoM=;
 b=BqblZiN/XtIz4O0lctRX561GIaBuOxm2mAxI0kPTugaYc/kdcj628K8/84U/KyRJsg
 /C9D3OQsgBmp2nNphc+cQr3xAtgCvv8mE9YMJsl0hXOMTEoRMkGdN/7TxMvZ08l/Baer
 Q8Wz4aVaaHjuznVN+n3gbBaPOOlJJ7GxtI44nrBYA/qBmZf9zgv09ZpeopiH5YnV0QG0
 FoxHDqLRpjvideGoi2fr/2V0pDRogJqguv2PpZdfGT53DsEETIhLTZ2R11uXgE8xW2Kd
 eOhY8fINrPzRS1WZdlVdUOuagybozB+Gmkm6sH0zNiApmZxxZdQ6jnmS57Zhs+/FKhCD
 ApaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734268226; x=1734873026;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W2S/zehdszrYe/6HUukpuBZ2KgVEa4+0Sundmnl7SoM=;
 b=ZwQkbjkimJUmPhVySJOKEybtybBHMSmGqhfbjo/nVG1zhJ/j7snJ6OI35WkQzHqeH5
 Yz7JAdEhuGzweV7T7h40PrYM3naPQbzPopelXklVUAyhRduZdVL2MHUoYyvHEs/WwWJc
 SaWURoN1T6gFP80vXUjnSxRP3EkWdqk8+jrYPLC9UY9e6bHaFR3qGh/r0wR5MffufvVm
 YlAwkWzdB6ObksTtZKTGVFwPBEydhuZ3R1G8IPoiJwUiwbTbkeSzpJOBU7gjoQ1dttOt
 nfL1A5sGfm0U2ikRC2JgehqxLMt0hMb1TfREO2vxxcdW/p90KTR3kcuGjXVcguoMYbLL
 fPCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUn82nL1zB55i+rDSiaX/opTG/+7hdP5AgIOBQ8GXUOOcC8dwSzYyc9OFyHm+ERCPIFFrt+XH9lSec=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKRN98zXMGIyYbytuD6i7le0gAkerOtiFprYqv4Ea0Dd/1gXuK
 dRMchaN8znRIXbuexJVM/RzN0RMyZtRebo+kvg3U5ZWVnMy4wD7VSJzIENFqDvg=
X-Gm-Gg: ASbGncuKuP9xmt6JJiGte4J7bd0MSTnu2MnfAqgSKo7hjZdnKisVFyJjj5RqogzIN3J
 pcoRbq5AzhphZ6tZ77dd+bdDfPYTQWDxNnR75qaL4TBRCh0yoisQJCxAE+cAKwoXLcuP6/HNtCC
 0jU8v7sY8dVG7pcvzJVPfWkaNBUBYxzFCTwuXEvM6IU+BrIf6W7iagaQsPjr1jek55XR6NFjvg6
 Z/Em8o+qd9ApJWaMN1SOnLEFlcpTr3xiIpCBPuuDMfGrM8oAMX8vzbsZ47KzIp8
X-Google-Smtp-Source: AGHT+IGVXS883nXIuZYBsjXJ3OOjbGyP2J9bpQihhqu0wXhqHhv9fTudoRolKvxSbMvzbaKlzoMdEg==
X-Received: by 2002:a05:6512:230d:b0:541:1c48:8c17 with SMTP id
 2adb3069b0e04-5411c488e3emr2593586e87.46.1734268226033; 
 Sun, 15 Dec 2024 05:10:26 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54120c25160sm483590e87.281.2024.12.15.05.10.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2024 05:10:24 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 15 Dec 2024 15:10:23 +0200
Subject: [PATCH v5] drm/msm/dpu: allow sharing SSPP between planes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241215-dpu-share-sspp-v5-1-665d266183f9@linaro.org>
X-B4-Tracking: v=1; b=H4sIAD7VXmcC/x3MMQqAMAxA0auUzAZsMSpeRRxKjTZLLQ2KIN7d4
 viG/x9QLsIKk3mg8CUqR6qgxkCIPu2MslaDa11nnSVc84kafWFUzRkH8tT3zMGOBDXKhTe5/+G
 8vO8HskNmkGAAAAA=
X-Change-ID: 20241215-dpu-share-sspp-75a566eec185
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9978;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=43Y1vOVC8uxKpG9I2AzBkfgbAZrp6UPf+I1kZ/3et7g=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnXtU/oBRhQAngE4atbmuLwF+T90jBSI7rJVr2N
 UHIzu3YawOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ17VPwAKCRCLPIo+Aiko
 1S3RCACO4lwh2qjAvmyM0cOg5o+Ls5w+bE7PNR4NEatp4ZD93a/35rO/s4mqMPvUnIWgtIxmYfF
 9BRXW7gPZ2qOlhBngyfwPQ1vkcPFqqIBSc1uiMVTKGbB7Bvey+Qt1ac7S18YLHGUnUu8A1pzIIG
 siTPJbJlRA+H+yzSIhIUAWuWSzVxjFqRqpf+us3kJlXJWt1i5geYyHo6UXWflTJA6F/J885MtkP
 wvg4ly3wUon4JjXQMA8B0TzPE9xj/b/P8hY4OHpKuP4+z91k/SKrQElEagtF0eVAPCIJuvIbMcf
 KhwXF/++wEU9pZAFuyIxY17u8ikHjJw23IHuPw0GqpUqjitD
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

Since SmartDMA planes provide two rectangles, it is possible to use them
to drive two different DRM planes, first plane getting the rect_0,
another one using rect_1 of the same SSPP. The sharing algorithm is
pretty simple, it requires that each of the planes can be driven by the
single rectangle and only consequetive planes are considered.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
This patch has been deferred from v5 of virtual wide patchset to
simplify the merging path. Now as the wide planes have been merged, pick
up the patch that allows sharing of the SSPPs between two planes.
---
Changes since v4:
- Rebased on top of the current msm-next-lumag
- Renamed dpu_plane_try_multirect() to dpu_plane_try_multirect_shared()
  (Abhinav)
- Link to v4: https://lore.kernel.org/dri-devel/20240314000216.392549-11-dmitry.baryshkov@linaro.org/
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 153 +++++++++++++++++++++++++-----
 1 file changed, 128 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 098abc2c0003cde90ce6219c97ee18fa055a92a5..2fd21d27df4741a8d942f9c9bae989f319cfb8d8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -887,10 +887,9 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
 	return 0;
 }
 
-static int dpu_plane_is_multirect_parallel_capable(struct dpu_hw_sspp *sspp,
-						   struct dpu_sw_pipe_cfg *pipe_cfg,
-						   const struct msm_format *fmt,
-						   uint32_t max_linewidth)
+static int dpu_plane_is_multirect_capable(struct dpu_hw_sspp *sspp,
+					  struct dpu_sw_pipe_cfg *pipe_cfg,
+					  const struct msm_format *fmt)
 {
 	if (drm_rect_width(&pipe_cfg->src_rect) != drm_rect_width(&pipe_cfg->dst_rect) ||
 	    drm_rect_height(&pipe_cfg->src_rect) != drm_rect_height(&pipe_cfg->dst_rect))
@@ -902,10 +901,6 @@ static int dpu_plane_is_multirect_parallel_capable(struct dpu_hw_sspp *sspp,
 	if (MSM_FORMAT_IS_YUV(fmt))
 		return false;
 
-	if (MSM_FORMAT_IS_UBWC(fmt) &&
-	    drm_rect_width(&pipe_cfg->src_rect) > max_linewidth / 2)
-		return false;
-
 	if (!test_bit(DPU_SSPP_SMART_DMA_V1, &sspp->cap->features) &&
 	    !test_bit(DPU_SSPP_SMART_DMA_V2, &sspp->cap->features))
 		return false;
@@ -913,6 +908,27 @@ static int dpu_plane_is_multirect_parallel_capable(struct dpu_hw_sspp *sspp,
 	return true;
 }
 
+static int dpu_plane_is_parallel_capable(struct dpu_sw_pipe_cfg *pipe_cfg,
+					 const struct msm_format *fmt,
+					 uint32_t max_linewidth)
+{
+	if (MSM_FORMAT_IS_UBWC(fmt) &&
+	    drm_rect_width(&pipe_cfg->src_rect) > max_linewidth / 2)
+		return false;
+
+	return true;
+}
+
+static int dpu_plane_is_multirect_parallel_capable(struct dpu_hw_sspp *sspp,
+						   struct dpu_sw_pipe_cfg *pipe_cfg,
+						   const struct msm_format *fmt,
+						   uint32_t max_linewidth)
+{
+	return dpu_plane_is_multirect_capable(sspp, pipe_cfg, fmt) &&
+		dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidth);
+}
+
+
 static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
 				       struct drm_atomic_state *state,
 				       const struct drm_crtc_state *crtc_state)
@@ -1001,6 +1017,69 @@ static bool dpu_plane_try_multirect_parallel(struct dpu_sw_pipe *pipe, struct dp
 	return true;
 }
 
+static int dpu_plane_try_multirect_shared(struct dpu_plane_state *pstate,
+					  struct dpu_plane_state *prev_pstate,
+					  const struct msm_format *fmt,
+					  uint32_t max_linewidth)
+{
+	struct dpu_sw_pipe *pipe = &pstate->pipe;
+	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
+	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
+	struct dpu_sw_pipe *prev_pipe = &prev_pstate->pipe;
+	struct dpu_sw_pipe_cfg *prev_pipe_cfg = &prev_pstate->pipe_cfg;
+	const struct msm_format *prev_fmt = msm_framebuffer_format(prev_pstate->base.fb);
+	u16 max_tile_height = 1;
+
+	if (prev_pstate->r_pipe.sspp != NULL ||
+	    prev_pipe->multirect_mode != DPU_SSPP_MULTIRECT_NONE)
+		return false;
+
+	if (!dpu_plane_is_multirect_capable(pipe->sspp, pipe_cfg, fmt) ||
+	    !dpu_plane_is_multirect_capable(prev_pipe->sspp, prev_pipe_cfg, prev_fmt))
+		return false;
+
+	if (MSM_FORMAT_IS_UBWC(fmt))
+		max_tile_height = max(max_tile_height, fmt->tile_height);
+
+	if (MSM_FORMAT_IS_UBWC(prev_fmt))
+		max_tile_height = max(max_tile_height, prev_fmt->tile_height);
+
+	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+
+	r_pipe->sspp = NULL;
+
+	if (dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidth) &&
+	    dpu_plane_is_parallel_capable(prev_pipe_cfg, prev_fmt, max_linewidth) &&
+	    (pipe_cfg->dst_rect.x1 >= prev_pipe_cfg->dst_rect.x2 ||
+	     prev_pipe_cfg->dst_rect.x1 >= pipe_cfg->dst_rect.x2)) {
+		pipe->sspp = prev_pipe->sspp;
+
+		pipe->multirect_index = DPU_SSPP_RECT_1;
+		pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
+
+		prev_pipe->multirect_index = DPU_SSPP_RECT_0;
+		prev_pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
+
+		return true;
+	}
+
+	if (pipe_cfg->dst_rect.y1 >= prev_pipe_cfg->dst_rect.y2 + 2 * max_tile_height ||
+	    prev_pipe_cfg->dst_rect.y1 >= pipe_cfg->dst_rect.y2 + 2 * max_tile_height) {
+		pipe->sspp = prev_pipe->sspp;
+
+		pipe->multirect_index = DPU_SSPP_RECT_1;
+		pipe->multirect_mode = DPU_SSPP_MULTIRECT_TIME_MX;
+
+		prev_pipe->multirect_index = DPU_SSPP_RECT_0;
+		prev_pipe->multirect_mode = DPU_SSPP_MULTIRECT_TIME_MX;
+
+		return true;
+	}
+
+	return false;
+}
+
 static int dpu_plane_atomic_check(struct drm_plane *plane,
 				  struct drm_atomic_state *state)
 {
@@ -1098,13 +1177,14 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
 static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 					      struct dpu_global_state *global_state,
 					      struct drm_atomic_state *state,
-					      struct drm_plane_state *plane_state)
+					      struct drm_plane_state *plane_state,
+					      struct drm_plane_state *prev_plane_state)
 {
 	const struct drm_crtc_state *crtc_state = NULL;
 	struct drm_plane *plane = plane_state->plane;
 	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
 	struct dpu_rm_sspp_requirements reqs;
-	struct dpu_plane_state *pstate;
+	struct dpu_plane_state *pstate, *prev_pstate;
 	struct dpu_sw_pipe *pipe;
 	struct dpu_sw_pipe *r_pipe;
 	struct dpu_sw_pipe_cfg *pipe_cfg;
@@ -1116,6 +1196,7 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 							   plane_state->crtc);
 
 	pstate = to_dpu_plane_state(plane_state);
+	prev_pstate = prev_plane_state ? to_dpu_plane_state(prev_plane_state) : NULL;
 	pipe = &pstate->pipe;
 	r_pipe = &pstate->r_pipe;
 	pipe_cfg = &pstate->pipe_cfg;
@@ -1134,24 +1215,42 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 
 	reqs.rot90 = drm_rotation_90_or_270(plane_state->rotation);
 
-	pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
-	if (!pipe->sspp)
-		return -ENODEV;
+	if (drm_rect_width(&r_pipe_cfg->src_rect) == 0) {
+		if (!prev_pstate ||
+		    !dpu_plane_try_multirect_shared(pstate, prev_pstate, fmt,
+						    dpu_kms->catalog->caps->max_linewidth)) {
+			pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
+			if (!pipe->sspp)
+				return -ENODEV;
 
-	if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
-					      pipe->sspp,
-					      msm_framebuffer_format(plane_state->fb),
-					      dpu_kms->catalog->caps->max_linewidth)) {
-		/* multirect is not possible, use two SSPP blocks */
-		r_pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
-		if (!r_pipe->sspp)
+			r_pipe->sspp = NULL;
+
+			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+
+			r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+			r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+		}
+	} else {
+		pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
+		if (!pipe->sspp)
 			return -ENODEV;
 
-		pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-		pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+		if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
+						      pipe->sspp,
+						      msm_framebuffer_format(plane_state->fb),
+						      dpu_kms->catalog->caps->max_linewidth)) {
+			/* multirect is not possible, use two SSPP blocks */
+			r_pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
+			if (!r_pipe->sspp)
+				return -ENODEV;
 
-		r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+
+			r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+			r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+		}
 	}
 
 	return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
@@ -1165,6 +1264,7 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
 {
 	unsigned int i;
 	int ret;
+	struct drm_plane_state *prev_plane_state = NULL;
 
 	for (i = 0; i < num_planes; i++) {
 		struct drm_plane_state *plane_state = states[i];
@@ -1174,9 +1274,12 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
 			continue;
 
 		ret = dpu_plane_virtual_assign_resources(crtc, global_state,
-							 state, plane_state);
+							 state, plane_state,
+							 prev_plane_state);
 		if (ret)
 			break;
+
+		prev_plane_state = plane_state;
 	}
 
 	return ret;

---
base-commit: d82c9281189d2b27642ede2760db495379503b86
change-id: 20241215-dpu-share-sspp-75a566eec185

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

