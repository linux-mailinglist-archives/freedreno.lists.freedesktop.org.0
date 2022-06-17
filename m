Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C50F54FC8F
	for <lists+freedreno@lfdr.de>; Fri, 17 Jun 2022 19:55:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF8DF10E7BB;
	Fri, 17 Jun 2022 17:55:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 132AD10E4A3
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jun 2022 17:55:43 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id a29so8042426lfk.2
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jun 2022 10:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ByYz0vZByrH5ZeGoDfGbZOJgTHhBJ8/LzLyyFMFujSk=;
 b=pFNBrgDNFMoKFY+eA39lRfdk74cdnJtBhZgaKF1GspL5uviGX9jw4u8XOb45LKZC5N
 JF83Q5vubro2ZJ8D4SHNC/FFmvtcWUBBAU9M9LV9zJQ9hHdPfv+rtf4Hku662gQktazG
 awRrRG21cnAutAgO7OS5HYjELHSEFNoFYGO9wabJ6+V2JyT5xP5GCpy/AUfOe7LWoJ0s
 2WxMY514oRbpiGtcQFw7Tq20GufXm9p1dpBmurLXrlpKBuHIYz5hsolaqLTXkPVUuCa/
 PY4GnMNsBYFnP3TRfYnp1L9kXybNWHn2ACBIxM67EX8OZRqxvChSQQqfHEQ+nwCxsxd7
 sm8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ByYz0vZByrH5ZeGoDfGbZOJgTHhBJ8/LzLyyFMFujSk=;
 b=2dcn19QDhReKrhqYRANP8GBuNOP/wnSzyqjBku30/JjYCZoUYg+l6Zz+0uDP/i0IrS
 IDDRZIc0jY6OwJ4sag+YeJsuKe7BWP2T3aHfP210RtVuPGucBiPIdG8WXSFChJI+sudH
 YKXM9T6Skzxd0bPocnd6o5Z5vnU3Qv/dsIzgPnGKbx+KCVeYbfOYdVR7OjFBcyDodL7+
 R/hVi+tTzcUhxGG06u2bUvil1eK2ukYZWrK0HHTrD1MyxJUs9xyW5IA7CgmcM8THcBkg
 4eZJJO9m1WQ5FaBwYaItLD3lWUGza4ZRAm8o6H2sJfUz4As+f5fNO5Wf+FIDNjlCvdUM
 hPdQ==
X-Gm-Message-State: AJIora/TdPNN135U7JI3UE7oSvPKdiWNHkh5jFI3MsDS2UMc4Ddtj1Ef
 GCa3HPsezQ7GtJe2NC5T9cJwFQ==
X-Google-Smtp-Source: AGRyM1smkVEeZdqzeINbgdR4nuuAyiDE+8c3FrrmoTGdPTvnuqpIOglqUu7CpMHr4HJf/ynHxA/ZGw==
X-Received: by 2002:ac2:55a4:0:b0:47d:aab8:a67c with SMTP id
 y4-20020ac255a4000000b0047daab8a67cmr6136167lfg.301.1655488541357; 
 Fri, 17 Jun 2022 10:55:41 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 u19-20020a05651220d300b0047968606114sm712747lfr.111.2022.06.17.10.55.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jun 2022 10:55:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Fri, 17 Jun 2022 20:55:37 +0300
Message-Id: <20220617175538.1080351-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220617175538.1080351-1-dmitry.baryshkov@linaro.org>
References: <20220617175538.1080351-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 2/3] drm/msm/mdp5: convert to
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

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c
index 9b4c8d92ff32..43443a435d59 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c
@@ -82,8 +82,7 @@ irqreturn_t mdp5_irq(struct msm_kms *kms)
 	struct mdp_kms *mdp_kms = to_mdp_kms(kms);
 	struct mdp5_kms *mdp5_kms = to_mdp5_kms(mdp_kms);
 	struct drm_device *dev = mdp5_kms->dev;
-	struct msm_drm_private *priv = dev->dev_private;
-	unsigned int id;
+	struct drm_crtc *crtc;
 	uint32_t status, enable;
 
 	enable = mdp5_read(mdp5_kms, REG_MDP5_INTR_EN);
@@ -94,9 +93,9 @@ irqreturn_t mdp5_irq(struct msm_kms *kms)
 
 	mdp_dispatch_irqs(mdp_kms, status);
 
-	for (id = 0; id < priv->num_crtcs; id++)
-		if (status & mdp5_crtc_vblank(priv->crtcs[id]))
-			drm_handle_vblank(dev, id);
+	drm_for_each_crtc(crtc, dev)
+		if (status & mdp5_crtc_vblank(crtc))
+			drm_crtc_handle_vblank(crtc);
 
 	return IRQ_HANDLED;
 }
-- 
2.35.1

