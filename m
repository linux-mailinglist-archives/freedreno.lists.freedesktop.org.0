Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD4C1D3EB9
	for <lists+freedreno@lfdr.de>; Thu, 14 May 2020 22:11:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED3CA6EBA2;
	Thu, 14 May 2020 20:11:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33EB26EBA2
 for <freedreno@lists.freedesktop.org>; Thu, 14 May 2020 20:11:24 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id e16so297036wra.7
 for <freedreno@lists.freedesktop.org>; Thu, 14 May 2020 13:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u5+ZIsepmANUb25rp8z2+IfwFZccCxjdXSGCg+HwNG8=;
 b=inEPheZK6U783qRJhkzWRpmM2fI++8ygHH4D+jRYdwfk13oSlcSH5TIdtyUS3a9T8+
 ygc6H70ykiMA4j5aqpKMv7VgZHV6lFT7H28kRXzI3dlqaZB8DWa+oEyaGv3U26Da8UHS
 +sjzVxs+fGPUwbt7WH+FD4J5d19UwkMzQiY7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u5+ZIsepmANUb25rp8z2+IfwFZccCxjdXSGCg+HwNG8=;
 b=agn7+l4YrU/57wxP+3GNTdDc2m9v4xiVef7RuQosgc1NIJvhMiyRSuCpUcfvOpF1sJ
 LTueJeEHP32XXed5inWSn56XxMDt2qbj8H0rHjPmeF6+DA5FRRZinyR20EEIcgRCMFTs
 LgKbxEVn5mOKZClgheDqduYZQe7dKqNScrEYhACzvzQjUACmBAoUCnHJFvvhZ5KpsKHM
 x+fzVPqUHtMLKLyZUp3IoiYaJtV1oHyY7y5cPgb9ENwZm48M8yYutoL9fBXQcI/Boyjl
 13HYK1CZ8ZnWrxr9as0BB4i7946YVUEGp0YQTOYRzs/Hg1iwnLHKbKGE7Mxo/H7938HP
 CVQw==
X-Gm-Message-State: AOAM533UBRxkgONzz5KTyBf0bBdGfHJEhliaCWyVGjmdHNZ/HB8LTcMH
 Ykmj1OuMBVlEbAgl8ECVNVhf3Q==
X-Google-Smtp-Source: ABdhPJysl6I2xvCb7jPdlVQDQlxQlPIyMi7UVtnoTkHcbr+49z0N4ds2zUKEDu32/GtpZz8jBcnZ4A==
X-Received: by 2002:adf:df12:: with SMTP id y18mr173997wrl.94.1589487082845;
 Thu, 14 May 2020 13:11:22 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q74sm248655wme.14.2020.05.14.13.11.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 13:11:22 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Date: Thu, 14 May 2020 22:11:17 +0200
Message-Id: <20200514201117.465146-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200511093554.211493-2-daniel.vetter@ffwll.ch>
References: <20200511093554.211493-2-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH] drm/msm: Don't call dma_buf_vunmap without _vmap
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
Cc: Sean Paul <sean@poorly.run>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org,
 Daniel Vetter <daniel.vetter@intel.com>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

I honestly don't exactly understand what's going on here, but the
current code is wrong for sure: It calls dma_buf_vunmap without ever
calling dma_buf_vmap.

What I'm not sure about is whether the WARN_ON is correct:
- msm imports dma-buf using drm_prime_sg_to_page_addr_arrays. Which is
  a pretty neat layering violation of how you shouldn't peek behind
  the curtain of the dma-buf exporter, but par for course. Note that
  all the nice new helpers don't (and we should probably have a bit a
  warning about this in the kerneldoc).

- but then in the get_vaddr() in msm_gem.c, we seems to happily wrap a
  vmap() around any object with ->pages set (so including imported
  dma-buf).

- I'm not seeing any guarantees that userspace can't use an imported
  dma-buf for e.g. MSM_SUBMIT_CMD_BUF in a5xx_submit_in_rb, so no
  guarantees that an imported dma-buf won't end up with a ->vaddr set.

But even if that WARN_ON is wrong, cleaning up a vmap() done by msm by
calling dma_buf_vunmap is the wrong thing to do.

v2: Rob said in review that we do indeed have a gap in get_vaddr() that
needs to be plugged. But the users I've found aren't legit users on
imported dma-buf, so we can just reject that.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
---
 drivers/gpu/drm/msm/msm_gem.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 5a6a79fbc9d6..e70abd1cde43 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -554,6 +554,9 @@ static void *get_vaddr(struct drm_gem_object *obj, unsigned madv)
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	int ret = 0;
 
+	if (obj->import_attach)
+		return ERR_PTR(-ENODEV);
+
 	mutex_lock(&msm_obj->lock);
 
 	if (WARN_ON(msm_obj->madv > madv)) {
@@ -907,8 +910,7 @@ static void free_object(struct msm_gem_object *msm_obj)
 	put_iova(obj);
 
 	if (obj->import_attach) {
-		if (msm_obj->vaddr)
-			dma_buf_vunmap(obj->import_attach->dmabuf, msm_obj->vaddr);
+		WARN_ON(msm_obj->vaddr);
 
 		/* Don't drop the pages for imported dmabuf, as they are not
 		 * ours, just free the array we allocated:
-- 
2.26.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
