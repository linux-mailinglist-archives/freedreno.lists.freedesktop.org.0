Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 286F9886CBE
	for <lists+freedreno@lfdr.de>; Fri, 22 Mar 2024 14:22:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BE0B10EEF2;
	Fri, 22 Mar 2024 13:22:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Cgxp7BTr";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6304C10EEF2
 for <freedreno@lists.freedesktop.org>; Fri, 22 Mar 2024 13:22:39 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-513d717269fso2723682e87.0
 for <freedreno@lists.freedesktop.org>; Fri, 22 Mar 2024 06:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711113757; x=1711718557; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=71W+5io5Kx8kfZV8uQBYKocYOd4dyz/odA4LMSFZCo8=;
 b=Cgxp7BTr7QgnQtjT8WWbkHhRtNivmgEOqUagO6b652jn3rctjMSU0V3TdAqB4Rh6/E
 58ACXoYKvftVGOYCTAj5rNgUFc/tSwIdye5pWmPF5KE08tZspMoSok0nEhSo2xqNwAps
 QCwNdIdhlQz4BRHFNE8sQG+t43sEgfrEjsrrAIqk/TwrTbEgUqo9hoL6Yw47ADDve1oo
 EvHzmdFVzrwOcPZQOoc4oBjSaiQRmumkywYPt4svTjYHxN37neZoZTwRIkA7yVq28XhD
 pUeoaES5MaHtwmeaEZqL9sVzvUfNWU8XGBA5ooaSdwziB084q0n/0OzhJfFhxvRTA42s
 uYcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711113757; x=1711718557;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=71W+5io5Kx8kfZV8uQBYKocYOd4dyz/odA4LMSFZCo8=;
 b=Rhp3SzUqRXWw6u/kw7jBlRL20SSOpIixEJ2IBThHJpv9/BAfXQUZUZ0kn0020QTNE0
 tSJKBffttdvx/2vbYKMx42vJt7nYyHGsZF+pFFoDiSpshMT2zY5hzccvhXEt08r5zO+H
 RZSivgJDANIRfQELQcpAZNeU9PvMG85RBnH0XFH9fzNpXK9xl9a7yPJS4DpinIWRbbWA
 B06yVMyBXir9do8GMqenJ3IAZoFHid5Y+Pp3M80tCQRbqbTfYye2rOGjgt8pJj6lKlYy
 edJ2RZTf129sUWdcRK0EUrJA6pMWKxmb2iZBZN+1IyUXFFTgUVeJLGGRWHzvvQu5qx67
 inNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeQP8cDFdY47TJ0pEvDlE9fJ6mgy7Vl+Rm/vL432oUIOHU5RYGv0/cGPg1piZrDVak6Lszli7t/2SfAMdE9YZWUJDU7aFnvlp1SFxQwRis
X-Gm-Message-State: AOJu0YyS+uWbmOEfkqZv4QEewi+xYm6Z7DZrmBCSrQrmcVuuWBzQCvw8
 Z58ecMm+OtM8gkgd1doY2/tkKkM7icReUKaDw0GYC+ftIFH4gwQcAC5t2IkGTpk=
X-Google-Smtp-Source: AGHT+IH+xtibtdYJd416aG/DEUom1GwyheSBAPgz1DH1kxYZ6rynbFgNTq4Erxr192rfy/o5F41H0g==
X-Received: by 2002:a19:4353:0:b0:512:be8e:79da with SMTP id
 m19-20020a194353000000b00512be8e79damr1576718lfj.8.1711113757184; 
 Fri, 22 Mar 2024 06:22:37 -0700 (PDT)
Received: from [127.0.1.1] ([79.114.172.194]) by smtp.gmail.com with ESMTPSA id
 m22-20020a170906721600b00a461e206c00sm1014176ejk.20.2024.03.22.06.22.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Mar 2024 06:22:36 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Fri, 22 Mar 2024 15:22:22 +0200
Subject: [PATCH v3 1/2] drm/msm/dp: Add support for determining the eDP/DP
 mode from DT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240322-x1e80100-display-refactor-connector-v3-1-af14c29af665@linaro.org>
References: <20240322-x1e80100-display-refactor-connector-v3-0-af14c29af665@linaro.org>
In-Reply-To: <20240322-x1e80100-display-refactor-connector-v3-0-af14c29af665@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2947; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=qc0EfWboibZiHcWOnPjRaVSUrErmgCEbUhza0YDil3o=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBl/YYV3QF4UeRaEwyDs6+opT9UnzzLkr6HNGyCU
 c+kgIUNaVaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZf2GFQAKCRAbX0TJAJUV
 VgEcEADG+nzfSGiMPotgiJk3JbU68ceT1L2GBQCiKgE0x2LH2mQX1bXDNAkD5KDKB3xxcpaxcGZ
 LHXWDx5WbU5g1gWRX1/0DNsfOnl59gxbyO4XMdv+wVtHocSTQM6/Fff07lDJfvNiFkzfHsnVEbE
 nNbUJlQionnYtYBXbVpQkZj3yUSlRP/hUWW3CV0Eiu6pjg7ylWI0axQM4BQZjGm6c2gFzMZsgwO
 DoEzDvZKP9E8P/MDHMTDUrijyrCp88k1k8I7/w5UOaNQaP+zBo3zLXzLanjvpFCFHm442g42Vly
 BKgWVknFmpqNh4yLSX6LsNujulS/auYCQIYw2A3CGd8yp799H6SZHq1hIxdmeCyuOC1XJG8a/m8
 kYZBFuJkqudHIjUIg1cpUx0bO6MsvHETeQ39lsRiHBqCZ0Ry8RfIqqkK8bZmZMEpNvGlVzAf1Tk
 V43fomFrw/jQhrkgLqgjzcMIwrlIamYUTE3sedUpWdUr7k+diaMwlbqqwmpkyb6ET+8Xlm53Iwj
 iG7XMOVpbSpQx3C9vXC2kU4CV051t2IAweTjCAnLiquwarD+zbc68j8+M0xUHPnsB7UCE3uEh7m
 Dj4rHxviHlficGoIFhfw6+WyrKTzsKNs7pi3RzBR8GEErsU11JC/Mueroj3VVmuP17K1F8ecTFy
 XWr3abeNrJgrpkw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
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

Instead of relying on different compatibles for eDP and DP, lookup
the panel node in devicetree to figure out the connector type and
then pass on that information to the PHY. External DP is not described
in DT, therefore, assume it's eDP if panel node is present.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 43 +++++++++++++++++++++++++++++++++----
 1 file changed, 39 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index c4cb82af5c2f..c9763f77c832 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -726,6 +726,14 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
 	if (IS_ERR(phy))
 		return PTR_ERR(phy);
 
+	rc = phy_set_mode_ext(phy, PHY_MODE_DP,
+			      dp->dp_display.is_edp ? PHY_SUBMODE_EDP : PHY_SUBMODE_DP);
+	if (rc) {
+		DRM_ERROR("failed to set phy submode, rc = %d\n", rc);
+		dp->catalog = NULL;
+		goto error;
+	}
+
 	dp->catalog = dp_catalog_get(dev);
 	if (IS_ERR(dp->catalog)) {
 		rc = PTR_ERR(dp->catalog);
@@ -734,9 +742,7 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
 		goto error;
 	}
 
-	dp->aux = dp_aux_get(dev, dp->catalog,
-			     phy,
-			     dp->dp_display.is_edp);
+	dp->aux = dp_aux_get(dev, dp->catalog, phy, dp->dp_display.is_edp);
 	if (IS_ERR(dp->aux)) {
 		rc = PTR_ERR(dp->aux);
 		DRM_ERROR("failed to initialize aux, rc = %d\n", rc);
@@ -1241,6 +1247,35 @@ static int dp_auxbus_done_probe(struct drm_dp_aux *aux)
 	return dp_display_probe_tail(aux->dev);
 }
 
+static int dp_display_get_connector_type(struct platform_device *pdev,
+					 const struct msm_dp_desc *desc)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *aux_bus;
+	struct device_node *panel;
+	int ret = DRM_MODE_CONNECTOR_DisplayPort;
+
+	/* legacy platforms specify connector type in match data */
+	if (desc->connector_type == DRM_MODE_CONNECTOR_eDP ||
+		desc->connector_type == DRM_MODE_CONNECTOR_DisplayPort)
+		return desc->connector_type;
+
+	aux_bus = of_get_child_by_name(dev->of_node, "aux-bus");
+	if (!aux_bus)
+		goto out;
+
+	panel = of_get_child_by_name(aux_bus, "panel");
+	if (!panel)
+		goto out;
+
+	ret = DRM_MODE_CONNECTOR_eDP;
+
+out:
+	of_node_put(panel);
+	of_node_put(aux_bus);
+	return ret;
+}
+
 static int dp_display_probe(struct platform_device *pdev)
 {
 	int rc = 0;
@@ -1263,7 +1298,7 @@ static int dp_display_probe(struct platform_device *pdev)
 	dp->dp_display.pdev = pdev;
 	dp->name = "drm_dp";
 	dp->id = desc->id;
-	dp->dp_display.connector_type = desc->connector_type;
+	dp->dp_display.connector_type = dp_display_get_connector_type(pdev, desc);
 	dp->wide_bus_supported = desc->wide_bus_supported;
 	dp->dp_display.is_edp =
 		(dp->dp_display.connector_type == DRM_MODE_CONNECTOR_eDP);

-- 
2.34.1

