Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D78A844C6D2
	for <lists+freedreno@lfdr.de>; Wed, 10 Nov 2021 19:37:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 753FD6E329;
	Wed, 10 Nov 2021 18:37:14 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FC7B6E105;
 Wed, 10 Nov 2021 18:37:12 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id m14so3418664pfc.9;
 Wed, 10 Nov 2021 10:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EFuTiwIBCHztm/ICNdYp/ffmw2x1iWY8Pj/q3ZqCBZM=;
 b=FGivo6Tqnq19OTCi6J7PEI12kqSlo8QrIRemI1gMcghWbwze0iw0ItylGkl+Uh1skJ
 I6LsWhgj+Wy/kHRi7enl6TZBqBdrK2wJfS4Qf/4Lp5+JsEOaktLaHQZ1pRwid8xal1hL
 Sx8yAX5TsH4M2U+6uVdSe1K2Bozbca4z4eZcjwI4UKCAH3i4XLX1rpmZVT6k7w/ep0yn
 crZ6dgYKPXMy7VXFCmUrFOctM+5CN5gF7K2gXx1hioGlXMOGD0sjq0KKNSdx4RWm2DNi
 IzP6G9Zyw93fwOJrlhDLCs6j4HAy/U45hdsBCEBkZYS/4sEXiK/Q/4ajVYEKhli4RUGy
 8Tfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EFuTiwIBCHztm/ICNdYp/ffmw2x1iWY8Pj/q3ZqCBZM=;
 b=M5M4KrUFeM3K77tKOlI2JHlvrYusrIBGZmsJmEWSGNM0haj63A48cdB8z+kUvWAqbK
 4p/rJs8AroPelcIWXdYmTwmsCL3kniIqoHfi/b+1qUqpsuM7kJpzShogGyTZR8pEsVAi
 utXrQFqUAY7IRdvxfQp2sZaC07nxt7lXs4GOmf2hKMYgCyet93uL/dzq1JGDd6WYPJ0z
 mDgO9wrdlFpa4Gp7B4ySDX9awjFasSbFDy+9oxQEFoZ7FDVejampz3n4QnCqinzVUYB4
 6//6S90/gYRN/9XzlsiH/YCr8HHvS3oSiKJFkjmjsiHv/6ZOdG3CZvMTmqRYM3iIL8Ov
 /29Q==
X-Gm-Message-State: AOAM531YuNXjNtEKTpuKsuwquJaGiWzPf3BwIqTGum095MB8u059h7F4
 IA/7zyhmpRWFrqUU/AhKgPIyJiMagbU=
X-Google-Smtp-Source: ABdhPJzYWocd3h/ASelR6znM6p6uLLKKnS/YQA9kicOTKGCUNrQZlpHGfKO4cIpEVS9jULpqsyNLVw==
X-Received: by 2002:a63:8a43:: with SMTP id y64mr594361pgd.113.1636569431546; 
 Wed, 10 Nov 2021 10:37:11 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 q9sm374389pfj.88.2021.11.10.10.37.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 10:37:10 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 10 Nov 2021 10:42:11 -0800
Message-Id: <20211110184213.649787-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211110184213.649787-1-robdclark@gmail.com>
References: <20211110184213.649787-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH igt v2 1/3] lib/igt_debugfs: Add helper for
 writing debugfs files
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

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
v2: Fix headerdoc comments

 lib/igt_debugfs.c | 17 +++++++++++++++++
 lib/igt_debugfs.h | 13 +++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
index a5bb95ca..dd6f2995 100644
--- a/lib/igt_debugfs.c
+++ b/lib/igt_debugfs.c
@@ -351,6 +351,23 @@ void __igt_debugfs_read(int fd, const char *filename, char *buf, int size)
 	close(dir);
 }
 
+/**
+ * __igt_debugfs_write:
+ * @fd: the drm device file fd
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
index d43ba6c6..b4867681 100644
--- a/lib/igt_debugfs.h
+++ b/lib/igt_debugfs.h
@@ -40,6 +40,7 @@ int igt_debugfs_pipe_dir(int device, int pipe, int mode);
 
 int igt_debugfs_open(int fd, const char *filename, int mode);
 void __igt_debugfs_read(int fd, const char *filename, char *buf, int size);
+void __igt_debugfs_write(int fd, const char *filename, const char *buf, int size);
 int igt_debugfs_simple_read(int dir, const char *filename, char *buf, int size);
 bool igt_debugfs_search(int fd, const char *filename, const char *substring);
 
@@ -54,6 +55,18 @@ bool igt_debugfs_search(int fd, const char *filename, const char *substring);
 #define igt_debugfs_read(fd, filename, buf) \
 		__igt_debugfs_read(fd, (filename), (buf), sizeof(buf))
 
+/**
+ * igt_debugfs_write:
+ * @fd: the drm device file fd
+ * @filename: name of the debugfs file
+ * @buf: buffer to be written to the debugfs file
+ *
+ * This is just a convenience wrapper for __igt_debugfs_write. See its
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

