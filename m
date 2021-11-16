Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AC3451D51
	for <lists+freedreno@lfdr.de>; Tue, 16 Nov 2021 01:25:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A7D06E811;
	Tue, 16 Nov 2021 00:25:35 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DE466E811;
 Tue, 16 Nov 2021 00:25:34 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id v23so14264424pjr.5;
 Mon, 15 Nov 2021 16:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0cWfKAdFJ4mdWHeu2WC++67okKwtJARd96rOv9nvD7w=;
 b=E701PV7xGxk61nRt5kwxw3AsTdUhK9SxGWkr7TyIlnEgODBOHJiuPZp1Bz38b//frS
 1axNFGEXXdgfr7Ou8SCzqENXtFjqTzc+WFNmQMMXX1/ZpOX7HXQUVXAVoA5y81csOG54
 2vkeKBMjTFxWNZjXuyF3awX77wAt5NbGdCXfFJakKqI7RxYB3bf0JctcXCslpyiEEyzk
 9ZoWTeotZyL7aUnbx4BmCjDaaJxNQlsKE/1GdjQMacd5floZCntHvaeBNzIWtWr523sD
 qk52krRWsbCeXtbmkrhVi1vo+nRBPwnJg74WTVE95VFJgTtF1+OlMpCfCZum/WMXFqGU
 64VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0cWfKAdFJ4mdWHeu2WC++67okKwtJARd96rOv9nvD7w=;
 b=Q8WMt3p25qDTRNBZL/f0oiLdxeFl4GGdAr1UMMKuen/WLF1/a6C0PftWPOgDTJ7YVa
 xAA8uj4+zd8pLltNfZJy8QkkbAiYyv+SvHPxYuxeu2sChaUD85Ghoj6Ixs/TrvSSRbx8
 0R/xwGGHPE8VUk9Gz/XVwFV4LEmJHJ47LqM3vzSZ7FDG1nWprF8cY4b+jpinTWb8rlA5
 AETOgJOgau8Kg/v5NYDYV58DnvfKDwrj6G0b6Jw/qxDnlyfPW83+HZ+5bMSyhn09fWr9
 6jeQ9YKuxWRDEjShGa37qKNso49qRDstLoFK3p21J/TWbLHQEFR1E1MZzuC5WtPbe5Vd
 jb8Q==
X-Gm-Message-State: AOAM5302fK+64B3fFJ8uZC8NIeLZ3wKChMHOeHlN2KZdKq6ge7gwSmz+
 GFBWIqKCl61FKCqmgL9GktMCVM0AvHg=
X-Google-Smtp-Source: ABdhPJwgoaSEHpETkim2RcaPsr9RBZ98eZRJNpnskLL/lGTxEQXcRKgLPFjQRxJGqZ8KH9nrt1Q9HQ==
X-Received: by 2002:a17:90a:ca81:: with SMTP id
 y1mr68773894pjt.231.1637022333273; 
 Mon, 15 Nov 2021 16:25:33 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 j9sm11888906pgt.54.2021.11.15.16.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 16:25:32 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 15 Nov 2021 16:30:39 -0800
Message-Id: <20211116003042.439107-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211116003042.439107-1-robdclark@gmail.com>
References: <20211116003042.439107-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH igt v3 1/4] lib/igt_debugfs: Add helper for
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
Reviewed-by: Petri Latvala <petri.latvala@intel.com>
---
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
2.33.1

