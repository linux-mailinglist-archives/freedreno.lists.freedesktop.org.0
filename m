Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3285F6633E9
	for <lists+freedreno@lfdr.de>; Mon,  9 Jan 2023 23:25:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0031210E0A4;
	Mon,  9 Jan 2023 22:25:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BD5C10E0A4
 for <freedreno@lists.freedesktop.org>; Mon,  9 Jan 2023 22:25:55 +0000 (UTC)
Received: by mail-qv1-xf2f.google.com with SMTP id l14so3494032qvw.12
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jan 2023 14:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YkeaBylOW4jhgYHb/D3fun9Z5f+LSYx+wsvJq/ZnfRM=;
 b=tsF++OQqIotu0iXwaD5qqq9cRqzAPro8aeajLf0eNZVSMxhvR5A0/fLalEPA9WRwSA
 gYg1NfZBtQX8Bt9uQt0xzQzzANMMGxkFphnfIdvzuMoWxrvH92BvKVUiRXJgoz6bx6Os
 OIjE72HQgYaANJPM5Fm4H/rrAah3StrbdyFes=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YkeaBylOW4jhgYHb/D3fun9Z5f+LSYx+wsvJq/ZnfRM=;
 b=X2Yk/9o9WIZDmoc6LkRolN5BKlT6yQwXjqMm7pNsrg97eMoTBIeGrAG0PL4vDF6a9c
 zHZNY1CsYeGqV+i1Bz6BftI/ll28L//LRaiXYMSV2i3TgforxvXJy7OW0AZNS2Ne4vs8
 R50o6EahI1rtDaeslqPnDm66rzK9rAZ1eUmJtQz8fcgzAQ8axKR94Y6iNwDYzoR+Wuls
 +N5Wl2rUZcAnNKYzmzt2uW7wuvRYZuEq646R3nTxIrOspCYsB2HkT3MlDzgbZYqTfDip
 esp13Nr8XUFG5qs6vsihV3xd8c3Iv0SPdKsBZRsRtij6QyfsaodRRBZYt+gUAH+QsXy/
 YOWA==
X-Gm-Message-State: AFqh2kphHxBRYbGeFyqSc+N2Xs6f+Te3T++zNHm6sVC25w0valm7XsjV
 Btf4jG0KQcRXiLiFSOILR6CRaQ==
X-Google-Smtp-Source: AMrXdXt5WcdGViw3hX3Ad5LFg/Chk9zTGtRgfE3ElNQE7MvJ1vaJebzVyAG3hxHZ6x4rwSWjeVvPUQ==
X-Received: by 2002:a05:6214:322:b0:532:2409:2eec with SMTP id
 j2-20020a056214032200b0053224092eecmr15693944qvu.18.1673303154591; 
 Mon, 09 Jan 2023 14:25:54 -0800 (PST)
Received: from joelboxx.c.googlers.com.com
 (48.230.85.34.bc.googleusercontent.com. [34.85.230.48])
 by smtp.gmail.com with ESMTPSA id
 b5-20020a05620a04e500b006ee8874f5fasm6000671qkh.53.2023.01.09.14.25.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 14:25:53 -0800 (PST)
From: "Joel Fernandes (Google)" <joel@joelfernandes.org>
To: linux-kernel@vger.kernel.org
Date: Mon,  9 Jan 2023 22:25:47 +0000
Message-Id: <20230109222547.1368644-1-joel@joelfernandes.org>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 RESEND] adreno: Shutdown the GPU properly
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
Cc: Rob Clark <robdclark@chromium.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Ross Zwisler <zwisler@kernel.org>,
 "Joel Fernandes \(Google\)" <joel@joelfernandes.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Chia-I Wu <olvaffe@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

[ Applied Rob Clark feedback on fixing adreno_unbind() similarly, also
  tested as above. ]

Cc: Rob Clark <robdclark@chromium.org>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Ricardo Ribalda <ribalda@chromium.org>
Cc: Ross Zwisler <zwisler@kernel.org>
Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 628806423f7d..36f062c7582f 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -551,13 +551,14 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 	return 0;
 }
 
+static int adreno_system_suspend(struct device *dev);
 static void adreno_unbind(struct device *dev, struct device *master,
 		void *data)
 {
 	struct msm_drm_private *priv = dev_get_drvdata(master);
 	struct msm_gpu *gpu = dev_to_gpu(dev);
 
-	pm_runtime_force_suspend(dev);
+	WARN_ON_ONCE(adreno_system_suspend(dev));
 	gpu->funcs->destroy(gpu);
 
 	priv->gpu_pdev = NULL;
@@ -609,7 +610,7 @@ static int adreno_remove(struct platform_device *pdev)
 
 static void adreno_shutdown(struct platform_device *pdev)
 {
-	pm_runtime_force_suspend(&pdev->dev);
+	WARN_ON_ONCE(adreno_system_suspend(&pdev->dev));
 }
 
 static const struct of_device_id dt_match[] = {
-- 
2.39.0.314.g84b9a713c41-goog

