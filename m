Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FD5451D52
	for <lists+freedreno@lfdr.de>; Tue, 16 Nov 2021 01:25:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AB7C6EC0E;
	Tue, 16 Nov 2021 00:25:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61D486E872;
 Tue, 16 Nov 2021 00:25:36 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id 188so15990815pgb.7;
 Mon, 15 Nov 2021 16:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+sRJ9ALAP5C7pUpxb3+UCtAmTWjxkCbV1oAe8YjCiHk=;
 b=KuRvWGGSuFtB49APCMTskj07KMN+iFLL7rThF/hdavdRcik3SLBVN++i37+ngwkWm5
 vxzbRMMTnG6pCoii8B7wcOKn5sTkIbX8/zxDJcrGn4Ravy/XHlo9hwowoQn2IF8W2YnR
 sAI7Hy24KR5o9bQ6C+Fl8lgsZEFNB9x3bsO1W6LL54sFBPx6XJeTTcliETFtkmUzkWnz
 6C3ZJatCBPpmwFKJ1uNsuLYpDSMhvGwRSf3S2ZQfb0O7mzx00UXKEN39k/Rh8Hta0MAR
 mUqdRZ3+tl/fje0OAtL3u2Hz+a53QLY2lpoI9UxvHdxV3p2dx6xaQdg1CCYjqMlGLElp
 HDQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+sRJ9ALAP5C7pUpxb3+UCtAmTWjxkCbV1oAe8YjCiHk=;
 b=L0JViancg6bO0ZHoQx6kCBvggccwkOcNohgF9ToWUv26kel7RnQIi+oJ9Pd/aRLuoo
 32Yaudd0RdgqvClSJiiE6cGnO4xeRgw6ZI9Uk52qGRBQdEIsj1hrDoK+2Qt15byq9w0u
 7ysh+OujXSMB08hu6XtJGBMc7lHUq+Vy0/fHBw3XHQNu++xRQIeRU2qyc/d8H9fKsndh
 I+FT2tTaL81pmVWxqWIvMAPMYD/ee02JinwKoIiVBXUgZkxPVdBra/eqg+036lhd3CEk
 LFImSqyD8Gbd4gEVqGzKmo1kUQrr9wDoQwdU2QQXcp1IKmteQGa+6+DDTilZrjrsbSM8
 uLgQ==
X-Gm-Message-State: AOAM530Xg4pYiCPe8rX9YtXqbVoWT6BjQKheD4x+jFxpmrCLJHictUH0
 w5mCKJ4q2VZfS6wUDYG17y6PJR8dyic=
X-Google-Smtp-Source: ABdhPJzjrMsB4rqoNX3znJ0C+OggqLIr5W+kZjxqZHQyj5OmsB96Ru96QVTuCLcxCtg4MorX9L8S0A==
X-Received: by 2002:a63:f702:: with SMTP id x2mr2114368pgh.162.1637022335321; 
 Mon, 15 Nov 2021 16:25:35 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 ot18sm439677pjb.14.2021.11.15.16.25.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 16:25:34 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 15 Nov 2021 16:30:40 -0800
Message-Id: <20211116003042.439107-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211116003042.439107-1-robdclark@gmail.com>
References: <20211116003042.439107-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH igt v3 2/4] lib/igt_debugfs: Add helper for
 detecting debugfs files
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
Cc: Rob Clark <robdclark@chromium.org>, Petri Latvala <petri.latvala@intel.com>,
 linux-arm-msm@vger.kernel.org, Akhil P Oommen <akhilpo@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Add a helper that can be used with, for ex, igt_require() so that tests
can be skipped if the kernel is too old.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 lib/igt_debugfs.c | 21 +++++++++++++++++++++
 lib/igt_debugfs.h |  1 +
 2 files changed, 22 insertions(+)

diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
index dd6f2995..7211c410 100644
--- a/lib/igt_debugfs.c
+++ b/lib/igt_debugfs.c
@@ -307,6 +307,27 @@ int igt_debugfs_open(int device, const char *filename, int mode)
 	return ret;
 }
 
+/**
+ * igt_debugfs_exists:
+ * @device: the drm device file fd
+ * @filename: file name
+ * @mode: mode bits as used by open()
+ *
+ * Test that the specified debugfs file exists and can be opened with the
+ * requested mode.
+ */
+bool igt_debugfs_exists(int device, const char *filename, int mode)
+{
+	int fd = igt_debugfs_open(device, filename, mode);
+
+	if (fd >= 0) {
+		close(fd);
+		return true;
+	}
+
+	return false;
+}
+
 /**
  * igt_debugfs_simple_read:
  * @filename: file name
diff --git a/lib/igt_debugfs.h b/lib/igt_debugfs.h
index b4867681..37e85067 100644
--- a/lib/igt_debugfs.h
+++ b/lib/igt_debugfs.h
@@ -39,6 +39,7 @@ int igt_debugfs_connector_dir(int device, char *conn_name, int mode);
 int igt_debugfs_pipe_dir(int device, int pipe, int mode);
 
 int igt_debugfs_open(int fd, const char *filename, int mode);
+bool igt_debugfs_exists(int fd, const char *filename, int mode);
 void __igt_debugfs_read(int fd, const char *filename, char *buf, int size);
 void __igt_debugfs_write(int fd, const char *filename, const char *buf, int size);
 int igt_debugfs_simple_read(int dir, const char *filename, char *buf, int size);
-- 
2.33.1

