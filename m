Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C9D9DFE24
	for <lists+freedreno@lfdr.de>; Mon,  2 Dec 2024 11:06:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2F9410E6A3;
	Mon,  2 Dec 2024 10:06:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Xg6HKolr";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D05810E6AB
 for <freedreno@lists.freedesktop.org>; Mon,  2 Dec 2024 10:06:54 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-53de92be287so5624330e87.1
 for <freedreno@lists.freedesktop.org>; Mon, 02 Dec 2024 02:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733134013; x=1733738813; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=08p8JD14+c1Dtuoc1UVgr/yt4AmX7Hc+5DPlapkDHkM=;
 b=Xg6HKolrUBHVuof0gyTjjCpEZvccnIJy/Syd2qucb3fXEp+wOOswA87V6z2WXFi7rm
 ViFPHhB68MubFKaDeLhmZnxJlM57tTZtCkayAmQgJWvD1y58aEh5baGh696+t97qqH+u
 YqtwMSpVHwzienQ6zPKbHPVDHc7QrS/8BGy6/Elh2TUcAXggKrMTE3w4HhuDDb4WeMdP
 3HnkYvmYb1ZbocJoFUV/S3B/fmJ+LTJZp8dUVfNhfW8FFFERzY1rwmGVUQ/dd2U/dsF0
 dHGYt3M/lgvklAAIXPf9Hn+rBJAhXPy+mu3pjtmHVLqk6Ug7qlcA/zW+NiCVi1VzgRmP
 jWhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733134013; x=1733738813;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=08p8JD14+c1Dtuoc1UVgr/yt4AmX7Hc+5DPlapkDHkM=;
 b=iu40f368VoKg9LdAYh+hKSi4vG09gNC6E5dW2K9Z4REC0gVahkgHQEm/2dycNx4zB6
 6DbUW//0mgP8+78VytLGquYkyJV/R2cltWcc1TFQG4RW1u1JhXekamK5wnFPWANdJJXZ
 SdfYj3xggXUlUjlOxZSSfEA5ZtAqIA/DP/nXARY85N5NaCZdVzvPI1PPKUguQCbrqUft
 r2jZcY717Pw2q81niDi5Uoq3yyMhGQ3O57uZP2PO5gkTfSnaNgd7+ZL7M5BMi5QKJstz
 gYw5tUo+PsiTtlNHjiy9DVSATKiD6Cj0JJA0yp8vybqlGpFIfb5FVO9iOuqHgotjKKgv
 q6zA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmOyMgzigpM8iaH6lTee78nIhsjcak6jfInVH45FKUPrsP2+JvwjRvFPFKiRceus8GLHOiULNdaG4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzV8s2pt00csXg9WIrLjil0z0NXeVySkbpFj7hfXoh12ntMBGdI
 xRmPQxxbXfHGQxcVmIqVbCPg5B7qqO3nkNCZzi1RNPSdO7bgnAF5xkGY0M4CnyM=
X-Gm-Gg: ASbGncvMEaQtKpDwCDdu0Ob+uCEV+i66lkddHMhjkUemULKDGy+gcJHQHYIyBqN767t
 6HoqV8EEaxCBQZqovCfKn/nPHBXO8He7Qf9bILuUO0oj2Lv0UOFcdI5MOqLR6De/yhW5yWWSZ+K
 exxhNuzVwABFjYD6ZyDNmPZul85kyh65aYj/6LoKkSsap0Y2PzE6WSIR+XtTHRFLIOVFxkMztRi
 gnFB7IQSMRM9CcpaRwauDd+4peC1YUQPtbMs8x4l33B3hBmyAsalRACng==
X-Google-Smtp-Source: AGHT+IHILNDYLiYvUtfTvAkPGfAuV3kENocpi6uZFYznl3/janUl3sKxqNc/wIstHcHwZwQIX8HT2w==
X-Received: by 2002:a05:6512:3d86:b0:53d:a3a7:fe84 with SMTP id
 2adb3069b0e04-53df00a96e8mr16969911e87.8.1733134012615; 
 Mon, 02 Dec 2024 02:06:52 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df646f191sm1418314e87.136.2024.12.02.02.06.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2024 02:06:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 02 Dec 2024 12:06:35 +0200
Subject: [PATCH v2 05/14] drm/msm/dp: move I/O functions to global header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-fd-dp-audio-fixup-v2-5-d9187ea96dad@linaro.org>
References: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org>
In-Reply-To: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>, 
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5678;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=BHA6I1XwPBT7nD2YhJCKM9NSNn36jIN2pw04W7hxTUc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnTYatBw61SPcrQ03U+/jMhzcuiW7ZqoVK1bYw1
 xuvfFLA2DmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ02GrQAKCRCLPIo+Aiko
 1djpB/0XGEgU8e8GdO0l1XPGtDRZbyq2ZgP78lxAh8wDW69oG6+4jB1oCJOu52U4nF7mkGZgmVd
 ALOrVlj0atGKRAzOVqy8KNnVlnE7A/60El+q1zqehI5LZ1sZBn8eyZ5p3U6LgzQg229iL9nwgG3
 v+LEUDPwccWVVzdlHnj+mBA6VNUPfbBmMHTsJ6wU2pvWtEvtKtieIM4d1LrABOoLYu97Yw+dei+
 dAJZne/GnyRmJ+N6vpLDE9upzCgGGy+M8Zc33VG/ZHsUZiZqm14n1SBiosYJv/qSzQA9wpX+KCw
 Xmlv4XUyJe6I3Cu2nwQAMwUTdT98BajGSpWVCuiVC1hqInKp
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

Move msm_dp_read()/msm_write_foo() functions to the dp_catalog.h,
allowing other modules to access the data directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 65 ------------------------------------
 drivers/gpu/drm/msm/dp/dp_catalog.h | 66 +++++++++++++++++++++++++++++++++++++
 2 files changed, 66 insertions(+), 65 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index f02427dc08eb00e1b6a1b2e026a6bf5015c4b46e..bd9d875ca7a66aba7875085b977e75c55ba91578 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -78,71 +78,6 @@ void msm_dp_catalog_snapshot(struct msm_dp_catalog *msm_dp_catalog, struct msm_d
 	msm_disp_snapshot_add_block(disp_state, msm_dp_catalog->p0_len, msm_dp_catalog->p0_base, "dp_p0");
 }
 
-static inline u32 msm_dp_read_aux(struct msm_dp_catalog *msm_dp_catalog, u32 offset)
-{
-	return readl_relaxed(msm_dp_catalog->aux_base + offset);
-}
-
-static inline void msm_dp_write_aux(struct msm_dp_catalog *msm_dp_catalog,
-			       u32 offset, u32 data)
-{
-	/*
-	 * To make sure aux reg writes happens before any other operation,
-	 * this function uses writel() instread of writel_relaxed()
-	 */
-	writel(data, msm_dp_catalog->aux_base + offset);
-}
-
-static inline u32 msm_dp_read_ahb(const struct msm_dp_catalog *msm_dp_catalog, u32 offset)
-{
-	return readl_relaxed(msm_dp_catalog->ahb_base + offset);
-}
-
-static inline void msm_dp_write_ahb(struct msm_dp_catalog *msm_dp_catalog,
-			       u32 offset, u32 data)
-{
-	/*
-	 * To make sure phy reg writes happens before any other operation,
-	 * this function uses writel() instread of writel_relaxed()
-	 */
-	writel(data, msm_dp_catalog->ahb_base + offset);
-}
-
-static inline void msm_dp_write_p0(struct msm_dp_catalog *msm_dp_catalog,
-			       u32 offset, u32 data)
-{
-	/*
-	 * To make sure interface reg writes happens before any other operation,
-	 * this function uses writel() instread of writel_relaxed()
-	 */
-	writel(data, msm_dp_catalog->p0_base + offset);
-}
-
-static inline u32 msm_dp_read_p0(struct msm_dp_catalog *msm_dp_catalog,
-			       u32 offset)
-{
-	/*
-	 * To make sure interface reg writes happens before any other operation,
-	 * this function uses writel() instread of writel_relaxed()
-	 */
-	return readl_relaxed(msm_dp_catalog->p0_base + offset);
-}
-
-static inline u32 msm_dp_read_link(struct msm_dp_catalog *msm_dp_catalog, u32 offset)
-{
-	return readl_relaxed(msm_dp_catalog->link_base + offset);
-}
-
-static inline void msm_dp_write_link(struct msm_dp_catalog *msm_dp_catalog,
-			       u32 offset, u32 data)
-{
-	/*
-	 * To make sure link reg writes happens before any other operation,
-	 * this function uses writel() instread of writel_relaxed()
-	 */
-	writel(data, msm_dp_catalog->link_base + offset);
-}
-
 /* aux related catalog functions */
 u32 msm_dp_catalog_aux_read_data(struct msm_dp_catalog *msm_dp_catalog)
 {
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 13486c9c8703748e69e846be681951368df0a29e..2c500dc0898edfe1d6bdac2eedf3c1b78056cf6b 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -63,6 +63,72 @@ struct msm_dp_catalog {
 	size_t p0_len;
 };
 
+/* IO */
+static inline u32 msm_dp_read_aux(struct msm_dp_catalog *msm_dp_catalog, u32 offset)
+{
+	return readl_relaxed(msm_dp_catalog->aux_base + offset);
+}
+
+static inline void msm_dp_write_aux(struct msm_dp_catalog *msm_dp_catalog,
+			       u32 offset, u32 data)
+{
+	/*
+	 * To make sure aux reg writes happens before any other operation,
+	 * this function uses writel() instread of writel_relaxed()
+	 */
+	writel(data, msm_dp_catalog->aux_base + offset);
+}
+
+static inline u32 msm_dp_read_ahb(const struct msm_dp_catalog *msm_dp_catalog, u32 offset)
+{
+	return readl_relaxed(msm_dp_catalog->ahb_base + offset);
+}
+
+static inline void msm_dp_write_ahb(struct msm_dp_catalog *msm_dp_catalog,
+			       u32 offset, u32 data)
+{
+	/*
+	 * To make sure phy reg writes happens before any other operation,
+	 * this function uses writel() instread of writel_relaxed()
+	 */
+	writel(data, msm_dp_catalog->ahb_base + offset);
+}
+
+static inline void msm_dp_write_p0(struct msm_dp_catalog *msm_dp_catalog,
+			       u32 offset, u32 data)
+{
+	/*
+	 * To make sure interface reg writes happens before any other operation,
+	 * this function uses writel() instread of writel_relaxed()
+	 */
+	writel(data, msm_dp_catalog->p0_base + offset);
+}
+
+static inline u32 msm_dp_read_p0(struct msm_dp_catalog *msm_dp_catalog,
+			       u32 offset)
+{
+	/*
+	 * To make sure interface reg writes happens before any other operation,
+	 * this function uses writel() instread of writel_relaxed()
+	 */
+	return readl_relaxed(msm_dp_catalog->p0_base + offset);
+}
+
+static inline u32 msm_dp_read_link(struct msm_dp_catalog *msm_dp_catalog, u32 offset)
+{
+	return readl_relaxed(msm_dp_catalog->link_base + offset);
+}
+
+static inline void msm_dp_write_link(struct msm_dp_catalog *msm_dp_catalog,
+			       u32 offset, u32 data)
+{
+	/*
+	 * To make sure link reg writes happens before any other operation,
+	 * this function uses writel() instread of writel_relaxed()
+	 */
+	writel(data, msm_dp_catalog->link_base + offset);
+}
+
 /* Debug module */
 void msm_dp_catalog_snapshot(struct msm_dp_catalog *msm_dp_catalog, struct msm_disp_state *disp_state);
 

-- 
2.39.5

