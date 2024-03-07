Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3043B875B4F
	for <lists+freedreno@lfdr.de>; Fri,  8 Mar 2024 00:57:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59E8B10F609;
	Thu,  7 Mar 2024 23:57:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XLQQ/f8n";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4971010F607
 for <freedreno@lists.freedesktop.org>; Thu,  7 Mar 2024 23:57:10 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-5131c0691feso2022150e87.1
 for <freedreno@lists.freedesktop.org>; Thu, 07 Mar 2024 15:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709855828; x=1710460628; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=oSCLgDYohNznRCwnS8tfo5EB4gMkp+kuVZWS1xIx1Q0=;
 b=XLQQ/f8nxY813H1KAOwbTi+TVDMFN9vO6vBtr9i0bEOqg7yN2dKwaInlwCg7OLKT+1
 4PY5uecm4Q7D/E2Ivlyh4yqtY+JLM5Jy6fM4TuluyyXkionkfsyZQEggKM7JVfF4z4CU
 0Js76PRN40nIO9TiA+NG9b1rn10Cq48epwBJLrXMhGGhWBLFKnxIETwRMeKVKp5AAn4D
 9kSWhAr16kY51tecvXnRzfKikkMNp9+yx7S7sc6tctNmVbhg7G2MZag6IoFOlc1s9XS9
 wVbK/MPus8G3kP9Xf1RDdxWHqh371enj5xUj0AEOIyTQMrDO1bJAMIiPykp9dMC1hChr
 /NfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709855828; x=1710460628;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oSCLgDYohNznRCwnS8tfo5EB4gMkp+kuVZWS1xIx1Q0=;
 b=e7cWWFimh09AijzVwybBNYETY1/g/sgwsv66VkUl9ZSa1WyYkpqDceLSyfem85Iiyd
 2qNjgCpRrvVU37sNkhiqtjnRa7LiOTOr0V2LR+m/JWgtZeSZCRrZhOBGAe43+gTfeOhc
 Fr9orMMjzntzbFMGeoUwYFwIeOFPrgQFnEEzhKKLfAs5zaFvPn3YiI0jZ+kKkyrrqqVr
 uxrAB3cmxdAlr0wiczM6PXeJVuzi0IoNg0rS8zTH+FIV1frcdLl+i8sOTd0yQOk4m7Bs
 gCYdFbp2RGjPjOtRfJCi0G3bZV3il5c0iSIl1pnNSPXVay5qULLVKAQJoNdbHp90a7cQ
 kjVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuSCheh6kAz+biDrU953H65O1jGXvmUxIhofsi+by8fZdOpjmRsvMgEDhTBVR/IutorCuIq5Ed7EFoev3Y2Y1TApWrvpkW0ZBjSOSVLxCr
X-Gm-Message-State: AOJu0YzInFM7Rb8h5JFMkdhp7ag86XyRszdHBHaGzivfx27ghoFf7bXZ
 7x6mUlR/oOnVDcP5G2IeFET0dCySmxUnft1g6shtc2EkKiKDLQs+dB3cghfIuzY=
X-Google-Smtp-Source: AGHT+IEx8ik/HnzE5BA3s5swGV9Uvxj+BG3KC6Xb175mtXkrd/DFHNiOAucs1EnWSDmhAsJ/EiGyZw==
X-Received: by 2002:a05:6512:4892:b0:513:5c68:9891 with SMTP id
 eq18-20020a056512489200b005135c689891mr2272468lfb.44.1709855828422; 
 Thu, 07 Mar 2024 15:57:08 -0800 (PST)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 c25-20020ac25f79000000b005133277eb29sm2796475lfc.270.2024.03.07.15.57.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Mar 2024 15:57:07 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 08 Mar 2024 01:57:04 +0200
Subject: [PATCH RFC 5/6] drm/msm/hdmi: switch to atomic bridge callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240308-bridge-hdmi-connector-v1-5-90b693550260@linaro.org>
References: <20240308-bridge-hdmi-connector-v1-0-90b693550260@linaro.org>
In-Reply-To: <20240308-bridge-hdmi-connector-v1-0-90b693550260@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2124;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=BLTMrmfRiYz+a4tS74ezbT2hZO40I+AiAHfNW/m4HPQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl6lROL7TvShNhOkfkCagc8FA+VRYozrsB3Q7UA
 zETQDg5gr6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZepUTgAKCRCLPIo+Aiko
 1fQ2B/0ZYDxsY+2fnjYDrke5sXxwtAYhbmqca/jy6/PZd9RLE6EoGmw3UjQ9+BkB/3DLashehFZ
 A4QKe+48Hk9UC7q75UmY+fdFTK6F11Eq39JoHum+VnA3YhBDT1mUzcrCGWIdsMjbJ8nLIVcfqil
 y1VzRByOEZt8L86tJGG5ppOv6t+WYsckKA4MxZyxTF7SndcMQDhg576pSae+f7N1pyG1PueyVbr
 P2/+Grv0/xoB9mpaw9Je3rsMWWCZt32xe3Nr9e7dSnD7Un/uYJC8WdKxnX8cBBZTqjexmmTbCWH
 /yuLJCdw7GPswznIkLI11B7SVfk/5qBFhqIZQU9dfudhZEHF
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 4a5b5112227f..d839c71091dc 100644
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
2.39.2

