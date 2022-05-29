Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DABF5371C6
	for <lists+freedreno@lfdr.de>; Sun, 29 May 2022 18:29:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91D2B10F4DA;
	Sun, 29 May 2022 16:29:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34A5710F4D5;
 Sun, 29 May 2022 16:29:41 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id y1so8574842pfr.6;
 Sun, 29 May 2022 09:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F0TmM8b9e274oJMvNvuPKJVM2spWHgnC/4XXZLIhTKc=;
 b=S1Us7OAbBJgnJ7Qc5yA9DRJFHDniqPlIsZgDysPoU6nRKRxSYGGySsj1QcYZeRV31C
 DjT6f51ghmir+RZJdqrAjQrWHq5AZ7TQWwqv2SL5tTkiIyy148ET+tgzqGxhJ+A7feEY
 F31etkjkP4rhcTxNg8nzhl+VbIJicF/dG8DbESw0z/oqJqnnbE+/4YvI4kuNQcHHmMMH
 x91V6YLrCvrBNzS0p98knuYHnVJZArBM9L22n7wBBTfEwRQxzTITCpEZdiEDXJ1W9DLR
 D5iQKNHU6MrS8MjC8GplZjNVs0tZ+jXm/aWlkEzEZuar/rQJkUV+sjosCFs9cWIogPrv
 2xWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F0TmM8b9e274oJMvNvuPKJVM2spWHgnC/4XXZLIhTKc=;
 b=giRhVx62l/XMl9K60RsYhvJc9i4UqS20i673TL9ilM1QeeH6z/Bh785PjHcyJTXrTC
 wKFNo1BhC0w9CLGBz4hgApKmYSV1B5l2S8eiUeIB18QLN2mK92WcQSS8ELuvwnT0gFEX
 1OFl4xGfaDzXr9iZevh697gbzcybP7T8sLn3fXfc5xIeyuNjII0nSVHhKev+XCfa2fQJ
 lkQSnfBVk6VyUsiSO0MLbG+Cb6ww0CXBvnWsFEfwLSWM7tOixBOmP2htSELCfQ7Y0HiV
 Ef7qEc1/usCFL9xL7GF/1yH0hDsLkxhdQbbJFFzd/6e98xpFoC2NzSeprvtIoXQL1meS
 l7EA==
X-Gm-Message-State: AOAM533N1hoqnFKkYk8RiWMxPwDrbvvHxvfVyDvfUWgcGkb19wD9AE3C
 v/mwly83807HxKf0d4EMYjFBBEPpJzk=
X-Google-Smtp-Source: ABdhPJwiBkVL6vuI5goGhYdfMbEajG9cOJY8MXj2qEucMrXQYa65iBSazvTQHcgKUdnOCdriyfKu0g==
X-Received: by 2002:a65:4c44:0:b0:39c:e0b5:cd2a with SMTP id
 l4-20020a654c44000000b0039ce0b5cd2amr45230821pgr.481.1653841780062; 
 Sun, 29 May 2022 09:29:40 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a170902ebc100b00163ad74fe4esm1207781plg.70.2022.05.29.09.29.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 May 2022 09:29:38 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Date: Sun, 29 May 2022 09:29:36 -0700
Message-Id: <20220529162936.2539901-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] drm/prime: Ensure mmap offset is initialized
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
Cc: Rob Clark <robdclark@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

If a GEM object is allocated, and then exported as a dma-buf fd which is
mmap'd before or without the GEM buffer being directly mmap'd, the
vma_node could be unitialized.  This leads to a situation where the CPU
mapping is not correctly torn down in drm_vma_node_unmap().

Fixes: e5516553999f ("drm: call drm_gem_object_funcs.mmap with fake offset")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
Note, it's possible the issue existed in some related form prior to the
commit tagged with Fixes.

 drivers/gpu/drm/drm_prime.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index e3f09f18110c..849eea154dfc 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -716,6 +716,11 @@ int drm_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
 	struct file *fil;
 	int ret;
 
+	/* Ensure that the vma_node is initialized: */
+	ret = drm_gem_create_mmap_offset(obj);
+	if (ret)
+		return ret;
+
 	/* Add the fake offset */
 	vma->vm_pgoff += drm_vma_node_start(&obj->vma_node);
 
-- 
2.35.3

