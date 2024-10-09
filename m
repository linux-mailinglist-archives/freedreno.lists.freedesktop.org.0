Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 709299963CE
	for <lists+freedreno@lfdr.de>; Wed,  9 Oct 2024 10:51:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DB7110E6A4;
	Wed,  9 Oct 2024 08:51:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="F5zXvJup";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D55E10E6A0
 for <freedreno@lists.freedesktop.org>; Wed,  9 Oct 2024 08:51:07 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-2e09f67bc39so5465698a91.1
 for <freedreno@lists.freedesktop.org>; Wed, 09 Oct 2024 01:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728463867; x=1729068667; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Xeuc89940OyZEzmfZGsShlcWun218secJztkD+/huVg=;
 b=F5zXvJupvZbVwXkjSSIqKwLPw3YFevOhIzf0m//A5NP2XoA6BVb36FA0m5m49eG20t
 BSnH8wIY071er8A6YLL5Zej82rKHW4G1VIQD+LxqGENvibVMxjlAwBudofGoSMyGDoUx
 VO4n/S5DycuA3V+6A66MpG8DLs3gcCTYUzTONrSxoRWZlRcR7NDDd2iVYV+P44eChYId
 y4XnXgvueRiSH0L/OBRCWTAl7kpmr3wNX1qoZ2iEQpZhKofOTSereDhKgtLz8KPfKqJQ
 ux4dtD2zu4sTZb/6AOv3iGFRgVzZjSN5PFCW151pq0aOQ9ZxZeesBerVl6sC5rzkbyiT
 wdhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728463867; x=1729068667;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xeuc89940OyZEzmfZGsShlcWun218secJztkD+/huVg=;
 b=sVV2xDGcni66xPDVvGsknUrl/e7XGZ5Dxl2XTNU9Ji5GS5sUHgyGXaD2WNM3wsQvTG
 qDtzmtb44h22tkNuxBpMu3G8IWWpndx6xrMbJf2WuLAdkZ0k4uO6nte5TbhI+EB5mZHK
 zHuK1ftlTH7XR4sUQ8AtadUo5wHlgtD2QbelvOfzO55IMuKPsDUCzTeDgCJxARhKUwPz
 Ci7LpE6B1mrNoznOKAGfTCiwLmRRUZgK/Iyood0wU7gq/RRdz0D+peGEOoya+6mz7IcG
 897uWtMzL2QRZV5SQp3aDGmh3SV60HGjRHpwFdIbBrCkDLsW8XclRWECSm+PsX7hGhFE
 eQog==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgNMm84BjDKe0b02ZbltFZ/mQuuFIUWI64reJYIez2+HZf9+hBMcc4/4TQRIkRkyFAg3AiyHbXEiE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBjYiuyX5Dwyx731v3kYqdAPrvTAiql+NBHvjweOrBxQj29Q9/
 KNkge9WuUPsGa1/gEXLK2CJ0TKTahS4TrMWq5+P+gFJO7GqgiWjO6RYUucXZPb4=
X-Google-Smtp-Source: AGHT+IF0F7RtB5DS5euGqhy7U7rhzvEMjBeGrvubLOfvxfogUs8BIv6homsplq8ODB4C0o2n6DXgtQ==
X-Received: by 2002:a17:90b:1104:b0:2e2:9522:279e with SMTP id
 98e67ed59e1d1-2e2a25247e0mr2201199a91.31.1728463867148; 
 Wed, 09 Oct 2024 01:51:07 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e2abad236esm898157a91.10.2024.10.09.01.51.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 01:51:06 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 09 Oct 2024 16:50:21 +0800
Subject: [PATCH v2 08/14] drm/msm/dpu: update mixer number info earlier
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-8-76d4f5d413bf@linaro.org>
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
In-Reply-To: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728463820; l=1729;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=zBBzWdWsfyqBIiT9wbwcVNQEKc8lnnOJ9lwiSkj7ngI=;
 b=olKDHeGrWWSragjDEGtR+qG7l03ad9g8wQu7Scz79ICx2dg8oxIEAOpVwrukiQ+/+oPfeExdI
 7EvMgTVIa78DCYbucqzqXSwayrVfw07ZG1dzLBNsZo+LiJkdMYaFHoI
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

Update mixer number info earlier so that the plane nopipe check
can have the info to clip the plane. Otherwise, the first nonpipe
check will have mixer number as 0 and plane is not checked.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index dfe282c607933..68655c8817bf8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -638,6 +638,7 @@ static int dpu_encoder_virt_atomic_check(
 	struct dpu_global_state *global_state;
 	struct drm_framebuffer *fb;
 	struct drm_dsc_config *dsc;
+	struct dpu_crtc_state *cstate;
 	int ret = 0;
 
 	if (!drm_enc || !crtc_state || !conn_state) {
@@ -662,6 +663,8 @@ static int dpu_encoder_virt_atomic_check(
 	dsc = dpu_encoder_get_dsc_config(drm_enc);
 
 	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state, dsc);
+	cstate = to_dpu_crtc_state(crtc_state);
+	cstate->num_mixers = topology.num_lm;
 
 	/*
 	 * Use CDM only for writeback or DP at the moment as other interfaces cannot handle it.
@@ -1170,7 +1173,13 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	}
 
 	cstate->num_dscs = num_dsc;
-	cstate->num_mixers = num_lm;
+	if (cstate->num_mixers != num_lm) {
+		if (!cstate->num_mixers)
+			DPU_ERROR_ENC(dpu_enc,
+				      "mixer number %d is not as expected %d\n",
+				      num_lm, cstate->num_mixers);
+		cstate->num_mixers = num_lm;
+	}
 	dpu_enc->connector = conn_state->connector;
 
 	/*

-- 
2.34.1

