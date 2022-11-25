Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 181A56389FC
	for <lists+freedreno@lfdr.de>; Fri, 25 Nov 2022 13:37:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42D0E10E751;
	Fri, 25 Nov 2022 12:36:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1614510E0FC
 for <freedreno@lists.freedesktop.org>; Fri, 25 Nov 2022 12:36:53 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id x5so6584690wrt.7
 for <freedreno@lists.freedesktop.org>; Fri, 25 Nov 2022 04:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gNXziAWeRjbSnLjIyAqIFKmN58WZ2py3nHOgpD+6wt8=;
 b=B57NIcGeUTV3e/AvfwgYfQCL8WwpO+0pQRZgOSRxRcokrVVCq9p7vd21/LZ4oCKoxa
 piyNSZC/Qei2zeUYwePaBbQLy1WhJCniO7E5K9qluHA7+U4UzStsAfhwSLpZSBEML5ga
 uzPcG1blbJsv/hJhKdwALTZWNt+hJWC1F1QBSs88M1sIf6cUaBKhiNlEnD7h0OZSWoXA
 +ZJOHjaJ+3/HUboX/ewRLgHh5DIn8xh2nvca8rYJ9E87E+JvAZVIVzH8D3fk0tFgSMNc
 JXmF121AWAkkcBxsbhaaSCc2Bs67nK0Msful+mSOGjFjWSN3avpV/TI0X1/dxQXylAMH
 fCGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gNXziAWeRjbSnLjIyAqIFKmN58WZ2py3nHOgpD+6wt8=;
 b=KID/st8GpgbFYGtjxX3jm/tDhAThw8A9Tcc5TyvlubGGA5Z/kW8gnpoIfieGnzvE5V
 4NHWQjIx36BHDrgJwAMC3L7ujwX14EdLlQh7NdF2RwZAW8BHJATjVwJ9rqgiqeNFRag3
 BIbWEiOgNmK7S71p9Oq6jXuQasVLH+n/w+XjptorndCbc8jpMu1CDOaPOdoZY9gWx0a8
 +SOCTigfsYmMBaS45GgBYNN/JNTq6grmbMiQK7rhJW0q15omYuFaSyXPFz0Y4mPazaQ7
 S0H5PE2cO7fGlX47ZTMUbtcFwgPBSBpZEmewVRbqeklYz8LmR4b4kCiOAiT9sUh3PTkr
 qOig==
X-Gm-Message-State: ANoB5pkFPyo6oMXKw5oxVQfUNzmxtpK/ivP+zx2Y9uFcWU8pJBmTZbvl
 QXB1g5dHjBV5CFLdhXDvz2WzKg==
X-Google-Smtp-Source: AA0mqf5fJKX3YejBQEmod2vLQ2Uujyxbwdzy+Q9rEcidm2wHUiU9vaCjMu45gX+3t2fw5sLRX+G17Q==
X-Received: by 2002:adf:e844:0:b0:241:bfc9:5975 with SMTP id
 d4-20020adfe844000000b00241bfc95975mr15595717wrn.605.1669379811597; 
 Fri, 25 Nov 2022 04:36:51 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 k15-20020a5d6d4f000000b002366dd0e030sm3574111wri.68.2022.11.25.04.36.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 04:36:51 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Date: Fri, 25 Nov 2022 12:36:28 +0000
Message-Id: <20221125123638.823261-9-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
References: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 08/18] dt-bindings: msm: dsi-controller-main:
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

