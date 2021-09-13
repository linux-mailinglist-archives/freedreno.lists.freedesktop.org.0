Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95986409B7B
	for <lists+freedreno@lfdr.de>; Mon, 13 Sep 2021 19:58:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAC5A6ECE7;
	Mon, 13 Sep 2021 17:58:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 497616ECEE
 for <freedreno@lists.freedesktop.org>; Mon, 13 Sep 2021 17:58:35 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id ay33so11486205qkb.10
 for <freedreno@lists.freedesktop.org>; Mon, 13 Sep 2021 10:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M+6WaFPuJNdulE2a71MWNvhB4HPvAyDmtnLHBKmekCU=;
 b=PKMyuyd9+YkMiZsAsexpW3DBB1F7oyi/nm4F/w7UslRR542ivJ5iyxBN+WbK56b7mo
 LQ67aEy5Vx2EQZr877k1fxvFMSikgFMlYqLwLZJV3q9iC0RPq4zGvjBGjLuWKaDj8D7i
 wfsi///GS5B+pNWTH+JB5XFmDuMlpk6vMDQ+bnpIDj3ay47Mf7pz3K+ovl9IBedLuinV
 qJZEP47RH9/V91WEdeDSR5/KxkvZwrd+VhZkL9ubhg8xxyBu5ggwhBlyykt+42VnirI0
 jIa28TMnbWzrrCc7nnj1Q2J79i3U9I7+bO6Eh78elFVSNGF+3nOI3bM3CgSxm/7hd9Xi
 GERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M+6WaFPuJNdulE2a71MWNvhB4HPvAyDmtnLHBKmekCU=;
 b=qPYXEfiEqB1Sqfb7RPgTZ6hauuv0oL7wkpabjJ+ZgzXa6JkTtrbmR11PyAZLb8ddr1
 IymG48EijQXnXi6fnF8bnOmyzaXXioC8X9eqFskVBzLedX/+08Ogf2VrlmGosBnG8r5E
 lyHrY5LdF78cbDRk88v4yu7TSAIciElRAfPBCeYDNisk2I8AuxwwDrJXRdo8yTLdnj2e
 l0YtMkPJDk80Q9ZB/av9CGtXYLO0UZnTL1r4xeaFJgwPRvUevIT7xEH7754EYybcFwKx
 xEsuY5rkVtLwjdZpAE1POi+yrGKWLzSW70OI8QDS3Zgcb/ntb4RCrnw6XLPB0AnAbT26
 yQRQ==
X-Gm-Message-State: AOAM5326rhU3CHseXh5B3XVT9YEQGOOurib09w58TTaGOQOkBERitpLn
 xWpdGnZf57L3lhVU0dSEMvqd3w==
X-Google-Smtp-Source: ABdhPJwl+Td2WMm8W4F3OofmEcObzvIvucw3dtD/kh41IeSvVHSFPiXgVUnsjCdQKbfmKKO+iNP+8A==
X-Received: by 2002:ae9:ef96:: with SMTP id d144mr870327qkg.9.1631555914473;
 Mon, 13 Sep 2021 10:58:34 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id p123sm5989677qke.94.2021.09.13.10.58.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 Sep 2021 10:58:34 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Cc: Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org
Date: Mon, 13 Sep 2021 13:57:40 -0400
Message-Id: <20210913175747.47456-10-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210913175747.47456-1-sean@poorly.run>
References: <20210913175747.47456-1-sean@poorly.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 09/14] drm/msm/dpu: Remove useless checks in
 dpu_encoder
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

From: Sean Paul <seanpaul@chromium.org>

A couple more useless checks to remove in dpu_encoder.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 0e9d3fa1544b..984f8a59cb73 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1153,10 +1153,6 @@ static void dpu_encoder_virt_enable(struct drm_encoder *drm_enc)
 	struct msm_drm_private *priv;
 	struct drm_display_mode *cur_mode = NULL;
 
-	if (!drm_enc) {
-		DPU_ERROR("invalid encoder\n");
-		return;
-	}
 	dpu_enc = to_dpu_encoder_virt(drm_enc);
 
 	mutex_lock(&dpu_enc->enc_lock);
@@ -1203,14 +1199,6 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
 	struct msm_drm_private *priv;
 	int i = 0;
 
-	if (!drm_enc) {
-		DPU_ERROR("invalid encoder\n");
-		return;
-	} else if (!drm_enc->dev) {
-		DPU_ERROR("invalid dev\n");
-		return;
-	}
-
 	dpu_enc = to_dpu_encoder_virt(drm_enc);
 	DPU_DEBUG_ENC(dpu_enc, "\n");
 
-- 
Sean Paul, Software Engineer, Google / Chromium OS

