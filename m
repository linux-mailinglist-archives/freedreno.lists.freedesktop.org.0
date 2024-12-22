Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DD69FA7EE
	for <lists+freedreno@lfdr.de>; Sun, 22 Dec 2024 21:14:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED42B10E110;
	Sun, 22 Dec 2024 20:14:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EMIfRPZ1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0393D10E16A
 for <freedreno@lists.freedesktop.org>; Sun, 22 Dec 2024 20:14:16 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2ffd6b7d77aso45760921fa.0
 for <freedreno@lists.freedesktop.org>; Sun, 22 Dec 2024 12:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734898454; x=1735503254; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=B5tbBwnpZQbD0yfgDnGnJ8OogrrRF+xt8+ZXSEBMtmg=;
 b=EMIfRPZ12IkZN5KYHLdUjl1hu4YQbNgMw7hNoHl1nfYJ0rLtgeNDEc5XzPJ+XEbJpP
 SdG213xGZnhTYvSD813DvtrYV97LwUBKTUFmT2Lc4bj2jnSpczKa0wSC/huptBn0Q3q1
 miNYxzOaniNBhAy4+2KUymGiz40Me+dQNgQAwcpBMUlRrK8tihqgjlnyJljIH66w0LAb
 iRZELAkhhNj3hqZGypC3x/ndbuaeSjlPqlVNJZn7/0V/RuptWk/CVbhvP8PrnHWXxOu8
 /Sjtu+cAWTGD0ydMvJ6RhE1d4k7QsW+/Zf6lTy5Zub/QhV3ftiwOp22aLVQpYGYTYB0d
 eN+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734898454; x=1735503254;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B5tbBwnpZQbD0yfgDnGnJ8OogrrRF+xt8+ZXSEBMtmg=;
 b=CeOP8pFocVSU+fv4HFquKgWJZ/Y370b/h1FDT1bIf4UB0pv8OrimTUD5I33OGMwk0s
 rXLTri1TCfRc3Amh5y1eVZtLPRqYFxwLWtLlZAgpyx4rub8wNTZny/NU/c655+Dabh4k
 cNl9PRpmL8XFF8bViXuPX8DLeX/FF/2DSzgWtfI4lNEqxLj2YWFhsCAN+s4E3PWOPE/C
 onJpzz80kHZm0oP+umwrNGh4eNZ+4PX/tQjkB1FWPpqH9gt2iMaXvvDJq5+f2cxUP5Jg
 gHn7yxa6SQncD723QtAo1wTgY+tr1E14JQO14g28d7eyezA1eVg73l+fRbR86Cq0fpE8
 D2tw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVu8j1NxBjCIUIsZQv1D5Sh8QxAe0EgX0GHlTHln0qOVIgn6Hh292EkQILr7RCZcbZsbiVd/lZyYL8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxOn+To0u5gQ0bm0Rz/KAzh/t0OYjV9iEOvFHYA23e1IuhHSzVo
 h+Zaepwlt/lbZapZbEE4wTGD0hbCsWzmUVTJjLzrmaUuE/Fsw99BqmWc8+JjEe4=
X-Gm-Gg: ASbGncsR/XuSn0zydH9yRy66mv2tA5Ys3Vp3jnSNFRLSmJcggDR6zuo5LVmxEZC5YS4
 T27uCVO/IqDPBEWxVn92Fkbl4GP39LYgvlYtb9EGFiAz8ZvraU7kIwwU+kqd7eupIWglLhWuIHi
 rw/22QKV7C8oLgh9zGqIJ3O7fkrWAyNdu1gMQ6cKAN99rcQayyD8wUWmxQ1f+mXV1zOnL5ubScK
 ROE14esCIP2PNLxJvbpt8k/VA7wcfWPvadxiTRIT9GC4s7Z2up4QCkrnzFwU3kO
X-Google-Smtp-Source: AGHT+IH2Ic5ZdSEegl4EaJ4Q3EhXIU4z8X7lRiyvx+Sp/ZxjxS25B473GBusBgE3FZdXHSzCT0dYlA==
X-Received: by 2002:a05:6512:1055:b0:540:269d:3017 with SMTP id
 2adb3069b0e04-54229533dbcmr3578999e87.18.1734898454265; 
 Sun, 22 Dec 2024 12:14:14 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542235f7765sm1034331e87.13.2024.12.22.12.14.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Dec 2024 12:14:13 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 22 Dec 2024 22:14:05 +0200
Subject: [PATCH v5 02/11] drm/msm/dp: read hw revision only once
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241222-fd-dp-audio-fixup-v5-2-370f09492cf6@linaro.org>
References: <20241222-fd-dp-audio-fixup-v5-0-370f09492cf6@linaro.org>
In-Reply-To: <20241222-fd-dp-audio-fixup-v5-0-370f09492cf6@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>, 
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4182;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ZQK3De9spKq2bOT0Hl1HvbbvggyGKbTI3+3PIdSsFLY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnaHMN64yI3FonnpxfQhjZ/o9sM5NujZ5qSSL8K
 l2ZABxBqVOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2hzDQAKCRCLPIo+Aiko
 1bwRB/9ZnCYL7Vg7RlwIqjQ2vzjSxspFT7p9mRiAqtYAz/4CsH/oX15+mFkWFAdKfLFybiqtTc9
 QDx39d/QmAb4GH5bq73+Iq73gNQPO7LG5bXvgeF6Kipx3/PAi/kwj02fr2ElA0CZ/EIfRDhd3gU
 YwDn28J8pfBBryxNy4crlFebxSZqpJ3MjMWcwW44czxBEi66vNl/uVZS3T0gqqBlD/JG8Wol6r7
 lyhPa9+88jCt6j8Rtqmj2R+1R8xZLSVCdIf7rX8e/hjhlf2+7R9S3n3LF+pSbGWEZJNz2LJu7r4
 8IxLVDfULxJ4WO033BQTMg3WYqeBGKVrCbW81OZRX8toH6RB
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

There is little point in rereading DP controller revision over and over
again. Read it once, after the first software reset.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org> # sc7180-trogdor
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 29 ++++++++---------------------
 drivers/gpu/drm/msm/dp/dp_catalog.h |  2 +-
 2 files changed, 9 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 4f80eceb6ae19f542110d7379007f57c2ac16a8a..23f9fcb75123a58b3a4b69d3dad0598135108eec 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -414,14 +414,13 @@ void msm_dp_catalog_ctrl_config_misc(struct msm_dp_catalog *msm_dp_catalog,
 
 void msm_dp_catalog_setup_peripheral_flush(struct msm_dp_catalog *msm_dp_catalog)
 {
-	u32 mainlink_ctrl, hw_revision;
+	u32 mainlink_ctrl;
 	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
 				struct msm_dp_catalog_private, msm_dp_catalog);
 
 	mainlink_ctrl = msm_dp_read_link(catalog, REG_DP_MAINLINK_CTRL);
 
-	hw_revision = msm_dp_catalog_hw_revision(msm_dp_catalog);
-	if (hw_revision >= DP_HW_VERSION_1_2)
+	if (msm_dp_catalog->hw_revision >= DP_HW_VERSION_1_2)
 		mainlink_ctrl |= DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE;
 	else
 		mainlink_ctrl |= DP_MAINLINK_FLUSH_MODE_UPDATE_SDP;
@@ -514,22 +513,6 @@ int msm_dp_catalog_ctrl_set_pattern_state_bit(struct msm_dp_catalog *msm_dp_cata
 	return 0;
 }
 
-/**
- * msm_dp_catalog_hw_revision() - retrieve DP hw revision
- *
- * @msm_dp_catalog: DP catalog structure
- *
- * Return: DP controller hw revision
- *
- */
-u32 msm_dp_catalog_hw_revision(const struct msm_dp_catalog *msm_dp_catalog)
-{
-	const struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
-
-	return msm_dp_read_ahb(catalog, REG_DP_HW_VERSION);
-}
-
 /**
  * msm_dp_catalog_ctrl_reset() - reset DP controller
  *
@@ -556,6 +539,9 @@ void msm_dp_catalog_ctrl_reset(struct msm_dp_catalog *msm_dp_catalog)
 
 	sw_reset &= ~DP_SW_RESET;
 	msm_dp_write_ahb(catalog, REG_DP_SW_RESET, sw_reset);
+
+	if (!msm_dp_catalog->hw_revision)
+		msm_dp_catalog->hw_revision = msm_dp_read_ahb(catalog, REG_DP_HW_VERSION);
 }
 
 bool msm_dp_catalog_ctrl_mainlink_ready(struct msm_dp_catalog *msm_dp_catalog)
@@ -895,9 +881,10 @@ static void msm_dp_catalog_panel_update_sdp(struct msm_dp_catalog *msm_dp_catalo
 	u32 hw_revision;
 
 	catalog = container_of(msm_dp_catalog, struct msm_dp_catalog_private, msm_dp_catalog);
+	hw_revision = msm_dp_catalog->hw_revision;
 
-	hw_revision = msm_dp_catalog_hw_revision(msm_dp_catalog);
-	if (hw_revision < DP_HW_VERSION_1_2 && hw_revision >= DP_HW_VERSION_1_0) {
+	if (hw_revision < DP_HW_VERSION_1_2 &&
+	    hw_revision >= DP_HW_VERSION_1_0) {
 		msm_dp_write_link(catalog, MMSS_DP_SDP_CFG3, 0x01);
 		msm_dp_write_link(catalog, MMSS_DP_SDP_CFG3, 0x00);
 	}
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 08bb42e91b779633875dbeb4130bc55a6571cfb1..379fa4fef9ceb63b20c4aec2fca1e09003dc738b 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -33,6 +33,7 @@
 
 struct msm_dp_catalog {
 	bool wide_bus_en;
+	u32 hw_revision;
 };
 
 /* Debug module */
@@ -61,7 +62,6 @@ void msm_dp_catalog_ctrl_config_misc(struct msm_dp_catalog *msm_dp_catalog, u32
 void msm_dp_catalog_ctrl_config_msa(struct msm_dp_catalog *msm_dp_catalog, u32 rate,
 				u32 stream_rate_khz, bool is_ycbcr_420);
 int msm_dp_catalog_ctrl_set_pattern_state_bit(struct msm_dp_catalog *msm_dp_catalog, u32 pattern);
-u32 msm_dp_catalog_hw_revision(const struct msm_dp_catalog *msm_dp_catalog);
 void msm_dp_catalog_ctrl_reset(struct msm_dp_catalog *msm_dp_catalog);
 bool msm_dp_catalog_ctrl_mainlink_ready(struct msm_dp_catalog *msm_dp_catalog);
 void msm_dp_catalog_ctrl_enable_irq(struct msm_dp_catalog *msm_dp_catalog, bool enable);

-- 
2.39.5

