Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E65451D53
	for <lists+freedreno@lfdr.de>; Tue, 16 Nov 2021 01:25:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BB466EC1B;
	Tue, 16 Nov 2021 00:25:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 674976EB3E;
 Tue, 16 Nov 2021 00:25:38 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id p18so15807090plf.13;
 Mon, 15 Nov 2021 16:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PqrW9nHWzQpTwPt4kFO8L0a1eBCCO9fOX9w/ulJ/Q8U=;
 b=jncI4Fib4NDM+mtOm4qFC9nFR2R+XoQNEuVyQNR5ikFdFMWDGqWy+tZDRjSJaJcLMq
 RSiHiFJfitEzPKTVmAWb9J4hszkUm1XgtWPn1ESUwy2PpKVVA/gCgq+sf8HEsmw3NSdC
 6SPhjmp67oenC/MVLvlyCfcMXv0dzhcLPYRXTF9ACFQFto7IzYcqbsx9aDyhZyCpuidN
 zRLNW7P/rMIbpmeB8spPrs0VDtmuDH5PidAyXRpn9zIuFSTrZyI/SdX/xNJbS8IbANKj
 gr0a6x26yslIowdXEsRObsmtMMNVeYruqWkKAM0tCGyz/kwHydw4QELymcWwnLeuBIA9
 qnKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PqrW9nHWzQpTwPt4kFO8L0a1eBCCO9fOX9w/ulJ/Q8U=;
 b=y2ezx9Sf/su9154FQwd72NSM5Gv2RHgxJz6oEzhRlUvAKjn4WlulXWN0PIym0qUjWO
 0HSySjp3WcakwIQmW4KyWaQagXHSzC0BlJXGJpB3eSajTC/rnJ4DyamBr56BXkEtBVfe
 tOFB4gLAPh8PKSP5wPS/7Z/cCeiT4Z68T6zkKh2o8Qq2rmiZYOoHBXmIOtA58icfUSDd
 nrek8eQV1rc/FLaSjH/RQhVtyZ/ljyWhMX+ZO1hqzSQSmBgnjU+F6gmIx+tWSVdBRSlw
 /ScMDlmigJsBLRINuYptLv2Cv/zkhySNSfjqogoFHGMtREvVx6VV8sgKhUohTd0bMhYo
 fJcg==
X-Gm-Message-State: AOAM532LUNco2dd0f8VFSB3hLVVceAqu+JN8o+J6UuxU/7eQ3L/CiZhe
 wKkfFhTwiAU7SjE7oGtADg1K88l3lP8=
X-Google-Smtp-Source: ABdhPJwqzUGTfrfWsbR/mtWm9PMJvguyYDys47yVA2udV6WViPmULPzvWEUnUu7gM3koMKvC1JW6GQ==
X-Received: by 2002:a17:902:a584:b0:143:c2e3:c4 with SMTP id
 az4-20020a170902a58400b00143c2e300c4mr17031107plb.69.1637022337312; 
 Mon, 15 Nov 2021 16:25:37 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 qe2sm415449pjb.42.2021.11.15.16.25.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 16:25:36 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 15 Nov 2021 16:30:41 -0800
Message-Id: <20211116003042.439107-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211116003042.439107-1-robdclark@gmail.com>
References: <20211116003042.439107-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH igt v3 3/4] msm: Add helper for cmdstream
 building and submission
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

A pretty minimal subset compared to what a full gallium driver would
need, but OTOH for igt tests we should only need to emit fairly basic
command stream.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 lib/igt_msm.c | 102 ++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_msm.h |  48 ++++++++++++++++++++++++
 2 files changed, 150 insertions(+)

diff --git a/lib/igt_msm.c b/lib/igt_msm.c
index b9534164..e9cf588f 100644
--- a/lib/igt_msm.c
+++ b/lib/igt_msm.c
@@ -91,6 +91,19 @@ igt_msm_dev_close(struct msm_device *dev)
 	free(dev);
 }
 
+static uint64_t
+get_iova(struct msm_bo *bo)
+{
+	struct drm_msm_gem_info req = {
+			.handle = bo->handle,
+			.info = MSM_INFO_GET_IOVA,
+	};
+
+	do_ioctl(bo->dev->fd, DRM_IOCTL_MSM_GEM_INFO, &req);
+
+	return req.value;
+}
+
 /**
  * igt_msm_bo_new:
  * @dev: the device to allocate the BO from
@@ -115,6 +128,7 @@ igt_msm_bo_new(struct msm_device *dev, size_t size, uint32_t flags)
 	do_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_NEW, &req);
 
 	bo->handle = req.handle;
+	bo->iova = get_iova(bo);
 
 	return bo;
 }
@@ -209,3 +223,91 @@ igt_msm_pipe_close(struct msm_pipe *pipe)
 	do_ioctl(pipe->dev->fd, DRM_IOCTL_MSM_SUBMITQUEUE_CLOSE, &pipe->submitqueue_id);
 	free(pipe);
 }
+
+/**
+ * igt_msm_cmd_new:
+ * @pipe: the submitqueue to submit cmdstream against
+ * @size: the size of requested cmdstream buffer
+ */
+struct msm_cmd *
+igt_msm_cmd_new(struct msm_pipe *pipe, size_t size)
+{
+	struct msm_cmd *cmd = calloc(1, sizeof(*cmd));
+
+	cmd->pipe = pipe;
+	cmd->cmdstream_bo = igt_msm_bo_new(pipe->dev, size, MSM_BO_WC);
+	cmd->cur = igt_msm_bo_map(cmd->cmdstream_bo);
+
+	__igt_msm_append_bo(cmd, cmd->cmdstream_bo);
+
+	return cmd;
+}
+
+static uint32_t
+cmdstream_size(struct msm_cmd *cmd)
+{
+	uint8_t *start = igt_msm_bo_map(cmd->cmdstream_bo);
+	return (uint8_t *)cmd->cur - start;
+}
+
+/**
+ * igt_msm_cmd_submit:
+ * @cmd: the command stream object to submit
+ *
+ * Returns dma-fence fd
+ */
+int
+igt_msm_cmd_submit(struct msm_cmd *cmd)
+{
+	struct drm_msm_gem_submit_bo bos[cmd->nr_bos];
+	struct drm_msm_gem_submit_cmd cmds[] = {
+		[0] = {
+			.type       = MSM_SUBMIT_CMD_BUF,
+			.submit_idx = 0,
+			.size       = cmdstream_size(cmd),
+		},
+	};
+	struct drm_msm_gem_submit req = {
+			.flags   = cmd->pipe->pipe | MSM_SUBMIT_FENCE_FD_OUT,
+			.queueid = cmd->pipe->submitqueue_id,
+			.nr_cmds = ARRAY_SIZE(cmds),
+			.cmds    = VOID2U64(cmds),
+			.nr_bos  = ARRAY_SIZE(bos),
+			.bos     = VOID2U64(bos),
+	};
+
+	for (unsigned i = 0; i < cmd->nr_bos; i++) {
+		bos[i] = (struct drm_msm_gem_submit_bo) {
+			.handle  = cmd->bos[i]->handle,
+			.flags   = MSM_SUBMIT_BO_READ | MSM_SUBMIT_BO_WRITE,
+		};
+	}
+
+	do_ioctl(cmd->pipe->dev->fd, DRM_IOCTL_MSM_GEM_SUBMIT, &req);
+
+	return req.fence_fd;
+}
+
+void
+__igt_msm_append_bo(struct msm_cmd *cmd, struct msm_bo *bo)
+{
+	for (unsigned i = 0; i < cmd->nr_bos; i++)
+		if (cmd->bos[i] == bo)
+			return;
+
+	assert((cmd->nr_bos + 1) < ARRAY_SIZE(cmd->bos));
+	cmd->bos[cmd->nr_bos++] = bo;
+}
+
+/**
+ * igt_msm_cmd_free:
+ * @cmd: the command stream object to free
+ *
+ * Free a command stream object
+ */
+void
+igt_msm_cmd_free(struct msm_cmd *cmd)
+{
+	igt_msm_bo_free(cmd->cmdstream_bo);
+	free(cmd);
+}
diff --git a/lib/igt_msm.h b/lib/igt_msm.h
index 99a099c1..1a66c806 100644
--- a/lib/igt_msm.h
+++ b/lib/igt_msm.h
@@ -24,6 +24,8 @@
 #ifndef IGT_MSM_H
 #define IGT_MSM_H
 
+#include "ioctl_wrappers.h"
+
 #include "msm_drm.h"
 
 /**
@@ -47,6 +49,7 @@ void igt_msm_dev_close(struct msm_device *dev);
  * @handle: the BO's GEM handle
  * @size: the BO's size
  * @map: the BO's memory mapping (if mapped)
+ * @iova: the BO's GPU address
  *
  * Helper wrapper for a GEM buffer object.
  */
@@ -55,6 +58,7 @@ struct msm_bo {
 	int handle;
 	uint32_t size;
 	void *map;
+	uint64_t iova;
 };
 
 struct msm_bo *igt_msm_bo_new(struct msm_device *dev, size_t size, uint32_t flags);
@@ -136,6 +140,50 @@ pm4_pkt7_hdr(uint8_t opcode, uint16_t cnt)
 			((pm4_odd_parity_bit(opcode) << 23));
 }
 
+/**
+ * msm_cmd:
+ * @pipe: the submitqueue to submit cmdstream against
+ * @cmdstream_bo: the backing cmdstream buffer object
+ * @cur: pointer to current position in cmdstream
+ *
+ * Helper for building cmdstream and cmdstream submission
+ */
+struct msm_cmd {
+	struct msm_pipe *pipe;
+	struct msm_bo *cmdstream_bo;
+	uint32_t *cur;
+	uint32_t nr_bos;
+	struct msm_bo *bos[8];
+};
+
+struct msm_cmd *igt_msm_cmd_new(struct msm_pipe *pipe, size_t size);
+int igt_msm_cmd_submit(struct msm_cmd *cmd);
+void igt_msm_cmd_free(struct msm_cmd *cmd);
+
+static inline void
+msm_cmd_emit(struct msm_cmd *cmd, uint32_t dword)
+{
+	*(cmd->cur++) = dword;
+}
+
+static inline void
+msm_cmd_pkt7(struct msm_cmd *cmd, uint8_t opcode, uint16_t cnt)
+{
+	msm_cmd_emit(cmd, pm4_pkt7_hdr(opcode, cnt));
+}
+
+void __igt_msm_append_bo(struct msm_cmd *cmd, struct msm_bo *bo);
+
+static inline void
+msm_cmd_bo(struct msm_cmd *cmd, struct msm_bo *bo, uint32_t offset)
+{
+	uint64_t addr = bo->iova + offset;
+
+	__igt_msm_append_bo(cmd, bo);
+	msm_cmd_emit(cmd, lower_32_bits(addr));
+	msm_cmd_emit(cmd, upper_32_bits(addr));
+}
+
 #define U642VOID(x) ((void *)(uintptr_t)(x))
 #define VOID2U64(x) ((uint64_t)(uintptr_t)(x))
 
-- 
2.33.1

