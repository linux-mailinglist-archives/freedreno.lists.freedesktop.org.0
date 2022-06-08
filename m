Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6742E542FC7
	for <lists+freedreno@lfdr.de>; Wed,  8 Jun 2022 14:07:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC69E10FAE2;
	Wed,  8 Jun 2022 12:07:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CE0C10FB0D
 for <freedreno@lists.freedesktop.org>; Wed,  8 Jun 2022 12:07:36 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id a15so32879631lfb.9
 for <freedreno@lists.freedesktop.org>; Wed, 08 Jun 2022 05:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nWbp37l6qMVWqU1MI1wAwLjMWJ/9NoPZ7BFFc/dS17o=;
 b=W352pZ9uwwqTyUYzKspeDxpFa9JgGekJNoMxQ7pmUZ7l/p80RV+Ryr94k0lmvB1qwu
 rxUQA/N2fIMnMcYDMMcp1hYwVsar3595xrtL0S3bkxfsIMZMkwFaiGDqkFdEHr65t7A7
 HDjMfBcU3UiYD2ctQ90WqQCEnzXYWceRV/Ccz3yxxgtlO3IRGem3syoItABwbsuLZeoZ
 JHpwOVGSSjz1WuvME7liMYnDHUEdia6JYqj8SvOvIvErvWHaF8u8HltJqPF8u8kQu20f
 o8tEDaTWHDvkqLFLmDEVqxmyOhiYqNunMVAG2kqXezfZkX2SV/7gUJl5p3yHoXFq0WnQ
 7Slw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nWbp37l6qMVWqU1MI1wAwLjMWJ/9NoPZ7BFFc/dS17o=;
 b=ft/W5khSmfehWcyEqVYOV5iugACIoTbJIWwU/7HbfocSh56NeeLsqzrmCXIeW0LXTK
 Yr+bl+qLNW4g210uKMtBGnHXxtF1Z3l1exLA0LYIHHjf5IrVYAgr0GX/KciE4yKXEzvX
 AhkgDV4tAMtOGkok1qUPKQu172GXrzqjK6kcSrvFjRsqp2TDW7z1dg3tCY5h0+lDVu0C
 yt61idrLwApkGRuep2v11bolMvQ3A7ZkH7HD+OnpQcCjVcScNgirUEXf/634cchIQjQE
 EdSKbpy+gEmNml8SE71Vlf1ErWPjPKKmBRF4wwiK9sCaN2CTfQ+ANhVPpfAlt4w7Jd0f
 Rnxg==
X-Gm-Message-State: AOAM530u2s1o80opha4RQi+k0UCt6wLyhuAvuHcWzA7FXYwzs+Z+Ywkp
 W4RZvMkXQ8v7FlzIsjyu4baPeg==
X-Google-Smtp-Source: ABdhPJywThmG5UQP/hMKt/YeXsy3uQeZ4OTnQen1exape5w/rd16un0mDKKLSFaIaUKX36jU6pW4FQ==
X-Received: by 2002:a05:6512:3f11:b0:478:9795:4a45 with SMTP id
 y17-20020a0565123f1100b0047897954a45mr49913632lfa.491.1654690055910; 
 Wed, 08 Jun 2022 05:07:35 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 4-20020ac25f04000000b0047b0f2d7650sm52049lfq.271.2022.06.08.05.07.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 05:07:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Wed,  8 Jun 2022 15:07:21 +0300
Message-Id: <20220608120723.2987843-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
References: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 10/12] drm/msm/hdmi: merge platform config
 for 8974/8084/8994/8996
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Since there is no more difference between the HDMI platform data
between MSM8974/APQ8084/MSM8994/MSM8996, merge these configs into a
single entry.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 27 +++------------------------
 1 file changed, 3 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index bc6ec6aa2cb9..a718e0ebf6cd 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -375,27 +375,6 @@ static struct hdmi_platform_config hdmi_tx_8974_config = {
 		.hpd_freq      = hpd_clk_freq_8x74,
 };
 
-static struct hdmi_platform_config hdmi_tx_8084_config = {
-		HDMI_CFG(pwr_reg, 8x74),
-		HDMI_CFG(pwr_clk, 8x74),
-		HDMI_CFG(hpd_clk, 8x74),
-		.hpd_freq      = hpd_clk_freq_8x74,
-};
-
-static struct hdmi_platform_config hdmi_tx_8994_config = {
-		HDMI_CFG(pwr_reg, 8x74),
-		HDMI_CFG(pwr_clk, 8x74),
-		HDMI_CFG(hpd_clk, 8x74),
-		.hpd_freq      = hpd_clk_freq_8x74,
-};
-
-static struct hdmi_platform_config hdmi_tx_8996_config = {
-		HDMI_CFG(pwr_reg, 8x74),
-		HDMI_CFG(pwr_clk, 8x74),
-		HDMI_CFG(hpd_clk, 8x74),
-		.hpd_freq      = hpd_clk_freq_8x74,
-};
-
 /*
  * HDMI audio codec callbacks
  */
@@ -577,9 +556,9 @@ static int msm_hdmi_dev_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id msm_hdmi_dt_match[] = {
-	{ .compatible = "qcom,hdmi-tx-8996", .data = &hdmi_tx_8996_config },
-	{ .compatible = "qcom,hdmi-tx-8994", .data = &hdmi_tx_8994_config },
-	{ .compatible = "qcom,hdmi-tx-8084", .data = &hdmi_tx_8084_config },
+	{ .compatible = "qcom,hdmi-tx-8996", .data = &hdmi_tx_8974_config },
+	{ .compatible = "qcom,hdmi-tx-8994", .data = &hdmi_tx_8974_config },
+	{ .compatible = "qcom,hdmi-tx-8084", .data = &hdmi_tx_8974_config },
 	{ .compatible = "qcom,hdmi-tx-8974", .data = &hdmi_tx_8974_config },
 	{ .compatible = "qcom,hdmi-tx-8960", .data = &hdmi_tx_8960_config },
 	{ .compatible = "qcom,hdmi-tx-8660", .data = &hdmi_tx_8660_config },
-- 
2.35.1

