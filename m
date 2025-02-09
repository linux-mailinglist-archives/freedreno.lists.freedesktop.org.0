Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E60A2DAF5
	for <lists+freedreno@lfdr.de>; Sun,  9 Feb 2025 06:07:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1F6010E47F;
	Sun,  9 Feb 2025 05:07:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="F9hDdPAw";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EA0B10E482
 for <freedreno@lists.freedesktop.org>; Sun,  9 Feb 2025 05:07:11 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-54505a75445so940884e87.1
 for <freedreno@lists.freedesktop.org>; Sat, 08 Feb 2025 21:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739077629; x=1739682429; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=J6Gr4uu/kJErVl7WJZNEAVi18tX3meOvk7rKvqbRQDw=;
 b=F9hDdPAwiFn1rRUVFMoyNAjO5zTziYAPmSVQ3cz3SxtAmfUm0ivBBgP8dfBZxG6VU0
 zDsZreZb3PKfteS/M45xNO3DeTfvZC3Cjh7GAqrd1oyKb+lJnC82y6+cVu9zkf9SfuQJ
 eGByLzcTjp2lstm43GjhNrqKgzTG5sYqEPdC7t6TC9a9hPMW0/h8IfCfnnc2qCLxS+2o
 rrOezGAncJMvKPv02YZ/7L2dCdzDN/dd37QUfluk40TvDNm064i4KdCBlh01HdAC52EQ
 sxsrA4mHCiiR2vqkdp2BA5HSVFybeaIUU15eCzaGlDbA56UXTjUS39417Du8grbK6oIP
 xq5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739077629; x=1739682429;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J6Gr4uu/kJErVl7WJZNEAVi18tX3meOvk7rKvqbRQDw=;
 b=VwtdBPw8O37vGcpGXOuu6HWDknR0F7btCYZ1nSSyHI0i9ICft62LfpP8gRA8L2Bg+2
 s5e4W/IBtO9M+SULc8oBAByRUYpiPUUvGsHvwtuDQVM47oqmjHJEcAutjZ6DKqEQcR0N
 1cCq1/mM2WxcSdji7Fi/LOh2PDN/8cf3JJTo/88GAkftDEXz+Gv1FRagZEyQ81KC+TvH
 nMboqDVTCKH8+JeQSqh/eOiUEVy2YqTqBPw+yU2Qki/mgz8QT/79t1Uqa5/c001XP/AS
 AzThcZwOJfIFrNsE4iPQbcb6I/H5xu6s+BkrrFWhQtZ2dqmvrq6ac/KVnAkh1NJVwrEF
 zQqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkstp1U0o1IQwtet++luptBKKnNZ6qVjKOcVo10AAsxL9h6k+6ILB4HHJ//eAzy5yoqtUGNZNM2T8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywpx7kh+49yHYp8WLRSpDp12G0lj1uW1Y2L3CBVLwjvDZ7XZuKX
 Ezai4o7fuQFb7E2cAVwoUMd5huUDgklPGeOaM/YB6H/2Hl/9FdWgUsvcKTm38tQ=
X-Gm-Gg: ASbGncsi76OQCTO9+hEJC7ZALtj4JWCtf2UP/pKj5gx5RGkH2NadfkhzrPAD2pvZqpy
 8ClUSCzI5n9CGBESp/bPGi49m9CnnId6ZcoTFJsw/2bQtc4TBNSTjzdFL9G1Mw76VaRjUDUUnYJ
 wg8Sb6sARS1NSP4t278wgd6vfz8hK5EqyIL9BwVCj1Ef9+Z9FOxq+Rxak/WYDT4anCNOgJVeH7B
 87SniY2LL5k9aSKU/1eoK8Vlhw21AhoT+GfQakqBqnDZDVRr0jO1ytqUhTryFXLfHA2i6vSy4wZ
 gbVjWF6y52OSNWoITs31kTM=
X-Google-Smtp-Source: AGHT+IEMz171/a3noyaNikNrBmsJ647KN8DT8QdriymS4YuVWPZiFxBKdSK++uLEoZfsKV6SZuZqLg==
X-Received: by 2002:a05:6512:3d88:b0:544:1201:c0b3 with SMTP id
 2adb3069b0e04-54414aae119mr2881240e87.11.1739077629496; 
 Sat, 08 Feb 2025 21:07:09 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54506ef1733sm245576e87.1.2025.02.08.21.07.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 21:07:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 09 Feb 2025 07:04:54 +0200
Subject: [PATCH v4 10/16] drm/msm/hdmi: implement proper runtime PM
 handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-fd-hdmi-hpd-v4-10-6224568ed87f@linaro.org>
References: <20250209-fd-hdmi-hpd-v4-0-6224568ed87f@linaro.org>
In-Reply-To: <20250209-fd-hdmi-hpd-v4-0-6224568ed87f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9382;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=FbKaceGiAg6TBff1fmSfXG39SERi268oL7jMv4TIAIc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnqDfjekR3ytdRsJ2xgXSruu+wiySdVD2A3OkWc
 romIolnABOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6g34wAKCRCLPIo+Aiko
 1XBuB/43scQI8R13SZNUxuwJaZ+IhCr2eB31ophSF7KOoPzKejIQNs5xaV0bXzsvCxandCU2u4N
 0w4pwZn2clkCyNLaYCdZQ3r59CpECFNxgtzyvws4Ur0BWqk9uPZf4e4wXTfytrlB6tS8//SKlWv
 T1eOB9bDsHcqmVDABaFA4uI4askTW1Iu9Aw+ag0GG68vqZctsgy/40llnAOOLTTIQZ6MAjspMWJ
 ZbyEmfEQzCHkYQVd6fZnOSc/uu1WiVYP5q5grf7ciFTHFAdmpQotKh7am9DIbcq2qo21OEl/K9L
 Z1pOUTRRVNHjnYxfTa7Mv2yCS+gtyXcGyyxkMXeFAZ/DP1Pu
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

It is completely not obvious, but the so-called 'hpd' clocks and
regulators are required for the HDMI host to function properly. Merge
pwr and hpd regulators. Use regulators, clocks and pinctrl to implement
proper runtime PM callbacks.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c        | 62 +++++++++++++++++++++++++---------
 drivers/gpu/drm/msm/hdmi/hdmi.h        |  5 ---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 12 -------
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c    | 42 +----------------------
 4 files changed, 47 insertions(+), 74 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 69e337d551799b4d35c8c8c7ecb5c4680b9a9e5f..ded20176aa805db98b0599e617eb6ea9bce122d8 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -8,6 +8,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
+#include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 
 #include <drm/drm_bridge_connector.h>
@@ -224,11 +225,11 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 	.item ## _names = item ##_names_ ## entry, \
 	.item ## _cnt   = ARRAY_SIZE(item ## _names_ ## entry)
 
-static const char * const hpd_reg_names_8960[] = {"core-vdda"};
+static const char * const pwr_reg_names_8960[] = {"core-vdda"};
 static const char * const hpd_clk_names_8960[] = {"core", "master_iface", "slave_iface"};
 
 static const struct hdmi_platform_config hdmi_tx_8960_config = {
-		HDMI_CFG(hpd_reg, 8960),
+		HDMI_CFG(pwr_reg, 8960),
 		HDMI_CFG(hpd_clk, 8960),
 };
 
@@ -318,20 +319,6 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
 	if (hdmi->irq < 0)
 		return hdmi->irq;
 
-	hdmi->hpd_regs = devm_kcalloc(&pdev->dev,
-				      config->hpd_reg_cnt,
-				      sizeof(hdmi->hpd_regs[0]),
-				      GFP_KERNEL);
-	if (!hdmi->hpd_regs)
-		return -ENOMEM;
-
-	for (i = 0; i < config->hpd_reg_cnt; i++)
-		hdmi->hpd_regs[i].supply = config->hpd_reg_names[i];
-
-	ret = devm_regulator_bulk_get(&pdev->dev, config->hpd_reg_cnt, hdmi->hpd_regs);
-	if (ret)
-		return dev_err_probe(dev, ret, "failed to get hpd regulators\n");
-
 	hdmi->pwr_regs = devm_kcalloc(&pdev->dev,
 				      config->pwr_reg_cnt,
 				      sizeof(hdmi->pwr_regs[0]),
@@ -409,6 +396,48 @@ static void msm_hdmi_dev_remove(struct platform_device *pdev)
 	msm_hdmi_put_phy(hdmi);
 }
 
+static int msm_hdmi_runtime_suspend(struct device *dev)
+{
+	struct hdmi *hdmi = dev_get_drvdata(dev);
+	const struct hdmi_platform_config *config = hdmi->config;
+
+	clk_bulk_disable_unprepare(config->hpd_clk_cnt, hdmi->hpd_clks);
+
+	pinctrl_pm_select_sleep_state(dev);
+
+	regulator_bulk_disable(config->pwr_reg_cnt, hdmi->pwr_regs);
+
+	return 0;
+}
+
+static int msm_hdmi_runtime_resume(struct device *dev)
+{
+	struct hdmi *hdmi = dev_get_drvdata(dev);
+	const struct hdmi_platform_config *config = hdmi->config;
+	int ret;
+
+	ret = regulator_bulk_enable(config->pwr_reg_cnt, hdmi->pwr_regs);
+	if (ret)
+		return ret;
+
+	ret = pinctrl_pm_select_default_state(dev);
+	if (ret)
+		goto fail;
+
+	ret = clk_bulk_prepare_enable(config->hpd_clk_cnt, hdmi->hpd_clks);
+	if (ret)
+		goto fail;
+
+	return 0;
+
+fail:
+	pinctrl_pm_select_sleep_state(dev);
+
+	return ret;
+}
+
+DEFINE_RUNTIME_DEV_PM_OPS(msm_hdmi_pm_ops, msm_hdmi_runtime_suspend, msm_hdmi_runtime_resume, NULL);
+
 static const struct of_device_id msm_hdmi_dt_match[] = {
 	{ .compatible = "qcom,hdmi-tx-8998", .data = &hdmi_tx_8974_config },
 	{ .compatible = "qcom,hdmi-tx-8996", .data = &hdmi_tx_8974_config },
@@ -426,6 +455,7 @@ static struct platform_driver msm_hdmi_driver = {
 	.driver = {
 		.name = "hdmi_msm",
 		.of_match_table = msm_hdmi_dt_match,
+		.pm = &msm_hdmi_pm_ops,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index 3f87535bcf43e20f0618d3016307fe1642d7baf9..7e3c035cf913d713ed63379a843897fad96b23ab 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -47,7 +47,6 @@ struct hdmi {
 	void __iomem *qfprom_mmio;
 	phys_addr_t mmio_phy_addr;
 
-	struct regulator_bulk_data *hpd_regs;
 	struct regulator_bulk_data *pwr_regs;
 	struct clk_bulk_data *hpd_clks;
 	struct clk *extp_clk;
@@ -83,10 +82,6 @@ struct hdmi {
 
 /* platform config data (ie. from DT, or pdata) */
 struct hdmi_platform_config {
-	/* regulators that need to be on for hpd: */
-	const char * const *hpd_reg_names;
-	int hpd_reg_cnt;
-
 	/* regulators that need to be on for screen pwr: */
 	const char * const *pwr_reg_names;
 	int pwr_reg_cnt;
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index d7d5d3755fb853377aa999e2a830debf54afe984..fedcefbf53d1d8d53a4882a545427f5ce6570a76 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -18,15 +18,10 @@ static void msm_hdmi_power_on(struct drm_bridge *bridge)
 	struct drm_device *dev = bridge->dev;
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
-	const struct hdmi_platform_config *config = hdmi->config;
 	int ret;
 
 	pm_runtime_resume_and_get(&hdmi->pdev->dev);
 
-	ret = regulator_bulk_enable(config->pwr_reg_cnt, hdmi->pwr_regs);
-	if (ret)
-		DRM_DEV_ERROR(dev->dev, "failed to enable pwr regulator: %d\n", ret);
-
 	if (hdmi->extp_clk) {
 		DBG("pixclock: %lu", hdmi->pixclock);
 		ret = clk_set_rate(hdmi->extp_clk, hdmi->pixclock);
@@ -41,11 +36,8 @@ static void msm_hdmi_power_on(struct drm_bridge *bridge)
 
 static void power_off(struct drm_bridge *bridge)
 {
-	struct drm_device *dev = bridge->dev;
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
-	const struct hdmi_platform_config *config = hdmi->config;
-	int ret;
 
 	/* TODO do we need to wait for final vblank somewhere before
 	 * cutting the clocks?
@@ -55,10 +47,6 @@ static void power_off(struct drm_bridge *bridge)
 	if (hdmi->extp_clk)
 		clk_disable_unprepare(hdmi->extp_clk);
 
-	ret = regulator_bulk_disable(config->pwr_reg_cnt, hdmi->pwr_regs);
-	if (ret)
-		DRM_DEV_ERROR(dev->dev, "failed to disable pwr regulator: %d\n", ret);
-
 	pm_runtime_put(&hdmi->pdev->dev);
 }
 
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
index d77c68914c5f525cf12971c1058b1abc33792b24..a42ed26a5b7c7d916d543aa2920754347903062a 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
@@ -64,36 +64,17 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
-	const struct hdmi_platform_config *config = hdmi->config;
 	struct device *dev = &hdmi->pdev->dev;
 	uint32_t hpd_ctrl;
 	int ret;
 	unsigned long flags;
 
-	ret = regulator_bulk_enable(config->hpd_reg_cnt, hdmi->hpd_regs);
-	if (ret) {
-		DRM_DEV_ERROR(dev, "failed to enable hpd regulators: %d\n", ret);
-		goto fail;
-	}
-
-	ret = pinctrl_pm_select_default_state(dev);
-	if (ret) {
-		DRM_DEV_ERROR(dev, "pinctrl state chg failed: %d\n", ret);
-		goto fail;
-	}
-
 	if (hdmi->hpd_gpiod)
 		gpiod_set_value_cansleep(hdmi->hpd_gpiod, 1);
 
 	ret = pm_runtime_resume_and_get(dev);
-	if (ret) {
-		DRM_DEV_ERROR(dev, "runtime resume failed: %d\n", ret);
-		goto fail;
-	}
-
-	ret = clk_bulk_prepare_enable(config->hpd_clk_cnt, hdmi->hpd_clks);
 	if (ret)
-		goto fail;
+		return ret;
 
 	msm_hdmi_set_mode(hdmi, false);
 	msm_hdmi_phy_reset(hdmi);
@@ -119,32 +100,18 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
 	spin_unlock_irqrestore(&hdmi->reg_lock, flags);
 
 	return 0;
-
-fail:
-	return ret;
 }
 
 void msm_hdmi_hpd_disable(struct hdmi *hdmi)
 {
-	const struct hdmi_platform_config *config = hdmi->config;
 	struct device *dev = &hdmi->pdev->dev;
-	int ret;
 
 	/* Disable HPD interrupt */
 	hdmi_write(hdmi, REG_HDMI_HPD_INT_CTRL, 0);
 
 	msm_hdmi_set_mode(hdmi, false);
 
-	clk_bulk_disable_unprepare(config->hpd_clk_cnt, hdmi->hpd_clks);
 	pm_runtime_put(dev);
-
-	ret = pinctrl_pm_select_sleep_state(dev);
-	if (ret)
-		dev_warn(dev, "pinctrl state chg failed: %d\n", ret);
-
-	ret = regulator_bulk_disable(config->hpd_reg_cnt, hdmi->hpd_regs);
-	if (ret)
-		dev_warn(dev, "failed to disable hpd regulator: %d\n", ret);
 }
 
 void msm_hdmi_hpd_irq(struct drm_bridge *bridge)
@@ -179,7 +146,6 @@ void msm_hdmi_hpd_irq(struct drm_bridge *bridge)
 
 static enum drm_connector_status detect_reg(struct hdmi *hdmi)
 {
-	const struct hdmi_platform_config *config = hdmi->config;
 	u32 hpd_int_status = 0;
 	int ret;
 
@@ -187,14 +153,8 @@ static enum drm_connector_status detect_reg(struct hdmi *hdmi)
 	if (ret)
 		goto out;
 
-	ret = clk_bulk_prepare_enable(config->hpd_clk_cnt, hdmi->hpd_clks);
-	if (ret)
-		goto out;
-
 	hpd_int_status = hdmi_read(hdmi, REG_HDMI_HPD_INT_STATUS);
 
-	clk_bulk_disable_unprepare(config->hpd_clk_cnt, hdmi->hpd_clks);
-
 out:
 	pm_runtime_put(&hdmi->pdev->dev);
 

-- 
2.39.5

