Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB58561EF9
	for <lists+freedreno@lfdr.de>; Thu, 30 Jun 2022 17:17:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2598E10F5CF;
	Thu, 30 Jun 2022 15:17:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B27311A2E4
 for <freedreno@lists.freedesktop.org>; Thu, 30 Jun 2022 12:08:54 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id f190so10912272wma.5
 for <freedreno@lists.freedesktop.org>; Thu, 30 Jun 2022 05:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QmOHcW4dfoBP/OvF4P53/J8bPrjDpx4wlFz+sssEF1I=;
 b=eUHz07M69XsX41EIdlsP6DW5+h2PJQ2QMgl5OYcPczLU1myyKBoOauaFSW69ZaUJj+
 JDgUCIX+LiWCnbSDRl75ZFRuIDJVvU9FixAE+DFAujVKv4VABC34QWxqJ83yNQL3BSIv
 5gDC8JILomeiFpSG0xQOuGjPLQ/xgVf/UfojGmgq4su8DKjreyYBBycLqUjS5EDXupv8
 0RzAQhSoCMQi4ERVQnsAXb3xSiHqiRVc5BKs9EH/MBNobf74DZjQZdwKDkgAfBYPQS6Z
 8EU1VM7T1UI1ENvPyeRwQ4M9OThqD1MzsDcnXWWLfZholLuz6ET16UGgOdDWRvNYL3ny
 DX9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QmOHcW4dfoBP/OvF4P53/J8bPrjDpx4wlFz+sssEF1I=;
 b=MTqgGEed41K1ZNk65tEulTom75EZ8H8/AaROSsgxAUSWDQg06OSvLidhVpODjdbtcW
 rAdTajL6IUJKIEpq4fX1iV4o4YhAx20JdYLwBYvtqcdgR12EbCMtWtduryxrLbHoTaYf
 AkzWBGubP6CTus2xZlQAYBvBk/70fnsPC+XgpPWvyKcW4WB6CT2JED7HTLbqbzsbwFlH
 OFjQf6CB9om9Capfkynsr1pAxjfxtnGhSHq42en/eQ2CT6189Nj8LWExaK86obb+WY2z
 XSKLLP8iyf4JpmXwWzxw9U4a7o0NY0pt9PegkhkYyFYzcwHbKk7rQNBUYLpDrxbbuFV6
 argg==
X-Gm-Message-State: AJIora9jGANC/GSCb9XnKiFhZ2RTeA02WkS5wsiD1kNsihwO72XQjO8l
 EeA3R7Vh7Y630yBIsjWmbY6Hxg==
X-Google-Smtp-Source: AGRyM1s/BaoaFvloTFuVhjoHqSnlJ1Tb0W1qU2Sw/rXvQG/8eapTt6yLmWXi4C2u/YWzGCf4fHt6DQ==
X-Received: by 2002:a05:600c:a02:b0:39d:bdf8:a4f4 with SMTP id
 z2-20020a05600c0a0200b0039dbdf8a4f4mr9528858wmp.201.1656590932987; 
 Thu, 30 Jun 2022 05:08:52 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 m1-20020a7bcb81000000b003a05621dc53sm6286532wmi.29.2022.06.30.05.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 05:08:52 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Date: Thu, 30 Jun 2022 13:08:42 +0100
Message-Id: <20220630120845.3356144-5-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
References: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 30 Jun 2022 15:17:39 +0000
Subject: [Freedreno] [PATCH 4/7] dt-bindings: msm: dsi: Add vdd*
 descriptions back in
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
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 quic_mkrishn@quicinc.com, bryan.odonoghue@linaro.org, swboyd@chromium.org,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

When converting from .txt to .yaml we didn't include descriptions for the
existing regulator supplies.

- vdd
- vdda
- vddio

Add those descriptions into the yaml now as they were prior to the
conversion.

Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/display/msm/dsi-controller-main.yaml    | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 91324f0828448..fd9d472437853 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -125,6 +125,18 @@ properties:
       - port@0
       - port@1
 
+  vdd-supply:
+    description:
+      Phandle to vdd regulator device node
+
+  vddio-supply:
+    description:
+      Phandle to vdd regulator device node
+
+  vdda-supply:
+    description:
+      Phandle to vdd regulator device node
+
 required:
   - compatible
   - reg
-- 
2.36.1

