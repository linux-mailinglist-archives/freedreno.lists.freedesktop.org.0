Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B52591B5FE
	for <lists+freedreno@lfdr.de>; Fri, 28 Jun 2024 07:20:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 038A210EBB3;
	Fri, 28 Jun 2024 05:20:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vnLMmW30";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6140010EBB2
 for <freedreno@lists.freedesktop.org>; Fri, 28 Jun 2024 05:20:30 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-52db11b1d31so267194e87.0
 for <freedreno@lists.freedesktop.org>; Thu, 27 Jun 2024 22:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719552028; x=1720156828; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=mlBuOCd228OEzTi+Lw7sdjUybkFAFwm+zLxjPBpTo+8=;
 b=vnLMmW30KG44+amHs0ZVUFXaPMZnHhI+TtcgxxCnbrNAvMoPBxJNmKVWXqZshH16L1
 0/+UQnDk880LxiGPRWAn0KtmxTJj9cokP3MtW0gacma4ZVgCxwIEfVSdBbgT+Tunm1vQ
 cVWkOkUInkPgfbYCKzEP6ZteMQ595pDWt7aC0kRsm3exzVPrk3Nf9nQEZjnOU9y87KzI
 clncfXz427vfeyMXDv6fE01xkjTkkp0QNsYEiML57z+D/54yqMkvGUi3BJ5Gp5FhHDag
 1957WDdKVrLUtc5mMbR+JmDKw4qKIR28GmF3nRgfpY9YdWp1Wq8aU/GYh80UFwxaHhUW
 83rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719552028; x=1720156828;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mlBuOCd228OEzTi+Lw7sdjUybkFAFwm+zLxjPBpTo+8=;
 b=Xdfysm9Wry2bwpl6+sTSqDGnBU7WqN5oOfPl8xvwqiYOCHi/HPMtzc0JvMqAAlzMRI
 IQQtMBShWty3APzSo+HoBDb+wmcdR8mfDGfX8rh3N4Fevq7crKGStRuh6WjilEwpNZei
 h4FopzyxwmZhEPDhZbPA3cTVzrb+YSrREbQWPsr1eyEAdqgME2Jthxa+geQYCTSVoKca
 OK+Effk3BW3yp6Q2QgqGojV0XFPSeA83Ea9nzRgmglKELDMcsZw/1t+PxfvGQCx4ulKH
 nxrlMdZERqR9SbXu4I8OmeYJS+lLPogoG+9950lgGbJauLAdhv7t9LKVCaVmUnzAb6n5
 JOwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7gFxjV8cMA2auHmvGunopMpbBUvSslZ6jzf9VNs8yxt0Y/MhdZd3CnCnBGI3kVr12hsCjNwYKYaB/nhgKr1szSpFykp+q852dY77QUR9+
X-Gm-Message-State: AOJu0YxUwh4DqKzLXaH7R5/oZfhnRIh+h5qgR5O8X+6gjmEPXuNo2RMA
 ZTFnfas6i0XuAjOMsTJrpdEnbUculMYgVeRKCEjC864kp8alrVLjbapZWWD4Fzkq+9kAY31uCi5
 kir51nQ==
X-Google-Smtp-Source: AGHT+IHdmwUv1L4uOgagl5p7XUPby7N5Y24wsABGjreWma06d+9L1p8cL+OwF8s138CWYo/vGvbJpw==
X-Received: by 2002:a05:6512:480c:b0:52c:ab88:6340 with SMTP id
 2adb3069b0e04-52cdf8261a9mr10051298e87.65.1719552028156; 
 Thu, 27 Jun 2024 22:20:28 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52e7ab101c5sm167736e87.79.2024.06.27.22.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jun 2024 22:20:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 28 Jun 2024 08:20:23 +0300
Subject: [PATCH 2/2] clk: qcom: gpucc-*: use qcom_cc_map_norequest
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240628-gpucc-no-request-v1-2-b680c2f90817@linaro.org>
References: <20240628-gpucc-no-request-v1-0-b680c2f90817@linaro.org>
In-Reply-To: <20240628-gpucc-no-request-v1-0-b680c2f90817@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9724;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=1bGciu1Uk/4GERHUYF3OlGIdZfgztwypx+e0LXmmIIc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmfkgaBW3ISFsbQGMeb/kfZiOArwWQw8Fwqkl/K
 RH5x/vnUG2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZn5IGgAKCRCLPIo+Aiko
 1QOYB/9khv9fUYZ27iWVrv3evKiaqXr+DDIJQDuZVl2gqZGyJCumcKKx7+qeB4SZzj1WbpbNWdR
 kwreBfaMxWMVLLMGsRobtgAnANE5kXMt2SsN7qfCGgPk0gfFnFGtgjtyxyBjsL0xLR9yxPWYnV8
 Ryds0kkGOt9DGxstVs9Cg0Pr5dHqoR7IyzT2AyItMU+YocHyQU/eLniw8S1zRpLzfHBh8KhBIvq
 IbbfjS3HUjbVfSjorzyqE0/K+k33asbJ49MLo6zEMe96fTCz74zvyaRzAHC/gQvog2pVDeKBNq7
 oV43fb2d33itTvNPjX5m/cscIrcmcb31t8K5Ubkat3wLWwB0
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

On most of the Qualcomm platforms GPU clock controller registers are
located inside the GMU's register space. By using qcom_cc_map() gpucc
drivers mark the region as used, prevening GMU driver from claiming the
bigger region.

Make affected GPU clock controller drivers use qcom_cc_map_norequest(),
allowing GMU driver to use devm_ioremap_resource().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gpucc-qcm2290.c  | 2 +-
 drivers/clk/qcom/gpucc-sa8775p.c  | 2 +-
 drivers/clk/qcom/gpucc-sc7180.c   | 2 +-
 drivers/clk/qcom/gpucc-sc7280.c   | 2 +-
 drivers/clk/qcom/gpucc-sc8280xp.c | 2 +-
 drivers/clk/qcom/gpucc-sdm845.c   | 2 +-
 drivers/clk/qcom/gpucc-sm6115.c   | 2 +-
 drivers/clk/qcom/gpucc-sm6125.c   | 2 +-
 drivers/clk/qcom/gpucc-sm6350.c   | 2 +-
 drivers/clk/qcom/gpucc-sm6375.c   | 2 +-
 drivers/clk/qcom/gpucc-sm8150.c   | 2 +-
 drivers/clk/qcom/gpucc-sm8250.c   | 2 +-
 drivers/clk/qcom/gpucc-sm8350.c   | 2 +-
 drivers/clk/qcom/gpucc-sm8450.c   | 2 +-
 drivers/clk/qcom/gpucc-sm8550.c   | 2 +-
 drivers/clk/qcom/gpucc-sm8650.c   | 2 +-
 drivers/clk/qcom/gpucc-x1e80100.c | 2 +-
 17 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qcm2290.c
index dc369dff882e..2a886b3d6ab4 100644
--- a/drivers/clk/qcom/gpucc-qcm2290.c
+++ b/drivers/clk/qcom/gpucc-qcm2290.c
@@ -372,7 +372,7 @@ static int gpu_cc_qcm2290_probe(struct platform_device *pdev)
 	struct regmap *regmap;
 	int ret;
 
-	regmap = qcom_cc_map(pdev, &gpu_cc_qcm2290_desc);
+	regmap = qcom_cc_map_norequest(pdev, &gpu_cc_qcm2290_desc);
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
diff --git a/drivers/clk/qcom/gpucc-sa8775p.c b/drivers/clk/qcom/gpucc-sa8775p.c
index f8a8ac343d70..312b45e6fc29 100644
--- a/drivers/clk/qcom/gpucc-sa8775p.c
+++ b/drivers/clk/qcom/gpucc-sa8775p.c
@@ -592,7 +592,7 @@ static int gpu_cc_sa8775p_probe(struct platform_device *pdev)
 {
 	struct regmap *regmap;
 
-	regmap = qcom_cc_map(pdev, &gpu_cc_sa8775p_desc);
+	regmap = qcom_cc_map_norequest(pdev, &gpu_cc_sa8775p_desc);
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
diff --git a/drivers/clk/qcom/gpucc-sc7180.c b/drivers/clk/qcom/gpucc-sc7180.c
index 08f3983d016f..03480a2fa78c 100644
--- a/drivers/clk/qcom/gpucc-sc7180.c
+++ b/drivers/clk/qcom/gpucc-sc7180.c
@@ -220,7 +220,7 @@ static int gpu_cc_sc7180_probe(struct platform_device *pdev)
 	struct alpha_pll_config gpu_cc_pll_config = {};
 	unsigned int value, mask;
 
-	regmap = qcom_cc_map(pdev, &gpu_cc_sc7180_desc);
+	regmap = qcom_cc_map_norequest(pdev, &gpu_cc_sc7180_desc);
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
diff --git a/drivers/clk/qcom/gpucc-sc7280.c b/drivers/clk/qcom/gpucc-sc7280.c
index bd699a624517..86f89fbb4aec 100644
--- a/drivers/clk/qcom/gpucc-sc7280.c
+++ b/drivers/clk/qcom/gpucc-sc7280.c
@@ -458,7 +458,7 @@ static int gpu_cc_sc7280_probe(struct platform_device *pdev)
 {
 	struct regmap *regmap;
 
-	regmap = qcom_cc_map(pdev, &gpu_cc_sc7280_desc);
+	regmap = qcom_cc_map_norequest(pdev, &gpu_cc_sc7280_desc);
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
diff --git a/drivers/clk/qcom/gpucc-sc8280xp.c b/drivers/clk/qcom/gpucc-sc8280xp.c
index c96be61e3f47..519940dc99eb 100644
--- a/drivers/clk/qcom/gpucc-sc8280xp.c
+++ b/drivers/clk/qcom/gpucc-sc8280xp.c
@@ -436,7 +436,7 @@ static int gpu_cc_sc8280xp_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	regmap = qcom_cc_map(pdev, &gpu_cc_sc8280xp_desc);
+	regmap = qcom_cc_map_norequest(pdev, &gpu_cc_sc8280xp_desc);
 	if (IS_ERR(regmap)) {
 		pm_runtime_put(&pdev->dev);
 		return PTR_ERR(regmap);
diff --git a/drivers/clk/qcom/gpucc-sdm845.c b/drivers/clk/qcom/gpucc-sdm845.c
index ef26690cf504..b78f8b632601 100644
--- a/drivers/clk/qcom/gpucc-sdm845.c
+++ b/drivers/clk/qcom/gpucc-sdm845.c
@@ -177,7 +177,7 @@ static int gpu_cc_sdm845_probe(struct platform_device *pdev)
 	struct regmap *regmap;
 	unsigned int value, mask;
 
-	regmap = qcom_cc_map(pdev, &gpu_cc_sdm845_desc);
+	regmap = qcom_cc_map_norequest(pdev, &gpu_cc_sdm845_desc);
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
diff --git a/drivers/clk/qcom/gpucc-sm6115.c b/drivers/clk/qcom/gpucc-sm6115.c
index d43c86cf73a5..ab3e33fbe401 100644
--- a/drivers/clk/qcom/gpucc-sm6115.c
+++ b/drivers/clk/qcom/gpucc-sm6115.c
@@ -474,7 +474,7 @@ static int gpu_cc_sm6115_probe(struct platform_device *pdev)
 {
 	struct regmap *regmap;
 
-	regmap = qcom_cc_map(pdev, &gpu_cc_sm6115_desc);
+	regmap = qcom_cc_map_norequest(pdev, &gpu_cc_sm6115_desc);
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
diff --git a/drivers/clk/qcom/gpucc-sm6125.c b/drivers/clk/qcom/gpucc-sm6125.c
index ed6a6e505801..14dc75b3771a 100644
--- a/drivers/clk/qcom/gpucc-sm6125.c
+++ b/drivers/clk/qcom/gpucc-sm6125.c
@@ -395,7 +395,7 @@ static int gpu_cc_sm6125_probe(struct platform_device *pdev)
 {
 	struct regmap *regmap;
 
-	regmap = qcom_cc_map(pdev, &gpu_cc_sm6125_desc);
+	regmap = qcom_cc_map_norequest(pdev, &gpu_cc_sm6125_desc);
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
diff --git a/drivers/clk/qcom/gpucc-sm6350.c b/drivers/clk/qcom/gpucc-sm6350.c
index 1e12ad8948db..f0a6a6fb693f 100644
--- a/drivers/clk/qcom/gpucc-sm6350.c
+++ b/drivers/clk/qcom/gpucc-sm6350.c
@@ -489,7 +489,7 @@ static int gpu_cc_sm6350_probe(struct platform_device *pdev)
 	struct regmap *regmap;
 	unsigned int value, mask;
 
-	regmap = qcom_cc_map(pdev, &gpu_cc_sm6350_desc);
+	regmap = qcom_cc_map_norequest(pdev, &gpu_cc_sm6350_desc);
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
diff --git a/drivers/clk/qcom/gpucc-sm6375.c b/drivers/clk/qcom/gpucc-sm6375.c
index 41f59024143e..4ec7399f8fc4 100644
--- a/drivers/clk/qcom/gpucc-sm6375.c
+++ b/drivers/clk/qcom/gpucc-sm6375.c
@@ -446,7 +446,7 @@ static int gpucc_sm6375_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	regmap = qcom_cc_map(pdev, &gpucc_sm6375_desc);
+	regmap = qcom_cc_map_norequest(pdev, &gpucc_sm6375_desc);
 	if (IS_ERR(regmap)) {
 		pm_runtime_put(&pdev->dev);
 		return PTR_ERR(regmap);
diff --git a/drivers/clk/qcom/gpucc-sm8150.c b/drivers/clk/qcom/gpucc-sm8150.c
index d711464a71b6..b01531ca13d9 100644
--- a/drivers/clk/qcom/gpucc-sm8150.c
+++ b/drivers/clk/qcom/gpucc-sm8150.c
@@ -295,7 +295,7 @@ static int gpu_cc_sm8150_probe(struct platform_device *pdev)
 {
 	struct regmap *regmap;
 
-	regmap = qcom_cc_map(pdev, &gpu_cc_sm8150_desc);
+	regmap = qcom_cc_map_norequest(pdev, &gpu_cc_sm8150_desc);
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
diff --git a/drivers/clk/qcom/gpucc-sm8250.c b/drivers/clk/qcom/gpucc-sm8250.c
index 113b486a6d2f..ded2faff96ce 100644
--- a/drivers/clk/qcom/gpucc-sm8250.c
+++ b/drivers/clk/qcom/gpucc-sm8250.c
@@ -305,7 +305,7 @@ static int gpu_cc_sm8250_probe(struct platform_device *pdev)
 	struct regmap *regmap;
 	unsigned int value, mask;
 
-	regmap = qcom_cc_map(pdev, &gpu_cc_sm8250_desc);
+	regmap = qcom_cc_map_norequest_norequest(pdev, &gpu_cc_sm8250_desc);
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
diff --git a/drivers/clk/qcom/gpucc-sm8350.c b/drivers/clk/qcom/gpucc-sm8350.c
index f3b6bdc24485..c11ba4c5f254 100644
--- a/drivers/clk/qcom/gpucc-sm8350.c
+++ b/drivers/clk/qcom/gpucc-sm8350.c
@@ -596,7 +596,7 @@ static int gpu_cc_sm8350_probe(struct platform_device *pdev)
 {
 	struct regmap *regmap;
 
-	regmap = qcom_cc_map(pdev, &gpu_cc_sm8350_desc);
+	regmap = qcom_cc_map_norequest(pdev, &gpu_cc_sm8350_desc);
 	if (IS_ERR(regmap)) {
 		dev_err(&pdev->dev, "Failed to map gpu cc registers\n");
 		return PTR_ERR(regmap);
diff --git a/drivers/clk/qcom/gpucc-sm8450.c b/drivers/clk/qcom/gpucc-sm8450.c
index b3c5d6923cd2..34c709baeefa 100644
--- a/drivers/clk/qcom/gpucc-sm8450.c
+++ b/drivers/clk/qcom/gpucc-sm8450.c
@@ -744,7 +744,7 @@ static int gpu_cc_sm8450_probe(struct platform_device *pdev)
 {
 	struct regmap *regmap;
 
-	regmap = qcom_cc_map(pdev, &gpu_cc_sm8450_desc);
+	regmap = qcom_cc_map_norequest(pdev, &gpu_cc_sm8450_desc);
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
diff --git a/drivers/clk/qcom/gpucc-sm8550.c b/drivers/clk/qcom/gpucc-sm8550.c
index 7486edf56160..e77c287604e6 100644
--- a/drivers/clk/qcom/gpucc-sm8550.c
+++ b/drivers/clk/qcom/gpucc-sm8550.c
@@ -568,7 +568,7 @@ static int gpu_cc_sm8550_probe(struct platform_device *pdev)
 {
 	struct regmap *regmap;
 
-	regmap = qcom_cc_map(pdev, &gpu_cc_sm8550_desc);
+	regmap = qcom_cc_map_norequest(pdev, &gpu_cc_sm8550_desc);
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
diff --git a/drivers/clk/qcom/gpucc-sm8650.c b/drivers/clk/qcom/gpucc-sm8650.c
index f15aeecc512d..f7370ec3bac2 100644
--- a/drivers/clk/qcom/gpucc-sm8650.c
+++ b/drivers/clk/qcom/gpucc-sm8650.c
@@ -640,7 +640,7 @@ static int gpu_cc_sm8650_probe(struct platform_device *pdev)
 {
 	struct regmap *regmap;
 
-	regmap = qcom_cc_map(pdev, &gpu_cc_sm8650_desc);
+	regmap = qcom_cc_map_norequest(pdev, &gpu_cc_sm8650_desc);
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
diff --git a/drivers/clk/qcom/gpucc-x1e80100.c b/drivers/clk/qcom/gpucc-x1e80100.c
index 2eec20dd0254..e583a4a96629 100644
--- a/drivers/clk/qcom/gpucc-x1e80100.c
+++ b/drivers/clk/qcom/gpucc-x1e80100.c
@@ -630,7 +630,7 @@ static int gpu_cc_x1e80100_probe(struct platform_device *pdev)
 {
 	struct regmap *regmap;
 
-	regmap = qcom_cc_map(pdev, &gpu_cc_x1e80100_desc);
+	regmap = qcom_cc_map_norequest(pdev, &gpu_cc_x1e80100_desc);
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 

-- 
2.39.2

