Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF969DF3E8
	for <lists+freedreno@lfdr.de>; Sun,  1 Dec 2024 00:55:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5281310E3D3;
	Sat, 30 Nov 2024 23:55:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SNdFuSMb";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B8EE10E3D3
 for <freedreno@lists.freedesktop.org>; Sat, 30 Nov 2024 23:55:36 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-53de101525eso3909038e87.0
 for <freedreno@lists.freedesktop.org>; Sat, 30 Nov 2024 15:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733010934; x=1733615734; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=FgyD7a8KnGJ66sjxEdDPFFI8o7yH9d7qAC7Fc+pHT8w=;
 b=SNdFuSMb3xDJqPClCoEveSndFNmUkqQTl8VEtrJJPXVY2nD19b1Vtz6B2bKCbp+9f0
 JG6A8aO6l265rbnef6E0v/YEkyg+hrg7urhA/twcl1QEEpDmSq0z/ljdSdQ8khSYXAg2
 ffIRvN0tC58BxInJSOmf1LB5NSnTLCFR0ZApRf2Ln5lXyUxTe+tj6K5XDyDzWpOUHuvo
 ewsVxVhex7J1CsWJZs4+OJ1qeD/5r3Wg384YHwofLLLF0hJl8kg+rGqTS66DjCvK0Wpg
 1PfOC9gAiZX39OZnQPKgRauGtNQCQ4Vv4Lb44pAB9JiroVAjcdhxxjSvyppbwkgMLAKp
 A9Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733010934; x=1733615734;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FgyD7a8KnGJ66sjxEdDPFFI8o7yH9d7qAC7Fc+pHT8w=;
 b=IS12j7Dw3kivE3Ga0pSxm0IjHbOsVuWWvn2MknNG0ZKNpokbmwHdCSbp1/hQCeuW9C
 taHCE9x8fXWejnEi36cjjdNlTOADzhl/vMG+8eVv7Ung6tg/WU2goGbZc/To+GhYERzk
 ykY7nvPi9a29l51MQ7lUd/GhQm70rA9eBTtkP7Q91rnbEbsjX7WsUvJ8Ij5MKPhL61Rh
 D8YY9wsBOY7cwUJLP2ZU3jdD8T+Pxz9QEQN8ahYAYBLAPKXL28myWkHDbq45KubAzC3c
 lJriAvAMpYo+iqX+L6SGE+U7uTAp+mYcY3wImJK7JwJzNvkp3ATEqnDOuen2tw/Aw2CO
 85AA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzgP1RdCrqP1aY+Yk3ngQQPtlxjrNzd5kQIQNzk4mqa7C/ayy/pfoOb/sSEtfTKoDflzmtpBOO7Ko=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw0DrfvtQTwbYXucLNqgtSIGy81d5ex4KWpQQpbPh/XTMCckc5V
 AInkjg6hVHEbf2ju7cF1hgFvUsIRxjLxM/nvgE8LSDRy8BRaojgT99DFPbon9/w=
X-Gm-Gg: ASbGncscLOaIbWfgj0xpA/i2NDEtOtEKgrhjLju1ULcHNOtS9aqwbr/j/3UAOgKMnnq
 fZ0KG8nE555GnH2VipLFt2QAM8zCDIOd722PymsptWfw3VIWvqKdkRxdJWzAozXOcZnVrt5/fLB
 RWIVvztNN8/4ridCoaKNWqAL4tNFXg4jeYBsRF7iGzdeBhcXPAbbYVArqgEWEYCiSGdHpi7h1VD
 a8O8If/ndQNa+LIMjbsAd5d2vGG9vxF8n6c45Nmg1vOJDxEYZUoS2C0Lw==
X-Google-Smtp-Source: AGHT+IFfhVER9h/x9rK2y02O8ScgxqBwF/5PNitw9Xk11JpSQfAwSB2naROC3kIrCP+2Ei8nyJ5Kkg==
X-Received: by 2002:a05:6512:3f7:b0:53d:f583:81df with SMTP id
 2adb3069b0e04-53df5838209mr3265430e87.28.1733010934296; 
 Sat, 30 Nov 2024 15:55:34 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df649647dsm900706e87.195.2024.11.30.15.55.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Nov 2024 15:55:33 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 01 Dec 2024 01:55:19 +0200
Subject: [PATCH 02/10] drm/bridge: anx7625: use eld_mutex to protect access
 to connector->eld
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241201-drm-connector-eld-mutex-v1-2-ba56a6545c03@linaro.org>
References: <20241201-drm-connector-eld-mutex-v1-0-ba56a6545c03@linaro.org>
In-Reply-To: <20241201-drm-connector-eld-mutex-v1-0-ba56a6545c03@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Phong LE <ple@baylibre.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1024;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=jvlD3JuIycYlsUfGVML+3UeoaevWmHaaQytOdr+mxNU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnS6Xt/7pykgJj245vtdzYWdYBTAMnwoeiEVz0V
 cHOwIg5ZZOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0ul7QAKCRCLPIo+Aiko
 1Uh9CACs2EKgY3agKG4T+t0CkgNiBGM+05Aomb7V037y3ZsVMyGBgsnshcMdjjksyQHwWAR9UO4
 phcMcAP56G/wnh2roZkGyvmlMsXgcYwC/JcmmAmqRpZ3BOU41lxrAgavIrurye9kHFCYMSeIXMC
 ZL/VeuwljGdXtKvbiNuFpq85TOh36Cs5evtJpDjaTBBuRCU3eJzaHjovDNB31z0KSlAG44ZpfKW
 /bdsJLcjoLwHRdTtVG4mRghPrGrLzz35ix7Igay76WHZuOI3nL19Gs+e3V6XTkA8m2kprqqo7x9
 ff5KN4kX/nqX3Z+YcrmBBsD2/q8MSlB3PQI3Q2xKw0EPGz1c
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

Reading access to connector->eld can happen at the same time the
drm_edid_to_eld() updates the data. Take the newly added eld_mutex in
order to protect connector->eld from concurrent access.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index a2675b121fe44b96945f34215fd900f35bfde43a..c036bbc92ba96ec4663c55cca091cd5da9f6d271 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -2002,8 +2002,10 @@ static int anx7625_audio_get_eld(struct device *dev, void *data,
 		memset(buf, 0, len);
 	} else {
 		dev_dbg(dev, "audio copy eld\n");
+		mutex_lock(&ctx->connector->eld_mutex);
 		memcpy(buf, ctx->connector->eld,
 		       min(sizeof(ctx->connector->eld), len));
+		mutex_unlock(&ctx->connector->eld_mutex);
 	}
 
 	return 0;

-- 
2.39.5

