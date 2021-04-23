Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CF8369AB0
	for <lists+freedreno@lfdr.de>; Fri, 23 Apr 2021 21:12:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E34A6EC3B;
	Fri, 23 Apr 2021 19:12:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D26606EC30
 for <freedreno@lists.freedesktop.org>; Fri, 23 Apr 2021 19:12:03 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id y136so18590977qkb.1
 for <freedreno@lists.freedesktop.org>; Fri, 23 Apr 2021 12:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PiGI3myDVeLMq9GsTguuYbk0A7yStjg2eQhCDVfOEQY=;
 b=DWzTq3eg0IbdDQvqfaFhQmhIGoIvmyqq6SW2iUme8FM7yZjWOixBh34TBi9My2y/cG
 xYYjK+Y4scVUxuF79TXAPOxnyhucsXgaHzlJv0YzaQXhEe+3TQ9oO7obCCoCjoI7IlHZ
 Vk0CLw0Isl2ZE9ZtHcawKjRZsWUixj+WM26qVsLinOQrozGuf7AnfzwBwkdqC3pkVv0j
 pPpSx791zPpHZx9ACX+6oZtf8xyF7KaShxjG9ARa8QJNOCBb54nA5l2NC5UdjPeUGU4J
 0qp3G65Q+VgzhA7XcxriT74sY/a+ShwNI9pV9HwAQQ27wdZXSZwCMO9xm9BM+GUrNrUv
 5dYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PiGI3myDVeLMq9GsTguuYbk0A7yStjg2eQhCDVfOEQY=;
 b=Y3wyOVjmQ56LfqnzKZGUBp0mCQwVCrgy0dk/iK8ysk8pktEdptnKqZ6Bak3OM2i8/s
 lhSckzp6gEiK4qtkRXz9hIyzSJl/VYnGSnALJtujy6+ZYfaKlr3V8vBenmJ/9vIR156B
 /A/CZ26nCf1pmjQ3ydsVML1zpgQIqjIobufZttZk97c0s/q6brrIG/K4QAfc3N0qIfoX
 5NQUhx5r9RsF9FFT1aIHBkwgr+fV8zzyECOdf/+T2ndqr0WzBE/VJrsxLBQJYO1qVNzn
 gSgyvIR/exa1h7WI1VSL36GrIJHpZNtsmM8Lhh+OCDjQ4PGbhybl7oeBUFKFWMkmTpEL
 8cng==
X-Gm-Message-State: AOAM5303EV7R4qnwWXL1eMW4+eyD7Fn2ymJ8mrgrUHcpEVKHMfe1yBQY
 cJJHOeQULI3Qj02EueQla1qXGurgwA2v2DjhjphT+w==
X-Google-Smtp-Source: ABdhPJxw5CDCTryTzVXDnpMJOxRnGYQZZ8taSXNSMcv35dkh9kK80RXJyrGVHu6/4JO0czCsHoI80A==
X-Received: by 2002:a37:b947:: with SMTP id j68mr5634704qkf.108.1619205122814; 
 Fri, 23 Apr 2021 12:12:02 -0700 (PDT)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id a22sm4834630qtp.80.2021.04.23.12.12.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 12:12:02 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Date: Fri, 23 Apr 2021 15:08:17 -0400
Message-Id: <20210423190833.25319-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210423190833.25319-1-jonathan@marek.ca>
References: <20210423190833.25319-1-jonathan@marek.ca>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 1/5] drm/msm: remove unnecessary mmap logic for
 cached BOs
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

No one knows what this is for anymore, so just remove it.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/msm_gem.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index b199942266a2..09abda42d764 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -207,21 +207,12 @@ int msm_gem_mmap_obj(struct drm_gem_object *obj,
 	vma->vm_flags &= ~VM_PFNMAP;
 	vma->vm_flags |= VM_MIXEDMAP;
 
-	if (msm_obj->flags & MSM_BO_WC) {
+	if (msm_obj->flags & MSM_BO_WC)
 		vma->vm_page_prot = pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
-	} else if (msm_obj->flags & MSM_BO_UNCACHED) {
+	else if (msm_obj->flags & MSM_BO_UNCACHED)
 		vma->vm_page_prot = pgprot_noncached(vm_get_page_prot(vma->vm_flags));
-	} else {
-		/*
-		 * Shunt off cached objs to shmem file so they have their own
-		 * address_space (so unmap_mapping_range does what we want,
-		 * in particular in the case of mmap'd dmabufs)
-		 */
-		vma->vm_pgoff = 0;
-		vma_set_file(vma, obj->filp);
-
+	else
 		vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
-	}
 
 	return 0;
 }
-- 
2.26.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
