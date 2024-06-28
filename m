Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B9F91B5FC
	for <lists+freedreno@lfdr.de>; Fri, 28 Jun 2024 07:20:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C891E10EBB2;
	Fri, 28 Jun 2024 05:20:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Zs8xyHF/";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A4E910EBB0
 for <freedreno@lists.freedesktop.org>; Fri, 28 Jun 2024 05:20:29 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-52cf4ca8904so276596e87.3
 for <freedreno@lists.freedesktop.org>; Thu, 27 Jun 2024 22:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719552027; x=1720156827; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=CE116OZhrAVtMTDLnoQyRJAzaM6771HphQwBOF0FA8Y=;
 b=Zs8xyHF/q4LBZrYC+ORoBVS2Zl2Hu4EV+OOCL0JtLkvSOK/9s231bKIhBN3jibMhQu
 BEqrL1LM+hVwJ1OUhyDKtQxr709ocawTdZbMYL8qUAiLgfKut+IiPj98Z/FMTQ4mOnWu
 NjVA7ytMYgu63OuRI1k7RLdltMP3kps1HT0OUDn6M5+7hnwbKaDr8nAbA1dLZ963M+81
 LDS/M3rYTPOBwSTSRmR8VVJz47IV4ady9dbBDphskDCkvy2AelgD5YyL8Hr+WWGjgWdz
 /QxALk+HDwM0XI/DX/ikAiuVT8gr/ODp7vY6hvShTAikvvvC34W53FVl20FHD5Yxk5R2
 ciyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719552027; x=1720156827;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CE116OZhrAVtMTDLnoQyRJAzaM6771HphQwBOF0FA8Y=;
 b=uvRwvCOvmdVPZZmCANKCDu1EsNRARBkyQnfDEYc5CyY7lF8BoAe19C4GzarZES9SSC
 bRp2eXHF9SPolGZpez/i65plIJn0fp17P+0/c866YqhAojmB7gMTe5TEa6oQYlU6PeLZ
 9EMYB8/oZL/cqrGH1w56ePWPjF8tgdRItCjqIKxzqAGdmrOrm4NbidEQdDmki5sDEmnN
 qYpEzlJlKuGHRwxY9wPU4NAiub9HA98w+sZ127HlE2Y+6MNyMto6T1bVukm8SfybW+0r
 CJwAq2I9DH9qhq0uWKK5997P36cnoT3C0Oq83aNKL2Kzb/E+59ragUpsxkeMdQiY0u8v
 f1Ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPeRP5/p11VLz+v9cvsffQDsNoLlz+TwaFGvEI4hy59GUo57LAINsDo/IprzcHXNqUETk6k1SpipDA3pgHetkNNFAqUat7xCmj5fjxLcXD
X-Gm-Message-State: AOJu0Ywk496qSMNzfd1X+jQlgLpDOSdyA5YtjUZ6Mg4FLU/aJG0QD1Nr
 Zd5qMyAtyVKOO77N2cybLuqbodNJSSM0aOSeQKGVFdfeJZNHsGG7mChlwDBJiHc=
X-Google-Smtp-Source: AGHT+IF4eRuRBZixOvQGuZCBjBcZCcjgRAouzf5T2iMOhKSrhskvdlh7B9lkuHj35Rhv+diaJJm5Xw==
X-Received: by 2002:ac2:4c84:0:b0:52e:7125:c70a with SMTP id
 2adb3069b0e04-52e7125c847mr2357345e87.47.1719552027519; 
 Thu, 27 Jun 2024 22:20:27 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52e7ab101c5sm167736e87.79.2024.06.27.22.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jun 2024 22:20:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 28 Jun 2024 08:20:22 +0300
Subject: [PATCH 1/2] clk: qocm: add qcom_cc_map_norequest
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240628-gpucc-no-request-v1-1-b680c2f90817@linaro.org>
References: <20240628-gpucc-no-request-v1-0-b680c2f90817@linaro.org>
In-Reply-To: <20240628-gpucc-no-request-v1-0-b680c2f90817@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2058;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=FEeU+ilaz87za6zCPoFOaXlZVVMvh4npbKUCi8WeMY8=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1qdh1RGtLDqrSahc1eU78cyaX6fMsk2Ms1cU3jH+5Mnr
 3jPjJ/YyWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJ5Exi/6en+kjt9wSPSSc/
 v3DbN6/GxTHnVxK//+UQj21NK55PelrscvGXSN5NZ5aDAdZ1EZEOFx7NyMiT2Pow/6S56eZqtwu
 a6hfquOV5D3suq7grr1S8Z5Zm4J4Im6xIoSr9bvGmlvV8sjF2mzk/v1/sH+MinDzDnrc28kXT8g
 snlOR+Gy08ZCx89p59/NzM5+EMgRI+ywMbfHUbJsv+0JwhmvnbbmfFYYdKEX3HuV31jkwuzGu4Y
 xd0eZhouamI7JpY2G21Pqgut1OukDU7zS3njblriP2avWJJLB1ys3li1N6wP77Wz2p1Kkw18+4X
 l+T0d+ekTFuzY1TOXNx0v9wj3bnDZ4sO942MF1tNrwAA
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

The GPU clock controllers use memory region that is a part of the GMU's
memory region. Add qcom_cc_map_norequest() to be used by GPUCC, so that
GPU driver can use devm_ioremap_resource for GMU resources.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/common.c | 20 ++++++++++++++++++++
 drivers/clk/qcom/common.h |  2 ++
 2 files changed, 22 insertions(+)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index c92e10c60322..dcc73bc22606 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -113,6 +113,26 @@ qcom_cc_map(struct platform_device *pdev, const struct qcom_cc_desc *desc)
 }
 EXPORT_SYMBOL_GPL(qcom_cc_map);
 
+/* gpucc shares memory region with GMU, don't request the region */
+struct regmap *
+qcom_cc_map_norequest(struct platform_device *pdev, const struct qcom_cc_desc *desc)
+{
+	struct device *dev = &pdev->dev;
+	struct resource *r;
+	void __iomem *base;
+
+	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!r)
+		return ERR_PTR(dev_err_probe(dev, -EINVAL, "resource not found\n"));
+
+	base = devm_ioremap(dev, r->start, resource_size(r));
+	if (IS_ERR(base))
+		return ERR_CAST(base);
+
+	return devm_regmap_init_mmio(dev, base, desc->config);
+}
+EXPORT_SYMBOL_GPL(qcom_cc_map_norequest);
+
 void
 qcom_pll_set_fsm_mode(struct regmap *map, u32 reg, u8 bias_count, u8 lock_count)
 {
diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
index d048bdeeba10..6cab7805a92c 100644
--- a/drivers/clk/qcom/common.h
+++ b/drivers/clk/qcom/common.h
@@ -60,6 +60,8 @@ extern int qcom_cc_register_sleep_clk(struct device *dev);
 
 extern struct regmap *qcom_cc_map(struct platform_device *pdev,
 				  const struct qcom_cc_desc *desc);
+extern struct regmap *qcom_cc_map_norequest(struct platform_device *pdev,
+					    const struct qcom_cc_desc *desc);
 extern int qcom_cc_really_probe(struct device *dev,
 				const struct qcom_cc_desc *desc,
 				struct regmap *regmap);

-- 
2.39.2

