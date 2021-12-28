Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7282048062A
	for <lists+freedreno@lfdr.de>; Tue, 28 Dec 2021 05:58:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7289A10E164;
	Tue, 28 Dec 2021 04:58:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1D4010E162
 for <freedreno@lists.freedesktop.org>; Tue, 28 Dec 2021 04:58:34 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id j185so28284990oif.8
 for <freedreno@lists.freedesktop.org>; Mon, 27 Dec 2021 20:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=98szpQBZjtZvNYlpyX/l6mXnydiaf9Cz3PXEMmMi7WI=;
 b=RkAse5a++wcvwXouZbSPgrz1WAGLQRgomwBlTuBF+n11/dsDnSAFBiJ5IZO71tXwWQ
 oG3FDo764vE2UDNwyhMV8XKQTjJ2EVfvXYrhWV84Nz2dPQRNRJGhvSbzCQ6Kvi9wletK
 IyNqaEnQOApQTc2sh/uEynNLXrOozmRDI3YVa8JTHsf6CQfPaoW2BqoLiBD6q7HpYBym
 GGI4CQXhGZAhFOrBfxmUFmGYOMxRPQbYcKDIqFbWJ6LsKOZRGv7c4YGCan52dlHN0SIX
 HnKaSdR0XXsFutjqissD5fp8Rsn/LZoyqDuI87U5H+YAlIFzeZaPKnRGVzD1+U4SDi1I
 OfrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=98szpQBZjtZvNYlpyX/l6mXnydiaf9Cz3PXEMmMi7WI=;
 b=fCMWl5HaWmh70pm5Ro/xOmKAZ3KBfSttIJ/0OiMNGvUPI4/hhoziz5uQ3i1+dm9hXe
 54jssHXWKpSZHK1E7iPqWMi9aLgnKqZ9e7Lu18A/t38rXOf5rpTLU1w2t1vw9tlw9qhG
 WH2GZ6h8dI8yaGj2zqsr9BzBc0no1haI2W5ZxMM4I/Kj3/K76wTMStAdo90Z1OGyLad6
 z2+weZasA/qVEADpvTBv8s7OG6I+PMkQoyxazCvJAUqLnQOv7/vNFjG6TVSc6NQA6OaG
 TdTZbBJmJDRap9oi7ynjC/OFaW3vhJpZ0x1XADclVbqY1NrJBx0ptCacl2jRzPLKchtC
 n3IQ==
X-Gm-Message-State: AOAM531UlZcOl4pt13+HCYeL0BLfEV3GE2/b26Dsmdr257HQx6Wj8wUT
 ZU4wgKSBtx0Ir5UIxjKtdkuadQ==
X-Google-Smtp-Source: ABdhPJw0LCJVxHQQ9QCWqtmjXSIikXnypZw3Qfu/0FsEFSTp1ESZgDOl8PKo+a6h8HMAc8zWhQBM9g==
X-Received: by 2002:a05:6808:aa7:: with SMTP id
 r7mr15681459oij.120.1640667514163; 
 Mon, 27 Dec 2021 20:58:34 -0800 (PST)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id n18sm3004786ooj.30.2021.12.27.20.58.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Dec 2021 20:58:33 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 27 Dec 2021 20:59:34 -0800
Message-Id: <20211228045934.1524865-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] drm/msm/dp: Add DisplayPort controller for
 SM8350
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
Cc: Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The Qualcomm SM8350 platform comes with a single DisplayPort controller,
add support for this in the DisplayPort driver.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../devicetree/bindings/display/msm/dp-controller.yaml    | 1 +
 drivers/gpu/drm/msm/dp/dp_display.c                       | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 5457612ab136..cd05cfd76536 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -21,6 +21,7 @@ properties:
       - qcom,sc7280-edp
       - qcom,sc8180x-dp
       - qcom,sc8180x-edp
+      - qcom,sm8350-dp
 
   reg:
     items:
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 8d9c19dbf33e..fd0fd03f8fed 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -143,10 +143,18 @@ static const struct msm_dp_config sc7280_dp_cfg = {
 	.num_descs = 2,
 };
 
+static const struct msm_dp_config sm8350_dp_cfg = {
+	.descs = (const struct msm_dp_desc[]) {
+		[MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
+	},
+	.num_descs = 1,
+};
+
 static const struct of_device_id dp_dt_match[] = {
 	{ .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_cfg },
 	{ .compatible = "qcom,sc7280-dp", .data = &sc7280_dp_cfg },
 	{ .compatible = "qcom,sc7280-edp", .data = &sc7280_dp_cfg },
+	{ .compatible = "qcom,sm8350-dp", .data = &sm8350_dp_cfg },
 	{}
 };
 
-- 
2.33.1

