Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 385677942DD
	for <lists+freedreno@lfdr.de>; Wed,  6 Sep 2023 20:12:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFEF810E6EA;
	Wed,  6 Sep 2023 18:12:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54C4C10E6E8
 for <freedreno@lists.freedesktop.org>; Wed,  6 Sep 2023 18:12:32 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-68c0d886ea0so107408b3a.2
 for <freedreno@lists.freedesktop.org>; Wed, 06 Sep 2023 11:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694023952; x=1694628752;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3gX80LwLt7yqAMwtFkIm6jGbzuAJp27nwGBhP1SlyP8=;
 b=krQpeucon1782RMuH7OGV8/c8AjeTBjCDhNOYsvhcNutJwIOBnlnPK35U6wzNzsEQi
 f1PPeKmAozTAa7GGWFiWBB5GJWgUcn/Aplx3Uf8J+r84q0F4SXw/BLe3y8QYgDZlljQf
 +dc5//GF/P0/+Dp5z3k1rLG0JEdLxH/TEGlHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694023952; x=1694628752;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3gX80LwLt7yqAMwtFkIm6jGbzuAJp27nwGBhP1SlyP8=;
 b=NfqspckDQAHfgmjzqw64WxxJDfnFtc0XwJIY46wRnP4w7LTOpeyNKrKdmutJrBrBvT
 wk+7pZZ/eQcWH4NN3vIVYm6biJulTzbnDXjZLY+XyzqFunmLSq660V6wyOfxfTE+pY+3
 l++YoyL7H3VMWKKarslJhxF9b2GXd5oejNs5KIbiBPk+5fBsC2oZCJ0m3jXNlmZo23cM
 82tc1a7wtpN7WI/Z0r8xibIen+F4tn7FTmnVNrWBu76nwS5GqokPXBImHfftafFAfVve
 ni8Rv1zI0cJ7WToHkLqBhI1Yt4fP1tmZIudTmPAE2bmVEA6JMceDq2wVe5pK2XwbKsJS
 9NuQ==
X-Gm-Message-State: AOJu0YzmkdhoYz3+XnDOltARsNh9klBKR0Gccq0he41J0JKlSOW2QNDb
 N/QCgdfX4MURnhI8zAoz+v+v+Q==
X-Google-Smtp-Source: AGHT+IHYryhBVKMRFl+PLP7r/f1UH6A77UNtFPyGP0NNScxozW3TWUyTHquM31nYS+ZjqN4OBSdKsw==
X-Received: by 2002:a05:6a20:6a04:b0:14d:f087:c0cc with SMTP id
 p4-20020a056a206a0400b0014df087c0ccmr21393765pzk.48.1694023951909; 
 Wed, 06 Sep 2023 11:12:31 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:11a:201:a404:ed4a:5a1e:3b4a])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a62e80a000000b0064fde7ae1ffsm11080552pfi.38.2023.09.06.11.12.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 11:12:31 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed,  6 Sep 2023 11:12:26 -0700
Message-ID: <20230906181226.2198441-3-swboyd@chromium.org>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
In-Reply-To: <20230906181226.2198441-1-swboyd@chromium.org>
References: <20230906181226.2198441-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 2/2] drm/msm/dp: Remove error message when
 downstream port not connected
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
Cc: Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vinod Polimera <quic_vpolimer@quicinc.com>,
 patches@lists.linux.dev, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Plugging in an Apple dongle without the HDMI cable attached prints out
an error message in the kernel logs when nothing is actually wrong.

   no downstream ports connected

This is because the downstream port for the HDMI connector is not
connected, so the Apple dongle reports that as a zero sink count device.

Cc: Vinod Polimera <quic_vpolimer@quicinc.com>
Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/dp/dp_panel.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 97ba41593820..ae778e1a6fd0 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -156,7 +156,6 @@ int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
 	if (drm_dp_is_branch(dp_panel->dpcd)) {
 		count = drm_dp_read_sink_count(panel->aux);
 		if (!count) {
-			DRM_ERROR("no downstream ports connected\n");
 			panel->link->sink_count = 0;
 			return -ENOTCONN;
 		}
-- 
https://chromeos.dev

