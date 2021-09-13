Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12669409B65
	for <lists+freedreno@lfdr.de>; Mon, 13 Sep 2021 19:58:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B4476E216;
	Mon, 13 Sep 2021 17:58:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [IPv6:2607:f8b0:4864:20::f32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88F706ECDA
 for <freedreno@lists.freedesktop.org>; Mon, 13 Sep 2021 17:58:09 +0000 (UTC)
Received: by mail-qv1-xf32.google.com with SMTP id g11so6602943qvd.2
 for <freedreno@lists.freedesktop.org>; Mon, 13 Sep 2021 10:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uvurVzZlAXN+3wz8I30tpTKQ4+4bUnrN0ukF/CdF4vE=;
 b=fnakUYFqIB5fbo4OVxeM+ao1UaC4dOk3qg30+sZcY8bmnuNIgklzub1yfQq7gJNKHj
 AiwfLFK4gQkcUgVsWr7m2CLoJwAwYAnIezlUz3jiLTwiHlZ1BzNnj+9KmHkO5FnRfDvt
 skURcmKSAdZRCy5h1RdnNmMiqpEbCcAJHFvIBmL1lmfBnnBsycmSz/E1tDovhdvyiMmh
 b0LLqoOa9+SgeL1BVQCdhfabX7OuhlQUxkH/cIKfO8jAoaxATb9aTsz9B8WzqTzNy2VI
 1Rr/+/5nClqBri+g/gwmvd07lsEkx7nMQjlgsdj54538Ov8dDkeiEoL7jeouBRknU+H8
 INyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uvurVzZlAXN+3wz8I30tpTKQ4+4bUnrN0ukF/CdF4vE=;
 b=lQUWfUQ2Sj5fgFjdFLZh4pjyqn9Z5cYZ9w6WWko9sRMq3NIC4bvPM8jDWzWAyrKDyS
 /poFeS/R7g6+IzeCYKtowUCyu6/1nJgktutD5slHcxRymynBIWU1AP2Ra/VPIdEAzR49
 W5HV0Iv9I1q6ejZmrc0h+7KjvXiQ81o0hFA8ZpDFUdPrGshB8U68LSIt7SA84F+yDDZX
 q4x/YGIK4WTEKwp5eorqMOnnQyRFJs8jPYSiAfWeWeXz68ZLlEOhdyIU+jZtmnjmaRU3
 K2Ez6ypaB36m7X5qgr01s7ITqpCuPHH5l9htV2SGwLt6emDZN/bpEd45YcTnrEUyE4+M
 GF6g==
X-Gm-Message-State: AOAM533coebvrbHClCbQB7erFLb5Q0irecapVV1uBX2kvwD2cSbNZaYa
 x4GY7p/MpVDLVtT7ke//DrA+bA==
X-Google-Smtp-Source: ABdhPJwhWW2FKMdz5QWHY1gDm4SfWEiZWUN4x/x/XeM/S3lcK/2Fw2nksrYWBUAFdZ4cCQ4s9HgLRA==
X-Received: by 2002:a0c:fca2:: with SMTP id h2mr780250qvq.5.1631555888517;
 Mon, 13 Sep 2021 10:58:08 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id l126sm5881126qke.96.2021.09.13.10.58.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 Sep 2021 10:58:08 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Cc: Sean Paul <seanpaul@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 13 Sep 2021 13:57:34 -0400
Message-Id: <20210913175747.47456-4-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210913175747.47456-1-sean@poorly.run>
References: <20210913175747.47456-1-sean@poorly.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 03/14] drm/hdcp: Update property value on
 content type and user changes
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

From: Sean Paul <seanpaul@chromium.org>

This patch updates the connector's property value in 2 cases which were
previously missed:

1- Content type changes. The value should revert back to DESIRED from
   ENABLED in case the driver must re-authenticate the link due to the
   new content type.

2- Userspace sets value to DESIRED while ENABLED. In this case, the
   value should be reset immediately to ENABLED since the link is
   actively being encrypted.

To accommodate these changes, I've split up the conditionals to make
things a bit more clear (as much as one can with this mess of state).

Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/drm_hdcp.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_hdcp.c b/drivers/gpu/drm/drm_hdcp.c
index dd8fa91c51d6..742313ce8f6f 100644
--- a/drivers/gpu/drm/drm_hdcp.c
+++ b/drivers/gpu/drm/drm_hdcp.c
@@ -487,21 +487,29 @@ bool drm_hdcp_atomic_check(struct drm_connector *connector,
 		return true;
 
 	/*
-	 * Nothing to do if content type is unchanged and one of:
-	 *  - state didn't change
+	 * Content type changes require an HDCP disable/enable cycle.
+	 */
+	if (new_conn_state->hdcp_content_type != old_conn_state->hdcp_content_type) {
+		new_conn_state->content_protection =
+			DRM_MODE_CONTENT_PROTECTION_DESIRED;
+		return true;
+	}
+
+	/*
+	 * Ignore meaningless state changes:
 	 *  - HDCP was activated since the last commit
-	 *  - attempting to set to desired while already enabled
+	 *  - Attempting to set to desired while already enabled
 	 */
-	if (old_hdcp == new_hdcp ||
-	    (old_hdcp == DRM_MODE_CONTENT_PROTECTION_DESIRED &&
+	if ((old_hdcp == DRM_MODE_CONTENT_PROTECTION_DESIRED &&
 	     new_hdcp == DRM_MODE_CONTENT_PROTECTION_ENABLED) ||
 	    (old_hdcp == DRM_MODE_CONTENT_PROTECTION_ENABLED &&
 	     new_hdcp == DRM_MODE_CONTENT_PROTECTION_DESIRED)) {
-		if (old_conn_state->hdcp_content_type ==
-				new_conn_state->hdcp_content_type)
-			return false;
+		new_conn_state->content_protection =
+			DRM_MODE_CONTENT_PROTECTION_ENABLED;
+	     return false;
 	}
 
-	return true;
+	/* Finally, if state changes, we need action */
+	return old_hdcp != new_hdcp;
 }
 EXPORT_SYMBOL(drm_hdcp_atomic_check);
-- 
Sean Paul, Software Engineer, Google / Chromium OS

