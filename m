Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 631C02C30D3
	for <lists+freedreno@lfdr.de>; Tue, 24 Nov 2020 20:44:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8EE06E52D;
	Tue, 24 Nov 2020 19:44:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3A716E529
 for <freedreno@lists.freedesktop.org>; Tue, 24 Nov 2020 19:44:01 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 10so83142wml.2
 for <freedreno@lists.freedesktop.org>; Tue, 24 Nov 2020 11:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JwMzTHpk7XI6dg2CwYCxfUcJLWNO9chsHiaVHLyGBfo=;
 b=zEbr7Ie0juCosDDUMsYHBJ5/J0q8CwkxEN4KosAPheneL90V7ZjGXHhrG+nXobFpYY
 jYaSnWMkl4OwkgcwqGU7WhRI01sdKPKoxu+AXz/HhpilIXeYZeBJ6WJO4pq7hgCojSu3
 ljDryijIsewMpHCmf/RA/YCwPkDZHcRWXbe6gkcKK73lBmu7W3r+IBuVJ0LblcnE8cz/
 Z1lxGr6RnUuSwo0Kk2Mt69/tT+ijOYmrhCwDpsO6lWisOUa0K2JbBUePz/XLLuJLIfVy
 2PhiDpl+H2UoO6v6BQ0Cp/CbuFgNJqH/bEj4g2kzVDbSCesxOX1zk6zSLhMRaACpmXJe
 kwgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JwMzTHpk7XI6dg2CwYCxfUcJLWNO9chsHiaVHLyGBfo=;
 b=spC/b2z7muM8J7VHzhJ//ZnW+DaQtDxgh7FfV02HmrbZTyf2b91q0E5X3gd+x/0gY4
 nYIcl0OIU1Lu7RNFWapfHYkYc187fjgs3w8W1a8+Kxmqdc0AnWe0uuaiT+pjwB7sdxsy
 0Zu/wPzCjGaZIAGYefdMuBxe6nQ+R0tEsTEhGG+wlLLU7tXN+SC4F6fgLX99gIEz3VlM
 vQvnyJQlVU2YoH+hUF41JWDeqN9BeJO7q2ei8EBH9d7Yth1hPOATgIagEleQn2/SmjEz
 5Cc0M2AazyxgStydTOY6wKBIRhehEQB/tNInKLGpe6lo9cN1rssqwplANAy6pCVHgbPj
 4bHw==
X-Gm-Message-State: AOAM530s7EwXwCcO0nENAUBn6FsW41swUzqSmUnt6ejh7clbQTchViAC
 JA64dbPn0xr9s4OrA8DPMP7jpw==
X-Google-Smtp-Source: ABdhPJyDoOCPHG72jMUWYjVqVYPJywuRT7oeySl5WJow/24UWTk9rV3wClijPpWtjtWY0EN2Oa/1EA==
X-Received: by 2002:a1c:a986:: with SMTP id s128mr7419wme.94.1606247040667;
 Tue, 24 Nov 2020 11:44:00 -0800 (PST)
Received: from dell.default ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id d134sm200511wmd.8.2020.11.24.11.43.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 11:44:00 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Tue, 24 Nov 2020 19:37:45 +0000
Message-Id: <20201124193824.1118741-2-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201124193824.1118741-1-lee.jones@linaro.org>
References: <20201124193824.1118741-1-lee.jones@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 01/40] drm/msm/msm_gem_shrinker: Fix
 descriptions for 'drm_device'
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

 drivers/gpu/drm/msm/msm_gem_shrinker.c:108: warning: Function parameter or member 'dev' not described in 'msm_gem_shrinker_init'
 drivers/gpu/drm/msm/msm_gem_shrinker.c:108: warning: Excess function parameter 'dev_priv' description in 'msm_gem_shrinker_init'
 drivers/gpu/drm/msm/msm_gem_shrinker.c:126: warning: Function parameter or member 'dev' not described in 'msm_gem_shrinker_cleanup'
 drivers/gpu/drm/msm/msm_gem_shrinker.c:126: warning: Excess function parameter 'dev_priv' description in 'msm_gem_shrinker_cleanup'

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 6f4b1355725f4..caf032e5bf2f1 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -100,7 +100,7 @@ msm_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr)
 
 /**
  * msm_gem_shrinker_init - Initialize msm shrinker
- * @dev_priv: msm device
+ * @dev: drm device
  *
  * This function registers and sets up the msm shrinker.
  */
@@ -118,7 +118,7 @@ void msm_gem_shrinker_init(struct drm_device *dev)
 
 /**
  * msm_gem_shrinker_cleanup - Clean up msm shrinker
- * @dev_priv: msm device
+ * @dev: drm device
  *
  * This function unregisters the msm shrinker.
  */
-- 
2.25.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
