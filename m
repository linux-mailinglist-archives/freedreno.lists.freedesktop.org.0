Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 782DF74534F
	for <lists+freedreno@lfdr.de>; Mon,  3 Jul 2023 02:38:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C496110E188;
	Mon,  3 Jul 2023 00:38:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D160710E176
 for <freedreno@lists.freedesktop.org>; Mon,  3 Jul 2023 00:37:56 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2b6a675743dso58577911fa.2
 for <freedreno@lists.freedesktop.org>; Sun, 02 Jul 2023 17:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688344675; x=1690936675;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JPFwCvRngaFzJ94U7CZjB/OGCFNsTWeZNPgu469jNjI=;
 b=zqc8yxn+85gSqrBDI0ZGz0xLVJhr/wm+fFHjv88VmquMMzqCImDdrX/yVEWaJfLtzt
 bztABFbB7IIrko9nWgeExVDNlF/vTz/DO161LfevnzAXu/oOonoHgsXdb7ALC2diIRvj
 XBiMjSITEDbUe0KEqpb0SvZCsHvzjcesL8v2TBuBBZcUsM+8aFSMjvQq9T7hooPriW/J
 pl+c71IxTFjUN8FE3xDbqMWksY+4nn4k2vGzj7WLcEPpIQK7woZlJ2oyrWsFXRCpCOOx
 9hpLz5de9zSnKhtQiWFjiek/mg08NFMGVp6PCWYDiF65EqWzyw6QVZn337z0jRRsDtwX
 otlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688344675; x=1690936675;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JPFwCvRngaFzJ94U7CZjB/OGCFNsTWeZNPgu469jNjI=;
 b=awQXBk32gY99s4SQ6GjpzUT5aHdCQgvz/SM2Ut2nk3dhPDF6l194EqDUQcKp6sQDvc
 oKERxj7iIQ9zgzqRp0yJHju3bY5nzvpYoa2OFaquhrS2qhhS2LPJPA6sdwlphOGqqoIe
 waWSMuf1KuQ6FythtK/d6Ygn19cT/AAGx+cUQOjGDW1FXdbZi/+LqHtKtFkVmtPN7NZw
 w2OE6zjwF2pT+aefXY8H4iuzD89zino1toH1SiBKbNkLBp1cY2Xrs65DS1d0cdIzMkeQ
 gtZC3sLOQkQuZxxJC2uR1Gv8WsTuQZhrMYm3QHjxhdW2zeEsMXllXBeM7HBcEn9kqqmN
 T0EA==
X-Gm-Message-State: ABy/qLZoWGnF/x0AOg2mXFOrs8t5KpFgzM3hGQgX3AnPycDC+kfPgo44
 Pe6g69M3W3NkcCKUSLQ3I8x0Vw==
X-Google-Smtp-Source: APBJJlGRBoBupoFRwJOOIXxbqzcof+LE14S8pxvp2t7NizJblaQDQ3CdluQZWpm+UEkjaCU7nqT9Fg==
X-Received: by 2002:a2e:2e04:0:b0:2b4:737c:e316 with SMTP id
 u4-20020a2e2e04000000b002b4737ce316mr6595190lju.14.1688344675238; 
 Sun, 02 Jul 2023 17:37:55 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::ab2]) by smtp.gmail.com with ESMTPSA id
 s24-20020a2e98d8000000b002b6ebc61e85sm136704ljj.54.2023.07.02.17.37.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jul 2023 17:37:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Mon,  3 Jul 2023 03:37:42 +0300
Message-Id: <20230703003745.34239-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230703003745.34239-1-dmitry.baryshkov@linaro.org>
References: <20230703003745.34239-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 10/13] drm/msm: switch to drmm_mode_config_init()
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Switch to drmm_mode_config_init() instead of drm_mode_config_init().
Drop drm_mode_config_cleanup() calls.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index e929da9360e4..6b734be17f3f 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -238,8 +238,6 @@ static int msm_drm_uninit(struct device *dev)
 	if (kms)
 		msm_disp_snapshot_destroy(ddev);
 
-	drm_mode_config_cleanup(ddev);
-
 	if (kms) {
 		pm_runtime_get_sync(dev);
 		msm_irq_uninstall(ddev);
@@ -439,11 +437,13 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	might_lock(&priv->lru.lock);
 	fs_reclaim_release(GFP_KERNEL);
 
-	drm_mode_config_init(ddev);
+	ret = drmm_mode_config_init(ddev);
+	if (ret)
+		goto err_destroy_wq;
 
 	ret = msm_init_vram(ddev);
 	if (ret)
-		goto err_cleanup_mode_config;
+		goto err_destroy_wq;
 
 	dma_set_max_seg_size(dev, UINT_MAX);
 
@@ -551,8 +551,7 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 
 err_deinit_vram:
 	msm_deinit_vram(ddev);
-err_cleanup_mode_config:
-	drm_mode_config_cleanup(ddev);
+err_destroy_wq:
 	destroy_workqueue(priv->wq);
 err_put_dev:
 	drm_dev_put(ddev);
-- 
2.39.2

