Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5E03BC922
	for <lists+freedreno@lfdr.de>; Tue,  6 Jul 2021 12:12:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1DCB897E8;
	Tue,  6 Jul 2021 10:12:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0049899BE
 for <freedreno@lists.freedesktop.org>; Tue,  6 Jul 2021 10:12:17 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id w13so13184156wmc.3
 for <freedreno@lists.freedesktop.org>; Tue, 06 Jul 2021 03:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eK8t9BEjbT//Rj4X6P1/lXym1o29s4XXgV4fm7IqVSk=;
 b=kWZV1mpE1AInwl6j30iEOk6ezDVr32HVfzgJQxtdJro6607JT5suF4GWCqBcjUEbam
 XhQNJzP8MSccGPCykN97E2CC9Chc0cgCGff4zSCaCTwQ2cUlP+QLNcyS7VtEXgv3RVRB
 OKR+KhaSG0xcQ9L8NQxw5ng46E5kW5p5F2X3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eK8t9BEjbT//Rj4X6P1/lXym1o29s4XXgV4fm7IqVSk=;
 b=UxCMbPYpmpvEGgerHkPDRShLs6zvIUSOoMYhUfDnrMkqPGUwrYHGPBmO4qttw1jqZ3
 ePA3YnhTtlsGyZf8M5x4/q7IT2XH9Rq9BuQspMLnGqkh1d4RexSHdWPEVtw/Y15gScbD
 +tqGkQ2+19ApS6xxD8RWULgn3bShCWI63z+A0tmsXefNaTFDamxk/oWp0p4QN2SZq78w
 HkCfkRZ/Fn0kbcyw4KIuoV60KcUinWrZubi7mpf+pZ8EJk8/U+NfYbPM/fvQpNURuTRR
 PL+MGUrJ6TEr86sIa7toelD6in4WnZy/YXjtUWINfiUOSJq34G0VPu8MHGrdAaDU2HhC
 DIPQ==
X-Gm-Message-State: AOAM5327DqaCNJR0S7mNLoIgnd614f7fdhUvF63bfzkTDtvDztVmFOIn
 w44YykqB5pN88mJtKpo4uzl2SA==
X-Google-Smtp-Source: ABdhPJxEDVRYf4jHMU2qeOsNXRMr4+1OkGaalkBSQqZe5EBhZ/N8/6og1cZ8MfQphbVhzw5iK7eGXA==
X-Received: by 2002:a7b:ce0d:: with SMTP id m13mr1209304wmc.59.1625566336286; 
 Tue, 06 Jul 2021 03:12:16 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u2sm9862739wmc.42.2021.07.06.03.12.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 03:12:15 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Date: Tue,  6 Jul 2021 12:12:03 +0200
Message-Id: <20210706101209.3034092-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210706101209.3034092-1-daniel.vetter@ffwll.ch>
References: <20210706101209.3034092-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 1/7] drm/msm: Don't break exclusive fence
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
 Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

There's only one exclusive slot, and we must not break the ordering.

A better fix would be to us a dma_fence_chain or _array like e.g.
amdgpu now uses, but
- msm has a synchronous dma_fence_wait for anything from another
  context, so doesn't seem to care much,
- and it probably makes sense to lift this into dma-resv.c code as a
  proper concept, so that drivers don't have to hack up their own
  solution each on their own.

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
