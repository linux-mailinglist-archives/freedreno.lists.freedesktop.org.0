Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 257785154F6
	for <lists+freedreno@lfdr.de>; Fri, 29 Apr 2022 21:57:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C516C10EFAA;
	Fri, 29 Apr 2022 19:57:35 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65A6010EFAA
 for <freedreno@lists.freedesktop.org>; Fri, 29 Apr 2022 19:57:35 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id g16so6231937lja.3
 for <freedreno@lists.freedesktop.org>; Fri, 29 Apr 2022 12:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yjiWSb36gHEJ1pupckIvzivsOKw4TFaRqlM2gJWlkeg=;
 b=lij9fO8pcjPHTrP1kFRt0lMkgTB2GXTjLFrp7Ml+bSuhx8qXYRZUUM42O0AINyVr+0
 YKtq1VPjsf9iZScpJ/jqI8BVh9dlQIuuNZVp4agu1ayr/9awisvXtlEf5CVj4qEFwtYk
 hbrvGU2UZNRs33SNozRgh4I0hJzjwr05bDvPb/b4rABV8x6Y7vwaFMKF/vJlNoOL+abP
 93JKf0x0F6qLx4GgZjgZ0q16HWPI4tMUXVJ0VLegU0IMtGIIaRR90fsS4h/lEMu39811
 tzLiBEEzuQ7hDxPP5apqrXcg3aCUM4nOmfELNwNNkuBHScBAgWGDln5S166E0LeI1HnT
 J7rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yjiWSb36gHEJ1pupckIvzivsOKw4TFaRqlM2gJWlkeg=;
 b=IgJ5yBC91pipL0LW+oMm4ajD54UOp0lB6AGNwoIOZKIRyjCPi4D3jEq9nHc8EB/IXQ
 h6E/RcSKsTw5Vi+8O4z9TcHGGj14mAb1XNNczZDC/OOEbgzrL5xRFrUAQsA3mwF2fdIZ
 Aisy26P4IMch0A/+zV8i9gM4oVyWR62PcxHehq5E209+2ijE2qCsNqHv/KrGnZODMj0N
 7WtXX+uJgPvlgienqmjWe2RAxqansaZOOk0hqTVCm9b6/LMqgpSYd8URzS2qRfrFfK7b
 NTCKXgc9IJpV9wJRD5HPCPqnsPulCMYIZ069g0NqtWzIGfB2ZuRdx4bqzRALwC0g0QXK
 HKKw==
X-Gm-Message-State: AOAM530For4roZFgygBpSja5Ap8O9icBHHJ5GE2tq5jUSR8gqXfHIyvg
 POk0Y1yxdajzKewVp+ZPdnKONg==
X-Google-Smtp-Source: ABdhPJzR5DzzxHAxz5dGqxksq45CF6WCBsx4G187PW4k6MkQh7rOCWAka06NGoLxJqkXPm4p4zoQ8A==
X-Received: by 2002:a2e:a5cb:0:b0:24f:233b:d90e with SMTP id
 n11-20020a2ea5cb000000b0024f233bd90emr501851ljp.83.1651262253549; 
 Fri, 29 Apr 2022 12:57:33 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 j17-20020ac253b1000000b0047255d2118csm10601lfh.187.2022.04.29.12.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 12:57:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Date: Fri, 29 Apr 2022 22:57:27 +0300
Message-Id: <20220429195731.3716446-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429195731.3716446-1-dmitry.baryshkov@linaro.org>
References: <20220429195731.3716446-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PATCH v2 1/5] drm/bridge_connector: stop filtering
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

