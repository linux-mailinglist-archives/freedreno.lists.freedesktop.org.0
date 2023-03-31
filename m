Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBE46D2B04
	for <lists+freedreno@lfdr.de>; Sat,  1 Apr 2023 00:12:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82E4610F30F;
	Fri, 31 Mar 2023 22:12:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0142610F337
 for <freedreno@lists.freedesktop.org>; Fri, 31 Mar 2023 22:12:23 +0000 (UTC)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-5419d4c340aso440563357b3.11
 for <freedreno@lists.freedesktop.org>; Fri, 31 Mar 2023 15:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1680300742;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=41g0gNip8PYtsk9bkFs48ZdWfSIXcjOsD7LB6Xshlhc=;
 b=lHoMWIFJTuqI+8Cwf2cHlVcCn/m4jjolUFhI/WQbjtrqeI/y/RQdSMCUS5dRtKjPDb
 DlYjsOvV/xD5u3tQVGIShaYjyddVjs0gbX1g0+nKv3YfRrFw3cVlycus6fwJF0Zj8bWv
 hCFALCWenLouG3eC+5I+lZSlO9QWPFxR7oe+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680300742;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=41g0gNip8PYtsk9bkFs48ZdWfSIXcjOsD7LB6Xshlhc=;
 b=gD53t/sjLN6W/27NLhHlguVN5pdV8OqTWYLR1/+G1gizQr+IerXFWdYfj0+bqSN+T/
 sXWONx5p3jf1hzvuBS8kNqia76Y+DTmBp99BAYORC8nnaL4g6gy2VTMiT0Nmu3699eTY
 84DIeLLijMkwjbEsIjZUBsW+xvPDD1MG3IWScTBsSvNJq5WMyFALdBk6hhQjrvmEdoEh
 u+Wzu6Wzq22puQLFZ37glXZo3snyAEEtH1tinx8R0uW1Wq0pN4Il0EIIXN/4ebGuw5gK
 L+w9NyKgf2X7kR6QZQrLIPvJ43vVGifY9E3VQ0phaQx7wqgDaWQjLhxm2fFdmGaMQteZ
 f4+w==
X-Gm-Message-State: AAQBX9d/XlGbsq2eDvIUCPf+hjxARHfJosjGt2UG3UGGeDzdWrEIuF/g
 idJaunRAmhrwhQigvLl8oFylaQ==
X-Google-Smtp-Source: AKy350aWWLZitIc4NBmciDyuRlAlsMqjsbroWOg1uVcQuHufgHyzzdwjAPbP0Au4zEn/DHJnbrYMYw==
X-Received: by 2002:a81:7508:0:b0:544:e183:762d with SMTP id
 q8-20020a817508000000b00544e183762dmr29564744ywc.37.1680300742109; 
 Fri, 31 Mar 2023 15:12:22 -0700 (PDT)
Received: from localhost ([2620:0:1035:15:a8f6:869a:3ef5:e1d])
 by smtp.gmail.com with UTF8SMTPSA id
 bj5-20020a05690c044500b00545a0818501sm763457ywb.145.2023.03.31.15.12.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 15:12:21 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
X-Google-Original-From: Mark Yacoub <markyacoub@google.com>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 31 Mar 2023 18:12:05 -0400
Message-Id: <20230331221213.1691997-4-markyacoub@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
In-Reply-To: <20230331221213.1691997-1-markyacoub@google.com>
References: <20230331221213.1691997-1-markyacoub@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v8 03/10] drm/hdcp: Update property value on
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
Cc: suraj.kandpal@intel.com, Jani Nikula <jani.nikula@intel.com>,
 Mark Yacoub <markyacoub@chromium.org>, intel-gfx@lists.freedesktop.org,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, seanpaul@chromium.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

Update the connector's property value in 2 cases which were
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
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Signed-off-by: Mark Yacoub <markyacoub@chromium.org>

---
Changes in v2:
-None
Changes in v3:
-Fixed indentation issue identified by 0-day
Changes in v4:
-None
Changes in v5:
-None
Changes in v6:
-Rebased: modifications in drm_hdcp_helper.c instead of drm_hdcp.c
Changes in v7:
-Rebased as function name has changed.
Changes in v8:
-None

 drivers/gpu/drm/display/drm_hdcp_helper.c | 29 +++++++++++++++--------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdcp_helper.c b/drivers/gpu/drm/display/drm_hdcp_helper.c
index 34baf2b97cd87..3ee1a6ae26c53 100644
--- a/drivers/gpu/drm/display/drm_hdcp_helper.c
+++ b/drivers/gpu/drm/display/drm_hdcp_helper.c
@@ -480,21 +480,30 @@ bool drm_hdcp_has_changed(struct drm_connector *connector,
 		return true;
 
 	/*
-	 * Nothing to do if content type is unchanged and one of:
-	 *  - state didn't change
-	 *  - HDCP was activated since the last commit
-	 *  - attempting to set to desired while already enabled
+	 * Content type changes require an HDCP disable/enable cycle.
 	 */
-	if (old_hdcp == new_hdcp ||
-	    (old_hdcp == DRM_MODE_CONTENT_PROTECTION_DESIRED &&
+	if (new_conn_state->hdcp_content_type !=
+	    old_conn_state->hdcp_content_type) {
+		new_conn_state->content_protection =
+			DRM_MODE_CONTENT_PROTECTION_DESIRED;
+		return true;
+	}
+
+	/*
+	 * Ignore meaningless state changes:
+ 	 *  - HDCP was activated since the last commit
+	 *  - Attempting to set to desired while already enabled
+ 	 */
+	if ((old_hdcp == DRM_MODE_CONTENT_PROTECTION_DESIRED &&
 	     new_hdcp == DRM_MODE_CONTENT_PROTECTION_ENABLED) ||
 	    (old_hdcp == DRM_MODE_CONTENT_PROTECTION_ENABLED &&
 	     new_hdcp == DRM_MODE_CONTENT_PROTECTION_DESIRED)) {
-		if (old_conn_state->hdcp_content_type ==
-		    new_conn_state->hdcp_content_type)
-			return false;
+		new_conn_state->content_protection =
+			DRM_MODE_CONTENT_PROTECTION_ENABLED;
+		return false;
 	}
 
-	return true;
+	/* Finally, if state changes, we need action */
+	return old_hdcp != new_hdcp;
 }
 EXPORT_SYMBOL(drm_hdcp_has_changed);
-- 
2.40.0.348.gf938b09366-goog

