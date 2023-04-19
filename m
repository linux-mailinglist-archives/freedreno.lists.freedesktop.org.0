Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E92286E7EAB
	for <lists+freedreno@lfdr.de>; Wed, 19 Apr 2023 17:43:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9960510EA12;
	Wed, 19 Apr 2023 15:43:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E678010EA12
 for <freedreno@lists.freedesktop.org>; Wed, 19 Apr 2023 15:43:44 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-54fa9da5e5bso5733767b3.1
 for <freedreno@lists.freedesktop.org>; Wed, 19 Apr 2023 08:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1681919024; x=1684511024;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gdVYdFPfBBo8zv5rhcgIZDi80sTIvGTHelZ6pJuyM5o=;
 b=hiI4VdvnL3PFVHlXbvuU3MirW7hmtTSKCSifv6/tA/Wu9TqFuqbsUWGo2CfnRa2jCG
 YsdgeF/2/5bK0+urq7pZPws/hECmcmWem5aiBrBGbnJb39r/2ng/Fd0nXSzkMyt/E780
 eAfj1tbYwXGF/8+VDAUQ5UY6uWYqKb6B+w5Rw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681919024; x=1684511024;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gdVYdFPfBBo8zv5rhcgIZDi80sTIvGTHelZ6pJuyM5o=;
 b=JttwgLvKKH63WVpJSH1GQ6TBxySBtKdNprN064SuZ3fDuDX0tWMsi+TzLTZGk6OkRy
 +Dy/1ItTiv3Ve7Yjbrq16dA5YcBHhTNtgem7DNx9oyvBwgha16KvwrrISDEDfa1I4ODV
 V2jEG/Xa7uxtR/bf9eVQERMrSrd6qDQlRcO+aZf3deBcmIWPzQrbranobsT/mhK2/zPh
 VqLKE2RsvpJiGmHn3kGMRIlEj/4dHWubh68DfIiPxSzA+A6fyPUMCOSoqF6TrSTd8eAU
 +NZTvpd7aR6ySmD5maxQWo6myLNvFry03vpe1lvKwHh/PCIoIQwrbeu5tGTkY6fP31Ec
 97mg==
X-Gm-Message-State: AAQBX9f9/tDU1BnStPo20TKQcCVNI8ApDV4K2ttIBZgfu3+Lftam6C3M
 lJ6R65UYSBWvcQVnj9kqEQ5I6A==
X-Google-Smtp-Source: AKy350Yhot6vEGQhwAe3FaNHIQDcgd53NATliU7BUd+8u/eJtUcx2Czr9RZf1IC7XpZuH4SPzSgTrw==
X-Received: by 2002:a81:c310:0:b0:52e:cd73:f927 with SMTP id
 r16-20020a81c310000000b0052ecd73f927mr3889338ywk.48.1681919024575; 
 Wed, 19 Apr 2023 08:43:44 -0700 (PDT)
Received: from localhost ([2620:0:1035:15:55c6:7cf1:a68:79b0])
 by smtp.gmail.com with UTF8SMTPSA id
 f69-20020a81a848000000b00545a08184c9sm4533026ywh.89.2023.04.19.08.43.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Apr 2023 08:43:44 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
X-Google-Original-From: Mark Yacoub <markyacoub@google.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Date: Wed, 19 Apr 2023 11:43:18 -0400
Message-ID: <20230419154321.1993419-9-markyacoub@google.com>
X-Mailer: git-send-email 2.40.0.634.g4ca3ef3211-goog
In-Reply-To: <20230419154321.1993419-1-markyacoub@google.com>
References: <20230419154321.1993419-1-markyacoub@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v10 08/10] dt-bindings: msm/dp: Add bindings for
 HDCP registers
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
Cc: Rob Herring <robh@kernel.org>, suraj.kandpal@intel.com,
 devicetree@vger.kernel.org, Mark Yacoub <markyacoub@chromium.org>,
 intel-gfx@lists.freedesktop.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 seanpaul@chromium.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

Add the bindings for the MSM DisplayPort HDCP registers
which are required to write the HDCP key into the display controller as
well as the registers to enable HDCP authentication/key
exchange/encryption.

Cc: Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Signed-off-by: Mark Yacoub <markyacoub@chromium.org>

---
Changes in v2:
-Drop register range names (Stephen)
-Fix yaml errors (Rob)
Changes in v3:
-Add new compatible string for dp-hdcp
-Add descriptions to reg
-Add minItems/maxItems to reg
-Make reg depend on the new hdcp compatible string
Changes in v4:
-Rebase on Bjorn's multi-dp patchset
Changes in v4.5:
-Remove maxItems from reg (Rob)
-Remove leading zeros in example (Rob)
Changes in v5:
-None
Changes in v6:
-Rebased: modify minItems instead of adding it as new line.
Changes in v7:
-Revert the change to minItems
-Added the maxItems to Reg

 .../devicetree/bindings/display/msm/dp-controller.yaml     | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 0e8d8df686dc9..4763a2ff12fb7 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -34,6 +34,8 @@ properties:
       - description: link register block
       - description: p0 register block
       - description: p1 register block
+      - description: (Optional) Registers for HDCP device key injection
+      - description: (Optional) Registers for HDCP TrustZone interaction
 
   interrupts:
     maxItems: 1
@@ -159,6 +161,7 @@ allOf:
         aux-bus: false
         reg:
           minItems: 5
+          maxItems: 7
       required:
         - "#sound-dai-cells"
 
@@ -176,7 +179,9 @@ examples:
               <0xae90200 0x200>,
               <0xae90400 0xc00>,
               <0xae91000 0x400>,
-              <0xae91400 0x400>;
+              <0xae91400 0x400>,
+              <0xaed1000 0x174>,
+              <0xaee1000 0x2c>;
         interrupt-parent = <&mdss>;
         interrupts = <12>;
         clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
-- 
2.40.0.634.g4ca3ef3211-goog

