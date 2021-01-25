Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 172AB303076
	for <lists+freedreno@lfdr.de>; Tue, 26 Jan 2021 00:49:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9878C6E14D;
	Mon, 25 Jan 2021 23:49:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AB416E23D
 for <freedreno@lists.freedesktop.org>; Mon, 25 Jan 2021 23:49:04 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id r38so4137429pgk.13
 for <freedreno@lists.freedesktop.org>; Mon, 25 Jan 2021 15:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cuvqgCacX4Pb/J8emd8ASYQj+aaRXfkyo5/tJUTXC18=;
 b=LvIzG2oiZ4fahhXWU/Hl16GJoovvy1FodGhzRZkhCPyPmFR19R6r1WEoZrBUzLtIMM
 QnTuqHFjlL4l5yPZWzb/BVOd4vaakKa63tFoLObC5jY+g4UzkqDJBZVBH9En3d5sFUYn
 fdo0AQZ6EtqeWqTx4+L0QXmfvUYGKyCPwHLvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cuvqgCacX4Pb/J8emd8ASYQj+aaRXfkyo5/tJUTXC18=;
 b=KQUMIy2gaHChRaRjPDic6ppdsVUAqpY9jBs8T7gPJOxa7venIlXpIPQzqDgydJy1Yp
 lbYAEbLG0G43siy+jirljFVruYglHiPcSdZXPIXGTsNruBiatltiIpcVMLYxm/yJvuIq
 ZWXUiQztcKiA1Lh0kFR8shAeXNhjePLHF2rDQ/F5CwSI6aBYWTrWGZsArV35FLQGGncx
 an9DjfrpGeyrn6yeZGh0fTimKyjlOZrsL/vjUUu4pKS4e558C3rpNuEBHzb34lZTfZHX
 viNY0ppkXdAWRiidVdOnIms+5/K7ekhHZbfcbP3BKeyRvVTJuRpoBiAqbkCyZcMlzXtW
 tciw==
X-Gm-Message-State: AOAM533fVrXIoQPXxXUD3yFTD3Go+xgg3KY/VLUOyhUKZglK2zTaGDbv
 UKQp4+MzlYJLJuBke6ECDxy1JA==
X-Google-Smtp-Source: ABdhPJzO6lwEiB9rHDjl2mcIoIHLun1mZSg9GDhVd7nQPhP25HL0bRXA4RqsiCg8fZUxTOaI377yHw==
X-Received: by 2002:a62:9248:0:b029:1ae:8b24:34c8 with SMTP id
 o69-20020a6292480000b02901ae8b2434c8mr2565829pfd.67.1611618543734; 
 Mon, 25 Jan 2021 15:49:03 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:1066:b437:97cd:2278])
 by smtp.gmail.com with ESMTPSA id i1sm18747306pfb.54.2021.01.25.15.49.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 15:49:03 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Rob Clark <robdclark@gmail.com>
Date: Mon, 25 Jan 2021 15:49:01 -0800
Message-Id: <20210125234901.2730699-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
MIME-Version: 1.0
Subject: [Freedreno] [PATCH] drm/msm/kms: Make a lock_class_key for each
 crtc mutex
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krishna Manikandan <mkrishn@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Lockdep complains about an AA deadlock when rebooting the device.

============================================
WARNING: possible recursive locking detected
5.4.91 #1 Not tainted
--------------------------------------------
reboot/5213 is trying to acquire lock:
ffffff80d13391b0 (&kms->commit_lock[i]){+.+.}, at: lock_crtcs+0x60/0xa4

but task is already holding lock:
ffffff80d1339110 (&kms->commit_lock[i]){+.+.}, at: lock_crtcs+0x60/0xa4

other info that might help us debug this:
Possible unsafe locking scenario:

CPU0
----
lock(&kms->commit_lock[i]);
lock(&kms->commit_lock[i]);

*** DEADLOCK ***

May be due to missing lock nesting notation

6 locks held by reboot/5213:
__arm64_sys_reboot+0x148/0x2a0
device_shutdown+0x10c/0x2c4
drm_atomic_helper_shutdown+0x48/0xfc
modeset_lock+0x120/0x24c
lock_crtcs+0x60/0xa4

stack backtrace:
CPU: 4 PID: 5213 Comm: reboot Not tainted 5.4.91 #1
Hardware name: Google Pompom (rev1) with LTE (DT)
Call trace:
dump_backtrace+0x0/0x1dc
show_stack+0x24/0x30
dump_stack+0xfc/0x1a8
__lock_acquire+0xcd0/0x22b8
lock_acquire+0x1ec/0x240
__mutex_lock_common+0xe0/0xc84
mutex_lock_nested+0x48/0x58
lock_crtcs+0x60/0xa4
msm_atomic_commit_tail+0x348/0x570
commit_tail+0xdc/0x178
drm_atomic_helper_commit+0x160/0x168
drm_atomic_commit+0x68/0x80

This is because lockdep thinks all the locks taken in lock_crtcs() are
the same lock, when they actually aren't. That's because we call
mutex_init() in msm_kms_init() and that assigns on static key for every
lock initialized in this loop. Let's allocate a dynamic number of
lock_class_keys and assign them to each lock so that lockdep can figure
out an AA deadlock isn't possible here.

Fixes: b3d91800d9ac ("drm/msm: Fix race condition in msm driver with async layer updates")
Cc: Krishna Manikandan <mkrishn@codeaurora.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/msm_kms.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index d8151a89e163..4735251a394d 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -157,6 +157,7 @@ struct msm_kms {
 	 * from the crtc's pending_timer close to end of the frame:
 	 */
 	struct mutex commit_lock[MAX_CRTCS];
+	struct lock_class_key commit_lock_keys[MAX_CRTCS];
 	unsigned pending_crtc_mask;
 	struct msm_pending_timer pending_timers[MAX_CRTCS];
 };
@@ -166,8 +167,11 @@ static inline int msm_kms_init(struct msm_kms *kms,
 {
 	unsigned i, ret;
 
-	for (i = 0; i < ARRAY_SIZE(kms->commit_lock); i++)
-		mutex_init(&kms->commit_lock[i]);
+	for (i = 0; i < ARRAY_SIZE(kms->commit_lock); i++) {
+		lockdep_register_key(&kms->commit_lock_keys[i]);
+		__mutex_init(&kms->commit_lock[i], "&kms->commit_lock[i]",
+			     &kms->commit_lock_keys[i]);
+	}
 
 	kms->funcs = funcs;
 

base-commit: 19c329f6808995b142b3966301f217c831e7cf31
-- 
https://chromeos.dev

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
