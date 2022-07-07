Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFF956AD88
	for <lists+freedreno@lfdr.de>; Thu,  7 Jul 2022 23:32:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4470811B623;
	Thu,  7 Jul 2022 21:32:14 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 543DF11B12D
 for <freedreno@lists.freedesktop.org>; Thu,  7 Jul 2022 21:32:11 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id o7so4166219lfq.9
 for <freedreno@lists.freedesktop.org>; Thu, 07 Jul 2022 14:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FQ3ulOTd9YQetXSjeiiQJmb1xAaBiHtF+6lK/e/6dKE=;
 b=NP9Hf6Lj/UnC4B3F+w8ENKeepJJ11z2mUCuaJuqcVosGX0WztK6UPJcMPebyFA45bL
 03tJnpGkfCD6tvUQuzOVHXwYI8Zp2f+F9sL0+YwkXBKGyWo/4VLPai/2b2IivS6eAp52
 9yB6Deuv9ts382p1qnlGzvZZcYVqiClmjHFHPD6zZWKUy8KMqQLBbbiEdEMNmHlugmLZ
 1cuNL+9akEgDglzfMBpgRvq6DSHvJvkE+p36OvbfbVo/jzkY1D5wMpbvFJzibKoBmw/1
 KxyGAAyNGZ1Sc+WZK/5w2WZ6QV5oYp/tlPUyAs3KSaOrBe3iCIJyuAd/W56gOeIuI8Mn
 Vvcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FQ3ulOTd9YQetXSjeiiQJmb1xAaBiHtF+6lK/e/6dKE=;
 b=u+A47IpHLycpEuBAnZcJTVurn9kiygIoQCmJzXrUE8KuHP+Pkppt/bY0RfL0W7Febe
 BDwyXv1Imdi1Yc6gdErdPn1aNB4mEHlkrbdsNfTlTzda/ZAbZzEqgGxInLQbmKRgMuwT
 DVBQqEb9AOe3YJRBZNaLkwu4bjDs5U/hdqeUjbgHIT3ei1iNCcqhAp/NmA2ZOtz6it63
 pLAdiaXAc28cqYUb7LpGXNT2xd2D9IGVtZ39rbDxFXlXoJnUaWdtbN5W16XtNP4yI5XM
 szR5ZBQOf2OAehW5wU+jebpGkWdIbtAGKYO/7qbW951ca2uBwGxeb2QqBA6GkLLuyr16
 0WTA==
X-Gm-Message-State: AJIora+f5uclrljGZdk2znbjsWDv6YiP/gsnWkXS6TFxrKg1gwn9ompO
 z6t7QHG+AcSlyZVS9WXVCiQgjg==
X-Google-Smtp-Source: AGRyM1vw3ulfh2afxtg/pP0/p/ek20FusHvC8eHTLJ93RWMOeI4sRSsmM9E7qrOgiJHh02iIDzPyAg==
X-Received: by 2002:a05:6512:3d89:b0:481:bcf:cecd with SMTP id
 k9-20020a0565123d8900b004810bcfcecdmr124021lfv.511.1657229529643; 
 Thu, 07 Jul 2022 14:32:09 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 o19-20020ac24e93000000b0047f8cb94004sm7046709lfr.35.2022.07.07.14.32.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 14:32:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Fri,  8 Jul 2022 00:31:59 +0300
Message-Id: <20220707213204.2605816-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
References: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 4/9] dt-bindings: msm/dp: add missing properties
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Document missing definitions for opp-table (DP controller OPPs), aux-bus
(eDP AUX BUS) and data-lanes (DP/eDP lanes mapping) properties.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dp-controller.yaml          | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 75344694466f..f00eae66196f 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -73,9 +73,21 @@ properties:
   operating-points-v2:
     maxItems: 1
 
+  opp-table: true
+
   power-domains:
     maxItems: 1
 
+  aux-bus:
+    $ref: /schemas/display/dp-aux-bus.yaml#
+
+  data-lanes:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 4
+    items:
+      maximum: 3
+
   "#sound-dai-cells":
     const: 0
 
-- 
2.35.1

