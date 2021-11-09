Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F4D44B246
	for <lists+freedreno@lfdr.de>; Tue,  9 Nov 2021 19:04:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 634E06E874;
	Tue,  9 Nov 2021 18:04:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 421BE6E874;
 Tue,  9 Nov 2021 18:04:08 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id o14so22361065plg.5;
 Tue, 09 Nov 2021 10:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2yfGn4euuZbvVlMW4CFGpNQ/1833WN9N2PISTc4kVBg=;
 b=LIHXxy79mC9TAiF6m2bslLmAT1WXOOnMxtuyaaB4v4hIREj3Gjm8iyHZ2GYW4OQB1C
 +R/RnLcILoefwifklKEaMRnBWehHyM8Uww90NXHOFmO2JO5csT+JAODBXTTl4kXC38SH
 IUjGPJ/id2WijrVD8IyMQkE/EHee5+3P8l2/GelC8NDxn+CA9sUXMJZ6Jq9/MS5JOEei
 Yr0RBWxVJQy6X+ssmV169UOjco5OhWL2SEkkqJUVL7XSmoQG2BFz/fdMDj/IaVbj21U0
 y+QBern7NlzUcQvZeearvcHB4q2ab5rTtg90mRJf2gUMFMwosHyKBstY7SdtY6g7A8eq
 6dIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2yfGn4euuZbvVlMW4CFGpNQ/1833WN9N2PISTc4kVBg=;
 b=jFg7z0pxe3T/ITArxV1JYm1LSK5GhyiD3MSRYxlbWMr6hZBMkNRSfmFQkm74vppyO9
 yy8UiDRsDRF70BO0OoDrHSGs+FVVfMTdoCl2uxZRK8Y4sSLAk3ACMx4OxNDG1fUNQA5K
 5P1PULW82OvjBUGkB+ds5HASfQWm7UNI2UyRSqpCM9S8qTDcqE70w/CDDlensx9DAY/T
 m7q0sPUvtY+V5roIAxvOME2xGRO0OLRRHwxnXqEQYk5TQ07nf+MNiBzTDOLardIMN6sG
 1lTzh1DRP0AYRb/ftvsdbVhCPYu/OIkhvNEToRr20SFn8RaLJ/ljOTit6NhAYk03ud5D
 WCpQ==
X-Gm-Message-State: AOAM533mlvXWfiAgG+t7bdFz/kxD5J0o+2u7RgTLXJZSSa9l3rvgLw5S
 N96hrFgyI82iBQAk9CO5FmqOk2SGBOw=
X-Google-Smtp-Source: ABdhPJwsOjzaxJLDXVf7I6RSxjMKczcTTsPl3AhUfd8uRVeS9D5qLZB5q369CCw/0cJZlaOgka3bPw==
X-Received: by 2002:a17:90b:4a0f:: with SMTP id
 kk15mr9053184pjb.223.1636481047119; 
 Tue, 09 Nov 2021 10:04:07 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 o1sm6001425pfe.7.2021.11.09.10.04.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 10:04:06 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  9 Nov 2021 10:09:03 -0800
Message-Id: <20211109180905.590773-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211109180905.590773-1-robdclark@gmail.com>
References: <20211109180905.590773-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH igt 1/3] lib/igt_debugfs: Add helper for writing
 debugfs files
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Akhil P Oommen <akhilpo@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 lib/igt_debugfs.c | 16 ++++++++++++++++
 lib/igt_debugfs.h | 12 ++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
index a5bb95ca..39431068 100644
--- a/lib/igt_debugfs.c
+++ b/lib/igt_debugfs.c
@@ -351,6 +351,22 @@ void __igt_debugfs_read(int fd, const char *filename, char *buf, int size)
 	close(dir);
 }
 
+/**
+ * __igt_debugfs_write:
+ * @filename: file name
+ * @buf: buffer to be written to the debugfs file
+ * @size: size of the buffer
+ *
+ * This function opens the debugfs file, writes it, then closes the file.
+ */
+void __igt_debugfs_write(int fd, const char *filename, const char *buf, int size)
+{
+	int dir = igt_debugfs_dir(fd);
+
+	igt_sysfs_write(dir, filename, buf, size);
+	close(dir);
+}
+
 /**
  * igt_debugfs_search:
  * @filename: file name
diff --git a/lib/igt_debugfs.h b/lib/igt_debugfs.h
index d43ba6c6..249eb56a 100644
--- a/lib/igt_debugfs.h
+++ b/lib/igt_debugfs.h
@@ -40,6 +40,7 @@ int igt_debugfs_pipe_dir(int device, int pipe, int mode);
 
 int igt_debugfs_open(int fd, const char *filename, int mode);
 void __igt_debugfs_read(int fd, const char *filename, char *buf, int size);
+void __igt_debugfs_write(int fd, const char *filename, const char *buf, int size);
 int igt_debugfs_simple_read(int dir, const char *filename, char *buf, int size);
 bool igt_debugfs_search(int fd, const char *filename, const char *substring);
 
@@ -54,6 +55,17 @@ bool igt_debugfs_search(int fd, const char *filename, const char *substring);
 #define igt_debugfs_read(fd, filename, buf) \
 		__igt_debugfs_read(fd, (filename), (buf), sizeof(buf))
 
+/**
+ * igt_debugfs_write:
+ * @filename: name of the debugfs file
+ * @buf: buffer to be written to the debugfs file
+ *
+ * This is just a convenience wrapper for __igt_debugfs_read. See its
+ * documentation.
+ */
+#define igt_debugfs_write(fd, filename, buf) \
+		__igt_debugfs_write(fd, (filename), (buf), sizeof(buf))
+
 /*
  * Pipe CRC
  */
-- 
2.31.1

