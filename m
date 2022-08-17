Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C56596965
	for <lists+freedreno@lfdr.de>; Wed, 17 Aug 2022 08:21:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AA5E10F3F5;
	Wed, 17 Aug 2022 06:21:14 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A50389058
 for <freedreno@lists.freedesktop.org>; Wed, 17 Aug 2022 06:21:07 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id j3so12664368ljo.0
 for <freedreno@lists.freedesktop.org>; Tue, 16 Aug 2022 23:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=HuUejYNqu/N+TiW6kMozoGOD+NSY1oswFg6/0Xs13h4=;
 b=pJZ5DkZNYpXuOf0hXNbcS+yS5hzdq8E3G3TAJrXcHys1iE028QcgupnJeumvo9U8JT
 BIPbWlwAh8B6r4bo9HF0Q/a5z5+bqr08zPZs/1RcMJsUeAtjQv0tpwkzvVVs7YOVew+G
 Q1y1eb7JGq5dbsPsE+hN0LKyu8+zzshtmW4bnQXBXHsezunX8KcAUmMIKehQcpgQnyBt
 ek0YpOIj9eO69sx91RPaCQ2PdxOvRjAwKVwjKSsYqB/4hs8VuNqzip1NsvIjTBCw/EPz
 i0RJfcNAVTuuuww+4aief+QOlTGmup0jVvQycB1LzoVCjNAD7Kk8R/vULgNOJBzB9xPV
 /lmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=HuUejYNqu/N+TiW6kMozoGOD+NSY1oswFg6/0Xs13h4=;
 b=KOMI7LntnAomdyiTQNr+UBW5EFLDabo2ufT/OSnIC8ZpzOxDuBXA83FAh+2plyKJIi
 ambPs+j835CZcxD74NWFi3Vl4a9Zz43SPGzfPeysfgHTm3qYu1cy9tPR+37zGH//HMbS
 J3WxDXXEGcL7nSpTH2Yd/qeljS9rUsNqJ55osCBU+yZ7aFfpj0snLxgF4lgwBRMDajyN
 0gsY0Lh/2jEGuJqsCBEPphC0sOvlBAGfyX3VTOtDXZUp5Lo26EFK+w+EyZCm04mVdZdk
 BA1u+oLmJXgIIA/VhlQEwO9LyGga2Hhvqwy/JcPfFPUYSaikGTiP4i1z4q1Zh8xFaoAY
 st7w==
X-Gm-Message-State: ACgBeo0JAldbiBnEPFRCwZMFZukLKJDSnB7DzqS3pZ1djAdniWdsOOIB
 ven2wwWxAZf8H15sYyYxDMF0Vw==
X-Google-Smtp-Source: AA6agR6nP7zaIPS/O5c2eBWMpn2WzYmM8t4kMy8yV5jHzQmK5zD5FSzUNorUJeKyo34f7WAW0a146A==
X-Received: by 2002:a2e:904d:0:b0:25e:78dd:62f9 with SMTP id
 n13-20020a2e904d000000b0025e78dd62f9mr7380939ljg.122.1660717265839; 
 Tue, 16 Aug 2022 23:21:05 -0700 (PDT)
Received: from krzk-bin.. (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi.
 [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
 by smtp.gmail.com with ESMTPSA id
 u27-20020ac258db000000b0048b0062a14fsm1581002lfo.144.2022.08.16.23.21.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 23:21:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Del Regno <angelogioacchino.delregno@somainline.org>,
 Loic Poulain <loic.poulain@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Wed, 17 Aug 2022 09:20:56 +0300
Message-Id: <20220817062059.18640-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220817062059.18640-1-krzysztof.kozlowski@linaro.org>
References: <20220817062059.18640-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 2/5] dt-bindings: display/msm: dpu-qcm2290:
 add missing DPU opp-table
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The 'display-controller' child (DPU) of Display SubSystem (MDSS) uses
opp-table, so reference it which allows restricting DPU schema to fixed
list of properties.

Fixes: 164f69d9d45a ("dt-bindings: msm: disp: add yaml schemas for QCM2290 DPU bindings")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
index 734d14de966d..c5824e1d2382 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
@@ -74,6 +74,7 @@ patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
     description: Node containing the properties of DPU.
+    additionalProperties: false
 
     properties:
       compatible:
@@ -113,6 +114,8 @@ patternProperties:
         maxItems: 1
 
       operating-points-v2: true
+      opp-table:
+        type: object
 
       ports:
         $ref: /schemas/graph.yaml#/properties/ports
-- 
2.34.1

