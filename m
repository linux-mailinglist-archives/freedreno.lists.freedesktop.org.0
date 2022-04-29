Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B04515413
	for <lists+freedreno@lfdr.de>; Fri, 29 Apr 2022 20:52:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AAA710F9A7;
	Fri, 29 Apr 2022 18:52:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB4EE10F115
 for <freedreno@lists.freedesktop.org>; Fri, 29 Apr 2022 18:52:06 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id p12so15607800lfs.5
 for <freedreno@lists.freedesktop.org>; Fri, 29 Apr 2022 11:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hjSZhFhF/WBNlx59PX4NcX4slNS4MZfzeRNT5ytZejs=;
 b=k7YLfZxbvtM5355pTD0NC0W3r4ppNFyePl/eewijAPJmmPuRZOuf01TBxYpR4jnWx3
 o2I7fMHX55U5QFrUI5pAtWxayXrJwzIq0eM5rj8COJ3eN4ijcxrW90QD33kJpDS48V7a
 K2R7RBXdGjG281Y6ScUOryRfql9Z86/0OISsB8lxF44gU10f3CapzB+FRCIcODZE/tg0
 4uve+Q+kV5xReWjP+2miP9fTdYh0/Wwcf/or5NFbfZqo8OJumuXlYlXbCegGluZkwaAj
 +IchpppaHq9FhQ8LuTy6T80SMqJNME9hcJVTl6r9F4W72EuFdPPGCdPpXqHCR2/LOC26
 YY7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hjSZhFhF/WBNlx59PX4NcX4slNS4MZfzeRNT5ytZejs=;
 b=QPKE/X26WVNJ2lwu8hb79LDt0EKM93gT3qsqSZsVTGP+YOzEckvpaUcLmM9aITWju3
 eRxi1MPas1jXYyLzqs4lHCqvIFt8iZmnnl2+KXY+2K+t3Sn3Fu7avlsLeZUg6eYgVnya
 9FBNtu8//vn5867qy+/T/ZtpY3F/GBnD80t5Kr3Fzh2MHhuRR1Rezgmr8ZD5FZbAUy9o
 7YkQ19g29avz9D+flpbmDKUxQ9UVkQNbm2abJYB8rkPrKP3rGwbwPdgmMIt2M8EBEw/h
 YcwWb8YBIVxg/D26cn2aV3nMbXKt3mPfFodwtF584yjUifwA4zlpnfOmFZ53pEoMR9S+
 JRhA==
X-Gm-Message-State: AOAM531Lplt7g57/vN0Zp6O6N+JdGPPA1TXBsVvOMwhbTq0CWiJPL6by
 fTCTdDl0xZWbGw96esBPCKhE1Q==
X-Google-Smtp-Source: ABdhPJzzf2Gqpio3FiOmbjIAFCoKFglhxH/wJqpGfDRxpm4zP2G1J1gbWPGUhYrluI3eZC4OE/CZ4A==
X-Received: by 2002:a05:6512:3b2a:b0:472:2c74:2b48 with SMTP id
 f42-20020a0565123b2a00b004722c742b48mr420328lfv.277.1651258325147; 
 Fri, 29 Apr 2022 11:52:05 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 z25-20020a19e219000000b00472230888a5sm295313lfg.121.2022.04.29.11.52.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 11:52:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
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
Date: Fri, 29 Apr 2022 21:51:55 +0300
Message-Id: <20220429185157.3673633-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429185157.3673633-1-dmitry.baryshkov@linaro.org>
References: <20220429185157.3673633-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v1 5/7] drm/msm/hdmi: stop using
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
index cf24e68864ba..da889175dd86 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -317,8 +317,6 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 		goto fail;
 	}
 
-	drm_bridge_connector_enable_hpd(hdmi->connector);
-
 	ret = msm_hdmi_hpd_enable(hdmi->bridge);
 	if (ret < 0) {
 		DRM_DEV_ERROR(&hdmi->pdev->dev, "failed to enable HPD: %d\n", ret);
-- 
2.35.1

