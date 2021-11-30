Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3BB462933
	for <lists+freedreno@lfdr.de>; Tue, 30 Nov 2021 01:38:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FFC389C25;
	Tue, 30 Nov 2021 00:38:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95CA489C25;
 Tue, 30 Nov 2021 00:38:08 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id gt5so14000416pjb.1;
 Mon, 29 Nov 2021 16:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yBxqouLHSw03Wm/j4mFMHFYB+Faz71VBDFEeCcJ7oik=;
 b=Bhry2P1i5cl22yQAyiX4JIQEpEgtGXhcvcBUw3FyF/HWiu6JqEdOkJP/KsfT7uiZnx
 IL8v6s/7VD5InGnW5tz/ebXzHBazbS8RpDNGNivec5yY5NKY6d89mYs9iZqZS4zs6vqg
 SfIsZu1rZpF9TGv283K30w9QBbGI6HYeKtzLsQOHtx/qM7heWg+Trdl18tWJSG/FeBz6
 O4sJrw5uD3o3K8yFD81WXVWxzMYAWbuQJ0DdLO8sSQ4DG54vaJe3Z47/gUIjgtCUVkCO
 y8t9qnCGDYrgEc7cN2mBfOELKpkQm2OgZNRyAg4pFEBVSXZ1pGUmBBNqsJo1ANrR8JKc
 ZR9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yBxqouLHSw03Wm/j4mFMHFYB+Faz71VBDFEeCcJ7oik=;
 b=3gWF48hv26/0sh/2StvABxmBWh65LyK6tAlLzgKb76axYb6pmEDDJG5Ygm7ufVPtng
 /Xr/4AawaHvTfy5TM987dnTSPUyJPHItipjckikC/dBCnqdfNf+6EmiLJ+lCcsnkz47D
 65tZyJqGnFbw+yizgjBaYVpbZzSWTXbDfSLaHKirLxFXEqWyc0UaaYySov7s8yS6gZYI
 E9vnLN+6afizCyHJrbF9bIy2SSGxFdMaUgIiDZmCXK5KNBtk7NttPiQb3FNTrcznGEcy
 89hhZn96yFdeqf7hRGuHBiS4yUOpIHfMHjmeROewgHUwPLn3yaNh5jexMjjU4GDi1IWv
 ncxA==
X-Gm-Message-State: AOAM531yaKXuPkdBCxE2PqfXZRUGolOYWW6vhrN6i6MYo/m69C96klDg
 wq43EZ4VG1SwFa4+rjZHyBjsX/Czpow=
X-Google-Smtp-Source: ABdhPJwJ8MPxiZ7hB2ZI+qy6D6qNM33db6d/AwYx2hSaefk+ZMK2cSHVVxbbWB5G8PZqQ9dJoNOOoQ==
X-Received: by 2002:a17:902:c745:b0:143:d220:9196 with SMTP id
 q5-20020a170902c74500b00143d2209196mr64380877plq.74.1638232687443; 
 Mon, 29 Nov 2021 16:38:07 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 p2sm431554pja.55.2021.11.29.16.38.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 16:38:06 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 29 Nov 2021 16:43:23 -0800
Message-Id: <20211130004324.337399-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211130004324.337399-1-robdclark@gmail.com>
References: <20211130004324.337399-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH igt 1/2] igt: Split out I/O helpers
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

Split the readN()/writeN() helpers out into an igt_io module, so they
can be re-used by tests.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 lib/igt_io.c    | 96 +++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_io.h    | 33 +++++++++++++++++
 lib/igt_sysfs.c | 45 +++--------------------
 lib/meson.build |  1 +
 4 files changed, 135 insertions(+), 40 deletions(-)
 create mode 100644 lib/igt_io.c
 create mode 100644 lib/igt_io.h

diff --git a/lib/igt_io.c b/lib/igt_io.c
new file mode 100644
index 00000000..ad54cbe5
--- /dev/null
+++ b/lib/igt_io.c
@@ -0,0 +1,96 @@
+/*
+ * Copyright © 2016 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ */
+
+#include <errno.h>
+#include <stdlib.h>
+#include <unistd.h>
+
+#include "igt_io.h"
+
+/**
+ * SECTION:igt_io
+ * @short_description: Helpers for file I/O
+ * @title: io
+ * @include: igt_io.h
+ *
+ * This library provides helpers for file I/O
+ */
+
+/**
+ * igt_readn:
+ * @fd: the file descriptor
+ * @buf: buffer where the contents will be stored, allocated by the caller
+ * @size: size of the buffer
+ *
+ * Read from fd into provided buffer until the buffer is full or EOF
+ *
+ * Returns:
+ * -errorno on failure or bytes read on success
+ */
+ssize_t igt_readn(int fd, char *buf, size_t len)
+{
+	ssize_t ret;
+	size_t total = 0;
+
+	do {
+		ret = read(fd, buf + total, len - total);
+		if (ret < 0)
+			ret = -errno;
+		if (ret == -EINTR || ret == -EAGAIN)
+			continue;
+		if (ret <= 0)
+			break;
+		total += ret;
+	} while (total != len);
+	return total ?: ret;
+}
+
+/**
+ * igt_writen:
+ * @fd: the file descriptor
+ * @buf: the block with the contents to write
+ * @len: the length to write
+ *
+ * This writes @len bytes from @data to the sysfs file.
+ *
+ * Returns:
+ * -errorno on failure or bytes read on success
+ */
+ssize_t igt_writen(int fd, const char *buf, size_t len)
+{
+	ssize_t ret;
+	size_t total = 0;
+
+	do {
+		ret = write(fd, buf + total, len - total);
+		if (ret < 0)
+			ret = -errno;
+		if (ret == -EINTR || ret == -EAGAIN)
+			continue;
+		if (ret <= 0)
+			break;
+		total += ret;
+	} while (total != len);
+	return total ?: ret;
+}
diff --git a/lib/igt_io.h b/lib/igt_io.h
new file mode 100644
index 00000000..eb9ffee1
--- /dev/null
+++ b/lib/igt_io.h
@@ -0,0 +1,33 @@
+/*
+ * Copyright © 2016 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ */
+
+#ifndef __IGT_IO_H__
+#define __IGT_IO_H__
+
+#include <stdio.h>
+
+ssize_t igt_readn(int fd, char *buf, size_t len);
+ssize_t igt_writen(int fd, const char *buf, size_t len);
+
+#endif /* __IGT_IO_H__ */
diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index ee75e3ef..f8ef23e2 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -42,6 +42,7 @@
 #include "igt_core.h"
 #include "igt_sysfs.h"
 #include "igt_device.h"
+#include "igt_io.h"
 
 /**
  * SECTION:igt_sysfs
@@ -53,42 +54,6 @@
  * provides basic support for like igt_sysfs_open().
  */
 
-static ssize_t readN(int fd, char *buf, size_t len)
-{
-	ssize_t ret;
-	size_t total = 0;
-
-	do {
-		ret = read(fd, buf + total, len - total);
-		if (ret < 0)
-			ret = -errno;
-		if (ret == -EINTR || ret == -EAGAIN)
-			continue;
-		if (ret <= 0)
-			break;
-		total += ret;
-	} while (total != len);
-	return total ?: ret;
-}
-
-static ssize_t writeN(int fd, const char *buf, size_t len)
-{
-	ssize_t ret;
-	size_t total = 0;
-
-	do {
-		ret = write(fd, buf + total, len - total);
-		if (ret < 0)
-			ret = -errno;
-		if (ret == -EINTR || ret == -EAGAIN)
-			continue;
-		if (ret <= 0)
-			break;
-		total += ret;
-	} while (total != len);
-	return total ?: ret;
-}
-
 /**
  * igt_sysfs_path:
  * @device: fd of the device
@@ -159,7 +124,7 @@ int igt_sysfs_write(int dir, const char *attr, const void *data, int len)
 	if (igt_debug_on(fd < 0))
 		return -errno;
 
-	len = writeN(fd, data, len);
+	len = igt_writen(fd, data, len);
 	close(fd);
 
 	return len;
@@ -185,7 +150,7 @@ int igt_sysfs_read(int dir, const char *attr, void *data, int len)
 	if (igt_debug_on(fd < 0))
 		return -errno;
 
-	len = readN(fd, data, len);
+	len = igt_readn(fd, data, len);
 	close(fd);
 
 	return len;
@@ -237,7 +202,7 @@ char *igt_sysfs_get(int dir, const char *attr)
 	if (igt_debug_on(!buf))
 		goto out;
 
-	while ((ret = readN(fd, buf + offset, rem)) == rem) {
+	while ((ret = igt_readn(fd, buf + offset, rem)) == rem) {
 		char *newbuf;
 
 		newbuf = realloc(buf, 2*len);
@@ -330,7 +295,7 @@ int igt_sysfs_vprintf(int dir, const char *attr, const char *fmt, va_list ap)
 		}
 	}
 
-	ret = writeN(fd, buf, ret);
+	ret = igt_writen(fd, buf, ret);
 
 	close(fd);
 	if (buf != stack)
diff --git a/lib/meson.build b/lib/meson.build
index 297b0ad2..b9568a71 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -19,6 +19,7 @@ lib_sources = [
 	'igt_aux.c',
 	'igt_gt.c',
 	'igt_halffloat.c',
+	'igt_io.c',
 	'igt_matrix.c',
 	'igt_params.c',
 	'igt_perf.c',
-- 
2.33.1

