Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F012151E8D0
	for <lists+freedreno@lfdr.de>; Sat,  7 May 2022 19:09:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EEBF10E084;
	Sat,  7 May 2022 17:09:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1584610EB65
 for <freedreno@lists.freedesktop.org>; Sat,  7 May 2022 17:09:26 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id j4so17286999lfh.8
 for <freedreno@lists.freedesktop.org>; Sat, 07 May 2022 10:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Fl5gRxPQwePsJhPtYdJYGhgQW5l6J6j4kwqCPdVck7I=;
 b=tQmFPaqB9Wjl+V8ASR5ujTk90TnQRMRKrZJq1wWao21lnAonDnDH1sLiiieAHNWwKr
 dfkPAQ8VipHgdgvwmiwuSd2PLt87xxgsdRpeScDn3PJTiJWXAcQm4Ekd3cViOg/E0WxI
 199FgXNZ1y+ugyHXORtg+jpnXpjgk38ykc0YGvCEChtHM/VKKzi7NoQOPKKAANfye4wi
 TzpqyTx006ncWPnEFz2r/c/xvaAdURw3EVo/ngT0GkMVgB+5SJRZg993W/iHvEW8TphC
 ODYzN4Jwail+j7CLKodJUl8WTwon9I3Zclqk1yPMBRrjdxnM0/bfScW+H081OwPNc81M
 FQ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Fl5gRxPQwePsJhPtYdJYGhgQW5l6J6j4kwqCPdVck7I=;
 b=w/0yqIODNo551s26UvB7gRVmlrtca08vDFQwKicsFYqHVjl2r+k8nCQ6XTOClI7tUX
 b0NdPaDc24jjImkJKEUnjpzwmISfy1CXMj/ytiMMNhvT1CWbD1S9a+8/L/WrzHjkrCqP
 bq3C5mGzveJXqxHOxuJ/ZJVPfFs86gzto8Nul3DM1in4kUC739mU05JC1JuJ7kPE7dl3
 VhsSLxC8BZYOmWeN5whkccXW5TCI/hiSjZxH1Rr/GkVa++QbZ433SkAqAhoAqqmkh3u6
 vlbkbAzKrzvoJAwlAO7Lxc1Gyzj58Uy682O6X75EtMOGrYUagK/BXhv3hQZF+jjCiyAs
 zfaQ==
X-Gm-Message-State: AOAM532kH60f9yLUHYCIH8a0dpb8GkiPkPo5jET5Yhqs7m4xnrPlnKUH
 fiBCAU8hf5juO9+gYR93BFqH71k8QD3kww==
X-Google-Smtp-Source: ABdhPJxwRZ4sDrgrxB/oQOREsq+0eXzVLyq7Pkp+V1PlVr7UQIfmJVUYFBzgKY9UsfJ90edg5I75mw==
X-Received: by 2002:a05:6512:b0e:b0:44a:a5a0:f60e with SMTP id
 w14-20020a0565120b0e00b0044aa5a0f60emr6790155lfu.669.1651943364389; 
 Sat, 07 May 2022 10:09:24 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 n14-20020a05651203ee00b0047255d211f9sm1175308lfq.296.2022.05.07.10.09.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 May 2022 10:09:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Sat,  7 May 2022 20:09:21 +0300
Message-Id: <20220507170922.1723712-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220507170922.1723712-1-dmitry.baryshkov@linaro.org>
References: <20220507170922.1723712-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 2/3] drm/msm/mdp5: convert to
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

