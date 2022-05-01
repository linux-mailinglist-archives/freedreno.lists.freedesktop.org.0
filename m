Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B0B516398
	for <lists+freedreno@lfdr.de>; Sun,  1 May 2022 12:10:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8126010EBA9;
	Sun,  1 May 2022 10:10:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C7DD10EAE4
 for <freedreno@lists.freedesktop.org>; Sun,  1 May 2022 10:10:27 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id n14so20912975lfu.13
 for <freedreno@lists.freedesktop.org>; Sun, 01 May 2022 03:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TI23wKQEneJ5WP1153aFPWXvGTv0wcRzY+mGykcwofk=;
 b=d1bvtS0N6dIqktEIIlNJ2QBhXBskRsIxYdnDTi+Gw/NPPipud0ttUypiQi8R58saKo
 C6ll9v/V66B/hYdcuXt1pVaBcszyIhQVkT9cL0xcibHBmXLBJM2I8XwhLqgZmAdW8lBG
 m/d8bcYuccTPhc6hDMOQO81EtBHiNAhm3ECQsdF47/Svv8q73Z2VOdoWgdyRqF2b7v2R
 HR09XTKEKRAZNvbo6RATSTuiEVeffmLQMasRekRTFwJ/V9qVpvlOHFKTmgEuiLW6jEet
 eWhDslj6rgJmnSj8L0KHYuWAULNrZACTERSr3XAZHtz9g8Jy9AP7brV9b06ferjUPpwm
 PW+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TI23wKQEneJ5WP1153aFPWXvGTv0wcRzY+mGykcwofk=;
 b=spRUAeZ7f0ivJFunStrWifAQ9KyZRUE6YE7uZVlJtIqTAHMmPKpsXcRuGSc8EcxacV
 /ld+1JDTdXqmqBe7/ka4Kxgy3kxWwtcuSxF7Z9Mdk0zK9LQEhQk6qb0A2uG95dl2BBIs
 ZiA6SY1LEaOpVv0j3JGMGxhhGELb5OfuPVzf/q1FiIplLxGCJgogbO+855oJo+8Ttf43
 uQoxn+Ta5X7PydY84v0NllPtwoNgitE+ITfA1WB0NPrzBZZkZ8cwHi+eupcYKnmaum4L
 d83ILKAYKqJ7bxYvwXi+2CfW/WeAd+ggthUxyO0qk6G5kk9qRX1w484CkJXn1AWNyjfm
 4Erw==
X-Gm-Message-State: AOAM531ben/mh8DwBOD8qKR+hvKe+UArHWkQ74VBgqt/+TVlnB7jA8KJ
 29ILIEhhEg2vSM6mXb1pEO1NWw==
X-Google-Smtp-Source: ABdhPJy+qSaB35tEuaZl8E2U/QytPoM+/Y5D8MZQVYBje/2lYI6+egHRI7TBm7Y965f4DOZEmRk0cQ==
X-Received: by 2002:a05:6512:3d13:b0:472:5d8d:5202 with SMTP id
 d19-20020a0565123d1300b004725d8d5202mr3298812lfv.331.1651399825737; 
 Sun, 01 May 2022 03:10:25 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 h7-20020a2ea487000000b0024f3d1dae7csm766412lji.4.2022.05.01.03.10.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 May 2022 03:10:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Sun,  1 May 2022 13:10:22 +0300
Message-Id: <20220501101022.3931295-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220501101022.3931295-1-dmitry.baryshkov@linaro.org>
References: <20220501101022.3931295-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 3/3] drm/msm: Stop using iommu_present()
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Even if some IOMMU has registered itself on the platform "bus", that
doesn't necessarily mean it provides translation for the device we
care about. Replace iommu_present() with a more appropriate check.

On Qualcomm platforms the IOMMU can be specified either for the MDP/DPU
device or for its parent MDSS device depending on the actual platform.
Check both of them, since that is how both DPU and MDP5 drivers work.

Co-developed-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 4a3dda23e3e0..a37a3bbc04d9 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -266,8 +266,14 @@ bool msm_use_mmu(struct drm_device *dev)
 {
 	struct msm_drm_private *priv = dev->dev_private;
 
-	/* a2xx comes with its own MMU */
-	return priv->is_a2xx || iommu_present(&platform_bus_type);
+	/*
+	 * a2xx comes with its own MMU
+	 * On other platforms IOMMU can be declared specified either for the
+	 * MDP/DPU device or for its parent, MDSS device.
+	 */
+	return priv->is_a2xx ||
+		device_iommu_mapped(dev->dev) ||
+		device_iommu_mapped(dev->dev->parent);
 }
 
 static int msm_init_vram(struct drm_device *dev)
-- 
2.35.1

