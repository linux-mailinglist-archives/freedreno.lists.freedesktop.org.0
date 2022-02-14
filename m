Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 202304B54FF
	for <lists+freedreno@lfdr.de>; Mon, 14 Feb 2022 16:39:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B506B10E1CD;
	Mon, 14 Feb 2022 15:39:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC76510E147
 for <freedreno@lists.freedesktop.org>; Mon, 14 Feb 2022 15:37:46 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id s10so13979722wrb.1
 for <freedreno@lists.freedesktop.org>; Mon, 14 Feb 2022 07:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=piAsb4t4SD1sv2wty0vPkL+S6vbc8+vlfNWfjljedEY=;
 b=vV37BgTTvSmRurnENtb36TIlJprdlqgUKYZDt7jlyK64Ojo+EJMxry2PABuhUrFxS2
 COzFkCIfXIzbIapPp1bGv/zu5KKwC+L3+cn6ewTn2PiUi8Ql85wjRSgLOOy3hqYoSQbi
 QHA+XGJIbxAVsEYIzADUbJE8frtBVhtQkhohPf0BMMVA6V9d+eagLpFBZ1ZodGKUgdnI
 Ar+JQpAoEXOy3EE8CpNFx+K6L4Y98Abv5fjeWrkLuCdx9s918iimS5hg39Ly+mSg0FIz
 Ck0Ok76uLEZb8Bzc+PP2uf6iCWEl2UNXLLxdcu772PAczO/Il1ms11rrMbBPjgqhEKdC
 0MeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=piAsb4t4SD1sv2wty0vPkL+S6vbc8+vlfNWfjljedEY=;
 b=IgwSnR3/SZOI49TgJAUDOCuoJg/8JDx6kUUQtpXV0v3qAfyfBpc/DyWhFnSKZpEctS
 GvFKrRmfWcKxfogH1scWEylx6sl2FemkNPspWwO1jMhMAP1M27KFUdOqoXJX2qGOeRwx
 J2VuaCXVEcmzVdnCzQ1ifhtprr6y5SBaZT40CqNJkiFS+XpHDoM84nyFTR03mzcB4AeH
 5scaSvZkw4/dYtpRQ8KH106aewMW31WvuygEUUTZC0LzP7alkf/SgsfjOrglS4ydvSkD
 QkKwq9Mn0aMyyLC1a9RJih74bcsa92DvNR8gItwa2KGC/N09vTvBNW1AiecrT5aqW+m8
 RXAw==
X-Gm-Message-State: AOAM533MDT0yBQXbqMnITrOLTyqbqLiihpEY3iO1ugSQZDzdoZ2jPPui
 zYZryzGK60wEGNsZzTzh7eD5yQ==
X-Google-Smtp-Source: ABdhPJziMz3tE+JW+CSk7fGBvFzWbBfKT7e5GCTRzgFmUfT7gpHXHC0Ov+qdiyvZTJJOKnoenRWifQ==
X-Received: by 2002:a05:6000:188:: with SMTP id p8mr188339wrx.84.1644853065425; 
 Mon, 14 Feb 2022 07:37:45 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:682b:4712:4b40:6814])
 by smtp.gmail.com with ESMTPSA id
 l26sm12935850wms.24.2022.02.14.07.37.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 14 Feb 2022 07:37:44 -0800 (PST)
From: Loic Poulain <loic.poulain@linaro.org>
To: dmitry.baryshkov@linaro.org,
	robdclark@gmail.com,
	robh+dt@kernel.org
Date: Mon, 14 Feb 2022 16:37:39 +0100
Message-Id: <1644853060-12222-2-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1644853060-12222-1-git-send-email-loic.poulain@linaro.org>
References: <1644853060-12222-1-git-send-email-loic.poulain@linaro.org>
X-Mailman-Approved-At: Mon, 14 Feb 2022 15:39:46 +0000
Subject: [Freedreno] [PATCH v2 2/3] drm/msm/dsi: Add support for qcm2290 dsi
 controller
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
Cc: linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org,
 freedreno@lists.freedesktop.org, Loic Poulain <loic.poulain@linaro.org>,
 devicetree@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

QCM2290 MDSS includes a Qualcomm DSI controller v2.4.1. Since this
controller version is not SoC specific, and already assigned to sc7180
for auto configuration, we rely on DSI block specific compatible
string "qcom,dsi-ctrl-6g-qcm2290", and use the device's data to point
to the right dsi config handler.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 v2: commit reword

 drivers/gpu/drm/msm/dsi/dsi.c     |  2 ++
 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 23 +++++++++++++++++++++++
 drivers/gpu/drm/msm/dsi/dsi_cfg.h |  3 +++
 3 files changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index 06a9008..bed8b24b 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -4,6 +4,7 @@
  */
 
 #include "dsi.h"
+#include "dsi_cfg.h"
 
 struct drm_encoder *msm_dsi_get_encoder(struct msm_dsi *msm_dsi)
 {
@@ -171,6 +172,7 @@ static int dsi_dev_remove(struct platform_device *pdev)
 
 static const struct of_device_id dt_match[] = {
 	{ .compatible = "qcom,mdss-dsi-ctrl", .data = NULL /* autodetect cfg */ },
+	{ .compatible = "qcom,dsi-ctrl-6g-qcm2290", .data = &qcm2290_dsi_cfg_handler },
 	{}
 };
 
diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index 96bbc8b..2c23324 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -213,6 +213,24 @@ static const struct msm_dsi_config sc7280_dsi_cfg = {
 	.num_dsi = 1,
 };
 
+static const char * const dsi_qcm2290_bus_clk_names[] = {
+	"iface", "bus",
+};
+
+static const struct msm_dsi_config qcm2290_dsi_cfg = {
+	.io_offset = DSI_6G_REG_SHIFT,
+	.reg_cfg = {
+		.num = 1,
+		.regs = {
+			{"vdda", 21800, 4 },	/* 1.2 V */
+		},
+	},
+	.bus_clk_names = dsi_qcm2290_bus_clk_names,
+	.num_bus_clks = ARRAY_SIZE(dsi_qcm2290_bus_clk_names),
+	.io_start = { 0x5e94000 },
+	.num_dsi = 1,
+};
+
 static const struct msm_dsi_host_cfg_ops msm_dsi_v2_host_ops = {
 	.link_clk_set_rate = dsi_link_clk_set_rate_v2,
 	.link_clk_enable = dsi_link_clk_enable_v2,
@@ -300,3 +318,8 @@ const struct msm_dsi_cfg_handler *msm_dsi_cfg_get(u32 major, u32 minor)
 	return cfg_hnd;
 }
 
+/*  Non autodetect configs */
+const struct msm_dsi_cfg_handler qcm2290_dsi_cfg_handler = {
+	.cfg = &qcm2290_dsi_cfg,
+	.ops = &msm_dsi_6g_v2_host_ops,
+};
diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
index 41e99a9..fe54a99 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
@@ -60,5 +60,8 @@ struct msm_dsi_cfg_handler {
 
 const struct msm_dsi_cfg_handler *msm_dsi_cfg_get(u32 major, u32 minor);
 
+/* Non autodetect configs */
+extern const struct msm_dsi_cfg_handler qcm2290_dsi_cfg_handler;
+
 #endif /* __MSM_DSI_CFG_H__ */
 
-- 
2.7.4

