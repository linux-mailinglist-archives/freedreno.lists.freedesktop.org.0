Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 193BF7CB05E
	for <lists+freedreno@lfdr.de>; Mon, 16 Oct 2023 18:54:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 412FB10E228;
	Mon, 16 Oct 2023 16:54:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91AA710E228
 for <freedreno@lists.freedesktop.org>; Mon, 16 Oct 2023 16:54:01 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40572aeb6d0so46860385e9.1
 for <freedreno@lists.freedesktop.org>; Mon, 16 Oct 2023 09:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697475240; x=1698080040; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FXcBslb1MNvlJH1zjcV0wxGhoCZ7RiOAEccFN8ak0qg=;
 b=tBf2rDyMI8Sqi3c8svIG1Pr762CY2L35QAE/CySWgsGYyqwOujFQ0ZV612zEf/DABv
 7B8fyl7jXcoPWOEKYQpDXiW7DuFxilkpAHs4sED6uyK1JCNaPrOmTCZEp/u4S5WEVlv0
 DzNMkZAEvgcbKtegMkTC8ftoGm+mX1WgalH2wFavnlaHWRVGfcRvA3mjKXN2wtXP75Zv
 SPd7v2hh0/L2t7FoVcc33VGIbgUQCLtV7op6WQshOAUYhqOjRnXt+SoAUkBNd9B73Nb5
 jWfjJZMerypGEHhkVYganWfA4eBpGjP7EhDQ1z3Q9WLAAdMfOIpNBwb7vVnfomChmWoG
 6Qzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697475240; x=1698080040;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FXcBslb1MNvlJH1zjcV0wxGhoCZ7RiOAEccFN8ak0qg=;
 b=R5ZVQTIIyRpdhf7G3mUTmBLug/3qhjP32s3vu2ntxRjRu/pQZFOmEN2jti2FIyTAAr
 inYn1bmUJERLnnBnIjKL5fbEch/7Xvs2FvHedXHTpU9pdFMatBtpO4h0ah1+OTDDJmlj
 CHregD6Rq/DiPW2tJSXou5l0o7Uyt8RJM8YByQJpLSQUScqisrtoahaO3Kwih5ibC9RH
 d4jrHa/ch2LKO32lNRGjrWhcvvplm2mexVsbHi287OFcr/Z8o4M+0WznQTx25Ib1eGi5
 /TIanFhHM4KEWGI/Afbam4tyjfHcp8DIOv7AhWJAl5FEb1mtj9qW2asCskubkuYJfwrZ
 34+Q==
X-Gm-Message-State: AOJu0Ywl9dU17lQs1IycbRjYjOyg9JS9q2KylKpiIzN+9Q8xLnT/bsqA
 OzMmzZZGIwwr0xxvmatyLYcKJg==
X-Google-Smtp-Source: AGHT+IHoONg9qNPiKGeTIHddHvmhDg1GDHSsCUAu6Z2s65378ibuLRfTX/M31ed4RtOSacgQiyUf0g==
X-Received: by 2002:a1c:4b11:0:b0:405:3455:e1a3 with SMTP id
 y17-20020a1c4b11000000b004053455e1a3mr30359791wma.17.1697475240062; 
 Mon, 16 Oct 2023 09:54:00 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([45.84.211.189])
 by smtp.gmail.com with ESMTPSA id
 s19-20020a05600c45d300b0040648217f4fsm7638996wmo.39.2023.10.16.09.53.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Oct 2023 09:53:59 -0700 (PDT)
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
Date: Mon, 16 Oct 2023 19:53:46 +0300
Message-ID: <20231016165355.1327217-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231016165355.1327217-1-dmitry.baryshkov@linaro.org>
References: <20231016165355.1327217-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PATCH 01/10] Revert "drm/bridge: tc358762: Split
 register programming from pre-enable to enable"
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

It has been pointed out (e.g. in [1]) that enable is not the best place
for sending the DSI commands. There are hosts (sunxi) that can not
support sending DSI commands once video stream has enabled.

Also most panel drivers send DSI commands in the prepare() callback
(which maps to drm_bridg_funcs::pre_enable()). Thus the DSIM host should
be fixed to be able to send DSI commands from pre_enable() state.

[1] https://lore.kernel.org/dri-devel/CAPY8ntBrhYAmsraDqJGuTrSL6VjGXBAMVoN7xweV7E4qZv+v3Q@mail.gmail.com/
[2] https://github.com/torvalds/lincux/blob/master/include/drm/drm_mipi_dsi.h#L84-L87

Cc: Marek Vasut <marex@denx.de>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/tc358762.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
index 46198af9eebb..7b9f05f95fd1 100644
--- a/drivers/gpu/drm/bridge/tc358762.c
+++ b/drivers/gpu/drm/bridge/tc358762.c
@@ -185,17 +185,11 @@ static void tc358762_pre_enable(struct drm_bridge *bridge, struct drm_bridge_sta
 		usleep_range(5000, 10000);
 	}
 
-	ctx->pre_enabled = true;
-}
-
-static void tc358762_enable(struct drm_bridge *bridge, struct drm_bridge_state *state)
-{
-	struct tc358762 *ctx = bridge_to_tc358762(bridge);
-	int ret;
-
 	ret = tc358762_init(ctx);
 	if (ret < 0)
 		dev_err(ctx->dev, "error initializing bridge (%d)\n", ret);
+
+	ctx->pre_enabled = true;
 }
 
 static int tc358762_attach(struct drm_bridge *bridge,
@@ -219,7 +213,6 @@ static void tc358762_bridge_mode_set(struct drm_bridge *bridge,
 static const struct drm_bridge_funcs tc358762_bridge_funcs = {
 	.atomic_post_disable = tc358762_post_disable,
 	.atomic_pre_enable = tc358762_pre_enable,
-	.atomic_enable = tc358762_enable,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset = drm_atomic_helper_bridge_reset,
-- 
2.42.0

