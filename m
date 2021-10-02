Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A72741F8F4
	for <lists+freedreno@lfdr.de>; Sat,  2 Oct 2021 03:08:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC3D86E804;
	Sat,  2 Oct 2021 01:08:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10AE16E802
 for <freedreno@lists.freedesktop.org>; Sat,  2 Oct 2021 01:08:17 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id j5so40275919lfg.8
 for <freedreno@lists.freedesktop.org>; Fri, 01 Oct 2021 18:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TwnUq8SXZ8u06PKKxQfO24AMGZAo3ARGDD9smY+hrSo=;
 b=WBLFAXKP/avkEIJvCsu2UUbycozUidIo39NMEjAlaseENxcmjKucU7jw6ghx4sUcMJ
 sxGEu+/YATqNePzUBS9j4sv7l2W2M+YqciWA9+DKhBni8J0Rr7N4u3vcTtt92JbZyxjr
 fyH1oU040czfg6N/z7ThnmLXe+L3EiebUnSoSrDvgsWiG6Kf8spQeRC1w7hZsbKRPkUe
 qvk0tsl3TXU/NVKbEtqTM1iQNwuHE1IUIgb/hHV1nUkjX4dwEotfaZu0rw+nswafi1rI
 2PgKz9DNz6Offsf7ORTFGtPK05W4MajfL3RJJSHSVwBGBbjIcOgnIczhLCtLtZTFfA4F
 advg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TwnUq8SXZ8u06PKKxQfO24AMGZAo3ARGDD9smY+hrSo=;
 b=fHeCpch54C1wE8Hfvr7rk9DXGE1Mj1Yx0fTw2lbSSJa5q+ocvYrtvvB31k7Fju2qVR
 oKnt7VjoNL+4cmkEDInkVdgOTQ9lZjS/iKGMIPguBCORJw0Vb/fNDmIre1FY05r5Y/Av
 FiNQ/qJAcTzgftYX9WBkXCgpluxm+Wq13frKUdYDLGOYcSQxq4YQHVj/jcJAsifq9g9X
 LDQng5s7fBF9sw4ldeVWtUmnjAINP1gCd/t+vA/Ws75p37iGGLs3fP352ZkK+yJNsO81
 Te1c1BZ7qNjvdz75Vb2hY4ro39MxhUUo9mebmO5iCBP3DLu8a6jcMroLcI0CmkycmeYV
 8bGg==
X-Gm-Message-State: AOAM533k15IYDNYEeCw7PNhu1mseRo+LpACZlCTApPkAQTXnijGzjHv+
 K2w0AduwjfIfkP+KLSfl/28WyA==
X-Google-Smtp-Source: ABdhPJz1h8wdgSqieaJyrzejlho/AFEp+e7W+xkxBieMCy2DG0EWozlg2gvagfH74adYlaiexki1ug==
X-Received: by 2002:a2e:a4ca:: with SMTP id p10mr1048203ljm.379.1633136895276; 
 Fri, 01 Oct 2021 18:08:15 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id k17sm892673lfb.233.2021.10.01.18.08.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 18:08:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Date: Sat,  2 Oct 2021 04:08:12 +0300
Message-Id: <20211002010814.647394-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 1/3] mfd: qcom-pm8xxx: switch away from using
 chained IRQ handlers
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

PM8xxx PMIC family uses GPIO as parent IRQ. Using it together with the
irq_set_chained_handler_and_data() results in warnings from the GPIOLIB
as in this path the IRQ resources are not allocated (and thus the
corresponding GPIO is not marked as used for the IRQ. Use request_irq so
that the IRQ resources are proprely setup.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/mfd/qcom-pm8xxx.c | 39 ++++++++++++++++-----------------------
 1 file changed, 16 insertions(+), 23 deletions(-)

diff --git a/drivers/mfd/qcom-pm8xxx.c b/drivers/mfd/qcom-pm8xxx.c
index ec18a04de355..2f2734ba5273 100644
--- a/drivers/mfd/qcom-pm8xxx.c
+++ b/drivers/mfd/qcom-pm8xxx.c
@@ -65,7 +65,7 @@
 struct pm_irq_data {
 	int num_irqs;
 	struct irq_chip *irq_chip;
-	void (*irq_handler)(struct irq_desc *desc);
+	irq_handler_t irq_handler;
 };
 
 struct pm_irq_chip {
@@ -169,19 +169,16 @@ static int pm8xxx_irq_master_handler(struct pm_irq_chip *chip, int master)
 	return ret;
 }
 
-static void pm8xxx_irq_handler(struct irq_desc *desc)
+static irqreturn_t pm8xxx_irq_handler(int irq, void *data)
 {
-	struct pm_irq_chip *chip = irq_desc_get_handler_data(desc);
-	struct irq_chip *irq_chip = irq_desc_get_chip(desc);
+	struct pm_irq_chip *chip = data;
 	unsigned int root;
 	int	i, ret, masters = 0;
 
-	chained_irq_enter(irq_chip, desc);
-
 	ret = regmap_read(chip->regmap, SSBI_REG_ADDR_IRQ_ROOT, &root);
 	if (ret) {
 		pr_err("Can't read root status ret=%d\n", ret);
-		return;
+		return IRQ_NONE;
 	}
 
 	/* on pm8xxx series masters start from bit 1 of the root */
@@ -192,7 +189,7 @@ static void pm8xxx_irq_handler(struct irq_desc *desc)
 		if (masters & (1 << i))
 			pm8xxx_irq_master_handler(chip, i);
 
-	chained_irq_exit(irq_chip, desc);
+	return IRQ_HANDLED;
 }
 
 static void pm8821_irq_block_handler(struct pm_irq_chip *chip,
@@ -230,19 +227,17 @@ static inline void pm8821_irq_master_handler(struct pm_irq_chip *chip,
 			pm8821_irq_block_handler(chip, master, block);
 }
 
-static void pm8821_irq_handler(struct irq_desc *desc)
+static irqreturn_t pm8821_irq_handler(int irq, void *data)
 {
-	struct pm_irq_chip *chip = irq_desc_get_handler_data(desc);
-	struct irq_chip *irq_chip = irq_desc_get_chip(desc);
+	struct pm_irq_chip *chip = data;
 	unsigned int master;
 	int ret;
 
-	chained_irq_enter(irq_chip, desc);
 	ret = regmap_read(chip->regmap,
 			  PM8821_SSBI_REG_ADDR_IRQ_MASTER0, &master);
 	if (ret) {
 		pr_err("Failed to read master 0 ret=%d\n", ret);
-		goto done;
+		return IRQ_NONE;
 	}
 
 	/* bits 1 through 7 marks the first 7 blocks in master 0 */
@@ -251,19 +246,18 @@ static void pm8821_irq_handler(struct irq_desc *desc)
 
 	/* bit 0 marks if master 1 contains any bits */
 	if (!(master & BIT(0)))
-		goto done;
+		return IRQ_NONE;
 
 	ret = regmap_read(chip->regmap,
 			  PM8821_SSBI_REG_ADDR_IRQ_MASTER1, &master);
 	if (ret) {
 		pr_err("Failed to read master 1 ret=%d\n", ret);
-		goto done;
+		return IRQ_NONE;
 	}
 
 	pm8821_irq_master_handler(chip, 1, master);
 
-done:
-	chained_irq_exit(irq_chip, desc);
+	return IRQ_HANDLED;
 }
 
 static void pm8xxx_irq_mask_ack(struct irq_data *d)
@@ -574,14 +568,15 @@ static int pm8xxx_probe(struct platform_device *pdev)
 	if (!chip->irqdomain)
 		return -ENODEV;
 
-	irq_set_chained_handler_and_data(irq, data->irq_handler, chip);
+	rc = devm_request_irq(&pdev->dev, irq, data->irq_handler, 0, dev_name(&pdev->dev), chip);
+	if (rc)
+		return rc;
+
 	irq_set_irq_wake(irq, 1);
 
 	rc = of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
-	if (rc) {
-		irq_set_chained_handler_and_data(irq, NULL, NULL);
+	if (rc)
 		irq_domain_remove(chip->irqdomain);
-	}
 
 	return rc;
 }
@@ -594,11 +589,9 @@ static int pm8xxx_remove_child(struct device *dev, void *unused)
 
 static int pm8xxx_remove(struct platform_device *pdev)
 {
-	int irq = platform_get_irq(pdev, 0);
 	struct pm_irq_chip *chip = platform_get_drvdata(pdev);
 
 	device_for_each_child(&pdev->dev, NULL, pm8xxx_remove_child);
-	irq_set_chained_handler_and_data(irq, NULL, NULL);
 	irq_domain_remove(chip->irqdomain);
 
 	return 0;
-- 
2.33.0

