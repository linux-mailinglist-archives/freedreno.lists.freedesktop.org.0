Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 467542A9993
	for <lists+freedreno@lfdr.de>; Fri,  6 Nov 2020 17:38:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0303C6EABA;
	Fri,  6 Nov 2020 16:38:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 865DE6EAB6
 for <freedreno@lists.freedesktop.org>; Fri,  6 Nov 2020 16:38:48 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id 12so1596734qkl.8
 for <freedreno@lists.freedesktop.org>; Fri, 06 Nov 2020 08:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8trkRjP9UFPyJqjxFvhkrNselLfEoUHaVtNBCoJ4XCk=;
 b=laDTNhhdkAYgGr6Xrud4Lecf7gNqF0snM2UEQZZjGWky4tYPZf0r3voT2a4dED5KIZ
 cl4pQlYqj6ZgFT7n9Pq4eiXWmZNFws4hQxefJKlftNZEsiS8zzzJN5cqpvrkkYustkYz
 UmdZvFy9WV7LCDt9qMLfXyfswlMlHY0UD1/Tnbp+mJ8+3fI/JRUWVQh0IROzsfvQoBlV
 o1aHMzOOV1GDIyxa1NdiC5cHpVh7Idc03JMhHbew9YEA2phGFO9MOG/KeIPk5Sm9dIt8
 7lo+USi40aetpZWFMU6CvX/+cTRe9g3HzeFt4qYI/TrDdJEBQd5Zv6r4tMICd5nGc1uO
 MXgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8trkRjP9UFPyJqjxFvhkrNselLfEoUHaVtNBCoJ4XCk=;
 b=KWZp3NHO5pj2gj/BJdJ6nFT1xWkaekI082rah2l4gDltrySENzGbzoJEjKaCP9M+zi
 KNhbEwWsT0w8SEkb6QpwdW/3Rj7tffL+XijF/2tEvTzx6+6LR1fcId3kIKaltMS5Ic0o
 Hto16bHuw6clGmDIGd8g2Flh+7NaJJYA+DiHia99VqcvR9ybdbXBL7Rbnhi0s+qIZswP
 WyFiERTg3TObdzl4gv6v7PHlXflRLzykQKfXsPfR4qcvM8WR2gZ+ZtcURy+dTPvqjTQx
 Ep909JyjAVAG2d/cOojbj7G682AU14EtEjk1jSu25029hiR0C5dgYq4traVmUxzEI6KO
 TqJA==
X-Gm-Message-State: AOAM531csgUEgKiamNiSa417MoxWRygbvQjkG6U2KRTrYdLVw3cQUXbC
 EkgfLvh/NLTJRN/RVDhpnmaYo7coPAONEUB2qd4=
X-Google-Smtp-Source: ABdhPJxIHhdp/AKI2KvUFtqY0ovg2l83Re+m5GEneL6YbUxUROsQNG8iXGSoza/7wjV/dd2t5WoU3w==
X-Received: by 2002:a37:7304:: with SMTP id o4mr2450129qkc.351.1604680727479; 
 Fri, 06 Nov 2020 08:38:47 -0800 (PST)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id s3sm860000qkj.27.2020.11.06.08.38.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 08:38:46 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Date: Fri,  6 Nov 2020 11:34:34 -0500
Message-Id: <20201106163437.30836-6-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20201106163437.30836-1-jonathan@marek.ca>
References: <20201106163437.30836-1-jonathan@marek.ca>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v2 5/5] drm/msm: bump up the uapi version
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
index 3f17acdf6594..7230d3c0eee5 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -39,9 +39,10 @@
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
