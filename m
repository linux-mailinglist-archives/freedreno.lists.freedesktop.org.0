Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7DC3C648C
	for <lists+freedreno@lfdr.de>; Mon, 12 Jul 2021 22:02:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C806389DFA;
	Mon, 12 Jul 2021 20:02:14 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE50989DD3
 for <freedreno@lists.freedesktop.org>; Mon, 12 Jul 2021 20:02:12 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id m2so16222780wrq.2
 for <freedreno@lists.freedesktop.org>; Mon, 12 Jul 2021 13:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=InVnPLy1h+Gn4xVBn/fC7AZt6grH88jqC7oOozTIXb8=;
 b=X+SJ3p0ESK4TQAQ/qH/+BAUMT6xrms/nqyPKdH0HxK3ym7UQ3p95EVQZ7XCWfzGR/y
 fkmaGRWWf7ruyInATjXDAqzkFIUWmEheqOY9qU0bBEDLG3unVw+cktegJiy4Ce9efes5
 3RgAX2dj1ORkeX7jkS+IWjkhq297tm+bn7wxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=InVnPLy1h+Gn4xVBn/fC7AZt6grH88jqC7oOozTIXb8=;
 b=kKL9RuRlqumTsEekx9Fsek3cza6i7Zzpx6piacuiG93uSqAWywAqLl3e/d28Lch0UP
 o83wcmvknw8FS4mXdkJ/M4aQuXSAhdoN9HwEySIPGroALq2ztCc5ZabAHMU/LCIsi6jt
 aNRDqrTEq3fcR/udYlt1xeHHFKeTjsUn7LUIpjapQT+IRzMc/rcEYRmQjmwZoLu6S57l
 NQsI52//GZv8a1x612Wnl6k+AKQGYt5XC5m2tyr3fyOLooMMVwjtV6t5Unq1WAk+1DUZ
 O+HsFhcJ/hfjXPO0CfSP8sYRLTOUrFEh3Thucpq//bXNTp2BMg2VMjSYY976tsKUzMZV
 /s6g==
X-Gm-Message-State: AOAM530NsUmAa3LVoB5RWHhVhKnPKN56ofaNDXCKX2txqsqnQRlEBLYo
 aB1H1U6DQkzuZsHzmQZp548Ckw==
X-Google-Smtp-Source: ABdhPJyJSV9zsmZBMr7dsHfxfEOPFY/zcUhgikRQEnDQpbjq7rFktFp+vN9flFcWF5qevrFsmcL8wA==
X-Received: by 2002:a5d:6786:: with SMTP id v6mr870277wru.290.1626120131603;
 Mon, 12 Jul 2021 13:02:11 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l14sm9858221wrs.22.2021.07.12.13.02.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 13:02:11 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Date: Mon, 12 Jul 2021 19:53:48 +0200
Message-Id: <20210712175352.802687-15-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210712175352.802687-1-daniel.vetter@ffwll.ch>
References: <20210712175352.802687-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v4 14/18] drm/msm: Don't break exclusive fence
 ordering
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
Cc: freedreno@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org,
 Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <sean@poorly.run>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

There's only one exclusive slot, and we must not break the ordering.

Adding a new exclusive fence drops all previous fences from the
dma_resv. To avoid violating the signalling order we err on the side of
over-synchronizing by waiting for the existing fences, even if
userspace asked us to ignore them.

A better fix would be to us a dma_fence_chain or _array like e.g.
amdgpu now uses, but
- msm has a synchronous dma_fence_wait for anything from another
  context, so doesn't seem to care much,
- and it probably makes sense to lift this into dma-resv.c code as a
  proper concept, so that drivers don't have to hack up their own
  solution each on their own.

v2: Improve commit message per Lucas' suggestion.

Cc: Lucas Stach <l.stach@pengutronix.de>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index b71da71a3dd8..edd0051d849f 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -306,7 +306,8 @@ static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
 				return ret;
 		}
 
-		if (no_implicit)
+		/* exclusive fences must be ordered */
+		if (no_implicit && !write)
 			continue;
 
 		ret = msm_gem_sync_object(&msm_obj->base, submit->ring->fctx,
-- 
2.32.0

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
