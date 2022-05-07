Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADD351E8D1
	for <lists+freedreno@lfdr.de>; Sat,  7 May 2022 19:09:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55C2D10EB89;
	Sat,  7 May 2022 17:09:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FE1D10EB65
 for <freedreno@lists.freedesktop.org>; Sat,  7 May 2022 17:09:25 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id b18so17285467lfv.9
 for <freedreno@lists.freedesktop.org>; Sat, 07 May 2022 10:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NzygQfKaqxUN99VFssPvB6WUeLsx3+QcBbNDEkCRpbg=;
 b=nOqdkoUfgDzqeU7e9JGMkBSD98aE1d0/dRdjv/WiNhyhZ7lqXjBAyR8Yoy/lHpiJLJ
 NBJlFx6eUoU6SnInFQCqCIFsj5HvOmjOvBCiG71quFYNJ0HnFdHULLg4pcil4x0DJpit
 CHFRYXPncMLcOnSx7Xl0CY5TmHv8ByLPLpD4x28op0b9MsK3IjK7F7Kb7UBcugZ/xVGr
 xVjzH/iL9hThP4WjOmp1hgNLQXYEiU1oQFSJkCkZPJeW8RyIa8ErGmRiCcbYYZ+IJh8Q
 1aGBZ6BfHh2o9/kAELh7t92wZds0pLp4Vd5YVXvBxb1im37HeqgkKo2wrMDnBZRAsFWI
 W1lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NzygQfKaqxUN99VFssPvB6WUeLsx3+QcBbNDEkCRpbg=;
 b=z9h8zZ8aWNrdce0y16glsF378860LF6QEEFxEq3UX2dKmI/dV//4MkxARwgIl08SqY
 LL2NljNl6HOtvvkqjHrMsz+slRYAK9if5NWhsl9WUZ+EKchqQIJPgsEpE4cJ0DhrCkjI
 35Gjq8bKLMVF4NH6ZrIJQ8A0orw5mOXdhq8rjDdWoFEnHpuexNb6zBhSx653Pdy2Qy2K
 shVVLoNUOtmYlCm1FRBkpqYLVPcuBAbkFNyPO0peV5ALdUm/hj26yCv3qteu3NfT2cKV
 Sqj7hByJ38956euxhGp86MXlmvv3G98ZtH6qDqJNfFTGhIyq65PKTNKnKQ1vQpSp/Eys
 kXiw==
X-Gm-Message-State: AOAM531Zidlpj+MFrHMK43ztzk+BXQD20+NqNTd0QejSRjKQIUzi4MOD
 C/GT2ea7/yl9A44j9krCcGCQLQ==
X-Google-Smtp-Source: ABdhPJyHWSoma8yU9uXEMXFj4Hng1G6xTNnzJFh+/QHTS715VFATXhoOiPi+VVoUddbzqC9+fRto3A==
X-Received: by 2002:a05:6512:3f0e:b0:471:acdd:590c with SMTP id
 y14-20020a0565123f0e00b00471acdd590cmr6712966lfa.520.1651943363758; 
 Sat, 07 May 2022 10:09:23 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 n14-20020a05651203ee00b0047255d211f9sm1175308lfq.296.2022.05.07.10.09.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 May 2022 10:09:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Sat,  7 May 2022 20:09:20 +0300
Message-Id: <20220507170922.1723712-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 1/3] drm/msm/mdp4: convert to
 drm_crtc_handle_vblank()
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
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Stop using deprecated drm_handle_vblank(), use drm_crtc_handle_vblank()
instead.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_irq.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_irq.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_irq.c
index 4d49f3ba6a96..ddcdd5e87853 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_irq.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_irq.c
@@ -69,8 +69,7 @@ irqreturn_t mdp4_irq(struct msm_kms *kms)
 	struct mdp_kms *mdp_kms = to_mdp_kms(kms);
 	struct mdp4_kms *mdp4_kms = to_mdp4_kms(mdp_kms);
 	struct drm_device *dev = mdp4_kms->dev;
-	struct msm_drm_private *priv = dev->dev_private;
-	unsigned int id;
+	struct drm_crtc *crtc;
 	uint32_t status, enable;
 
 	enable = mdp4_read(mdp4_kms, REG_MDP4_INTR_ENABLE);
@@ -81,9 +80,9 @@ irqreturn_t mdp4_irq(struct msm_kms *kms)
 
 	mdp_dispatch_irqs(mdp_kms, status);
 
-	for (id = 0; id < priv->num_crtcs; id++)
-		if (status & mdp4_crtc_vblank(priv->crtcs[id]))
-			drm_handle_vblank(dev, id);
+	drm_for_each_crtc(crtc, dev)
+		if (status & mdp4_crtc_vblank(crtc))
+			drm_crtc_handle_vblank(crtc);
 
 	return IRQ_HANDLED;
 }
-- 
2.35.1

