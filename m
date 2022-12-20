Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1786520CE
	for <lists+freedreno@lfdr.de>; Tue, 20 Dec 2022 13:38:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D32D310E3CC;
	Tue, 20 Dec 2022 12:37:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D973310E3AA
 for <freedreno@lists.freedesktop.org>; Tue, 20 Dec 2022 12:36:47 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id h10so11598774wrx.3
 for <freedreno@lists.freedesktop.org>; Tue, 20 Dec 2022 04:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EavGT4Puc+h0aZwFuDS/6S+WtpAyzJabS4DGaf73BZA=;
 b=vgdU3XWqu/RW55vCO1V8u3uh4aqfe3fEWyt0nWEWzNKlcuRmo3+H1wIoA0a/5atI0X
 Ejs6K/19fjsIzBWlQe8/MxNQTEBfydeKnapHyWTB6MXU4Omt4Zz60GMGt7ppDSR1rovj
 ntTMkDsJA6wiZnSqMJTSgF1vtrHD7zHtJFic5vw4FRkjY9VdCg9KvBYZBAVOV2+eQVT7
 RdhDsHwZitdjwPySCQ8qAct7j8hUhzBZVvNbVTQlRP+oB0HCMvDtUv6NWtcGyfUmeaym
 Ch7od+XnAy5J4nM83XUuRIhSjXj6wPXtWRE+poaHo9x3/SXO9aPod2AVuT6d7XekaARL
 1srA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EavGT4Puc+h0aZwFuDS/6S+WtpAyzJabS4DGaf73BZA=;
 b=NlbawExI1AmKKFjvGTcgHp7m1wd0OlGRLDqAVa47C+tvEUJ0fD5aheH2aXyGxVvVsg
 VFmY9SnNf5HYuSC9ey2kYjTr4V9N2dYhoIpD7bA7UomIxJAXuhoKelE4u9ymhfR8LJ3a
 YxKex9AJ75hcSGiurNDtx2Yi1rMvWr0ZUTyRmWVPUvrOMsRlhdm4++7zYs1ifofvLbvh
 Z0a/BHtiggP1BFjubNI1E6XJlAOi+tfW+KlA6Tdp5IxR9cg7fPfQ7qLWRZFEo0gSyh5B
 epIdf7cxr2wfjIJ5oDnKVlRu4WT0Wg7qcLQkWpx57eIgkJI1UEL195QXh7uLr6xlTZne
 Mj4w==
X-Gm-Message-State: AFqh2kqMVULz8fsV4umH4KX7WPhz4rjl+c0H7Vvex7Be9BPUl8PHqVHU
 rD4b6mhPMBj8oRy4gdg9gniIdQ==
X-Google-Smtp-Source: AMrXdXsDDzoMbqCmHInHOLoltwk/aIaW47vjVs1GGTqe7ReSVl+1Q8AG6gLhjJymA7qTamaL/6j8gg==
X-Received: by 2002:adf:cc83:0:b0:242:8d5:c6ee with SMTP id
 p3-20020adfcc83000000b0024208d5c6eemr1458540wrj.15.1671539806390; 
 Tue, 20 Dec 2022 04:36:46 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 da13-20020a056000408d00b00242257f2672sm12641208wrb.77.2022.12.20.04.36.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 04:36:46 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Date: Tue, 20 Dec 2022 12:36:21 +0000
Message-Id: <20221220123634.382970-9-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
References: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v5 08/21] dt-bindings: msm: dsi-controller-main:
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
index 4116b3010219a..785cc51838f07 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -143,6 +143,18 @@ properties:
       - port@0
       - port@1
 
+  vdd-supply:
+    description:
+      VDD regulator
+
+  vddio-supply:
+    description:
+      VDD-IO regulator
+
+  vdda-supply:
+    description:
+      VDDA regulator
+
 required:
   - compatible
   - reg
-- 
2.38.1

