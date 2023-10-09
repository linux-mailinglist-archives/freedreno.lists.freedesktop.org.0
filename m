Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7367BE900
	for <lists+freedreno@lfdr.de>; Mon,  9 Oct 2023 20:11:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EE6F10E2C5;
	Mon,  9 Oct 2023 18:11:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6053D10E2B1
 for <freedreno@lists.freedesktop.org>; Mon,  9 Oct 2023 18:10:51 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-5046bf37ec1so6372964e87.1
 for <freedreno@lists.freedesktop.org>; Mon, 09 Oct 2023 11:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696875049; x=1697479849; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7fO+sWOeSmRkDmpBJ32tICKPjdJ7k9e53PrGRnC7dXE=;
 b=g7ZjhgWrh+geC0uTx3Em0ynODktHfZhIoNH0UwGyKrU5Lzx4IvVbJ1SWWvI/0pEay/
 iRws4EAoNoCnGqGcMmYp9W4hlt5GHySxzOopkmpZ/1Nxs0MRtDXILj3mi90bmNwoFxep
 aAecQHboulTTHp270KknTZ5UjQawhJ72iO3h/bLFzpXxZBW/LOaMsMrD9F6X4O69VTJG
 6E4R52fNkfZERuUg3l4y14Nir9muKs5bZXKKegCg/t2W9qwtdowlT8noXDOcMAl2U+Z2
 Y7t3XqsQ/r4zC2qXpuFr2dw4apyLuhLWZuNujrFATpKe3Ss77a+XJqasstuAO3LuLUtn
 DI/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696875049; x=1697479849;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7fO+sWOeSmRkDmpBJ32tICKPjdJ7k9e53PrGRnC7dXE=;
 b=SXDNHWzTFvOVYjW0sBxOcDiIfEPvHGCUEh+84s5hMxmNBzn4Sck2A5YIHZiXuWYEx0
 ysAEgjBLP03QdFx1s+gi/hdFH9kSDNBf+1jMP8SO2SOtcftIluePhwWM6JU8yaA+Plul
 F/BJ/Rkz3K74Y5sCp41MahMmIwzGhmTH2I4jEOQ614PPgEDMQSehBhBe5/Y197AS+bmX
 rVdAfK+30dXpOq9HkLGSLSuk3QNTlCrqRtKRq5Wyn25Jv6SMYM3XAB67qRnEvEv+MjWp
 l2ipcYGcsiqTDhRDImR5P8SO0NxZw9bHqvEkDupd9ejWm4UpzeVzQomB+3OXVm2j4mA2
 GfYA==
X-Gm-Message-State: AOJu0YwqHM9nmaraKWgvaLYXaTna5ohYbM3fte2AdF+5rEW9F5lsjfuf
 ar2bEoGBWL1FqbdJtC9/RwDJDA==
X-Google-Smtp-Source: AGHT+IHZ7AEHPT/cxBG7NCCQF47wnsevopIIA1mMp9bQWYMK3R/xYI3NkYAYd2aSmC4Qtnh1rgTQiQ==
X-Received: by 2002:a05:6512:230d:b0:500:b7ed:105a with SMTP id
 o13-20020a056512230d00b00500b7ed105amr17536069lfu.29.1696875049664; 
 Mon, 09 Oct 2023 11:10:49 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d6-20020ac25446000000b00505677e7a99sm1506963lfn.139.2023.10.09.11.10.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 11:10:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Mon,  9 Oct 2023 21:10:37 +0300
Message-Id: <20231009181040.2743847-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
References: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 10/13] drm/msm: switch to
 drmm_mode_config_init()
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

Reviewed-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 8079f408c9ed..00ed71c3d503 100644
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
@@ -440,11 +438,13 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
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
 
@@ -555,8 +555,7 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 
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

