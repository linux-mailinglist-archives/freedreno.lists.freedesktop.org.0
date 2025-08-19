Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61ACAB2B60E
	for <lists+freedreno@lfdr.de>; Tue, 19 Aug 2025 03:31:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACADA10E509;
	Tue, 19 Aug 2025 01:31:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Ug89Fm+8";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6380B10E501
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 01:31:38 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-323266baa22so3679090a91.0
 for <freedreno@lists.freedesktop.org>; Mon, 18 Aug 2025 18:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755567098; x=1756171898; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=IKfocSyum6c+ZXGva6cBv+Qtfqbf1qkUCIjZpV0tOYg=;
 b=Ug89Fm+8HzJ8D1dhCRZ28ev7UI2a56c1Lmploy9fP5daE8k/OGm/wb0eEQX5HDfYwQ
 Ih7AYps15zWV91/uIEepC8FShr2MARWf+tSnxLT8+o4+TIuypau6D03ahuZ1qY+MrhJd
 3YYWRwvQFbtheoueu5QWl9OFoa1/J6ve7xGnMzFd7dADKqlo1vOCsCy1HvlUH+h8jv3H
 p3/LNFZAi5F56sl5fZbn8NqOCWGYky6G00cRNfOquwabSBDEH2kgUsi3NitauqPzKIsn
 MOQt7BlgCTng9Crcobp/Fz2zP3mNTaQdCeQukbQF8d+k+MaV3G1qbfHc96G5JYY4v4dH
 B8oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755567098; x=1756171898;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IKfocSyum6c+ZXGva6cBv+Qtfqbf1qkUCIjZpV0tOYg=;
 b=jYMdeylectVVo63IbVziUWMv+MWC4I2nKEzJGzdMdGPzflUa9JuAkrgwfGcnmxVS5O
 dN6tvyixgiqgbU8Z5JC4hhyggzmM6BnCsKM5lBmc6pa07xccY23YCMc5HWmcG494fFbR
 YQb7oNJlSfByO+3Kksc0peCdY9jkH+r5eRUNNHM2mNomvhNyg08HFuXnYSOOo+Du9G1b
 ACcPFCbRU9UkZkSPFHEnjzoAw6BoFrOSZdbnJ+VsUS+uZCSucZlplWOy318kVchsXPAL
 7PtduFDs3O1BvXgQxokm/deW/TbLEiL37VcF9L3xiKVApWuwa79VXf9QRzQD64NP5yQg
 Ew/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXg9VKQKaUnCuy/ZcLRnBgaKKFvPOWhkcAkvvA40JAc62vng5oGmsnzp1rkfZ78or6zQPkrnIO3ML4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzfoO/yNJlBqe+vvadkIzEJ4B50zW5WvoR9nXVETE6JTo42iC5f
 TcRTzMW82CDC8PtefBP48HF+KZ8BsUcsST6D4kzfWWIs2XuY5Xo21usi/Tu+PZiPKPI=
X-Gm-Gg: ASbGncsJanDNiuEyYM2SLDwB36J4FrDP/c0/rh01+irv7+74+ywZSOCbvIFQCwQXi/8
 LHD3ijVlvz2WQvE/GRcv80BJWN2Xq5skfyJOZHNk38C0v857SUxyM303slkzOreiwPav+GeB9nU
 F2GY5l2xM4aVVHZj3Y+UK/dK6d6TJKp/lHozEwCz5WJ0aoncGA7c/Yl2Cuh3cl4p+3sU8A1sZQz
 1pz75Gz85NDJhbVlXtjed1ZjGNNhdIOg6KXGDAHJg6ihptKLBC1NHUnERpC7g6mnz2nFAZ4chk7
 Xs2Bjk00LYftV8xez3ObBf752L3jPnoGzDG79FI+9VwpUr2gQ03Pro/wx6QmH5aoDulOxh6jKjg
 Ij12Qht+DyJfASHJu+w==
X-Google-Smtp-Source: AGHT+IFBYheVkG50EzfDqBmExCSz/0gQ0qRfVgS3M2MFzRfVUBIs2TV5c2LXURvHwasnK59I+e9cWw==
X-Received: by 2002:a17:90b:560b:b0:312:1ae9:1525 with SMTP id
 98e67ed59e1d1-32476a4fd42mr1185311a91.8.1755567097649; 
 Mon, 18 Aug 2025 18:31:37 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.60.64]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3245e4faf80sm248637a91.5.2025.08.18.18.31.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Aug 2025 18:31:37 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 19 Aug 2025 09:31:00 +0800
Subject: [PATCH v15 06/13] drm/msm/dpu: Add pipe as trace argument
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-v6-16-rc2-quad-pipe-upstream-v15-6-2c7a85089db8@linaro.org>
References: <20250819-v6-16-rc2-quad-pipe-upstream-v15-0-2c7a85089db8@linaro.org>
In-Reply-To: <20250819-v6-16-rc2-quad-pipe-upstream-v15-0-2c7a85089db8@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755567061; l=2487;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=3U0bowJZD1UHEussz5PlKOBS3bAoQPdxBHy2P4TuJ5A=;
 b=QtXuzwdPZXPmSH7jcPO4RtVcjz3yHVBf6AK3KIZ9C03aGoPvZkYSeCO2CbNMJ9VuLR+PViSuS
 Xc1xCvUeCj6ALX+hkQm5o2z9ZVblfBguniBArs7KtUIcawlRZiYVb+1
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
index 9a40492e5aa961f7180ba4ac6c86e06fcccef8c2..cd0ec3edfe2fa8132e114bc1544c389141d1c1ec 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -419,7 +419,7 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
 
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

