Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D089E51B243
	for <lists+freedreno@lfdr.de>; Thu,  5 May 2022 00:49:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 819E410EB33;
	Wed,  4 May 2022 22:49:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBB4810E9B7
 for <freedreno@lists.freedesktop.org>; Wed,  4 May 2022 22:49:31 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id x12so2269319pgj.7
 for <freedreno@lists.freedesktop.org>; Wed, 04 May 2022 15:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dijXTkiQHrfrlF4ID+znm8V5fZSPJC1gmyuClDGbRpM=;
 b=KnQUKihb/oVI0KbzvzptyFH6gHyzwx78tuSQzyxRYYtkAIdDOZTWZhlQZhLFlBeWOp
 j8RKG5i1b4ugEU754VQCuM8t49ONqK8c8R+I2vGT2BEGRs92ej0IZ2N9VXvkWqu4ClDi
 Diq2ZeuXYyv4WvhnGPBn1lRcHUKVUIOCL2kVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dijXTkiQHrfrlF4ID+znm8V5fZSPJC1gmyuClDGbRpM=;
 b=JNA7gICicSoa4YHr6J0z1WkgdY8VWSSxlL+rBu2unf7oDDLoQglO4l3ZvZYitTN5pw
 hSxpenwVigRzlNGpZQDSJGkK7yktl/eFT/0qQETgoL2ElMkp1vaGTKJ2H2aPhisNe3PA
 dBdigf5qrjk+LHM1hIhPGc/uytSor0UcA33xPKjzE8fAEszFUj3MLE9rAHbYVYssv9h4
 jWpEd/e8Uygy84BjllRox0zrk0DRzXmyHENsqgMXzzjAvmfwTOV11o03NqyBdFmGYiqv
 SN0kuragurnfu7m21SCs70aX9xMbmaEgFi3d4QeSV3B9vvkPNEDtL5S6SXA6KKsgyk/i
 4gpg==
X-Gm-Message-State: AOAM5307cd0SsyhLXH+WiFK0KjkcXm1v+2RSvj4BcJEoV2FIRzsooUFA
 JasV7VqlrzxtPLdD0WR63lLvxw==
X-Google-Smtp-Source: ABdhPJyMiDyPd/6VfPLzI/BKb/Du4iDMHhjPft3yL/BkGqSeg5FtyrDZBqihX1qBl5TEhX24E/4+wA==
X-Received: by 2002:a05:6a02:19c:b0:3aa:1bf8:7388 with SMTP id
 bj28-20020a056a02019c00b003aa1bf87388mr19780091pgb.455.1651704571489; 
 Wed, 04 May 2022 15:49:31 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:1da3:6a8e:557c:da09])
 by smtp.gmail.com with ESMTPSA id
 s21-20020aa78295000000b0050dc76281b7sm9034473pfm.145.2022.05.04.15.49.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 15:49:31 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed,  4 May 2022 15:49:26 -0700
Message-Id: <20220504154909.1.Iaebd35e60160fc0f2a50fac3a0bf3b298c0637c8@changeid>
X-Mailer: git-send-email 2.36.0.464.gb9c8b46e94-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] drm/msm: Fix shutdown
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
Cc: linux-kernel@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org,
 Lv Ruyi <lv.ruyi@zte.com.cn>, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Xu Wang <vulab@iscas.ac.cn>, Daniel Vetter <daniel@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, linux-arm-msm@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

When rebooting on my sc7280-herobrine based device, I got a
crash. Upon debugging, I found that I was in msm_drv_shutdown() and my
"pdev" was the one associated with mdss_probe().

From source, I found that mdss_probe() has the line:
  platform_set_drvdata(pdev, mdss);
...where "mdss" is of type "struct msm_mdss *".

Also from source, I saw that in msm_drv_shutdown() we have the line:
  struct msm_drm_private *priv = platform_get_drvdata(pdev);

This is a mismatch and is the root of the problem.

Further digging made it apparent that msm_drv_shutdown() is only
supposed to be used for parts of the msm display framework that also
call msm_drv_probe() but mdss_probe() doesn't call
msm_drv_probe(). Let's remove the shutdown functon from msm_mdss.c.

Digging a little further, code inspection found that two drivers that
use msm_drv_probe() weren't calling msm_drv_shutdown(). Let's add it
to them.

Fixes: ecb23f2e3009 ("drm/msm: split the main platform driver")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 1 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 1 +
 drivers/gpu/drm/msm/msm_mdss.c           | 1 -
 3 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 143d6643be53..2b9d931474e0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1350,6 +1350,7 @@ MODULE_DEVICE_TABLE(of, dpu_dt_match);
 static struct platform_driver dpu_driver = {
 	.probe = dpu_dev_probe,
 	.remove = dpu_dev_remove,
+	.shutdown = msm_drv_shutdown,
 	.driver = {
 		.name = "msm_dpu",
 		.of_match_table = dpu_dt_match,
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 9b7bbc3adb97..3d5621a68f85 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -1009,6 +1009,7 @@ MODULE_DEVICE_TABLE(of, mdp5_dt_match);
 static struct platform_driver mdp5_driver = {
 	.probe = mdp5_dev_probe,
 	.remove = mdp5_dev_remove,
+	.shutdown = msm_drv_shutdown,
 	.driver = {
 		.name = "msm_mdp",
 		.of_match_table = mdp5_dt_match,
diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 20f154dda9cf..0454a571adf7 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -397,7 +397,6 @@ MODULE_DEVICE_TABLE(of, mdss_dt_match);
 static struct platform_driver mdss_platform_driver = {
 	.probe      = mdss_probe,
 	.remove     = mdss_remove,
-	.shutdown   = msm_drv_shutdown,
 	.driver     = {
 		.name   = "msm-mdss",
 		.of_match_table = mdss_dt_match,
-- 
2.36.0.464.gb9c8b46e94-goog

