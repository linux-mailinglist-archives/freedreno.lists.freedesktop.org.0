Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DE58D6A5F
	for <lists+freedreno@lfdr.de>; Fri, 31 May 2024 22:07:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8BA410E2EF;
	Fri, 31 May 2024 20:07:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="j0GHWLwf";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A296710E148
 for <freedreno@lists.freedesktop.org>; Fri, 31 May 2024 20:07:37 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2e95a7545bdso24671751fa.2
 for <freedreno@lists.freedesktop.org>; Fri, 31 May 2024 13:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717186056; x=1717790856; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fyQFsCbfAwoMIv3tWG4MkDjXNMbuJRe63fpfFnOR1dY=;
 b=j0GHWLwfLf0EuGdQuO2xutL56Mx8RfNK+Arq3IWWDM9UAxfJY20EbvwvCdnI+Ztbbc
 xN+8ZGjscqYyjL4pmwOFfq235y2eIfp4ew8Ryui+En8aRtXdo9VLrzvdoUme+RrIflu4
 ZLzBvsqM8qtPWdi/8D2rsMV2inlzrPNsQpMyaeQK7n+HZcp0ipNjwcuH6vHdOW0/0JLi
 NzNRkgyN9XwjIgNVmm7KaILKqMI2651InJpO6yXZpffFLDJwTdzIXJ6EGtMbzc646y45
 p0K0fvfAI9qbx0VJtlKKRDbCNuPDrK4+lVVxakLYej6BVEFZ/6PjuOj3Qj4UmoeiFn8V
 cRcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717186056; x=1717790856;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fyQFsCbfAwoMIv3tWG4MkDjXNMbuJRe63fpfFnOR1dY=;
 b=HalHlzeRffwjqIpej+RMuNUnX7mZuzYhCtsk5smg1xbvG8ATVWkDjy5d1YdOu5/yiH
 krGj14DE3YWgD69maL6z4oOmqldXKpWM1nNLm0PPCW8e6eUjH1iOrs4P4ctq/F5/MIrD
 HTUUoPK/QHfQtfUl0Oaypu+tXw63p/3mFeuPoND8OLZ+MR7Qk5ySG6ovmrFyyIDUL8Pn
 /MG9bUxkGLwXn1/dinoiXjVLq9QPrvdcrduip3putOiephNr+vPfjSNaNIjZtx7cNDwQ
 PdByEj9uOmcnZdmeJ32WmYIg+9l1Yddc9PCrEinmnGu2rKGKZrbNKaIvlTKIhe0OaDTi
 nn0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5uhJ3nqyYY4Bt99+BCyw2xHkvtwc5xry4IS2dft2n9QBXHlzB/qgnBN7eQGQ6eO/JglEIypFSnTGja8hj6j25xpBH5MuWZgqPaT3fPdEE
X-Gm-Message-State: AOJu0YxXuCysB3c8+cFnOJapNSaOsXi9lkegVb888MtPyZ4zL8YCBAPu
 AVwpXuVK7T+Y8AxJt/01IUip1r6dh3cP2f0A6e36/89V0+bX7v9jsnHelSXO7Ww=
X-Google-Smtp-Source: AGHT+IG8WKuvGdyXdl/w5pEmXWOdKQMXIjLeMy0WFBbgze9CMqtMG7e1bNR/WlANpKFq7SOK+v+ikw==
X-Received: by 2002:a2e:a787:0:b0:2ea:7e51:5166 with SMTP id
 38308e7fff4ca-2ea951e7dedmr23294901fa.41.1717186055760; 
 Fri, 31 May 2024 13:07:35 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ea91cf0b83sm4022111fa.116.2024.05.31.13.07.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 May 2024 13:07:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 31 May 2024 23:07:30 +0300
Subject: [PATCH v4 7/9] drm/msm/hdmi: get rid of hdmi_mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240531-bridge-hdmi-connector-v4-7-5110f7943622@linaro.org>
References: <20240531-bridge-hdmi-connector-v4-0-5110f7943622@linaro.org>
In-Reply-To: <20240531-bridge-hdmi-connector-v4-0-5110f7943622@linaro.org>
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
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2091;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=YU3BlXVbC2sxyz2PPZCCSUqtcJVpgJv63N0Ddf7f0rw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmWi4BHrqnztSl/bf+yajDn9vgYH4mqH0Y53sGo
 OoRBr924/SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlouAQAKCRCLPIo+Aiko
 1Xh5B/9zouH68B/F8qgbHAklwaF8yiIgh7VTIvtswpeCMmZLV2PjfKonuGoa7WMjbjwa1MrRxuf
 uMHblZllej3vHkYrPZXm1m7R34tnOWxMFrftxZpH0N9XUb2LRJ1iC5MmXv+kkLNBxAqrJcfdRp8
 BDLXB//GNhc8L2wreI+17e15dskv9NFqKM2PBiWkDv0BI1+TZ5783H/WqzJ8qGPG2ZBUc3HrOvS
 2vID35dnc5jwtgpP5l4HDLUxqS95aGxjiG9XJBbT1Asxjss6TYMpAYjlc6oOOT8eERXtBV5JSoL
 2MOfphPuAaCuwn2mPD6tFm7UcVwXHnhi2hJkIdXN3UUXupU4
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

Use connector->display_info.is_hdmi instead of manually using
drm_detect_hdmi_monitor().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c        |  2 +-
 drivers/gpu/drm/msm/hdmi/hdmi.h        |  2 --
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 11 -----------
 3 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 179da72f8f70..2e2883b9229b 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -25,7 +25,7 @@ void msm_hdmi_set_mode(struct hdmi *hdmi, bool power_on)
 	spin_lock_irqsave(&hdmi->reg_lock, flags);
 	if (power_on) {
 		ctrl |= HDMI_CTRL_ENABLE;
-		if (!hdmi->hdmi_mode) {
+		if (!hdmi->connector->display_info.is_hdmi) {
 			ctrl |= HDMI_CTRL_HDMI;
 			hdmi_write(hdmi, REG_HDMI_CTRL, ctrl);
 			ctrl &= ~HDMI_CTRL_HDMI;
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index 0ac034eaaf0f..b7fc1c5f1d1e 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -67,8 +67,6 @@ struct hdmi {
 	/* the encoder we are hooked to (outside of hdmi block) */
 	struct drm_encoder *encoder;
 
-	bool hdmi_mode;               /* are we in hdmi mode? */
-
 	int irq;
 	struct workqueue_struct *workq;
 
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 9eecc9960e75..9258d3100042 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -346,17 +346,6 @@ static const struct drm_edid *msm_hdmi_bridge_edid_read(struct drm_bridge *bridg
 
 	hdmi_write(hdmi, REG_HDMI_CTRL, hdmi_ctrl);
 
-	if (drm_edid) {
-		/*
-		 * FIXME: This should use connector->display_info.is_hdmi from a
-		 * path that has read the EDID and called
-		 * drm_edid_connector_update().
-		 */
-		const struct edid *edid = drm_edid_raw(drm_edid);
-
-		hdmi->hdmi_mode = drm_detect_hdmi_monitor(edid);
-	}
-
 	return drm_edid;
 }
 

-- 
2.39.2

