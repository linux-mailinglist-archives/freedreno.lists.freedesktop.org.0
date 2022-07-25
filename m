Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C24157FA69
	for <lists+freedreno@lfdr.de>; Mon, 25 Jul 2022 09:43:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8300112E04;
	Mon, 25 Jul 2022 07:43:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B41211294D
 for <freedreno@lists.freedesktop.org>; Mon, 25 Jul 2022 07:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658735001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=eq4OL1zxJF2+2fp+Q22O19ixxH9CotH/xfhS3oI2/ds=;
 b=gorDPpMYhy3AsWqnb/sagCot5wtiypVzVSDXtS6xb3N+w5ty5GIeNLcorLoLiX55buPiUa
 /vTPP6sRFyhGsFClcZVvGeKKkWQ2TQ3JIa7LDx9QM8hT2t961aayZQE57+amVQNVRWFjCj
 /Fgq5NHkB+a0bIkUxEi/Y7YlzbNXtGw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-41-ojMKmqqwPOWIsXvA1xhGkg-1; Mon, 25 Jul 2022 03:43:20 -0400
X-MC-Unique: ojMKmqqwPOWIsXvA1xhGkg-1
Received: by mail-wm1-f72.google.com with SMTP id
 v18-20020a05600c215200b003a2fea66b7cso3701426wml.4
 for <freedreno@lists.freedesktop.org>; Mon, 25 Jul 2022 00:43:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eq4OL1zxJF2+2fp+Q22O19ixxH9CotH/xfhS3oI2/ds=;
 b=XpjPNUVqj87U+K6TCwpdAG55e/FzIrJUUTPiH9z1qwC24nE6/1Ohn92wGNQ75Dpktr
 HJ2429iX9sDJhbAsPu2wMia9pd8GtFdYtCy/lAz1dNi5IX6NfGMbhOfpoZlLZmyjuWnb
 1h0qBjn9/D0VetEqz7FzIAGr+yKJNbqiBdatjFNKGkXhoV1uSbhsmFBx76syRenw/gm5
 +BUw5xGBSY5fOSAPc+DNhDZp/hcpkZs5t7exdvD73RZ2rlfsmglEi03XThAvixa/Amn6
 JwA/sIQ5dSi24Xj4QxhMb7EdpzutxbcduzXTMup/H2KblJQmC1Iwe7lhWHJQWcH2HC4e
 RbdA==
X-Gm-Message-State: AJIora+4F2N0XHz3uG41diDe3BoKXTb64amdqeHGBA3fio7fl15zfB+F
 YMVKOMTQaj4vqRGeI5SMZWCtPZnh8z2NGC92rnTn1rEXvb08P12kQ+5/5wtPna/c56bKvNZwfNh
 UvaCufvFvgEDOS0yQVwzV3mT7EgDJ
X-Received: by 2002:a05:6000:144d:b0:21d:8109:701d with SMTP id
 v13-20020a056000144d00b0021d8109701dmr6564233wrx.443.1658734998261; 
 Mon, 25 Jul 2022 00:43:18 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tBKBzTRxo9vQI/80qLdj5OZrt+z9DMgSEy+3bbSO1SZWvbh7cisads/gEd5kCIpmRjt1OStw==
X-Received: by 2002:a05:6000:144d:b0:21d:8109:701d with SMTP id
 v13-20020a056000144d00b0021d8109701dmr6564214wrx.443.1658734997943; 
 Mon, 25 Jul 2022 00:43:17 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 ay35-20020a05600c1e2300b003a2e42ae9a4sm16069031wmb.14.2022.07.25.00.43.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 00:43:17 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Mon, 25 Jul 2022 09:43:13 +0200
Message-Id: <20220725074313.42172-1-javierm@redhat.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Freedreno] [PATCH v3] drm/msm: Make .remove and .shutdown HW
 shutdown consistent
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
Cc: David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Drivers' .remove and .shutdown callbacks are executed on different code
paths. The former is called when a device is removed from the bus, while
the latter is called at system shutdown time to quiesce the device.

This means that some overlap exists between the two, because both have to
take care of properly shutting down the hardware. But currently the logic
used in these two callbacks isn't consistent in msm drivers, which could
lead to kernel panic.

For example, on .remove the component is deleted and its .unbind callback
leads to the hardware being shutdown but only if the DRM device has been
marked as registered.

That check doesn't exist in the .shutdown logic and this can lead to the
driver calling drm_atomic_helper_shutdown() for a DRM device that hasn't
been properly initialized.

A situation like this can happen if drivers for expected sub-devices fail
to probe, since the .bind callback will never be executed. If that is the
case, drm_atomic_helper_shutdown() will attempt to take mutexes that are
only initialized if drm_mode_config_init() is called during a device bind.

This bug was attempted to be fixed in commit 623f279c7781 ("drm/msm: fix
shutdown hook in case GPU components failed to bind"), but unfortunately
it still happens in some cases as the one mentioned above, i.e:

[  169.495897] systemd-shutdown[1]: Powering off.
[  169.500466] kvm: exiting hardware virtualization
[  169.554787] platform wifi-firmware.0: Removing from iommu group 12
[  169.610238] platform video-firmware.0: Removing from iommu group 10
[  169.682164] ------------[ cut here ]------------
[  169.686909] WARNING: CPU: 6 PID: 1 at drivers/gpu/drm/drm_modeset_lock.c:317 drm_modeset_lock_all_ctx+0x3c4/0x3d0
...
[  169.775691] Hardware name: Google CoachZ (rev3+) (DT)
[  169.780874] pstate: a0400009 (NzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[  169.788021] pc : drm_modeset_lock_all_ctx+0x3c4/0x3d0
[  169.793205] lr : drm_modeset_lock_all_ctx+0x48/0x3d0
[  169.798299] sp : ffff80000805bb80
[  169.801701] x29: ffff80000805bb80 x28: ffff327c00128000 x27: 0000000000000000
[  169.809025] x26: 0000000000000000 x25: 0000000000000001 x24: ffffc95d820ec030
[  169.816349] x23: ffff327c00bbd090 x22: ffffc95d8215eca0 x21: ffff327c039c5800
[  169.823674] x20: ffff327c039c5988 x19: ffff80000805bbe8 x18: 0000000000000034
[  169.830998] x17: 000000040044ffff x16: ffffc95d80cac920 x15: 0000000000000000
[  169.838322] x14: 0000000000000315 x13: 0000000000000315 x12: 0000000000000000
[  169.845646] x11: 0000000000000000 x10: 0000000000000000 x9 : 0000000000000000
[  169.852971] x8 : ffff80000805bc28 x7 : 0000000000000000 x6 : 0000000000000000
[  169.860295] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000000
[  169.867619] x2 : ffff327c00128000 x1 : 0000000000000000 x0 : ffff327c039c59b0
[  169.874944] Call trace:
[  169.877467]  drm_modeset_lock_all_ctx+0x3c4/0x3d0
[  169.882297]  drm_atomic_helper_shutdown+0x70/0x134
[  169.887217]  msm_drv_shutdown+0x30/0x40
[  169.891159]  platform_shutdown+0x28/0x40
[  169.895191]  device_shutdown+0x148/0x350
[  169.899221]  kernel_power_off+0x38/0x80
[  169.903163]  __do_sys_reboot+0x288/0x2c0
[  169.907192]  __arm64_sys_reboot+0x28/0x34
[  169.911309]  invoke_syscall+0x48/0x114
[  169.915162]  el0_svc_common.constprop.0+0x44/0xec
[  169.919992]  do_el0_svc+0x2c/0xc0
[  169.923394]  el0_svc+0x2c/0x84
[  169.926535]  el0t_64_sync_handler+0x11c/0x150
[  169.931013]  el0t_64_sync+0x18c/0x190
[  169.934777] ---[ end trace 0000000000000000 ]---
[  169.939557] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000018
[  169.948574] Mem abort info:
[  169.951452]   ESR = 0x0000000096000004
[  169.955307]   EC = 0x25: DABT (current EL), IL = 32 bits
[  169.960765]   SET = 0, FnV = 0
[  169.963901]   EA = 0, S1PTW = 0
[  169.967127]   FSC = 0x04: level 0 translation fault
[  169.972136] Data abort info:
[  169.975093]   ISV = 0, ISS = 0x00000004
[  169.979037]   CM = 0, WnR = 0
[  169.982083] user pgtable: 4k pages, 48-bit VAs, pgdp=000000010eab1000
[  169.988697] [0000000000000018] pgd=0000000000000000, p4d=0000000000000000
[  169.995669] Internal error: Oops: 96000004 [#1] PREEMPT SMP
...
[  170.079614] Hardware name: Google CoachZ (rev3+) (DT)
[  170.084801] pstate: a0400009 (NzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[  170.091941] pc : ww_mutex_lock+0x28/0x32c
[  170.096064] lr : drm_modeset_lock_all_ctx+0x1b0/0x3d0
[  170.101254] sp : ffff80000805bb50
[  170.104658] x29: ffff80000805bb50 x28: ffff327c00128000 x27: 0000000000000000
[  170.111977] x26: 0000000000000000 x25: 0000000000000001 x24: 0000000000000018
[  170.119296] x23: ffff80000805bc10 x22: ffff327c039c5ad8 x21: ffff327c039c5800
[  170.126615] x20: ffff80000805bbe8 x19: 0000000000000018 x18: 0000000000000034
[  170.133933] x17: 000000040044ffff x16: ffffc95d80cac920 x15: 0000000000000000
[  170.141252] x14: 0000000000000315 x13: 0000000000000315 x12: 0000000000000000
[  170.148571] x11: 0000000000000000 x10: 0000000000000000 x9 : 0000000000000000
[  170.155890] x8 : ffff80000805bc28 x7 : 0000000000000000 x6 : 0000000000000000
[  170.163209] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000000
[  170.170528] x2 : ffff327c00128000 x1 : 0000000000000000 x0 : 0000000000000018
[  170.177847] Call trace:
[  170.180364]  ww_mutex_lock+0x28/0x32c
[  170.184127]  drm_modeset_lock_all_ctx+0x1b0/0x3d0
[  170.188957]  drm_atomic_helper_shutdown+0x70/0x134
[  170.193876]  msm_drv_shutdown+0x30/0x40
[  170.197820]  platform_shutdown+0x28/0x40
[  170.201854]  device_shutdown+0x148/0x350
[  170.205888]  kernel_power_off+0x38/0x80
[  170.209832]  __do_sys_reboot+0x288/0x2c0
[  170.213866]  __arm64_sys_reboot+0x28/0x34
[  170.217990]  invoke_syscall+0x48/0x114
[  170.221843]  el0_svc_common.constprop.0+0x44/0xec
[  170.226672]  do_el0_svc+0x2c/0xc0
[  170.230079]  el0_svc+0x2c/0x84
[  170.233215]  el0t_64_sync_handler+0x11c/0x150
[  170.237686]  el0t_64_sync+0x18c/0x190
[  170.241451] Code: aa0103f4 d503201f d2800001 aa0103e3 (c8e37c02)
[  170.247704] ---[ end trace 0000000000000000 ]---
[  170.252457] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
[  170.260654] Kernel Offset: 0x495d77c00000 from 0xffff800008000000
[  170.266910] PHYS_OFFSET: 0xffffcd8500000000
[  170.271212] CPU features: 0x800,00c2a015,19801c82
[  170.276042] Memory Limit: none
[  170.279183] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---

Fixes: 9d5cbf5fe46e ("drm/msm: add shutdown support for display platform_driver")
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

Changes in v3:
- Drop the msm_shutdown_hw() wrapper and just call drm_atomic_helper_shutdown()
  in both callbacks (Dmitry Baryshkov).
- Copy the comment in msm_drm_uninit() to msm_drv_shutdown() (Dmitry Baryshkov).

Changes in v2:
- Take the registered check out of the msm_shutdown_hw() and make callers to check instead.
- Make msm_shutdown_hw() an inline function.
- Add a Fixes: tag.

 drivers/gpu/drm/msm/msm_drv.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 1ed4cd09dbf8..1333fea57713 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1242,10 +1242,15 @@ void msm_drv_shutdown(struct platform_device *pdev)
 	struct msm_drm_private *priv = platform_get_drvdata(pdev);
 	struct drm_device *drm = priv ? priv->dev : NULL;
 
-	if (!priv || !priv->kms)
-		return;
-
-	drm_atomic_helper_shutdown(drm);
+	/*
+	 * Shutdown the hw if we're far enough along where things might be on.
+	 * If we run this too early, we'll end up panicking in any variety of
+	 * places. Since we don't register the drm device until late in
+	 * msm_drm_init, drm_dev->registered is used as an indicator that the
+	 * shutdown will be successful.
+	 */
+	if (drm && drm->registered)
+		drm_atomic_helper_shutdown(drm);
 }
 
 static struct platform_driver msm_platform_driver = {
-- 
2.37.1

