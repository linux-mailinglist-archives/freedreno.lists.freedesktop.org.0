Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E602E636F29
	for <lists+freedreno@lfdr.de>; Thu, 24 Nov 2022 01:48:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A50710E683;
	Thu, 24 Nov 2022 00:48:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34E0A10E66D
 for <freedreno@lists.freedesktop.org>; Thu, 24 Nov 2022 00:48:16 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 v124-20020a1cac82000000b003cf7a4ea2caso2800164wme.5
 for <freedreno@lists.freedesktop.org>; Wed, 23 Nov 2022 16:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gNXziAWeRjbSnLjIyAqIFKmN58WZ2py3nHOgpD+6wt8=;
 b=Hy1so5B7geaFM1IXMTGxX5JXmXgo0d3B5upAtbSpgsjAk/2UjOT2gHJfrdSN+wxXUO
 WI0Z62orpd561R41SBM7w5ewoEbZ5UZM38jFDQm6BpTYKAWj48vcII08LYCKJRg+QE0y
 OpfO9p7ux6kX1Giwy2ZyLBzLY7W//KO7J3AX76NHEF+6JT1Dk6aS2ttLIy6W3vDb+vI9
 uesiEcfN/aYlrqS9Lns7wHuS/cKaL645Ggi8qrMw2nmxRcDcgHvx2H9UEZo3L7kVkDuf
 UM486geAyMtnb/qL69zg1D7v7FaUojuUisRNMC6WUbGO+V2n/V4Szf+7xCvpXiPEBwds
 44Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gNXziAWeRjbSnLjIyAqIFKmN58WZ2py3nHOgpD+6wt8=;
 b=httJT6a08sRAJrmwlDzZINVCiEnWqxYMnNQKsAH8X6ohrjoNYOkQB/qDnTM0q7EqJi
 Pg/H4WgJyQr8KbG1WeWGBdOqjeQ1GPX4+CVt4/twVcQ+viCeX9zMWGBFJpPCD9CXqZcV
 nO2etQUVkF3w+UUafjgDZidUenvgTfQzXq1Dxd3W9+KjESGPv9hoWklmbjwQ0HzYkqRo
 WFVSHqahJgAPx5Oh3yj9LHGEBdwHNR5zosPvC3v5EStuaNDslk4SmTY1ZVAXihEO9tZf
 cPczP1HxKteZOqs9KmYvMzkQDYSS3sWoO7bLTbY3+cBasYRaNdb5wd3Mq5OWWW8mVewG
 uKJA==
X-Gm-Message-State: ANoB5pntaXSOjxUN4xmSE+kMfh0tZQChs+noNVpPdqbvkYO6ZZKeioVP
 zMsmntnmyu+iLkRfL3jD47rLyg==
X-Google-Smtp-Source: AA0mqf6YVz4IMn/YpDjmhDVs8Qlx7LojdAd8PiodySUyMSBe/MESilqDOspPk80Bu7xUlbNS6eEkTQ==
X-Received: by 2002:a05:600c:1d9c:b0:3c6:bf1e:ebb9 with SMTP id
 p28-20020a05600c1d9c00b003c6bf1eebb9mr24942343wms.173.1669250894492; 
 Wed, 23 Nov 2022 16:48:14 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 n38-20020a05600c3ba600b003c6bbe910fdsm5245076wms.9.2022.11.23.16.48.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 16:48:14 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Date: Thu, 24 Nov 2022 00:47:51 +0000
Message-Id: <20221124004801.361232-9-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
References: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 08/18] dt-bindings: msm: dsi-controller-main:
 Add vdd* descriptions back in
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
Cc: dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sean@poorly.run, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_abhinavk@quicinc.com, david@ixit.cz, dianders@chromium.org,
 robdclark@gmail.com, robh+dt@kernel.org, agross@kernel.org, daniel@ffwll.ch,
 dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org, swboyd@chromium.org,
 airlied@gmail.com, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

When converting from .txt to .yaml we didn't include descriptions for the
existing regulator supplies.

- vdd
- vdda
- vddio

Add those descriptions into the yaml now as they were prior to the
conversion. In the .txt description we marked these regulators as required,
however, that requirement appears to have been in error.

Taking the example of sc7180-trogdor-wormdingler.dtsi. The avdd and avee
come from GPIO controlled external regulators, not the SoC and in this case
there's no need for vddio to power an I/O bus. Similarly the regulators for
the LCD are controlled by the panel driver not by the dsi-ctrl driver.

It would be possible to connect a different type of panel to the DSI bus
here in which case we may or may not want to make use of vdd, vdda or
vddio.

This is also the case for older chipsets like apq8064, msm8916 etc the vdd*
regulators in the dsi-ctrl block are helpers not dependencies.

Add the description of vdd, vdda and vddio back in for the existing
upstream dts where vdd, vdda or vddio are already declared but, don't
declare those regulators required - they are not SoC requirements.

Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/display/msm/dsi-controller-main.yaml    | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 0fbb0c04f4b06..bcbcbdca1a78a 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -133,6 +133,18 @@ properties:
       - port@0
       - port@1
 
+  vdd-supply:
+    description:
+      vdd regulator device node
+
+  vddio-supply:
+    description:
+      vdd-io regulator device node
+
+  vdda-supply:
+    description:
+      vdda regulator device node
+
 required:
   - compatible
   - reg
-- 
2.38.1

