Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B945095B2
	for <lists+freedreno@lfdr.de>; Thu, 21 Apr 2022 06:13:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32E5F10E4E5;
	Thu, 21 Apr 2022 04:13:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81AC210E4F2
 for <freedreno@lists.freedesktop.org>; Thu, 21 Apr 2022 04:13:48 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-e2afb80550so4229433fac.1
 for <freedreno@lists.freedesktop.org>; Wed, 20 Apr 2022 21:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YxJkE8G1CRaDGILe7+GoWJTE8swqHANzIKXbTjCxfWA=;
 b=wmc+QCZr7W/1S6Qi4m8vCRTullRSJITUAjG2JkXsl8y5jZBmRrU28R4meMbAFMy3j4
 xQHQfXWzBZdgs6/PiN1QjCK7nca7KkIULjqpfArwqsljTp9SwXfgOAPvYa/92cfETLAO
 LH346HKowgQBSMij8Rm6I/QklFiHzmza27cpSEJEdeZ83KaCQ/3QihpNz/jZGXDcdZXB
 rgfhCdFLPpwEhmrawwEsfA7x/XzslBP9+9jEx720HPu5cdO5e9TWoRCQ+S0ou0bYepRe
 DpwKKaqQtinBGgGsOfZBxZeQVVlZTAvWQhsNDyFZh2IskOh9wH/UhEVMJURzOankc7i2
 6Jog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YxJkE8G1CRaDGILe7+GoWJTE8swqHANzIKXbTjCxfWA=;
 b=ilmwJaRRcfPMiVpwOfd/vzvnUEXg6DTvfX7Oq1QH5yBm4OG+dl6MEtjpq1Escjgvrb
 DGsGKHRcY/dZQ9G0200/QkKaWPNDvDIahn/J6vokhbsVtegj12uypMuAK95EVzs2Ec1a
 T2gI7WQlcmrX5ckcX3Tj6/nmYb55X33/QzoQkhHKlRoLolX0Z/8X064xGnaMtoOtk28W
 5leFJna4NI61fVbGkMDmSf2zv5dOhE44WUC+EW6QGUmiGpH4YJmgAkiMnPMVz6P8wEaN
 K3/oJWqy0yXCRIufvj60Wq//38yjXgVwXsYYXXN7e7RJYscu0HG92RxDhjN/3Z82zhAO
 ZZNg==
X-Gm-Message-State: AOAM532mqA+20ItA+dKn+Plz7jVXHlspQd08namsXFumzkTQmQdder46
 X0KxwZmZpBpL8taabJ9Tzf9+6A==
X-Google-Smtp-Source: ABdhPJwj+TTo8+SybVk/1ckcBy63VRtH0SyOXR6xQENQRDdLYgNccjsgslQORDGkN774JfFw5rMNyQ==
X-Received: by 2002:a05:6870:a707:b0:e2:cc85:d98 with SMTP id
 g7-20020a056870a70700b000e2cc850d98mr3085213oam.131.1650514427764; 
 Wed, 20 Apr 2022 21:13:47 -0700 (PDT)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id
 h186-20020acab7c3000000b002ef5106248asm7115512oif.45.2022.04.20.21.13.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 21:13:47 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 20 Apr 2022 21:15:50 -0700
Message-Id: <20220421041550.643964-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220421041550.643964-1-bjorn.andersson@linaro.org>
References: <20220421041550.643964-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 2/2] drm/msm/dpu: Issue MDSS reset during
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
Cc: freedreno@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Sean Paul <sean@poorly.run>
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

Changes since v3:
- Rebased upon the mdss dpu/mdp restructuring (https://patchwork.freedesktop.org/series/98525/)

 drivers/gpu/drm/msm/msm_mdss.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index f6f0d0fa5ab2..20f154dda9cf 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -4,11 +4,13 @@
  */
 
 #include <linux/clk.h>
+#include <linux/delay.h>
 #include <linux/irq.h>
 #include <linux/irqchip.h>
 #include <linux/irqdesc.h>
 #include <linux/irqchip/chained_irq.h>
 #include <linux/pm_runtime.h>
+#include <linux/reset.h>
 
 #include "msm_drv.h"
 #include "msm_kms.h"
@@ -193,6 +195,32 @@ static void msm_mdss_destroy(struct msm_mdss *msm_mdss)
 	irq_set_chained_handler_and_data(irq, NULL, NULL);
 }
 
+static int msm_mdss_reset(struct device *dev)
+{
+	struct reset_control *reset;
+
+	reset = reset_control_get_optional_exclusive(dev, NULL);
+	if (!reset) {
+		/* Optional reset not specified */
+		return 0;
+	} else if (IS_ERR(reset)) {
+		return dev_err_probe(dev, PTR_ERR(reset),
+				     "failed to acquire mdss reset\n");
+	}
+
+	reset_control_assert(reset);
+	/*
+	 * Tests indicate that reset has to be held for some period of time,
+	 * make it one frame in a typical system
+	 */
+	msleep(20);
+	reset_control_deassert(reset);
+
+	reset_control_put(reset);
+
+	return 0;
+}
+
 /*
  * MDP5 MDSS uses at most three specified clocks.
  */
@@ -229,6 +257,10 @@ static struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool is_mdp5
 	int ret;
 	int irq;
 
+	ret = msm_mdss_reset(&pdev->dev);
+	if (ret)
+		return ERR_PTR(ret);
+
 	msm_mdss = devm_kzalloc(&pdev->dev, sizeof(*msm_mdss), GFP_KERNEL);
 	if (!msm_mdss)
 		return ERR_PTR(-ENOMEM);
-- 
2.35.1

