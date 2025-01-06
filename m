Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F25A02121
	for <lists+freedreno@lfdr.de>; Mon,  6 Jan 2025 09:50:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BD8B10E5CB;
	Mon,  6 Jan 2025 08:50:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ncLMoScw";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47AA010E5CE
 for <freedreno@lists.freedesktop.org>; Mon,  6 Jan 2025 08:50:19 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-aa6a38e64e4so236426166b.0
 for <freedreno@lists.freedesktop.org>; Mon, 06 Jan 2025 00:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736153358; x=1736758158; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4TdAMmMa/36NEGjSEYdL3bgt28g6gvQSvEW+I+wH1Zw=;
 b=ncLMoScwDiM0YJ3hQJLVrnR//wIlZlavbl1qTpeDK4jPlIF2mqPe6Y38EjRRmfe/0S
 pR+z4dM2J9IHO/rYHGChal6HsVDtunHTz+BGFVqTG/sms54/yf5nF1nhCQTNaWvdmDAO
 dPFea+tuqpzwgCOrN+512TjAR3bNLzdA9/qybNbkpRSMFt95DKghJMSR9uTbQ7MnUQCr
 n+5y/gJil5l3d9bqcB22ktUJ1O8AHjYPwi4sYV1WIOENdW1BhpX7NpdiVbxyJe6jCs5J
 2F3q6oaJPHA6DZhRRo3rBSfIKH0rMPOuCwb9SNTRN8RlZ7VkfpdFs1C3A0kQJtwSFIzJ
 wBmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736153358; x=1736758158;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4TdAMmMa/36NEGjSEYdL3bgt28g6gvQSvEW+I+wH1Zw=;
 b=ZHv7k1u1FduUBfPp4nYV8UgeQVYNN2JVH3mpWkU0roUdaQJz4PgT6GUp7J6T5TWAzR
 BWvvQFx/1GjeWwpq8JqoaR0MqvcLnvFX9cCNCUGml0HybdOybHGHR9AVMJOGlnci/RNn
 9zE9xARCyW+JuKR5VweNJvgOke8OiZo0+7uamsi1H8ngNYJ5alPHZrfP2EhSvWi2SC7/
 C29mPjQECzFS74y9jlp4OeuuxIz0TMYCVQuiTMnHEOPqBdxvbqAgE6FfnuxkBeRRObO1
 9/qPv/u/RACkzIlEC/BgEdbkOpy3PPBkd0X7RItJpbRSGG6ovgSTJ+XvmCFY6Nqsshqr
 nlBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjVQm4S+VJusgUGmGt308yWJrCCXBABUGVVtN2J7keLP2Xyio5SAiwQvfqYxfP3dKx3zhE7+Nfsn4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBXaFSEhZmOonH3++TIx8eZ7JJy8xeuEJ/X+2Qp/CHsRu6yv8p
 sPozgsPmXAT0h5WwaxKMah9GwDAWFxQsbCCx0igi43qb82MttUnjtV3PwZqjCZs=
X-Gm-Gg: ASbGncs0z1SAsDpxtzcBJthdR2422tKv2M1t8T/N0PKqzKckrvm7qk2KfTjscgZ+32X
 HqSGxqEb5quhs4IXTeyK+PPy3qZTg3NTOnn6qtsrRxuqI6uOpo6/hkg8xzkvDesL/qquO1A1Njg
 pIVtrYppSsH6pf+wnLBmJec5hR2NvMFW/OJK5oKhRZOHAiRuL/WmTq5ApUpVpmX8Sv9W/yLWRd5
 2h70iRQmcHZkANPdDlT0rTTwlv2lAiyd3JmQCSzKPpIOCM5I/dXgecTpocfVsDcPv3LxK0x
X-Google-Smtp-Source: AGHT+IGuPEKa7Y8wn+0uOc+1jJboUlCaDTd8y6XllLGlDHCj5Ga52ftDkrVG81dndBjt+D74ERoj/g==
X-Received: by 2002:a17:907:7e92:b0:aa6:a674:be3c with SMTP id
 a640c23a62f3a-aac2adb56d7mr2031661366b.5.1736153356335; 
 Mon, 06 Jan 2025 00:49:16 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0e82f1d2sm2222112466b.11.2025.01.06.00.49.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2025 00:49:15 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 06 Jan 2025 09:49:05 +0100
Subject: [PATCH 2/4] drm/msm/dsi: Simplify with dev_err_probe()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250106-drm-msm-cleanups-v1-2-271ff1c00795@linaro.org>
References: <20250106-drm-msm-cleanups-v1-0-271ff1c00795@linaro.org>
In-Reply-To: <20250106-drm-msm-cleanups-v1-0-271ff1c00795@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6526;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=lYvt5NktykrU4G4k710RiF9T2No7atg8/NYgEiARUDI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBne5kFeF66qxefqCkeKAcrKm6G/RWzKa1Lo5O6x
 9gKuZfWWj+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ3uZBQAKCRDBN2bmhouD
 13A/EACCArEJHarifsC36OvyaQw2iWP5JpsdZKyCO79MFzugRGcxQEyzTiD76HWcoC2bprBXWcV
 mC0MtsPseAqH8bFRdpYIBGM7Y4Gf47s2G7MRykpCTKhr9LcSYj2IxGGsnGCziJG5v7T5iemwMAj
 uYvAFEnrvcS4mkVUxOzB6aJpEL+DbC3XXtRtx7rdH0/15gEPtcq11hJaxmzSeZ5QJPXnQEqc+Xb
 NBKKOsaO+nafD0HpK3UhrlpuSP8T6TNcuz3k1VO4RxYHAmUmcwYhChjpt/3IstlyS8RG79pNfXV
 jRYO9X2LnBPaa4QgNLk2FwUsKZyieP5oKqpc043UtKAyUrnqEP7JI3dvhnjt9AlgKKaDM410eO/
 wEAzzv67SOIy1MwMh5N68UjcjM6ukxTOnhHw/SUuGPs9LT958aaavKh6vWif7xZWbzWl154Td72
 qbm6cvOdJnltxlMSbzrw/R3OjcgUuwiSO92rmaFCXSPUUHgLmHyHxrpFwdHbCD/TYtki7Kuh00L
 EOAa5y4hs1Sth9fQ59nLsuEz4VEEG/HutyLPpsBNDuoxCdqFQs5R1ek7df1WcGBynYvKkOMpFJs
 QkIo8A83bTFKTMrh2plnrqA4ecPm+yTmDArVLXlrz1bvCXWrslhUr+1g52EsmMbbccfH/OO6Yj8
 W5cpQ0NNLsNjBUQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

dsi_clk_init() and msm_dsi_host_init() are called only from platform
driver probe function, so using dev_err_probe is both appropriate and
beneficial:
 - Properly marks device deferred probe status,
 - Avoids dmesg flood on probe deferrals,
 - Already incorporates printing ERR value,
 - Shows device name (in contrast to pr_err()),
 - Makes code smaller and simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 100 +++++++++++++++----------------------
 1 file changed, 41 insertions(+), 59 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 86ac145076416fa7651d18820266a00d28e44b6f..4a2ad04eea7359545a088bdc63907f6b3e5615bd 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -200,7 +200,8 @@ static const struct msm_dsi_cfg_handler *dsi_get_config(
 
 	ahb_clk = msm_clk_get(msm_host->pdev, "iface");
 	if (IS_ERR(ahb_clk)) {
-		pr_err("%s: cannot get interface clock\n", __func__);
+		dev_err_probe(dev, PTR_ERR(ahb_clk), "%s: cannot get interface clock\n",
+			      __func__);
 		goto exit;
 	}
 
@@ -208,13 +209,13 @@ static const struct msm_dsi_cfg_handler *dsi_get_config(
 
 	ret = clk_prepare_enable(ahb_clk);
 	if (ret) {
-		pr_err("%s: unable to enable ahb_clk\n", __func__);
+		dev_err_probe(dev, ret, "%s: unable to enable ahb_clk\n", __func__);
 		goto runtime_put;
 	}
 
 	ret = dsi_get_version(msm_host->ctrl_base, &major, &minor);
 	if (ret) {
-		pr_err("%s: Invalid version\n", __func__);
+		dev_err_probe(dev, ret, "%s: Invalid version\n", __func__);
 		goto disable_clks;
 	}
 
@@ -281,39 +282,31 @@ static int dsi_clk_init(struct msm_dsi_host *msm_host)
 	msm_host->num_bus_clks = cfg->num_bus_clks;
 
 	ret = devm_clk_bulk_get(&pdev->dev, msm_host->num_bus_clks, msm_host->bus_clks);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "Unable to get clocks, ret = %d\n", ret);
-		goto exit;
-	}
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret, "Unable to get clocks\n");
 
 	/* get link and source clocks */
 	msm_host->byte_clk = msm_clk_get(pdev, "byte");
-	if (IS_ERR(msm_host->byte_clk)) {
-		ret = PTR_ERR(msm_host->byte_clk);
-		pr_err("%s: can't find dsi_byte clock. ret=%d\n",
-			__func__, ret);
-		goto exit;
-	}
+	if (IS_ERR(msm_host->byte_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(msm_host->byte_clk),
+				     "%s: can't find dsi_byte clock\n",
+				     __func__);
 
 	msm_host->pixel_clk = msm_clk_get(pdev, "pixel");
-	if (IS_ERR(msm_host->pixel_clk)) {
-		ret = PTR_ERR(msm_host->pixel_clk);
-		pr_err("%s: can't find dsi_pixel clock. ret=%d\n",
-			__func__, ret);
-		goto exit;
-	}
+	if (IS_ERR(msm_host->pixel_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(msm_host->pixel_clk),
+				     "%s: can't find dsi_pixel clock\n",
+				     __func__);
 
 	msm_host->esc_clk = msm_clk_get(pdev, "core");
-	if (IS_ERR(msm_host->esc_clk)) {
-		ret = PTR_ERR(msm_host->esc_clk);
-		pr_err("%s: can't find dsi_esc clock. ret=%d\n",
-			__func__, ret);
-		goto exit;
-	}
+	if (IS_ERR(msm_host->esc_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(msm_host->esc_clk),
+				     "%s: can't find dsi_esc clock\n",
+				     __func__);
 
 	if (cfg_hnd->ops->clk_init_ver)
 		ret = cfg_hnd->ops->clk_init_ver(msm_host);
-exit:
+
 	return ret;
 }
 
@@ -1879,31 +1872,28 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 	msm_dsi->host = &msm_host->base;
 
 	ret = dsi_host_parse_dt(msm_host);
-	if (ret) {
-		pr_err("%s: failed to parse dt\n", __func__);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "%s: failed to parse dt\n",
+				     __func__);
 
 	msm_host->ctrl_base = msm_ioremap_size(pdev, "dsi_ctrl", &msm_host->ctrl_size);
-	if (IS_ERR(msm_host->ctrl_base)) {
-		pr_err("%s: unable to map Dsi ctrl base\n", __func__);
-		return PTR_ERR(msm_host->ctrl_base);
-	}
+	if (IS_ERR(msm_host->ctrl_base))
+		return dev_err_probe(&pdev->dev, PTR_ERR(msm_host->ctrl_base),
+				     "%s: unable to map Dsi ctrl base\n", __func__);
 
 	pm_runtime_enable(&pdev->dev);
 
 	msm_host->cfg_hnd = dsi_get_config(msm_host);
-	if (!msm_host->cfg_hnd) {
-		pr_err("%s: get config failed\n", __func__);
-		return -EINVAL;
-	}
+	if (!msm_host->cfg_hnd)
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "%s: get config failed\n", __func__);
 	cfg = msm_host->cfg_hnd->cfg;
 
 	msm_host->id = dsi_host_get_id(msm_host);
-	if (msm_host->id < 0) {
-		pr_err("%s: unable to identify DSI host index\n", __func__);
-		return msm_host->id;
-	}
+	if (msm_host->id < 0)
+		return dev_err_probe(&pdev->dev, msm_host->id,
+				     "%s: unable to identify DSI host index\n",
+				     __func__);
 
 	/* fixup base address by io offset */
 	msm_host->ctrl_base += cfg->io_offset;
@@ -1915,10 +1905,8 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 		return ret;
 
 	ret = dsi_clk_init(msm_host);
-	if (ret) {
-		pr_err("%s: unable to initialize dsi clks\n", __func__);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "%s: unable to initialize dsi clks\n", __func__);
 
 	msm_host->rx_buf = devm_kzalloc(&pdev->dev, SZ_4K, GFP_KERNEL);
 	if (!msm_host->rx_buf) {
@@ -1931,26 +1919,20 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 		return ret;
 	/* OPP table is optional */
 	ret = devm_pm_opp_of_add_table(&pdev->dev);
-	if (ret && ret != -ENODEV) {
-		dev_err(&pdev->dev, "invalid OPP table in device tree\n");
-		return ret;
-	}
+	if (ret && ret != -ENODEV)
+		return dev_err_probe(&pdev->dev, ret, "invalid OPP table in device tree\n");
 
 	msm_host->irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
-	if (!msm_host->irq) {
-		dev_err(&pdev->dev, "failed to get irq\n");
-		return -EINVAL;
-	}
+	if (!msm_host->irq)
+		return dev_err_probe(&pdev->dev, -EINVAL, "failed to get irq\n");
 
 	/* do not autoenable, will be enabled later */
 	ret = devm_request_irq(&pdev->dev, msm_host->irq, dsi_host_irq,
 			IRQF_TRIGGER_HIGH | IRQF_NO_AUTOEN,
 			"dsi_isr", msm_host);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "failed to request IRQ%u: %d\n",
-				msm_host->irq, ret);
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret, "failed to request IRQ%u\n",
+				     msm_host->irq);
 
 	init_completion(&msm_host->dma_comp);
 	init_completion(&msm_host->video_comp);

-- 
2.43.0

