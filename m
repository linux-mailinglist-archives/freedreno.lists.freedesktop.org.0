Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86851561EF7
	for <lists+freedreno@lfdr.de>; Thu, 30 Jun 2022 17:17:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25D8910F5D9;
	Thu, 30 Jun 2022 15:17:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4F3D11A2E4
 for <freedreno@lists.freedesktop.org>; Thu, 30 Jun 2022 12:08:55 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 o19-20020a05600c4fd300b003a0489f414cso1524354wmq.4
 for <freedreno@lists.freedesktop.org>; Thu, 30 Jun 2022 05:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DyPxfEgniN5NAuSTp0u5CFD7e7/QLtzxkjKqP7SWLms=;
 b=KYn84+/cfSOH4MzjIixeA5hWyTicZ6TpkqLzPVy2guLoqeA3aeEWEtjfwJYiMFL17t
 NhpDQaZH68tZAJd5cqFWj9FWa9KjLZ6shKcHDCrrewAigvKxo2kl4VCvVaYraX9QthyM
 AUFbgPAA7jyGrlCJLXAcfecgwi+uyaasntwYX1K3jXJDqZ+D0e/GOr0W5lAoGnIwaU5h
 CdeYkWDqZJus41Wslm1cpfrudhVYypccQUUiI+SvWzKbzpKWGPug0egBiIzhcy5aSfrV
 wiY01A5rRMSU0lOKZ2ve5ibEzloEGiURINYaIa6FrYmy6Rl+cGtNvf8q+QiVtIwZy5vj
 b+Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DyPxfEgniN5NAuSTp0u5CFD7e7/QLtzxkjKqP7SWLms=;
 b=QFlZvjEVBizqL7T1SHrTEDZg8dRIFE0xXycq/4yg3dJJto19fru9rSgd8+nlrRYS5S
 gCNRg+dy38g2SdGyR0j0QBD5XHHsefu0G/J1oVNUZfMSvzVwRPq9Sn+u3QDUqOow4oRO
 sSiuhLfnfskP1vWaks0IflIkuLmVlMcoMRcha8Dov6v0fqiYKUkV8AqbuYnU+olTrual
 h1RhfpGV9DPDjXyRkAcTFjV0QnVZrsWU7J7rOnzQIdZ8pwERw644L8WoB8gt0NXnIeji
 7/e/9S43JUTa501edvWgYAmZA3EIi8oF/HU8f4D9j78kOrLx2Y1hXSYVyLD2J4AKJfLm
 M9cA==
X-Gm-Message-State: AJIora/3FCBocAH7U8XPiT/4P0xOqKOMNbevGCkmLq8pt+JGkzWEGnko
 txjuKUTT/C13HGpcEjZQWsUZ8A==
X-Google-Smtp-Source: AGRyM1vMKCCLOxQaWrm/VzD2MG3JjZP+mwqBUGB9LgYbHwney0SzT0Gq4V/cF0E6OuH5UJ2GT8brlA==
X-Received: by 2002:a7b:c741:0:b0:3a0:5473:efc1 with SMTP id
 w1-20020a7bc741000000b003a05473efc1mr11942903wmk.201.1656590934390; 
 Thu, 30 Jun 2022 05:08:54 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 m1-20020a7bcb81000000b003a05621dc53sm6286532wmi.29.2022.06.30.05.08.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 05:08:53 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Date: Thu, 30 Jun 2022 13:08:43 +0100
Message-Id: <20220630120845.3356144-6-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
References: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 30 Jun 2022 15:17:39 +0000
Subject: [Freedreno] [PATCH 5/7] dt-bindings: msm: dsi: Fix clock
 declarations
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

When converting from .txt to .yaml dt-binding descriptions we appear to
have missed some of the previous detail on the number and names of
permissible clocks.

Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../display/msm/dsi-controller-main.yaml      | 23 +++++++++++++------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index fd9d472437853..b24ba6c346a77 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -28,22 +28,31 @@ properties:
     maxItems: 1
 
   clocks:
-    items:
-      - description: Display byte clock
-      - description: Display byte interface clock
-      - description: Display pixel clock
-      - description: Display escape clock
-      - description: Display AHB clock
-      - description: Display AXI clock
+    minItems: 6
+    maxItems: 9
 
   clock-names:
     items:
       - const: byte
+        description: Display byte clock
       - const: byte_intf
+        description: Display byte interface clock
       - const: pixel
+        description: Display pixel clock
       - const: core
+        description: Display escape clock
       - const: iface
+        description: Display AHB clock
       - const: bus
+        description: Display AXI clock
+      - const: core_mmss
+        description: Core MultiMedia SubSystem clock
+      - const: mdp_core
+        description: MDP Core clock
+      - const: mnoc
+        description: MNOC clock
+    minItems: 6
+    maxItems: 9
 
   phys:
     maxItems: 1
-- 
2.36.1

