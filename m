Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B76CA45F33
	for <lists+freedreno@lfdr.de>; Wed, 26 Feb 2025 13:33:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8D5210E2D6;
	Wed, 26 Feb 2025 12:33:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="f8BMfNWK";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4928B10E8DC
 for <freedreno@lists.freedesktop.org>; Wed, 26 Feb 2025 12:33:23 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-2fc33aef343so13457784a91.1
 for <freedreno@lists.freedesktop.org>; Wed, 26 Feb 2025 04:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740573203; x=1741178003; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qYqL5aquEf9QP1MU+9dPpzn37KZ182hWurvxtiyryKc=;
 b=f8BMfNWKmwVb1JVCRPe2OuSAg6/mzk51Q4Pk1b5WmN8bBTS4/n7odnmsMj12yylwS1
 W+vcVdDjvDC7x6ScqhmCT/+5NpL9U5LmxWeuHcRynWfYS4mUKSmC2/JZJJ77dDD387A5
 k6RCO8WZzjs3UzUA+JCEQYc9dP9vOy5iTQlnCjQ6PwNWWuH9HCPz6GTWQWldi5N0snSo
 F1sp2dF/IyffW8YKdhcl1lwr8Pmpk9SWj6GredmlGGLaqL6iA6VNRNZxmUqBGGwnDSUY
 CpLUgIG6yuC3uz9WojzyfOiiPKE3ziPCGCD8kFHH8rxJQGklzgM8re99NIoGSc/wWZs3
 nlkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740573203; x=1741178003;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qYqL5aquEf9QP1MU+9dPpzn37KZ182hWurvxtiyryKc=;
 b=De1rs+kg6/6AT2bCWgIgraZzXCMOk10oIVNGDBGAJlC4yV+eObnqBY0eH3fEo/AeBC
 KX7UqHz7jGeWQ88VcXYyeD25aZDVnuVP0Bv6o6ti8dDPu0iZGmN7lN+gmy86FgmBmJ9P
 svOZYjNQL6gBvsc6QFUsPALvwLbZru33nFxlSrdumV56ZzdZchvmd4EdTp5AcgAIZRgZ
 HxwyhSydnB4QHHGAUbhF1BnRs3/jYpE6bddT8V7LoOK9Q9vYY882IdgPXHwG4V4PCzfS
 Gc1xwgqzD9YzjeVu8o/SKdybJVc3BXtf9mh211xW40M1yi6jI8xJz5HZvyhynAeebxI4
 HR/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVd8IiF9QbewiygxCiZuDWGiJpfM58+eXQ+awtwrrfW8YJ+BVbENcCJJybTuT1RKjXNZFiN+sv+Nuw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYlLe3sTV8aG1SUQk95S0rB8kzodz4CxVx3ChGJtC9BphLdnU+
 HZHveYD/JvtPXI3u9eHlKjvSI4r/oEmxEO24WcRDlMXP2g3VnduiJFRbA376zsg=
X-Gm-Gg: ASbGncs94pkpjY3vTfonvIGiwH2fw3AiIs+aNt5TbhHWXoC9L7jrWWeJFu8a9EFMmJp
 uX6bUdU8uap15WZMYw/RNHb4SNu5BjYUbtQ0tA0CE1/VjNbHyBuF6A+PZmJLavMsDPkoPwyuakd
 kQ+z+CE3/iZb3Psq6AW/ISvpwEpgR6IEtQ9uzpJrGQhvO+Y18mdpwCBe1pZN4nZ32JylXPXN2Dv
 HOGvyUtHAzOSM4u9xbbuWChni+FLJKtjPUQ/5ZuLYfF6cgdB14cjtO336uusmf9ZEyy2L07oe2Z
 g4rCPpomUm6FY96TMeOPp5k=
X-Google-Smtp-Source: AGHT+IHsRWCrq2DiG2E4HZHRAkbTAVuZlq04N9UMt8g8DJ5VwjH+rWpXJAvGnGGD9rx1X5GMyzEL8w==
X-Received: by 2002:a17:90b:5448:b0:2f4:432d:250d with SMTP id
 98e67ed59e1d1-2fe7e32cf33mr4933980a91.21.1740573202921; 
 Wed, 26 Feb 2025 04:33:22 -0800 (PST)
Received: from [127.0.1.1] ([112.64.61.158]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fe825d2ed3sm1352479a91.29.2025.02.26.04.33.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 04:33:22 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 26 Feb 2025 20:30:58 +0800
Subject: [PATCH v7 09/15] drm/msm/dpu: Add pipe as trace argument
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-9-8d5f5f426eb2@linaro.org>
References: <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-0-8d5f5f426eb2@linaro.org>
In-Reply-To: <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-0-8d5f5f426eb2@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740573128; l=2487;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=CYxXjoGPBo4uvT8jsEkwbX8WYPTbGIdNFxJtu3SWxQs=;
 b=RCEoNk4L9l3LKa0iix2tyvH/toWrQAEbeknDx1LS/JCWX4A1NI74brWuzlp5oH8dGTkQokopm
 kdpAmyj+JE/BPlFbByYzFch1XJFHBCwR8Mq+6wB7t+1Z/M84ncvPMVc
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

Add pipe as trace argument in trace_dpu_crtc_setup_mixer() to ease
converting pipe into pipe array later.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 41c9d3e3e3c7c0c74ac9007a1ea6dcdde0b05f97..05abe2d05d8d81fbaac58cf0b298abb8d2164735 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -411,7 +411,7 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
 
 	trace_dpu_crtc_setup_mixer(DRMID(crtc), DRMID(plane),
 				   state, to_dpu_plane_state(state), stage_idx,
-				   format->pixel_format,
+				   format->pixel_format, pipe,
 				   modifier);
 
 	DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d multirect_idx %d\n",
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
index 5307cbc2007c5044c5b897c53b44a8e356f1ad0f..cb24ad2a6d8d386bbc97b173854c410220725a0d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
@@ -651,9 +651,9 @@ TRACE_EVENT(dpu_crtc_setup_mixer,
 	TP_PROTO(uint32_t crtc_id, uint32_t plane_id,
 		 struct drm_plane_state *state, struct dpu_plane_state *pstate,
 		 uint32_t stage_idx, uint32_t pixel_format,
-		 uint64_t modifier),
+		 struct dpu_sw_pipe *pipe, uint64_t modifier),
 	TP_ARGS(crtc_id, plane_id, state, pstate, stage_idx,
-		pixel_format, modifier),
+		pixel_format, pipe, modifier),
 	TP_STRUCT__entry(
 		__field(	uint32_t,		crtc_id		)
 		__field(	uint32_t,		plane_id	)
@@ -676,9 +676,9 @@ TRACE_EVENT(dpu_crtc_setup_mixer,
 		__entry->dst_rect = drm_plane_state_dest(state);
 		__entry->stage_idx = stage_idx;
 		__entry->stage = pstate->stage;
-		__entry->sspp = pstate->pipe.sspp->idx;
-		__entry->multirect_idx = pstate->pipe.multirect_index;
-		__entry->multirect_mode = pstate->pipe.multirect_mode;
+		__entry->sspp = pipe->sspp->idx;
+		__entry->multirect_idx = pipe->multirect_index;
+		__entry->multirect_mode = pipe->multirect_mode;
 		__entry->pixel_format = pixel_format;
 		__entry->modifier = modifier;
 	),

-- 
2.34.1

