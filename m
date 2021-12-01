Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5D846592F
	for <lists+freedreno@lfdr.de>; Wed,  1 Dec 2021 23:26:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E96276E8DA;
	Wed,  1 Dec 2021 22:26:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FA146E89D
 for <freedreno@lists.freedesktop.org>; Wed,  1 Dec 2021 22:26:41 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id p8so37573593ljo.5
 for <freedreno@lists.freedesktop.org>; Wed, 01 Dec 2021 14:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F6F3WPxfyMvxOGFVFzP69ATi4vGo49QVFI+qg3mn8Wg=;
 b=o7ErKwOInkuJ/TeFfq8CxMf8JeSlpaYibVC+EzB6kuYi1h5PjYv/+Yrrqmv/VC2Phz
 odHWNsKT6hMpfLMc+RUuoabaabA5QlUU/iOgucmBLoZ7KEAPz0TTkHtlFfhJN+dXZsG8
 YHKv4KeSD+tFlotOpoZhRwKoGiLoNPJ/TTekUHIyluUyyLXyXs5msB/Af0QFwp3dUh+g
 sJPKv0+uBpAhLzPUx960lGn3KJEzkjLzGt9UwxcSRyL2ET4gb4MYEiJIsYpGY+6PGI6z
 IAuPsfaIsHQruW0pjAH0x/bOr/TDE1llmDiVNrZRLTR8jfYNuq3GN6Lrt6oN+63jxLge
 plvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F6F3WPxfyMvxOGFVFzP69ATi4vGo49QVFI+qg3mn8Wg=;
 b=2/aKN0UzSpJLXCWmUFCtiHu5ghFAAV1sbtFuLnzqXi3LcgqGxka5yY9Pqgq3EK8nbm
 mohPhBDrkBaFLcvOCnyETd9b/bbAsO4EVVnIiaDcPAQUkC7rlGjqm+qx6QbgLEZF0jxA
 9gI6cDn8GNfIEFQEIqPs0zDMNliJVBgapf7C/jcjiVP3qZiEQ4K5E1KXxqlGcemeqRcl
 B/RZnHiOO3gRZB/m0g1Zvchvavezupiqk+GlwLxMdbi5Sojs/r69YBrxfWebkbQ390Lz
 bxuiD3cOI/w/mSWWykit5vWWo54LjicgVdsfr/muyruku+Dk+lHmipWI2R5bK9VSh6K+
 +HXA==
X-Gm-Message-State: AOAM533y03lidmq+jeyX+d69ZG6jHrSgEZoMfoDiKpgmBbUiGg1kULXS
 X81uArLOTJnJeNAeeVYKQKA0G1LigEOv9A==
X-Google-Smtp-Source: ABdhPJzaqWQVe9yEJqQno/GA6ULFW+0oG9KsRBzz6NDmEuN/UoAvkV7RdkxlLyqlf+MDd7EVPTyYKw==
X-Received: by 2002:a2e:b751:: with SMTP id k17mr7950866ljo.467.1638397599403; 
 Wed, 01 Dec 2021 14:26:39 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id u7sm117004lfs.144.2021.12.01.14.26.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 14:26:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Date: Thu,  2 Dec 2021 01:26:29 +0300
Message-Id: <20211201222633.2476780-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211201222633.2476780-1-dmitry.baryshkov@linaro.org>
References: <20211201222633.2476780-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v1 4/8] drm/msm/dpu: drop plane's
 default_scaling debugfs file
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Proper support for the 'default_scaling' debugfs file was removed during
DPU driver pre-merge cleanup. Remove leftover file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 6ea4db061c9f..f80ee3ba9a8a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -114,7 +114,6 @@ struct dpu_plane {
 	struct dpu_debugfs_regset32 debugfs_src;
 	struct dpu_debugfs_regset32 debugfs_scaler;
 	struct dpu_debugfs_regset32 debugfs_csc;
-	bool debugfs_default_scale;
 };
 
 static const uint64_t supported_format_modifiers[] = {
@@ -1398,10 +1397,6 @@ static int _dpu_plane_init_debugfs(struct drm_plane *plane)
 		dpu_debugfs_create_regset32("scaler_blk", 0400,
 				pdpu->debugfs_root,
 				&pdpu->debugfs_scaler);
-		debugfs_create_bool("default_scaling",
-				0600,
-				pdpu->debugfs_root,
-				&pdpu->debugfs_default_scale);
 	}
 
 	if (cfg->features & BIT(DPU_SSPP_CSC) ||
-- 
2.33.0

