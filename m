Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 421944FC601
	for <lists+freedreno@lfdr.de>; Mon, 11 Apr 2022 22:48:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 446EF10F5C5;
	Mon, 11 Apr 2022 20:47:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [IPv6:2607:f8b0:4864:20::f30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19BBB10F5C9
 for <freedreno@lists.freedesktop.org>; Mon, 11 Apr 2022 20:47:56 +0000 (UTC)
Received: by mail-qv1-xf30.google.com with SMTP id hu11so14587441qvb.7
 for <freedreno@lists.freedesktop.org>; Mon, 11 Apr 2022 13:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eZTFgk2PlOb2uX5DBLkodsIU99rGYqliJsfWbZUnqrI=;
 b=feOSLuohBZPid21skzUboSH9MUJO3gzoRRROo05qdqfQmiia/8S9eRrtRtif8w7MYo
 p/bmtN7Yd/xypOYREnKt4rj48ZAqgGGINF6wV3LW5URZAbw4VUWS2PJ4mvlhgWY45Na6
 3bZugjsS+6zE4AKwiz8RcXaB8jLdKNF53kMedejl4y6KuqR16nNNESeHmgMGhuJDl+Hf
 IUrAYtDtn2LvPvCwOf39cHHo/6b6oWFkx5HNZ6TSLIMlC/j8qZ0fNwa9MG6XjtgpU+0/
 mPkQe0xOOFWiQJQTTBL4z/daHOgGZ/95QmOMUuJFeO2fidd3ia4TgxBrK0JpgTZQCs8s
 XAGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eZTFgk2PlOb2uX5DBLkodsIU99rGYqliJsfWbZUnqrI=;
 b=2i8y1v8EmqrhNRepmAVh7Ra865ZTAjpJB1mGcek+yr/ldhZrWXTSZiVUpVWCFkvVfZ
 47+rplzv+OciivrTGMT1f10KxM2EWe6e3Ck9JxXbC+gonkEW8q2Adng9gT0qRYjyQ8eP
 2q2485DhOOttZGJJBBSSDllMsMcJjKWbY0pr5IECJ4RMzY+2Q0dD6G3+bC4gZiPkUy1z
 TInxqHJgty8maN8gZKt/qZsxzqJiCfI7XE45RsGbTO+oyJsNmjJPT80sxQjlfLMoodBf
 oZZbj4glzD/TMPjvyE1fFKYIR2Ug2nKTAyQCvnBNTz8Rxm8qAKN6ahCb0QzQLtnK1eCP
 zSEA==
X-Gm-Message-State: AOAM533mw58xxdFYC4R5PjZNPIZ1k0CzKT2NLIxeCysAMNDhznJONp9L
 mamAhVlrUwHoMrsQcw7TsrKxYA==
X-Google-Smtp-Source: ABdhPJyJqqU9Utf/ym7pO8+eXG3CRvVhOBx+aDqhfrPobdZzfUtHf7vSW4trtdvw2W+FtAIdMe03mw==
X-Received: by 2002:ad4:5968:0:b0:444:1749:a6f4 with SMTP id
 eq8-20020ad45968000000b004441749a6f4mr951719qvb.43.1649710075136; 
 Mon, 11 Apr 2022 13:47:55 -0700 (PDT)
Received: from localhost (115.25.199.35.bc.googleusercontent.com.
 [35.199.25.115]) by smtp.gmail.com with ESMTPSA id
 r19-20020a05620a299300b0069c39a56b19sm577319qkp.129.2022.04.11.13.47.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 13:47:54 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Date: Mon, 11 Apr 2022 20:47:32 +0000
Message-Id: <20220411204741.1074308-4-sean@poorly.run>
X-Mailer: git-send-email 2.35.1.1178.g4f1659d476-goog
In-Reply-To: <20220411204741.1074308-1-sean@poorly.run>
References: <20220411204741.1074308-1-sean@poorly.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v5 03/10] drm/hdcp: Update property value on
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
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 markyacoub@chromium.org, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 abhinavk@codeaurora.org, swboyd@chromium.org,
 Sean Paul <seanpaul@chromium.org>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, bjorn.andersson@linaro.org
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

Acked-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-4-sean@poorly.run #v1
Link: https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-4-sean@poorly.run #v2
Link: https://patchwork.freedesktop.org/patch/msgid/20211001151145.55916-4-sean@poorly.run #v3
Link: https://patchwork.freedesktop.org/patch/msgid/20211105030434.2828845-4-sean@poorly.run #v4

Changes in v2:
-None
Changes in v3:
-Fixed indentation issue identified by 0-day
Changes in v4:
-None
Changes in v5:
-None
---
 drivers/gpu/drm/drm_hdcp.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_hdcp.c b/drivers/gpu/drm/drm_hdcp.c
index dd8fa91c51d6..8c851d40cd45 100644
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
+		return false;
 	}
 
-	return true;
+	/* Finally, if state changes, we need action */
+	return old_hdcp != new_hdcp;
 }
 EXPORT_SYMBOL(drm_hdcp_atomic_check);
-- 
Sean Paul, Software Engineer, Google / Chromium OS

