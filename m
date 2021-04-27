Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B83136BC90
	for <lists+freedreno@lfdr.de>; Tue, 27 Apr 2021 02:18:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E00AB6E8AE;
	Tue, 27 Apr 2021 00:18:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E159B6E8AB
 for <freedreno@lists.freedesktop.org>; Tue, 27 Apr 2021 00:18:34 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id 4so31091713lfp.11
 for <freedreno@lists.freedesktop.org>; Mon, 26 Apr 2021 17:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ijc1U+UMGqLkSaCADs8rAj5/EZ+DPFy6/09GaffQN1o=;
 b=tsAPPWmIh2Z+c2VWBZfDmS2mvJxS4xPgUWE5z0UBkAIO5yIis4Pk2zgQiHwxH/gxoS
 5PnWjb4K3/SFTLLo8cLuOyM6cDMuBEDRiHmppIxido3wuBErjItr3dECIG31YUX9Xdhr
 7+42G+2c/XaDNYf7WtDqabnvAeLSh/mNNGUPyLpmhyP0NivSEAYAWpLwmm053LKbIL1A
 pAMjDhuIs4IEeAwLlFGl+mR60+WvCNLxwNF4OAHo5XVtkdtXC9mkjRpOP6bAvmpjY/Ie
 NlveQolNEf7fmaRRx9kxGpFsC1dvIEa/86tqDyoslMMUHshTwNGlG8D4PgJPc1RY2crD
 mr4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ijc1U+UMGqLkSaCADs8rAj5/EZ+DPFy6/09GaffQN1o=;
 b=JTDbi80geFSX6OnXbesc8LkGmQD1RB1+ym3lsrEURqeh0XF8lCFtUA+dU/N2l/DxZw
 LRxQKTDBnGY3bPEKM4DPDjiQ3MU8XNqEWLkqTyOB7AZCDQKFdFZMiHMhrYDBkHd88ETF
 L6lKkaTYkqq56RdobtlG4GYy1CUF5JIXf9+NXLbK1bgGqccQ+CCJEAx2TfRh3RDNwz3Y
 1bbn730E5xLHUpBLlVtRl7jP6mQ9h5WElqXyxwk3rGQoeykH/Qbj1qsPkUF4m31+dPvR
 lly9yGZh2go29tUvMnwrr9x7qjuE7fKA2sCPfWMoVjObE7c1cbQlTE/+sau0d3taVUg2
 Go0g==
X-Gm-Message-State: AOAM533wMKIkFseV33slEIVrHUjVGWqvlH+Z8eNqWW50AhrP92AaEVES
 kne2VZ1raLaQvxswWnMTi66mSA==
X-Google-Smtp-Source: ABdhPJzv5INIBV9IMosRsSd9qplUyQrgLSvGow5hPQdSRqia0P8XhKP23ublOnsZiI+rBB7ldYY80A==
X-Received: by 2002:a19:ad41:: with SMTP id s1mr14570479lfd.306.1619482712483; 
 Mon, 26 Apr 2021 17:18:32 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id d15sm1555100lfn.7.2021.04.26.17.18.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 17:18:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Date: Tue, 27 Apr 2021 03:18:27 +0300
Message-Id: <20210427001828.2375555-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210427001828.2375555-1-dmitry.baryshkov@linaro.org>
References: <20210427001828.2375555-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v2 3/4] drm/msm: get rid of msm_iomap_size
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Instead of looping throught the resources each time to get the DSI CTRL
area size, get it at the ioremap time.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c |  5 +++--
 drivers/gpu/drm/msm/msm_drv.c      | 27 +++++++++------------------
 drivers/gpu/drm/msm/msm_drv.h      |  3 ++-
 3 files changed, 14 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 1a63368c3912..b3ee5c0bce12 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -102,6 +102,7 @@ struct msm_dsi_host {
 	int id;
 
 	void __iomem *ctrl_base;
+	phys_addr_t ctrl_size;
 	struct regulator_bulk_data supplies[DSI_DEV_REGULATOR_MAX];
 
 	struct clk *bus_clks[DSI_BUS_CLK_MAX];
@@ -1839,7 +1840,7 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 		goto fail;
 	}
 
-	msm_host->ctrl_base = msm_ioremap(pdev, "dsi_ctrl", "DSI CTRL");
+	msm_host->ctrl_base = msm_ioremap_size(pdev, "dsi_ctrl", "DSI CTRL", &msm_host->ctrl_size);
 	if (IS_ERR(msm_host->ctrl_base)) {
 		pr_err("%s: unable to map Dsi ctrl base\n", __func__);
 		ret = PTR_ERR(msm_host->ctrl_base);
@@ -2494,7 +2495,7 @@ void msm_dsi_host_snapshot(struct msm_disp_state *disp_state, struct mipi_dsi_ho
 
 	pm_runtime_get_sync(&msm_host->pdev->dev);
 
-	msm_disp_snapshot_add_block(disp_state, msm_iomap_size(msm_host->pdev, "dsi_ctrl"),
+	msm_disp_snapshot_add_block(disp_state, msm_host->ctrl_size,
 			msm_host->ctrl_base, "dsi%d_ctrl", msm_host->id);
 
 	pm_runtime_put_sync(&msm_host->pdev->dev);
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 92fe844b517b..be578fc4e54f 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -124,7 +124,7 @@ struct clk *msm_clk_get(struct platform_device *pdev, const char *name)
 }
 
 static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name,
-				  const char *dbgname, bool quiet)
+				  const char *dbgname, bool quiet, phys_addr_t *psize)
 {
 	struct resource *res;
 	unsigned long size;
@@ -153,37 +153,28 @@ static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name
 	if (reglog)
 		printk(KERN_DEBUG "IO:region %s %p %08lx\n", dbgname, ptr, size);
 
+	if (psize)
+		*psize = size;
+
 	return ptr;
 }
 
 void __iomem *msm_ioremap(struct platform_device *pdev, const char *name,
 			  const char *dbgname)
 {
-	return _msm_ioremap(pdev, name, dbgname, false);
+	return _msm_ioremap(pdev, name, dbgname, false, NULL);
 }
 
 void __iomem *msm_ioremap_quiet(struct platform_device *pdev, const char *name,
 				const char *dbgname)
 {
-	return _msm_ioremap(pdev, name, dbgname, true);
+	return _msm_ioremap(pdev, name, dbgname, true, NULL);
 }
 
-unsigned long msm_iomap_size(struct platform_device *pdev, const char *name)
+void __iomem *msm_ioremap_size(struct platform_device *pdev, const char *name,
+			  const char *dbgname, phys_addr_t *psize)
 {
-	struct resource *res;
-
-	if (name)
-		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
-	else
-		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-
-	if (!res) {
-		dev_dbg(&pdev->dev, "failed to get memory resource: %s\n",
-				name);
-		return 0;
-	}
-
-	return resource_size(res);
+	return _msm_ioremap(pdev, name, dbgname, false, psize);
 }
 
 void msm_writel(u32 data, void __iomem *addr)
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 15cb34451ded..c33fc1293789 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -450,9 +450,10 @@ struct clk *msm_clk_bulk_get_clock(struct clk_bulk_data *bulk, int count,
 	const char *name);
 void __iomem *msm_ioremap(struct platform_device *pdev, const char *name,
 		const char *dbgname);
+void __iomem *msm_ioremap_size(struct platform_device *pdev, const char *name,
+		const char *dbgname, phys_addr_t *size);
 void __iomem *msm_ioremap_quiet(struct platform_device *pdev, const char *name,
 		const char *dbgname);
-unsigned long msm_iomap_size(struct platform_device *pdev, const char *name);
 void msm_writel(u32 data, void __iomem *addr);
 u32 msm_readl(const void __iomem *addr);
 void msm_rmw(void __iomem *addr, u32 mask, u32 or);
-- 
2.30.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
