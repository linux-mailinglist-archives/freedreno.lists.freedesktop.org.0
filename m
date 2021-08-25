Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C343F7F04
	for <lists+freedreno@lfdr.de>; Thu, 26 Aug 2021 01:27:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17D1D6E444;
	Wed, 25 Aug 2021 23:27:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 971F26E441;
 Wed, 25 Aug 2021 23:27:21 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id m17so538621plc.6;
 Wed, 25 Aug 2021 16:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6rbkJU5Og6H1G2/+RhkyDxpDT8jQjtOSrnMdlUzo1BM=;
 b=HgrSvM72m3zLW4Qd+/L57IQD7eRaWgq7TpYUsRMxP6bAYgmHkb35ZXwdZ3zR7oCjIW
 m84MVBpYf0P0XI0u4Sae3UCF3FZbyjfWwu2yxGB9SIsckzyEkXjaV5/EcBEM1AeKiiVR
 0S47860H4itWT3W3KmtcFd3QcG3SZpi9JgJdFEJdhJ4AJOq+zoEqvsF0dc/FXT0+OYb7
 3rsQ4twoJhj2xdwYwPm5PxbdS6e6QkhA4ewXeQrmmyjgqgiBMMH9XkR2KvyGiKR65Rzq
 u+OPyrs1GI6GjSkv4gxIr5AVDmiiKrpYz/wEMeRf5xKWr9cEzAO+/c9bpbF4eB4ZiTMo
 v9cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6rbkJU5Og6H1G2/+RhkyDxpDT8jQjtOSrnMdlUzo1BM=;
 b=KjrZGdCZH4N5lvcmODJP2BNZOxlbyQZrqV6rdgY8s8O0yCB6JnD13OTrfyVSJJ0ZSG
 eGL9CRFhOp1fabqTwWVKdk92c86F0CCkXqS4nH4YNvpFLFn9aGVcughN/BDb50k8v8LL
 YUjx2mKtQBK3fYBWfc1oS2YXALcpwCZ1tY3xMtv0UMK+wgUYQ47+LCxHDvyQ9sdeKB1G
 6PiomOCPeDcctMisHQPs8SfhhYIUWBLmdQqJiAcCoMjavdsLiJZBlJasUwy97Nr8xEtE
 tyNF30Z1ggcnrFZQAH6UnZXpRvS4rLID7mdQDBDuSVR4Fj8QL/ekNoQfGGSznYVS7rVZ
 6Bvg==
X-Gm-Message-State: AOAM530BPDhLzzNYY7dMi54mF5WIZLTyEVfZQwOHgmfTg+JwSvycO0Fa
 pmD7tLXP/rnXuMBmH43zC8X0BJ3Fzg4=
X-Google-Smtp-Source: ABdhPJyuM3yU1udzOEvRaP7Uhd8O10/38NggoCBg1bTFLmGzKOLvE7/w+qBcRM2Dh38orYnHDtEn2g==
X-Received: by 2002:a17:902:7049:b0:131:bdef:522d with SMTP id
 h9-20020a170902704900b00131bdef522dmr837390plt.85.1629934040417; 
 Wed, 25 Aug 2021 16:27:20 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id w3sm738683pfn.96.2021.08.25.16.27.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 16:27:19 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Petri Latvala <petri.latvala@intel.com>, Rob Clark <robdclark@chromium.org>
Date: Wed, 25 Aug 2021 16:31:39 -0700
Message-Id: <20210825233139.1066504-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210825233139.1066504-1-robdclark@gmail.com>
References: <20210825233139.1066504-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH igt v2 3/3] msm: Add submit ioctl tests
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
 tests/msm_submit.c | 186 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 187 insertions(+)
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
index 00000000..da93c574
--- /dev/null
+++ b/tests/msm_submit.c
@@ -0,0 +1,186 @@
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
+
+	igt_fixture {
+		dev = igt_msm_dev_open();
+		pipe = igt_msm_pipe_open(dev, 0);
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
+		if (dev->gen >= 5) {
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

