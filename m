Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 948954B5500
	for <lists+freedreno@lfdr.de>; Mon, 14 Feb 2022 16:39:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A842F10E1C4;
	Mon, 14 Feb 2022 15:39:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10BD110E147
 for <freedreno@lists.freedesktop.org>; Mon, 14 Feb 2022 15:37:46 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id d27so27509201wrc.6
 for <freedreno@lists.freedesktop.org>; Mon, 14 Feb 2022 07:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=YT5Imfq0LMuVZOXx0XtEYUfkVCCzeXiSTBNp7getK24=;
 b=Q4z2sLp9vgx5dFg2IuDY/HyEbLdPaVgbvkiNSjnchz9tPBDFLdvyLgY547tI8KRIN5
 MJ8qWz4FYwY9eR7R1R0q+kinxAt4EUPMXxmKcoF6gS18Qz25FesdTkD0/nYf/CqMxzKC
 MpWY79AruqPuJA3m5UM8seDuvCgJw2ZH9dUOj1+l+CyAclR/ORjt0sUn7NLMJxqcM3pQ
 ryoHTY4Pn+rzP9fEhW36TX5VVzsqg7YTPWpgh/6HoNjwzaatCsO63jvb8IUYAa6HixMc
 L7yXbXwPKcAR7RdU7X+lBcresX4+g26j8peqlbIWG5zLTWCvm5PwsgatOH+oFFtib+bs
 xgxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=YT5Imfq0LMuVZOXx0XtEYUfkVCCzeXiSTBNp7getK24=;
 b=QF2fP3yel8Zm5vCBxPMxcFMSLnBtMLDBUcYzdVYlyzKLr+TUECjrSGryy8Nr8ccC5+
 lusdKWr9JssQRAFQcSmw6sTXjQOHuidi/HYKWiOOmfSRUjB+ADbEtEEScHQWRniS1NVV
 Tw7N7L3PYoj0KAHXxTFWqqTT4Pk3RwChcKbCfGLi94OPUa15tZsvt555LIoKALhn92Ux
 l50u/Tdah5BOiT9aMCtML/zywksYp8ZA24gg1TzHdf1W1qSpOxnOyzuQ+QCIaPUJa7Qd
 icDWHH584WZmycoQEQPwCTnDQY2eTLJK3t1mWupgd/R74QOKnhr45wzcoA3BKYaY9VSU
 0jlA==
X-Gm-Message-State: AOAM532HP2PIxR1n1PxEmjLO3i9MkCKXO8Vm3FM+CHMr2ss/6ge+TM4R
 IxOCC6qzdbxxHDKRoL1eOcSwvg==
X-Google-Smtp-Source: ABdhPJxDmnQW8BFcCa9HYezn36gI/eXsK+ZpTY6byPQzuhuqYE5UDH49gKOgYeqccSAazZ0R7VG0aQ==
X-Received: by 2002:a5d:5043:: with SMTP id h3mr169686wrt.394.1644853064495;
 Mon, 14 Feb 2022 07:37:44 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:682b:4712:4b40:6814])
 by smtp.gmail.com with ESMTPSA id
 l26sm12935850wms.24.2022.02.14.07.37.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 14 Feb 2022 07:37:43 -0800 (PST)
From: Loic Poulain <loic.poulain@linaro.org>
To: dmitry.baryshkov@linaro.org,
	robdclark@gmail.com,
	robh+dt@kernel.org
Date: Mon, 14 Feb 2022 16:37:38 +0100
Message-Id: <1644853060-12222-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Mon, 14 Feb 2022 15:39:46 +0000
Subject: [Freedreno] [PATCH v2 1/3] drm/msm/dsi: Allow to specify dsi config
 as pdata
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

Config autodetect based on DSI controller version is quite limited
since several qcom SoCs can integrate a DSI controller with the same
version, but with different config (io_offset, supplies, etc).

This change allows to specify dsi config via device data pointer.
config autodetect is still used in case data pointer is NULL.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 v2: no change

 drivers/gpu/drm/msm/dsi/dsi.c      | 2 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index 0525488..06a9008 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -170,7 +170,7 @@ static int dsi_dev_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id dt_match[] = {
-	{ .compatible = "qcom,mdss-dsi-ctrl" },
+	{ .compatible = "qcom,mdss-dsi-ctrl", .data = NULL /* autodetect cfg */ },
 	{}
 };
 
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 6b3ced4..c540acc 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -212,6 +212,10 @@ static const struct msm_dsi_cfg_handler *dsi_get_config(
 	int ret;
 	u32 major = 0, minor = 0;
 
+	cfg_hnd = device_get_match_data(dev);
+	if (cfg_hnd)
+		return cfg_hnd;
+
 	ahb_clk = msm_clk_get(msm_host->pdev, "iface");
 	if (IS_ERR(ahb_clk)) {
 		pr_err("%s: cannot get interface clock\n", __func__);
-- 
2.7.4

