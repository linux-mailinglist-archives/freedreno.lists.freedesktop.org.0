Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE7E59C716
	for <lists+freedreno@lfdr.de>; Mon, 22 Aug 2022 20:49:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A84442BAF4;
	Mon, 22 Aug 2022 18:49:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2429214A99C
 for <freedreno@lists.freedesktop.org>; Mon, 22 Aug 2022 18:49:03 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id z6so16533015lfu.9
 for <freedreno@lists.freedesktop.org>; Mon, 22 Aug 2022 11:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=+6p730dgyqntkr7bllnjAf2d8NavekxWpvxDzWTO3h0=;
 b=eDeiz+RYOBRYfof7v0uXtkctIBuyowUeC9JCs+Do6Z8P9lu2mnnOO7RtMuFhTUlDON
 eFEO1XeNM4k9Gdr+HeINrVpuSeAFRw8jx8Ab9FlRve8WWZEOc1fDlsWqNaXIMQES9QMR
 vCSVP9oKodIqRWhIg0KmRPhoYC458rmDROSi9anxGe9d7MPpCelyEgXwJ8/sdtZUMCOe
 GtjUQEQu9oYe+m0X6Po9EHdEcy5+CsNFqBDxXqKWGUQ4XyM0pP/KM5LXQomf3C692378
 v873Q0wA6skDnACEKJBp455nmZHNPK/HfyJtunJq7Dc0QKv5pV44Q5fn1li6gaOIDX7h
 nhww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=+6p730dgyqntkr7bllnjAf2d8NavekxWpvxDzWTO3h0=;
 b=m88X43KJP/c4QzRdlp+dXehNiCIrjJYnxpnZwcu+V5Oh3Q5l/NZKBz60rLE61vB16+
 OZSZlKCRoSfjw/8ZTgbPDzIhQNcn3jFnvYSjs84fkY/w68FBlphEpcXPapq43WlSS0Wl
 S0WiJWL5N5Fyp0z2zfA1Ac+t4ittFzoRZiIXfyC0OoShfudhrRzc0g3asY7msjokE/Yy
 /grwhE4c12Js8hKtBc+7pCsHhY3i2rwg0PjK6FzZg1ZlKzyQ+TzMPcgF6kpPWAOoyJ76
 od3gxf54UdrGtIOjK08DVhU5t14/a2YHWbHZxftjJo3SZHNrWCkUXyYAb3Jv6Lz9eUkB
 gfFw==
X-Gm-Message-State: ACgBeo0P3rtBzgwEhG5wDgyoAeyDq/5mFICQY1TIHW9pc/PWYZAs6EaU
 y1hxlFPx6dL3VFAER18Jhsx5jA==
X-Google-Smtp-Source: AA6agR44lsNkng4rpEe72WkAzNNu0JEWbU0OeFAkX8SVca0JpyvVTSqiNbeUBsgEd8RImBEhTfW9UQ==
X-Received: by 2002:ac2:4e16:0:b0:492:e5be:bcc0 with SMTP id
 e22-20020ac24e16000000b00492e5bebcc0mr1953621lfr.210.1661194142326; 
 Mon, 22 Aug 2022 11:49:02 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 w11-20020a05651c118b00b00261bc05c461sm1672599ljo.50.2022.08.22.11.49.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 11:49:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Mon, 22 Aug 2022 21:48:58 +0300
Message-Id: <20220822184900.307160-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220822184900.307160-1-dmitry.baryshkov@linaro.org>
References: <20220822184900.307160-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 1/3] dt-bindings: msm/dp: mark vdda supplies
 as deprecated
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The commit 85936d4f3815 ("phy: qcom-qmp: add regulator_set_load to dp
phy") moved setting regulator load to the DP PHY driver (QMP). Then, the
commit 7516351bebc1 ("drm/msm/dp: delete vdda regulator related
functions from eDP/DP controller") removed support for VDDA supplies
from the DP controller driver.
Mark these properties as deprecated and drop them from the example.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/msm/dp-controller.yaml   | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 94bc6e1b6451..391910d91e43 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -76,8 +76,10 @@ properties:
   "#sound-dai-cells":
     const: 0
 
-  vdda-0p9-supply: true
-  vdda-1p2-supply: true
+  vdda-0p9-supply:
+    deprecated: true
+  vdda-1p2-supply:
+    deprecated: true
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
@@ -140,9 +142,6 @@ examples:
 
         power-domains = <&rpmhpd SC7180_CX>;
 
-        vdda-0p9-supply = <&vdda_usb_ss_dp_core>;
-        vdda-1p2-supply = <&vdda_usb_ss_dp_1p2>;
-
         ports {
             #address-cells = <1>;
             #size-cells = <0>;
-- 
2.35.1

