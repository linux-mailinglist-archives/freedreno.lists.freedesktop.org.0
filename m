Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FB7A1BE04
	for <lists+freedreno@lfdr.de>; Fri, 24 Jan 2025 22:47:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E54FE10EA21;
	Fri, 24 Jan 2025 21:47:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sx0osHQh";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDD5910EA21
 for <freedreno@lists.freedesktop.org>; Fri, 24 Jan 2025 21:47:50 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-543cc81ddebso869029e87.1
 for <freedreno@lists.freedesktop.org>; Fri, 24 Jan 2025 13:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737755269; x=1738360069; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lJeDvmYfwTrdzYlRuhgm/ygX8U3uOitNLlW6Q4NvxDE=;
 b=sx0osHQhRoIT/+qa58hZ5pxKx7Fl/9Zhjx9X3s+wJOlM+H23uy3MBDzn8Gcps+aQeq
 ywghbm56Um38jRWObpeQ4cgIyKxt1AgGeDv8OLYYy0MP6sqQdYiNawHbaWhvN9KSCmE5
 FsawqCoSITWP5AGnjPLzhpEbwYNXGjsAJSDe7mYPtGmgP1ZHvvtiyS82iTS6/sg/UCLy
 6PB6Nwqashb64w255Roa6/OL70vIpUJU276Vur36F4mUQqVG1BYPdyXEGtUqlgOzN7+L
 0aLJ6cjty7TLr+3MvUtN/JbJfc0ZsCHzlrtvVd7zK5XDSRmENr3bzsT+cAaXYIHRDpLv
 vfNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737755269; x=1738360069;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lJeDvmYfwTrdzYlRuhgm/ygX8U3uOitNLlW6Q4NvxDE=;
 b=gWYQs0qoczTb0jz/50/LEQ+MjXudf5zcr8eTkD3TOEU7SmkT2gqx2Gp0WY72tteyus
 NuhNAYezRLFynXkXBOs++UUapspaIfy6uev5GNp8RWRPpmcp2yOHWrunSI9mqbCjZIfn
 Ii5x7VhDkB3/DOroZqxTelablfk4i5k9xPiDWCdYGlQKOtksgOTUjDVlZQj66LI5vUTA
 IUPDmH/Bs7IgCGtnxhz4mneQoGxC8EBkryBNOzwWdkiDIRHQMM7Ptli/52B9QrIDcMPo
 4/qQAD88g2aFERWabcrpsvHBynVDu6Qt2u2U0Wbf14at9omyvkMfF/ZvZil2lX2eQ/yk
 MwDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNDwqaPtohnUeZmfLeVTVNjl9zPUujtIygEHkykKIDywlslvKvAFD3aeuMHwfPmVAUxZyUMjQ3Zts=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGt3n7kCLZYt3ujJF2WGzXxbAZYO5RIIgYX697tgAmSzRltqxN
 cSS330lmnqb/ymDrFWCK0KWFjeCJeqoSm6G8xVXwOwXQTqAn4Dvo+tE02n6pLVQ=
X-Gm-Gg: ASbGncvK9TCrVRx/25/UZhfgcFJbTsq1iATrvW36wQpgBbJCzN6JTDnRat8oKs2MF6P
 Usm0w5brWxgoJJEpjS9sSXPDreZTwFb54zQKR7qf8gziXdwTbsWPYniq5r1ajmoemq8VlBEODUD
 0oNT2TRj/7U7tf5uBy2M5/4VWSiArPJhyPIPmI4PeQ7gWAGK+xdYBjhlRnGYhspPMqe1TR0DHGO
 mvR6UrnBta/Cr1Qe5/49m6BYjtHfZDqD2yC9Md75271Iadh11MB/UKXeEwlnqLdsHaKq7DE5uSe
 A1I/9LP9SEa1
X-Google-Smtp-Source: AGHT+IGJDQ9mSugKQZZ3KeFdwIuuaaqj2SllE9hV97+PVfAvcbglZCBMGD3C20lS0dPX4nkJyJimsQ==
X-Received: by 2002:a05:6512:3e28:b0:540:1f7d:8b9c with SMTP id
 2adb3069b0e04-5439c286bbdmr12191243e87.45.1737755269106; 
 Fri, 24 Jan 2025 13:47:49 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543c8237491sm425014e87.104.2025.01.24.13.47.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 13:47:47 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 24 Jan 2025 23:47:41 +0200
Subject: [PATCH v6 1/7] drm/msm/hdmi: switch to atomic bridge callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250124-bridge-hdmi-connector-v6-1-1592632327f7@linaro.org>
References: <20250124-bridge-hdmi-connector-v6-0-1592632327f7@linaro.org>
In-Reply-To: <20250124-bridge-hdmi-connector-v6-0-1592632327f7@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2282;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=f0rJpJCum+b7lqaI4sn4V9SXHt/v6K6WBKvJft3vbro=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnlAp/CPIUj4LeEmIPRORlPDyZcs3XDPvrjZ11L
 /nuK2A19+eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ5QKfwAKCRCLPIo+Aiko
 1TDNB/9NOcxhekHC4IsoI7M3QERK0DG9Vnm0SR5ncGHN/OUyl5B0J9eIJPes/ZrryYDnvsOHr8t
 NxyEH+6stBInVmV1huGI/REL1IWnJvm8mO9xhgCiXr7PZDlmt2r4FIkJ1xM0p0kc4TKph7+G+S/
 PTpxS3hRcz9TQezjn0McN9oGURK71gvevdY7KeJTTJfrx+/KtGp62sEcLxjDNS44gxyJDyQory7
 VsZ0eXltI5K49TZs9waOwWinp9cYCxzlodypi8UJq2MBSvKDLdKym8UESfZ+bIL5s0rcoPgEIuR
 mivCOoVb8H0WbavKHR+362v/B8EDAA1tDpeFM8OGYFFkkGwL
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

Change MSM HDMI bridge to use atomic_* callbacks in preparation to
enablign the HDMI connector support.

Acked-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 4a5b5112227f516dfc4279d0f319ec1e5b17f240..d839c71091dcdc3b020fcbba8d698d58ee7fc749 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -126,7 +126,8 @@ static void msm_hdmi_config_avi_infoframe(struct hdmi *hdmi)
 	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
 }
 
-static void msm_hdmi_bridge_pre_enable(struct drm_bridge *bridge)
+static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
+					      struct drm_bridge_state *old_bridge_state)
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
@@ -152,7 +153,8 @@ static void msm_hdmi_bridge_pre_enable(struct drm_bridge *bridge)
 		msm_hdmi_hdcp_on(hdmi->hdcp_ctrl);
 }
 
-static void msm_hdmi_bridge_post_disable(struct drm_bridge *bridge)
+static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
+						struct drm_bridge_state *old_bridge_state)
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
@@ -299,8 +301,11 @@ static enum drm_mode_status msm_hdmi_bridge_mode_valid(struct drm_bridge *bridge
 }
 
 static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
-	.pre_enable = msm_hdmi_bridge_pre_enable,
-	.post_disable = msm_hdmi_bridge_post_disable,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_pre_enable = msm_hdmi_bridge_atomic_pre_enable,
+	.atomic_post_disable = msm_hdmi_bridge_atomic_post_disable,
 	.mode_set = msm_hdmi_bridge_mode_set,
 	.mode_valid = msm_hdmi_bridge_mode_valid,
 	.edid_read = msm_hdmi_bridge_edid_read,

-- 
2.39.5

