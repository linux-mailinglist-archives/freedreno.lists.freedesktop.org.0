Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB2A42343C
	for <lists+freedreno@lfdr.de>; Wed,  6 Oct 2021 01:11:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D43BF6EC97;
	Tue,  5 Oct 2021 23:11:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34A4D6EC89
 for <freedreno@lists.freedesktop.org>; Tue,  5 Oct 2021 23:11:46 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 97-20020a9d006a000000b00545420bff9eso859855ota.8
 for <freedreno@lists.freedesktop.org>; Tue, 05 Oct 2021 16:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z0OkvfJXc9Y2w0klbpaKdGqzSv5YbDPZgzOyFtH19rk=;
 b=xdg7VEEV7n+/U9chpgEIfjbX+7MZOdTWi/PdSHER+0MBFEPPB4jOwYMbeF1lRVbKcr
 cmnvspVg9VBAV95hkF30baFDqNV8BIQXsUhSy+CTWiEWtbVlt4O5gPS1idCqh6Awv09v
 isizy5GNkDRyfDLpbvtMDVY6EZOd02nI3EEjHIKCiqbxdGDHpp/sZgov5sj8REpWUKR4
 fV/ErhBmum3+XK0fzRo93OKVWG+uFPSO0+F4UGsdp5P0cS64qApAqB/u/5FHUcuAFQkb
 ZVMGvjjYl+ZFmlrfRAIwuxQvuWvnOpAxSZzyer6n+HgUqkpiTi1uBNYktD6V6UZMIkrF
 CM3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z0OkvfJXc9Y2w0klbpaKdGqzSv5YbDPZgzOyFtH19rk=;
 b=exzK30VSTXQHRBPqEnE/f0eqFj8/OBjNNzbGxtiIHcZRJVabDx+TtYkMcfl2Wftn4Z
 NFKqFgsN9IE0ocXze9Tlfa3If3Y0CJqhX3pPG0TbnvjvVnpk0hiujFG8IJoFc3obVYgq
 NwARPB7JT7ZYPhFJOOOoj4H4rGmQ2002QU++SgUoVbIlevFengSQbHrz9s+0/wM8wlgZ
 ucesSCFabqGvjH1bXDazOhjq+gGNMqRbue+3+v+Fq3REVkiBn8WFNSWCxFOrOa8wGy70
 NMU8zI2xEHGdrk2/+hpGS+dBrH876XjTS7Qd/Qnn3+Pa1/qbLFxYmeIm5OSERWIiPMgH
 3CpA==
X-Gm-Message-State: AOAM533V17WXjMmjCdVL0gE1hYg8kE20P8pDBKdB2RE1nmtOh4KZHxvc
 ptmILjBaC7z11lFx53XI/0u4NQ==
X-Google-Smtp-Source: ABdhPJzgRqO42teenis/dK6KDiIVba+42gFP/lK41coBLLactFMuFi3MuxuAQJq9OyKdBiE0qZJ+OQ==
X-Received: by 2002:a9d:604:: with SMTP id 4mr16885518otn.204.1633475505465;
 Tue, 05 Oct 2021 16:11:45 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id
 v9sm1665141oth.62.2021.10.05.16.11.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 16:11:45 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Tue,  5 Oct 2021 16:13:19 -0700
Message-Id: <20211005231323.2663520-4-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211005231323.2663520-1-bjorn.andersson@linaro.org>
References: <20211005231323.2663520-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 3/7] drm/msm/dp: Allow specifying
 connector_type per controller
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

As the following patches introduced support for multiple DP blocks in a
platform and some of those block might be eDP it becomes useful to be
able to specify the connector type per block.

Although there's only a single block at this point, the array of descs
and the search in dp_display_get_desc() are introduced here to simplify
the next patch, that does introduce support for multiple DP blocks.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v3:
- New patch
- Extended msm_dp_config with connector_type, wrapped in inner struct
- Refactored out of the next patch
- Pass the connector_type to drm_connector_init(), from yet another patch
- Dropped double newline and unnecessary {}

 drivers/gpu/drm/msm/dp/dp_display.c | 43 ++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/dp/dp_display.h |  1 +
 drivers/gpu/drm/msm/dp/dp_drm.c     |  2 +-
 3 files changed, 44 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 5d3ee5ef07c2..eaf08f9e7d87 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -115,8 +115,25 @@ struct dp_display_private {
 	struct dp_audio *audio;
 };
 
+struct msm_dp_desc {
+	phys_addr_t io_start;
+	int connector_type;
+};
+
+struct msm_dp_config {
+	struct msm_dp_desc *descs;
+	size_t num_descs;
+};
+
+static const struct msm_dp_config sc7180_dp_cfg = {
+	.descs = (struct msm_dp_desc[]) {
+		{ .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
+	},
+	.num_descs = 1,
+};
+
 static const struct of_device_id dp_dt_match[] = {
-	{.compatible = "qcom,sc7180-dp"},
+	{ .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_cfg },
 	{}
 };
 
@@ -1180,10 +1197,29 @@ int dp_display_request_irq(struct msm_dp *dp_display)
 	return 0;
 }
 
+static struct msm_dp_desc *dp_display_get_desc(struct platform_device *pdev)
+{
+	const struct msm_dp_config *cfg = of_device_get_match_data(&pdev->dev);
+	struct resource *res;
+	int i;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return NULL;
+
+	for (i = 0; i < cfg->num_descs; i++)
+		if (cfg->descs[i].io_start == res->start)
+			return &cfg->descs[i];
+
+	dev_err(&pdev->dev, "unknown displayport instance\n");
+	return NULL;
+}
+
 static int dp_display_probe(struct platform_device *pdev)
 {
 	int rc = 0;
 	struct dp_display_private *dp;
+	struct msm_dp_desc *desc;
 
 	if (!pdev || !pdev->dev.of_node) {
 		DRM_ERROR("pdev not found\n");
@@ -1194,8 +1230,13 @@ static int dp_display_probe(struct platform_device *pdev)
 	if (!dp)
 		return -ENOMEM;
 
+	desc = dp_display_get_desc(pdev);
+	if (!desc)
+		return -EINVAL;
+
 	dp->pdev = pdev;
 	dp->name = "drm_dp";
+	dp->dp_display.connector_type = desc->connector_type;
 
 	rc = dp_init_sub_modules(dp);
 	if (rc) {
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 8b47cdabb67e..02999408c052 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -18,6 +18,7 @@ struct msm_dp {
 	bool is_connected;
 	bool audio_enabled;
 	bool power_on;
+	int connector_type;
 
 	hdmi_codec_plugged_cb plugged_cb;
 
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 764f4b81017e..f33e31523f56 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -147,7 +147,7 @@ struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display)
 
 	ret = drm_connector_init(dp_display->drm_dev, connector,
 			&dp_connector_funcs,
-			DRM_MODE_CONNECTOR_DisplayPort);
+			dp_display->connector_type);
 	if (ret)
 		return ERR_PTR(ret);
 
-- 
2.29.2

