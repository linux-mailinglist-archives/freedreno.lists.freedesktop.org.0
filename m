Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA5D6E9EBF
	for <lists+freedreno@lfdr.de>; Fri, 21 Apr 2023 00:26:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 804AC10ED17;
	Thu, 20 Apr 2023 22:26:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E59910ED05
 for <freedreno@lists.freedesktop.org>; Thu, 20 Apr 2023 22:26:02 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4eed6ddcae1so4490499e87.0
 for <freedreno@lists.freedesktop.org>; Thu, 20 Apr 2023 15:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682029560; x=1684621560;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wmeEqXDJ0HCLnbeMBAf8mJfMQ+R0J7QCar9Y3vGXcnk=;
 b=XzKAbThSax/1PS/5f+XCUduDq+SZlj7j0nwjJVaClas4tdIlGGMCS6rKWxski7mPVh
 u0kYwIp4lxyEi0IbXigirSR6wOF+Rc0Ce0Owu5yCfHnSi7gOyzDQC/xz/V/PBd3WblAz
 VzYN4CfUKEW1MxQIq4jPZ17MnA9qPpLGHCMEZXusHXQDmWAXGNzDaNO9TVN0s95y0ZGU
 p1PPFLMzz0fliUdHjs1bzohs3ia9TGuMuswCsLO9pm/aP4J5zShntAN+cApF/5qo1Rdp
 0uDSkLAu1hUF1oW7OnzAnF4PEU1uxc3Ng/7rI5eycDAQXtYWGHJnCznqbzbvlAowzzbP
 DfyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682029560; x=1684621560;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wmeEqXDJ0HCLnbeMBAf8mJfMQ+R0J7QCar9Y3vGXcnk=;
 b=D9BsdeUD7xzkaY8WsVJtwGP77DxsLD6i1FPmdIDkbUYui66qDanVsl2U4P8Z5kLlqf
 dh1qxTIDrGZbZ5df2vpD368tYskQXgSdh1Tx5la9MCP4Jk0idOwnNEYAa4bnvfGf6uI5
 7pp8YDcSEce7lvsq/GfPxZ/KoDXiQvmpoeEbdrvUm67bS52L8JBwJwEmVXYGfjywkFep
 czKzxZt2Jl61xvdc54gxB9oYpzjlIAYJmGr1RZ9CnSMJizby6LLLDQK3yBzaVXC76++d
 gUNiLSeVPWTkqiyupUj8KSjltY93QCY8TVPnhMLG4PFXA/mcs3BUgtWlowad6ml1dkij
 Lizw==
X-Gm-Message-State: AAQBX9fdUOniDcVWw9LZj6v9jyoCxZZ1ZfBpIVaIbktMEnV+uc6fuCyT
 WJHI9X7y3qEh0z2lQyhniCSD+Q==
X-Google-Smtp-Source: AKy350YUpZeoldKMvU7Qw62wA/HsDl19x+J8g4WzW7LgRiLzP1Dm5vy0sXMWMqa4txjCnZ71BlwOHA==
X-Received: by 2002:a05:6512:1319:b0:4dd:9eb6:5b4c with SMTP id
 x25-20020a056512131900b004dd9eb65b4cmr1951449lfu.0.1682029560095; 
 Thu, 20 Apr 2023 15:26:00 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 f21-20020ac251b5000000b004cb45148027sm347567lfk.203.2023.04.20.15.25.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 15:25:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Fri, 21 Apr 2023 01:25:58 +0300
Message-Id: <20230420222558.1208887-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230420222558.1208887-1-dmitry.baryshkov@linaro.org>
References: <20230420222558.1208887-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 2/2] drm/msm/dpu: stop mapping the regdma
 region
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

Stop mapping the regdma region. The driver does not support regdma.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 6 ------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h | 2 +-
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 0e7a68714e9e..28d74d4d2c1d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1033,12 +1033,6 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		DPU_DEBUG("VBIF NRT is not defined");
 	}
 
-	dpu_kms->reg_dma = msm_ioremap_quiet(dpu_kms->pdev, "regdma");
-	if (IS_ERR(dpu_kms->reg_dma)) {
-		dpu_kms->reg_dma = NULL;
-		DPU_DEBUG("REG_DMA is not defined");
-	}
-
 	dpu_kms_parse_data_bus_icc_path(dpu_kms);
 
 	rc = pm_runtime_resume_and_get(&dpu_kms->pdev->dev);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index aca39a4689f4..15111e433f21 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -71,7 +71,7 @@ struct dpu_kms {
 	const struct dpu_mdss_cfg *catalog;
 
 	/* io/register spaces: */
-	void __iomem *mmio, *vbif[VBIF_MAX], *reg_dma;
+	void __iomem *mmio, *vbif[VBIF_MAX];
 
 	struct regulator *vdd;
 	struct regulator *mmagic;
-- 
2.39.2

