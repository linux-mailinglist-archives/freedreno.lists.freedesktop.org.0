Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2707B930E0E
	for <lists+freedreno@lfdr.de>; Mon, 15 Jul 2024 08:33:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCA5610E285;
	Mon, 15 Jul 2024 06:33:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kzdOzgcM";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D56910E27A
 for <freedreno@lists.freedesktop.org>; Mon, 15 Jul 2024 06:33:19 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-52e9a920e73so4389190e87.2
 for <freedreno@lists.freedesktop.org>; Sun, 14 Jul 2024 23:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721025197; x=1721629997; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hbJUOmvW24quAtGM4HEWCKTnos6XbtfhPM+nK5+e2Tw=;
 b=kzdOzgcMq75DYvsM98KkVZhxsQT88JBJfY/xn8CixjcYMUUWiUpOy1+wdJa+K5ycUn
 gIXVPxdBxBlMTve+WNghfYC4sg21dMjnCnEDgySV8CqvrQkHRPAuDFjakxBLC7ThnyhW
 T/Rc+3kGxrUpE2izmTEcaFgtKsLzF1YJI/nV/iJ92vHvd1LJDN0AHDVcxs1g8ps6r7IS
 EWcvofBtXNoppPllHRKLONHsehsa5fu9xiODPgpyyvAfdr3SL3LshPnhj/JUsVw+dXog
 eKHdTKpiutO9+Rn1DDE2RDcKBpYN+J6tT08KReziMG+Xw70BQBkwMTEpgFERhiSFhPse
 OPbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721025197; x=1721629997;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hbJUOmvW24quAtGM4HEWCKTnos6XbtfhPM+nK5+e2Tw=;
 b=eUdiNNoRt/y2QEo7gak19q4KXjmIs9mws5UIqWiWD7W24eMgC4HR+/f8E9OjkGoEeA
 tZmQj44m5pBP4P5D0YmEUrjkifOVnDzkExpV9iw0whrVneoV/NG8uAR3gVvfJntqIDBl
 rlapU3XHzC1a6cnIqjrAEgFLIzm7DOxr1k9TA6C/McZCjU4XrOdGwSdZExD23u/wH/o5
 5ZNNo1y71HkO29oG3BblTdZhn2pVtQ21Ve5K9z8kODy5MpvRuevJA5AaIjhRtIuaD6s7
 mgCKrZaXoZ64HCF7sGlizehM6DGzFHGSv85C3EhT0qM7B7ZeQHTnrUYy8gBg/P9RtHZP
 BYqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9EWGIB0c4FWOK3t3JGxoTEsV2s19rn6t/I3eXUDrgG1YkCny1f6+eFW671ZXLNrrEgr+BUymHQ146gA+u5dSOsWq/kFCq6p1I3SvGmz4s
X-Gm-Message-State: AOJu0Yx+kKFjt02BiVuBYbt9t5RRm8CV5s5slhuAQ1fsSSyVyfVsAM7S
 1FS61c5COW0uvduzuy4GqapeyM/5EtsVfd55h3htvm2YURcArE5Fo0mT8E0ADx0=
X-Google-Smtp-Source: AGHT+IF+V86J6/2ZIQK/CmixClQVdJF7hjnWLmCjjdRBB6FFYX5j0s7A+kP4jnSIFrfgBCt8vnJuQA==
X-Received: by 2002:a19:f706:0:b0:52c:c9d3:a30c with SMTP id
 2adb3069b0e04-52eb99a0639mr9397218e87.29.1721025197267; 
 Sun, 14 Jul 2024 23:33:17 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ed24e188esm743543e87.47.2024.07.14.23.33.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jul 2024 23:33:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 15 Jul 2024 09:33:03 +0300
Subject: [PATCH v4 3/5] drm/connector: automatically set immutable flag for
 max_bpc property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240715-drm-bridge-connector-fix-hdmi-reset-v4-3-61e6417cfd99@linaro.org>
References: <20240715-drm-bridge-connector-fix-hdmi-reset-v4-0-61e6417cfd99@linaro.org>
In-Reply-To: <20240715-drm-bridge-connector-fix-hdmi-reset-v4-0-61e6417cfd99@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
 Edmund Dea <edmund.j.dea@intel.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 dri-devel@lists.freedesktop.org, igt-dev@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1164;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Ogj1qgSBFy5LiaMGrph8HSRVcootU6FeEO747BTFj9E=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9qUQysu/J/Xl5n/9o/EfmHLmdY1x3fJXa8q/t5631Izp
 6VP4f30TkZjFgZGLgZZMUUWn4KWqTGbksM+7JhaDzOIlQlkCgMXpwBMRPg8B8NKPS4j53+nGRhP
 VBcpNN70edCVY/lnJcPcZSbfTc/NZDjqy6J4IKKOJ5lRyqf+pLljwNWcn8dbq5ta/jC3fL5Surt
 8VnHwiZ8ube0uSdOfHZtUofj4yj2FJZ909eR959nxx9g9rdtcmORwy69fzvGuf/mlJ9ITLxRdKU
 /VyNt9e8HWnyJSNaJvsvvjVOZ/8xJcrea+Le6pdpiL04no7ZG5l+apXb1wf90jpyWPt1z035Z38
 UmCspiUQ5HjJzXNXLbKp8oVKQ0yzQwbTWba5eanp9nPFBKUKtof79uV/nmO00QFK+krh9kFBW1Z
 lM+2PipLcPhrUlgXZKBucDBt5ZLW8y+WpX08IzaNs3cFAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

With the introduction of the HDMI Connector framework the driver might
end up creating the max_bpc property with min = max = 8. IGT insists
that such properties carry the 'immutable' flag. Automatically set the
flag if the driver asks for the max_bpc property with min == max.

Fixes: aadb3e16b8f3 ("drm/connector: hdmi: Add output BPC to the connector state")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_connector.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index ab6ab7ff7ea8..33847fd63628 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2610,7 +2610,12 @@ int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
 
 	prop = connector->max_bpc_property;
 	if (!prop) {
-		prop = drm_property_create_range(dev, 0, "max bpc", min, max);
+		u32 flags = 0;
+
+		if (min == max)
+			flags |= DRM_MODE_PROP_IMMUTABLE;
+
+		prop = drm_property_create_range(dev, flags, "max bpc", min, max);
 		if (!prop)
 			return -ENOMEM;
 

-- 
2.39.2

