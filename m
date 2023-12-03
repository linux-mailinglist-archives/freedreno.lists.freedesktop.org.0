Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1779D801FEC
	for <lists+freedreno@lfdr.de>; Sun,  3 Dec 2023 01:06:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A973510E248;
	Sun,  3 Dec 2023 00:06:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BDC310E240
 for <freedreno@lists.freedesktop.org>; Sun,  3 Dec 2023 00:05:37 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-50be9e6427dso713879e87.1
 for <freedreno@lists.freedesktop.org>; Sat, 02 Dec 2023 16:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701561935; x=1702166735; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JO3m8ahifaDZ0+MNukHcqzkkdAa1Y9cf8gmY03LWk14=;
 b=evzLxIGxAJHZp8sT60cpTWczKsCOUM1oArC6WRrmF33W9Ej/7NptzvySYoSn+lCgOe
 oNd/nW3j0SZSGL124MDJPNQHXygIMHPLQD9czl691iHVHf2d7RqdZNj1x7hQ4jCzAmt3
 uNp6Em48V/U3bzMxJqvFmmgFyzrt2HVgRlVXaFcqBMf/WqaLz5Pc/ggKS5xTD2B/NeLM
 AFn4zAZ0+V7ERp4M9H0wdYzkhTqDAzBYFNN2p9QF9sILILZtAmROusG4AEZNBKoffzWa
 xtLMq99gUk7zBm6ZvNQ66gsyK/vp40SKjYV44bgMPT2YbjgsphNx0DnSG4kviZB4/sQq
 z5oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701561935; x=1702166735;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JO3m8ahifaDZ0+MNukHcqzkkdAa1Y9cf8gmY03LWk14=;
 b=NIAtRZFhOfp2y2f7WBUq8hSB7KUrMwe8RxyCy1+HxgUnnowXh9ssI0TwlPmlgOQhsH
 WSLARsSB7b0Sckjez0FJD33x5Xq+aZYzil0huGqlFt5ifP4PwnyIgU7NFSzhpREEq0yB
 cWCpHzgTMrAoz7htlh0M4+91DZy9KnqaxbTP14Pgi439GRZubpvS5O8YhR7V0KLaHAmm
 h2pRSDpDV3Fx6uqWx5iRR6dq49Qcn46tyHLsc0s6FCnvjzNhO4ZY4qohyWj4NQ+0zjGe
 VZcbiWWc2I5bQJBWeHyfZRa+DclwUmEV7zbewVSg0gwveu1M1OuvKU9mepmowyq/5+Nn
 sVzQ==
X-Gm-Message-State: AOJu0YztYvZqTU1FkuQHp3Fw32SRhOZVoTVywdqVeYfGhan0uRV2dn3k
 CuVVTDiWTiC9UwoYWHBrFcbDNg==
X-Google-Smtp-Source: AGHT+IH/f0Rg02BqzF0RxgclP0Ngb9Yhu8RdxeWoyIlgBcPLdaE4UHjLlCCMIAdKZLauDY7T3sDXtw==
X-Received: by 2002:a19:ca5e:0:b0:50b:eead:3756 with SMTP id
 h30-20020a19ca5e000000b0050beead3756mr343659lfj.54.1701561935562; 
 Sat, 02 Dec 2023 16:05:35 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 t2-20020a19ad02000000b0050bc5edfa45sm826273lfc.85.2023.12.02.16.05.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 16:05:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Date: Sun,  3 Dec 2023 03:05:28 +0300
Message-Id: <20231203000532.1290480-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231203000532.1290480-1-dmitry.baryshkov@linaro.org>
References: <20231203000532.1290480-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH RESEND 1/5] drm/atomic: add private obj state to
 state dump
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
Cc: linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The drm_atomic_print_new_state() already prints private object state via
drm_atomic_private_obj_print_state(). Add private object state dumping
to __drm_state_dump(), so that it is also included into drm_state_dump()
output and into debugfs/dri/N/state file.

Reviewed-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_atomic.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index f1a503aafe5a..c31fc0b48c31 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1773,6 +1773,7 @@ static void __drm_state_dump(struct drm_device *dev, struct drm_printer *p,
 	struct drm_crtc *crtc;
 	struct drm_connector *connector;
 	struct drm_connector_list_iter conn_iter;
+	struct drm_private_obj *obj;
 
 	if (!drm_drv_uses_atomic_modeset(dev))
 		return;
@@ -1801,6 +1802,14 @@ static void __drm_state_dump(struct drm_device *dev, struct drm_printer *p,
 	if (take_locks)
 		drm_modeset_unlock(&dev->mode_config.connection_mutex);
 	drm_connector_list_iter_end(&conn_iter);
+
+	list_for_each_entry(obj, &config->privobj_list, head) {
+		if (take_locks)
+			drm_modeset_lock(&obj->lock, NULL);
+		drm_atomic_private_obj_print_state(p, obj->state);
+		if (take_locks)
+			drm_modeset_unlock(&obj->lock);
+	}
 }
 
 /**
-- 
2.39.2

