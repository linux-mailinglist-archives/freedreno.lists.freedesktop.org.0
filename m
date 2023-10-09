Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 227D07BE8F2
	for <lists+freedreno@lfdr.de>; Mon,  9 Oct 2023 20:10:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B932310E2A6;
	Mon,  9 Oct 2023 18:10:49 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E7AB10E2A3
 for <freedreno@lists.freedesktop.org>; Mon,  9 Oct 2023 18:10:47 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-50307acd445so6045261e87.0
 for <freedreno@lists.freedesktop.org>; Mon, 09 Oct 2023 11:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696875046; x=1697479846; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PDffGe9s39I6J3ue64oALa7ElHnsr/uXc2xUK2PVAIo=;
 b=iuJBA8FsduxvlZI0SQk1w/cJ6299HVmHiwU/Njh76XHTUVMdl255skk/7tkhtIXho4
 3nSpsNvUOI05bzNeDtrFPJhNapRstVa+o5bcByr0Klp2nT6Ph+7SdEeut+uOV4FLreF5
 UIOb7ryEzts4tcL0G4rOkoXp2IReVvpVims+dAiy1L+Fq4Egf2dh/2HbRl8MFU/bSwyS
 ADzoRWO0IElrYn046eAHVQngZ16Jcmq9ayTK7BRBNoSA1/2rSQql5whHFZ6RIVrRp2HH
 RhHoYqU3//otInOMqbMNFKaYIEFzgpTW3syfwZTlSFHEKbGzeIOnpflxZovMw/iUVfrX
 PKJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696875046; x=1697479846;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PDffGe9s39I6J3ue64oALa7ElHnsr/uXc2xUK2PVAIo=;
 b=be4aaDjZpf0QBVi+BpNARoEI7SGtBs+a6EkLpZ+KQE6GSV1pmKry+e7G0Xyx0tdvVS
 d/FoYFVWwLwDbnCNP1C0ub2/YxAuzZQygraPkWsfKS520AFvrgIkpLArbzaZcT6uBdZm
 THO9qQgNpF/BhoPu2qPRX1bk3SePdLXm+fc3v5qXPMeZV7OXqhsL5Xqr3b3BN8fPFktc
 XxDloAyZVNNidjK2tmuw6v0h38TWbmkud6wt51JmWTeNF+znvLOZkDH+0JgOcGj1lGJQ
 gHJa7BcxfDId44NNNl2yjEmW7QiDe7TL0+tvmU3houLiNh3mF+FfmGN4PO6/xTtyk7JT
 Eo5g==
X-Gm-Message-State: AOJu0YyFt0OXThFajXwsaswS/teNin51ZKWqjEyKrI5zxvcVC4hV1xyM
 kTeH8Tez6BvGnkq/sayeeIE/5Q==
X-Google-Smtp-Source: AGHT+IEoGY8TGh+MeEfY49+EpGtxtl6bqUGlHjpkO9fRAkDexHyvI42sNQOanvPNMbrl/GeB9/SU9g==
X-Received: by 2002:a05:6512:159d:b0:503:1722:9c5a with SMTP id
 bp29-20020a056512159d00b0050317229c5amr19024534lfb.3.1696875045806; 
 Mon, 09 Oct 2023 11:10:45 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d6-20020ac25446000000b00505677e7a99sm1506963lfn.139.2023.10.09.11.10.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 11:10:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Mon,  9 Oct 2023 21:10:32 +0300
Message-Id: <20231009181040.2743847-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
References: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 05/13] drm/msm: remove
 msm_drm_private::bridges field
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

As all output devices have switched to devm_drm_bridge_add(), we can
drop the bridges array from struct msm_drm_private.

Reviewed-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 4 ----
 drivers/gpu/drm/msm/msm_drv.h | 3 ---
 2 files changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 5b937c3879af..7617c456475a 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -240,10 +240,6 @@ static int msm_drm_uninit(struct device *dev)
 
 	drm_mode_config_cleanup(ddev);
 
-	for (i = 0; i < priv->num_bridges; i++)
-		drm_bridge_remove(priv->bridges[i]);
-	priv->num_bridges = 0;
-
 	if (kms) {
 		pm_runtime_get_sync(dev);
 		msm_irq_uninstall(ddev);
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 80085d644c1e..a6a29093bbe5 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -206,9 +206,6 @@ struct msm_drm_private {
 
 	struct msm_drm_thread event_thread[MAX_CRTCS];
 
-	unsigned int num_bridges;
-	struct drm_bridge *bridges[MAX_BRIDGES];
-
 	/* VRAM carveout, used when no IOMMU: */
 	struct {
 		unsigned long size;
-- 
2.39.2

