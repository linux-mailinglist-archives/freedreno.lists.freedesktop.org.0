Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2A94F9E9C
	for <lists+freedreno@lfdr.de>; Fri,  8 Apr 2022 23:05:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A6A010E684;
	Fri,  8 Apr 2022 21:05:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 238E410E683
 for <freedreno@lists.freedesktop.org>; Fri,  8 Apr 2022 21:05:54 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 b17-20020a0568301df100b005ce0456a9efso6932935otj.9
 for <freedreno@lists.freedesktop.org>; Fri, 08 Apr 2022 14:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aV4gP9imWb5RV0sDAD5Q2cONnZ9+iBwKt8kNT5bBOgs=;
 b=EPNSfj2nSYc7mOIqFUv4NpJ2ph3jKTAr6r155GsfmKoMjl+mstddRpU/PdkCD+veSr
 RRmRFlM2YM1vcHvSJOD16KHHggz7wTKD4KnPt2wSVe8I+KLt7zb2acZz8sBiiVifWvMI
 89QabWBFFUOuxcNwBpwpcOj/q4R2tLjw14g37tshRqdCwtxB/jvy3JDhfQRlsjwaauYJ
 MeuOb0c1u1AeWs9lU8KrdCEdbsORexjiWQFpe3SkflxGFQn9vCsryZO1CPhC/nA/L64U
 nk/F3WpK5aV6MdVZ9roK+zUfKDksBpag9Xp5jN+0GPLtufE3lREvNi2WfaVfsjG+Fa9d
 xC0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aV4gP9imWb5RV0sDAD5Q2cONnZ9+iBwKt8kNT5bBOgs=;
 b=o8jJy0v0RGy6ybqPUzK4ID7r/n11hBt87DDI6jvg58uTUBEWNXRxJIbSIETrv5LyiT
 abm/dNAfo4j6CyWdGeS3pKokD0iYYGPiBMc+kvVNPpn0cUDQy4jzaaAUJObFx/Wv3mDj
 dAAgeGtUodVKq0WyL5ia5SUhEXTVawsE8a9nkvOi4LMYQfQSNCz/OWPZRQZidxYktLvv
 HKdmIUb1zbGqB88R8NiCQ9BVfhrcfNkV5CnAtTHwR7tZ7TxKvpV5eqNSY80+MyolB8Hj
 zG/mqllfo3L35nVkGdlhCQ988YFkByM/J7pwN/URYW6QMX5jrl3qaRHhaOInGKAcFwuQ
 teBg==
X-Gm-Message-State: AOAM532JgeSrNfL2j6HryvaVqFh+O17UHYQW8+50D7VEOWR0u0UjqnBb
 Z6jd5trltHqp9QhHGQ6QM/7H1w==
X-Google-Smtp-Source: ABdhPJzHAUSFVblBCfU82rzxb0/OF2t7uWRv3V+7FZkZRXyvsJrWXXh9cYS+NGxmn7hZPw0F8IU1Tg==
X-Received: by 2002:a9d:6447:0:b0:5b2:35ae:7ad6 with SMTP id
 m7-20020a9d6447000000b005b235ae7ad6mr7240550otl.275.1649451953460; 
 Fri, 08 Apr 2022 14:05:53 -0700 (PDT)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id
 y18-20020a056871011200b000e1f5910d45sm6560356oab.7.2022.04.08.14.05.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 14:05:52 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri,  8 Apr 2022 14:08:12 -0700
Message-Id: <20220408210813.581391-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 1/2] dt-bindings: display: msm: Add optional
 resets
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
Cc: freedreno@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add an optional reference to the MDSS_CORE reset, which when specified
can be used by the implementation to reset the hardware blocks.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Resending these two patches again as I put "v2" in the subject, even though I
meant v3. Sorry about that.

Changes since v2:
- None

 .../devicetree/bindings/display/msm/dpu-qcm2290.yaml          | 4 ++++
 Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml | 4 ++++
 Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml | 4 ++++
 Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml | 4 ++++
 4 files changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
index 6fb7e321f011..734d14de966d 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
@@ -66,6 +66,10 @@ properties:
   interconnect-names:
     const: mdp0-mem
 
+  resets:
+    items:
+      - description: MDSS_CORE reset
+
 patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
index 12a86b1ec1bc..b41991eaa454 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
@@ -65,6 +65,10 @@ properties:
   interconnect-names:
     const: mdp0-mem
 
+  resets:
+    items:
+      - description: MDSS_CORE reset
+
 patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
index fbeb931a026e..6e417d06fc79 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
@@ -64,6 +64,10 @@ properties:
   interconnect-names:
     const: mdp0-mem
 
+  resets:
+    items:
+      - description: MDSS_CORE reset
+
 patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
index 0dca4b3d66e4..1a42491efdbc 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
@@ -57,6 +57,10 @@ properties:
 
   ranges: true
 
+  resets:
+    items:
+      - description: MDSS_CORE reset
+
 patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
-- 
2.35.1

