Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2078A6613EB
	for <lists+freedreno@lfdr.de>; Sun,  8 Jan 2023 08:26:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC75010E1EC;
	Sun,  8 Jan 2023 07:26:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAED810E15E
 for <freedreno@lists.freedesktop.org>; Sun,  8 Jan 2023 07:25:58 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id m6so8286130lfj.11
 for <freedreno@lists.freedesktop.org>; Sat, 07 Jan 2023 23:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bMcMgMN2h9pQ0++woqWQkTwB0DopoRxUXMW3C3/QKYc=;
 b=Ux2ciHFIvGWO6NT3TSZYAB6S//IPXOwYcprwgpxHswK6KaMc8BZXeunVEogXWh2UVX
 cJ7vCxBy+A263PXJ70ZbtZjgAmyvLdwt7weFf/UVBBNjX4smHNzB/59XIYJVLQ3XIoP7
 7GSNKGdW6PADsCLBuyKlFAp43Bq3ExEYz5msECLnIZ32SAOdnbntxtFuqGIHHs0Np1qq
 REWz9nqb/8tFhPn5GtWhYlo0C4IozI23vnHITkNfoQJgwE9uLbQQHHrspZ3mVMcsvtQ3
 cncr9HpO6q2LVNT9YUsBWYX85zkBURmWzpQ3uZnbZ/c63qqjwwWkEEw1sFsbODfNY0wI
 TpJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bMcMgMN2h9pQ0++woqWQkTwB0DopoRxUXMW3C3/QKYc=;
 b=cqk8Y9InuRsvJ6hRGpAZaKiOT4a8gri2pY9BJWO5Ip8H6uLYFvlTn3yzFwFHcfehFs
 aqFHo9yIQIVjHAA6tTkjs5aPOhZohyeGWit42PHgW88NXICPpIIZyIb59+4SWlyuIQQr
 LyAm5czy+DEqY510soScB4C/jirwWSiR5/eukBUtXI+mnpAntyzbjFwP5xEdmQBl/Dyq
 Q0zS+7UDAEPfSxB8MnUf0h2JcWXfOW0NMbNUzzxfot5tMBF7bWv8ClhB4cnatK4f5PvZ
 akA/vn5KE3p3gaVvByl+6VdzvQl7x5f/TZB9zDDvIU2yECBlzmoavdeCZrOrO9Ns8cgq
 +lxA==
X-Gm-Message-State: AFqh2krOXJy/9NlHOMz/GDP3MY8H4E9CagEPRjz2lGUvulmoDOdicUwj
 TV6jrAu2dPLWV08JL/OaKmr+lg==
X-Google-Smtp-Source: AMrXdXuAxN4yqXdIZptsyDsJjG5Jcnv7P/pNVbSR10r89IK21J1NzuWq9lidrKNOTS4PfUYs3gfuUA==
X-Received: by 2002:ac2:5975:0:b0:4b5:8f03:a2bc with SMTP id
 h21-20020ac25975000000b004b58f03a2bcmr15713088lfp.9.1673162757318; 
 Sat, 07 Jan 2023 23:25:57 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 x2-20020a056512130200b004a8f824466bsm927414lfu.188.2023.01.07.23.25.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 23:25:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Date: Sun,  8 Jan 2023 09:25:44 +0200
Message-Id: <20230108072555.2905260-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230108072555.2905260-1-dmitry.baryshkov@linaro.org>
References: <20230108072555.2905260-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 01/12] drm/bridge: lt9611: fix sleep mode setup
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

