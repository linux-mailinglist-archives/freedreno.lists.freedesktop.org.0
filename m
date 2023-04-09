Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FABF6DBE3E
	for <lists+freedreno@lfdr.de>; Sun,  9 Apr 2023 03:13:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FED510E042;
	Sun,  9 Apr 2023 01:13:35 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BC4410E042
 for <freedreno@lists.freedesktop.org>; Sun,  9 Apr 2023 01:13:33 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id d7so13664170lfj.3
 for <freedreno@lists.freedesktop.org>; Sat, 08 Apr 2023 18:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681002811;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CbjQ0WKEphE5FlH/qtxRkisOHTrSOYqQhF4V+6PLF/o=;
 b=PKqlLEZxtOe6s1vdAnOGOwxUtkZWKXJsUtN/RyKHajUTZX+UqEBNSsCErw4OfxEmBg
 xToYumVLt9O5W8v4CHhZ/HrMDXk8f6vCYrt5x2Cw25N1RbWmhj2tf0rN0I6sN2UxFRzT
 q4cdRC+riooBOssQ2/3gCBxFm9LbIX8nJudQZiK1NRYkapGIoEgLAeoz846T/IDqsPvN
 9LTI6rA0611SRS5rJoM5X2W+j8UClh1YPmLr/WHCvmxCf33McZdhp2k0Pq/IOO8p972x
 cfX9F63p42NYUMPwniDdRnFQXaQ/o3on4/baUH0FbVLeddHB6O62rISAU5rAbkcZa7Wx
 CVgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681002811;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CbjQ0WKEphE5FlH/qtxRkisOHTrSOYqQhF4V+6PLF/o=;
 b=wndI03kFeY2szt8wPUIF1JykT0xMV0w5RAGoUFddrAt0pWdgOLKAISSLbZ89VvCXrg
 dMUJDjGHgyzOGLwABJ+h7/KC77ExzPcWCOyJ6QLma3CRa65JeKyy6xsDeWIlB0sq4K0t
 wpBBjDQOac3cG0BSmUkhHrKxRPDBI3V4srWyg7nkGRplQuOCMqEOildnRdqRLDtxrAHr
 KGLo7tRldc1TZSV4TBI3rz/pITH8o4HYzJUOvGzhRzGiHP/VUeB5M5oDVrIGZZk24vXJ
 gt2z6LH3+S25ypKlJiG5qwizrbVXkw98m7VAoAp2RzJdqyxv6QvyFQIzE8ls7LwGQm0N
 WwxQ==
X-Gm-Message-State: AAQBX9cfkg8r4LaVB0wYTY7owZkU3WjC7fi9weCPzQygTKa0pVQeNSjz
 ufJ+3qHIHn8Knci9EVlUvOvXyw==
X-Google-Smtp-Source: AKy350Ykxuwz5RwN/KYGVrdZATEgGYWrGy2cC6FLUroM05rMoGs/UwHy4fk/Pv406T3tTYKZWvTv0g==
X-Received: by 2002:ac2:5097:0:b0:4eb:401e:1b76 with SMTP id
 f23-20020ac25097000000b004eb401e1b76mr1925852lfm.52.1681002810675; 
 Sat, 08 Apr 2023 18:13:30 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 f8-20020ac25328000000b004eaf2291dcdsm1379210lfh.102.2023.04.08.18.13.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Apr 2023 18:13:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Sun,  9 Apr 2023 04:13:29 +0300
Message-Id: <20230409011329.2365570-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PATCH] drm/msm/a5xx: really check for A510 in
 a5xx_gpu_init
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
 Bjorn Andersson <andersson@kernel.org>, Adam Skladowski <a39.skl@gmail.com>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The commit 010c8bbad2cb ("drm: msm: adreno: Disable preemption on Adreno
510") added special handling for a510 (this SKU doesn't seem to support
preemption, so the driver should clamp nr_rings to 1). However the
gpu->revn is not yet set (it is set later, in adreno_gpu_init()) and
thus the condition is always false. Check config->rev instead.

Fixes: 010c8bbad2cb ("drm: msm: adreno: Disable preemption on Adreno 510")
Reported-by: Adam Skladowski <a39.skl@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 1e8d2982d603..a99310b68793 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1743,6 +1743,7 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 {
 	struct msm_drm_private *priv = dev->dev_private;
 	struct platform_device *pdev = priv->gpu_pdev;
+	struct adreno_platform_config *config = pdev->dev.platform_data;
 	struct a5xx_gpu *a5xx_gpu = NULL;
 	struct adreno_gpu *adreno_gpu;
 	struct msm_gpu *gpu;
@@ -1769,7 +1770,7 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 
 	nr_rings = 4;
 
-	if (adreno_is_a510(adreno_gpu))
+	if (adreno_cmp_rev(ADRENO_REV(5, 1, 0, ANY_ID), config->rev))
 		nr_rings = 1;
 
 	ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, nr_rings);
-- 
2.30.2

