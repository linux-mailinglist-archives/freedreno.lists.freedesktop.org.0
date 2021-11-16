Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6948451D54
	for <lists+freedreno@lfdr.de>; Tue, 16 Nov 2021 01:25:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FBC76EC71;
	Tue, 16 Nov 2021 00:25:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FFBD6EC44;
 Tue, 16 Nov 2021 00:25:40 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id gt5so14261632pjb.1;
 Mon, 15 Nov 2021 16:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k7lGfQSlACVtmKPY7MYkum6iWV/NVhCko7gGmCLwO+8=;
 b=MjtROySt3W1dvvK3rduF5OMGGyMev8BBqpFTSXk4rovQOt7uS3ZeWOEBnOYT4v3xTp
 RFgdIVpxIXL4rxP4RHxctbw6B9v1bDgnFHZEQW6bZBG8WipNy5fX57/DjOTES8wdJkYt
 6Tk6JvZrVKNCOsw7/z+qZD3kiAfQ24vCKdGNloWs4AmXtnTGrb36Dl+VriuHFf0hM6B5
 vlYGJb4yg/4HwpC3zfTTk+FfCONLQqGcUrp8fEHxypQL23oefuiLSTloy4fSsqmP4ah5
 8L7ePOWePsZwdeMMBvmR8cp1lZThtPxY4oa/OlV1tTSh78YEZ04Q3qdd+VCIaKUizcRD
 wgQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k7lGfQSlACVtmKPY7MYkum6iWV/NVhCko7gGmCLwO+8=;
 b=D8CjV8yEW2MBOObyCF+4EXZMOfyaPD29sZjhDt7C8G97PB0QHBIlwhEKB/gcQxXCmn
 3LptLSpnR83Xl/5Axlepr1AGqWiqrm6LdTZaxqLy5FFRiD8AUdLLywlidBtr0sJRoFFC
 u4Lc0B6R+6Fyv40o3hTYHwQjxWPvOHFCQVytEa2IjPlCQsgWty9Ap+MTRdqu/oRNmz2b
 vELASoEF9Qku73kvVD1m/A1IvBN+eFGzHsDW+lCylsFBTXfql+vFzALK2PYdNblS2+FF
 cr3ECBATi6YSXSfXvCY3S/OCyQgE51UhdT09JPvfARfMsJrnqeiNHtHXFVPKZDqWoVZQ
 TaLg==
X-Gm-Message-State: AOAM5337hSs8NPCtt6wDJR2IkT48Et3xXyWxLNqRtCKrR/UeN9kbZcDL
 eLwuzm7+I7UWjpUo2Uyd1Gy5BAsDo1A=
X-Google-Smtp-Source: ABdhPJzfufKwIlJCEmy8FR+3FHh6OCQQSqTeGNo42exVcCzfdjuAd+lkkS15qBPovOFl9VfV0cDvNA==
X-Received: by 2002:a17:903:2341:b0:142:1b63:98f3 with SMTP id
 c1-20020a170903234100b001421b6398f3mr40677727plh.49.1637022339257; 
 Mon, 15 Nov 2021 16:25:39 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 l11sm16500520pfu.129.2021.11.15.16.25.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 16:25:38 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 15 Nov 2021 16:30:42 -0800
Message-Id: <20211116003042.439107-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211116003042.439107-1-robdclark@gmail.com>
References: <20211116003042.439107-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH igt v3 4/4] msm: Add recovery tests
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

Add tests to exercise:

1. sw hangcheck timeout
2. gpu fault (hang) recovery
3. iova fault recovery

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 lib/igt_msm.h        |   3 +
 tests/meson.build    |   1 +
 tests/msm_recovery.c | 174 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 178 insertions(+)
 create mode 100644 tests/msm_recovery.c

diff --git a/lib/igt_msm.h b/lib/igt_msm.h
index 1a66c806..421d23ed 100644
--- a/lib/igt_msm.h
+++ b/lib/igt_msm.h
@@ -97,6 +97,9 @@ enum adreno_pm4_packet_type {
 
 enum adreno_pm4_type3_packets {
 	CP_NOP = 16,
+	CP_WAIT_MEM_GTE = 20,
+	CP_WAIT_REG_MEM = 60,
+	CP_MEM_WRITE = 61,
 };
 
 static inline unsigned
diff --git a/tests/meson.build b/tests/meson.build
index 0af3e03a..166e3494 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -60,6 +60,7 @@ test_progs = [
 	'kms_vrr',
 	'kms_writeback',
 	'meta_test',
+	'msm_recovery',
 	'msm_submit',
 	'panfrost_get_param',
 	'panfrost_gem_new',
diff --git a/tests/msm_recovery.c b/tests/msm_recovery.c
new file mode 100644
index 00000000..890c543a
--- /dev/null
+++ b/tests/msm_recovery.c
@@ -0,0 +1,174 @@
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
+#include <fcntl.h>
+#include <sys/poll.h>
+
+#include "igt.h"
+#include "igt_msm.h"
+
+static struct msm_device *dev;
+static struct msm_bo *scratch_bo;
+static uint32_t *scratch;
+
+/*
+ * Helpers for cmdstream packet building:
+ */
+
+static void
+wait_mem_gte(struct msm_cmd *cmd, uint32_t offset_dwords, uint32_t ref)
+{
+	msm_cmd_pkt7(cmd, CP_WAIT_MEM_GTE, 4);
+	msm_cmd_emit(cmd, 0);                              /* RESERVED */
+	msm_cmd_bo  (cmd, scratch_bo, offset_dwords * 4);  /* POLL_ADDR_LO/HI */
+	msm_cmd_emit(cmd, ref);                            /* REF */
+}
+
+static void
+mem_write(struct msm_cmd *cmd, uint32_t offset_dwords, uint32_t val)
+{
+	msm_cmd_pkt7(cmd, CP_MEM_WRITE, 3);
+	msm_cmd_bo  (cmd, scratch_bo, offset_dwords * 4);  /* ADDR_LO/HI */
+	msm_cmd_emit(cmd, val);                            /* VAL */
+}
+
+/*
+ * Helper to wait on a fence-fd:
+ */
+static void
+wait_and_close(int fence_fd)
+{
+	poll(&(struct pollfd){fence_fd, POLLIN}, 1, -1);
+	close(fence_fd);
+}
+
+/*
+ * Helper for hang tests.  Emits multiple submits, with one in the middle
+ * that triggers a fault, and confirms that the submits before and after
+ * the faulting one execute properly, ie. that the driver properly manages
+ * to recover and re-queue the submits after the faulting submit;
+ */
+static void
+do_hang_test(struct msm_pipe *pipe)
+{
+	struct msm_cmd *cmds[16];
+	int fence_fds[ARRAY_SIZE(cmds)];
+
+	memset(scratch, 0, 0x1000);
+
+	for (unsigned i = 0; i < ARRAY_SIZE(cmds); i++) {
+		struct msm_cmd *cmd = igt_msm_cmd_new(pipe, 0x1000);
+
+		cmds[i] = cmd;
+
+		/*
+		 * Emit a packet to wait for scratch[0] to be >= 1
+		 *
+		 * This lets us force the GPU to wait until all the cmdstream is
+		 * queued up.
+		 */
+		wait_mem_gte(cmd, 0, 1);
+
+		if (i == 10) {
+			msm_cmd_emit(cmd, 0xdeaddead);
+		}
+
+		/* Emit a packet to write scratch[1+i] = 2+i: */
+		mem_write(cmd, 1+i, 2+i);
+	}
+
+	for (unsigned i = 0; i < ARRAY_SIZE(cmds); i++) {
+		fence_fds[i] = igt_msm_cmd_submit(cmds[i]);
+	}
+
+	usleep(10000);
+
+	/* Let the WAIT_MEM_GTE complete: */
+	scratch[0] = 1;
+
+	for (unsigned i = 0; i < ARRAY_SIZE(cmds); i++) {
+		wait_and_close(fence_fds[i]);
+		igt_msm_cmd_free(cmds[i]);
+		if (i == 10)
+			continue;
+		igt_assert_eq(scratch[1+i], 2+i);
+	}
+}
+
+/*
+ * Tests for drm/msm hangcheck, recovery, and fault handling
+ */
+
+igt_main
+{
+	static struct msm_pipe *pipe = NULL;
+
+	igt_fixture {
+		dev = igt_msm_dev_open();
+		pipe = igt_msm_pipe_open(dev, 0);
+		scratch_bo = igt_msm_bo_new(dev, 0x1000, MSM_BO_WC);
+		scratch = igt_msm_bo_map(scratch_bo);
+	}
+
+	igt_describe("Test sw hangcheck handling");
+	igt_subtest("hangcheck") {
+		igt_require(dev->gen >= 6);
+		igt_require(igt_debugfs_exists(dev->fd, "disable_err_irq", O_WRONLY));
+
+		/* Disable hw hang detection to force fallback to sw hangcheck: */
+		igt_debugfs_write(dev->fd, "disable_err_irq", "Y");
+
+		do_hang_test(pipe);
+
+		igt_debugfs_write(dev->fd, "disable_err_irq", "N");
+	}
+
+	igt_describe("Test hw fault handling");
+	igt_subtest("gpu-fault") {
+		igt_require(dev->gen >= 6);
+
+		do_hang_test(pipe);
+	}
+
+	igt_describe("Test iova fault handling");
+	igt_subtest("iova-fault") {
+		struct msm_cmd *cmd;
+
+		igt_require(dev->gen >= 6);
+
+		cmd = igt_msm_cmd_new(pipe, 0x1000);
+
+		msm_cmd_pkt7(cmd, CP_MEM_WRITE, 3);
+		msm_cmd_emit(cmd, 0xdeaddead);           /* ADDR_LO */
+		msm_cmd_emit(cmd, 0x1);                  /* ADDR_HI */
+		msm_cmd_emit(cmd, 0x123);                /* VAL */
+
+		wait_and_close(igt_msm_cmd_submit(cmd));
+	}
+
+	igt_fixture {
+		igt_msm_bo_free(scratch_bo);
+		igt_msm_pipe_close(pipe);
+		igt_msm_dev_close(dev);
+	}
+}
-- 
2.33.1

