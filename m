Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AA4369E6C
	for <lists+freedreno@lfdr.de>; Sat, 24 Apr 2021 03:52:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCC6F6EC67;
	Sat, 24 Apr 2021 01:52:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B4426EC64
 for <freedreno@lists.freedesktop.org>; Sat, 24 Apr 2021 01:52:40 +0000 (UTC)
Received: by mail-qv1-xf35.google.com with SMTP id er3so16225202qvb.6
 for <freedreno@lists.freedesktop.org>; Fri, 23 Apr 2021 18:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UcY6Lu3u2CeikGQuheX4lmNqK8mFEGOt+ZAL+7yU8Dc=;
 b=Jauv+uflVnnVf1sTvIAuyx6lYbj+w3YEeYLPo30ZDB/TwQ6WEYsR8KqnHRlXLb4ub8
 SDsx7nH6WGGhkVhCfo0mwxG/SS1BUu821BVZwt7bQvJyAq+BUyN7U37Rwyx8t/1djF5a
 KANU7RYbWXYohZK0kWujMdPCE5/CkQ+JLc0D84W4IhL3UKcvxiCD5rVzfA0N/knyjZtM
 9k9JJDltJ8qzQXvWT/zm/c1vEDMTmTw2AqSzpwJvOUWdYx0OhJD2INBO+Vpt+xk6qHof
 UjLXc1WQXSGIqtFky0qu7VK0YYh7OvwP4/Y7qQZ3uNN67SaqiKmVn7rm0EM8xGhNMIF/
 t6Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UcY6Lu3u2CeikGQuheX4lmNqK8mFEGOt+ZAL+7yU8Dc=;
 b=D3FVtN2qKdxV+Hhazitz11rC+5+9qqHJ6wmE1sJbJu5fi3sLJFhbDqKyrrZpyhYrtY
 S0nuIpN/ky7e7K7PcNZz7hXznNHNOYK+ct/cgbFmhFgm8ZbJuFBI0GDSPiVfQ7J9qpNS
 3gqBvcw9B4uf56Zlvbv1EiP4g4KUGF0PdUdku0TYY8233EXQ37ATSfTQtEH0tfjyqGTS
 44Wvpu5zsSgBX9GfvpOB+UksIpJ06y8kQRX3pWWgONtIwQs7RczpUA8aHj9g/Zrjc/yO
 eftIwnN5Lt9XITkIxJnago7najJgb54TQVNGV+RlxrwbdRd5Bg4sv5MvoXIl8oOvTBlv
 4lXQ==
X-Gm-Message-State: AOAM532ykVjfxwCtIapvXMphYNHwbZBWFGx522APaIFFRuUZNNoIFXzk
 6MU34VNMYY9bfzNOYTwivPBFcLRR84lfOD53A82TPw==
X-Google-Smtp-Source: ABdhPJyiOw7t62EyD1lV8XxKfvCZk/P/OPh7hCDSf08Jt2OMZoHDkUXqS9tnOiWkNCEYbON1Z5kV/g==
X-Received: by 2002:ad4:5543:: with SMTP id v3mr7495429qvy.32.1619229159334;
 Fri, 23 Apr 2021 18:52:39 -0700 (PDT)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id r5sm5389259qtp.75.2021.04.23.18.52.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 18:52:38 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Date: Fri, 23 Apr 2021 21:49:26 -0400
Message-Id: <20210424014927.1661-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Subject: [Freedreno] [PATCH] drm/msm: fix LLC not being enabled for mmu500
 targets
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
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Eric Anholt <eric@anholt.net>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

mmu500 targets don't have a "cx_mem" region, set llc_mmio to NULL in that
case to avoid the IS_ERR() condition in a6xx_llc_activate().

Fixes: 3d247123b5a1 ("drm/msm/a6xx: Add support for using system cache on MMU500 based targets")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 1716984c68a8..727d111a413f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1153,10 +1153,6 @@ static void a6xx_llc_slices_init(struct platform_device *pdev,
 {
 	struct device_node *phandle;
 
-	a6xx_gpu->llc_mmio = msm_ioremap(pdev, "cx_mem", "gpu_cx");
-	if (IS_ERR(a6xx_gpu->llc_mmio))
-		return;
-
 	/*
 	 * There is a different programming path for targets with an mmu500
 	 * attached, so detect if that is the case
@@ -1166,6 +1162,11 @@ static void a6xx_llc_slices_init(struct platform_device *pdev,
 		of_device_is_compatible(phandle, "arm,mmu-500"));
 	of_node_put(phandle);
 
+	if (a6xx_gpu->have_mmu500)
+		a6xx_gpu->llc_mmio = NULL;
+	else
+		a6xx_gpu->llc_mmio = msm_ioremap(pdev, "cx_mem", "gpu_cx");
+
 	a6xx_gpu->llc_slice = llcc_slice_getd(LLCC_GPU);
 	a6xx_gpu->htw_llc_slice = llcc_slice_getd(LLCC_GPUHTW);
 
-- 
2.26.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
