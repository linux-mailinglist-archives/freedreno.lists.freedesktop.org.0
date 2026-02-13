Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qK9XGTw7j2nHNAEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Fri, 13 Feb 2026 15:54:52 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF71D1374C2
	for <lists+freedreno@lfdr.de>; Fri, 13 Feb 2026 15:54:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58F5510E816;
	Fri, 13 Feb 2026 14:54:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="q+mkZMRy";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22C4310E815
 for <freedreno@lists.freedesktop.org>; Fri, 13 Feb 2026 14:54:49 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-354bb7d2cb1so1532407a91.0
 for <freedreno@lists.freedesktop.org>; Fri, 13 Feb 2026 06:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770994489; x=1771599289; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+ROwhGAC+uM/YVDPTZ7SWeJKccnx9vcVwkY+8qPNgeE=;
 b=q+mkZMRyG8Xdn8/nyPfsUXX/3srIREjuBYePFBjLKT+p9Rnkrt0ShDttkAz3Xb6tR0
 qgzNNrR0ppsL0Q6RkiQmCoLNFcgigZeNyjZUTE4XZtVkvGrqWsSjNfFr19bF/9zACv85
 nfN3hGtEKFEyv9ze628C3sA6sxHe35v7o+L3mhIT/5HxKLgrYx7z6+rMafApAfVcVg2Z
 LgXN+WNwHViGXJLe9zZGkaSJqxd3dg7rSAw+nN5Oq7ymN3Z7kmhMpMl4YkwFR8DszM0o
 iiL6Ml7X7i+7Jo/WeOlU8HVbRdshc+fQEP5epgw2gLKRxW+zhW+NsxtKnW2C2/7nt79z
 v2vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770994489; x=1771599289;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=+ROwhGAC+uM/YVDPTZ7SWeJKccnx9vcVwkY+8qPNgeE=;
 b=iSwp2E6qy8snFh7O73zwMib8Q9pAfK67sFGGUCFIMArtPav12r3Pape55WgWQSf6Na
 ZfsJdxZ8DCpSbKmlmYuaFLwxqPDuPh93WALozd+k3ldzGtrT4L7qesJy9la5palGLv+K
 zBHQKUkJC8X53oyoROTcmiKF/15zy4d8+bjE6CT4ldVsqOKn6V77Qr8834zjk6TCmRiQ
 zn+UmTkMuaYcsQKsYfWWs/SIQzwN3QrWC/gJdHAK29gfpbgUHdbcgFD4gQxzdZ8SO0hB
 WXcuhe/pGufQ27fye9IOD+HvcMPlEGOh2Q5PF79+ZCZtCVExqRCWRnyVxAfUsF6ANUmn
 6PNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwiGqg8VpoTDCYocbJp3OFXbOKoeFBJt6LIb9SjY8XE8C0JXb0Dr96MgJaCoLilQLqLSa5cFMj8ww=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/0TW2MdpjTmhl8b+gkNLdlAkXb1Zd+t/S/duYQnRRFphyPoos
 jE/R+MxJSBKIEAN+qQWN7Vl6gHMQridnwAKYf9D5mNftwA9Wr4cIhuS1yCGDIeisIVQ=
X-Gm-Gg: AZuq6aI3UBdClLbGo6Ys7YrmW1dqYE+mXgACLls1qK91RDRkLpQDvk43PvR7FLPJlRG
 CtUrF9qo8MBP5G0Az7MvvNqDM1oooY5c5fN5CA+HGpFqtWnEL3ANhZuyiyv6P8FJ7rJ5pWfMWQl
 J+ccrOH5Phwyh9IJY0mXut/1z9Ysy8gFJ7Xi+OPhwYiaK3lmNdaeRpqBlGaOhalAUB0so4ClwFv
 FE4JHEh/kQL4y4RobCuy0q/ba7O9T/XSbOLzqRy2kGq/w4OC7xQ4EZef1S/x6R3ApltQ7Nh/VTx
 4s8bTiTBX2TLMNWD7HF/GCe+ywG9OEwCzL3uLAdZvP98KzUSMbD529d4VCTK17X1EvG5FTIPj3M
 WOCrGqReJVqKtssqR7dmglS6DKpe1bYiRg7ZTB4lMJ8TjHkWMyUIFWfz0kFQOH0V4SHG4/EeL0D
 ZJVRZ4wR9F1nBM2Vv2MCvhsGZi6SFzu4q1fVAXE+kEHjaOiDn6e2y93Dkb8h9PRF57ACE=
X-Received: by 2002:a17:90b:3c03:b0:34c:7212:7a67 with SMTP id
 98e67ed59e1d1-357b518b298mr278498a91.12.1770994488494; 
 Fri, 13 Feb 2026 06:54:48 -0800 (PST)
Received: from [127.0.1.1] (210-61-187-172.hinet-ip.hinet.net.
 [210.61.187.172]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3567eba9b2esm8814759a91.9.2026.02.13.06.54.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 06:54:48 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 13 Feb 2026 22:54:25 +0800
Subject: [PATCH v18 1/4] drm/msm/dpu: Extract plane splitting into a
 dedicated function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-msm-next-quad-pipe-split-v18-1-5815158d3635@linaro.org>
References: <20260213-msm-next-quad-pipe-split-v18-0-5815158d3635@linaro.org>
In-Reply-To: <20260213-msm-next-quad-pipe-split-v18-0-5815158d3635@linaro.org>
To: Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770994473; l=3875;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=0lT7RY7u/q/OvDkV4Xni5NMBZEHeI41cYul1o1LxOgY=;
 b=x3weaFm2PlNMn3CfL4RIoYr1Kac9Rcr4tlBVb35PAKV9faheYU9eInS4/w7+FocmSsmDz96H1
 i/T4SkPRpHuD3sgBTd56hxtfXhSSxA78YpK1OCyYy+qbvIfHGpKQEly
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:abhinav.kumar@linux.dev,m:lumag@kernel.org,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:robin.clark@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:jun.nie@linaro.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org];
	FORGED_SENDER(0.00)[jun.nie@linaro.org,freedreno-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[jun.nie@linaro.org,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[freedreno];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linaro.org:mid,linaro.org:dkim,linaro.org:email]
X-Rspamd-Queue-Id: DF71D1374C2
X-Rspamd-Action: no action

dpu_plane_atomic_check_nosspp() currently handles both plane
validation and plane splitting. For better simplicity and to
facilitate future refactoring, move the splitting logic into
its own dedicated function.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 51 ++++++++++++++++++++++---------
 1 file changed, 36 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 9b7a8b46bfa91..66f240ce29d07 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -821,13 +821,8 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
 {
 	int i, ret = 0, min_scale, max_scale;
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
-	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
-	u64 max_mdp_clk_rate = kms->perf.max_core_clk_rate;
 	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
-	struct dpu_sw_pipe_cfg *pipe_cfg;
-	struct dpu_sw_pipe_cfg *r_pipe_cfg;
 	struct drm_rect fb_rect = { 0 };
-	uint32_t max_linewidth;
 
 	min_scale = FRAC_16_16(1, MAX_UPSCALE_RATIO);
 	max_scale = MAX_DOWNSCALE_RATIO << 16;
@@ -850,14 +845,6 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
 		return -EINVAL;
 	}
 
-	/* move the assignment here, to ease handling to another pairs later */
-	pipe_cfg = &pstate->pipe_cfg[0];
-	r_pipe_cfg = &pstate->pipe_cfg[1];
-	/* state->src is 16.16, src_rect is not */
-	drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
-
-	pipe_cfg->dst_rect = new_plane_state->dst;
-
 	fb_rect.x2 = new_plane_state->fb->width;
 	fb_rect.y2 = new_plane_state->fb->height;
 
@@ -879,6 +866,34 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
 		if (pstate->layout.plane_pitch[i] > DPU_SSPP_MAX_PITCH_SIZE)
 			return -E2BIG;
 
+	pstate->needs_qos_remap = drm_atomic_crtc_needs_modeset(crtc_state);
+
+	return 0;
+}
+
+static int dpu_plane_split(struct drm_plane *plane,
+			   struct drm_plane_state *new_plane_state,
+			   const struct drm_crtc_state *crtc_state)
+{
+	struct dpu_plane *pdpu = to_dpu_plane(plane);
+	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
+	u64 max_mdp_clk_rate = kms->perf.max_core_clk_rate;
+	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
+	struct dpu_sw_pipe_cfg *pipe_cfg;
+	struct dpu_sw_pipe_cfg *r_pipe_cfg;
+	uint32_t max_linewidth;
+
+	if (!new_plane_state->visible)
+		return 0;
+
+	/* move the assignment here, to ease handling to another pairs later */
+	pipe_cfg = &pstate->pipe_cfg[0];
+	r_pipe_cfg = &pstate->pipe_cfg[1];
+	/* state->src is 16.16, src_rect is not */
+	drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
+
+	pipe_cfg->dst_rect = new_plane_state->dst;
+
 	max_linewidth = pdpu->catalog->caps->max_linewidth;
 
 	drm_rect_rotate(&pipe_cfg->src_rect,
@@ -910,8 +925,6 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
 				    new_plane_state->fb->width, new_plane_state->fb->height,
 				    new_plane_state->rotation);
 
-	pstate->needs_qos_remap = drm_atomic_crtc_needs_modeset(crtc_state);
-
 	return 0;
 }
 
@@ -1129,6 +1142,10 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	if (ret)
 		return ret;
 
+	ret = dpu_plane_split(plane, new_plane_state, crtc_state);
+	if (ret)
+		return ret;
+
 	if (!new_plane_state->visible)
 		return 0;
 
@@ -1169,6 +1186,10 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
 	if (ret)
 		return ret;
 
+	ret = dpu_plane_split(plane, plane_state, crtc_state);
+	if (ret)
+		return ret;
+
 	if (!plane_state->visible) {
 		/*
 		 * resources are freed by dpu_crtc_assign_plane_resources(),

-- 
2.43.0

