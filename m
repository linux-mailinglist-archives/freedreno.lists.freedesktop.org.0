Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFB82C041E
	for <lists+freedreno@lfdr.de>; Mon, 23 Nov 2020 12:20:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84FD389F97;
	Mon, 23 Nov 2020 11:20:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E882D89FA9
 for <freedreno@lists.freedesktop.org>; Mon, 23 Nov 2020 11:20:08 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id p19so12927525wmg.0
 for <freedreno@lists.freedesktop.org>; Mon, 23 Nov 2020 03:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O0idKtGJTZ3eV2wLeGxjJ8blqSNYptwaWGPv5a5zic4=;
 b=hQxod/4O674zszb8RygkHLWu7NdAN+sjg/VYnQ1fWPLJQi+nO7oS/Q9B2PMoGUnfll
 u+d3BZWc4kp0yQUQXXMUoHnDNrgLelIdYT28LHhDGxoX17+8/oHPznTGWlh3N4BrKygd
 DMplyGtPJGFYBKof4mNSv2Y/5DuUfaJ7csCtOnuuOCNMMvI4IU7xiL7+hqdJaFoqHKiU
 /JzeUWNEJxi6vtabgHU5bE4Th+FL0Yuyw0sGYSYN8IiQykCkkczthgeTADQHfxbzuqfL
 ILU95YU9qbtYsl9Myx7i1hvj/fStJMZ5Y/HqcLvEIJb0pbliVeEyEV7HxZu/3HmtvbdP
 huqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O0idKtGJTZ3eV2wLeGxjJ8blqSNYptwaWGPv5a5zic4=;
 b=K4newF53HR3+ncWFPDNARlSEszQoc45HyLO/DOKc6LIZ34mbLC+PU/hyjxvkruTQ/f
 gjlV+j3jUqPcf24zwGY609FzwviwZpsXKQoE8Qz4JV6f6KjhV/sDJHOL3cXnQdMyFsPI
 pts9SRP26DvWSTDZsPZnmmIwAdk88zeeyOnxDXkCjbOYppkN37TQaCjYXa3cAIyKqq6Z
 zocE3mG8zUL3f1Tj3owg2adPMrdCstzvk/4adLPqRowf8403khqb4ZYtKrOkyZmyJFjC
 /06YPFinHs91pIW5pcOAWKqsli2HVvueuRKlYP2kqX1z9p3AoNl/IQK5T7BoUHBv+Ae7
 zdcg==
X-Gm-Message-State: AOAM531HX+hGalsfxx08hfd4Aa3Odin1hzURjySnnq69SO9Wq2n9kEwS
 EpQfgwQ5PUhILY+H987paLZc/A==
X-Google-Smtp-Source: ABdhPJyY8lH30XYo80J+rnqQXr9BnzfsFnx27ygSUV7MIdA3y1Hs37Qs509j3j5OsS3eU3WorwBbrA==
X-Received: by 2002:a1c:f017:: with SMTP id a23mr23705686wmb.56.1606130407603; 
 Mon, 23 Nov 2020 03:20:07 -0800 (PST)
Received: from dell.default ([91.110.221.218])
 by smtp.gmail.com with ESMTPSA id n9sm16317290wmd.4.2020.11.23.03.20.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:20:06 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Mon, 23 Nov 2020 11:19:11 +0000
Message-Id: <20201123111919.233376-33-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201123111919.233376-1-lee.jones@linaro.org>
References: <20201123111919.233376-1-lee.jones@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 32/40] drm/msm/disp/dpu1/dpu_vbif: Fix a couple
 of function param descriptions
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c:150: warning: Function parameter or member 'dpu_kms' not described in 'dpu_vbif_set_ot_limit'
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c:150: warning: Excess function parameter 'vbif' description in 'dpu_vbif_set_ot_limit'

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
index 5e8c3f3e66256..7e08f40e7e6fe 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
@@ -140,7 +140,7 @@ static u32 _dpu_vbif_get_ot_limit(struct dpu_hw_vbif *vbif,
 
 /**
  * dpu_vbif_set_ot_limit - set OT based on usecase & configuration parameters
- * @vbif:	Pointer to hardware vbif driver
+ * @dpu_kms:	DPU handler
  * @params:	Pointer to usecase parameters
  *
  * Note this function would block waiting for bus halt.
-- 
2.25.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
