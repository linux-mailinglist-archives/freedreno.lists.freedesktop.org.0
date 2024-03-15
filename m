Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAA687D645
	for <lists+freedreno@lfdr.de>; Fri, 15 Mar 2024 22:37:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC9F111259D;
	Fri, 15 Mar 2024 21:37:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="hUB6/szR";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 736E111259D
 for <freedreno@lists.freedesktop.org>; Fri, 15 Mar 2024 21:37:46 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-6e6c0098328so2234148b3a.3
 for <freedreno@lists.freedesktop.org>; Fri, 15 Mar 2024 14:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1710538666; x=1711143466;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gz22lebM2rTHwhNkx5aAaX7EA6Wa3wOGuC1PNKA3MCs=;
 b=hUB6/szRvBegW1KnGZDam55ygKkRRAgkpYKHWgsUXZu1NMykr9kALiVdO2bicMiwKr
 6smmV136zrnK/uIOlMbQf9yWOhqmKlQ19pEOiNa0QwktWb7fsc+2w0XBaipkAxI8U1zO
 fOsEHg9t4zae+F0gBAJeG7dIob5Qxw1T+kE1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710538666; x=1711143466;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gz22lebM2rTHwhNkx5aAaX7EA6Wa3wOGuC1PNKA3MCs=;
 b=Mw59I2/FVOQekpXy1yicpNJzupO+SNP7RLONssj+yEp6VhTjDZtX9WsWyt0SFJYhqB
 QcYvGnHCux7OpXDZag17/evKi2TTeVSnXzaZZYUFHGxB7aTiIt298BPAwvtrfWNm0Awd
 Y5b81XUmtlglwf/Bj/nzRXqGjkNDjYSmJbWM8LxWu45WAIRFyyjdc78uS8NFIb7Hhbo9
 hLKNcdK/LKXxfUy7L5uAPpFEXUg6Ev4wKFeVoJhLw7bDqRlxJnQMLHxuK0w1OrGcE8yP
 DreLa12Aol6uZFi5VAG6yrbKuZcMIISGSujxSNgbP94llxCTFCKAHNqgrwFaZyYjkiyw
 XfSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUz3mGGCohkJ3QvboYa0tQMSRB08cKveU3bsc9ccdGs0a1HgJqjyXYSytZCHxoglMRSNC1QGd3C5t+Pvo4et4muCsal89ZDSdfx/UkhSwL
X-Gm-Message-State: AOJu0YyCaPIvlpnyDIyPzLbkenRWvc4R2xC5KRRTmkzOSR9rK7nZmeuC
 ouy3eii5v/PxYUg0oKjHHuEfti2dI6fK6UzqB3qALjvMAHMGtTFaSMUGha4n9w==
X-Google-Smtp-Source: AGHT+IHQFsTaKAjTWRRsrq1ZbLWnGQEVyGRFX2DMyF+SJJVN6Bd0rkX5tleEQkFmHdo17KUR5G1ENw==
X-Received: by 2002:a05:6a00:845:b0:6e6:fb34:2568 with SMTP id
 q5-20020a056a00084500b006e6fb342568mr3035362pfk.0.1710538666024; 
 Fri, 15 Mar 2024 14:37:46 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:b23e:e8dc:3df4:aa2a])
 by smtp.gmail.com with ESMTPSA id
 a26-20020aa7865a000000b006e6b5e65579sm3837142pfo.106.2024.03.15.14.37.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 14:37:44 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>, Stephen Boyd <swboyd@chromium.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] drm/msm/dp: Fix typo in static function (ststus =>
 status)
Date: Fri, 15 Mar 2024 14:36:32 -0700
Message-ID: <20240315143621.v2.4.Ia5dd755f81d7cc9a4393c43f77b9be4ed2278ee3@changeid>
X-Mailer: git-send-email 2.44.0.291.gc1ea87d7ee-goog
In-Reply-To: <20240315213717.1411017-1-dianders@chromium.org>
References: <20240315213717.1411017-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This is a no-op change to just fix a typo in the name of a static function.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- ("Fix typo in static function (ststus => status)") new for v2.

 drivers/gpu/drm/msm/dp/dp_display.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index b0f3e2ef5a6b..78e702f66ed2 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -494,7 +494,7 @@ static void dp_display_handle_video_request(struct dp_display_private *dp)
 	}
 }
 
-static int dp_display_handle_port_ststus_changed(struct dp_display_private *dp)
+static int dp_display_handle_port_status_changed(struct dp_display_private *dp)
 {
 	int rc = 0;
 
@@ -551,7 +551,7 @@ static int dp_display_usbpd_attention_cb(struct device *dev)
 		drm_dbg_dp(dp->drm_dev, "hpd_state=%d sink_request=%d\n",
 					dp->hpd_state, sink_request);
 		if (sink_request & DS_PORT_STATUS_CHANGED)
-			rc = dp_display_handle_port_ststus_changed(dp);
+			rc = dp_display_handle_port_status_changed(dp);
 		else
 			rc = dp_display_handle_irq_hpd(dp);
 	}
-- 
2.44.0.291.gc1ea87d7ee-goog

