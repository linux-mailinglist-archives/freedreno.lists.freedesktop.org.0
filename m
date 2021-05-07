Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87935376BAD
	for <lists+freedreno@lfdr.de>; Fri,  7 May 2021 23:25:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AD3E6EE90;
	Fri,  7 May 2021 21:25:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CED66EEA3
 for <freedreno@lists.freedesktop.org>; Fri,  7 May 2021 21:25:10 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id i14so8299478pgk.5
 for <freedreno@lists.freedesktop.org>; Fri, 07 May 2021 14:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oPhUQbXG7R8X2jOQyavNRDbK8zQ1lt29JM0olvEd6PQ=;
 b=YXdR3h0ajhLbtUPggFTKw7aRLvQEPxVypdSmdKuTcPNmu2BkdbFaNrh21YYwZkcU3S
 8HI6uCRQYUt+r/0NcM04/b8g/qLDmYsKYkNOPqnxtTv2ISHnuyTtGtXNqUHZgyW4c4XD
 ibH8rzVa1r4Ak8ubuD+e2u9Qd9cCCt4231sgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oPhUQbXG7R8X2jOQyavNRDbK8zQ1lt29JM0olvEd6PQ=;
 b=Hkm82emXN67DxQx8eb4Ov3YfmSRUIiiQOOadvKz0GPtI9POgdN2vi0Ozt/At0CCwAQ
 lRnnkm1deeXLTxu2I1Iwx9c/Fg9tu5aUMDPRLy3s30qDtyXpMA+V6yBpXBigvyDJkh47
 h1bMCysFzPvQIepq2UQmodNCvFm/1jCSzL7tf0Dqe/tW68KV+R6+Ukx07hSRnRYLXy41
 NJdz6RRbtSfZmlZn4Zx02j7C4xKoZgN0rdAplIZNmjGUsfwngRIQx/+hbjfVtWwWMGPh
 D9K9KIgqcMfAwiw/St/yEwasT2bn7PC5nmFSvSsiPkTdwz7oaQydwvEPf+kFWh4r7ySr
 bDQA==
X-Gm-Message-State: AOAM531JcqYXetz7gzXJRoqCf3p/VbQOx9uZnlKTbB3dDKGfEgnuMyCq
 Y6uwO9a3LPiO9ZzBaaz2JqQvsw==
X-Google-Smtp-Source: ABdhPJyEMXQEvGTkBlCsP+Gb6Sbe/3bU5vBg3c5J0yYX7KTOUksQ/Habp7gr4cjV345Pp2XDZWPlBg==
X-Received: by 2002:a65:4185:: with SMTP id a5mr11906182pgq.388.1620422710622; 
 Fri, 07 May 2021 14:25:10 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:ab8b:4a3d:46ab:361c])
 by smtp.gmail.com with ESMTPSA id t1sm4996298pjo.33.2021.05.07.14.25.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 14:25:10 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Rob Clark <robdclark@gmail.com>
Date: Fri,  7 May 2021 14:25:05 -0700
Message-Id: <20210507212505.1224111-4-swboyd@chromium.org>
X-Mailer: git-send-email 2.31.1.607.g51e8a6a459-goog
In-Reply-To: <20210507212505.1224111-1-swboyd@chromium.org>
References: <20210507212505.1224111-1-swboyd@chromium.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 3/3] drm/msm/dp: Handle aux timeouts, nacks,
 defers
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

Let's look at the irq status bits after a transfer and see if we got a
nack or a defer or a timeout, instead of telling drm layers that
everything was fine, while still printing an error message. I wasn't
sure about NACK+DEFER so I lumped all those various errors along with a
nack so that the drm core can figure out that things are just not going
well. The important thing is that we're now returning -ETIMEDOUT when
the message times out and nacks for bad addresses.

Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Kuogee Hsieh <khsieh@codeaurora.org>
Cc: aravindh@codeaurora.org
Cc: Sean Paul <sean@poorly.run>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/dp/dp_aux.c | 140 ++++++++++++++------------------
 drivers/gpu/drm/msm/dp/dp_aux.h |   8 --
 2 files changed, 61 insertions(+), 87 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index b49810396513..4a3293b590b0 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -9,7 +9,15 @@
 #include "dp_reg.h"
 #include "dp_aux.h"
 
-#define DP_AUX_ENUM_STR(x)		#x
+enum msm_dp_aux_err {
+	DP_AUX_ERR_NONE,
+	DP_AUX_ERR_ADDR,
+	DP_AUX_ERR_TOUT,
+	DP_AUX_ERR_NACK,
+	DP_AUX_ERR_DEFER,
+	DP_AUX_ERR_NACK_DEFER,
+	DP_AUX_ERR_PHY,
+};
 
 struct dp_aux_private {
 	struct device *dev;
@@ -18,7 +26,7 @@ struct dp_aux_private {
 	struct mutex mutex;
 	struct completion comp;
 
-	u32 aux_error_num;
+	enum msm_dp_aux_err aux_error_num;
 	u32 retry_cnt;
 	bool cmd_busy;
 	bool native;
@@ -33,62 +41,45 @@ struct dp_aux_private {
 
 #define MAX_AUX_RETRIES			5
 
-static const char *dp_aux_get_error(u32 aux_error)
-{
-	switch (aux_error) {
-	case DP_AUX_ERR_NONE:
-		return DP_AUX_ENUM_STR(DP_AUX_ERR_NONE);
-	case DP_AUX_ERR_ADDR:
-		return DP_AUX_ENUM_STR(DP_AUX_ERR_ADDR);
-	case DP_AUX_ERR_TOUT:
-		return DP_AUX_ENUM_STR(DP_AUX_ERR_TOUT);
-	case DP_AUX_ERR_NACK:
-		return DP_AUX_ENUM_STR(DP_AUX_ERR_NACK);
-	case DP_AUX_ERR_DEFER:
-		return DP_AUX_ENUM_STR(DP_AUX_ERR_DEFER);
-	case DP_AUX_ERR_NACK_DEFER:
-		return DP_AUX_ENUM_STR(DP_AUX_ERR_NACK_DEFER);
-	default:
-		return "unknown";
-	}
-}
-
-static u32 dp_aux_write(struct dp_aux_private *aux,
+static ssize_t dp_aux_write(struct dp_aux_private *aux,
 			struct drm_dp_aux_msg *msg)
 {
-	u32 data[4], reg, len;
+	u8 data[4];
+	u32 reg;
+	ssize_t len;
 	u8 *msgdata = msg->buffer;
 	int const AUX_CMD_FIFO_LEN = 128;
 	int i = 0;
 
 	if (aux->read)
-		len = 4;
+		len = 0;
 	else
-		len = msg->size + 4;
+		len = msg->size;
 
 	/*
 	 * cmd fifo only has depth of 144 bytes
 	 * limit buf length to 128 bytes here
 	 */
-	if (len > AUX_CMD_FIFO_LEN) {
+	if (len > AUX_CMD_FIFO_LEN - 4) {
 		DRM_ERROR("buf size greater than allowed size of 128 bytes\n");
-		return 0;
+		return -EINVAL;
 	}
 
 	/* Pack cmd and write to HW */
-	data[0] = (msg->address >> 16) & 0xf; /* addr[19:16] */
+	data[0] = (msg->address >> 16) & 0xf;	/* addr[19:16] */
 	if (aux->read)
-		data[0] |=  BIT(4); /* R/W */
+		data[0] |=  BIT(4);		/* R/W */
 
-	data[1] = (msg->address >> 8) & 0xff;	/* addr[15:8] */
-	data[2] = msg->address & 0xff;		/* addr[7:0] */
-	data[3] = (msg->size - 1) & 0xff;	/* len[7:0] */
+	data[1] = msg->address >> 8;		/* addr[15:8] */
+	data[2] = msg->address;			/* addr[7:0] */
+	data[3] = msg->size - 1;		/* len[7:0] */
 
-	for (i = 0; i < len; i++) {
+	for (i = 0; i < len + 4; i++) {
 		reg = (i < 4) ? data[i] : msgdata[i - 4];
+		reg <<= DP_AUX_DATA_OFFSET;
+		reg &= DP_AUX_DATA_MASK;
+		reg |= DP_AUX_DATA_WRITE;
 		/* index = 0, write */
-		reg = (((reg) << DP_AUX_DATA_OFFSET)
-		       & DP_AUX_DATA_MASK) | DP_AUX_DATA_WRITE;
 		if (i == 0)
 			reg |= DP_AUX_DATA_INDEX_WRITE;
 		aux->catalog->aux_data = reg;
@@ -116,39 +107,27 @@ static u32 dp_aux_write(struct dp_aux_private *aux,
 	return len;
 }
 
-static int dp_aux_cmd_fifo_tx(struct dp_aux_private *aux,
+static ssize_t dp_aux_cmd_fifo_tx(struct dp_aux_private *aux,
 			      struct drm_dp_aux_msg *msg)
 {
-	u32 ret, len, timeout;
-	int aux_timeout_ms = HZ/4;
+	ssize_t ret;
+	unsigned long time_left;
 
 	reinit_completion(&aux->comp);
 
-	len = dp_aux_write(aux, msg);
-	if (len == 0) {
-		DRM_ERROR("DP AUX write failed\n");
-		return -EINVAL;
-	}
+	ret = dp_aux_write(aux, msg);
+	if (ret < 0)
+		return ret;
 
-	timeout = wait_for_completion_timeout(&aux->comp, aux_timeout_ms);
-	if (!timeout) {
-		DRM_ERROR("aux %s timeout\n", (aux->read ? "read" : "write"));
+	time_left = wait_for_completion_timeout(&aux->comp,
+						msecs_to_jiffies(250));
+	if (!time_left)
 		return -ETIMEDOUT;
-	}
-
-	if (aux->aux_error_num == DP_AUX_ERR_NONE) {
-		ret = len;
-	} else {
-		DRM_ERROR_RATELIMITED("aux err: %s\n",
-			dp_aux_get_error(aux->aux_error_num));
-
-		ret = -EINVAL;
-	}
 
 	return ret;
 }
 
-static void dp_aux_cmd_fifo_rx(struct dp_aux_private *aux,
+static ssize_t dp_aux_cmd_fifo_rx(struct dp_aux_private *aux,
 		struct drm_dp_aux_msg *msg)
 {
 	u32 data;
@@ -175,9 +154,10 @@ static void dp_aux_cmd_fifo_rx(struct dp_aux_private *aux,
 
 		actual_i = (data >> DP_AUX_DATA_INDEX_OFFSET) & 0xFF;
 		if (i != actual_i)
-			DRM_ERROR("Index mismatch: expected %d, found %d\n",
-				i, actual_i);
+			break;
 	}
+
+	return i;
 }
 
 static void dp_aux_native_handler(struct dp_aux_private *aux, u32 isr)
@@ -367,36 +347,38 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
 	}
 
 	ret = dp_aux_cmd_fifo_tx(aux, msg);
-
 	if (ret < 0) {
 		if (aux->native) {
 			aux->retry_cnt++;
 			if (!(aux->retry_cnt % MAX_AUX_RETRIES))
 				dp_catalog_aux_update_cfg(aux->catalog);
 		}
-		usleep_range(400, 500); /* at least 400us to next try */
-		goto unlock_exit;
-	}
-
-	if (aux->aux_error_num == DP_AUX_ERR_NONE) {
-		if (aux->read)
-			dp_aux_cmd_fifo_rx(aux, msg);
-
-		msg->reply = aux->native ?
-			DP_AUX_NATIVE_REPLY_ACK : DP_AUX_I2C_REPLY_ACK;
 	} else {
-		/* Reply defer to retry */
-		msg->reply = aux->native ?
-			DP_AUX_NATIVE_REPLY_DEFER : DP_AUX_I2C_REPLY_DEFER;
+		aux->retry_cnt = 0;
+		switch (aux->aux_error_num) {
+		case DP_AUX_ERR_NONE:
+			if (aux->read)
+				ret = dp_aux_cmd_fifo_rx(aux, msg);
+			msg->reply = aux->native ? DP_AUX_NATIVE_REPLY_ACK : DP_AUX_I2C_REPLY_ACK;
+			break;
+		case DP_AUX_ERR_DEFER:
+			msg->reply = aux->native ? DP_AUX_NATIVE_REPLY_DEFER : DP_AUX_I2C_REPLY_DEFER;
+			break;
+		case DP_AUX_ERR_PHY:
+		case DP_AUX_ERR_ADDR:
+		case DP_AUX_ERR_NACK:
+		case DP_AUX_ERR_NACK_DEFER:
+			msg->reply = aux->native ? DP_AUX_NATIVE_REPLY_NACK : DP_AUX_I2C_REPLY_NACK;
+			break;
+		case DP_AUX_ERR_TOUT:
+			ret = -ETIMEDOUT;
+			break;
+		}
 	}
 
-	/* Return requested size for success or retry */
-	ret = msg->size;
-	aux->retry_cnt = 0;
-
-unlock_exit:
 	aux->cmd_busy = false;
 	mutex_unlock(&aux->mutex);
+
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/msm/dp/dp_aux.h b/drivers/gpu/drm/msm/dp/dp_aux.h
index f8b8ba919465..0728cc09c9ec 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.h
+++ b/drivers/gpu/drm/msm/dp/dp_aux.h
@@ -9,14 +9,6 @@
 #include "dp_catalog.h"
 #include <drm/drm_dp_helper.h>
 
-#define DP_AUX_ERR_NONE		0
-#define DP_AUX_ERR_ADDR		-1
-#define DP_AUX_ERR_TOUT		-2
-#define DP_AUX_ERR_NACK		-3
-#define DP_AUX_ERR_DEFER	-4
-#define DP_AUX_ERR_NACK_DEFER	-5
-#define DP_AUX_ERR_PHY		-6
-
 int dp_aux_register(struct drm_dp_aux *dp_aux);
 void dp_aux_unregister(struct drm_dp_aux *dp_aux);
 void dp_aux_isr(struct drm_dp_aux *dp_aux);
-- 
https://chromeos.dev

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
