Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 149C0445E50
	for <lists+freedreno@lfdr.de>; Fri,  5 Nov 2021 04:05:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 383626E5A2;
	Fri,  5 Nov 2021 03:05:28 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 364CC6E58E
 for <freedreno@lists.freedesktop.org>; Fri,  5 Nov 2021 03:05:25 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id bk22so7661425qkb.6
 for <freedreno@lists.freedesktop.org>; Thu, 04 Nov 2021 20:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xv7HG/Q+S/fL5JaTuonxECkNCYcwf+YUpIYNlE1OLuA=;
 b=G0mnld0dMm0VxznH8Ud5Dg05i6jsVWo3+IaaczBhvKR6gHY7wCpK8tSO7uGIInKHVe
 HOJsIx6IEPcx8Dq2No9Ya3LHXW3FYZ6k68YbPbKdwD/4GR44GQmpiVJR6kU6cgFgnUPe
 E+UKZvmj4QoHwE5VbnPjOTaHqWp8ORsKnjL83f7PSh9S8EROPZuW8UMwXu9Eaqgohd4N
 0TC4rakOzWnT9GhZ3nmkzXJQGZegSjliC0ifXn6Aru6lsUHlfyYHjmi69Ws5zWH8vC3l
 AUCmSDtu6udS13HZ+N/JC4K4jV2kdJmQt0aiq5zdXRMoMiTPDNQd1jb6/BPXnW0JwHmM
 JuUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xv7HG/Q+S/fL5JaTuonxECkNCYcwf+YUpIYNlE1OLuA=;
 b=qbMBjBw6PAAlzi8pBtQR39dF1RCa5S0niujbaZfXJ+C53qET0YeGpftW39AlMtOrx4
 io+claQlBd93w7EvF90MYqhiylGm9tQF5ZkmaZjlMnKEbAfOHSD3Q64ivir5EyQY2wAH
 1t1/Ty85QVQ3y6B4NUg1Ef/GApuA0ZxSRmgkK2KK5LwKTU7kVpx/9icocXV9nA2kvhG0
 lauUMtkWyMxn1wHrOaEDjfRtlUV5Z28eQjAUtO1NanIgQV9x3xpWhQ1MRs9XxQjR4bL9
 TTuMS4+/NAQmR67SXXQYVNudMooxFQ7tSiowKKjnpn1Z40CEdL8u+guNyMDOH0wvXPw5
 h38Q==
X-Gm-Message-State: AOAM531ioyXgO7JCnPzV3y3qvh6PG76H8Wp6Z8MfRxk4C9/ErDg57tn5
 3xCw8+wjfSQsMOKHxXyWhQgglw==
X-Google-Smtp-Source: ABdhPJygzG95k4Zn6GZwVmYDW+120k0m+f9VXzNWsZgmBSDaREhsbJgYBcWCqYqOZQVrTTNxxcr6Pw==
X-Received: by 2002:a05:620a:20d9:: with SMTP id
 f25mr12159152qka.54.1636081524408; 
 Thu, 04 Nov 2021 20:05:24 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id bq30sm5052740qkb.6.2021.11.04.20.05.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 20:05:24 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Date: Thu,  4 Nov 2021 23:04:26 -0400
Message-Id: <20211105030434.2828845-10-sean@poorly.run>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211105030434.2828845-1-sean@poorly.run>
References: <20211105030434.2828845-1-sean@poorly.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 09/14] drm/msm/dpu: Remove useless checks in
 dpu_encoder
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
Cc: jani.nikula@intel.com, linux-arm-msm@vger.kernel.org,
 abhinavk@codeaurora.org, swboyd@chromium.org, David Airlie <airlied@linux.ie>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, bjorn.andersson@linaro.org,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

A couple more useless checks to remove in dpu_encoder.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-10-sean@poorly.run #v1
Link: https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-10-sean@poorly.run #v2
Link: https://patchwork.freedesktop.org/patch/msgid/20211001151145.55916-10-sean@poorly.run #v3

Changes in v2:
-None
Changes in v3:
-None
Changes in v4:
-None
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index e7ee4cfb8461..cc57c615be67 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1148,10 +1148,6 @@ static void dpu_encoder_virt_enable(struct drm_encoder *drm_enc)
 	struct msm_drm_private *priv;
 	struct drm_display_mode *cur_mode = NULL;
 
-	if (!drm_enc) {
-		DPU_ERROR("invalid encoder\n");
-		return;
-	}
 	dpu_enc = to_dpu_encoder_virt(drm_enc);
 
 	mutex_lock(&dpu_enc->enc_lock);
@@ -1197,14 +1193,6 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
 	struct msm_drm_private *priv;
 	int i = 0;
 
-	if (!drm_enc) {
-		DPU_ERROR("invalid encoder\n");
-		return;
-	} else if (!drm_enc->dev) {
-		DPU_ERROR("invalid dev\n");
-		return;
-	}
-
 	dpu_enc = to_dpu_encoder_virt(drm_enc);
 	DPU_DEBUG_ENC(dpu_enc, "\n");
 
-- 
Sean Paul, Software Engineer, Google / Chromium OS

