Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBs4N3hqeGk1pwEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Tue, 27 Jan 2026 08:34:16 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2638A90C06
	for <lists+freedreno@lfdr.de>; Tue, 27 Jan 2026 08:34:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8663010E28B;
	Tue, 27 Jan 2026 07:34:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="H6/W0z0G";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C259010E011
 for <freedreno@lists.freedesktop.org>; Tue, 27 Jan 2026 07:34:12 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-8230c839409so4237742b3a.3
 for <freedreno@lists.freedesktop.org>; Mon, 26 Jan 2026 23:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1769499252; x=1770104052;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MO/xBk1Z9Sg2T5LDtUgXSRnpiqznRJUad1HNlKnWIEg=;
 b=H6/W0z0GhHrHTAQ3KFd0HDlYDnc6ho0BD3NCsdQeKhqYkDObgUwjopdSQZo0Lx7zQv
 cZsYzkr0tL3VePHsI/UEejTPzN2n53rCpzGuaq7QvWqP9MXKJgSNvBKtVLIuKAhV2rpN
 75GM4l+InwbrtPy8Q3Q04rta8CoywmPPeyXCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769499252; x=1770104052;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MO/xBk1Z9Sg2T5LDtUgXSRnpiqznRJUad1HNlKnWIEg=;
 b=cWwNTp0bRnq/khH9/v50gPb7gB2do/Co6kke2RUEYXF+ttPCx133q/fcvBGd31kRpz
 FAUUnkJ5xyCNCgyb8ZLqsB4P9b8CEqB8cPzP1F0rUH7uKxdLI0eDoJ2RSfXMMjMmRYyw
 sj85C5BDI8l7xLj7XVCr/IFp4IoUmpyqxHQKHK5zCRhugVic+Ps5mHoCxybQZeKP3o0R
 rq1QXNm9OYrhm5ZCEu5g56E49p02rHRiacQvbPjBDKN3bg4O5Znb9CTckfTSzzv9Ciit
 mLaGosI1anA2LQ6+zvQObGajcKsPiPGMvsbzBW8S4yF5fMbesLHAhHSyiGBYwyCihOaY
 WyLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUC6MoYd+1r6ZmtX0afhxTNcizBRLtTgDP8vYgajXEVUq7uJp7io6r2zpfdvNXFxTAgH69gjn5UUwg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YypvM05Hmgb5TQWdXrnQLSQkAqpIj+veT5gJnSHMGdwJIREKlQh
 jWvm85l7rOxHoubY4lu1eOdXXGxSxFy/DEQedjmgJEdc7LemDhdgzrv4D/ys+OYMmA==
X-Gm-Gg: AZuq6aJ09PDLmOt6BjJsBSU6GcQqdwPU1APeLYKfq6WAX0p1GrFl7nCTMU+9nebTSYy
 K+4ZD0T4dW7pvepFceB7q92n05vQ4zeonDlWnrRPYkZMqA9RSZfVUw61lUBWWevXZ+/nNtLnWxD
 CM8OMRwYriBVDPQ2HE7PTejFaG3w4aB4I1b+PxIIDTF1Qk7mDPx8z7bRVjcoG8gfxn1RI+BSEXK
 BCQF1pzbMO+7FhI+8MW7vhUnrnnFY3/ek961WX4ALhFUCENjovmuY199PU+SJNSWpkm+mf4DOx+
 Cv+ZS+wlJijhPXaA4yj6E+MEw4Ot9tUAEmNSewFD6dpeCh9nxfm4tNHm599auEceb6ohWoh1frD
 hyRDyiSPsXaB9JT45yakrF4z9P4hyYynx+Yo4go48URfb66/CWbexxUFKflrYoWmD4gN7fBF/TH
 U2nnnjgzcYDK/qBvwsaKJjb1+X2ByR1lyoE24wiTXc2qoTL0b8KT6sSx3MUnl6Vr8Q9yX5gFi6+
 g==
X-Received: by 2002:a05:6a00:1c99:b0:81f:521c:b640 with SMTP id
 d2e1a72fcca58-823692e6deamr973608b3a.55.1769499251997; 
 Mon, 26 Jan 2026 23:34:11 -0800 (PST)
Received: from tigerii.tok.corp.google.com
 ([2a00:79e0:2031:6:d089:781c:105e:9178])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8231876e718sm11232295b3a.62.2026.01.26.23.34.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jan 2026 23:34:11 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Tomasz Figa <tfiga@chromium.org>
Subject: [RFC PATCH] drm: gpu: msm: forbid mem reclaim from reset
Date: Tue, 27 Jan 2026 16:33:34 +0900
Message-ID: <20260127073341.2862078-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.53.0.rc1.217.geba53bf80e-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:senozhatsky@chromium.org,m:tfiga@chromium.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[senozhatsky@chromium.org,freedreno-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[senozhatsky@chromium.org,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[freedreno];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 2638A90C06
X-Rspamd-Action: no action

We sometimes get into a situtation where GPU hangcheck fails to
recover GPU:

[..]
msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): hangcheck detected gpu lockup rb 0!
msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): completed fence: 7840161
msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): submitted fence: 7840162
msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): hangcheck detected gpu lockup rb 0!
msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): completed fence: 7840162
msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): submitted fence: 7840163
[..]

The problem is that msm_job worker is blocked on gpu->lock

INFO: task ring0:155 blocked for more than 122 seconds.
Not tainted 6.6.99-08727-gaac38b365d2c #1
task:ring0 state:D stack:0 pid:155 ppid:2 flags:0x00000008
Call trace:
__switch_to+0x108/0x208
schedule+0x544/0x11f0
schedule_preempt_disabled+0x30/0x50
__mutex_lock_common+0x410/0x850
__mutex_lock_slowpath+0x28/0x40
mutex_lock+0x5c/0x90
msm_job_run+0x9c/0x140
drm_sched_main+0x514/0x938
kthread+0x114/0x138
ret_from_fork+0x10/0x20

which is owned by recover worker, which is waiting for DMA fences
from a memory reclaim path, under the very same gpu->lock

INFO: task ring0:155 is blocked on a mutex likely owned by task gpu-worker:154.
task:gpu-worker state:D stack:0 pid:154 ppid:2 flags:0x00000008
Call trace:
__switch_to+0x108/0x208
schedule+0x544/0x11f0
schedule_timeout+0x1f8/0x770
dma_fence_default_wait+0x108/0x218
dma_fence_wait_timeout+0x6c/0x1c0
dma_resv_wait_timeout+0xe4/0x118
active_purge+0x34/0x98
drm_gem_lru_scan+0x1d0/0x388
msm_gem_shrinker_scan+0x1cc/0x2e8
shrink_slab+0x228/0x478
shrink_node+0x380/0x730
try_to_free_pages+0x204/0x510
__alloc_pages_direct_reclaim+0x90/0x158
__alloc_pages_slowpath+0x1d4/0x4a0
__alloc_pages+0x9f0/0xc88
vm_area_alloc_pages+0x17c/0x260
__vmalloc_node_range+0x1c0/0x420
kvmalloc_node+0xe8/0x108
msm_gpu_crashstate_capture+0x1e4/0x280
recover_worker+0x1c0/0x638
kthread_worker_fn+0x150/0x2d8
kthread+0x114/0x138

So no one can make any further progress.

Forbid recover/fault worker to enter memory reclaim (under
gpu->lock) to address this deadlock scenario.

Cc: Tomasz Figa <tfiga@chromium.org>
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 995549d0bbbc..ddcd9e1c217a 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -17,6 +17,7 @@
 #include <linux/string_helpers.h>
 #include <linux/devcoredump.h>
 #include <linux/sched/task.h>
+#include <linux/sched/mm.h>
 
 /*
  * Power Management:
@@ -469,6 +470,7 @@ static void recover_worker(struct kthread_work *work)
 	struct msm_gem_submit *submit;
 	struct msm_ringbuffer *cur_ring = gpu->funcs->active_ring(gpu);
 	char *comm = NULL, *cmd = NULL;
+	unsigned int noreclaim_flag;
 	struct task_struct *task;
 	int i;
 
@@ -506,6 +508,8 @@ static void recover_worker(struct kthread_work *work)
 			msm_gem_vm_unusable(submit->vm);
 	}
 
+	noreclaim_flag = memalloc_noreclaim_save();
+
 	get_comm_cmdline(submit, &comm, &cmd);
 
 	if (comm && cmd) {
@@ -524,6 +528,8 @@ static void recover_worker(struct kthread_work *work)
 	pm_runtime_get_sync(&gpu->pdev->dev);
 	msm_gpu_crashstate_capture(gpu, submit, NULL, comm, cmd);
 
+	memalloc_noreclaim_restore(noreclaim_flag);
+
 	kfree(cmd);
 	kfree(comm);
 
@@ -588,6 +594,7 @@ void msm_gpu_fault_crashstate_capture(struct msm_gpu *gpu, struct msm_gpu_fault_
 	struct msm_gem_submit *submit;
 	struct msm_ringbuffer *cur_ring = gpu->funcs->active_ring(gpu);
 	char *comm = NULL, *cmd = NULL;
+	unsigned int noreclaim_flag;
 
 	mutex_lock(&gpu->lock);
 
@@ -595,6 +602,8 @@ void msm_gpu_fault_crashstate_capture(struct msm_gpu *gpu, struct msm_gpu_fault_
 	if (submit && submit->fault_dumped)
 		goto resume_smmu;
 
+	noreclaim_flag = memalloc_noreclaim_save();
+
 	if (submit) {
 		get_comm_cmdline(submit, &comm, &cmd);
 
@@ -610,6 +619,8 @@ void msm_gpu_fault_crashstate_capture(struct msm_gpu *gpu, struct msm_gpu_fault_
 	msm_gpu_crashstate_capture(gpu, submit, fault_info, comm, cmd);
 	pm_runtime_put_sync(&gpu->pdev->dev);
 
+	memalloc_noreclaim_restore(noreclaim_flag);
+
 	kfree(cmd);
 	kfree(comm);
 
-- 
2.53.0.rc1.217.geba53bf80e-goog

