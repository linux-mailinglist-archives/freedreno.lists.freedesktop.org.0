Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8700B63F961
	for <lists+freedreno@lfdr.de>; Thu,  1 Dec 2022 21:48:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA16110E076;
	Thu,  1 Dec 2022 20:48:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE3D910E15D
 for <freedreno@lists.freedesktop.org>; Thu,  1 Dec 2022 20:48:21 +0000 (UTC)
Received: by mail-qv1-xf35.google.com with SMTP id q10so2152201qvt.10
 for <freedreno@lists.freedesktop.org>; Thu, 01 Dec 2022 12:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aso5bVNku9zAYWewFCI9NL0NcJ9DRJeZDy18s0IErb4=;
 b=OczNBDW2ESYrVq6qf5oHFwAvcjxDnqqUpF3z/8xsdkysB/nM5RdxvQTQdVD2w/4UK/
 xkV2B2eQXCqPGuu1/aOEBoLL078X+xy72EmRwUCGE3os9LveWOghxGR9ETBIWBqyjiKS
 8Bb/3liGvBLGSgSl4IWqq7tn/pnA0hI0Y91VM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aso5bVNku9zAYWewFCI9NL0NcJ9DRJeZDy18s0IErb4=;
 b=afFzlmLwYsMozRYtwJ/TIqt2Gy9yE0TPkykt2R3bP6XsX/iGewaElPer4VrTbfRnhp
 Fa0T6+qMzC8ENkuDWf2Wxnk0O2A4+xIzGEBAf0Q4ntjRDEEusbQyTU5oMG27M/INfaMo
 gtbgABrANpr6MrXFSO29OqFk/iBkWEjsh5aGAeHrECp6oDEUxcQ3ly4RttXlT8iFIrAt
 x6CVXv4UucMud8YeDtlzGRnKN/PS/Go/VRJiVQ7d4EiS2tfiWB+F47X/9LbPe1ZxBn9S
 AXRI/55LFjgDAZPudhzlPdYkCNQ9mf8eprdKG2BIpPktqQl3WboRD6gzwkyqNv1vwMsd
 25zw==
X-Gm-Message-State: ANoB5plSWbEamkVWh/IRrg3mARI/YpMJ06cJJ0qIsjko0bK70OhZVSuw
 92GO/EBj5vTIfd/+wZEFWAQDYA==
X-Google-Smtp-Source: AA0mqf7aKhJ0Nq2h1FmelRlWpb/hRz/e2rXwhWuipChh6xhW0iZR09JmYkx15JkhbgrWrv1uLLtCCw==
X-Received: by 2002:a0c:c783:0:b0:4bb:58bf:7507 with SMTP id
 k3-20020a0cc783000000b004bb58bf7507mr45892674qvj.96.1669927700540; 
 Thu, 01 Dec 2022 12:48:20 -0800 (PST)
Received: from joelboxx.c.googlers.com.com
 (228.221.150.34.bc.googleusercontent.com. [34.150.221.228])
 by smtp.gmail.com with ESMTPSA id
 o6-20020ac85546000000b003a69225c2cdsm1561851qtr.56.2022.12.01.12.48.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 12:48:19 -0800 (PST)
From: "Joel Fernandes (Google)" <joel@joelfernandes.org>
To: linux-kernel@vger.kernel.org
Date: Thu,  1 Dec 2022 20:48:12 +0000
Message-Id: <20221201204813.1470994-1-joel@joelfernandes.org>
X-Mailer: git-send-email 2.39.0.rc0.267.gcb52ba06e7-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2] adreno: Shutdown the GPU properly
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
index 24b489b6129a..c7e26659ba33 100644
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
2.39.0.rc0.267.gcb52ba06e7-goog

