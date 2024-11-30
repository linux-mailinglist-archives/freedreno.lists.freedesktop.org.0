Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A034B9DF3FC
	for <lists+freedreno@lfdr.de>; Sun,  1 Dec 2024 00:55:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7751910E188;
	Sat, 30 Nov 2024 23:55:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="k9rYuaMO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E7D10E188
 for <freedreno@lists.freedesktop.org>; Sat, 30 Nov 2024 23:55:49 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-53de579f775so4240516e87.2
 for <freedreno@lists.freedesktop.org>; Sat, 30 Nov 2024 15:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733010947; x=1733615747; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=uB5LaU5I1hAwk5eHmDH3lOZn5FvnrCwCeIdoknlGoqs=;
 b=k9rYuaMOS2sHPr5mcDzYCUFOQUyqt6MSbJoa3+xe8Rm66mRuQcRiNhGxw5Us5hHKzc
 ED0hGE3PVXxmlCD99/fVnggxj5MYEJ9qmzktC12ibAphz0os5BPWZ06k8ElBCtrCTXkx
 jBBN7OGM6VmveTBvGrOx5OTw5LhEq8y+ZqRrCKQujPq6y/wIuRjxBgbDqASdQPsf0fPt
 +IkpEZ4xLS6KdqOYBrdmjtxypw3yKUdV3jtxmQiv4LQ9tCXTB23QADMfD9yM4xs8p4UC
 zJBsS0F8VpQJbCjoJu22QChanJe5sTQd8h5xq4e6WTcwwHNjSLw+d1uQO0AfPQS7+vGy
 uvXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733010947; x=1733615747;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uB5LaU5I1hAwk5eHmDH3lOZn5FvnrCwCeIdoknlGoqs=;
 b=Gkxz8Z44iIxpn0oUBTjVmP1UCcZ+5oVclYSxMr/6q4DnzVhRHpty/eGA7xFPal8McI
 D+cy/Nu8lfXnS6YjOpfQSxYfJgWYPsA5eVuXDOlXqrY5SMGwsbu2KrKwduTbKeKbNsfW
 Wi9iM8Jzxc1NiGX2M2ROUB43Qzlfhm3dvYOEzXyIFZrxnHvd6hZ8N8wxzjAUa315+yAI
 JXTCpZAcIEyvXeYz9uOEym3KPwSXUhrmM70Zop0z0cL3y+V4OUrjdG3fOVc1R5r3IoGJ
 cFfAXiwBPqBP3B2rrgpk24Hnz3DyxP6DCd4Hj1MQGSFdyNxcZa9OLBh1IxLIGzQGCwf9
 G8Kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIgw4QZD4gJr5lK8foBnpGpHVPJOK0fq9u4JkFTWJQdnfgNzLyjS7Gb78r8haRN0H+pGKgsyiiIl8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw4pUokW3tnEahFDjxic1NcaFlboFn/ur3qOXlPdM+FvEzE7HyO
 0c3SsO8ZeQGK8WC3MV7JT3rHkOEWoV2ZzVl9R4WUWuyLVZQTPQ8AwYiZ6AEQu3k=
X-Gm-Gg: ASbGncv9TSsUGY3v9/LkjezaJWOKItE8hRWDoGhv8HN0E4Jo9ix9HXzWqz3t6LSPjhv
 yJSwTs5gvGDewMXmx7rX4k5ThsXjsWD4EPwMby0okyd3rA5YnyLwJm60Po2wiJ1afak25IccMOa
 NlhFV51mYeTq7mZ/wvVQjuufLTtzTyH9iv61locqEylvWLmHMt95P/dG3+7yI7b9PMvai1lgXMF
 ic09a3unUpLZ4Meqqj1GkruBz5jtCDuLSSQrZtywoiGdusnl8KaIVanZA==
X-Google-Smtp-Source: AGHT+IEnSvktg0pFWgXq/l2+bx5WK3xZBCs4AgqZphc3ydAvUjOE+sdIjebGqlor4oQyehHElEBbzg==
X-Received: by 2002:a05:6512:3c99:b0:53d:effe:591a with SMTP id
 2adb3069b0e04-53df00a91e3mr15018922e87.3.1733010947102; 
 Sat, 30 Nov 2024 15:55:47 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df649647dsm900706e87.195.2024.11.30.15.55.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Nov 2024 15:55:45 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 01 Dec 2024 01:55:24 +0200
Subject: [PATCH 07/10] drm/msm/dp: use eld_mutex to protect access to
 connector->eld
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241201-drm-connector-eld-mutex-v1-7-ba56a6545c03@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=935;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=k/sdBeuIX6ZzNNN1qtwuMpr5v3fWj5pwQ/L03Dq+sDw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnS6Xu0rcXOn0b4oPtwTlM+q76z8lrV6nasm4mB
 qYwkSdVllSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0ul7gAKCRCLPIo+Aiko
 1b8QB/9U7VqcSXJZcqnwzL14LI1Wm8fa0Vof9aggdEKIguYFSF6mBJxkKrcGEguEcmRWj1g76O4
 hIPh6905NyRZ68dga7ppIwiH6+nuI3at8WHRyunXXScVm9yF0PsQ8bUDpPggd+hf5CS2nij612U
 DTBvf4gwViH4u5cxRfe0AoiK1SATjJXbJnm/r609EbOJDGSVy+bbt4lHoU054mBGEovBV0eVHbj
 4VVam6isr2QpQJrTR4xtpKiiwUpVeFWoLxtsqui/lAqHwHNlRcqkZSMaeHh66xeCZH4wQ38Jo1O
 fdJOPzrGvySmqm3sGjUZSaZeFAPrET/XsBL1IOzrdkLgxrMq
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
 drivers/gpu/drm/msm/dp/dp_audio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
index a599fc5d63c524474276f5db98b05c7c512f332a..61952a0c49861efcb5e7c0884fcb85c040daf9ce 100644
--- a/drivers/gpu/drm/msm/dp/dp_audio.c
+++ b/drivers/gpu/drm/msm/dp/dp_audio.c
@@ -414,8 +414,10 @@ static int dp_audio_get_eld(struct device *dev,
 		return -ENODEV;
 	}
 
+	mutex_lock(&dp_display->connector->eld_mutex);
 	memcpy(buf, dp_display->connector->eld,
 		min(sizeof(dp_display->connector->eld), len));
+	mutex_unlock(&dp_display->connector->eld_mutex);
 
 	return 0;
 }

-- 
2.39.5

