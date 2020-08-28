Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 660062957AA
	for <lists+freedreno@lfdr.de>; Thu, 22 Oct 2020 07:10:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 232696E34B;
	Thu, 22 Oct 2020 05:10:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8186D6E34B
 for <freedreno@lists.freedesktop.org>; Thu, 22 Oct 2020 05:10:31 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id t14so258458pgg.1
 for <freedreno@lists.freedesktop.org>; Wed, 21 Oct 2020 22:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=resent-from:resent-date:resent-message-id:resent-to:from:to:cc
 :subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=xHZeI2yfFEkpCkFHmLsd7DtKmS2VipSIn1WAzrLDQFE=;
 b=Q+71l5+gMRjc6Jl+Gz3xDwkeTPAnJ8yCWlo2y2SYjbnQvHC3RQOnXN4AK5hKUy+Cqr
 NuEV2jkT1xIVvq/fdb+MqsxDokeOff0kJ+DMpwLC74heDEH6aDA9f1P83NE5PNEbzLYk
 3DvU1SdqDlfEQV2C/tkbt7CPlyydac7x4oWIGcjaH1AkzUNUQBOlqd33VFbZpK41Qvib
 SnLBcbJYEjdP2wIogc/kRBc1ldN9BbiUnw2e5nzFQUVuS/h71aYJyu0hG2rMUGE+83FL
 mv62CM8oLaRT4q0BL8pWZQpI9qLtJOwyFMDbbf5HQL46PUMQDmjGZzQCMfTRJZWJFQTl
 ckmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:resent-from:resent-date:resent-message-id
 :resent-to:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xHZeI2yfFEkpCkFHmLsd7DtKmS2VipSIn1WAzrLDQFE=;
 b=Nren35Za4Z6gt5uBpBOYZGvG66l4eG0iBLeaWhPQr9cNrql0edF0SuA1RoidIqWLmm
 h9pYoxAI3Qb9dQyAJrCfHxoOF3XpZ+DgagTosFsxXsLQR1QaPHRrcGghUbFr5/glN76w
 CPZdhgkJx9PuPKHauaXvSQfSX8kuWtNHiv1vZh+/2EOkgeDps+1gf0k2d3veh8JKG57s
 +b6Syw9nVk7jlJ78sYRtPzr3vxwGGee8DrgGMB9fps4XJpudx+syI8FKvxl6i/T0S1A9
 XiS/5UomNIBXlC644/4WN09IKnz3LtJnKFeMC3NIcStZXReT7WtoeGnTuMPraPuIFhu6
 +awg==
X-Gm-Message-State: AOAM532NhOB4i+Uh5c1N9+HZmP+THPXR5rx8MmUncrcz/vc77cqD+moZ
 bOWjAN8Ie2ME2HHP96UczyZfjxT11GGkRw==
X-Google-Smtp-Source: ABdhPJxiOn/07IeoxsIPYqzQ+6FfWhguscGqt1VY0kHAwzvmn7Tw9fGLn5n0aEFcj78NRfq6Q8QK9g==
X-Received: by 2002:a62:1844:0:b029:152:80d3:8647 with SMTP id
 65-20020a6218440000b029015280d38647mr1004637pfy.18.1603343430551; 
 Wed, 21 Oct 2020 22:10:30 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id a8sm568663pgt.1.2020.10.21.22.10.29
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 21 Oct 2020 22:10:30 -0700 (PDT)
Resent-From: Viresh Kumar <viresh.kumar@linaro.org>
Resent-Date: Thu, 22 Oct 2020 10:40:28 +0530
Resent-Message-ID: <20201022051028.thvzt2foqmzyr7z7@vireshk-i7>
Resent-To: freedreno@lists.freedesktop.org
Received: from pop.gmail.com [74.125.68.109]
 by vireshk-i7 with POP3 (fetchmail-6.3.26)
 for <vireshk@localhost> (single-drop); Fri, 28 Aug 2020 11:39:28 +0530 (IST)
Received: from localhost ([122.167.135.199])
 by smtp.gmail.com with ESMTPSA id e65sm96904pjk.45.2020.08.27.23.08.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 27 Aug 2020 23:08:23 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: rnayak@codeaurora.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Date: Fri, 28 Aug 2020 11:37:48 +0530
Message-Id: <6e4110032f8711e8bb0acbeccfe66dec3b09d5c1.1598594714.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1598594714.git.viresh.kumar@linaro.org>
References: <cover.1598594714.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH V2 3/8] drm/msm: Unconditionally call
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
 Viresh Kumar <viresh.kumar@linaro.org>,
 Naresh Kamboju <naresh.kamboju@linaro.org>, Rafael Wysocki <rjw@rjwysocki.net>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

dev_pm_opp_of_remove_table() doesn't report any errors when it fails to
find the OPP table with error -ENODEV (i.e. OPP table not present for
the device). And we can call dev_pm_opp_of_remove_table()
unconditionally here.

While at it, also create a label to put clkname.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

---
V2:
- Compare with -ENODEV only for failures.
- Create new label to put clkname.
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 14 +++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h |  1 -
 drivers/gpu/drm/msm/dsi/dsi_host.c      |  8 ++------
 3 files changed, 7 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index c0a4d4e16d82..c8287191951f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1010,12 +1010,9 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
 		return PTR_ERR(dpu_kms->opp_table);
 	/* OPP table is optional */
 	ret = dev_pm_opp_of_add_table(dev);
-	if (!ret) {
-		dpu_kms->has_opp_table = true;
-	} else if (ret != -ENODEV) {
+	if (ret && ret != -ENODEV) {
 		dev_err(dev, "invalid OPP table in device tree\n");
-		dev_pm_opp_put_clkname(dpu_kms->opp_table);
-		return ret;
+		goto put_clkname;
 	}
 
 	mp = &dpu_kms->mp;
@@ -1037,8 +1034,8 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
 	priv->kms = &dpu_kms->base;
 	return ret;
 err:
-	if (dpu_kms->has_opp_table)
-		dev_pm_opp_of_remove_table(dev);
+	dev_pm_opp_of_remove_table(dev);
+put_clkname:
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
index b17ac6c27554..4335fe33250c 100644
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
+	if (ret && ret != -ENODEV) {
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
