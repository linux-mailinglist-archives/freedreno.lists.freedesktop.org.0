Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DB056CDFB
	for <lists+freedreno@lfdr.de>; Sun, 10 Jul 2022 10:42:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4FDA11BFF8;
	Sun, 10 Jul 2022 08:41:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64C4F11BFF1
 for <freedreno@lists.freedesktop.org>; Sun, 10 Jul 2022 08:41:45 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id n18so2528650lfq.1
 for <freedreno@lists.freedesktop.org>; Sun, 10 Jul 2022 01:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WZU55ztxCr9hrm/X9mq0W7rnO8DhBgA9l+GjYiiRXCk=;
 b=j7WKH1P9qrMtVfM+BgRoq05JqWY9cqgdDSOY0uMJ+i+8vwStr6I3MUVM2F/0mo/bUn
 SRQnXsUNDz88GLtbvVdJknG/dcAAY3PhVKkvsj/NJbuQbxyk6L3hksHvGDEDgSGUkzYz
 OTCvxU/U/EqnQUgDNdO1/bBL87VtpycpRHXJO3EecLnuPnLC/meVtM6JmLc7ZsDUM1Xp
 Pu0Azk4GUHVoOAQHhPPDRfHw6TfHz+PKCpedDEl3vvE2OOhOapqMh650MEQa/IbKocSc
 FQHjPK89bsHYItgUfUEyRUvnNHs3VQKamH1aNwj6U6A7mDEhCP69LjegN8zYxKva8k3u
 Js2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WZU55ztxCr9hrm/X9mq0W7rnO8DhBgA9l+GjYiiRXCk=;
 b=8KUjqIFGapmiDRJKktNysB1ryF1FeWJSoLEKdIocGM6qCkVYnZKonm0x/lzEB0faIg
 EAAMPUaVQXqyEt6QBg+Tm7E62Cy4uxXOz4QwyGY/hIzGyfA8O92kIB/jYBGhOJ+fy0S0
 VYd7gRlg0W9fpfxB5oJZnUGCIv0rloeSWdtNlfstH10dud+yfOw3Nt8LpcnhNjBS6iYu
 Z24LOBSRCGBYisLUavnonlqvIiC9pIqwZ0q73EFmPUCsGIgq+zoRMU2niTzGnvYp6Bs3
 DBRCuPofSTEf1tJkSBZ/Farwb0+80IcJ8XZ09i8kSuZw7QDdDXbtw0qEui4g5QTAgtI8
 GW1g==
X-Gm-Message-State: AJIora/b5y2KU79GCIc77YFOZjV2Sslx7iI3yUoiz7ATE74xa9CrOnpf
 +4tHkS30XHH8rlNq5GksSFd++Q==
X-Google-Smtp-Source: AGRyM1vxQa30p97YqLFfiaEcWr22TJ7iZraKSZ6N1/3jsyAQ35Xl5FJKJAdTXadD7Mj4DfudYkLbbw==
X-Received: by 2002:a05:6512:2306:b0:485:8e08:5740 with SMTP id
 o6-20020a056512230600b004858e085740mr8320796lfu.354.1657442503707; 
 Sun, 10 Jul 2022 01:41:43 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 i21-20020a2ea235000000b0025d4addbad4sm912536ljm.91.2022.07.10.01.41.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jul 2022 01:41:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Sun, 10 Jul 2022 11:41:32 +0300
Message-Id: <20220710084133.30976-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
References: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 8/9] dt-bindings: msm/dp: add missing
 properties
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
 Kuogee Hsieh <quic_khsieh@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Document missing definitions for opp-table (DP controller OPPs), aux-bus
(DP AUX BUS) and data-lanes (DP/eDP lanes mapping) properties.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dp-controller.yaml          | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 391910d91e43..52cbf00df0ba 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -70,9 +70,21 @@ properties:
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

