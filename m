Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1250F27F6B4
	for <lists+freedreno@lfdr.de>; Thu,  1 Oct 2020 02:28:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE3C26E842;
	Thu,  1 Oct 2020 00:28:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6E0B6E83E
 for <freedreno@lists.freedesktop.org>; Thu,  1 Oct 2020 00:28:54 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id s131so3608942qke.0
 for <freedreno@lists.freedesktop.org>; Wed, 30 Sep 2020 17:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EHwLeNxlSJ3EARNPo85Hd8uD6D75QyiXLjXUxQ3hUGI=;
 b=h2x0wFzInna9YMHm6P0E45wxhWqOBWVDm/5zBlqYzYT4O+zpDSeC9+usBXBspL62HD
 Wfv7Ck+wGjMx4j8GuFzu9r3pWufd0nNC8QO9JoPCAXUIGkKOGKngUH46ySm8X9sKqB8a
 816F5UVIAD0BKewbdsOW0CInM2tocN4lJ47jE0QBX3SYgFPMKuyV1vMWLYj4KvdohZ6r
 UbfqiADYWHyGsRN8OTHzlsfdwVOdG1jq89HRP6bhewKbDdRqXQqdQpGmCwsLdyghD/gJ
 OuXfQgly0EIrIvfxvBZytgDWZMavQ3L9n3Pq/itHqczsZpsu0mHS4Zvl2+PrEfZv9GV7
 Y38A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EHwLeNxlSJ3EARNPo85Hd8uD6D75QyiXLjXUxQ3hUGI=;
 b=L0m7BxOU/GN1AlLpwUM/qYfzRV+TNMxdJG9VpJNYI93kJV+XyvoBL8rlgdHeKRYUa+
 DA/vQgQhAS9swwIQSgSu+iGpethFme6luXHwmcFVGvYlE+Ct19HiDKzFLIZrFyujliLn
 QXCggySbaFnsqy6KR2Sh7GM5rKg8lhqOrgG7D4qcclaoDnD2QWjQv7ZkTJ5XtFqCdld7
 cg56xOLnJPWiu//kbnx7ENG371RHm6CHayjgDFXKK/NOgSe64bwSh5SL21myfqIH/RiP
 hBeoPu56seO/3cpK6ZuRCGMWpG7MsXz+xrbd5jdZsPuVQbpObW00HWuhiqsH7vSOaRWp
 K93Q==
X-Gm-Message-State: AOAM530SMDOtKUbbwoGcZA3+f2mtgQu5cdlgFLjoujeCLL5R2uMQB2/g
 xgi/cFNhZ3zTAltYcP1Fo7Yd7QV5pRQZxcBF
X-Google-Smtp-Source: ABdhPJzLw800gfk1oonIT2sRo5VEKRKUttkzTSShle7j0kaa4WtY3ECvUdcXfd6YrGcyNPASiRd03Q==
X-Received: by 2002:a37:952:: with SMTP id 79mr5223335qkj.57.1601512133978;
 Wed, 30 Sep 2020 17:28:53 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id 205sm3850908qki.118.2020.09.30.17.28.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 17:28:53 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Date: Wed, 30 Sep 2020 20:27:06 -0400
Message-Id: <20201001002709.21361-4-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20201001002709.21361-1-jonathan@marek.ca>
References: <20201001002709.21361-1-jonathan@marek.ca>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 3/3] drm/msm: bump up the uapi version
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

Increase the minor version to indicate the presence of new features.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/msm_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 305db1db1064..502aafe7d1e6 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -38,9 +38,10 @@
  *           GEM object's debug name
  * - 1.5.0 - Add SUBMITQUERY_QUERY ioctl
  * - 1.6.0 - Syncobj support
+ * - 1.7.0 - MSM_BO_CACHED_COHERENT and DRM_IOCTL_MSM_GEM_SYNC_CACHE
  */
 #define MSM_VERSION_MAJOR	1
-#define MSM_VERSION_MINOR	6
+#define MSM_VERSION_MINOR	7
 #define MSM_VERSION_PATCHLEVEL	0
 
 static const struct drm_mode_config_funcs mode_config_funcs = {
-- 
2.26.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
