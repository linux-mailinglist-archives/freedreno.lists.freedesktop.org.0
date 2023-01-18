Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A16671085
	for <lists+freedreno@lfdr.de>; Wed, 18 Jan 2023 03:05:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0950310E62F;
	Wed, 18 Jan 2023 02:05:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C28910E62F
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jan 2023 02:04:58 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id qx13so21445680ejb.13
 for <freedreno@lists.freedesktop.org>; Tue, 17 Jan 2023 18:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=he4t6UJ6QSC3T1Ti+edP9oNYIydk/RBUqrKCOvss08s=;
 b=xce0Etiznc2C6Eny9wmN+993oebbBhdy1plEpT2xNLnwgtbjQZK+uycwOWloLFB7pK
 wu7FqZeXywddXrUOKuNQ1BgSWUzIBJkVNqMIfj+F6L+OIiZR1Dkv9TU4ZkXkp2qJpQUG
 0c3cJT6rXaJFNfFEiok2W0vMHx0VsjcSuNvJyGP79tZxHfh/k1K+uHpL6a+L9XwXOHe0
 H8ht6TBFkbYEMfnjNH4knTXSL6pMxnZKLsHWb5M3j1vqpcdVqdIdCbRdivMvf6YWO/N5
 EoRgTtlLQ04o+Rn4+EyewyAw240nZ1/gbpHRFhyWAZzPyHeA7V4cMT6KHDTLbgZ9yQ4k
 aymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=he4t6UJ6QSC3T1Ti+edP9oNYIydk/RBUqrKCOvss08s=;
 b=C9FERvnEDdebeCiHi+L9hYt2Ld41TkW7VPtJmdYDFzSqdNUSCZG4YyDaOJl10smgj1
 W5dhwiFWA096UjMnQfrZ/K7EgwLCYOLi80VYFAnoyKNba2Y5meMJNnuKxYfS6V7wL9uj
 Eii1VVnTbnIqN8Qug1m4QzxzaWDgLHdefctKWsUfzyo5tdFf0wiuMctN4hFkgNuBvQZv
 C/71pcqapiDW8hcitWp79morupl1LoRB0V4QnqU8/oFozIX4lGCiR1jRtp2Mz04Uteb1
 isqH9jZL0IaopbaKdahKXByW3bR/2QmnA3PVZDFVlrLAhzJ6vY4TRa3jtAUfoWuBhMLi
 zh3g==
X-Gm-Message-State: AFqh2krB8dIbDNs1sYDTGx2rOy0qQgRJjy+PJyovaS0UwBJQZkXmlLgz
 /ckV0vrw4gkKGd8gkJF1JwODzw==
X-Google-Smtp-Source: AMrXdXvYeU4WMbqNwPwG88LxBwDVokGmvq+fYzLUh89sDzdLlSJb7AUBKwbrSeWY9hSa7ogjHyTA3g==
X-Received: by 2002:a17:906:3f87:b0:809:c1f4:ea09 with SMTP id
 b7-20020a1709063f8700b00809c1f4ea09mr4827344ejj.69.1674007496895; 
 Tue, 17 Jan 2023 18:04:56 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 kx4-20020a170907774400b007c10d47e748sm13836459ejc.36.2023.01.17.18.04.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 18:04:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Wed, 18 Jan 2023 04:04:54 +0200
Message-Id: <20230118020455.1689929-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 1/2] drm/msm/dpu: point sc8280xp_dpu_cfg to
 sc8280xp_regdma
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

SC8280XP configuration missed the reg_dma configuration. We do not use
regdma for now, but let's put the correct pointer anyway.

Fixes: 4a352c2fc15a ("drm/msm/dpu: Introduce SC8280XP")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 4375e72a9aab..3d0fbc1746e2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -2680,6 +2680,8 @@ static const struct dpu_mdss_cfg sc8280xp_dpu_cfg = {
 	.intf = sc8280xp_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
+	.reg_dma_count = 1,
+	.dma_cfg = &sc8280xp_regdma,
 	.perf = &sc8280xp_perf_data,
 	.mdss_irqs = IRQ_SC8280XP_MASK,
 };
-- 
2.39.0

