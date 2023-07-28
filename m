Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7147677A7
	for <lists+freedreno@lfdr.de>; Fri, 28 Jul 2023 23:33:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A51A510E479;
	Fri, 28 Jul 2023 21:33:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5429F10E479
 for <freedreno@lists.freedesktop.org>; Fri, 28 Jul 2023 21:33:29 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4fe1c285690so3166457e87.3
 for <freedreno@lists.freedesktop.org>; Fri, 28 Jul 2023 14:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690580007; x=1691184807;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zfE1L2H8AJhwbvwdI3x7uxXE4yUvRsy3KKDO7xKa8+8=;
 b=oPCh/MnViaN0eJIQ9zVxch8uKF324MPV/COzPKKr29yzx7GX4rBFlYGZ/tLCshFjei
 2suiFGWvUIyn3cYrGMxgqpDmzX0lKnlSXNVFKIM2K/8m11AGtfDdJJ2iYIMCqU5z0K6U
 HtTEhnJroBJ+8pcZpiH19ToDliE08V8Z80yOO1kXA6oTfo74MY4aGNkpaIJU1NvdVYKK
 rKpwXAWVa05fnUIsUpoqYm6Nf1uykk9TrbdxthrNP21X5a3+4gWdxvoOVFPQZT1RtsTX
 ifL79RkNJlrYyfFA+XsnB4cfssmwVdb7UiOxgMZYNCHJeMiDDbMZ55EojC91VYraOK53
 MwOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690580007; x=1691184807;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zfE1L2H8AJhwbvwdI3x7uxXE4yUvRsy3KKDO7xKa8+8=;
 b=OQYfazhxjfzCAx1MJ2nPPu6+PJP3ka+6sU1LC2KAcHCdJxK2i3o2xwUqNwxj6uGHoC
 oVChH6D4w46qLMFXl821/1Xml3Q6qrszLQbUTtrxr7OLJoGfuh1iahgRPXNLfaGoiMIO
 Ft6xt31gIVZcP0cwJf1Sp/FzJoV9p7cTvk5sKzLU0vxTZYsgUVIHPQhoPFFqZmnMAr9N
 qsXRo6G9raw72ZiAyvPjSCb04eoWod0Sp1u2rRbNzlZANnr/XXtjdyW9W+uBlxs5B4Hh
 Le6A1u3SWqRLAltbCKA6UAD0n8R4qe47SSrsatwuEES2nGZXDwS/abuUXpDHGFzi4tkC
 5jbA==
X-Gm-Message-State: ABy/qLZizuIJfYcU0MZ41ner191fQ+szzcqfqHvaPUoeYljX2iTzCmfi
 TT5YFumS87cGBKWBePJwJ0FgoA==
X-Google-Smtp-Source: APBJJlGt8RJK8xWb4OYVlKtW/lsZu2UwRnAUNXDIQOaNIt5YnkDoYcltwl6rIfU4HNpnK/q/d4A+rA==
X-Received: by 2002:a19:7b14:0:b0:4f8:5755:5b22 with SMTP id
 w20-20020a197b14000000b004f857555b22mr2045199lfc.27.1690580007645; 
 Fri, 28 Jul 2023 14:33:27 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 n16-20020a056512389000b004fe13318aeesm956832lft.166.2023.07.28.14.33.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jul 2023 14:33:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sat, 29 Jul 2023 00:33:16 +0300
Message-Id: <20230728213320.97309-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230728213320.97309-1-dmitry.baryshkov@linaro.org>
References: <20230728213320.97309-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 3/7] drm/msm/mdss: export UBWC data
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

DPU programming requires knowledge of some of UBWC parameters. This
results in duplication of UBWC data between MDSS and DPU drivers. Export
the required data from MDSS driver.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 30 +++++++++++++-----------------
 drivers/gpu/drm/msm/msm_mdss.h | 27 +++++++++++++++++++++++++++
 2 files changed, 40 insertions(+), 17 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/msm_mdss.h

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 67436a5a8cf1..0189811bce4d 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -13,7 +13,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 
-#include "msm_drv.h"
+#include "msm_mdss.h"
 #include "msm_kms.h"
 
 #define HW_REV				0x0
@@ -26,16 +26,6 @@
 
 #define MIN_IB_BW	400000000UL /* Min ib vote 400MB */
 
-struct msm_mdss_data {
-	u32 ubwc_enc_version;
-	/* can be read from register 0x58 */
-	u32 ubwc_dec_version;
-	u32 ubwc_swizzle;
-	u32 ubwc_static;
-	u32 highest_bank_bit;
-	u32 macrotile_mode;
-};
-
 struct msm_mdss {
 	struct device *dev;
 
@@ -185,12 +175,6 @@ static int _msm_mdss_irq_domain_add(struct msm_mdss *msm_mdss)
 	return 0;
 }
 
-#define UBWC_1_0 0x10000000
-#define UBWC_2_0 0x20000000
-#define UBWC_3_0 0x30000000
-#define UBWC_4_0 0x40000000
-#define UBWC_4_3 0x40030000
-
 static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss)
 {
 	const struct msm_mdss_data *data = msm_mdss->mdss_data;
@@ -236,6 +220,18 @@ static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
 	}
 }
 
+const struct msm_mdss_data *msm_mdss_get_mdss_data(struct device *dev)
+{
+	struct msm_mdss *mdss;
+
+	if (!dev)
+		return ERR_PTR(-EINVAL);
+
+	mdss = dev_get_drvdata(dev);
+
+	return mdss->mdss_data;
+}
+
 static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 {
 	int ret;
diff --git a/drivers/gpu/drm/msm/msm_mdss.h b/drivers/gpu/drm/msm/msm_mdss.h
new file mode 100644
index 000000000000..02bbab42adbc
--- /dev/null
+++ b/drivers/gpu/drm/msm/msm_mdss.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2018, The Linux Foundation
+ */
+
+#ifndef __MSM_MDSS_H__
+#define __MSM_MDSS_H__
+
+struct msm_mdss_data {
+	u32 ubwc_enc_version;
+	/* can be read from register 0x58 */
+	u32 ubwc_dec_version;
+	u32 ubwc_swizzle;
+	u32 ubwc_static;
+	u32 highest_bank_bit;
+	u32 macrotile_mode;
+};
+
+#define UBWC_1_0 0x10000000
+#define UBWC_2_0 0x20000000
+#define UBWC_3_0 0x30000000
+#define UBWC_4_0 0x40000000
+#define UBWC_4_3 0x40030000
+
+const struct msm_mdss_data *msm_mdss_get_mdss_data(struct device *dev);
+
+#endif /* __MSM_MDSS_H__ */
-- 
2.39.2

