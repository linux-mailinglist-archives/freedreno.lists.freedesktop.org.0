Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5343C6613F8
	for <lists+freedreno@lfdr.de>; Sun,  8 Jan 2023 08:26:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9090F10E230;
	Sun,  8 Jan 2023 07:26:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B9B110E210
 for <freedreno@lists.freedesktop.org>; Sun,  8 Jan 2023 07:26:04 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id v25so8285040lfe.12
 for <freedreno@lists.freedesktop.org>; Sat, 07 Jan 2023 23:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NH1d+1PPDWydMKrpXiB7N/7rHowCambw1HmOt4U8TEY=;
 b=VfwqtMMDAfRn7LqdtYSJApFBiUJnlFbNNg3dF7aEso+h1YB5GIyqsqujQmCFwF8cEu
 qH8vT3scgvyTqx4YQ37VJG6D5FOHV48nzvDs5jL9xkRts7ipGT0/wBH/pauJ7/yKIfki
 mgo/QTI/gqw58ufY7/va8b24Om9u/kEf+VHXEQLydL1kBJp/i90nLDc1h6MXJ1Qaepsb
 tge7oYulqW/2FtEUAR9pnQDjL/acXfK7e56k6BAy3B7DMw/9xZUh1SwxwakQqFcX55ER
 t8btmvsBNMRRL0z3B46ogElQDMH22mJ6ozzMlYd86z8zWSxr7QRNGyxqONYTTRAN/DJj
 B/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NH1d+1PPDWydMKrpXiB7N/7rHowCambw1HmOt4U8TEY=;
 b=DYkpGA4ZgIUqMHQxyNA2mRkGGScpEQLeH02QiTmz4RELbQBozbtC9j4+JzP4JTlnVq
 DHhEtzWLuwsTw7mBcYiMS9rbmRQowrLm9zRNRkEQWZ4syjNpuEMwJE4QlIr7Scrf2Yu7
 240ojHzxDKFYdL8kvL5qwhjTG2he59oh+kGWK/zijDvb+qXspBx3k4Hl/DtSRdye/GVS
 RJVQA0lKxdOVIUEBs4xGgdzamJzjftN6JqOMexxq210Q/eBDIRoWwhj2SbD7PrleulTU
 AkgLP9dZsojDJhR0tthXoiV4lpAqHnb2sqw4a9WBvV+fx0luMo9gWhi47hkLfmBVRDB9
 1bsg==
X-Gm-Message-State: AFqh2ko/2SC0+Ssd4PU6mViSwF8mNWpvxZ0SfGe9mroI1a+TfALDe24Y
 7HkjRbj2CfDvMpvIBmWYqfExkA==
X-Google-Smtp-Source: AMrXdXuXZvyZtIfEcBr9mW1E0wstqllmuddtyiLu4Po+vRQcwZsqoJWtHCHlG8GFKNIb3E9C3SXENA==
X-Received: by 2002:ac2:5d4e:0:b0:4b3:f50c:69a8 with SMTP id
 w14-20020ac25d4e000000b004b3f50c69a8mr17776995lfd.47.1673162762755; 
 Sat, 07 Jan 2023 23:26:02 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 x2-20020a056512130200b004a8f824466bsm927414lfu.188.2023.01.07.23.26.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 23:26:02 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Date: Sun,  8 Jan 2023 09:25:52 +0200
Message-Id: <20230108072555.2905260-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230108072555.2905260-1-dmitry.baryshkov@linaro.org>
References: <20230108072555.2905260-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 09/12] drm/bridge: lt9611: fix sync polarity for
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

