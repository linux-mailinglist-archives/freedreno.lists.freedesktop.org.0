Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A4F616BA3
	for <lists+freedreno@lfdr.de>; Wed,  2 Nov 2022 19:07:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22E6B10E54A;
	Wed,  2 Nov 2022 18:07:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 902B310E51A
 for <freedreno@lists.freedesktop.org>; Wed,  2 Nov 2022 18:07:10 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id b3so4386256lfv.2
 for <freedreno@lists.freedesktop.org>; Wed, 02 Nov 2022 11:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jshUQGH4UtEAs7tQmmFEpIMJkGozvqVnz1M3FYmS5xY=;
 b=Z8ogY1BJAIZ4+jO969Bq/HqGLXfZ/qg7CSEPRxvkwtsP87akwunEvyOSrm8L+2yemH
 lNdPn9rkx15SNRnA0f2F/9U+hUoAKzSyUrmSjn2nI6ZAT72r8KnN/j03CKH8N8l2SZNP
 Jvec9DTHGEYzMnrvU8zuSD95wSEitdcT21OtZ+j0Lj+rt2BILRWlELLl5mxeGTTlrAVF
 XASkeYu4M/xCyVkCNcx3WW73hiYCe2QgPKbu9+mdtcRRIZDrwXGhWRWTMC0ja61V/j0i
 V5jVrOPCaX7wKOwdgfjfSm23hZJMkMFGrFraKemBTmdmNJaxYEPY3LBjyFEVqoJhxRFA
 draw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jshUQGH4UtEAs7tQmmFEpIMJkGozvqVnz1M3FYmS5xY=;
 b=nWSjNvMz0w34GBnQomqSqNFH7HlsX5djo+/n8HwZ0NfNm8KYxm8Ppaa4GVnbm1REF9
 HUKlShmpLZ141LKoPc7WmitBSASD61E8KH4HbbjlqXftpCpv7T+63O6l2vCSDK1Hc1wG
 QdNDS+homYg5DDqVCqFp04BxFgLThQ4Uaj5UOE0ewd/fP8JEZ1Sa3WQPn1px5UBcAofg
 ZHVtHhkMxO+eRrja1eWtTcJ/d9Dii9mK3+0M4K+Ln+7GjhEEhnz/8YFIw+n/w+PHRoeU
 1bxts6XNKWkbiNFUIlRib11f/WG3dlkmj0Q4APHyH4dejjAbjil5lnUsroV53jVWEHRa
 xp5Q==
X-Gm-Message-State: ACrzQf1/2ir8MANtQkM6FCQccFvwQ8CG72/64qnYedC7KNWXme1YcM4T
 e5o2JwVvB9tNDzgNOy6lk3jbAQ==
X-Google-Smtp-Source: AMsMyM6OCSRVaMGSi8KIwIUfDuj88MqMcv8eYzHtBW28QWceUSqNJcenRHrHsMPUtNRwVRLuuQtxnQ==
X-Received: by 2002:a19:5e4e:0:b0:4b0:1305:7cb8 with SMTP id
 z14-20020a195e4e000000b004b013057cb8mr10702352lfi.290.1667412430002; 
 Wed, 02 Nov 2022 11:07:10 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 r15-20020ac24d0f000000b00485caa0f5dfsm2085232lfi.44.2022.11.02.11.07.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 11:07:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Tomi Valkeinen <tomba@kernel.org>
Date: Wed,  2 Nov 2022 21:07:03 +0300
Message-Id: <20221102180705.459294-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221102180705.459294-1-dmitry.baryshkov@linaro.org>
References: <20221102180705.459294-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 5/7] drm/msm/hdmi: stop using
 drm_bridge_connector_en/disable_hpd()
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The functionality of drm_bridge_connector_enable_hpd() and
drm_bridge_connector_disable_hpd() is provided automatically by the
drm_kms_poll helpers. Stop calling these functions manually.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 93fe61b86967..a540c45d4fd3 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -348,8 +348,6 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 		goto fail;
 	}
 
-	drm_bridge_connector_enable_hpd(hdmi->connector);
-
 	ret = msm_hdmi_hpd_enable(hdmi->bridge);
 	if (ret < 0) {
 		DRM_DEV_ERROR(&hdmi->pdev->dev, "failed to enable HPD: %d\n", ret);
-- 
2.35.1

