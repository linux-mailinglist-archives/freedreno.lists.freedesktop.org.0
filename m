Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 033CC6715FB
	for <lists+freedreno@lfdr.de>; Wed, 18 Jan 2023 09:17:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66AB610E6D7;
	Wed, 18 Jan 2023 08:17:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F6B310E6D1
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jan 2023 08:17:10 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id v6so38271707ejg.6
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jan 2023 00:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qsYZ9kXBxRXYjdXYi3EuO6RFywLtz/JTmCkAqTyPm7Y=;
 b=pp94AYLoiIe3LR89Xf3QFr/6KwLzz8Tvs9MfgPUhO/l7EO6698cyrC14LjA0NP4ZVN
 NoNF6lsapl69djMz4p0mQ8vNt1RS9vgJwwYdh/WXqKbyFCWjrL/caBaDn94ygON779bW
 jDGvW7JkSiXh2HOUcvyyuPy5D3RpVBws5uCxohwwZx6C3EXfUdYkb/NpAbtPsCuW2FxP
 od267J+kfKsydgGttf1Ye/uU635s7Jgn7NQvcR4rEnDFjJcpBdy6zMhcIUlBJd13/aBg
 KjFfBYW+MFgCdD6cTgObqvIrc4tv5thcXtbYd9hNiQbvBHA4pkU47SV+u8gZdMNn2g0G
 JAQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qsYZ9kXBxRXYjdXYi3EuO6RFywLtz/JTmCkAqTyPm7Y=;
 b=dd97hltltpUjwuRbFed4ooio9FzKTl4b7YMJQEM0pJg5EB4lGObQ0CKGf5VWuMNQ7Z
 cAS6Vk0YaU9YnySOyeVvCf28+KTyUIQW9RaJcMsyj041X/l0UDkUBUJna9Kz4UBetsJG
 XjAHejBOEUTiEui6EaB4fk5zFXHHcrwq79wyjze81xk9VWn/1FsqWQUhWAuk6Pa7jHSp
 lOIt3UES8fjHA2qC785i/RxSZbM9H/+LHBftu5E/RioMZ9PPQIGh3DAgujUv1xj1uqPt
 x1gsFwy1Z+N1b+0h2XTPxR7yqlXmN7gUXj/4bEROag7B6oVYv5J8V9PQoJvyoVDYD2hp
 mIvg==
X-Gm-Message-State: AFqh2kq3GZSewJMfgNa7tBA7/Ntn2hPGXPMQTH1PnYz3ZxDWX2PYcAXn
 RaPII3odm6wiJihzTIbQmuN18A==
X-Google-Smtp-Source: AMrXdXvO0vgpkZfSv7xRXpy2KH+wUnsYErZHHrJugp/D35qPYzZLO1n2OVSH7ETmfP9hWN7ehqSOJg==
X-Received: by 2002:a17:906:8e0a:b0:7c1:1444:da41 with SMTP id
 rx10-20020a1709068e0a00b007c11444da41mr21736585ejc.40.1674029830067; 
 Wed, 18 Jan 2023 00:17:10 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 f22-20020a17090631d600b00779cde476e4sm14199080ejf.62.2023.01.18.00.17.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 00:17:09 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Date: Wed, 18 Jan 2023 10:16:54 +0200
Message-Id: <20230118081658.2198520-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118081658.2198520-1-dmitry.baryshkov@linaro.org>
References: <20230118081658.2198520-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 09/13] drm/bridge: lt9611: fix sync polarity for
 DVI output
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

Attaching DVI sink to the lt9611 requires different setup. Fix the
register write to make the DVI displays sync onto the correct sync
pulse.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 773d7a56f86f..7f9be74acf0d 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -352,13 +352,16 @@ static int lt9611_video_check(struct lt9611 *lt9611)
 	return temp;
 }
 
-static void lt9611_hdmi_tx_digital(struct lt9611 *lt9611)
+static void lt9611_hdmi_tx_digital(struct lt9611 *lt9611, bool is_hdmi)
 {
 	regmap_write(lt9611->regmap, 0x8443, 0x46 - lt9611->vic);
 	regmap_write(lt9611->regmap, 0x8447, lt9611->vic);
 	regmap_write(lt9611->regmap, 0x843d, 0x0a); /* UD1 infoframe */
 
-	regmap_write(lt9611->regmap, 0x82d6, 0x8c);
+	if (is_hdmi)
+		regmap_write(lt9611->regmap, 0x82d6, 0x8c);
+	else
+		regmap_write(lt9611->regmap, 0x82d6, 0x0c);
 	regmap_write(lt9611->regmap, 0x82d7, 0x04);
 }
 
@@ -719,7 +722,7 @@ lt9611_bridge_atomic_enable(struct drm_bridge *bridge,
 	}
 
 	lt9611_mipi_input_analog(lt9611);
-	lt9611_hdmi_tx_digital(lt9611);
+	lt9611_hdmi_tx_digital(lt9611, connector->display_info.is_hdmi);
 	lt9611_hdmi_tx_phy(lt9611);
 
 	msleep(500);
-- 
2.39.0

