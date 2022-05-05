Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BB851B488
	for <lists+freedreno@lfdr.de>; Thu,  5 May 2022 02:16:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C78CE10F91B;
	Thu,  5 May 2022 00:16:14 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 759F410F917
 for <freedreno@lists.freedesktop.org>; Thu,  5 May 2022 00:16:10 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id g16so3681074lja.3
 for <freedreno@lists.freedesktop.org>; Wed, 04 May 2022 17:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TI23wKQEneJ5WP1153aFPWXvGTv0wcRzY+mGykcwofk=;
 b=gkcH6vyhw4QT1tnvJaJgrYP4LsDs07MNRXSwqlRWpZ1qNEW4lrBoYEYI/o47S7rWIz
 XsDpSKRgMAdib/F7ACZGpPiPJv36KokgdX/s1PQlVwwQ1LzkbmTVxZaMzechmmd7crKQ
 KpVRs5GQDxGOGM+sOwFp7Zrb/5WYLHw6P48CJQ1vlAy56k9UPRcIb9qSwzVTq83HmOkF
 ZUAULTng0oThFeeOFg/7q6ICnYWS3X1WMXOfs4RQluALo9JWr7qv9d0v/JRE5RlB8iZA
 jKiQoCDpihLK65T7X7czbyNk++hkye1KmBjVpGvKcyQpHS50zI8H12I5qcXDM4HhdVzH
 ZAmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TI23wKQEneJ5WP1153aFPWXvGTv0wcRzY+mGykcwofk=;
 b=UK9OIFgXyyWvM8X8Hlzbad1+yzzjS5UmeLV95DkX2X71lZM+8BxjvAmJJByOgkjH3l
 4oXhqS6tVL5wtU00As6q0JZbpmFQHG7gFNuXk+OH2RkjMWzz9SocP9Qrfdjlh7Olj8rz
 T5gQbjtm79S1UEnNtswdR3jVQ5MBoPnasvR6Cp8SlAYLhTOVR3X5a6dAQRWfxPNoqGRM
 8orphxhvUjWjawKBr0EEe5xaeJzsSe3edovYxxZBsapsKq0tXhlF1SYnDzGMVZG79Xp0
 DqUlkf8qWNUc8pnE+YkFtUA1Sf4GRKCy0cIZbpXGHMM9TSt54w8D4IYbhtjDeLhQ0ySL
 BiZQ==
X-Gm-Message-State: AOAM530S4CTgcHpMtTVqOeVvxgAMzs6c2rXA7owPIHkiRqI/FaBl+3nk
 crVxT1FdgJr0mPs1yguCk8Pt4Q==
X-Google-Smtp-Source: ABdhPJwD4QW6UJ+J7EMA1VgNHtzOlyK9oR84PU7v9fs+dZkyUgSwmJ7vfnhT4blOr4yp7I9mfynVgg==
X-Received: by 2002:a2e:8e84:0:b0:24f:1d40:ceb0 with SMTP id
 z4-20020a2e8e84000000b0024f1d40ceb0mr14868330ljk.292.1651709768554; 
 Wed, 04 May 2022 17:16:08 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 u24-20020ac25198000000b0047255d211b0sm6714lfi.223.2022.05.04.17.16.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 17:16:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu,  5 May 2022 03:16:03 +0300
Message-Id: <20220505001605.1268483-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220505001605.1268483-1-dmitry.baryshkov@linaro.org>
References: <20220505001605.1268483-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 3/5] drm/msm: Stop using iommu_present()
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

