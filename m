Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EB4539089
	for <lists+freedreno@lfdr.de>; Tue, 31 May 2022 14:18:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9880112153;
	Tue, 31 May 2022 12:18:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D785112127
 for <freedreno@lists.freedesktop.org>; Tue, 31 May 2022 12:18:28 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id q1so14473938ljb.5
 for <freedreno@lists.freedesktop.org>; Tue, 31 May 2022 05:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8eyhHuanqx+u4deTGj8V2+LlpkWjiwWvkK9gQujKI9w=;
 b=k1lxgjYuUHs2jvEXJ2gHGHbuWOZeTeFJbBxc1GD4/ekw2+5fCyevW6SfEKV36ceyWU
 dpz/NHmnkaOFO+9FOrPJNEcaCOBgx1hOPTdOAi154fuPMWmJPTfqXwTtUM5lMPk8BsYT
 WbPTRLAKqGkCTkN/N9JaJvxzYP3QDARmOq6g6f2JqOwOGQLyExNc3K8X5IA3pF+1gKhY
 OhQHPBVj4yALlugq722WQk0FHY/rnviRqyKvhfDEzHWPu7+7Hdcfd/RXzKg2yTB/4lYz
 IVAR2e4QG91vGUmfZFxW74sMj9Urc32dMpDbcIGtZi6KgKD2rA61/DWh9LK/VRcpc0uV
 HpyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8eyhHuanqx+u4deTGj8V2+LlpkWjiwWvkK9gQujKI9w=;
 b=MXfTdO8p7dtZQBScSaqz2JpgNYDtld0gh/T2vQ44Jn6q+qFSATBvgYWCED5jS7t5J3
 Wz2/TQALdFxEWJGfyVpwa5cyZZb6DAq6akLMopZrxJ57dTHXDKW6khDm6TBFA02bH0BY
 j8tDPLlIFhyKk5/aS6xT3MTlyhq8pjTNQ+G4MwDCDLg0k8SzZfahOLfrCw5VKPyc2ycF
 WuZXmdsexbH/aSdR65+id6Cm8Un8LpqR761WxStRfK0xsGHBxBFFY57SSLtT72fACm4q
 cxPyTZKssCljbfymMZaGkaoZh11iX2en6QJuGuTNeSnX2G+0ZZEL0aM6RliaiR+wmDqk
 dG6g==
X-Gm-Message-State: AOAM532+Ak/TWUvvlFd7/L4CVyoskdR1NmnaqpoRvISRewozDwsi01V9
 64EoL/7rRkidFt78lu78ZCxQ8A==
X-Google-Smtp-Source: ABdhPJyupkC4slDXUK9Tw7uNHV4EJd1TiIX+PRxr4gqAnhEVxx5ILLtn79JaVw866aURIj0smdfN8g==
X-Received: by 2002:a2e:a7ca:0:b0:253:f7ab:a008 with SMTP id
 x10-20020a2ea7ca000000b00253f7aba008mr21502340ljp.10.1653999506642; 
 Tue, 31 May 2022 05:18:26 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 e26-20020a2e501a000000b002554f47e37asm1145056ljb.119.2022.05.31.05.18.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 05:18:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Tue, 31 May 2022 15:18:25 +0300
Message-Id: <20220531121825.1126204-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] drm/msm: less magic numbers in msm_mdss_enable
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Replace magic register writes in msm_mdss_enable() with version that
contains less magic and more variable names that can be traced back to
the dpu_hw_catalog or the downstream dtsi files.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 79 ++++++++++++++++++++++++++++++----
 1 file changed, 71 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 0454a571adf7..2a48263cd1b5 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -21,6 +21,7 @@
 #define HW_REV				0x0
 #define HW_INTR_STATUS			0x0010
 
+#define UBWC_DEC_HW_VERSION		0x58
 #define UBWC_STATIC			0x144
 #define UBWC_CTRL_2			0x150
 #define UBWC_PREDICTION_MODE		0x154
@@ -132,9 +133,63 @@ static int _msm_mdss_irq_domain_add(struct msm_mdss *msm_mdss)
 	return 0;
 }
 
+#define UBWC_1_0 0x10000000
+#define UBWC_2_0 0x20000000
+#define UBWC_3_0 0x30000000
+#define UBWC_4_0 0x40000000
+
+static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss,
+				       u32 ubwc_static)
+{
+	writel_relaxed(ubwc_static, msm_mdss->mmio + UBWC_STATIC);
+}
+
+static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss,
+				       unsigned int ubwc_version,
+				       u32 ubwc_swizzle,
+				       u32 highest_bank_bit,
+				       u32 macrotile_mode)
+{
+	u32 value = (ubwc_swizzle & 0x1) |
+		    (highest_bank_bit & 0x3) << 4 |
+		    (macrotile_mode & 0x1) << 12;
+
+	if (ubwc_version == UBWC_3_0)
+		value |= BIT(10);
+
+	if (ubwc_version == UBWC_1_0)
+		value |= BIT(8);
+
+	writel_relaxed(value, msm_mdss->mmio + UBWC_STATIC);
+}
+
+static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss,
+				       unsigned int ubwc_version,
+				       u32 ubwc_swizzle,
+				       u32 ubwc_static,
+				       u32 highest_bank_bit,
+				       u32 macrotile_mode)
+{
+	u32 value = (ubwc_swizzle & 0x7) |
+		    (ubwc_static & 0x1) << 3 |
+		    (highest_bank_bit & 0x7) << 4 |
+		    (macrotile_mode & 0x1) << 12;
+
+	writel_relaxed(value, msm_mdss->mmio + UBWC_STATIC);
+
+	if (ubwc_version == UBWC_3_0) {
+		writel_relaxed(1, msm_mdss->mmio + UBWC_CTRL_2);
+		writel_relaxed(0, msm_mdss->mmio + UBWC_PREDICTION_MODE);
+	} else {
+		writel_relaxed(2, msm_mdss->mmio + UBWC_CTRL_2);
+		writel_relaxed(1, msm_mdss->mmio + UBWC_PREDICTION_MODE);
+	}
+}
+
 static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 {
 	int ret;
+	u32 hw_rev;
 
 	ret = clk_bulk_prepare_enable(msm_mdss->num_clocks, msm_mdss->clocks);
 	if (ret) {
@@ -149,26 +204,34 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	if (msm_mdss->is_mdp5)
 		return 0;
 
+	hw_rev = readl_relaxed(msm_mdss->mmio + HW_REV);
+	dev_info(msm_mdss->dev, "HW_REV: 0x%x\n", hw_rev);
+	dev_info(msm_mdss->dev, "UBWC_DEC_HW_VERSION: 0x%x\n",
+		readl_relaxed(msm_mdss->mmio + UBWC_DEC_HW_VERSION));
+
 	/*
 	 * ubwc config is part of the "mdss" region which is not accessible
 	 * from the rest of the driver. hardcode known configurations here
+	 *
+	 * Decoder version can be read from the UBWC_DEC_HW_VERSION reg,
+	 * UBWC_n comes from hw_catalog.
+	 * Unforunately this driver can not access hw catalog.
 	 */
-	switch (readl_relaxed(msm_mdss->mmio + HW_REV)) {
+	switch (hw_rev) {
 	case DPU_HW_VER_500:
 	case DPU_HW_VER_501:
-		writel_relaxed(0x420, msm_mdss->mmio + UBWC_STATIC);
+		msm_mdss_setup_ubwc_dec_30(msm_mdss, UBWC_3_0, 0, 2, 0);
 		break;
 	case DPU_HW_VER_600:
-		/* TODO: 0x102e for LP_DDR4 */
-		writel_relaxed(0x103e, msm_mdss->mmio + UBWC_STATIC);
-		writel_relaxed(2, msm_mdss->mmio + UBWC_CTRL_2);
-		writel_relaxed(1, msm_mdss->mmio + UBWC_PREDICTION_MODE);
+		/* TODO: highest_bank_bit = 2 for LP_DDR4 */
+		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_4_0, 6, 1, 3, 1);
 		break;
 	case DPU_HW_VER_620:
-		writel_relaxed(0x1e, msm_mdss->mmio + UBWC_STATIC);
+		/* UBWC_2_0 */
+		msm_mdss_setup_ubwc_dec_20(msm_mdss, 0x1e);
 		break;
 	case DPU_HW_VER_720:
-		writel_relaxed(0x101e, msm_mdss->mmio + UBWC_STATIC);
+		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_3_0, 6, 1, 1, 1);
 		break;
 	}
 
-- 
2.35.1

