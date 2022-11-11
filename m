Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 579EF626390
	for <lists+freedreno@lfdr.de>; Fri, 11 Nov 2022 22:29:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B51510E88F;
	Fri, 11 Nov 2022 21:29:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCBA510E8AD
 for <freedreno@lists.freedesktop.org>; Fri, 11 Nov 2022 19:50:15 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id w4so3287412qts.0
 for <freedreno@lists.freedesktop.org>; Fri, 11 Nov 2022 11:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YU/dVE0ERRRiwLc0HKRhu2fVlyQiYjgDvyxIAHOZXz8=;
 b=UTwWvPMR4j2f2p7up8Le/KvMZlwgGMWDnXQ8RcwwGzzkoHuyjeJwmie5C9GVXHQOeM
 4nOE7CQbS2Rp5oNTgauj01OBG+ZZjUdaZ0z0IfnaKX4HNjv6IZ2fHaOWlPCl9B5mridB
 2dt9pYevIUdALZ+hmKfj0ybst/f34okv6UyGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YU/dVE0ERRRiwLc0HKRhu2fVlyQiYjgDvyxIAHOZXz8=;
 b=a+k2g9UHNXN8lSb0dLBJowe7caPHFsb4mHpnNL0H7Df3kg6IWh3DCgjk/UZHYEeItl
 E+hjEaNkidotJs73ytga57fOTxyp5O/TWtPjiX+B5/bRJGmZ/LOSpZHi25Uiav52ohTn
 Z2STMGUCkCS2iP7nwT+N7+4oEDD3lF1fPWQXH0MMkQXeQeVGhYVP9VwBZ8xhGGlwGVPV
 qKpZpk6p8jO55UvEt19V5qbjdHS7rYlrkHHSLzY4TZxqavonzTo+Lf7w8SIg0VAFcXGW
 thun9Pmf5geE/k9w5kaqYhvc3p4rjTMfXw1cqkFExTwXGh7pkU78j3zSXLTC5/7iPAK7
 3RNw==
X-Gm-Message-State: ANoB5pmEFh1hPxBinwiwPeOmM+K8eIztXOCjDDS0Kkw/4wbvkmvP+AHx
 dIPbl2DEEY0SHsa0wSS6g0ASuw==
X-Google-Smtp-Source: AA0mqf4f379m8qQ4NDG8WIoePs17+iR7zz+GPC8xaMp8RokfgQW72ZP6ejmf+n05qXiKrn00RS9fgw==
X-Received: by 2002:a05:622a:5083:b0:3a5:404:4c36 with SMTP id
 fp3-20020a05622a508300b003a504044c36mr2767678qtb.653.1668196214671; 
 Fri, 11 Nov 2022 11:50:14 -0800 (PST)
Received: from joelboxx.c.googlers.com.com
 (228.221.150.34.bc.googleusercontent.com. [34.150.221.228])
 by smtp.gmail.com with ESMTPSA id
 y11-20020a05620a25cb00b006ef1a8f1b81sm1985277qko.5.2022.11.11.11.50.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 11:50:13 -0800 (PST)
From: "Joel Fernandes (Google)" <joel@joelfernandes.org>
To: linux-kernel@vger.kernel.org
Date: Fri, 11 Nov 2022 19:49:56 +0000
Message-Id: <20221111194957.4046771-1-joel@joelfernandes.org>
X-Mailer: git-send-email 2.38.1.493.g58b659f92b-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 11 Nov 2022 21:29:02 +0000
Subject: [Freedreno] [PATCH 1/2] adreno: Shutdown the GPU properly
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
Cc: Rob Clark <robdclark@chromium.org>, Emma Anholt <emma@anholt.net>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Ross Zwisler <zwisler@kernel.org>,
 "Joel Fernandes \(Google\)" <joel@joelfernandes.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

During kexec on ARM device, we notice that device_shutdown() only calls
pm_runtime_force_suspend() while shutting down the GPU. This means the GPU
kthread is still running and further, there maybe active submits.

This causes all kinds of issues during a kexec reboot:

Warning from shutdown path:

[  292.509662] WARNING: CPU: 0 PID: 6304 at [...] adreno_runtime_suspend+0x3c/0x44
[  292.509863] Hardware name: Google Lazor (rev3 - 8) with LTE (DT)
[  292.509872] pstate: 80400009 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[  292.509881] pc : adreno_runtime_suspend+0x3c/0x44
[  292.509891] lr : pm_generic_runtime_suspend+0x30/0x44
[  292.509905] sp : ffffffc014473bf0
[...]
[  292.510043] Call trace:
[  292.510051]  adreno_runtime_suspend+0x3c/0x44
[  292.510061]  pm_generic_runtime_suspend+0x30/0x44
[  292.510071]  pm_runtime_force_suspend+0x54/0xc8
[  292.510081]  adreno_shutdown+0x1c/0x28
[  292.510090]  platform_shutdown+0x2c/0x38
[  292.510104]  device_shutdown+0x158/0x210
[  292.510119]  kernel_restart_prepare+0x40/0x4c

And here from GPU kthread, an SError OOPs:

[  192.648789]  el1h_64_error+0x7c/0x80
[  192.648812]  el1_interrupt+0x20/0x58
[  192.648833]  el1h_64_irq_handler+0x18/0x24
[  192.648854]  el1h_64_irq+0x7c/0x80
[  192.648873]  local_daif_inherit+0x10/0x18
[  192.648900]  el1h_64_sync_handler+0x48/0xb4
[  192.648921]  el1h_64_sync+0x7c/0x80
[  192.648941]  a6xx_gmu_set_oob+0xbc/0x1fc
[  192.648968]  a6xx_hw_init+0x44/0xe38
[  192.648991]  msm_gpu_hw_init+0x48/0x80
[  192.649013]  msm_gpu_submit+0x5c/0x1a8
[  192.649034]  msm_job_run+0xb0/0x11c
[  192.649058]  drm_sched_main+0x170/0x434
[  192.649086]  kthread+0x134/0x300
[  192.649114]  ret_from_fork+0x10/0x20

Fix by calling adreno_system_suspend() in the device_shutdown() path.

Cc: Rob Clark <robdclark@chromium.org>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Ricardo Ribalda <ribalda@chromium.org>
Cc: Ross Zwisler <zwisler@kernel.org>
Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 24b489b6129a..f0cff62812c3 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -607,9 +607,12 @@ static int adreno_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static int adreno_system_suspend(struct device *dev);
 static void adreno_shutdown(struct platform_device *pdev)
 {
-	pm_runtime_force_suspend(&pdev->dev);
+	struct msm_gpu *gpu = dev_to_gpu(&pdev->dev);
+
+	WARN_ON_ONCE(adreno_system_suspend(&pdev->dev));
 }
 
 static const struct of_device_id dt_match[] = {
-- 
2.38.1.493.g58b659f92b-goog

