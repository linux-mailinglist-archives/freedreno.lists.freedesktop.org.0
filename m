Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A9E515475
	for <lists+freedreno@lfdr.de>; Fri, 29 Apr 2022 21:29:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B263810E1B7;
	Fri, 29 Apr 2022 19:29:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57E6010E1B7
 for <freedreno@lists.freedesktop.org>; Fri, 29 Apr 2022 19:29:33 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id h29so8491580lfj.2
 for <freedreno@lists.freedesktop.org>; Fri, 29 Apr 2022 12:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yjiWSb36gHEJ1pupckIvzivsOKw4TFaRqlM2gJWlkeg=;
 b=VvyHyWk9ss55mLpsJMhmDjLhAfzhgVwTosz5/KtUeXG8f7gtCjTHh9ta12MW8Q8Qv5
 4DCA1vAf+oNQJ5HTw+zih0F5/DyFy+nm53WCzwbk3uXoIyM8g/8pKcgK21gXn58WtvKA
 J4zl4mtbS1F+is88ser58AScok4CrSoRmJtjvvuNn1454jhm3si8OX9Qs6KdGc+I4Sgo
 RTcEoD6xMlh0TttERyIG4Zsvx0Pls4MCEJhOrW0XfLUoGWJVTMZPsBSPpFpBXd5mdirm
 hIGNDG+xAirjAo4pgoGFeJ08L39dxzZ1Xcn9luY4BXXFvAOC33bzkReV+4C0CRtn4fyG
 6shg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yjiWSb36gHEJ1pupckIvzivsOKw4TFaRqlM2gJWlkeg=;
 b=Apl5QWUjxoaKCtKcG5TIEAA+p6GXT/duZdyryX5B7Ud3dEfSmBUCUYzWXe+SGOZhqO
 bSKy5B+EYfc4N8f8lx2Ut7G4NB5L6f19He8tdN4zvem55TlTn1a5jD5Ye/XJ0ut8UCcT
 W8EbwLZA9NJKq0zWlUrqcp2LYqhr4tdyVfUcH8T05FPOlK2tz1bsrziVzDIx9O40+LiA
 LWXeG58xwjf9Ip1m0J6n/1u8IEIYuTMOMSeKapTOxRz7mCQOFlRHGeFypijh6HDTa8fW
 fOR4yTJurUgaPCNu5KSPyXqvQdOgsKQbcXow/UBpChmjhQlnXyHC5nHlbT6mANnd2jEL
 TStQ==
X-Gm-Message-State: AOAM530ZosJnIKLAgRPh5UVdQd0IZXh5Z4Z+mK3VmVC6JC0HJ1eIn+9U
 WSsahf9phV/YQ6mQnagAUrOeEuuTkLkoaA==
X-Google-Smtp-Source: ABdhPJwZsF+ismHXA1SwjcjwLTj06u3hcpcicsYABBKTikMY3EqCe2yKGTDrLfdc4eDJFLhtBjsEQw==
X-Received: by 2002:a05:6512:21cc:b0:46f:47c0:9c20 with SMTP id
 d12-20020a05651221cc00b0046f47c09c20mr572436lft.74.1651260571698; 
 Fri, 29 Apr 2022 12:29:31 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 y10-20020ac24e6a000000b0047255d211e7sm5522lfs.278.2022.04.29.12.29.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 12:29:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Date: Fri, 29 Apr 2022 22:29:25 +0300
Message-Id: <20220429192928.3697407-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429192928.3697407-1-dmitry.baryshkov@linaro.org>
References: <20220429192928.3697407-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PATCH 1/4] drm/bridge_connector: stop filtering
 events in drm_bridge_connector_hpd_cb()
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

In some cases the bridge drivers would like to receive hotplug events
even in the case new status is equal to the old status. In the DP case
this is used to deliver "attention" messages to the DP host. Stop
filtering the events in the drm_bridge_connector_hpd_cb() and let
drivers decide whether they would like to receive the event or not.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_bridge_connector.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
index 60923cdfe8e1..a0b742ebb330 100644
--- a/drivers/gpu/drm/drm_bridge_connector.c
+++ b/drivers/gpu/drm/drm_bridge_connector.c
@@ -113,16 +113,11 @@ static void drm_bridge_connector_hpd_cb(void *cb_data,
 	struct drm_bridge_connector *drm_bridge_connector = cb_data;
 	struct drm_connector *connector = &drm_bridge_connector->base;
 	struct drm_device *dev = connector->dev;
-	enum drm_connector_status old_status;
 
 	mutex_lock(&dev->mode_config.mutex);
-	old_status = connector->status;
 	connector->status = status;
 	mutex_unlock(&dev->mode_config.mutex);
 
-	if (old_status == status)
-		return;
-
 	drm_bridge_connector_hpd_notify(connector, status);
 
 	drm_kms_helper_hotplug_event(dev);
-- 
2.35.1

