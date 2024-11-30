Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C085E9DF401
	for <lists+freedreno@lfdr.de>; Sun,  1 Dec 2024 00:55:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D48210E5F4;
	Sat, 30 Nov 2024 23:55:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="S6QUFf8d";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8926710E5FC
 for <freedreno@lists.freedesktop.org>; Sat, 30 Nov 2024 23:55:51 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-53df63230d0so3521215e87.3
 for <freedreno@lists.freedesktop.org>; Sat, 30 Nov 2024 15:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733010950; x=1733615750; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8B/E5apatQK8hIbe5eE+ik8zb/UqM9JhfpXKxSqUpBI=;
 b=S6QUFf8dw9Cvr4AuxOuIfktIy/mBW9CvBCWZx0npkGt9hbS0ehkUo8CmX3e1dks7Lk
 JNZ6RAlxnsIMRbiCADRtmGAim0KYK7mJzlv9ObQqizT4UXQ1t53USs930sXdkpXoTcNB
 4q9ivl5IRNEI2WES4fhp0wCLgflCGEjbEfKa4eExYLTrV/10tFy1DGXJjPhwMbdTAF+m
 Opsyl9OfBytlwwWJ0KY45DQ1oQAmVSlTpfy+IU0Rx5clfMrxPHGYDhwY0t1aYEbYC1Hn
 TxqHieSt3W7auvjbX55J6pNMe3GVhZ+kK31xvojLBLFPi7IHj4nd/vp0WQARDJaD6Vrr
 DJiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733010950; x=1733615750;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8B/E5apatQK8hIbe5eE+ik8zb/UqM9JhfpXKxSqUpBI=;
 b=BjKMiiAVV0pglT6KnMZ8rIknATFZpzEQdZXA9xRu84pzxSQM4hMY6/9CVoRCH5btUq
 G9CZpQmUc6gqnLJbB7WDVpYdV6qXZ7BJOktk5nAX/hwHE7LCRI21PWykERwffw9KKcwQ
 XNiz0kgB0VU13W8lIrdc+0N382KLYkALuNmoKIXtehPNh5n7t1Jw/wZ2LIdHsl3s+bVu
 Zrxy0pTn+8v3YhOFN6SdGw2K9qLOc1LcsZAwpF2uf5Ocjp9PXMtfeKmwUZrJj/bF27Hx
 1v/FxZL7ECzcievdQYvRl9NM6opSgF0pASqpX9ygq0TWTDwudxRIf9PZmGC34ub0dOKe
 zS/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVyKbCo4XkYS7uecQ6JW4T/ohf0KxcF0kQ+6L3zulgKiXLM79Ue4gkUMPUQ9sBTUUzOiNW1Vyf6DY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGkbSve5f9YQG0G/PuGGiFJu1Rpw9mXa9zBGy5XRCsyDDVsQdH
 Fp9i3TeHvCPH0CWDNaXjUkky5QHPg7nRDJLa0axumi272QTKXF29n4G33eDUpqE=
X-Gm-Gg: ASbGnct9+4usFc+n3/2X2deRnncP4NL39c6zqBd1bkxiNJjaNUj90+aNJIm5I0NnvYs
 n3LEY6mXLSfjwvmDXvZPvVIjlZXTC7QgEMgg/o29Np55O0dCiqhwL0plsHC4JRUsiJEoWaCVfIx
 TVUKeLS9oaqLvHNWSv2BmIjJTSQAiiRc4cY5+Tq+13+QzMn3circ6x+9sWQnSfhG33EGJ/fYMuP
 9BCgzAb4xUSztFAuzztZqIBsJkrdMX3G/3yZQjP8lioy7sVst/o/7QvVg==
X-Google-Smtp-Source: AGHT+IEIp+dlWZhe+G8N9bEIs+K1C7FxJxPBY+37wRt4+mS0XWsu4Pb8i2syhEp1VwHJei72BT+biw==
X-Received: by 2002:a05:6512:2391:b0:53d:eec6:4622 with SMTP id
 2adb3069b0e04-53df0112169mr10013326e87.48.1733010949652; 
 Sat, 30 Nov 2024 15:55:49 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df649647dsm900706e87.195.2024.11.30.15.55.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Nov 2024 15:55:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 01 Dec 2024 01:55:25 +0200
Subject: [PATCH 08/10] drm/radeon: use eld_mutex to protect access to
 connector->eld
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241201-drm-connector-eld-mutex-v1-8-ba56a6545c03@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=985;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=nLL+m/6tlRaIYoSYEq8RR3ocF0ESeJZGxjq7LmbbmlA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnS6Xu1LiAN0LkPKwIvEI7W7y3lCM2SxWMHTvbj
 OKqmG8qGtSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0ul7gAKCRCLPIo+Aiko
 1U5zB/41XZZbXAdwu3uOSstE5ZQzDb/qDMfKvZlQ+OJnYtFRVRPjLns5mTLy8yXWP7axSZix0qW
 b7qL5zI7wvpO2vQvcGIlHhF/PbdVB95v/KMBMYnMbeU6gtmPf5jcjRy0jGVt10nRTw+BH1a7LiY
 s+eAItvf/SJKs3/lGEVhzQQaHbCps1ve7fnPjmWIfbHbFVndrKRvIwzNmZOCN46ii2MW1Zygzk9
 BmcKvVQ0F1Xhlx8whhYB0/xD2Yk4tKPh56VWVlvcQRz3jc0BKV4UczX+YsA3+dmiQSZfSXRoEaZ
 S/wTkEVIXnpQxr5tpjXD/AFl1W8QgGZ//FF443/owvvry4TL
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
 drivers/gpu/drm/radeon/radeon_audio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/radeon/radeon_audio.c b/drivers/gpu/drm/radeon/radeon_audio.c
index 47aa06a9a94221555a4828f41a57cbe03d637ee1..547d8f420669cdb949ffebd0677ddb8cc3c25812 100644
--- a/drivers/gpu/drm/radeon/radeon_audio.c
+++ b/drivers/gpu/drm/radeon/radeon_audio.c
@@ -771,8 +771,10 @@ static int radeon_audio_component_get_eld(struct device *kdev, int port,
 		if (!connector)
 			continue;
 		*enabled = true;
+		mutex_lock(&connector->eld_mutex);
 		ret = drm_eld_size(connector->eld);
 		memcpy(buf, connector->eld, min(max_bytes, ret));
+		mutex_unlock(&connector->eld_mutex);
 		break;
 	}
 

-- 
2.39.5

