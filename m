Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EED5D5500B3
	for <lists+freedreno@lfdr.de>; Sat, 18 Jun 2022 01:24:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 019F910EEAE;
	Fri, 17 Jun 2022 23:24:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF24C10EC30
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jun 2022 23:24:39 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id h23so6198377ljl.3
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jun 2022 16:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e45UG9mTlTJvPbiZWbY0ZYbiN8aB8KaEsAK9Yi9aKWU=;
 b=qSUG0lk3OoQ2cOPgN6PQc4jGVavTHVqq4u00LXAjSMmFKrF5QDWtkTU6pm2qnWsdJB
 /lK2RLjATzgI9VDLgQqxa4txNnKq5Du3M6PRCcNYBNTorZsToEIsRZWSuxV9tUeN+m/W
 cFBlo0VRTIv9cbh9+r9ATpMcVJTdNYezumpdXRvsEDI0VEyoec0vOPnqp3Yuu9d07V3A
 8gjRTi2qH1PvQ6Cy9RTIoDdgOuD9GjxThUUzgqCPmsTPMSR3zulHetn9qMMC7UF43CQs
 oSI1vig3ERY0EDyzSL98+qI4eLqXE3qW3Vg+e7eBvz9aJ75A4n3Lp1qDDF84UoE3De4b
 LGRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e45UG9mTlTJvPbiZWbY0ZYbiN8aB8KaEsAK9Yi9aKWU=;
 b=fJuvbW0E61VoU9h4my8q1cv4kZkmYAp1Kumx1KHGWyIJws6UKlP7TK467FIv0Im13z
 GaHHHm12f/skV8rRvsRSQAulmsoRmERyFXqdNqJdgt5uYiYAbcezPpQSz69NeHC3WIte
 xLW2+hiOOPZ246KrDL+eqjwoA4bUR3BNNFyt8O3CuF4UV3RZUi+UZYMxvkO2KEG3okFN
 cOXxzIoi+vd97cr3uzQ314/gtfNPzAwfH7AYFs8sszQQ3cMiMnQpoq+DoQgfvTB6s2Cy
 giAeIk5N4wizipYBlK9kl78LY/EBpmmLr292KlcgaPEQomUA/BvClGsIcz+s4VkK6+uM
 G/qQ==
X-Gm-Message-State: AJIora+aBxEEz2puGlNrHI9YtZ1MiSRY8NVsgvzw8UbhCLp4d9vJBfnM
 hKu0RASRnOncXdhHkXP6wmW/iMIzfL/84qw6
X-Google-Smtp-Source: AGRyM1sAbE/LZM8y3KLOdVfrC2vhIFcVXRKQL12NmosiqD2uFaZO7EUb106lmfkZr7u8XkIT1Uwe6Q==
X-Received: by 2002:a2e:9781:0:b0:24a:fb54:31d3 with SMTP id
 y1-20020a2e9781000000b0024afb5431d3mr6146842lji.242.1655508277901; 
 Fri, 17 Jun 2022 16:24:37 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 a7-20020a194f47000000b00478f9517a60sm802742lfk.38.2022.06.17.16.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jun 2022 16:24:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Sat, 18 Jun 2022 02:24:34 +0300
Message-Id: <20220617232434.1139950-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220617232434.1139950-1-dmitry.baryshkov@linaro.org>
References: <20220617232434.1139950-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 3/3] drm/msm/dp: remove dp_display_en/disable
 prototypes and data argument
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
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Remove unused dp_display_en/disable prototypes. While we are at it,
remove extra 'data' argument that is unused.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes since v1:
- Rebased and dropped the dp_display_enable() chunk
---
 drivers/gpu/drm/msm/dp/dp_display.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 96defacc92dc..c17a799d3009 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -608,9 +608,6 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
 	return 0;
 };
 
-static int dp_display_enable(struct dp_display_private *dp, bool force_link_train);
-static int dp_display_disable(struct dp_display_private *dp, u32 data);
-
 static void dp_display_handle_plugged_change(struct msm_dp *dp_display,
 		bool plugged)
 {
@@ -894,7 +891,7 @@ static int dp_display_post_enable(struct msm_dp *dp_display)
 	return 0;
 }
 
-static int dp_display_disable(struct dp_display_private *dp, u32 data)
+static int dp_display_disable(struct dp_display_private *dp)
 {
 	struct msm_dp *dp_display = &dp->dp_display;
 
@@ -1676,7 +1673,7 @@ void dp_bridge_enable(struct drm_bridge *drm_bridge)
 	rc = dp_display_post_enable(dp);
 	if (rc) {
 		DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
-		dp_display_disable(dp_display, 0);
+		dp_display_disable(dp_display);
 	}
 
 	/* completed connection */
@@ -1717,7 +1714,7 @@ void dp_bridge_post_disable(struct drm_bridge *drm_bridge)
 		return;
 	}
 
-	dp_display_disable(dp_display, 0);
+	dp_display_disable(dp_display);
 
 	state =  dp_display->hpd_state;
 	if (state == ST_DISCONNECT_PENDING) {
-- 
2.35.1

