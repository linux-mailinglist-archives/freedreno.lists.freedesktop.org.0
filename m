Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAA96715F3
	for <lists+freedreno@lfdr.de>; Wed, 18 Jan 2023 09:17:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A81CC10E055;
	Wed, 18 Jan 2023 08:17:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D33210E10D
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jan 2023 08:17:03 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id u19so81224899ejm.8
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jan 2023 00:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WANyF2F/RgYw3X0PQ15siC75t9y7XEggYSa5zgiK7xs=;
 b=w3pX+rZVu0y1aN6UOW2+7y7W1c+5KInTOYxSZxwn2lUGSfYO2mwRBmvY+TYeewqApi
 7gegKNXqiw2VaMBNA/sk7o51jRBlsKNcvT4v4fVuJPWY4SPGjXLg542X3EFLLwti6cfg
 pGd6EXIo88vo8+CpX00YmmycF1XElScAntM1hC0XaPnWLFcMhsMz4jcaoOvABts1AR+R
 fCn0Aum+sP5Z0iC4udsaSa59hPjfhwSUu35aodORV7Lony7NENfU/7yMALdCV6NSZnik
 +D8gpJkgvc6LuWtoabq16xUaSf1sZ6yETGGzifgxxC5ka6ZHtpQBy5c6sm09CmCcdsGX
 t/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WANyF2F/RgYw3X0PQ15siC75t9y7XEggYSa5zgiK7xs=;
 b=JkdcqtWn0b1K+ks1N0D/shQo7lvLmlT7lPUMoRDgM50BFDGeN9jdTR4jgZTK4oRgCn
 6t1rUPMrpzyvLEsIehpAtXEimI8JDZFoKKUr/pdeyKfAT2cT2AY4Cm3t0VcGupvjSxs2
 NFcFKu4U09TvSa9F01xW6m5zYzPTQHQX54i06iZEMBWQPVoy4mldzdN0P1g3g9hGVgqT
 aC9NsVQrhrZBh4vRpg57ebDh2tAQhAv4M4he7edcW4Xh99tmib8AtfRAxJrHud2ebrZv
 5MKq0lAsvtojaJV3YyxLUGp+0BmVTnsSUB4XMBPCgPHu3aJiFxygaQnyi5RCxYBUw94+
 IIaQ==
X-Gm-Message-State: AFqh2kpyfhjRGRM+FLYi7yPgSlRi3v1pFkmdPBxuPAZIQLr2MhchvjOm
 VB/dkdDji68iukgoyoaHJW/wTA==
X-Google-Smtp-Source: AMrXdXt+Wg6xcTrkPiQyiXb8RxciTGBL7rIrHsRt08RnF1gyMk5qwxdnlQb1dkR86ClSBBpvc8FVQA==
X-Received: by 2002:a17:907:d007:b0:829:59d5:e661 with SMTP id
 va7-20020a170907d00700b0082959d5e661mr6164457ejc.29.1674029821376; 
 Wed, 18 Jan 2023 00:17:01 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 f22-20020a17090631d600b00779cde476e4sm14199080ejf.62.2023.01.18.00.17.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 00:17:01 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Date: Wed, 18 Jan 2023 10:16:46 +0200
Message-Id: <20230118081658.2198520-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118081658.2198520-1-dmitry.baryshkov@linaro.org>
References: <20230118081658.2198520-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 01/13] drm/bridge: lt9611: fix sleep mode setup
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

On atomic_post_disable the bridge goes to the low power state. However
the code disables too much of the chip, so the HPD event is not being
detected and delivered to the host. Reduce the power saving in order to
get the HPD event.

Fixes: 23278bf54afe ("drm/bridge: Introduce LT9611 DSI to HDMI bridge")
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 7c0a99173b39..2714184cc53f 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -448,12 +448,11 @@ static void lt9611_sleep_setup(struct lt9611 *lt9611)
 		{ 0x8023, 0x01 },
 		{ 0x8157, 0x03 }, /* set addr pin as output */
 		{ 0x8149, 0x0b },
-		{ 0x8151, 0x30 }, /* disable IRQ */
+
 		{ 0x8102, 0x48 }, /* MIPI Rx power down */
 		{ 0x8123, 0x80 },
 		{ 0x8130, 0x00 },
-		{ 0x8100, 0x01 }, /* bandgap power down */
-		{ 0x8101, 0x00 }, /* system clk power down */
+		{ 0x8011, 0x0a },
 	};
 
 	regmap_multi_reg_write(lt9611->regmap,
-- 
2.39.0

