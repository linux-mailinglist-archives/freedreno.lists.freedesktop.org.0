Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B310324B6EC
	for <lists+freedreno@lfdr.de>; Thu, 20 Aug 2020 12:44:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76EAA6E939;
	Thu, 20 Aug 2020 10:44:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 515086E939
 for <freedreno@lists.freedesktop.org>; Thu, 20 Aug 2020 10:44:25 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id y6so858587plt.3
 for <freedreno@lists.freedesktop.org>; Thu, 20 Aug 2020 03:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DpgTiEjgRiD0zhPSebj/TpHieKoL8i50gdOLCJBlmJ4=;
 b=OSGUAITJhbJJ52/Uazu0MwC68AnxFTVFBm2nryW7rIRv2Iehs4ErKkFDB4CvW/yifJ
 ELaRK72bwMfqIokp6jb3YgnqZhSeHNDQzg025eNwaeahDVZfjtOHufpZEQ4EPZA58LRi
 wjwfNwQUwHsjcucCKoKS/aPzEGZSL86XD6dlQ/mSWuZKipvSC8SbXtbH0VffOwrmBBS9
 N+TkFN4uny2gtdDnktp1L5R0IDe52JqLCbLdiILjK+3LPgtibESdOcwz3gLKy5O87faY
 np1FWs1hsGNXwSzhURE1Okz9dQm9zvIw5pJ4DhKC7mK3BqIx6pBnupcYs8m0KuS4XwTF
 7ZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DpgTiEjgRiD0zhPSebj/TpHieKoL8i50gdOLCJBlmJ4=;
 b=dNNHH4+38ipGyvs3fvGi7+bj8JDZ6IubuW1ZfsGRTcDjOJjel1tvDKBdMQ2Qfsai5o
 g7g5vcBX8FQDD1BP2/0JqwlusmUKWUW2C4k7m+nDjcyXSOBzy6lHVG34RDyj/pxdK3sD
 7k0vQBbv5zoRtEqYf293yzVsUAaJZNTF+FphOspEesPm/HNLmPqi0N+lr4q2tZBxKm4m
 85B+cTUHHhLAD4NeqfH+81iqooXSskQjbV+2Fz9byNza/8HBK46284YEAm1qtomTQD0C
 V9ssn5dFO23abiPktkO+rk9EDsj3pEOlQzUl7aJbcZcS/qs3jvlsc8S806IZcM+1jWNd
 G4jQ==
X-Gm-Message-State: AOAM533AuCy6If5oIa+oGIBghMX7alpNPnnJ7q86p1ePmsakpWpYdPWb
 vkCFD5PJy5bteAET0U+wFlYfNA==
X-Google-Smtp-Source: ABdhPJxZdfH8zu/kawgBGn1ZD0k1zqJV1XqBEDc/6HZKKh1V4ywtw6ENVhC4nHHzRCocDlAUxfTj2w==
X-Received: by 2002:a17:90b:238d:: with SMTP id
 mr13mr1928786pjb.132.1597920264919; 
 Thu, 20 Aug 2020 03:44:24 -0700 (PDT)
Received: from localhost ([122.172.43.13])
 by smtp.gmail.com with ESMTPSA id e7sm2145009pgn.64.2020.08.20.03.44.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Aug 2020 03:44:24 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: rnayak@codeaurora.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Date: Thu, 20 Aug 2020 16:13:52 +0530
Message-Id: <4ca1dd576f016d49e57b679d0921a268b4a7fa62.1597919647.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1597919647.git.viresh.kumar@linaro.org>
References: <cover.1597919647.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 3/8] drm/msm: Unconditionally call
 dev_pm_opp_of_remove_table()
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
Cc: Nishanth Menon <nm@ti.com>, Vincent Guittot <vincent.guittot@linaro.org>,
 linux-pm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Rafael Wysocki <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

dev_pm_opp_of_remove_table() doesn't report any errors when it fails to
find the OPP table with error -ENODEV (i.e. OPP table not present for
the device). And we can call dev_pm_opp_of_remove_table()
unconditionally here.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 10 +++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h |  1 -
 drivers/gpu/drm/msm/dsi/dsi_host.c      |  8 ++------
 3 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index c0a4d4e16d82..1bd67ba1bf1f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1010,9 +1010,7 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
 		return PTR_ERR(dpu_kms->opp_table);
 	/* OPP table is optional */
 	ret = dev_pm_opp_of_add_table(dev);
-	if (!ret) {
-		dpu_kms->has_opp_table = true;
-	} else if (ret != -ENODEV) {
+	if (ret != -ENODEV) {
 		dev_err(dev, "invalid OPP table in device tree\n");
 		dev_pm_opp_put_clkname(dpu_kms->opp_table);
 		return ret;
@@ -1037,8 +1035,7 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
 	priv->kms = &dpu_kms->base;
 	return ret;
 err:
-	if (dpu_kms->has_opp_table)
-		dev_pm_opp_of_remove_table(dev);
+	dev_pm_opp_of_remove_table(dev);
 	dev_pm_opp_put_clkname(dpu_kms->opp_table);
 	return ret;
 }
@@ -1056,8 +1053,7 @@ static void dpu_unbind(struct device *dev, struct device *master, void *data)
 	if (dpu_kms->rpm_enabled)
 		pm_runtime_disable(&pdev->dev);
 
-	if (dpu_kms->has_opp_table)
-		dev_pm_opp_of_remove_table(dev);
+	dev_pm_opp_of_remove_table(dev);
 	dev_pm_opp_put_clkname(dpu_kms->opp_table);
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index e140cd633071..8295979a7165 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -129,7 +129,6 @@ struct dpu_kms {
 	bool rpm_enabled;
 
 	struct opp_table *opp_table;
-	bool has_opp_table;
 
 	struct dss_module_power mp;
 
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index b17ac6c27554..288f9df06ea2 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -113,7 +113,6 @@ struct msm_dsi_host {
 	struct clk *byte_intf_clk;
 
 	struct opp_table *opp_table;
-	bool has_opp_table;
 
 	u32 byte_clk_rate;
 	u32 pixel_clk_rate;
@@ -1891,9 +1890,7 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 		return PTR_ERR(msm_host->opp_table);
 	/* OPP table is optional */
 	ret = dev_pm_opp_of_add_table(&pdev->dev);
-	if (!ret) {
-		msm_host->has_opp_table = true;
-	} else if (ret != -ENODEV) {
+	if (ret != -ENODEV) {
 		dev_err(&pdev->dev, "invalid OPP table in device tree\n");
 		dev_pm_opp_put_clkname(msm_host->opp_table);
 		return ret;
@@ -1934,8 +1931,7 @@ void msm_dsi_host_destroy(struct mipi_dsi_host *host)
 	mutex_destroy(&msm_host->cmd_mutex);
 	mutex_destroy(&msm_host->dev_mutex);
 
-	if (msm_host->has_opp_table)
-		dev_pm_opp_of_remove_table(&msm_host->pdev->dev);
+	dev_pm_opp_of_remove_table(&msm_host->pdev->dev);
 	dev_pm_opp_put_clkname(msm_host->opp_table);
 	pm_runtime_disable(&msm_host->pdev->dev);
 }
-- 
2.25.0.rc1.19.g042ed3e048af

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
