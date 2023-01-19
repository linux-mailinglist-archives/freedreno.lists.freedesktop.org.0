Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DED006739E8
	for <lists+freedreno@lfdr.de>; Thu, 19 Jan 2023 14:22:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAD2110E92B;
	Thu, 19 Jan 2023 13:22:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E137010E92C
 for <freedreno@lists.freedesktop.org>; Thu, 19 Jan 2023 13:22:23 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id b4so2908499edf.0
 for <freedreno@lists.freedesktop.org>; Thu, 19 Jan 2023 05:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=50rzk8fpGbRdVDZHXg9S8+HwYz3izR2NNax3H/NsJOM=;
 b=EQYH8nmRze7ju0NbzV5aVZ8wk9IbpDAYSndDpevL/LReS8lfr7YzunKXHo3QMiB0Lw
 VLP1NUEjdznTS9vHjNh0Jmb0dUVH0ozAZ24QnjD24rx+zBEOx9NVmoUCgoHLo7VO7UC9
 bMrue2H7jqabZLVHKKrNCP5ElmwXfSi5mwy77IqBs/EougFYRAM8h5xFyHneLiYFJTCQ
 4jINsqTV+QLeM/TgA8u0xTD57rUCk3bcBtQKWON7rtxUGeD1WHVd3F9SbqIaIxsHKZMI
 7GY5i6huJhpc44Zo+NLgj8yTJblKA8m7t+PTWuLHp/dCIcW3KFAFCsELcOpsK36kmgcf
 jmKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=50rzk8fpGbRdVDZHXg9S8+HwYz3izR2NNax3H/NsJOM=;
 b=KQicuclG+Fz2DCoGxvE1Zz0fGuGeqfmOG1MfjKbv1dseewYFd/0oF1BgXXRCUO1MJV
 hXRJ5I9fNp2T08ivk7/TmAPRyKs3gZtmjkFcCKU7GxTs4s/LU8EfcJprQph5vkKBYx7I
 WBkDtWLHVXmKI8UyVUhK3XrfqtMEAq1svUALVYtVHbwaFrozDO9qug7NCmQgxYniIWb2
 fO8Zw5nDBf1xghw3O8xOjHK+dgQUHgnz8Wz7+m0xDPI6CEMM476L/VDJFuLGK0ot6qGw
 MWl0KkWNE5lTEeFrHU0/Ei+H+P3iCQ1l9mfaZyJRMBFpkfiYBg0JCPHlYLCUE6zmPhNB
 xcUQ==
X-Gm-Message-State: AFqh2koPKnDmOLPYhfKpuikpA6mj3bKFIiJHXmgL4+ISq9jKOqWJIP3d
 uBxayMEsB6tUFG23hPf9zNGCeg==
X-Google-Smtp-Source: AMrXdXvB9GaISd9Yzhla7Zc6iihEqpzFMjIt4vGeZ4d3vmWFPeCiNEnbZLlRK5LgWUXPdOFpfesk9Q==
X-Received: by 2002:a05:6402:3906:b0:49b:c516:72ee with SMTP id
 fe6-20020a056402390600b0049bc51672eemr12423199edb.41.1674134542257; 
 Thu, 19 Jan 2023 05:22:22 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 bt16-20020a0564020a5000b00482e0c55e2bsm15532646edb.93.2023.01.19.05.22.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 05:22:21 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Thu, 19 Jan 2023 15:22:14 +0200
Message-Id: <20230119132219.2479775-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119132219.2479775-1-dmitry.baryshkov@linaro.org>
References: <20230119132219.2479775-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 1/6] dt-bindings: phy: qcom,
 hdmi-phy-other: use pxo clock
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add pxo clock to the 8960 bindings (used by the HDMI PLL)

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/phy/qcom,hdmi-phy-other.yaml     | 23 ++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-other.yaml b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-other.yaml
index fdb277edebeb..2c21e120ff8d 100644
--- a/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-other.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-other.yaml
@@ -53,7 +53,6 @@ allOf:
           contains:
             enum:
               - qcom,hdmi-phy-8660
-              - qcom,hdmi-phy-8960
     then:
       properties:
         clocks:
@@ -63,6 +62,24 @@ allOf:
             - const: slave_iface
         vddio-supply: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,hdmi-phy-8960
+    then:
+      properties:
+        clocks:
+          minItems: 1
+          maxItems: 2
+        clock-names:
+          minItems: 1
+          items:
+            - const: slave_iface
+            - const: pxo
+        vddio-supply: false
+
   - if:
       properties:
         compatible:
@@ -98,7 +115,7 @@ examples:
             <0x4a00500 0x100>;
       #phy-cells = <0>;
       power-domains = <&mmcc 1>;
-      clock-names = "slave_iface";
-      clocks = <&clk 21>;
+      clock-names = "slave_iface", "pxo";
+      clocks = <&clk 21>, <&pxo_board>;
       core-vdda-supply = <&pm8921_hdmi_mvs>;
     };
-- 
2.39.0

