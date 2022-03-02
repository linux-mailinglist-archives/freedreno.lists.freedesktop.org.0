Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A741F4C9A65
	for <lists+freedreno@lfdr.de>; Wed,  2 Mar 2022 02:27:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2445610E927;
	Wed,  2 Mar 2022 01:27:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8D4C10E927
 for <freedreno@lists.freedesktop.org>; Wed,  2 Mar 2022 01:27:40 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id l25so411494oic.13
 for <freedreno@lists.freedesktop.org>; Tue, 01 Mar 2022 17:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Tv+YgwvAaGuJMMXzyf8UKPqJBKWn/rWVKPq429RSyAw=;
 b=x3LtYqtKWT+YwkG6aAomkFJqE6JU/MeXuxpFJ2KtyAYFGYKoKOeI40r8rnf/ayswII
 E47xrummwGUAXr1NOPjw4BOQY0pDjWlpO58zJuELtiacrBW/iJFYzzd9s1X5t5EM11q1
 09kpz+lXNSepjtrEr3XjDD5D7usBJ7ZJOKN/ttIZC0AzyNoVFcM7YRhBWsB4dZOASqg5
 T/bdPwwM3Nw8IhMqH9O7rYIvI4y02rvoj7RAZFy2pWkTf6rWbQRQvIs5ltlBMzMAYmcm
 uX/hyel18lnuhsEddrvP0SUcJBP+3lZ/gAsd5DZtrCLGAaDhjlr9tUQ1U7TqWPd1LDjH
 z1fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Tv+YgwvAaGuJMMXzyf8UKPqJBKWn/rWVKPq429RSyAw=;
 b=W8uWUrrSLHPEZ9bCvY37FDhW0ywJN9F6xUfj9MwPL9kyOlfUyZtG+jupplRGFp7gps
 DEbzQX9YcMCn+ZSw0Cq1j1E7YqG8RQNwnkA3fHKu+4a1RtUnqbALw1PTEqNTbn+lwsUe
 U6nCNvugLjSnXIC/E6ARud4wwWUEATwKiBlAT7q66O9ewdtKeb8JLKz/aSvEvYLZHRih
 V0Y/Qa+Bl+SgshC1z/Ot53y4GVmhkkCpbyhEbDXJwudJ5liN+3px+KSpecnMvlpG02XC
 hxxKFwTazo57I8iaoSfRQN2fan1GEtfKbLPT+ssiGt0lzUR/rnuYn+DbZ99gAh7q5CWS
 vSCg==
X-Gm-Message-State: AOAM532L+uMG7zxowPg3Bm6H4jZFnrH9dwBm3o9uziqyXfmtv7n4JoJM
 VLoiHkepe+0w29fZqEEJMq2/Bw==
X-Google-Smtp-Source: ABdhPJw1w163ZojylGuWVadLsX0xJp3N7FA4hCgFYCgLBgnY+wNU4byJA3FAoTr+v9eYoM7s9CYlaQ==
X-Received: by 2002:a05:6808:e89:b0:2cf:cad3:e427 with SMTP id
 k9-20020a0568080e8900b002cfcad3e427mr15963208oil.20.1646184460000; 
 Tue, 01 Mar 2022 17:27:40 -0800 (PST)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id
 t9-20020a056871054900b000c53354f98esm6728948oal.13.2022.03.01.17.27.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 17:27:39 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>
Date: Tue,  1 Mar 2022 17:29:31 -0800
Message-Id: <20220302012931.4107196-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220302012931.4107196-1-bjorn.andersson@linaro.org>
References: <20220302012931.4107196-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 2/2] drm/msm/dpu: Issue MDSS reset during
 initialization
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

It's typical for the bootloader to bring up the display for showing a
boot splash or efi framebuffer. But in some cases the kernel driver ends
up only partially configuring (in particular) the DPU, which might
result in e.g. that two different data paths attempts to push data to
the interface - with resulting graphical artifacts.

Naturally the end goal would be to inherit the bootloader's
configuration and provide the user with a glitch free handover from the
boot configuration to a running DPU.

But as implementing seamless transition from the bootloader
configuration to the running OS will be a considerable effort, start by
simply resetting the entire MDSS to its power-on state, to avoid the
partial configuration.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Rather than trying to deconfigure individual pieces of the DPU, reset the
  entire block.

 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c | 18 ++++++++++++++++++
 drivers/gpu/drm/msm/msm_drv.c            |  4 ++++
 drivers/gpu/drm/msm/msm_kms.h            |  1 +
 3 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
index b10ca505f9ac..419eaaefe606 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
@@ -7,6 +7,7 @@
 #include <linux/irqchip.h>
 #include <linux/irqdesc.h>
 #include <linux/irqchip/chained_irq.h>
+#include <linux/reset.h>
 #include "dpu_kms.h"
 
 #define to_dpu_mdss(x) container_of(x, struct dpu_mdss, base)
@@ -31,6 +32,7 @@ struct dpu_mdss {
 	void __iomem *mmio;
 	struct clk_bulk_data *clocks;
 	size_t num_clocks;
+	struct reset_control *reset;
 	struct dpu_irq_controller irq_controller;
 };
 
@@ -197,10 +199,18 @@ static void dpu_mdss_destroy(struct msm_mdss *mdss)
 	dpu_mdss->mmio = NULL;
 }
 
+static int dpu_mdss_reset(struct msm_mdss *mdss)
+{
+	struct dpu_mdss *dpu_mdss = to_dpu_mdss(mdss);
+
+	return reset_control_reset(dpu_mdss->reset);
+}
+
 static const struct msm_mdss_funcs mdss_funcs = {
 	.enable	= dpu_mdss_enable,
 	.disable = dpu_mdss_disable,
 	.destroy = dpu_mdss_destroy,
+	.reset = dpu_mdss_reset,
 };
 
 int dpu_mdss_init(struct platform_device *pdev)
@@ -227,6 +237,13 @@ int dpu_mdss_init(struct platform_device *pdev)
 	}
 	dpu_mdss->num_clocks = ret;
 
+	dpu_mdss->reset = devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
+	if (IS_ERR(dpu_mdss->reset)) {
+		ret = PTR_ERR(dpu_mdss->reset);
+		DPU_ERROR("failed to acquire mdss reset, ret=%d", ret);
+		goto reset_parse_err;
+	}
+
 	dpu_mdss->base.dev = &pdev->dev;
 	dpu_mdss->base.funcs = &mdss_funcs;
 
@@ -252,6 +269,7 @@ int dpu_mdss_init(struct platform_device *pdev)
 irq_error:
 	_dpu_mdss_irq_domain_fini(dpu_mdss);
 irq_domain_error:
+reset_parse_err:
 clk_parse_err:
 	if (dpu_mdss->mmio)
 		devm_iounmap(&pdev->dev, dpu_mdss->mmio);
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 129fa841ac22..7595f83da3f1 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -388,6 +388,10 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	if (ret)
 		return ret;
 
+	/* Issue a reset of the entire MDSS */
+	if (priv->mdss && priv->mdss->funcs->reset)
+		priv->mdss->funcs->reset(priv->mdss);
+
 	/* Bind all our sub-components: */
 	ret = component_bind_all(dev, ddev);
 	if (ret)
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 2a4f0526cb98..716a34fca1cd 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -205,6 +205,7 @@ struct msm_mdss_funcs {
 	int (*enable)(struct msm_mdss *mdss);
 	int (*disable)(struct msm_mdss *mdss);
 	void (*destroy)(struct msm_mdss *mdss);
+	int (*reset)(struct msm_mdss *mdss);
 };
 
 struct msm_mdss {
-- 
2.33.1

