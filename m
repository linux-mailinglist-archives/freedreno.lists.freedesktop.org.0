Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74744376BAC
	for <lists+freedreno@lfdr.de>; Fri,  7 May 2021 23:25:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 757196EE8C;
	Fri,  7 May 2021 21:25:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB1B06EEA1
 for <freedreno@lists.freedesktop.org>; Fri,  7 May 2021 21:25:10 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id x188so8797001pfd.7
 for <freedreno@lists.freedesktop.org>; Fri, 07 May 2021 14:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w7qU0L4Ghb4CDxo7QXwP01EaDZwAPCg8iNdM0vaFanE=;
 b=XdgUX9BU0EfF9iq2Mk1qPxb4M/jFLVcOTOOyxD2foBPY44oz9rXJk3Kq3i89V2iGLW
 8XxDpYb/vIFYQbe8Njb7uHTHqUE6JheauBLmHiUbew7fMZS/gEb6x7z3iUt8NhloLm38
 9DLvJNyuY8XNbfbVPV+jjpAP8P8w2RSRkAeNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w7qU0L4Ghb4CDxo7QXwP01EaDZwAPCg8iNdM0vaFanE=;
 b=ZYofXWWc3YrpTp2c1tiLlsEnrG0wg7MdcUJU4nrwQNiJ0rXMQqlDyTIasnVTDsMSNZ
 hA2Ab4ysp860QbEDyzvH1gJiUeXP0VV8CgXl7/As9Ot3yrB6jVetVQvlUJ8/+hjFfhZW
 IB27N4CQnL5GNvzZWt4TDDPmVRk3RpURkUDun1yCmMTPIFT7GLSIl3lb39ix2g6SN6xy
 mZeE9yaEmUMIGaXJBuEeiugF9CgKLr0XS+YKigTxA/nzS/VOKvKmUJ893yKwcpD0NGDY
 xLhtEWyB+Px5d3Amc3275Nik37BfIDH89o2q6UE9hPr1Oxx/phZZuuEkc/ZUs/or05sG
 p4CA==
X-Gm-Message-State: AOAM531HlYR64gZQjCR7BlWvVV1MZSqSoBwAfoa3l2Pt+k4bW6kZKtm+
 fyWhRy6QWpeS3rRJf1GBoZ7vsA==
X-Google-Smtp-Source: ABdhPJzuXnkaex5EPKxyYb3+tGce0cj1UnpTZAtXkCnSy3u/dQq7nXNraVXLIaMKOLAN0jEAZSUr7w==
X-Received: by 2002:a63:a64:: with SMTP id z36mr12037116pgk.342.1620422709512; 
 Fri, 07 May 2021 14:25:09 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:ab8b:4a3d:46ab:361c])
 by smtp.gmail.com with ESMTPSA id t1sm4996298pjo.33.2021.05.07.14.25.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 14:25:09 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Rob Clark <robdclark@gmail.com>
Date: Fri,  7 May 2021 14:25:04 -0700
Message-Id: <20210507212505.1224111-3-swboyd@chromium.org>
X-Mailer: git-send-email 2.31.1.607.g51e8a6a459-goog
In-Reply-To: <20210507212505.1224111-1-swboyd@chromium.org>
References: <20210507212505.1224111-1-swboyd@chromium.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 2/3] drm/msm/dp: Shrink locking area of
 dp_aux_transfer()
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
Cc: Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <khsieh@codeaurora.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

We don't need to hold the lock to inspect the message we're going to
transfer, and we don't need to clear the busy flag either. Take the lock
later and bail out earlier if conditions aren't met.

Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Kuogee Hsieh <khsieh@codeaurora.org>
Cc: aravindh@codeaurora.org
Cc: Sean Paul <sean@poorly.run>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/dp/dp_aux.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index 91188466cece..b49810396513 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -329,30 +329,29 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
 	ssize_t ret;
 	int const aux_cmd_native_max = 16;
 	int const aux_cmd_i2c_max = 128;
-	struct dp_aux_private *aux = container_of(dp_aux,
-		struct dp_aux_private, dp_aux);
+	struct dp_aux_private *aux;
 
-	mutex_lock(&aux->mutex);
+	aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
 
 	aux->native = msg->request & (DP_AUX_NATIVE_WRITE & DP_AUX_NATIVE_READ);
 
 	/* Ignore address only message */
-	if ((msg->size == 0) || (msg->buffer == NULL)) {
+	if (msg->size == 0 || !msg->buffer) {
 		msg->reply = aux->native ?
 			DP_AUX_NATIVE_REPLY_ACK : DP_AUX_I2C_REPLY_ACK;
-		ret = msg->size;
-		goto unlock_exit;
+		return msg->size;
 	}
 
 	/* msg sanity check */
-	if ((aux->native && (msg->size > aux_cmd_native_max)) ||
-		(msg->size > aux_cmd_i2c_max)) {
+	if ((aux->native && msg->size > aux_cmd_native_max) ||
+	    msg->size > aux_cmd_i2c_max) {
 		DRM_ERROR("%s: invalid msg: size(%zu), request(%x)\n",
 			__func__, msg->size, msg->request);
-		ret = -EINVAL;
-		goto unlock_exit;
+		return -EINVAL;
 	}
 
+	mutex_lock(&aux->mutex);
+
 	dp_aux_update_offset_and_segment(aux, msg);
 	dp_aux_transfer_helper(aux, msg, true);
 
-- 
https://chromeos.dev

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
