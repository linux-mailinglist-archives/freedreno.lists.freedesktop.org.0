Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 078E0616BA1
	for <lists+freedreno@lfdr.de>; Wed,  2 Nov 2022 19:07:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23B6510E54B;
	Wed,  2 Nov 2022 18:07:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B76C810E530
 for <freedreno@lists.freedesktop.org>; Wed,  2 Nov 2022 18:07:08 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id b3so4385989lfv.2
 for <freedreno@lists.freedesktop.org>; Wed, 02 Nov 2022 11:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I3be5trhw3wsDg3ozZhQ1oc92P/aiH8PmAIGusb2quw=;
 b=U1V1Ie1snUM8Z8kW5FbPB+Uxui9aHzWBAvoKIzPL5WQtt7r1fbJDtKZfYL0BvXjZAX
 pJXlM3cUhAHFVupb1uRPIy1ukhaIzZwAyJB4gdhhGcw8JI31vp2Na7Z3w8CO8QhTzR9R
 KvUPtk1lO6e50dKm5UdWhcexeNthTu3tdl2sTg0S9cJJb0qQ29mQaq7fEiKOijMTBq78
 AJjAm41uNWULtKqI30GYst1N49ngizQQX8dCwb9yXGsU8VHccitTrRtFDC0ASm442BuI
 o39Z887V1sbVS7fCnHaPRg7YhrxZEF1JL7e/zjTrWzvEQM+tv70DuSnESXnFQKx4s7ga
 TX3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I3be5trhw3wsDg3ozZhQ1oc92P/aiH8PmAIGusb2quw=;
 b=XYzPGY7mESJK7WPuNzHcfuFwDozF07p6Lsqo2yus5Oz+ZAfwHjFayMHMDZhgMlKiFQ
 iSb5JJp7QdRGDJtba9DaAKcNsZQaxKDBTk32+6LQNcdRvdk8k4jZap0WDs/cGRDx0FaB
 qKCmd9sWOrAWi4+VMyMChyWCuj6B6Cgic1hLMMmI3m2mWD5zuHNNm1Unlcnm9Vy2ZHBm
 JKmRhX0btiB007HQ0afAJeKITxJqff0cCgMWu9GDToiyU6UPlknLRciZ3Usn/7FVd5rp
 r+nJMqSLO1lMczo5mqDqWnXDZDgBuJjUDkHx1FzTSvFLP/w8s4fdDC9QShR3C18PP5m/
 Lvvg==
X-Gm-Message-State: ACrzQf0VLPHgkC0V+8Qk1C27//pKnVP+j5fZ8s3w9xrQQImDFPbd+7Ag
 lK/nL5AuZ4GJ7/7NEKqmo8gHEA==
X-Google-Smtp-Source: AMsMyM73Sw3dwb1cK+9rqJCeye4EQEf8Qh00yXAocdLw3KYHslx7r/wcJUC94neRnIpmMp6sND42Rg==
X-Received: by 2002:a05:6512:3085:b0:4a2:7d80:d4b4 with SMTP id
 z5-20020a056512308500b004a27d80d4b4mr10523057lfd.534.1667412426862; 
 Wed, 02 Nov 2022 11:07:06 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 r15-20020ac24d0f000000b00485caa0f5dfsm2085232lfi.44.2022.11.02.11.07.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 11:07:06 -0700 (PDT)
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
Date: Wed,  2 Nov 2022 21:06:59 +0300
Message-Id: <20221102180705.459294-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221102180705.459294-1-dmitry.baryshkov@linaro.org>
References: <20221102180705.459294-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 1/7] drm/poll-helper: merge
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

