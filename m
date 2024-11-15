Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 484499CF6A4
	for <lists+freedreno@lfdr.de>; Fri, 15 Nov 2024 22:09:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BBD910E8BC;
	Fri, 15 Nov 2024 21:09:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rs++cFfw";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD0610E3E0
 for <freedreno@lists.freedesktop.org>; Fri, 15 Nov 2024 21:09:41 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-a9a850270e2so8326866b.0
 for <freedreno@lists.freedesktop.org>; Fri, 15 Nov 2024 13:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731704980; x=1732309780; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6uHMCkPLDPF5XZhqTYsDkYOtTqtnVR38dCpXI61ABZc=;
 b=rs++cFfwn3ghJGZOhdukmWkGS9mEcGQg02iQNW9PG8us+HjRjHJMyboB1Tsj48wYWY
 iHg7ID7DUGfPmdpZus7CZfvYJED9zPwEqpKf3jbuseosuRO/UCBthiI9JnZIm/4Gm98e
 RNRv+rwennsR9OsqLLW/z3DMPUsOZu1g60hwgwJ6YXDwO3uS/HBC7HfT8/gdRP1J8STs
 0BwWk8CBJKGwHHvonkneS2fNmQbr26ojJhO2DVHpvXhQY1bD+SsQdQxhcVMjCvYAoef6
 KzQiU8FwCR4GmS2BcQhYkwLqXt2hpFjW95Kxhc2CZLnJO8oDUwncNnRqwtp6zcAyFUGr
 XHcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731704980; x=1732309780;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6uHMCkPLDPF5XZhqTYsDkYOtTqtnVR38dCpXI61ABZc=;
 b=lW5Y7QuY6l/uZKoIw7VxXboLXjhKRFtocu6KsBj85VMLbQ0I7Dvt0o8CzZemys2yx2
 RiPMR1J+Rr4QMI6Ao+k62XgVuCvKL9H6NTw349g1SdwiyUNmU06wpll4Wduzq6Z28/n5
 ND6bk7Ju2zRJpFG9P0H33iojFBPDO7QrDF95Os2j9BmHYJ1o3WVyEgPHbgUAuLB3Nt+D
 Ni8e8CF+CdvnAWdYrrx9rF+BT8Rmfw+ySBXeFW9vNE7QgQ8gwwO50x+Lhub84a14DbzU
 6u9bDgg93t0Yob4RXpiU6+7FPxafJplLFYFid1Rbx/2RVg8HsRPJl3W9JiZEQoMjiTAG
 qe3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJil3A/vIjm+nCjGvhNTC8m3ZKvAtpW5ALTERLwlKNEP0jKI9qm1VDYuCoQSMFxyK/81cjZCtO/xg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJLE7tSq0oJETFIwN+cAHEacT0svQ2y76gJ3c9rNpEdiaUg3dS
 wXB5aPZCsoFlBmb75jWbwq6m1s2E7KaSA9uU9b7jynBSbULOblzqO74YedE9878=
X-Google-Smtp-Source: AGHT+IGxHaf9fcl9XH3Yy4K6OzfNJb+yIGPjb6McxskUEb9IogL1YLwYggNBzkIhim2sOLfufDW+VA==
X-Received: by 2002:a17:906:ef08:b0:a99:3c32:b538 with SMTP id
 a640c23a62f3a-aa483528a6fmr360455366b.42.1731704979697; 
 Fri, 15 Nov 2024 13:09:39 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20df51648sm219626366b.62.2024.11.15.13.09.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 13:09:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 15 Nov 2024 23:09:27 +0200
Subject: [PATCH 2/5] drm/amdgpu: don't change mode in
 amdgpu_dm_connector_mode_valid()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241115-drm-connector-mode-valid-const-v1-2-b1b523156f71@linaro.org>
References: <20241115-drm-connector-mode-valid-const-v1-0-b1b523156f71@linaro.org>
In-Reply-To: <20241115-drm-connector-mode-valid-const-v1-0-b1b523156f71@linaro.org>
To: Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@redhat.com>, Harry Wentland <harry.wentland@amd.com>, 
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Peter Senna Tschudin <peter.senna@gmail.com>, Ian Ray <ian.ray@ge.com>, 
 Martyn Welch <martyn.welch@collabora.co.uk>, 
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Stefan Agner <stefan@agner.ch>, 
 Alison Wang <alison.wang@nxp.com>, 
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>, 
 Samuel Holland <samuel@sholland.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>, Zack Rusin <zack.rusin@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, virtualization@lists.linux.dev, 
 spice-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1747;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=8PHqNvYNhd077+yMZGdRVPVQtJwqcuP4Sa84pHByMBM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnN7iIkCEBV+I5bR4TS78RU0e2MvivZF+Q9IyXw
 EixhTur0JyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZze4iAAKCRCLPIo+Aiko
 1RrDCACt21MZrMiNUMyxvhABQ0cPHvM9U/AgIbDDO7KsAj2vwEdyLShml6B1R559Jq8voETjEL9
 +078yb1nu6CV+kEVMsCLyWFw6UxeB+cYhzNHLNY0XaEijGUK9+P7bqa1vk5P0ciW3yNlxIBE4bG
 Pbi3ypuJJQOMFd2qx/gt5R3ZNRVS0e/OjOmoRuxABzzNp/GA862gAioxCBoETiqKvawiyBMRFOi
 2ofeAeyKDJWD0PfvL2vatCO6Dh4kmfG8TJG7CkGnJtYNGqCMpr+WoR8TW/0eoaN+Rs47pTYqp9X
 88uGqYaDw6lWG+6NGKvhI0epp0XANid8bh3EOloIMBAU71W4
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

Make amdgpu_dm_connector_mode_valid() duplicate the mode during the
test rather than modifying the passed mode. This is a preparation to
converting the mode_valid() callback of drm_connector to accept const
struct drm_display_mode argument.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 75d6b90104f8fe196df06383b20ee88196a700bf..d0ca905e91eafe6c53f3f2ebdf3f2ae9589d7f89 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7381,6 +7381,7 @@ enum drm_mode_status amdgpu_dm_connector_mode_valid(struct drm_connector *connec
 {
 	int result = MODE_ERROR;
 	struct dc_sink *dc_sink;
+	struct drm_display_mode *test_mode;
 	/* TODO: Unhardcode stream count */
 	struct dc_stream_state *stream;
 	struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
@@ -7405,11 +7406,16 @@ enum drm_mode_status amdgpu_dm_connector_mode_valid(struct drm_connector *connec
 		goto fail;
 	}
 
-	drm_mode_set_crtcinfo(mode, 0);
+	test_mode = drm_mode_duplicate(connector->dev, mode);
+	if (!test_mode)
+		goto fail;
+
+	drm_mode_set_crtcinfo(test_mode, 0);
 
-	stream = create_validate_stream_for_sink(aconnector, mode,
+	stream = create_validate_stream_for_sink(aconnector, test_mode,
 						 to_dm_connector_state(connector->state),
 						 NULL);
+	drm_mode_destroy(connector->dev, test_mode);
 	if (stream) {
 		dc_stream_release(stream);
 		result = MODE_OK;

-- 
2.39.5

