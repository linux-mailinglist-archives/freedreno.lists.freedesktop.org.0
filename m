Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 140DB5A92E9
	for <lists+freedreno@lfdr.de>; Thu,  1 Sep 2022 11:15:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7CB389048;
	Thu,  1 Sep 2022 09:15:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7037110E663
 for <freedreno@lists.freedesktop.org>; Thu,  1 Sep 2022 09:15:33 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id g7so6541391lfe.11
 for <freedreno@lists.freedesktop.org>; Thu, 01 Sep 2022 02:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=BMbeQq19sn0fA0AoYnzWmV5qecQuUrgkwG2C68BA4hc=;
 b=radD6aYjGiJPEPBluvbtUZ5aMLsaPprP8pZ78SyXCV8iyl4/S1yF3t9ZpSFxI/9mUe
 UUFVg6zUZWr265Q4HDV4brYbBeW8Gh+GOLYcY4wAXRdezEV+rrAY0lsWG0JxwvYIQJyt
 ouy8tchtOWEn7WuorHXEfRB8cfnlgXTAuf402y/N0tiIGJy+dHe/q/Ff+6eTxnqj/GZL
 dCpz80+yB67MlPVbNMpPMHkbwIGI1Xk9ahqWXgAiMvsRKCRDVROFhgCwKKO3YoKMy967
 Uw1/eozSODBheaZyUIS1R5D8bY3VrR5ZMcYhitQj9EnddlpcfOtcJGNmXcW++uiM6NV7
 r1HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=BMbeQq19sn0fA0AoYnzWmV5qecQuUrgkwG2C68BA4hc=;
 b=StVbHaAowSusap6VLZYdkggPiMabljUNA9M5mytjXOPcxLxYkZU6upABG12vBb8/8O
 FoQTF7NvPDc5PI3J4ODN6vUIguwKlYfn48N6DFKhWw2Sveio93NlxLRj/M5URFMTeRjg
 xXhjlqu8cZ4VRg0+HnHQCAEnZm/qeg37OyEuG+HS5uGXjmpZgphxOS0rRfg6nHYQBR+M
 MY1s+itnyYR0VKtoNcobTLAgijrAz0V+2cvhaFbtzyVlnj3BDwcnTZMk2+Px13u2WiYb
 5+Qvq8HLgyOxSCl0wuX8y7a1eTHVnns6IO3C4HW4kVLdXDJ7I8urFIrpJLnUi9QcL075
 96KA==
X-Gm-Message-State: ACgBeo15lPA3r+GuNqvvFOqCWfL9b98l4HbblNDleiNv8n9sYfA4SNIs
 WwgGPuhCXmDDhEdQpRlibjILWA==
X-Google-Smtp-Source: AA6agR74ZWr0PIZ5NxMAgLXhJEsB89eCwt/udydQWWaFNZ7X4TMZk1BJ3f9j2jAKS8CjzPHFNyOafg==
X-Received: by 2002:a05:6512:12c4:b0:494:8373:5678 with SMTP id
 p4-20020a05651212c400b0049483735678mr2935544lfg.577.1662023731661; 
 Thu, 01 Sep 2022 02:15:31 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 t17-20020a2e2d11000000b00261b4df9ec4sm2422349ljt.138.2022.09.01.02.15.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 02:15:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu,  1 Sep 2022 12:15:27 +0300
Message-Id: <20220901091527.1992208-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220901091527.1992208-1-dmitry.baryshkov@linaro.org>
References: <20220901091527.1992208-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PATCH 3/3] drm/msm/dp: move dp_request_irq() call
 to dp_display_probe()
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, Johan Hovold <johan@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

As the MDSS registers the IRQ domain before populating child devices,
there is little point in deferring the IRQ request up to the
msm_dp_modeset_init(). Following the 'get resources as early as
possible' paradigm, move dp_request_irq() call to dp_display_probe().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 40c7f91abec9..0fb3cb773bec 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1309,6 +1309,12 @@ static int dp_display_probe(struct platform_device *pdev)
 	dp->dp_display.is_edp =
 		(dp->dp_display.connector_type == DRM_MODE_CONNECTOR_eDP);
 
+	rc = dp_display_request_irq(&dp->dp_display);
+	if (rc) {
+		DRM_ERROR("request_irq failed, ret=%d\n", rc);
+		return rc;
+	}
+
 	rc = dp_init_sub_modules(dp);
 	if (rc) {
 		DRM_ERROR("init sub module failed\n");
@@ -1600,12 +1606,6 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 
 	dp_priv = container_of(dp_display, struct dp_display_private, dp_display);
 
-	ret = dp_display_request_irq(dp_display);
-	if (ret) {
-		DRM_ERROR("request_irq failed, ret=%d\n", ret);
-		return ret;
-	}
-
 	ret = dp_display_get_next_bridge(dp_display);
 	if (ret)
 		return ret;
-- 
2.35.1

