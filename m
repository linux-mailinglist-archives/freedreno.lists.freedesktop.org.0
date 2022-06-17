Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC1C54FC93
	for <lists+freedreno@lfdr.de>; Fri, 17 Jun 2022 19:55:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEA7A10E7D2;
	Fri, 17 Jun 2022 17:55:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4529110E4A3
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jun 2022 17:55:42 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id v8so5491407ljj.8
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jun 2022 10:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v5Xfd/lShJ436Gkh8UHXXgQps7qSsu2XxGEcqIQNHeg=;
 b=OFQ+NwTd1oExO/YyvBg1+/3FGralOW4TyMBglEdNEOpDf9HJp2Ga4zpaxbiOeVNffp
 PAL/DnazJ/2VaJuuUj68s5PNICR/ZeLV5J1kFbCWCeZjhNk9qUSAULPFiFq/b2l9KKYd
 CW7DKojbNYU4l1aVC+zf87IyL+hBBhWYFjr5HwXokg+2pu+ZLRJ5Jy/2jKVln08wndDj
 tRh0QX9f0AbgeJDALfviFfJWsVk+p+OFTGg066XUkoOP6XtlL/OdprHevu7L4CvD5FyQ
 qqqdSMM7uk2Pp2yeIRM79yNlfdHnybf3yowLN9LSeN8WssI5ln7sqnL3SwYtr6qby+ks
 2rwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v5Xfd/lShJ436Gkh8UHXXgQps7qSsu2XxGEcqIQNHeg=;
 b=P3kTo1oUNPjCZyBJPihHDySM9hKJofjGTTGuKAgMWxDLl6QfXcbGHYgNrXFiHgvxUG
 pYZngBNypObLduHZ0UONvIJtYOpfw8H2DDE9POCp4XmCedBPnc5IU4OpfeIk1KLK0yOM
 C2w+ymVzd5WQpLqK+bL5ZYEHl4uNiEPcAFJ74+mJlC4Mfo3MjRvv4OB3VaVitQkmZ0sm
 Vj5qdH32E3knjUWlq284jI5eHOOU/JMGERQq1CkeNkWW2fCFNdP5ToMRMsZe3U3OPPZT
 Pzh9dLB+XsgP+Y2/1DiRwvLRKParEnHuWRQrrP3/NqDQDxIY58I98ODtVmoomTOsGXfh
 SZoA==
X-Gm-Message-State: AJIora/uU/EwcwtymyDI486H9n0DUx1LPeibmBg+M3MPgGgL7f4i+BhK
 u/d1p/+emmcfF69LrDmxp4qKbg==
X-Google-Smtp-Source: AGRyM1v7Lf7iL11gGJO9hWjwiKs8CTU3aUv0bV2QJaVFm7d1+ScfU6J92dpugvqkuIkvs8Ulyrpi+Q==
X-Received: by 2002:a2e:b052:0:b0:255:9565:c6fa with SMTP id
 d18-20020a2eb052000000b002559565c6famr5526581ljl.529.1655488540496; 
 Fri, 17 Jun 2022 10:55:40 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 u19-20020a05651220d300b0047968606114sm712747lfr.111.2022.06.17.10.55.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jun 2022 10:55:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Fri, 17 Jun 2022 20:55:36 +0300
Message-Id: <20220617175538.1080351-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220617175538.1080351-1-dmitry.baryshkov@linaro.org>
References: <20220617175538.1080351-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 1/3] drm/msm/mdp4: convert to
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

