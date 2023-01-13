Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C925966912C
	for <lists+freedreno@lfdr.de>; Fri, 13 Jan 2023 09:37:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA7A10E9B8;
	Fri, 13 Jan 2023 08:37:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1936C10E9AF
 for <freedreno@lists.freedesktop.org>; Fri, 13 Jan 2023 08:37:29 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id m6so32084939lfj.11
 for <freedreno@lists.freedesktop.org>; Fri, 13 Jan 2023 00:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yuJMrsipL0mKmACZqifash1MyLzKAd9cIeUIIshG2lY=;
 b=Tp65qKwABUL0Bh/AYaL4q/+FeNz4kL7AnAQqbZ2Sb2wru2o2rQKaqrEBYXwGT77+2c
 LZvuVS/dxy3OBHZuJqFSU5xY4pwUIdsNQr4KoxuxVr9pysw4gprSt7hVI1k30lTqY6+E
 9GPwyjveWCwMTFFdxIIhtKGKXnvf7lFrPQCj6XJKu4u55B7iYyoNHwRcRNclyLtDNTzT
 Y7zMfpXWkCaxotdCfZO9mcaPihI7xa02n2SW6sG4qReNRUvtWB0raq3bjM2mZIPG33t2
 032aduBxehfJx91QrHM7ZC0lZu7sKVh0CZkBeMceyPD54CGESCxjal1OqXIRFG6/1Aas
 5nPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yuJMrsipL0mKmACZqifash1MyLzKAd9cIeUIIshG2lY=;
 b=jjX4kSSKTslhpWtLZl6WEWKmCgD9/eMvVPyZZJzEp48QRPB01jHFRevbgXCuarY/yQ
 sDvk0HyToxL95fw9RS7SckA5A707ZzqaU0xAPTUmeLK5rF89nvG2CNBhhf7bSMVlFGFh
 xMtIIkgJ7IcEe/Wv4lJACfWS7+/E3UaZDrt46GRaBwTLDsK0hVbpMvKHPgQqjDVjF7mZ
 iCMnyfICy/TwQn3t1dBzEte6HWYXkFwsYpUhnkIAUxUbrytpW7JFLYFBZtNn8snuIdJh
 4oTZsIqKhtytKYz5BJyQ2GHyYyqZfrE0V92Ub3jkCvGTHoSU49taOzdPXK7GyBJJZM8c
 6TZA==
X-Gm-Message-State: AFqh2ko6naEKLfd1YZcJtx+FuckYWuEC6a2y6OCXagBj3XAll5Haa4Is
 AxtgC+EZYrDhWQCAGOyE6EItQg==
X-Google-Smtp-Source: AMrXdXvb3ZphCNsLO2P8Nf+Zc2ormFq80P/cEXjLZKWfjACOcqidT2kZjBZPP0kKTEFDKzPmoFl9+g==
X-Received: by 2002:a05:6512:e89:b0:4b5:b7be:136b with SMTP id
 bi9-20020a0565120e8900b004b5b7be136bmr23947543lfb.69.1673599048640; 
 Fri, 13 Jan 2023 00:37:28 -0800 (PST)
Received: from eriador.lumag.spb.ru ([194.204.33.9])
 by smtp.gmail.com with ESMTPSA id
 o6-20020a05651205c600b004994117b0fdsm3748038lfo.281.2023.01.13.00.37.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 00:37:28 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Fri, 13 Jan 2023 10:37:13 +0200
Message-Id: <20230113083720.39224-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113083720.39224-1-dmitry.baryshkov@linaro.org>
References: <20230113083720.39224-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v6 04/11] dt-bindings: display/msm: rename mdss
 nodes to display-subsystem
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

Follow the 'generic names' rule and rename mdss nodes to
display-subsystem.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/msm/mdss-common.yaml      | 8 ++++++++
 .../devicetree/bindings/display/msm/qcom,mdss.yaml        | 5 ++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
index 59f17ac898aa..ccd7d6417523 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
@@ -15,7 +15,15 @@ description:
   Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
   sub-blocks like DPU display controller, DSI and DP interfaces etc.
 
+# Do not select this by default, otherwise it is also selected for qcom,mdss
+# devices.
+select:
+  false
+
 properties:
+  $nodename:
+    pattern: "^display-subsystem@[0-9a-f]+$"
+
   reg:
     maxItems: 1
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
index 6948ae3ac7bc..6fda819f0189 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
@@ -15,6 +15,9 @@ description:
   encapsulates sub-blocks like MDP5, DSI, HDMI, eDP, etc.
 
 properties:
+  $nodename:
+    pattern: "^display-subsystem@[0-9a-f]+$"
+
   compatible:
     enum:
       - qcom,mdss
@@ -159,7 +162,7 @@ examples:
   - |
     #include <dt-bindings/clock/qcom,gcc-msm8916.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
-    mdss@1a00000 {
+    display-subsystem@1a00000 {
         compatible = "qcom,mdss";
         reg = <0x1a00000 0x1000>,
               <0x1ac8000 0x3000>;
-- 
2.39.0

