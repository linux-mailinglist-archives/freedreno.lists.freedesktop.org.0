Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD06056AD81
	for <lists+freedreno@lfdr.de>; Thu,  7 Jul 2022 23:32:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C01D11B017;
	Thu,  7 Jul 2022 21:32:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62BB311AFC1
 for <freedreno@lists.freedesktop.org>; Thu,  7 Jul 2022 21:32:09 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id m16so1956229ljh.10
 for <freedreno@lists.freedesktop.org>; Thu, 07 Jul 2022 14:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f332h430XPLujzbnB28D655qOD0xftQe2GUMxOaYHEE=;
 b=vD8jwtSVMM/mdnUH1BdycUkk5hOIjujpy8d5BecrgwAj+8TPU9rVVtHkMAmkRTxhxx
 0KqlOsuqqhWUYhkoKxhkwbJg6L5YA9nF93IvRKRiPaBzGdrNxs/H+OJuum727PQl97NK
 AvhzA+f2+8ZoihCqKTDRs7undVxbsfEpLgXgCDIyGaT3qEhUvjflrF6A1aU9C30FSrJ7
 z8agQE8yY7LObd9J9ssWbFVI71FsDzXGd970M6i0kRrNCRAROna+fpvo0aJWSFiC7cm2
 OP/qeHqs1oCd9eWUGkemU0fcd0BCGQkf+mci2HFZz8jmFDfHAVfdlCNj7LVYQRaUkJCw
 XeUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f332h430XPLujzbnB28D655qOD0xftQe2GUMxOaYHEE=;
 b=fZFDqwrybmdMKYXSsCkXBEn5+gyf+S9tuUT8q+te7vNf/YEca+Klblk8KioZZfFj2B
 5EJph5FhvybqXp91RobaEoUzjwxSYkYmNIouiIoEgCg7fxtXlUAwS+XKKisMc2ZY8UKq
 ARJN1bd8R4k/n8nzQQ6ww4U7w3dXD0wO43Ki1/tXCcR7t0ZEcJ78nDpH81QfHpCFUQTv
 3jZXbweAWukJv8xdJj8Il/s71zH4gC+m6BiacMeyW4GGuWNjEjuAcC975l4ZYOEPG61U
 dD/E2fKVudqXJ3PCMTozPNUiQgiLaJirjywvsswMsWAs3RZjtPDUaV1HzIR7u1B9jd4Z
 K0/w==
X-Gm-Message-State: AJIora+js4YV5mGXNV+Jyj4SE8ER1k1nMGPcSjD2m9xUiUDyzs5PBIXl
 NXRlWDKqaJ3z9yim8GA8idULNQ==
X-Google-Smtp-Source: AGRyM1tPOhQoRZlBs5GK3iTsOL1N01Bqd8BlBXjJFeIqnAoL/BBF8qFhZsLjhmLbeD8bH2pdElo8mw==
X-Received: by 2002:a2e:3015:0:b0:25d:51a1:25ea with SMTP id
 w21-20020a2e3015000000b0025d51a125eamr24534ljw.320.1657229527614; 
 Thu, 07 Jul 2022 14:32:07 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 o19-20020ac24e93000000b0047f8cb94004sm7046709lfr.35.2022.07.07.14.32.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 14:32:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Fri,  8 Jul 2022 00:31:57 +0300
Message-Id: <20220707213204.2605816-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
References: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 2/9] dt-bindings: msm/dp: bring back support for
 legacy DP reg property
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

The commit 687825c402f1 ("dt-bindings: msm/dp: Change reg definition")
changed reg property to list separate register blocks, which broke
validation of DT files using single register block. Restore
compatibility with older (single register block) DT files by declaring
it as a deprecated alternative.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dp-controller.yaml        | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index d6bbe58ef9e8..dde82d5f6610 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -24,11 +24,15 @@ properties:
       - qcom,sm8350-dp
 
   reg:
-    items:
-      - description: ahb register block
-      - description: aux register block
-      - description: link register block
-      - description: p0 register block
+    oneOf:
+      - items:
+          - description: ahb register block
+          - description: aux register block
+          - description: link register block
+          - description: p0 register block
+      - items:
+          - description: DP register block
+            deprecated: true
 
   interrupts:
     maxItems: 1
-- 
2.35.1

