Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C94AC3CC0
	for <lists+freedreno@lfdr.de>; Mon, 26 May 2025 11:29:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C3C210E30B;
	Mon, 26 May 2025 09:29:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Mok9Gybh";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3BE110E30D
 for <freedreno@lists.freedesktop.org>; Mon, 26 May 2025 09:29:05 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-7425bd5a83aso1455324b3a.0
 for <freedreno@lists.freedesktop.org>; Mon, 26 May 2025 02:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748251745; x=1748856545; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9JA927uWtYKHWYqLpVeeOOuDkS72N+Td94lU14Gx7eE=;
 b=Mok9GybherxZYGaY+QfPTz8g6I3PJ1zMnBjz2chL7mnNG/CAXtl1FDmMF5uuTN03Oq
 9/+0s4eQvjTQsX4sXtfjmU4gKIHSMrGvOd336oubLe+i8qWXCsnhco4tzHwN25WDgz9x
 FD7jpKk+R9OvT66tWcawPF03GnnGJCSyB+4xcuuvfi8u7GUPy+a/ump2VDcHqDqMkAC1
 HACLpfTyL+sf/Mve8wHiJOKzdlbfQgmZ68FhLN954aUPmhGC98KB6xoJnY5wrtmBO4P3
 2f5WwUXLPJXLcPjiwDDq6fcZre41gZSb97AhF8ygwv70oH6kVLvVA0R4NYJRLtKLKE0w
 iiaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748251745; x=1748856545;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9JA927uWtYKHWYqLpVeeOOuDkS72N+Td94lU14Gx7eE=;
 b=w8GqGyYaPbWvwM8HYPrTb9N7oSeaoFKaslaBciIJhhfeVNvP+CVUIp5XBa9VnRFrdR
 xkdqh08iZT+H8wXQtB/DdzOnxKZIJeynT4PX/ryW/L6Ct8vUzeVsmgDsfY9CxmxKZ/GE
 vG7UXc62YWLLF36bgaa9CaSvxS3mvn7psJ2Nna/g36VflKWjdghdXB8YwrPPwaN8JCTZ
 I2fzIz43aRpcWq9ae73PZwvtd7+J4EFSCAp//WQ8t5NOE4s2ZHcDfhwWcrnJQA6ZrTHb
 0smPEWZ2cjc2dBiLpcxX9KvjRdf0wQaXWJ299xfKBsz13xIeQeYQxjQYumzofpTOTybq
 ZsQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZGoC3oLxjfCexyBg1w8XElO80s6YDU7zGQ5IuFZqMZTFMoWOBFzILSCsGSuEh/Sn3vPRFPruPyzo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7D6eIxqZqOpuc9hB5ZrLEPRoOgFEh7ulltqLAUnZMyRB59dMK
 o6Cm3pUc0FF3rd2Wb98ChsB+VYOrU0XrqZl3O0IvSIjimmkTVUyinDS/cMSMwO4ug4Q=
X-Gm-Gg: ASbGncvgQO9Y60aL6+RgPq7cnQ97yIKckth6zEWMfFcG8zviIky6Vr7RQKCoq+zFoHK
 8dTROFiq3tFDHGrQ3be+qBJLVmYIXW0obNt+X3tw3534YffAa7y/TGC44HwPkKSYpHRP8Trhvo1
 LHh5lTSpgS9aDAfTOG7YOrfjEZK7VFdMEl9FCUxYqcH6j7aIKLG+8gQy9YGLlC+n+d4Y384MIHR
 fkEr4IL3zhJz5TECAbTVlZwH3t4n+KOmkkfsQobLuZsJCsT4uMHR/OwsEilRCMZV56jra/Wk524
 Bu1JPWL1/enETTnyNsdQ0yWrzXCLExAVEwe+Et4Kx3R9oJqgaQ==
X-Google-Smtp-Source: AGHT+IEfpaV5RMzOqtdfCNJc96vkUVwkfQfweeWxe8pOUvEMvoqIQ+2/dZVO44+go5U/uqEDw2lwKQ==
X-Received: by 2002:a05:6a20:7d9a:b0:203:bb3b:5f03 with SMTP id
 adf61e73a8af0-2188c20e04emr13542802637.6.1748251745296; 
 Mon, 26 May 2025 02:29:05 -0700 (PDT)
Received: from [127.0.1.1] ([104.234.225.11]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-742a9876e62sm17162393b3a.147.2025.05.26.02.28.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 May 2025 02:29:04 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 26 May 2025 17:28:23 +0800
Subject: [PATCH v10 05/12] drm/msm/dpu: Add pipe as trace argument
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-v6-15-quad-pipe-upstream-v10-5-5fed4f8897c4@linaro.org>
References: <20250526-v6-15-quad-pipe-upstream-v10-0-5fed4f8897c4@linaro.org>
In-Reply-To: <20250526-v6-15-quad-pipe-upstream-v10-0-5fed4f8897c4@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748251705; l=2487;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=AzK35uakUtRc9B2/mkaI31Hgz37sujAtB+6mV9+2mao=;
 b=usJtqEGDndm7ZVeIqseoGaTQlRsnJgcsJnE8Nc6A/ggxAaKwUmry4U4M0Qz9ydHPVAiMrtzK8
 V7EmjEpVEZhDBlUc+srM/VkGazsUR/SmWgJ+Tfq8Rz06SDFwMI1g6je
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
index 90941ff4104f620d1f4f18ec260418ee59dc16b2..3a7e030e1241a5115460a1e9d552341f8dff7d85 100644
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

