Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C947CB06D
	for <lists+freedreno@lfdr.de>; Mon, 16 Oct 2023 18:54:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEB0110E241;
	Mon, 16 Oct 2023 16:54:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08E6710E241
 for <freedreno@lists.freedesktop.org>; Mon, 16 Oct 2023 16:54:16 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3296b49c546so3911220f8f.3
 for <freedreno@lists.freedesktop.org>; Mon, 16 Oct 2023 09:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697475254; x=1698080054; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zpGIiUMbok8vBwc13/k0XLEAhZoDX5uqz8AGagQ5Hmc=;
 b=FQpCRHhRejM4ScISfCgNNj5bKI5RPnUTjce0lxTg7CQmsG6QGUOWQot52Zz6FkoHO/
 RYPsANQ7NsAJFVWTRasfcsKnL+zBvPZO3/q2bAeLsgdDvy7cZCUu7zjKoz/rjPPfcpeR
 vOdBMNh0q+e9CFqZ+VQYzizVevhFDIrO6Q3AZI59iDK1LFODvS7BrlRFgMAJ0T8Il5v/
 YvmQnMvYFKsTthJJdY1txE/pqaayRfjzuar+R4tquGQsD272aq4bljOBfOv2MT2vxeHZ
 t7XHCOp0N0XplqlS2oITpZG/LzZGjymn8myMhcDGl9gXD0hDh6Lnrb92NXIbpVxqFpOY
 9NVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697475254; x=1698080054;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zpGIiUMbok8vBwc13/k0XLEAhZoDX5uqz8AGagQ5Hmc=;
 b=kz0T3XHmDGLM6n3kl16ZyuyReRSK0ymff1jfwrie/l2PsuvrqL96Vox1lqTZt7v3Qt
 Csove1A9eHL5RnsYJ344KDUdU+HkfJH9N+NwEKw/W+3w3axRWulquTXbrY7gcPVrBRIe
 7Ayti5WzDT2knSx/Ip3EHO4vSHyoie0Vmlh2prcmO+dQGdRAgZ9WplIQ3HFrP7DA1O5W
 5FfahqSm7n6sVc8gbUImkpN0I1yblsJbrLoifMxCI+tOKY/jfvfnmJ8SVzTDKYqY61Iw
 yf50efen0hVF0Y19fV0M61rgVMpnrxxDt7rGVocXe/ICUDv6JfdZksziytQqVpol6N/e
 C/Jg==
X-Gm-Message-State: AOJu0YxwOlV9ewnDceTTvEq2h+wHG+G5Pylqi9iQdngOxNAzHiR+J8SO
 6T3Aw42cXcVFkK+6TyJTbLJLyg==
X-Google-Smtp-Source: AGHT+IGv6IJmbuk/e/mZEXSBzwHspez+g7aAQkIvi456hEyHQKQI7pI4oTBdD/5E0EVsTbEEtp3zKw==
X-Received: by 2002:a05:6000:80a:b0:32d:857c:d51c with SMTP id
 bt10-20020a056000080a00b0032d857cd51cmr16399678wrb.43.1697475254257; 
 Mon, 16 Oct 2023 09:54:14 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([45.84.211.189])
 by smtp.gmail.com with ESMTPSA id
 s19-20020a05600c45d300b0040648217f4fsm7638996wmo.39.2023.10.16.09.54.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Oct 2023 09:54:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Douglas Anderson <dianders@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Mon, 16 Oct 2023 19:53:54 +0300
Message-ID: <20231016165355.1327217-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231016165355.1327217-1-dmitry.baryshkov@linaro.org>
References: <20231016165355.1327217-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PATCH 09/10] drm/bridge: lt9611uxc: implement
 automatic DSI power control
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
Cc: Marek Vasut <marex@denx.de>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The Lontium LT9611UXC driver doesn't need to control DSI power
lines manually. Mark it for automatic power control.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index 7835738a532e..ace7a6ee890b 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -279,7 +279,7 @@ static struct mipi_dsi_device *lt9611uxc_attach_dsi(struct lt9611uxc *lt9611uxc,
 	dsi->lanes = 4;
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
-			  MIPI_DSI_MODE_VIDEO_HSE;
+			  MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_AUTO_POWERUP;
 
 	ret = devm_mipi_dsi_attach(dev, dsi);
 	if (ret < 0) {
-- 
2.42.0

