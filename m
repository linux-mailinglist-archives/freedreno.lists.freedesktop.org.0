Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 055E9A15375
	for <lists+freedreno@lfdr.de>; Fri, 17 Jan 2025 17:02:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D44F410EB26;
	Fri, 17 Jan 2025 16:02:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YZnlnDFi";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 886CA10EB26
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jan 2025 16:02:03 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-2163b0c09afso46149075ad.0
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jan 2025 08:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737129723; x=1737734523; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6q3cnHsEuZVr/zEMkZGR5hWRcSl2u4y1EXFLQUZer5w=;
 b=YZnlnDFikMY86fiL9y8KwtUv9WtNNiBxeRkuL+cxda12HOy9FuZNot5usqtIrVps+b
 PDAcXJbrAl+pbI4ByJnlXJ+zLqrUHbaX4vF+d3XK48FkPq/HBkawpIX9InGrdUZMxYNZ
 oxUsaWehtEQ2cEHITggDyEc9EBF7Vf5YUrPb/2qCt2o2IY1H1zLLORpRNolJrn+gLNdx
 Z7Q2vyKalTqgzE4wITrZ4Wg54GDBbz2u0A1MbRjOQpOOWrn0fr0g9OALL9r6LhR6/E6C
 Ew4ivgCr2McJ6mMHSQQesiZ3fjH92mjM0eWxjzUka5dDhk2dk1iCOvKCCiJ756yD0iR7
 7ZdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737129723; x=1737734523;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6q3cnHsEuZVr/zEMkZGR5hWRcSl2u4y1EXFLQUZer5w=;
 b=ku8iAWI4syeutwE0Rid2feIv7MX0bQh4AQvdTvGt9hsNtLn4wgLFQNklvTQpvqgNTV
 OM29+1LdnoLOWqiOTheGQdLc1F4N6eGSUGZYpDjBmkcirF+GYhwm0yXiqMiYG9Oy2tiu
 iD37jyYPQw04M0EithV/vuxKqGZOhqqHV/HgKsR9wmuMOUftmSP7bdN/B0H+PI8tJtdM
 5c8ly1nQX8hNBYarUybYCedKUV92bhLDGkusajK1EwlRUhsG+Zo1PKYq7jfX9nJ2tYfW
 teuJf0UBGpTkraFn2wxgX6IhoZeikVOJcTQl3jwZxEyIcKSRzIfUK2/s1fQsTI1Elt9O
 uIBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsT8j6vA5eL5jhi/LpkGoIeq4Up24s/33ydTKTnkl1GzxkSMcUHcisveIMaZLcdf13dJ6Xqxv6hGs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzu0CqKtBKYbk4QmoGsu2MVPPWEFf3p8Vs+IkyveRGnkATsmK+h
 567ehX3jfX1wIAFx9+Zm7ByFblFHQl84IQNWbCUnTwtCJPkIR8dGjJD+Hijo4P8gCAqkJ1qKYcB
 OaoOgCg==
X-Gm-Gg: ASbGnctcGL3sB1j11uQE9aAB20jmuBIwo/XhL7/21D+QSNc7IcURHHoJZZAs+lMK9p1
 HgRotvtcyzI2JjeSHQ84iK3/LSpTTX9D/zgQubcoSAkLSF9QOby2Fdp9uw/gBiklfpI+L2wS3R4
 a2+lLNzSN1njH3FMqCjNHEtrxprK0UYYeORFCQcVPFyMm2iUaoGqTQ4ERt3PCRJH2AsC1GeJLHg
 cgnBhzpxx6pumY6ViX5kD2SYdwXhEcTEbRXvumCyCD1YI8tdBWjjA==
X-Google-Smtp-Source: AGHT+IEcQx94Mhr70LcsHACJt01aBK1sXTAD0hC1NNZAWCxI3m1ywm3GiJUDoMGgIvOOBSiR6FgPyQ==
X-Received: by 2002:a17:902:ea05:b0:216:73a5:ea16 with SMTP id
 d9443c01a7336-21c35513c9fmr44604415ad.21.1737129723081; 
 Fri, 17 Jan 2025 08:02:03 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21c2d3e0df9sm17879755ad.196.2025.01.17.08.01.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 08:02:02 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Sat, 18 Jan 2025 00:00:52 +0800
Subject: [PATCH v5 09/15] drm/msm/dpu: Add pipe as trace argument
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-9-9701a16340da@linaro.org>
References: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-0-9701a16340da@linaro.org>
In-Reply-To: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-0-9701a16340da@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737129659; l=2323;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=P09VemQNzqBDdvHhQ5RoBT+r/Mx7DapnEfBXSAfFDaY=;
 b=a5IwoImLMpbIIHoR6/gSdDRdbT8GNTtFhMfeHAfal7uUPJ2p9/lZXhwUoxRcxtfSgN/HP0lGk
 f09rNyVtmcdDoME6RzCZQN+pbI22eVKMJBVzL8+bgJLYqxlRerYe9zI
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
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 41c9d3e3e3c7c..05abe2d05d8d8 100644
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
index 5307cbc2007c5..cb24ad2a6d8d3 100644
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

