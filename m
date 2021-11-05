Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E638445E5E
	for <lists+freedreno@lfdr.de>; Fri,  5 Nov 2021 04:05:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 947BF6E7E6;
	Fri,  5 Nov 2021 03:05:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CCA56E5D4
 for <freedreno@lists.freedesktop.org>; Fri,  5 Nov 2021 03:05:37 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id bq14so7685474qkb.1
 for <freedreno@lists.freedesktop.org>; Thu, 04 Nov 2021 20:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fZeAoRaneXhhVmezN+qUzGu+KZMu777A5OLUtPhYX7Q=;
 b=TTN411gYGHkdkJEnoXv3HHeDrn4/Sh7cuo1/f4djeXUF0MbV0TQRlt5xXt6mg5u45I
 9nu5UHGjoho96iE2zePTM6WOVDDJDlmuE2qxCbUyRdzlXfFfqCyGbSdAvS18xTb/FJwU
 SFaIlmtVniR106Q1kFEHxdpqbnKfGcq7dJxfm0L6lfZJkEYfdFz5YGw8a0l2fIuFpiPM
 f0YpGxmST5HFZkyh+Ue9YG0WnwVUW7vZYSxJuXZEVA7XeSLtQGIPQK0iHxPRpBxfCkOQ
 tWwY58l5o38XSbjlnqmjA8pnIJePR9Gltxi8mZ+PbamJCb0p+5OmxXURY+J9nZXZu3ym
 vFJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fZeAoRaneXhhVmezN+qUzGu+KZMu777A5OLUtPhYX7Q=;
 b=g5RkahZI5NpDq9lRMkKtYJIA6iJVoRFTfMH2ko3n/meh5GNIw3KMIj5V3H2ax0HytQ
 hxLeV4pp1g1m28ePILzl1plRUys4UUm6uX0BcdMoOsRhbo66zEmldkp/WO8I3iwEOS9q
 K1RDW0F5lZxz5wtUSavmdHaPxhBXVL9DITUS6UkWvGhkL9gb+nzT0CgM1ZY/AvGEGxou
 4VWsIzPgoZkJsvsmNxIwkxPGM6gYyOd+11JxLxlZpKfGc2XogfNMq5st59SwYLhwQaoG
 vVMN5lu+D+PTAhBoqmj4Iaf+MC0eNHVD9ML0a9S8gJ69cW+EUd2GtTgNO3Y7M0HDfLWo
 viFw==
X-Gm-Message-State: AOAM5307wqxgjvh6pof3MFH7QhwGxmq1xP+/dHASY9k19ee82S4cp5nh
 X8MBjXXrzgK+1nJxTGEUuydsRg==
X-Google-Smtp-Source: ABdhPJyyzcNXoiq2HSJ+ib0DKPgEoUlfPpeHrr1NviCipx7CpPGcswMzYObcOQCBY0FZYF7jb3XdCQ==
X-Received: by 2002:a05:620a:414e:: with SMTP id
 k14mr44984285qko.400.1636081536205; 
 Thu, 04 Nov 2021 20:05:36 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id h66sm4710807qkc.5.2021.11.04.20.05.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 20:05:35 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Date: Thu,  4 Nov 2021 23:04:29 -0400
Message-Id: <20211105030434.2828845-13-sean@poorly.run>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211105030434.2828845-1-sean@poorly.run>
References: <20211105030434.2828845-1-sean@poorly.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 12/14] dt-bindings: msm/dp: Add bindings for
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
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 jani.nikula@intel.com, linux-arm-msm@vger.kernel.org, abhinavk@codeaurora.org,
 swboyd@chromium.org, Kuogee Hsieh <khsieh@codeaurora.org>,
 David Airlie <airlied@linux.ie>, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, bjorn.andersson@linaro.org,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

This patch adds the bindings for the MSM DisplayPort HDCP registers
which are required to write the HDCP key into the display controller as
well as the registers to enable HDCP authentication/key
exchange/encryption.

We'll use a new compatible string for this since the fields are optional.

Cc: Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-13-sean@poorly.run #v1
Link: https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-13-sean@poorly.run #v2
Link: https://patchwork.freedesktop.org/patch/msgid/20211001151145.55916-13-sean@poorly.run #v3

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
---
 .../devicetree/bindings/display/msm/dp-controller.yaml    | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index b36d74c1da7c..f6e4b102373a 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -21,12 +21,16 @@ properties:
       - qcom,sc8180x-edp
 
   reg:
+    minItems: 5
+    maxItems: 7
     items:
       - description: ahb register block
       - description: aux register block
       - description: link register block
       - description: p0 register block
       - description: p1 register block
+      - description: (Optional) Registers for HDCP device key injection
+      - description: (Optional) Registers for HDCP TrustZone interaction
 
   interrupts:
     maxItems: 1
@@ -111,7 +115,9 @@ examples:
               <0xae90200 0x200>,
               <0xae90400 0xc00>,
               <0xae91000 0x400>,
-              <0xae91400 0x400>;
+              <0xae91400 0x400>,
+              <0x0aed1000 0x174>,
+              <0x0aee1000 0x2c>;
         interrupt-parent = <&mdss>;
         interrupts = <12>;
         clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
-- 
Sean Paul, Software Engineer, Google / Chromium OS

