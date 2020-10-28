Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8E929CE65
	for <lists+freedreno@lfdr.de>; Wed, 28 Oct 2020 07:44:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 475386E488;
	Wed, 28 Oct 2020 06:44:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 982376E48B
 for <freedreno@lists.freedesktop.org>; Wed, 28 Oct 2020 06:44:35 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id t14so2217799pgg.1
 for <freedreno@lists.freedesktop.org>; Tue, 27 Oct 2020 23:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DBtuKQbqQFVugOwxtfWUi7hhbBNFTZTu4rZZoWsSSOw=;
 b=Pdjp840SYs7UCdJ/A+6FMvTsWNPqC9dcSyVdlZ/v8Sw+MSDzxJCJjQLoFVBml/22V6
 8/O2ShytMQkGmtAcyUJ/KnPUm4EIKO5zO65gLADPS33qCZtbfy+SROhhrug9kRGrQyKv
 r64RW30AxdtBu10xVQ2G+PQTXAOHK66yWnPPZFwp8MidX2MXkVhSwL1ndp/Hc7XJQgGS
 adfwjXsMTB0Ue0DlNCbS2ORXkKZ8J27wcwemhCzyVIvwrb3U1UbDmjQ5tOTQvU48dmP9
 aajyg727fiHbdFfcBQoiIjv2vG49Dll4KuxiiUhYMDHb3i4tQpQCJ+OWI+5tr6Eu+8Q6
 4xxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DBtuKQbqQFVugOwxtfWUi7hhbBNFTZTu4rZZoWsSSOw=;
 b=Y/WZmDpCGljSX9Dq0bHzEl8yKgTxHYLwNSlQSftR5beqhik0CLzR8+F5Tlnsejw3Uc
 kvQxnlH98Bcsmt26iSCuCf/LZL+X3VWvvptz89+pE+dIlGzt/XNxpBvyc0MnKYdQl/Kz
 dTKY4jNvsNmPjQ5bTcYXgc2wEO0U7McGiPUOXjHRU+ZUjY6vcSI7/89l4NaqdykcW87K
 H2PR0YCGWJqcpBoto3r1CEHV+TVk+S+zqOmShhUgYUmpah9dJDiq/OHv4lCKr5rrVI5N
 /fGEvhTPvhlZdh9oI8SpJazD/rxsWg4b6KOshoqcB8Dy9UnUU87WO43PJrHmiRyqHJkp
 QWcg==
X-Gm-Message-State: AOAM532xshyIf65VJGWDAZs4ei5wS4CKRNTUBVVsRM2anGnpikHc9AGS
 hHBACPEo3zvPNhmL/hoHOJLQ3Q==
X-Google-Smtp-Source: ABdhPJyNIenHf7Vrl5iCg74QqRyLREcDKUNbEamTEBa/L8UfaHR40zNHFUDJyHuv281eFBsDS8mIzg==
X-Received: by 2002:aa7:808a:0:b029:160:167d:d332 with SMTP id
 v10-20020aa7808a0000b0290160167dd332mr6340101pff.1.1603867475214; 
 Tue, 27 Oct 2020 23:44:35 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id t13sm4900602pfc.1.2020.10.27.23.44.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Oct 2020 23:44:34 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: robdclark@gmail.com,
	Sean Paul <sean@poorly.run>
Date: Wed, 28 Oct 2020 12:14:22 +0530
Message-Id: <f48fcf417bd727f685f34b6f9243fe6239b0d686.1603867405.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <c995335d16d8b4b4ff47b1273869c33e14782b32.1603867405.git.viresh.kumar@linaro.org>
References: <c995335d16d8b4b4ff47b1273869c33e14782b32.1603867405.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH V2 Resend 2/2] drm/msm: Unconditionally call
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
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
index d93c44f6996d..fe127c2f5505 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1091,12 +1091,9 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
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
@@ -1118,8 +1115,8 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
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
@@ -1137,8 +1134,7 @@ static void dpu_unbind(struct device *dev, struct device *master, void *data)
 	if (dpu_kms->rpm_enabled)
 		pm_runtime_disable(&pdev->dev);
 
-	if (dpu_kms->has_opp_table)
-		dev_pm_opp_of_remove_table(dev);
+	dev_pm_opp_of_remove_table(dev);
 	dev_pm_opp_put_clkname(dpu_kms->opp_table);
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index 1c0e4c0c9ffb..d6717d6672f7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -131,7 +131,6 @@ struct dpu_kms {
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
