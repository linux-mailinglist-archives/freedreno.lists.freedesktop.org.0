Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB5B462935
	for <lists+freedreno@lfdr.de>; Tue, 30 Nov 2021 01:38:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 287A889CAC;
	Tue, 30 Nov 2021 00:38:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84D9989C86;
 Tue, 30 Nov 2021 00:38:10 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id o4so18701898pfp.13;
 Mon, 29 Nov 2021 16:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ex6ryLecuMDauByS2PdeOAXHhvBq1BOC5LZy2MNA2Ic=;
 b=XPWMIbM3cOCTJ9sTEyL1OokAi2Zweg4jC7iaxnJW92rjwu5rP9A1a3TN8Nb3GPgW/I
 0nufm21K1VMnxkPZNnMdBopNHamNeEKbh42PlHl/pjFWMke8RmDfr/beHr/O4Ea9YiLI
 qZOg3bVNrSeBeqZrqHZM3I9BVDNO4nAhu7hxoQ1eMfaMcaYd2SKu846D0uMtzdu2CnBX
 aY3XGN/8j/gYcelDl/+7vCv8hlUczXI9Z/WYFvlj7f3GaNMzWMiAnRiXoJH+5nlVkUep
 o4oNZTF9/+7LA5jk9TKTaX94FROdPi/tKZbx22FH4qMax9PN7pJc+CEdiOCUy0ZASpL9
 PSHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ex6ryLecuMDauByS2PdeOAXHhvBq1BOC5LZy2MNA2Ic=;
 b=UpeC5ktMMsvlPtqByS629hHq9MfzNs+EFjl7be0KKQqmg59Qaa/+uyIyd6zQTMz1h9
 YCKEyaDD6vYtyTab2uY5Qo4L/fTncr5rF9EpZ651ksk3bvt80IXWjpk1vn96IYJzzTj3
 l7vYpnwwLtORV2CaJhqsxxKFEXv1UopujlcCpsr2Vg+msCcvPlR1ErQ5L5tkCABRNQ3V
 AdAt/7KCLjw75yz5DPfCLjstBgOvOhPQrpH2Tk63wmOrHTuLS5PNfCbjmJSUUbVUqmkF
 xp+Ze8k8O5J54/ZWt++MdGFdtlzcjzNPs0vn9Jn6AQVEx9sZvC6BLAOsQoHG5pZzCUw7
 9fow==
X-Gm-Message-State: AOAM533VaeFHPD8OZKtYg/z9V3Nk45/CkaPg9vTxWCU/rbIJB8Ety/+a
 slM32YhIUCCqi/f6roBAmIb2mAZyHe8=
X-Google-Smtp-Source: ABdhPJz0tiefMms9tdhNkJTLfBlJ4ZEUw4ve61k38995XSR4/gvHW8CbeWsYg/UsiNeCPJrVtycMAw==
X-Received: by 2002:a05:6a00:2af:b0:4a2:a6f0:8eec with SMTP id
 q15-20020a056a0002af00b004a2a6f08eecmr41902452pfs.23.1638232689507; 
 Mon, 29 Nov 2021 16:38:09 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 m15sm19244575pfk.186.2021.11.29.16.38.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 16:38:08 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 29 Nov 2021 16:43:24 -0800
Message-Id: <20211130004324.337399-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211130004324.337399-1-robdclark@gmail.com>
References: <20211130004324.337399-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH igt 2/2] msm: Add test for kernel buffer
 permissions
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

Tests that reads and/or writes to kernel managed buffers which should be
inaccessible to userspace controlled cmdstream, are indeed inaccessible.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 lib/igt_msm.h       |   1 +
 tests/meson.build   |   1 +
 tests/msm_mapping.c | 257 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 259 insertions(+)
 create mode 100644 tests/msm_mapping.c

diff --git a/lib/igt_msm.h b/lib/igt_msm.h
index 421d23ed..6008020b 100644
--- a/lib/igt_msm.h
+++ b/lib/igt_msm.h
@@ -100,6 +100,7 @@ enum adreno_pm4_type3_packets {
 	CP_WAIT_MEM_GTE = 20,
 	CP_WAIT_REG_MEM = 60,
 	CP_MEM_WRITE = 61,
+	CP_MEM_TO_MEM = 115,
 };
 
 static inline unsigned
diff --git a/tests/meson.build b/tests/meson.build
index 7b7d6bf8..c14acf99 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -60,6 +60,7 @@ test_progs = [
 	'kms_vrr',
 	'kms_writeback',
 	'meta_test',
+	'msm_mapping',
 	'msm_recovery',
 	'msm_submit',
 	'panfrost_get_param',
diff --git a/tests/msm_mapping.c b/tests/msm_mapping.c
new file mode 100644
index 00000000..e1474f9f
--- /dev/null
+++ b/tests/msm_mapping.c
@@ -0,0 +1,257 @@
+/*
+ * Copyright © 2021 Google, Inc.
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
+ */
+
+#include <ctype.h>
+#include <fcntl.h>
+#include <glob.h>
+#include <string.h>
+#include <sys/poll.h>
+#include <sys/stat.h>
+
+#include "igt.h"
+#include "igt_msm.h"
+#include "igt_io.h"
+
+/*
+ * Tests to ensure various kernel controlled buffers are mapped with the
+ * appropriate permissions (either read-only or not-accessible to userspace
+ * controlled cmdstream)
+ */
+
+/*
+ * Helper to get and clear devcore dumps
+ */
+
+static char *
+get_and_clear_devcore(void)
+{
+	glob_t glob_buf = {0};
+	char *buf = NULL;
+	int ret, fd;
+
+	ret = glob("/sys/class/devcoredump/devcd*/data", GLOB_NOSORT, NULL, &glob_buf);
+	if ((ret == GLOB_NOMATCH) || !glob_buf.gl_pathc)
+		return NULL;
+
+	fd = open(glob_buf.gl_pathv[0], O_RDWR);
+
+	if (fd >= 0) {
+		/* We don't need to read the entire devcore, the first bit is
+		 * sufficient for our purposes:
+		 */
+		buf = calloc(1, 0x1000);
+		igt_readn(fd, buf, 0x1000);
+
+		/* Clear the devcore: */
+		igt_writen(fd, "1", 1);
+	}
+
+	globfree(&glob_buf);
+
+	return buf;
+}
+
+/*
+ * Helper to find named buffer address
+ */
+
+static const char *
+get_line(char **buf)
+{
+	char *ret, *eol;
+
+	ret = *buf;
+	eol = strstr(*buf, "\n");
+
+	if (!eol) {
+		/* could be last line in file: */
+		*buf = NULL;
+		return ret;
+	}
+
+	*eol = '\0';
+	*buf += 1 + strlen(ret);
+
+	return ret;
+}
+
+static bool
+endswith(const char *str, const char *end)
+{
+	char *p = strstr(str, end);
+
+	/* Trim trailing whitespace: */
+	if (p) {
+		char *c = p;
+		while (c) {
+			if (isspace(*c)) {
+				*c = '\0';
+				break;
+			}
+			c++;
+		}
+	}
+
+	return p && (strlen(p) == strlen(end));
+}
+
+static uint64_t
+get_bo_addr(int drm_fd, const char *name)
+{
+	char buf[0x4000];
+	char *p = buf;
+
+	igt_debugfs_read(drm_fd, "gem", buf);
+
+	/* NOTE: the contents of the debugfs file look like:
+	 *
+	 *    flags       id ref  offset   kaddr            size     madv      name
+	 *    00040000: I  0 ( 1) 00000000 ffffffc0104b9000 00004096           memptrs
+	 *       vmas: [gpu: aspace=ffffff808bf03e00, 1000000000000,mapped,inuse=1]
+	 *    00020002: I  0 ( 1) 00000000 ffffffc012001000 00032768           ring0
+	 *       vmas: [gpu: aspace=ffffff808bf03e00, 1000000001000,mapped,inuse=1]
+	 *
+	 * There can be potentially multiple vma's per bo, listed on the lines
+	 * following the line for the buffer (which ends in the buffer name),
+	 * but this should not be the case for any kernel controlled buffers.
+	 */
+
+	while (*p) {
+		const char *line = get_line(&p);
+
+		if (endswith(line, name)) {
+			uint64_t addr, dummy;
+			int ret;
+
+			line = get_line(&p);
+
+			igt_fail_on(!line);
+
+			ret = sscanf(line, "      vmas: [gpu: aspace=%"PRIx64", %"PRIx64",mapped,inuse=1]",
+					&dummy, &addr);
+			igt_fail_on(ret != 2);
+
+			return addr;
+		}
+	}
+
+	return 0;
+}
+
+/*
+ * Helper for testing access to the named buffer
+ */
+static void
+do_mapping_test(struct msm_pipe *pipe, const char *buffername, bool write)
+{
+	struct msm_bo *scratch_bo = NULL;
+	struct msm_cmd *cmd;
+	char *devcore, *s;
+	uint64_t addr, fault_addr;
+	int fence_fd, ret;
+
+	/* Clear any existing devcore's: */
+	while ((devcore = get_and_clear_devcore())) {
+		free(devcore);
+	}
+
+	addr = get_bo_addr(pipe->dev->fd, buffername);
+	igt_skip_on(addr == 0);
+
+	cmd = igt_msm_cmd_new(pipe, 0x1000);
+
+	if (write) {
+		msm_cmd_pkt7(cmd, CP_MEM_WRITE, 3);
+		msm_cmd_emit(cmd, lower_32_bits(addr));  /* ADDR_LO */
+		msm_cmd_emit(cmd, upper_32_bits(addr));  /* ADDR_HI */
+		msm_cmd_emit(cmd, 0x123);                /* VAL */
+	} else {
+		scratch_bo = igt_msm_bo_new(pipe->dev, 0x1000, MSM_BO_WC);
+		msm_cmd_pkt7(cmd, CP_MEM_TO_MEM, 5);
+		msm_cmd_emit(cmd, 0);
+		msm_cmd_bo  (cmd, scratch_bo, 0);        /* DEST_ADDR_LO/HI */
+		msm_cmd_emit(cmd, lower_32_bits(addr));  /* SRC_A_ADDR_LO */
+		msm_cmd_emit(cmd, upper_32_bits(addr));  /* SRC_A_ADDR_HI */
+	}
+
+	fence_fd = igt_msm_cmd_submit(cmd);
+
+	/* Wait for submit to complete: */
+	poll(&(struct pollfd){fence_fd, POLLIN}, 1, -1);
+	close(fence_fd);
+
+	igt_msm_bo_free(scratch_bo);
+
+	/* And now we should have gotten a devcore from the iova fault
+	 * triggered by the read or write:
+	 */
+	devcore = get_and_clear_devcore();
+	igt_fail_on(!devcore);
+
+	/* Make sure the devcore is from iova fault: */
+	igt_fail_on(!strstr(devcore, "fault-info"));
+
+	s = strstr(devcore, "  - far: ");
+	igt_fail_on(!s);
+
+	ret = sscanf(s, "  - far: %"PRIx64, &fault_addr);
+	igt_fail_on(ret != 1);
+	igt_fail_on(addr != fault_addr);
+}
+
+/*
+ * Tests for drm/msm hangcheck, recovery, and fault handling
+ */
+
+igt_main
+{
+	struct msm_device *dev = NULL;
+	struct msm_pipe *pipe = NULL;
+
+	igt_fixture {
+		dev = igt_msm_dev_open();
+		pipe = igt_msm_pipe_open(dev, 0);
+	}
+
+	igt_describe("Test ringbuffer mapping, should be read-only");
+	igt_subtest("ring") {
+		do_mapping_test(pipe, "ring0", true);
+	}
+
+	igt_describe("Test sqefw mapping, should be read-only");
+	igt_subtest("sqefw") {
+		igt_require(dev->gen >= 6);
+		do_mapping_test(pipe, "sqefw", true);
+	}
+
+	igt_describe("Test shadow mapping, should be inaccessible");
+	igt_subtest("shadow") {
+		do_mapping_test(pipe, "shadow", true);
+		do_mapping_test(pipe, "shadow", false);
+	}
+
+	igt_fixture {
+		igt_msm_pipe_close(pipe);
+		igt_msm_dev_close(dev);
+	}
+}
-- 
2.33.1

