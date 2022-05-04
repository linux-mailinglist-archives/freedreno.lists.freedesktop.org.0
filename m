Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C706D51B3A0
	for <lists+freedreno@lfdr.de>; Thu,  5 May 2022 01:39:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 321ED10E919;
	Wed,  4 May 2022 23:39:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 869AB10E618
 for <freedreno@lists.freedesktop.org>; Wed,  4 May 2022 23:39:37 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id e5so2350174pgc.5
 for <freedreno@lists.freedesktop.org>; Wed, 04 May 2022 16:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZcjXks/OZvIeQ48LeUZ4ev10sgtmh+A/DjFdnPkrArc=;
 b=bkT3tVCvUqtfkwZTFOYCuIFr5GfsuH2RuNfy5q7qIlKAzjusR5Eitvd1OX4suoZW+0
 wTAkdVmqLOABMMkpP3JAuJb+PjizMv8UVdZ21s4mXhiWgcKp+C/qfOQUTtlzKfgeY2NC
 uKsJAWTey0OhoScc3BvWdUAr/VUBoVav0ZvLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZcjXks/OZvIeQ48LeUZ4ev10sgtmh+A/DjFdnPkrArc=;
 b=DAhDjO3TSnz83k3JD/hM57S7OuZr+LiZZtzGW8JDneqF2d6SeqLk7GeHS4kACWH0ct
 xO1vFeqgluqFudrY6HbHkBegMiO3EGjBEhXKCPIjs4bUpgvq0PYhAKhYWh4kTdTyypfP
 YBmudRkbyPK3suJKqbecXGRmZ2tnJApHVYLeCy1mCqDxDr5vvdeQ0gmVZpZRmFjSf3XC
 AMj8uQiRZ6fUEjn2Egs6mj29qAgCVnBwIlPQkoIdxgdkJQnSOpKbbQm/M5ALjMY21QPb
 Fv8+rRKZYOifiaxceIkeNq+2hYDfyXLKqxmQXToilAT0h55mY7PhV6NaxQOnkMpgZHN9
 pc1Q==
X-Gm-Message-State: AOAM532Agl4OF3kGt/yZKKf2DOxMPBn5/TD04NLXJ4DyitXD+oZtfS73
 cUACvnDtZe/JRrionu0PRhdJcg==
X-Google-Smtp-Source: ABdhPJydJo1xmGq3cPW9J7N2vJNGEG+YilKeqMLd+36+LvTQilr9AnAml998OgsrGgm+ZXNXvZOYHQ==
X-Received: by 2002:a63:8348:0:b0:3c6:6c7:9e40 with SMTP id
 h69-20020a638348000000b003c606c79e40mr2040249pge.224.1651707577099; 
 Wed, 04 May 2022 16:39:37 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:1da3:6a8e:557c:da09])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a170902e74100b0015e8d4eb1bbsm65321plf.5.2022.05.04.16.39.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 16:39:36 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed,  4 May 2022 16:39:30 -0700
Message-Id: <20220504163900.v2.1.Iaebd35e60160fc0f2a50fac3a0bf3b298c0637c8@changeid>
X-Mailer: git-send-email 2.36.0.464.gb9c8b46e94-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2] drm/msm: Fix shutdown
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
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Xu Wang <vulab@iscas.ac.cn>,
 Daniel Vetter <daniel@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, linux-kernel@vger.kernel.org
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

Fixes: 6874f48bb8b0 ("drm/msm: make mdp5/dpu devices master components")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---

Changes in v2:
- Fixed the Fixes tag.

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

