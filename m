Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A29F856D0D4
	for <lists+freedreno@lfdr.de>; Sun, 10 Jul 2022 20:45:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D657518A8E7;
	Sun, 10 Jul 2022 18:45:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 414F718A8E6
 for <freedreno@lists.freedesktop.org>; Sun, 10 Jul 2022 18:45:44 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id q7so3935779lji.12
 for <freedreno@lists.freedesktop.org>; Sun, 10 Jul 2022 11:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wVSMnS8t45CZD8juYdlJJPJTb5XNiXWgo6MEV6vD4LI=;
 b=gYLBv2KXlYas4icGyDhTOyDps6lgVFSE1iGw867dEXwyTI07bPLSqt0NARMcx8izZP
 tggJh1oQYqPUCt1znBDXxnKF3VRB8BVCEiSk7JeRhoiDxvukbn1ok30/arV6K3fqUEv2
 WPZID05nhykAs08D0G9eXZgbr1bJUEzkYjOfnpys6AZSxWWKfeBZOT1Fsrz35W6nKIej
 muVA8bdxdbSYhYLrq8NMht5kvZGvaTg0Rb+5L6Jf12xeibYCfoiS+Hep0w6KcqDxPSFy
 q0QgWRkfkZCnBD24XwYul4yODoY3/r1Uqbn/pcT58PF0vHEd0Pay5yr2IPAI3HsGDuM9
 FLNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wVSMnS8t45CZD8juYdlJJPJTb5XNiXWgo6MEV6vD4LI=;
 b=Fuch7IitSU09xRzuYTANLqsauXK9s7MWOi0od8Bnm/PfRxRPH+VYcsgWCZtVlD/gOa
 AKF6QupwNJmCemlRxpcGDUi/nlwy+gsWU1kAq/QGGFHvPIWiw3b81LZh1IP4IzgFGayf
 U9xnMomqd7PFswwjEJuFWGrsYHkgfPJwFLLCH+LdrDbx0rluKr7g+IF1zB9xxpQ1qkys
 DRA1jk2cnvQS/67gafS7R6YIvBUoIK1XtTg5DBBNO9ahbgKDkucufYNAE8mlvSs+I11p
 L0DMtpECV82UjWX8TxKIw/BnCivd8YsK2pQ8us+AdvGbn8Icxg+FTlKDVA8VtVjdfm6d
 R9GQ==
X-Gm-Message-State: AJIora9MUMKzY9IieyU5cQuECMwXJkq9MiRGx4qnZnqxf5zQrLWebyjY
 es3fowidXhX5yJydBM2P5Fn0zw==
X-Google-Smtp-Source: AGRyM1tV4KZxmsBcDzaDEkhgLgkD2idVTnQsNeakd0mWVCD3tClU5A2YAoyDh0V+PEo8fOZPZ5K76w==
X-Received: by 2002:a2e:a989:0:b0:25d:5d7c:f3e7 with SMTP id
 x9-20020a2ea989000000b0025d5d7cf3e7mr5811903ljq.392.1657478742554; 
 Sun, 10 Jul 2022 11:45:42 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 c21-20020a056512325500b0047255d21132sm1051562lfr.97.2022.07.10.11.45.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jul 2022 11:45:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Stephen Boyd <swboyd@chromium.org>
Date: Sun, 10 Jul 2022 21:45:36 +0300
Message-Id: <20220710184536.172705-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220710184536.172705-1-dmitry.baryshkov@linaro.org>
References: <20220710184536.172705-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PATCH 3/3] drm/bridge: ti-sn65dsi86: support
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Now as the driver does not depend on pdata->connector, add support for
attaching the bridge with DRM_BRIDGE_ATTACH_NO_CONNECTOR.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index df08207d6223..9bca4615f71b 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -698,11 +698,6 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
 	int ret;
 
-	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
-		DRM_ERROR("Fix bridge driver to make connector optional!");
-		return -EINVAL;
-	}
-
 	pdata->aux.drm_dev = bridge->dev;
 	ret = drm_dp_aux_register(&pdata->aux);
 	if (ret < 0) {
@@ -710,15 +705,15 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 		return ret;
 	}
 
-	/* We never want the next bridge to *also* create a connector: */
-	flags |= DRM_BRIDGE_ATTACH_NO_CONNECTOR;
-
-	/* Attach the next bridge */
+	/* Attach the next bridge, We never want the next bridge to *also* create a connector. */
 	ret = drm_bridge_attach(bridge->encoder, pdata->next_bridge,
-				&pdata->bridge, flags);
+				&pdata->bridge, flags | DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret < 0)
 		goto err_initted_aux;
 
+	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
+		return 0;
+
 	pdata->connector = drm_bridge_connector_init(pdata->bridge.dev,
 						     pdata->bridge.encoder);
 	if (IS_ERR(pdata->connector)) {
-- 
2.35.1

