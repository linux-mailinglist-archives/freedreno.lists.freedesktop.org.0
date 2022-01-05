Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D697485C3F
	for <lists+freedreno@lfdr.de>; Thu,  6 Jan 2022 00:27:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5142710E43B;
	Wed,  5 Jan 2022 23:27:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ECCF10E22A
 for <freedreno@lists.freedesktop.org>; Wed,  5 Jan 2022 23:27:03 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id v15so1402537ljc.0
 for <freedreno@lists.freedesktop.org>; Wed, 05 Jan 2022 15:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RQh0W27z9Rv8021nYV+r9aQSz9qOZHpHoOU5e94BJ0c=;
 b=WmXDkjduVnMsUHg2LOv65HvhWzePdCIECoq3lazikJl7anZYZaokQ839BsCpFkGfvq
 3y9hMxtHV/ytT1WK5xnTTY4V+gPY3mx02MxNLqpMneQbARuampSNif3rlS3ldokxsG1l
 VUwLH6bY5gMmfGetALw+MeqBjj1WEmZxb4lTr3aqk4Djru+VAWAiVs9l80VyUGcGu5UM
 pRV+R3Rop1CacCnsBq1s7+frZCkGRWep89Re3RDw7b0MI6ip3lZGTdYcIfOLa/etIZGO
 0eLPg67lt2uX/2+yuNqfxCjkGrJ7mVK/xI9rfwq8yFwMh0q4KB+R0ab8EChvn3DONSou
 xnbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RQh0W27z9Rv8021nYV+r9aQSz9qOZHpHoOU5e94BJ0c=;
 b=wUua7ZraINSf9NQyCTmyBeo7ckLxzch4uBhzm23+CXPfEYtzS7amSXBN3uZ5rgMpFW
 AbR3DoUTY+oKyl8+LGmxDJLQbD37HEteTdEPJtQJRr8d+JLUek7+bT+/ImENdJWvJTDk
 F2FVIcpuzs5Bb8RorqgPbHCwiVraWp51ZTgmuSEvVtUXLTIzC2xBoTt/AxmqI0m5MyZ8
 NAVtpTTgwo/EN3ymiKZJCYuAFJ0mxSHpCcyhSDcfOqmtSGe6mj+yI4IrufPLthD6HvK6
 d6rwl4btpmhNDkbVgX2i3AIIagSY/5WX8pQZAeFjvZVPUiLAGdJUAYKZd6RHEbBymi/V
 nZ2A==
X-Gm-Message-State: AOAM533LLiuEKxJY/uiL7G+KB105l1xgRQpOJQblQEaVnxZljq8YE5Ho
 DzZam1flcLYY/qT5249hQfkKLg==
X-Google-Smtp-Source: ABdhPJwELggaCq5BR8C/eGMIQp7LDD84EX9N2Axz9S2aOKx7DwFioc78YAhCCQqEKoH/BP/sYqqySg==
X-Received: by 2002:a2e:9788:: with SMTP id y8mr44792149lji.135.1641425221796; 
 Wed, 05 Jan 2022 15:27:01 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id b29sm28730lfv.187.2022.01.05.15.27.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 15:27:01 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@quicinc.com>
Date: Thu,  6 Jan 2022 02:26:58 +0300
Message-Id: <20220105232700.444170-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 1/3] drm/msm: drop register logging support
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Register logging was used during early stages of msm driver development
to compare upstream and downstream register traces. However the tool was
never updated to work with mdp5 hardware. Later it was dropped
completely when Rob imported freedreno tools into mesa. All this makes
DRM_MSM_REGISTER_LOGGING irrelevant now, so it can be dropped.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/Kconfig   |  9 ---------
 drivers/gpu/drm/msm/msm_drv.c | 16 +---------------
 2 files changed, 1 insertion(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 1eae5a9645f4..9b019598e042 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -33,15 +33,6 @@ config DRM_MSM_GPU_STATE
 	depends on DRM_MSM && (DEBUG_FS || DEV_COREDUMP)
 	default y
 
-config DRM_MSM_REGISTER_LOGGING
-	bool "MSM DRM register logging"
-	depends on DRM_MSM
-	default n
-	help
-	  Compile in support for logging register reads/writes in a format
-	  that can be parsed by envytools demsm tool.  If enabled, register
-	  logging can be switched on via msm.reglog=y module param.
-
 config DRM_MSM_GPU_SUDO
 	bool "Enable SUDO flag on submits"
 	depends on DRM_MSM && EXPERT
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index ad35a5d94053..cfc9a0c9ec39 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -57,14 +57,6 @@ static const struct drm_mode_config_helper_funcs mode_config_helper_funcs = {
 	.atomic_commit_tail = msm_atomic_commit_tail,
 };
 
-#ifdef CONFIG_DRM_MSM_REGISTER_LOGGING
-static bool reglog;
-MODULE_PARM_DESC(reglog, "Enable register read/write logging");
-module_param(reglog, bool, 0600);
-#else
-#define reglog 0
-#endif
-
 #ifdef CONFIG_DRM_FBDEV_EMULATION
 static bool fbdev = true;
 MODULE_PARM_DESC(fbdev, "Enable fbdev compat layer");
@@ -150,9 +142,6 @@ static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name
 		return ERR_PTR(-ENOMEM);
 	}
 
-	if (reglog)
-		printk(KERN_DEBUG "IO:region %s %p %08lx\n", dbgname, ptr, size);
-
 	if (psize)
 		*psize = size;
 
@@ -179,16 +168,13 @@ void __iomem *msm_ioremap_size(struct platform_device *pdev, const char *name,
 
 void msm_writel(u32 data, void __iomem *addr)
 {
-	if (reglog)
-		printk(KERN_DEBUG "IO:W %p %08x\n", addr, data);
 	writel(data, addr);
 }
 
 u32 msm_readl(const void __iomem *addr)
 {
 	u32 val = readl(addr);
-	if (reglog)
-		pr_err("IO:R %p %08x\n", addr, val);
+
 	return val;
 }
 
-- 
2.34.1

