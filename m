Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB1CA4C491
	for <lists+freedreno@lfdr.de>; Mon,  3 Mar 2025 16:15:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 225B710E466;
	Mon,  3 Mar 2025 15:15:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="My9TLY3R";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AD1610E464
 for <freedreno@lists.freedesktop.org>; Mon,  3 Mar 2025 15:15:51 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-2232aead377so88716575ad.0
 for <freedreno@lists.freedesktop.org>; Mon, 03 Mar 2025 07:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741014951; x=1741619751; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qYqL5aquEf9QP1MU+9dPpzn37KZ182hWurvxtiyryKc=;
 b=My9TLY3RmIyj5bJto5CYHgK6sLNNvGHZ9aigFZwJWg3RRgj3zvj+RIUNt2ei+qYPoU
 vlQ1UdOmYZwqA+IpGVVsNwbryt1K4gQQsVZteMca1U4zEHXWM7zAhPzYG8GRKKL1IMzh
 xrW5WfigzcQ8qcBXHCsS5rPvo7tobk2D8b2jOnmMzq6jWsgjmpI3ct57Aqeq86X0yWLh
 mgzBS9KpeI4MSsrxc8lQ3eSUCMJkThe4aP1WljCvMZj0160ScJTbx47Nqo5bsTjGO1nA
 StSBD6xrwwaVk6txazSz+Y3imoqH3lvL1C+1YrPRmBQ5YxDsd/zYLs7WwdIGjzxCibVM
 hsLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741014951; x=1741619751;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qYqL5aquEf9QP1MU+9dPpzn37KZ182hWurvxtiyryKc=;
 b=a961FcZzVzgXhGBqpd7/n3K7RwNv96rtz/noNLAlE0gNoUGrO5NJNbolKr66IrXVtE
 KzdoOTh4WlrL5tiM0Wr/0X0qbgn83bIZLVa78tlM7ZJGRFLE2FTKkO53hAmiaufdkXKN
 Fh6JYuHpHKXAi36RusqhxaCBwK80wm+7mzR0f8KWQLbVmXWDALfIX/artpkv0JFnKbq+
 5HS1h78ehaeBksz+LlcJjW9aN5nkIsb05bgpaAhj4hPt+pHsAzOTpEA8fp0/0w0OLqkS
 Csv6C5Q1YXcnNRd9tsjB8pnMPM5yCObHLfybX7zTzmd+CWd89urODkZJ6ae5HsnlJU0m
 0Ouw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaY1dqRi3la61bxnHoIRTqyT5KSVElrTBDexSRlPn6EJnSM+dILLig5GiklGVDE4gXF3HLmKtZmbQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyA01NBxUrom235AqCtykGr82mDcfda2u3J8zfsTXI6LNX3H+Id
 T+ugxv+PXieO8RJsmHmKIPCq2ypRplubp0PClfEtLov5akcTa20eD7OZgfMoNoA=
X-Gm-Gg: ASbGncvTEgnerTfEBa5KYTP9FajOxG11tsXS4X3At6WlraOhhmmEzmFkRb9moK+R0DR
 OSgtL7asHg8zunmGKruyi4r9lJsusAw6FYx+YfuiXpaQKtrieAmUtleki3GF3rVWgcutbr0o22U
 j2JCF7X51XcbaZ4UOTXqykhY9q48mqbfBucSXkD1tBBydOgjYO0MkkvomwWSfmntwRUUs+Yzifi
 DV3ZxVyr/LJh0nKtxAxHH0T78RDo6eg/mEXPKrfWq7OGyKz6L8jxffd9oOmI+yEzmu3IU1Byhb8
 NEMnod/RU+vuRT6aAFJgeSOVKlw3RdM1aFxOud0ckQ==
X-Google-Smtp-Source: AGHT+IHBMkeJ/K/xmZ0r+6e1iC6/N1q8Tpd5ZgTdrqZ75hZ98XnPHX+o0gzUBYeec6SHcEus8rnwfA==
X-Received: by 2002:a05:6a00:139c:b0:736:5e6f:295b with SMTP id
 d2e1a72fcca58-7365e6f2a10mr4343635b3a.12.1741014951078; 
 Mon, 03 Mar 2025 07:15:51 -0800 (PST)
Received: from [127.0.1.1] ([112.64.60.252]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736584b3cffsm1851984b3a.4.2025.03.03.07.15.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 07:15:50 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 03 Mar 2025 23:14:38 +0800
Subject: [PATCH v8 09/15] drm/msm/dpu: Add pipe as trace argument
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-9-eb5df105c807@linaro.org>
References: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-0-eb5df105c807@linaro.org>
In-Reply-To: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-0-eb5df105c807@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741014878; l=2487;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=CYxXjoGPBo4uvT8jsEkwbX8WYPTbGIdNFxJtu3SWxQs=;
 b=tEkg4RUT7oIGfsE4cuD/GwxCmFq8r/pBRQl9NiRcBh8QSHfXdU+84EoL4yepFYoNSj4QpB8Dh
 i4x5sqCQIuNBKjB1Q4RTZE+R5Y4emQpw31G4+A4LPEc+J5kUhrVA0gI
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

