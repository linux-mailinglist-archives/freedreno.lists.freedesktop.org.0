Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB096389FD
	for <lists+freedreno@lfdr.de>; Fri, 25 Nov 2022 13:37:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC28610E752;
	Fri, 25 Nov 2022 12:37:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D067B10E750
 for <freedreno@lists.freedesktop.org>; Fri, 25 Nov 2022 12:36:50 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id x17so6573452wrn.6
 for <freedreno@lists.freedesktop.org>; Fri, 25 Nov 2022 04:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3eO0tOz0zwXGw3TOZj4ZrnPJ+UUmohAjz6RImQ5MpXA=;
 b=rw7OkFYVSgqoQVPYbmo07GPVDQZXbOZfklzf0iuA1pLB5kn87Z0aRfgz1vNm1AUXcw
 Hn9bRVntNUaM/efzL7ltG91jGkxVMd5y/63GyTRSjJeC5V1gFDQriYOujPczG0WgHrfo
 Lceqv6BqJXrBd8NzsZFO9LpVq4TyOJ2A8cGjHtv1tirsP99H+6aN1k0V4SuBYmlSEwjD
 NaC3Nbg6lXbHcAC7cD+7fzrl9ZxpjPEQ4UXRfMzKrxXRqLWd/uOTO2qhQZ18AMfk9nPs
 8Ah+Fs9pIV/K+atMhMVxbMbejMgkd/T7GUndMvDEkrfRai/F2RcimLvsqBb7AckwmELB
 IQ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3eO0tOz0zwXGw3TOZj4ZrnPJ+UUmohAjz6RImQ5MpXA=;
 b=cXzp4gk3zBhL5fb6tCxg/dlcTb+756uXB65O7OFAVACABMSzMPA2x+bm5SXwUh+Xhb
 CvXrgWOT350bnRzMLU5LM0nFnpltNQledaKMvD15/Wad9NlL7hsJyJvSOVI4DeWkUFvE
 bp45Rib6ZY3agJ5dCcK8iYtHCH+4z1eaO28v3/LxYjQyDpXdYAIA8jFOrXVoA7GB9HYO
 u1FuiMYHLbEWuaakrhfo99iyZ6NXyBy1IXFqDUzUj6xrzhX2sNVM1CfyDDLMgzGoIWr2
 oSXyxyml391cExCJbIfu5m0BVdsT5mej/ye2smjnpfWAL0rLd2fpe9q28dChEWGxX8wa
 lJHA==
X-Gm-Message-State: ANoB5plgxeZ4lhKbrvH8Mt8fdsk0Mw/RCP8bAhMmNiqXijYdedGkVB23
 rDVsBNcVSSvQ4WTETjMR2VTsQg==
X-Google-Smtp-Source: AA0mqf4OKlROBYEynzKQq2L5JzBnHuUvehZ+0OQFWf3AtQSueLGxT8saq9/9I3MB1lWsXVVGH9/oQg==
X-Received: by 2002:adf:fb44:0:b0:236:87f4:75d with SMTP id
 c4-20020adffb44000000b0023687f4075dmr22313163wrs.447.1669379810368; 
 Fri, 25 Nov 2022 04:36:50 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 k15-20020a5d6d4f000000b002366dd0e030sm3574111wri.68.2022.11.25.04.36.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 04:36:49 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Date: Fri, 25 Nov 2022 12:36:27 +0000
Message-Id: <20221125123638.823261-8-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
References: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 07/18] dt-bindings: msm: dsi-controller-main:
 Fix clock declarations
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

When converting from .txt to .yaml dt-binding descriptions we appear to
have missed some of the previous detail on the number and names of
permissible clocks.

Fix this by listing the clock descriptions against the clock names at a
high level.

Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../display/msm/dsi-controller-main.yaml      | 20 ++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 0c09b9230b7f5..0fbb0c04f4b06 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -36,13 +36,19 @@ properties:
     maxItems: 1
 
   clocks:
-    items:
-      - description: Display byte clock
-      - description: Display byte interface clock
-      - description: Display pixel clock
-      - description: Display core clock
-      - description: Display AHB clock
-      - description: Display AXI clock
+    description: |
+      Several clocks are used, depending on the variant. Typical ones are::
+       - bus:: Display AHB clock.
+       - byte:: Display byte clock.
+       - byte_intf:: Display byte interface clock.
+       - core:: Display core clock.
+       - core_mss:: Core MultiMedia SubSystem clock.
+       - iface:: Display AXI clock.
+       - mdp_core:: MDP Core clock.
+       - mnoc:: MNOC clock
+       - pixel:: Display pixel clock.
+    minItems: 6
+    maxItems: 9
 
   clock-names:
     minItems: 6
-- 
2.38.1

