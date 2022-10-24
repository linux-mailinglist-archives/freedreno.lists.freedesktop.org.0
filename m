Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A1C60AF37
	for <lists+freedreno@lfdr.de>; Mon, 24 Oct 2022 17:39:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAFB410E897;
	Mon, 24 Oct 2022 15:39:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE82610E87E
 for <freedreno@lists.freedesktop.org>; Mon, 24 Oct 2022 15:39:30 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id d3so6826634ljl.1
 for <freedreno@lists.freedesktop.org>; Mon, 24 Oct 2022 08:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I3be5trhw3wsDg3ozZhQ1oc92P/aiH8PmAIGusb2quw=;
 b=YSyy0MzpgrvBvNqYkcjjjMujeQNgz2w0aplR2UtgE45kTtD5Tpn5OHIRnV3nLiNAUc
 lvYZRcE54vsOSTS3gXSM4HFBQ3my8Guc1axsWht9KNuaKWxiCl0w7Mr9UezQr3CI/Ew4
 jOVO0asv1ZiPCgBR1lciM3e8wOAKipPUnpl/lcMmLzCnHJdfpdCk5gvpKC1jlH47f8HB
 q8QT3t3Mavn3gmwYJ9gzH+y1Pz6HjtyKcEnFvmMTPFpUizIBIJnHA8w/9+PTjrhI6Gik
 /k9NMsgvBFfFq+4AX1caF8UNru0qPubzJPzqIdV5Kk1mnBRAttYgpz8FmoLxUxFs8vjS
 g5WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I3be5trhw3wsDg3ozZhQ1oc92P/aiH8PmAIGusb2quw=;
 b=p6uHFbVus7hICLGPKAFGPzQRYD/BSqb9JOVGZXfZgn883rGP8Nai+cotnp4wDC/zCg
 /lpFNDX1OmYkGh6ulv+T74j10yhsYA2KXRxevdi/PZyyuz7aeubMkFecqwdNLYPacIyx
 UL+XAzg8VPoHTX5WYx5FiwaIJeSg2/mVZmhRAQs+guWwFJbEgSFwwTEXTX0b5oN7KQpW
 +VdQWHYXa7dRagTjjLmf8vgkTzbSaT+xCWsJFvulDLSM98VcW+xhNNC2Dw4rCnuOnCgU
 S8MvASqxMmHk3N5ryT7R1Gv9J/014emhyvEUDFmefEM8YmjIdEezQpnfGGBAZAEORsyW
 bdrg==
X-Gm-Message-State: ACrzQf2wLdcCRjpfUKAgQXMTD63HN3x0QamDOSBnMbuEJoVHtUmTKiDe
 J6YHk9KcCnonZFmLy0/J0Vcbfg==
X-Google-Smtp-Source: AMsMyM6oJ0SFF+Zwbo4Q7rqEzTwB8GtqAaRQSOc0HeMjfEBGYSBo6Ghd+iIxJhdZF4gHbWg69CLGnw==
X-Received: by 2002:a2e:9a81:0:b0:26c:5b63:7a83 with SMTP id
 p1-20020a2e9a81000000b0026c5b637a83mr13313560lji.291.1666625968692; 
 Mon, 24 Oct 2022 08:39:28 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 f23-20020a19ae17000000b00497b198987bsm452181lfc.26.2022.10.24.08.39.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 08:39:28 -0700 (PDT)
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
Date: Mon, 24 Oct 2022 18:39:20 +0300
Message-Id: <20221024153926.3222225-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221024153926.3222225-1-dmitry.baryshkov@linaro.org>
References: <20221024153926.3222225-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 1/7] drm/poll-helper: merge
 drm_kms_helper_poll_disable() and _fini()
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

Merge drm_kms_helper_poll_disable() and drm_kms_helper_poll_fini() code
into a common helper function.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_probe_helper.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 69b0b2b9cc1c..f97fda3b1d34 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -803,6 +803,17 @@ bool drm_kms_helper_is_poll_worker(void)
 }
 EXPORT_SYMBOL(drm_kms_helper_is_poll_worker);
 
+static void drm_kms_helper_poll_disable_fini(struct drm_device *dev, bool fini)
+{
+	if (!dev->mode_config.poll_enabled)
+		return;
+
+	if (fini)
+		dev->mode_config.poll_enabled = false;
+
+	cancel_delayed_work_sync(&dev->mode_config.output_poll_work);
+}
+
 /**
  * drm_kms_helper_poll_disable - disable output polling
  * @dev: drm_device
@@ -819,9 +830,7 @@ EXPORT_SYMBOL(drm_kms_helper_is_poll_worker);
  */
 void drm_kms_helper_poll_disable(struct drm_device *dev)
 {
-	if (!dev->mode_config.poll_enabled)
-		return;
-	cancel_delayed_work_sync(&dev->mode_config.output_poll_work);
+	drm_kms_helper_poll_disable_fini(dev, false);
 }
 EXPORT_SYMBOL(drm_kms_helper_poll_disable);
 
@@ -859,11 +868,7 @@ EXPORT_SYMBOL(drm_kms_helper_poll_init);
  */
 void drm_kms_helper_poll_fini(struct drm_device *dev)
 {
-	if (!dev->mode_config.poll_enabled)
-		return;
-
-	dev->mode_config.poll_enabled = false;
-	cancel_delayed_work_sync(&dev->mode_config.output_poll_work);
+	drm_kms_helper_poll_disable_fini(dev, true);
 }
 EXPORT_SYMBOL(drm_kms_helper_poll_fini);
 
-- 
2.35.1

