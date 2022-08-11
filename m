Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3421E58F950
	for <lists+freedreno@lfdr.de>; Thu, 11 Aug 2022 10:43:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB08299D96;
	Thu, 11 Aug 2022 08:43:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12AA114BD0C
 for <freedreno@lists.freedesktop.org>; Thu, 11 Aug 2022 08:43:39 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id l10so14024791lje.7
 for <freedreno@lists.freedesktop.org>; Thu, 11 Aug 2022 01:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=a9nNC1LpPgmSaOq2Jgcv7OLsPptIfkOff9uOK+ycWKE=;
 b=VJ3AuQgaqf9uHo7NnGq3Rid7Vgv9UmSHkkSBfkrU5R4KrqByFBqybWU5w15AWD7b4n
 MPyRYA6W5jDHbxlXlfhHlRYppve/t9yXxdNKr7RvJXf65ERcqdUIisf/AOj990y83mXc
 QAQrEW15Yg9SALIAHRYkCgfFctydpHx+GV9ZT6LSg8tgOKKoApCDU5kBNatFPb7vkKpv
 DlY/KLbWf/D0vFrQ+cJx5bLYWKvGvbt4cVG9aGM1ajKgaLznu1OR5PfM8fUDqof1O0dN
 Usq0X2g8RstvBsoxa65eHiiwhW3R7zhGwCZGOxLab7q0yiTl4sQ3diCrqN+QYaeslGNa
 OneA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=a9nNC1LpPgmSaOq2Jgcv7OLsPptIfkOff9uOK+ycWKE=;
 b=PKuDhTAlRPwpe6jNJrgH4up0iDJGDmgn6fiT/J5o2EKusMnf/v8UfsCUs0s35XNNbE
 koO/noo7tI9G0DmULf1MNzva6PwDhA01ZIZZ/iTUnCPUu7ruewBKJ6XbmSGl12Xz6SYK
 Ahpca3Ri6No835lWh+z2AJr3qRbuSexV7ycCcjOaBL40YVJxfqBbqwflR2Y/swBGw6/z
 nzQVSKDUV6M3ylJNdrpTvL307odUpejt3r9avlcPVfjASs1eS6prDLvaLUXy6YAgtGyx
 F1loeBgtj4qNdmi5sham6BgSqJfPhCIqUMOfDqU9d5XBWCEipJVF3xPTAjoaxhNdNxQP
 sYWg==
X-Gm-Message-State: ACgBeo1AsUe6XUZ6DDV8dv39H7amRiuNwzq9KReHE0vRbcoK3RgIihPC
 MbgnJPTdmgazd99HHdoutiwlrQ==
X-Google-Smtp-Source: AA6agR4NT7/YiwXnvOxR2aLvOqwVc4BC5XRg/ZXIjWHstlkcPFHS42ISonqpalevSrp0uvqvOo2Gtg==
X-Received: by 2002:a05:651c:905:b0:25e:67a8:4dd0 with SMTP id
 e5-20020a05651c090500b0025e67a84dd0mr10884404ljq.232.1660207417413; 
 Thu, 11 Aug 2022 01:43:37 -0700 (PDT)
Received: from localhost.localdomain ([83.146.140.105])
 by smtp.gmail.com with ESMTPSA id
 f4-20020a056512360400b0048af379957asm631077lfs.72.2022.08.11.01.43.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 01:43:36 -0700 (PDT)
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
Date: Thu, 11 Aug 2022 11:43:27 +0300
Message-Id: <20220811084331.83715-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220811084331.83715-1-krzysztof.kozlowski@linaro.org>
References: <20220811084331.83715-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 1/5] dt-bindings: display/msm: dpu-msm8998: add
 missing DPU opp-table
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

Fixes: 6e986a8f1cf1 ("dt-bindings: display: msm: Add binding for msm8998 dpu")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml b/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
index 2df64afb76e6..7ed438bc7dce 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
@@ -62,6 +62,7 @@ patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
     description: Node containing the properties of DPU.
+    additionalProperties: false
 
     properties:
       compatible:
@@ -105,6 +106,8 @@ patternProperties:
         maxItems: 1
 
       operating-points-v2: true
+      opp-table: true
+
       ports:
         $ref: /schemas/graph.yaml#/properties/ports
         description: |
-- 
2.34.1

