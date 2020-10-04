Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA243282D15
	for <lists+freedreno@lfdr.de>; Sun,  4 Oct 2020 21:21:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E5A589F73;
	Sun,  4 Oct 2020 19:21:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 548F189F71;
 Sun,  4 Oct 2020 19:21:31 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id 34so4317349pgo.13;
 Sun, 04 Oct 2020 12:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xYPy68YgElKqp/ZhwxT4I2bIBmneh2iMyGRUpgP2Kzg=;
 b=nAEMC704Ssavz0xGEbyrm9K3jWYyc1bgQ8dkA/ZspvJj4to7+Qa/6sZC/5TF/Opmem
 a9nqKcM2G9xVuXLm8cbAQG8SzHpUnGGjNwB+ghB64XjnG1eTbQCMxqStvSZZJO5eeZUk
 LydYUfqZEQVU+7FyjFh6dMVBLk/nY2VDGRCxfzab2hTnkBZWzh5zyq/aNdHVAd66dnZz
 fGRG/HstoIwx+oeBbasuKNtclyI8BMIKy1MpRe/vSqJvMBGH2YVDRXKmyebjf26dv3Q4
 zvYdMozFYF1+7VnS2O4Lz+nu29Ux+JnkNAYgoOtf87f0lNPohyynlHzkoXl3s8Xb32w/
 rE4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xYPy68YgElKqp/ZhwxT4I2bIBmneh2iMyGRUpgP2Kzg=;
 b=gb++EGzDxUbhl11//ovKGgBIQGNsbQiZFYGfS4vROHyBXk1pl3ViODlB8AzckG1tlh
 6l11FwP4DIQ2vqnFEjFStA1vhsKDoIk+0ahOK0LGkKVa1HQ+d+cVYOWbkWfY2e0w0zYs
 FYfUo18twpJw/USz80LEPBldp8KFMUsZz9guTzRJT1ElSNC5L3RMEQUSCaX50yV34GOm
 shpyGxsyTtTegr+GGp+MGVsdtfBBMyMGNVVfr9axGzM6Fh5sghyZqMWn7inmfrWXSIGW
 hqj0u9bMSbge0pM3iCWpqEgurip6/YyDxV4+NJ9JZ73jAtDaA8AZzZePInVu5Ot5sEiN
 27Fw==
X-Gm-Message-State: AOAM530zlZiqUAz1J6OS5k3eVM6bVoIploo2jmH2vgoHIJpGO+ScqiT0
 qLh3rtnsoCAznPRE7xfKG5hWM3zXD0OgrwyI
X-Google-Smtp-Source: ABdhPJz9b6MrGzYddugbdJh3IUMYkbMj+m/4vj4/TIpTfnWuCI/9BDLXB513Fc0erhJoaG/QFDw4ng==
X-Received: by 2002:a63:2022:: with SMTP id g34mr10627104pgg.378.1601839290364; 
 Sun, 04 Oct 2020 12:21:30 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 z63sm9337766pfz.187.2020.10.04.12.21.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Oct 2020 12:21:29 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Date: Sun,  4 Oct 2020 12:21:42 -0700
Message-Id: <20201004192152.3298573-11-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201004192152.3298573-1-robdclark@gmail.com>
References: <20201004192152.3298573-1-robdclark@gmail.com>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 10/14] drm/msm: Drop struct_mutex in
 free_object() path
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Now that active_list/inactive_list is protected by mm_lock, we no longer
need dev->struct_mutex in the free_object() path.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index c52a3969e60b..126d92fd21cd 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -927,8 +927,6 @@ static void free_object(struct msm_gem_object *msm_obj)
 	struct drm_device *dev = obj->dev;
 	struct msm_drm_private *priv = dev->dev_private;
 
-	WARN_ON(!mutex_is_locked(&dev->struct_mutex));
-
 	/* object should not be on active list: */
 	WARN_ON(is_active(msm_obj));
 
@@ -965,20 +963,14 @@ void msm_gem_free_work(struct work_struct *work)
 {
 	struct msm_drm_private *priv =
 		container_of(work, struct msm_drm_private, free_work);
-	struct drm_device *dev = priv->dev;
 	struct llist_node *freed;
 	struct msm_gem_object *msm_obj, *next;
 
 	while ((freed = llist_del_all(&priv->free_list))) {
-
-		mutex_lock(&dev->struct_mutex);
-
 		llist_for_each_entry_safe(msm_obj, next,
 					  freed, freed)
 			free_object(msm_obj);
 
-		mutex_unlock(&dev->struct_mutex);
-
 		if (need_resched())
 			break;
 	}
-- 
2.26.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
