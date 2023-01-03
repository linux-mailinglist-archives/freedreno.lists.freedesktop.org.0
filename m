Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4610F65C351
	for <lists+freedreno@lfdr.de>; Tue,  3 Jan 2023 16:51:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E08D10E1FE;
	Tue,  3 Jan 2023 15:51:28 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBA6F10E07D
 for <freedreno@lists.freedesktop.org>; Tue,  3 Jan 2023 15:51:25 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id bn6so22389701ljb.13
 for <freedreno@lists.freedesktop.org>; Tue, 03 Jan 2023 07:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RUhexUPjfctu49ijrOvVNhUuEOSUTEEk6E6bJbkDGTA=;
 b=i1eSJN4VGWQ/TxAhyClQmIsgdsVD8o+hukkc26C4kX5QdktR0EJQGF3syyY/C6XDbk
 HueOSSDUX6UxePXBOH8zmh3nAD4fv/GSF1x+/x8yN3FFsoNTaxT6AxnBkIINf4WHV74u
 RLlyc4+EEz3/n7pkrLqhFx1A9SYjCR7HDfb2SXgrdeVkHEmIt/N0HaCrljZrBIzmDIfj
 mVA3v9UzIH2QdUM1S+A7090eWukDuJsKqHjBItbp6p2/DGQz8JM/3N5CKvG+HH6UOEoz
 NriL1HYeezO4iMS4ZzfJnJHP/E6GYa1n0ZoovgJKkZxJv8Puo2CKNgyvQFyW2dYlZuVC
 ikMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RUhexUPjfctu49ijrOvVNhUuEOSUTEEk6E6bJbkDGTA=;
 b=utteVMewVotzDVKhzEQT+Vo8Yhg2AS6WbxgaPgpyzIfqPb/D5Gs0vboWPyTGB4gfrC
 XcRcO++e9CdlM8H5PZi2KVjDUn3hgV745uF/LWTpKLQ4O3GTV95vpSB03zx5bVrlxrzU
 ImIdtURaC4tz/YXCm7EhZzxBvYWAU12nVVdjVCiVnOyNyvN9n7R7jbpDHlFDdijSAo8r
 xYazfCB/kkV01uSsMfUAWIiMkX+Am/uj2j5zJd9FvlemV9tYY0TMrRrIKcTQInPPIE8f
 IBDlRV9jNA97Y8ixW+L5mzjZ19FS60QozpiUgvdR8ynI8ikbM8rrTL2mU2VRg9c6UqOn
 bTnw==
X-Gm-Message-State: AFqh2kpKIgg9DVdBVgClo6N+22+eg6FtIqE7iJjyGpb6OLVQI854dnEJ
 R70+60yQrlfcZLLipf8Nx6f70g==
X-Google-Smtp-Source: AMrXdXtNe1t1ZcHez2XnFTgeQm1i6YhgHDCSlLjegsOZRNLx7HygRRCxMOhjRx6K2TcRCO4/Rh6FSw==
X-Received: by 2002:a05:651c:48e:b0:27d:5e67:cb15 with SMTP id
 s14-20020a05651c048e00b0027d5e67cb15mr16203094ljc.4.1672761083557; 
 Tue, 03 Jan 2023 07:51:23 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 h14-20020a2ea48e000000b0027ffadc61d8sm317414lji.3.2023.01.03.07.51.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 07:51:23 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Tue,  3 Jan 2023 17:51:22 +0200
Message-Id: <20230103155122.1170930-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2] drm/msm: another fix for the headless Adreno
 GPU
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
Cc: freedreno@lists.freedesktop.org, kernel test robot <lkp@intel.com>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Fix another oops reproducible when rebooting the board with the Adreno
GPU wokring in the headless mode (e.g. iMX platforms).

Unable to handle kernel NULL pointer dereference at virtual address 00000000 when read
[00000000] *pgd=74936831, *pte=00000000, *ppte=00000000
Internal error: Oops: 17 [#1] ARM
CPU: 0 PID: 51 Comm: reboot Not tainted 6.2.0-rc1-dirty #11
Hardware name: Freescale i.MX53 (Device Tree Support)
PC is at msm_atomic_commit_tail+0x50/0x970
LR is at commit_tail+0x9c/0x188
pc : [<c06aa430>]    lr : [<c067a214>]    psr: 600e0013
sp : e0851d30  ip : ee4eb7eb  fp : 00090acc
r10: 00000058  r9 : c2193014  r8 : c4310000
r7 : c4759380  r6 : 07bef61d  r5 : 00000000  r4 : 00000000
r3 : c44cc440  r2 : 00000000  r1 : 00000000  r0 : 00000000
Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
Control: 10c5387d  Table: 74910019  DAC: 00000051
Register r0 information: NULL pointer
Register r1 information: NULL pointer
Register r2 information: NULL pointer
Register r3 information: slab kmalloc-1k start c44cc400 pointer offset 64 size 1024
Register r4 information: NULL pointer
Register r5 information: NULL pointer
Register r6 information: non-paged memory
Register r7 information: slab kmalloc-128 start c4759380 pointer offset 0 size 128
Register r8 information: slab kmalloc-2k start c4310000 pointer offset 0 size 2048
Register r9 information: non-slab/vmalloc memory
Register r10 information: non-paged memory
Register r11 information: non-paged memory
Register r12 information: non-paged memory
Process reboot (pid: 51, stack limit = 0xc80046d9)
Stack: (0xe0851d30 to 0xe0852000)
1d20:                                     c4759380 fbd77200 000005ff 002b9c70
1d40: c4759380 c4759380 00000000 07bef61d 00000600 c0d6fe7c c2193014 00000058
1d60: 00090acc c067a214 00000000 c4759380 c4310000 00000000 c44cc854 c067a89c
1d80: 00000000 00000000 00000000 c4310468 00000000 c4759380 c4310000 c4310468
1da0: c4310470 c0643258 c4759380 00000000 00000000 c0c4ee24 00000000 c44cc810
1dc0: 00000000 c0c4ee24 00000000 c44cc810 00000000 0347d2a8 e0851e00 e0851e00
1de0: c4759380 c067ad20 c4310000 00000000 c44cc810 c27f8718 c44cc854 c067adb8
1e00: c4933000 00000002 00000001 00000000 00000000 c2130850 00000000 c2130854
1e20: c25fc488 00000000 c0ff162c 00000000 00000001 00000002 00000000 00000000
1e40: c43102c0 c43102c0 00000000 0347d2a8 c44cc810 c44cc814 c2133da8 c06d1a60
1e60: 00000000 00000000 00079028 c2012f24 fee1dead c4933000 00000058 c01431e4
1e80: 01234567 c0143a20 00000000 00000000 00000000 00000000 00000000 00000000
1ea0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
1ec0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
1ee0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
1f00: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
1f20: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
1f40: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
1f60: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
1f80: 00000000 00000000 00000000 0347d2a8 00000002 00000004 00000078 00000058
1fa0: c010028c c0100060 00000002 00000004 fee1dead 28121969 01234567 00079028
1fc0: 00000002 00000004 00000078 00000058 0002fdc5 00000000 00000000 00090acc
1fe0: 00000058 becc9c64 b6e97e05 b6e0e5f6 600e0030 fee1dead 00000000 00000000
 msm_atomic_commit_tail from commit_tail+0x9c/0x188
 commit_tail from drm_atomic_helper_commit+0x160/0x188
 drm_atomic_helper_commit from drm_atomic_commit+0xac/0xe0
 drm_atomic_commit from drm_atomic_helper_disable_all+0x1b0/0x1c0
 drm_atomic_helper_disable_all from drm_atomic_helper_shutdown+0x88/0x140
 drm_atomic_helper_shutdown from device_shutdown+0x16c/0x240
 device_shutdown from kernel_restart+0x38/0x90
 kernel_restart from __do_sys_reboot+0x174/0x224
 __do_sys_reboot from ret_fast_syscall+0x0/0x1c
Exception stack(0xe0851fa8 to 0xe0851ff0)
1fa0:                   00000002 00000004 fee1dead 28121969 01234567 00079028
1fc0: 00000002 00000004 00000078 00000058 0002fdc5 00000000 00000000 00090acc
1fe0: 00000058 becc9c64 b6e97e05 b6e0e5f6
Code: 15922088 1184421c e1500003 1afffff8 (e5953000)
---[ end trace 0000000000000000 ]---

Fixes: 0a58d2ae572a ("drm/msm: Make .remove and .shutdown HW shutdown consistent")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v1:
- Moved setting of `async' before the call to trace to fix the
  uninitialized variable warning

---
 drivers/gpu/drm/msm/msm_atomic.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index 1686fbb611fd..d8cded52cabf 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -186,7 +186,12 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
 	struct msm_kms *kms = priv->kms;
 	struct drm_crtc *async_crtc = NULL;
 	unsigned crtc_mask = get_crtc_mask(state);
-	bool async = kms->funcs->vsync_time &&
+	bool async;
+
+	if (!kms)
+		return;
+
+	async = kms->funcs->vsync_time &&
 			can_do_async(state, &async_crtc);
 
 	trace_msm_atomic_commit_tail_start(async, crtc_mask);
-- 
2.39.0

