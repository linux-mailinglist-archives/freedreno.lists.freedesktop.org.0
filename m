Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 563B33F6BDD
	for <lists+freedreno@lfdr.de>; Wed, 25 Aug 2021 00:45:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B24AE6E0EB;
	Tue, 24 Aug 2021 22:45:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3A766E0EA;
 Tue, 24 Aug 2021 22:45:21 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id c4so13147228plh.7;
 Tue, 24 Aug 2021 15:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AIQD0/ed7PF/KiqM//O+N8hKXcL86AFA/U8Q7Sp3t2s=;
 b=N1zibkPfV1UtZ6x/hyhOeDsGuESlkGZsI4+9LaAQFRDVOfujT9KFpZrzzx0NJ47Hxz
 JjgCb6EwDlzIoYbI5/rXp6RG0qPCDvDFfJtp1L1krwR08//xZATeSJy3FbLET9LuBs1C
 Lg9+kXFtXTv6czlB4njeZ6uk0KxNcRGn2EU6MPQxaHyuNgyAJWAwblqtTVjRGKV5Ql1n
 wnE/5T/I4V4eEg7eq+qVSo7M84IXPNNvd8vaTulv3uRUPS5AcAIDxKo6LjF21rh+Hmt/
 aYdslgZyOPP+wLR0Nnk3RSbFn4qm5skbTSw02nJKk4kmIXFyw1cvQ8cXbjmE3WshCs5Y
 i6gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AIQD0/ed7PF/KiqM//O+N8hKXcL86AFA/U8Q7Sp3t2s=;
 b=fbFx2aqQGvWMbJbQvLyZvd17ikol5AyEEN0W6XlekIfcKao+VPHcf/UcJtOw4fLYUJ
 oOnjD0wDS4yCSOpYMbbIjw1qcq4sG9y8ft2xEbQVvrXOWf9b4A4ByHsg/Ng5kibLvJ7Z
 PlRbIiz8f4dTTDTGqItSW+sdaefRXgWW8RgN7J+vpm5l6IFcZ4TseaKGyHGIeV2lVDP7
 3eNQdcErRFTS8KjiXV6Oi9+/xMTAxAL0maAcq93JT2Oosxn5LqOhRsrMkYxI/PXd82Si
 J9g/ts8X4emDfO8E9Bpz6lGjYwpXgdzmrOJ+MYVeHDmOypwJ4U5stPFM+ZkMvYpGuSD/
 WRHA==
X-Gm-Message-State: AOAM531mb9UxvvNyb1SoyTYiRY79nnsdur74RlPBfpc66gVnVw3GW65V
 GXVtFC3dLVHFm95BHtp4SYSC5Ac7/HQ=
X-Google-Smtp-Source: ABdhPJyGFr6UDKRqejYTXEUWTOUWKig004QMvmFR7OMWzG4fYTxdp9gyW3NOmdHQYybPUaL4nXT5mA==
X-Received: by 2002:a17:90a:1f09:: with SMTP id
 u9mr6838263pja.206.1629845120833; 
 Tue, 24 Aug 2021 15:45:20 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 11sm19814433pfl.41.2021.08.24.15.45.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 15:45:20 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Akhil P Oommen <akhilpo@codeaurora.org>, Rob Clark <robdclark@chromium.org>
Date: Tue, 24 Aug 2021 15:49:32 -0700
Message-Id: <20210824224932.564352-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210824224932.564352-1-robdclark@gmail.com>
References: <20210824224932.564352-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH igt 3/3] msm: Add submit ioctl tests
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Add an initial set of tests for the submit ioctl.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 tests/meson.build  |   1 +
 tests/msm_submit.c | 188 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 189 insertions(+)
 create mode 100644 tests/msm_submit.c

diff --git a/tests/meson.build b/tests/meson.build
index 1bdfddbb..ff7c709a 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -107,6 +107,7 @@ test_progs = [
 	'vc4_wait_seqno',
 	'vgem_basic',
 	'vgem_slow',
+	'msm_submit',
 ]
 
 i915_progs = [
diff --git a/tests/msm_submit.c b/tests/msm_submit.c
new file mode 100644
index 00000000..9c7d6d4b
--- /dev/null
+++ b/tests/msm_submit.c
@@ -0,0 +1,188 @@
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
+#include "igt.h"
+#include "igt_msm.h"
+
+igt_main
+{
+	struct msm_device *dev;
+	struct msm_pipe *pipe;
+	struct msm_bo *a, *b;
+	unsigned gen;
+
+	igt_fixture {
+		dev = igt_msm_dev_open();
+		pipe = igt_msm_pipe_open(dev, 0);
+		gen = igt_msm_pipe_gen(pipe);
+		a = igt_msm_bo_new(dev, 0x1000, MSM_BO_WC);
+		b = igt_msm_bo_new(dev, 0x1000, MSM_BO_WC);
+	}
+
+	igt_subtest("empty-submit") {
+		struct drm_msm_gem_submit req = {
+				.flags   = pipe->pipe,
+				.queueid = pipe->submitqueue_id,
+		};
+		do_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_SUBMIT, &req);
+	}
+
+	igt_subtest("invalid-queue-submit") {
+		struct drm_msm_gem_submit req = {
+				.flags   = pipe->pipe,
+				.queueid = 0x1234,
+		};
+		do_ioctl_err(dev->fd, DRM_IOCTL_MSM_GEM_SUBMIT, &req, ENOENT);
+	}
+
+	igt_subtest("invalid-flags-submit") {
+		struct drm_msm_gem_submit req = {
+				.flags   = 0x1234,
+				.queueid = pipe->submitqueue_id,
+		};
+		do_ioctl_err(dev->fd, DRM_IOCTL_MSM_GEM_SUBMIT, &req, EINVAL);
+	}
+
+	igt_subtest("invalid-in-fence-submit") {
+		struct drm_msm_gem_submit req = {
+				.flags   = pipe->pipe | MSM_SUBMIT_FENCE_FD_IN,
+				.queueid = pipe->submitqueue_id,
+				.fence_fd = dev->fd,  /* This is not a fence fd! */
+		};
+		do_ioctl_err(dev->fd, DRM_IOCTL_MSM_GEM_SUBMIT, &req, EINVAL);
+	}
+
+	igt_subtest("invalid-duplicate-bo-submit") {
+		struct drm_msm_gem_submit_bo bos[] = {
+			[0] = {
+				.handle     = a->handle,
+				.flags      = MSM_SUBMIT_BO_READ,
+			},
+			[1] = {
+				.handle     = b->handle,
+				.flags      = MSM_SUBMIT_BO_READ,
+			},
+			[2] = {
+				/* this is invalid.. there should not be two entries
+				 * for the same bo, instead a single entry w/ all
+				 * usage flags OR'd together should be used.  Kernel
+				 * should catch this, and return an error code after
+				 * cleaning up properly (not leaking any bo's)
+				 */
+				.handle     = a->handle,
+				.flags      = MSM_SUBMIT_BO_WRITE,
+			},
+		};
+		struct drm_msm_gem_submit req = {
+				.flags   = pipe->pipe,
+				.queueid = pipe->submitqueue_id,
+				.nr_bos  = ARRAY_SIZE(bos),
+				.bos     = VOID2U64(bos),
+		};
+		do_ioctl_err(dev->fd, DRM_IOCTL_MSM_GEM_SUBMIT, &req, EINVAL);
+	}
+
+	igt_subtest("invalid-cmd-idx-submit") {
+		struct drm_msm_gem_submit_cmd cmds[] = {
+			[0] = {
+				.type       = MSM_SUBMIT_CMD_BUF,
+				.submit_idx = 0,      /* bos[0] does not exist */
+				.size       = 4 * 4,  /* 4 dwords in cmdbuf */
+			},
+		};
+		struct drm_msm_gem_submit req = {
+				.flags   = pipe->pipe,
+				.queueid = pipe->submitqueue_id,
+				.nr_cmds    = ARRAY_SIZE(cmds),
+				.cmds       = VOID2U64(cmds),
+		};
+		do_ioctl_err(dev->fd, DRM_IOCTL_MSM_GEM_SUBMIT, &req, EINVAL);
+	}
+
+	igt_subtest("invalid-cmd-type-submit") {
+		struct drm_msm_gem_submit_bo bos[] = {
+			[0] = {
+				.handle     = a->handle,
+				.flags      = MSM_SUBMIT_BO_READ,
+			},
+		};
+		struct drm_msm_gem_submit_cmd cmds[] = {
+			[0] = {
+				.type       = 0x1234,
+				.submit_idx = 0,
+				.size       = 4 * 4,  /* 4 dwords in cmdbuf */
+			},
+		};
+		struct drm_msm_gem_submit req = {
+				.flags   = pipe->pipe,
+				.queueid = pipe->submitqueue_id,
+				.nr_cmds    = ARRAY_SIZE(cmds),
+				.cmds       = VOID2U64(cmds),
+				.nr_bos  = ARRAY_SIZE(bos),
+				.bos     = VOID2U64(bos),
+		};
+		do_ioctl_err(dev->fd, DRM_IOCTL_MSM_GEM_SUBMIT, &req, EINVAL);
+	}
+
+	igt_subtest("valid-submit") {
+		struct drm_msm_gem_submit_bo bos[] = {
+			[0] = {
+				.handle     = a->handle,
+				.flags      = MSM_SUBMIT_BO_READ,
+			},
+		};
+		struct drm_msm_gem_submit_cmd cmds[] = {
+			[0] = {
+				.type       = MSM_SUBMIT_CMD_BUF,
+				.submit_idx = 0,
+				.size       = 4 * 4,  /* 4 dwords in cmdbuf */
+			},
+		};
+		struct drm_msm_gem_submit req = {
+				.flags   = pipe->pipe,
+				.queueid = pipe->submitqueue_id,
+				.nr_cmds    = ARRAY_SIZE(cmds),
+				.cmds       = VOID2U64(cmds),
+				.nr_bos  = ARRAY_SIZE(bos),
+				.bos     = VOID2U64(bos),
+		};
+		uint32_t *cmdstream = igt_msm_bo_map(a);
+		if (gen >= 5) {
+			*(cmdstream++) = pm4_pkt7_hdr(CP_NOP, 3);
+		} else {
+			*(cmdstream++) = pm4_pkt3_hdr(CP_NOP, 3);
+		}
+		*(cmdstream++) = 0;
+		*(cmdstream++) = 0;
+		*(cmdstream++) = 0;
+
+		do_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_SUBMIT, &req);
+	}
+
+	igt_fixture {
+		igt_msm_bo_free(a);
+		igt_msm_bo_free(b);
+		igt_msm_pipe_close(pipe);
+		igt_msm_dev_close(dev);
+	}
+}
-- 
2.31.1

