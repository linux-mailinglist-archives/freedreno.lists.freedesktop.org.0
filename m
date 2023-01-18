Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C52EA671600
	for <lists+freedreno@lfdr.de>; Wed, 18 Jan 2023 09:17:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35F0C10E6EA;
	Wed, 18 Jan 2023 08:17:14 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96CB110E6E0
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jan 2023 08:17:12 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id 18so48521579edw.7
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jan 2023 00:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xKWMWBkiBRp89l37RQ64rpz1WLSSDShciYdrNMM6e18=;
 b=sVIqtz7UvlrtqEpDU+pmxvqmwI1/B0wi02UzxO3FJlR8+mQsX9ZLJ7uUjj5KerlDjG
 osQy343Nal1u8S/ISOWrUjsf2Rwz7V1nzhgH0fHmEcotEPZ4CBgmetRVr8Y6V+Hj18Oz
 NpFUX4hx47xkBaE/SPLRiEwkJ4qEnRN0VH+OzNzwJBugSaGHP+XMmS+Rf80HNI1KKGIG
 bcNukvAsM8RVeHUy8ujxFI1KmE24bkXyBVpFkJn05YF+bISIIBajHKoW7yk13gjlG9pH
 wEfR3FT9wSeGL76QpKdJ6407sICTWYDcP0oWVHyiOXpyGMPSLxV7oKUI0ac1Erk+Klrq
 nPOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xKWMWBkiBRp89l37RQ64rpz1WLSSDShciYdrNMM6e18=;
 b=eo41PDSeM0oDBoe8iVWQzooTEMJ3FaHK5Ry0uWRU7RN4T5f60tDbNV3DezitAeWWvN
 j9fVr0zpiKocbyHcuR6zCV6xCEFt8K1Bt/QZmFNJHhzK6cVImpjvlaepsmPv5jak5G9v
 dJOhmMPobzhrqSV5cbmKWpuIIut1sj4wkDt9UZp0ETTlKRGmG52m/b2f2n9nFaELwAbP
 LQObBvwkAOAE/a/LfpbcFIy9wnwkZ0ukjXZTzKiubEaBOIUZ9IPq30hWGqf9XC01Y3xu
 +RrJFJfrhQAsNflv1WOcbFPoJOaLoXNS4yTeEhvr5emfbDOdDwcET9qTbDOWjrvsKFqK
 mC+Q==
X-Gm-Message-State: AFqh2kq9qQt4AeItuPu5ZJJO0Ign1Vakg6SaZvcULvuTLUbQa+d0Zbte
 cLOYA5O1k7KhF8A+2WbI1ogmkA==
X-Google-Smtp-Source: AMrXdXvLHdymmreFDJFQdXc4WZTlX5SHLKz8w75pA9lqpebRUNjm+Gfu1+LHBnrg+EUkwF3JkvPZ5Q==
X-Received: by 2002:a05:6402:2289:b0:498:f82c:7068 with SMTP id
 cw9-20020a056402228900b00498f82c7068mr5001316edb.35.1674029831043; 
 Wed, 18 Jan 2023 00:17:11 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 f22-20020a17090631d600b00779cde476e4sm14199080ejf.62.2023.01.18.00.17.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 00:17:10 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Date: Wed, 18 Jan 2023 10:16:55 +0200
Message-Id: <20230118081658.2198520-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118081658.2198520-1-dmitry.baryshkov@linaro.org>
References: <20230118081658.2198520-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 10/13] drm/bridge: lt9611: simplify video
 timings programming
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Inline calculated values to simplify the calculation in
lt9611_mipi_video_setup().

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 7f9be74acf0d..1396ab081f61 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -155,12 +155,12 @@ static void lt9611_mipi_video_setup(struct lt9611 *lt9611,
 	hactive = mode->hdisplay;
 	hsync_len = mode->hsync_end - mode->hsync_start;
 	hfront_porch = mode->hsync_start - mode->hdisplay;
-	hsync_porch = hsync_len + mode->htotal - mode->hsync_end;
+	hsync_porch = mode->htotal - mode->hsync_start;
 
 	vactive = mode->vdisplay;
 	vsync_len = mode->vsync_end - mode->vsync_start;
 	vfront_porch = mode->vsync_start - mode->vdisplay;
-	vsync_porch = vsync_len + mode->vtotal - mode->vsync_end;
+	vsync_porch = mode->vtotal - mode->vsync_start;
 
 	regmap_write(lt9611->regmap, 0x830d, (u8)(v_total / 256));
 	regmap_write(lt9611->regmap, 0x830e, (u8)(v_total % 256));
-- 
2.39.0

