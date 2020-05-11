Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1AB1CD547
	for <lists+freedreno@lfdr.de>; Mon, 11 May 2020 11:36:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9E5D6E3FE;
	Mon, 11 May 2020 09:36:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C6546E3FE
 for <freedreno@lists.freedesktop.org>; Mon, 11 May 2020 09:36:02 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id y24so18416263wma.4
 for <freedreno@lists.freedesktop.org>; Mon, 11 May 2020 02:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GPf4uEQTc/afTL7c/d2cSeqRiW2RQV3fjrBit70wmW4=;
 b=WOk5qAdJnGfzedSYVjf9nBySpoGM+n2oOhUsj1JX9TIbBH8jTCWX2rsyBduOMQCSc7
 neKaN8es7sL9BwmHgzRQCqOJyE9qnPM80O5sRkjxPrHc9R6U3W/hmK9HzJHex4UHmHjX
 jK07NS0y3glRT5GD/LViGMTUeQNL/dzkeL3Ho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GPf4uEQTc/afTL7c/d2cSeqRiW2RQV3fjrBit70wmW4=;
 b=VCCgwVrkzpR3qOMQ7bG80ETwyof7GRTx0gBKFgoixCKxmkVNqi99I+hHefAlUTOBTW
 2v7wfApO+RfQ3h3HSc1GXzTtlqfEiuDrtk1JlURvI3oTYITQ54b7M4CWbAsMaAdsS8P+
 1HvpoLrbwEA6APKdhfwipcsqGsbrLS3Uri8zxXUy3S7mnhxmbMaukRD1498KDR0WbPR7
 2sLMpqNHl12HoxRNfJ9V18kSEgISoH//NTNL6uEyiudT+3CZ+8KanIpTXkyQlKipoO0J
 WDswzWgYOAByIEnaqvzSyh97qX5xHVct6cGA8OvQOAnhSUC+2MrfOu6Hshjo3eXZF2GJ
 HCvw==
X-Gm-Message-State: AGi0PuaMmbSFLfystyueAfnNyCNDgBBtf0xDkblURkc4kzBeaU9g7rbw
 Rtq+UJoqpKci8iuoKNzjCn2/uA==
X-Google-Smtp-Source: APiQypLI5J/YwNBWeinmIVZanIUCMAm2cxmh3WAHdA3Qh3SfT+IosHz9CBc6cX7rogzLt2gPdQQ8nQ==
X-Received: by 2002:a1c:a102:: with SMTP id k2mr9162940wme.39.1589189760853;
 Mon, 11 May 2020 02:36:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q17sm9013945wmk.36.2020.05.11.02.35.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 02:36:00 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Date: Mon, 11 May 2020 11:35:46 +0200
Message-Id: <20200511093554.211493-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200511093554.211493-1-daniel.vetter@ffwll.ch>
References: <20200511093554.211493-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 1/9] drm/msm: Don't call dma_buf_vunmap without
 _vmap
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

I honestly don't exactly understand what's going on here, but the
current code is wrong for sure: It calls dma_buf_vunmap without ever
calling dma_buf_vmap.

What I'm not sure about is whether the WARN_ON is correct:
- msm imports dma-buf using drm_prime_sg_to_page_addr_arrays. Which is
  a pretty neat layering violation of how you shouldn't peek behind
  the curtain of the dma-buf exporter, but par for course. Note that
  all the nice new helpers don't (and we should probably have a bit a
  warning about this in the kerneldoc).

- but then in the get_vaddr() in msm_gem.c, and that seems to happily
  wrap a vmap() around any object with ->pages set (so including
  imported dma-buf)

- I'm not seeing any guarantees that userspace can't use an imported
  dma-buf for e.g. MSM_SUBMIT_CMD_BUF in a5xx_submit_in_rb, so no
  guarantees that an imported dma-buf won't end up with a ->vaddr set.

But even if that WARN_ON is wrong, cleaning up a vmap() done by msm by
calling dma_buf_vmap is the wrong thing to do.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
---
 drivers/gpu/drm/msm/msm_gem.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 5a6a79fbc9d6..3305a457960e 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -907,8 +907,7 @@ static void free_object(struct msm_gem_object *msm_obj)
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
