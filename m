Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F51752922
	for <lists+freedreno@lfdr.de>; Thu, 13 Jul 2023 18:52:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B99410E70E;
	Thu, 13 Jul 2023 16:52:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 946EF10E70E
 for <freedreno@lists.freedesktop.org>; Thu, 13 Jul 2023 16:52:48 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-6b9b4a1211fso346467a34.0
 for <freedreno@lists.freedesktop.org>; Thu, 13 Jul 2023 09:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689267167; x=1691859167;
 h=content-transfer-encoding:author:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/TQQu9i4zVTx/pAbl1XLa7p043pJkUqA0em0AaQVe1Q=;
 b=EOJTZVfBLXbJ+tgLJUJRaAhYQO95hGodf9yyM3ZyJmDrHCRlhC2xTABoIUd+3Cl1Yo
 XO6MFz+wN+mKMs6tq2jcRQ64XxumnSH7k9awmG8P4d7raV506yyFNuk+QzDmoxlG7chk
 Xm8c4ZN86UiZ92TA62A3E7CqOGXkzsg58hlso09jztugiWJsrZlajfgdFEImk3AudVEl
 cx4jXLpbjX+rbI6inQvzyxatK+J3NV0dtyEMl2rdalG0LM16oQKztrzu1e9wqiv4IAZx
 OywlZGqh1gyC+BOajdMLtm5QuJcdzMOffKpKItqBLM8fiPpYEPx/vCTS+0PA28sPaCRn
 hNEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689267167; x=1691859167;
 h=content-transfer-encoding:author:mime-version:message-id:date
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/TQQu9i4zVTx/pAbl1XLa7p043pJkUqA0em0AaQVe1Q=;
 b=Jq0WCAi35xtYcZn8sHPJy1THqO0b51aaeP0FC4KZaVTDAxS4ylBmUJi7YmW+wNYaWc
 R5rjcuqgaroBuJBJoEwLwjk6ZR5EQ6FUpXmif5WoTta+RAJo2LVgo9dSdiINyCk1c5De
 N9DpQFkm63gX38/CxTRPSLgSn4Ylce6MyNwoz/n2+z/mJn2RePQikht662fo79AYv+8F
 SjFT9pdgcZxIvbMOopU5fMFbvw21uS2d4IRC2rK18izMqJLIPPB8uTsxq31ub13vbgsE
 T83PqNfIekjPj2FlF0LBq/+d4VrWXzx2ra3Oxr3tus103dFfnjKjrCmkn29udZ//PR9E
 T+oA==
X-Gm-Message-State: ABy/qLb4hAMCQoFj+xJtixeUsDNwHUdUt5KkHFIHvUpTBy8byNv8gD6n
 Xe6reApttUyVfyQtgwqZMzN1Ew==
X-Google-Smtp-Source: APBJJlECN8Pkf5oJl1wriKAi9i7oMviETr74ANXnYL6u7bXmI8D7Lz2S54OFWvuw32qLmK8Qci/xoA==
X-Received: by 2002:a05:6870:c188:b0:19f:5c37:abb9 with SMTP id
 h8-20020a056870c18800b0019f5c37abb9mr2495348oad.12.1689267167408; 
 Thu, 13 Jul 2023 09:52:47 -0700 (PDT)
Received: from x-wing.lan ([49.207.50.231]) by smtp.gmail.com with ESMTPSA id
 d3-20020a17090abf8300b002633fa95ac2sm12009150pjs.13.2023.07.13.09.52.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jul 2023 09:52:46 -0700 (PDT)
From: Amit Pundir <amit.pundir@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Caleb Connolly <caleb.connolly@linaro.org>,
 Bryan Donoghue <bryan.odonoghue@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Date: Thu, 13 Jul 2023 22:22:37 +0530
Message-Id: <20230713165238.2814849-1-amit.pundir@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Author: Amit Pundir <amit.pundir@linaro.org>
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v5 1/2] dt-bindings: display/msm: mdss-common:
 add memory-region property
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
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, dt <devicetree@vger.kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add and document the reserved memory region property in the
mdss-common schema.

For now (sdm845-db845c), it points to a framebuffer memory
region reserved by the bootloader for splash screen.

Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
---
v5: Moving the dt-binding to mdss-common schema with
    updated commit message and property description.

v4: Adding this new dt-binding patch, in qcom,sdm845-mdss
    schema, in the v4 of the follow-up patch for
    sdm845-db845c.
    https://lore.kernel.org/lkml/20230712130215.666924-2-amit.pundir@linaro.org/

 .../devicetree/bindings/display/msm/mdss-common.yaml         | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
index ccd7d6417523..84ed2757ded5 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
@@ -77,6 +77,12 @@ properties:
     items:
       - description: MDSS_CORE reset
 
+  memory-region:
+    maxItems: 1
+    description:
+      Phandle to a node describing a reserved framebuffer memory region.
+      For example, the splash memory region set up by the bootloader.
+
 required:
   - reg
   - reg-names
-- 
2.25.1

