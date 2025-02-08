Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4228FA2D202
	for <lists+freedreno@lfdr.de>; Sat,  8 Feb 2025 01:28:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02F9410E128;
	Sat,  8 Feb 2025 00:28:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Ltxsv8dD";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF56010E039
 for <freedreno@lists.freedesktop.org>; Sat,  8 Feb 2025 00:27:21 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-54410d769f7so2584184e87.3
 for <freedreno@lists.freedesktop.org>; Fri, 07 Feb 2025 16:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738974440; x=1739579240; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=KHzOS4TLAPS/mgdU6Qm1z6QSFXluYdf3CnBXTUtLg4E=;
 b=Ltxsv8dDwVrXHSciGR07TW1WtXwzzXR7j66Rx93Ur9+sXepcxSiBdUEVYX0PWpXCow
 xmwZtuLed8xgqjGXl/NchpzbUKOwpFzZORPYJ3uIqqjA+p0Xjv9xn4jMiy6qzIDde8WR
 NEKu2Oov7Po39Utjx7SrYCLzLsYkDEWUe3hsWIer2TIPm3e6Er0VbrvDb3PFl+MDhcuB
 XB35iZScQSbEqYs94bbNcmkpiDst8SNJMuZEr/ORKErW8h7D3oAp4yVI3BxuGNbV8SNI
 CiGGt0oM4OMEw0mTIGwGOJrezylud/fv6lk2zb6p1JbQdf8gcHslLKnESORzwcYRwBmf
 y0Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738974440; x=1739579240;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KHzOS4TLAPS/mgdU6Qm1z6QSFXluYdf3CnBXTUtLg4E=;
 b=al7Jre/EoO6MHj2jFH8UgYjCNYRKrOXpWpUTBqec1eVEoXNeeqfN8Q4lmMnhKafxWd
 WOva1d1l+jhK6vIwlTRu2Yb+HHe9TQpT6eXwP95RFudUB/UXWNhrr2KapbGLUUsRYZti
 Pvp+8nQUrjkMj1xLpqCAi0pYk8kwCGP6bKX/de0bhHw8WsfIE8XQNrImSGrfqistAIX+
 OGn/F0udN+VR3cUtufE3Pq9+bjSdo1GP825lAFkYRdXJLAoBertbmcWiKgi1HJPe0cNN
 gZXVhuU+b5pdLJLR9Soq5sFc/6FceMN0j8elxpnygACdObqy7BOprixpwwIQ4cYuIq8c
 fbcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0hf96Pea3U9NxXrCv6v367NvebZf20i9969iMShq7Wi814xYrSP0QW5+tuNmri2ILaWiIDeEnYRs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx88bDyTX5aW21SmCsUDrDfteDQq8gBW+enEugZDi1lZouawfMc
 ipJPE8WORODJEJDDGKVWPpsg4e0BRXRonQUapIp10hoQffrDGjTHcbSA2votIsc=
X-Gm-Gg: ASbGncuo1gHI9YtfTRjNJzm1gMo6CeO6E6VsPOlwna+hEp25gm7+lz7rOOh3l8SsYPm
 QNX0vgT4HBVAVeVd+xfiduIxdFIUQXmR6UhIMFIOi0BDifSXAgcabxvCwvGnqvHnd7mcoC4SbUL
 xqhDTX7ir7r1HgJ8zxA7Oco7sJlUlR0LNhsiD+dtAG3+a83wqamMJMwsu/RDG2/T2HaTOwjXniN
 klLHAqjQdpUb52cu9Xr3WZ7YKvqUghUM8fXmrSraRb2GryvR0aOc6X28gUMwa/GpH9GFYCiJbo7
 Pd4dTwEGnsBXmyUHMZmJoio=
X-Google-Smtp-Source: AGHT+IFIeDkDLh9w9kCCyBn5gWkAOachdP8D4zs4RWXylREPTH1q7NhFFOk0yfvOnxK0+BZk579XNQ==
X-Received: by 2002:a05:6512:3e07:b0:540:1d6c:f1bf with SMTP id
 2adb3069b0e04-54414a962a3mr1533574e87.11.1738974440067; 
 Fri, 07 Feb 2025 16:27:20 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5441060413asm588785e87.222.2025.02.07.16.27.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 16:27:18 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 08 Feb 2025 02:27:05 +0200
Subject: [PATCH v7 6/7] drm/msm/hdmi: also send the SPD and HDMI Vendor
 Specific InfoFrames
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250208-bridge-hdmi-connector-v7-6-0c3837f00258@linaro.org>
References: <20250208-bridge-hdmi-connector-v7-0-0c3837f00258@linaro.org>
In-Reply-To: <20250208-bridge-hdmi-connector-v7-0-0c3837f00258@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4721;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Om0VPcrJz02GgKUkGPykuB6u1V2jcE89dUYcHqLMg5g=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnpqTWh+tDswzSq9QN8ptgxcIWoZ/XmGiUhi/p7
 VQJ+4JQjvaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6ak1gAKCRCLPIo+Aiko
 1S+lCAChx1v8ysUrAI5FSlYCPnvFguvdnEb8/8FSxcPaMEb1X9gbx7SQqNW7RbNpgRpLwNBVH+N
 LAZDvJMe58Ma4ZX8urtf+LElOaZ/LzfKv8s9Bcb++xr4QYJDNuy2ndtBlBRRvTChhj9V5aZhP+9
 YGiBBXlWXpyAMyAKq1J5gk4L/CGuXKWA966vI1Vz561kLaoo36g7WZU7TH084iQoP1UKFJ5eLOM
 JCPYWtwR+Mu1tH0TE1uJ4Mqimv5tYxn0mbC8RwyKu9yJuv+t8Sy+YHoBH9z6T588X3c6cbJlSOS
 479F8RS68YFZ7hV/mvp+dq2xMOvRSVWOiwlizdEjOjwGckNU
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

Extend the driver to send SPD and HDMI Vendor Specific InfoFrames.

While the HDMI block has special block to send HVS InfoFrame, use
GENERIC0 block instead. VENSPEC_INFO registers pack frame data in a way
that requires manual repacking in the driver, while GENERIC0 doesn't
have such format requirements. The msm-4.4 kernel uses GENERIC0 to send
HDR InfoFrame which we do not at this point anyway.

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 93 ++++++++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 15ab0858105328c2f774ec1f79423614bbbaeb41..aee75eee3d4244cd95e44df46d65b8e3e53de735 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -69,6 +69,8 @@ static void power_off(struct drm_bridge *bridge)
 }
 
 #define AVI_IFRAME_LINE_NUMBER 1
+#define SPD_IFRAME_LINE_NUMBER 1
+#define VENSPEC_IFRAME_LINE_NUMBER 3
 
 static int msm_hdmi_config_avi_infoframe(struct hdmi *hdmi,
 					 const u8 *buffer, size_t len)
@@ -142,6 +144,74 @@ static int msm_hdmi_config_audio_infoframe(struct hdmi *hdmi,
 	return 0;
 }
 
+static int msm_hdmi_config_spd_infoframe(struct hdmi *hdmi,
+					 const u8 *buffer, size_t len)
+{
+	u32 buf[7] = {};
+	u32 val;
+	int i;
+
+	if (len != HDMI_INFOFRAME_SIZE(SPD) || len - 3 > sizeof(buf)) {
+		DRM_DEV_ERROR(&hdmi->pdev->dev,
+			"failed to configure SPD infoframe\n");
+		return -EINVAL;
+	}
+
+	/* checksum gets written together with the body of the frame */
+	hdmi_write(hdmi, REG_HDMI_GENERIC1_HDR,
+		   buffer[0] |
+		   buffer[1] << 8 |
+		   buffer[2] << 16);
+
+	memcpy(buf, &buffer[3], len - 3);
+
+	for (i = 0; i < ARRAY_SIZE(buf); i++)
+		hdmi_write(hdmi, REG_HDMI_GENERIC1(i), buf[i]);
+
+	val = hdmi_read(hdmi, REG_HDMI_GEN_PKT_CTRL);
+	val |= HDMI_GEN_PKT_CTRL_GENERIC1_SEND |
+		 HDMI_GEN_PKT_CTRL_GENERIC1_CONT |
+		 HDMI_GEN_PKT_CTRL_GENERIC1_LINE(SPD_IFRAME_LINE_NUMBER);
+	hdmi_write(hdmi, REG_HDMI_GEN_PKT_CTRL, val);
+
+	return 0;
+}
+
+static int msm_hdmi_config_hdmi_infoframe(struct hdmi *hdmi,
+					  const u8 *buffer, size_t len)
+{
+	u32 buf[7] = {};
+	u32 val;
+	int i;
+
+	if (len < HDMI_INFOFRAME_HEADER_SIZE + HDMI_VENDOR_INFOFRAME_SIZE ||
+	    len - 3 > sizeof(buf)) {
+		DRM_DEV_ERROR(&hdmi->pdev->dev,
+			"failed to configure HDMI infoframe\n");
+		return -EINVAL;
+	}
+
+	/* checksum gets written together with the body of the frame */
+	hdmi_write(hdmi, REG_HDMI_GENERIC0_HDR,
+		   buffer[0] |
+		   buffer[1] << 8 |
+		   buffer[2] << 16);
+
+	memcpy(buf, &buffer[3], len - 3);
+
+	for (i = 0; i < ARRAY_SIZE(buf); i++)
+		hdmi_write(hdmi, REG_HDMI_GENERIC0(i), buf[i]);
+
+	val = hdmi_read(hdmi, REG_HDMI_GEN_PKT_CTRL);
+	val |= HDMI_GEN_PKT_CTRL_GENERIC0_SEND |
+		 HDMI_GEN_PKT_CTRL_GENERIC0_CONT |
+		 HDMI_GEN_PKT_CTRL_GENERIC0_UPDATE |
+		 HDMI_GEN_PKT_CTRL_GENERIC0_LINE(VENSPEC_IFRAME_LINE_NUMBER);
+	hdmi_write(hdmi, REG_HDMI_GEN_PKT_CTRL, val);
+
+	return 0;
+}
+
 static int msm_hdmi_bridge_clear_infoframe(struct drm_bridge *bridge,
 					   enum hdmi_infoframe_type type)
 {
@@ -176,6 +246,25 @@ static int msm_hdmi_bridge_clear_infoframe(struct drm_bridge *bridge,
 
 		break;
 
+	case HDMI_INFOFRAME_TYPE_SPD:
+		val = hdmi_read(hdmi, REG_HDMI_GEN_PKT_CTRL);
+		val &= ~(HDMI_GEN_PKT_CTRL_GENERIC1_SEND |
+			 HDMI_GEN_PKT_CTRL_GENERIC1_CONT |
+			 HDMI_GEN_PKT_CTRL_GENERIC1_LINE__MASK);
+		hdmi_write(hdmi, REG_HDMI_GEN_PKT_CTRL, val);
+
+		break;
+
+	case HDMI_INFOFRAME_TYPE_VENDOR:
+		val = hdmi_read(hdmi, REG_HDMI_GEN_PKT_CTRL);
+		val &= ~(HDMI_GEN_PKT_CTRL_GENERIC0_SEND |
+			 HDMI_GEN_PKT_CTRL_GENERIC0_CONT |
+			 HDMI_GEN_PKT_CTRL_GENERIC0_UPDATE |
+			 HDMI_GEN_PKT_CTRL_GENERIC0_LINE__MASK);
+		hdmi_write(hdmi, REG_HDMI_GEN_PKT_CTRL, val);
+
+		break;
+
 	default:
 		drm_dbg_driver(hdmi_bridge->base.dev, "Unsupported infoframe type %x\n", type);
 	}
@@ -197,6 +286,10 @@ static int msm_hdmi_bridge_write_infoframe(struct drm_bridge *bridge,
 		return msm_hdmi_config_avi_infoframe(hdmi, buffer, len);
 	case HDMI_INFOFRAME_TYPE_AUDIO:
 		return msm_hdmi_config_audio_infoframe(hdmi, buffer, len);
+	case HDMI_INFOFRAME_TYPE_SPD:
+		return msm_hdmi_config_spd_infoframe(hdmi, buffer, len);
+	case HDMI_INFOFRAME_TYPE_VENDOR:
+		return msm_hdmi_config_hdmi_infoframe(hdmi, buffer, len);
 	default:
 		drm_dbg_driver(hdmi_bridge->base.dev, "Unsupported infoframe type %x\n", type);
 		return 0;

-- 
2.39.5

