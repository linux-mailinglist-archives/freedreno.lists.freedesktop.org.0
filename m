Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACED0227498
	for <lists+freedreno@lfdr.de>; Tue, 21 Jul 2020 03:33:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56B3E89AC0;
	Tue, 21 Jul 2020 01:33:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m176150.mail.qiye.163.com (m176150.mail.qiye.163.com
 [59.111.176.150])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 901D089AC0
 for <freedreno@lists.freedesktop.org>; Tue, 21 Jul 2020 01:33:40 +0000 (UTC)
Received: from vivo.com (wm-10.qy.internal [127.0.0.1])
 by m176150.mail.qiye.163.com (Hmail) with ESMTP id 083D01A2142;
 Tue, 21 Jul 2020 09:33:03 +0800 (CST)
Message-ID: <AE2AjQBfDVxlYNyBF9u*s4rp.1.1595295183020.Hmail.bernard@vivo.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Drew Davenport <ddavenport@chromium.org>, 
 Bernard Zhao <bernard@vivo.com>, Hongbo Yao <yaohongbo@huawei.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Kalyan Thota <kalyan_t@codeaurora.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com
X-Originating-IP: 14.29.82.33
MIME-Version: 1.0
Received: from bernard@vivo.com( [14.29.82.33) ] by ajax-webmail ( [127.0.0.1]
 ) ; Tue, 21 Jul 2020 09:33:03 +0800 (GMT+08:00)
From: Bernard <bernard@vivo.com>
Date: Tue, 21 Jul 2020 09:33:03 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZSE8ZQh5CQ05OSU8eVkpOQk5JQk5KQ0hKT0tVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKTFVKS0tZBg++
X-HM-Sender-Digest: e1kMHhlZQQ8JDh5XWRIfHhUPWUFZRzo#SToRKjkdPy0DFyI1Ajk9Qg5R
 CE8JC1VKVUpOQk5JQk5KQ0hOSENVMxYaEhdVGR4JFRoJHzsNEg0UVRgUFkVZV1kSC1lBWUpPVUlC
 VUNJVUhIWVdZCAFZQU1OTk83Bg++
X-HM-Tid: 0a736f00b0cd93b4kuws083d01a2142
Subject: [Freedreno] =?utf-8?q?=5BResend=5D=5BPATCH=5D_drm/msm=3A_use_kth?=
 =?utf-8?q?read=5Fcreate=5Fworker_instead_of_kthread=5Frun?=
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
Cc: opensource.kernel@vivo.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Use kthread_create_worker to simplify the code and optimise
the manager struct: msm_drm_thread. With this change, we
could remove struct element (struct task_struct *thread &
struct kthread_worker worker), instead, use one point (struct
kthread_worker *worker).

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c |  2 +-
 drivers/gpu/drm/msm/msm_drv.c            | 18 ++++++------------
 drivers/gpu/drm/msm/msm_drv.h            |  3 +--
 3 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index e15b42a780e0..c959c959021d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -396,7 +396,7 @@ static void dpu_crtc_frame_event_cb(void *data, u32 event)
 	fevent->event = event;
 	fevent->crtc = crtc;
 	fevent->ts = ktime_get();
-	kthread_queue_work(&priv->event_thread[crtc_id].worker, &fevent->work);
+	kthread_queue_work(priv->event_thread[crtc_id].worker, &fevent->work);
 }
 
 void dpu_crtc_complete_commit(struct drm_crtc *crtc)
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index f6ce40bf3699..82e79b82a594 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -238,10 +238,8 @@ static int msm_drm_uninit(struct device *dev)
 
 	/* clean up event worker threads */
 	for (i = 0; i < priv->num_crtcs; i++) {
-		if (priv->event_thread[i].thread) {
-			kthread_destroy_worker(&priv->event_thread[i].worker);
-			priv->event_thread[i].thread = NULL;
-		}
+		if (priv->event_thread[i].worker)
+			kthread_destroy_worker(priv->event_thread[i].worker);
 	}
 
 	msm_gem_shrinker_cleanup(ddev);
@@ -504,19 +502,15 @@ static int msm_drm_init(struct device *dev, struct drm_driver *drv)
 	for (i = 0; i < priv->num_crtcs; i++) {
 		/* initialize event thread */
 		priv->event_thread[i].crtc_id = priv->crtcs[i]->base.id;
-		kthread_init_worker(&priv->event_thread[i].worker);
 		priv->event_thread[i].dev = ddev;
-		priv->event_thread[i].thread =
-			kthread_run(kthread_worker_fn,
-				&priv->event_thread[i].worker,
-				"crtc_event:%d", priv->event_thread[i].crtc_id);
-		if (IS_ERR(priv->event_thread[i].thread)) {
+		priv->event_thread[i].worker = kthread_create_worker(0,
+			"crtc_event:%d", priv->event_thread[i].crtc_id);
+		if (IS_ERR(priv->event_thread[i].worker)) {
 			DRM_DEV_ERROR(dev, "failed to create crtc_event kthread\n");
-			priv->event_thread[i].thread = NULL;
 			goto err_msm_uninit;
 		}
 
-		ret = sched_setscheduler(priv->event_thread[i].thread,
+		ret = sched_setscheduler(priv->event_thread[i].worker->task,
 					 SCHED_FIFO, &param);
 		if (ret)
 			dev_warn(dev, "event_thread set priority failed:%d\n",
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index e2d6a6056418..daf2f4e5548c 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -129,9 +129,8 @@ struct msm_display_info {
 /* Commit/Event thread specific structure */
 struct msm_drm_thread {
 	struct drm_device *dev;
-	struct task_struct *thread;
 	unsigned int crtc_id;
-	struct kthread_worker worker;
+	struct kthread_worker *worker;
 };
 
 struct msm_drm_private {
-- 
2.17.1



_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
