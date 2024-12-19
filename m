Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91AA89F762A
	for <lists+freedreno@lfdr.de>; Thu, 19 Dec 2024 08:50:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AD2910ECAE;
	Thu, 19 Dec 2024 07:50:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="z6Fj5SEP";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26E7710ECAE
 for <freedreno@lists.freedesktop.org>; Thu, 19 Dec 2024 07:50:38 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-21628b3fe7dso4113515ad.3
 for <freedreno@lists.freedesktop.org>; Wed, 18 Dec 2024 23:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734594638; x=1735199438; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6QACPLHbU96vR5yGnVxi+OCvdrWdXj07n9rpK8uCOHE=;
 b=z6Fj5SEPVynuRz1sJxyctzzc88JT9e7KNzSg0VqCaLBoozJAVLvS6gDcE1jTKI9Vbw
 ZB2HJhC8IItIVg++MtZLS2zGPfWVMylgRxogyF6hO7ojgvRgLIxOpjkl1ESoVYfKRg6u
 f8HlKMiFCHNwuJtG3dIi44FjGTHfC5gsJXtKrWokniYPB1Kt4z5v1Ar/UpezoUy666qu
 vBj+YkG2B0F7cO0+CUwQvJxz6fF03Fqaj/UeQzf5aZyFG2qVRdP4dbyarq4RFlRE3/q3
 psS1kS+YP0mvXj7HmuLUcS2Rvgiuyk/0suswLA64bqtfsUa01VkSucX+NtGvBeGbYX6B
 Z5wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734594638; x=1735199438;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6QACPLHbU96vR5yGnVxi+OCvdrWdXj07n9rpK8uCOHE=;
 b=jhxzC2unlnQCgG+SSeom1aCzqDdILRg9AVnDFd6/9yg27llDDbM0Eunc00j1aC2xX/
 365UW+WMr/3EzK4qCy6rkXDe/m31rn6/ohG4kN+K3DUQ3Gw+CjWA+yUScHxDwAyhAELg
 wSQiJmHj04AGwTx+Om0foXfOdCaF7LA1/bbivMZtB8LVZ3oCNCsKtrpmH2iF4Re/Cjh9
 9c71qGKlMHU1ZgFpHhDWuFvVHpmZWnWvIfTQKKiXBmhRZvGzt0Fl/KIQBD2Hr1boSAs2
 TQw+wAhen/QDMOXPBb6H5EsjvpxpUyLetZMqKy0iQNdFxrsg8/3TmrhQsiptogLx0fHA
 RobQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMBYdW3362TYhExm/JHgipk5BPvLbUT/kdVXa64LZJLHbQtyxTFMnQNQClOmtRP2wSeFEonEweX+w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZP8ShJmja33iQdPkUJI3fC0kr8TdNWH06eBzURNUV5oWbwvwj
 RykhbIseZBUrvSO78x4dcysO1EQs30IIB0If3HRP2V6m0wVlN2mIaaL2DC5qJl4=
X-Gm-Gg: ASbGnct2cUGH26NDmg3Wee7Y15N3bPIOJzEkwHm9gH77Ds6bgoBTjfZmZsaRs+doiwX
 NjpmysGgs7v+GmZ59NRkUve6772ovOTgY3OF/ZgIjAES5Kb9c0Qz3yRHr2yhgDmym1OAw1/TXe/
 eK1C27vgSQ8vKLngVA2xliUYDgMziBwtcEVTXQlbV3X/HgVhFX81kJy73hOluNf5DcZrXGN8jKy
 3IWht8urtrQt5FNB3yckPvsaLJRnzt2rKcuZeFUwfsuDiB78YqAIg==
X-Google-Smtp-Source: AGHT+IFw74Cgq7jywjWum0/vvzCufwreSULGiGLizUIz+reETmaHjliDxBUvaVtVLedA+GKu2zL2mg==
X-Received: by 2002:a17:903:18b:b0:216:2a36:5b2a with SMTP id
 d9443c01a7336-218d727dd8cmr83172895ad.47.1734594637757; 
 Wed, 18 Dec 2024 23:50:37 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-219dc97432dsm6784445ad.110.2024.12.18.23.50.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 23:50:37 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 19 Dec 2024 15:49:28 +0800
Subject: [PATCH v3 10/15] drm/msm/dpu: Add pipe as trace argument
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-10-92c7c0a228e3@linaro.org>
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
In-Reply-To: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734594568; l=2230;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=6ZtdpxhXB/rhz3hCMyuJbmAdwfkWhh1P6PW5UxiXJuE=;
 b=DKvn2dcBo0LBd5J6yg1T8LHUwMwZBR8+U8I5tnUqhsqeeWjSyF2K1WgAOy2JmiekoigPcSUOf
 7AmgzuaRziLAakLiBOKe45if2lXog+ljyKv2gKGx/xOlvKMcfT04XH6
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

Add pipe as trace argument to ease converting pipe into
pipe array later.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 72ed8749cd716..6841d0504d450 100644
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

