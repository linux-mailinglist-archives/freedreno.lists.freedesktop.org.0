Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA96525872
	for <lists+freedreno@lfdr.de>; Fri, 13 May 2022 01:37:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 267AF10EDF5;
	Thu, 12 May 2022 23:36:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EA7010ED26
 for <freedreno@lists.freedesktop.org>; Thu, 12 May 2022 23:36:54 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id c24so2230900lfv.11
 for <freedreno@lists.freedesktop.org>; Thu, 12 May 2022 16:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mfq8artsCmgPridHwXtCTWz4VD26jC/9nXCO2mqCNlk=;
 b=iXwW7J9u+H2HItGvauEDzCNnvKPaZBXXt3QnjD7RMi3ta+74h4j2BR19KiAwVqTNI8
 boCEE0PazFQzGUotk83wRsifDapmV+z9q9EO/NTLoxDQsyeqolNo+t1sQ7wqpewL4D8v
 z9CWx2xT27bxW4bBLf+LVCX893TmhrxPa4lk5dcr7AXjdiTK9RajYXKRkNy/GuJZusZI
 Zfu2JDBhV83WKxFJ233Cf+DebKxzaSy7yKtSkrMNF55jca5XjHiD7+Xzgx3coUfmgl51
 6Dw1UyOU7uwSzXks9YdCey5rB9tvef4qWZxOQ0+rL2OLBy1EJG7bvrXaZjX5wXrcEyrw
 ycCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Mfq8artsCmgPridHwXtCTWz4VD26jC/9nXCO2mqCNlk=;
 b=RY05dLhaDTcJalbr3vPOsrdAyp70YnQ+p0xtnZCgpCo0E9IWSgl8uL9FibqbTr2nWd
 yZDMyinBmvfqgH9Pn72F473ZUWUNsFYsa0WKgB9ms/0spusbqhox3Gat44xrlIyKU0Ex
 sJneRvcRsEh1g7fAqqXp10d/MrUlIuDfnOFDimLzC+TgQtQEz7ekLCubpH3C6ufCBb4o
 6bNOaFVTRIOgdy1Goyl9gSLN3EGDo1YpRqflwFmk+EWcomHLyqlSb8gLAfsENDjN24DA
 z/PQ3+GnWq7z9QbDVuy+XOWA2bBRhloVji/sGwzRU5rUayuv07WivOcxFMHmu+jQSx2w
 4U0g==
X-Gm-Message-State: AOAM530YImmXoVRLTlqBVjh9c/9+pjKSKLaRpr/XhcmUbRfjOL4+RZxx
 6gzwMm7rABKacbl42MndkHCFYg==
X-Google-Smtp-Source: ABdhPJyHwvFyLPj76dHqxn/lAe13fO2rG+/lMa9ckPzT4sqPlUWeknSc1GduqjhN2jAiACWtz8IBTw==
X-Received: by 2002:a05:6512:2820:b0:474:35c:e74f with SMTP id
 cf32-20020a056512282000b00474035ce74fmr1426134lfb.661.1652398614085; 
 Thu, 12 May 2022 16:36:54 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 p13-20020a19f00d000000b0047255d211c1sm127937lfc.240.2022.05.12.16.36.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 16:36:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Fri, 13 May 2022 02:36:47 +0300
Message-Id: <20220512233647.2672813-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220512233647.2672813-1-dmitry.baryshkov@linaro.org>
References: <20220512233647.2672813-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 8/8] dt-bindings: arm: qcom: document sda660
 SoC and ifc6560 board
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add binding documentation for the Inforce IFC6560 board which uses
Snapdragon SDA660.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 129cdd246223..ac4ee0f874ea 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -41,6 +41,7 @@ description: |
         sa8155p
         sc7180
         sc7280
+        sda660
         sdm630
         sdm632
         sdm660
@@ -225,6 +226,11 @@ properties:
               - google,senor
           - const: qcom,sc7280
 
+      - items:
+          - enum:
+              - inforce,ifc6560
+          - const: qcom,sda660
+
       - items:
           - enum:
               - fairphone,fp3
-- 
2.35.1

