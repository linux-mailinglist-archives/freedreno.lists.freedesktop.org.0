Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1296544BDB
	for <lists+freedreno@lfdr.de>; Thu,  9 Jun 2022 14:24:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2328011BEB8;
	Thu,  9 Jun 2022 12:24:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A23B011BE5D
 for <freedreno@lists.freedesktop.org>; Thu,  9 Jun 2022 12:24:02 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id q1so25958415ljb.5
 for <freedreno@lists.freedesktop.org>; Thu, 09 Jun 2022 05:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X4dzb76g0ocgyTMGcs1anU/tp0V4LQ4BIXrQi2z++Tk=;
 b=mmT9KWDi+BmGJTdwCedNj/txduFmZEyZRfecsqYUQx5J3STr9BV/oS9mpQIibZCmRd
 bJ6EKmy5AqwicxxxBaKPSs4re83uxQ7/efc3Stt9OxpUPefYp6FmADdCTnGWHoi9iDp/
 vzUlznup5QmJPMkS3IbYlnlwqxY371zo17YN4z8NJ74awlHRbWy8zIewsxAJEfwsx406
 wS0Dpyu6Gp8npMjbJG0xwJ3r0aKfPG5Pfx7UNGmJSnnPpGOXjuQUURknae7ukgDWLdpv
 npVouhbC3Jyez1CK+Muk02WJ+E9WNIoT1/PdkHd9Jh50XT1UZuAHT2APO8z6XboF5qg3
 JJIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X4dzb76g0ocgyTMGcs1anU/tp0V4LQ4BIXrQi2z++Tk=;
 b=SHgsGEDL3CFxP/Hmi3ltXvJPUm81HPV9vFZJ0zMpnF6UQJ/YTVbVFSgE3TXLI3mror
 QwweWLSZOuhLHe2V9B96/clJEdkt3WUjxEHnRxNkcUUqFRNfpLdpqo3rJhEbSrG1ljz3
 bbD/oa3u+l1wW14zCAnnewqURIRf5lBwUDnZmS94CGeVv3c4LzCuetpmjXELIab+yUln
 DWW58KLjsVSHw9XCAR1+srOhkdexGczX3AJiqL8oyI+iWXEVs31SZVRnF3UmM2ukgSyW
 K7HDasZ3Y4kinfYUMhDdHoaJ5kyhPNzI9RkPIBx9XgMc+vMD1fuUfJxx4finDT2azDHW
 1uzA==
X-Gm-Message-State: AOAM53090STtngQ8hqLalCJBt45z+s2zXI/aZbRsbaUxFbM/nRwltu1H
 lSP+sebUn/abDXuIqJLpEOI9oQ==
X-Google-Smtp-Source: ABdhPJwzLnPBNshBT9ozlBlmQIEA8JA3fN9m2SqapRLtuvq1rdctLl0zL0rtACOU9xkPyRuJpr5blg==
X-Received: by 2002:a2e:8803:0:b0:255:8be7:c03a with SMTP id
 x3-20020a2e8803000000b002558be7c03amr14052361ljh.487.1654777440885; 
 Thu, 09 Jun 2022 05:24:00 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 f11-20020a056512360b00b0047daa133decsm32421lfs.166.2022.06.09.05.24.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 05:24:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Thu,  9 Jun 2022 15:23:46 +0300
Message-Id: <20220609122350.3157529-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220609122350.3157529-1-dmitry.baryshkov@linaro.org>
References: <20220609122350.3157529-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 10/14] drm/msm/hdmi: merge platform config
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

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 27 +++------------------------
 1 file changed, 3 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 48cd6b9a7565..0f1c63f68569 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -392,27 +392,6 @@ static struct hdmi_platform_config hdmi_tx_8974_config = {
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
@@ -583,9 +562,9 @@ static int msm_hdmi_dev_remove(struct platform_device *pdev)
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

