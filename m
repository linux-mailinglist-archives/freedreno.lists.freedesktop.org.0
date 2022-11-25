Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA816389ED
	for <lists+freedreno@lfdr.de>; Fri, 25 Nov 2022 13:36:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C31910E74B;
	Fri, 25 Nov 2022 12:36:49 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C26B10E090
 for <freedreno@lists.freedesktop.org>; Fri, 25 Nov 2022 12:36:44 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id s5so6595184wru.1
 for <freedreno@lists.freedesktop.org>; Fri, 25 Nov 2022 04:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5tCUJCjq8zxDkfeJPGjWwU1cc4Wk9DUerQHc4fqret8=;
 b=mhGv7Zh50AqBp4rTjI6gQn8/oYD9g+VcmKIghEJwnYzPc8vCDBjQZKvtaUDVIjqLX5
 R9deKVTuburdMVz17AK/v6u1w2EUrC85RO3a7Uz7oinTWavxmd6iA/uFuif0JIOzoLPa
 PiMVh+xqwziiZp/fXWMNIW+Oh+iyaJUfU+O/smtrjX35IhMXT4mWFV14IkJArbostmtq
 acfOv+egEQbfS21quRTXM0LRJQAcI1cH4+b5A92v0pW6XcxpN+s9XJK63Zimkc0bkwmU
 ulfVEY9Z+CZP1qYdmo73uevMZPqaSQcCN67Re00fwzsv0b+r6EcB96Hcz8j1k3I9B6hC
 HXwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5tCUJCjq8zxDkfeJPGjWwU1cc4Wk9DUerQHc4fqret8=;
 b=W6MugJt+uJzoc71sklH41PmMe5ZcIegs4TIpFvEoFpSgFwG9/PRCR7Z70XqP7L9jYQ
 H4+fkWwaC/ONBr/J15O0fZuEnchOpu8jIJbucn83F3U/ZM7DweGus8HlWONMVrwj2U/0
 15E48WbhVgh3NLHtRy+aSvHJB5PcdCQniQT7O9ImzrvA5d4V9wGendotHMV5zbsacqEu
 hN51nV/UJ7BYnD4y3O9Sx7HjKGckYtXFdmHtNbytgMSLdAKBfUC/2foRng/xb4Jx5nFG
 tYaZ86Ae8ZTQD58pU8a0jHvaKP3CS95cDjgV3P5y9Zu1gyw7bo+zK1R5g8iXp/7DekPA
 2Xrw==
X-Gm-Message-State: ANoB5pkWuT7NMCzwWf2AqMETRwGssig6U3gyMNEbVgafLYadF/PDdRb4
 JPzJq8/GtEIJ8VuK8mrXg8HyHQ==
X-Google-Smtp-Source: AA0mqf6C8x1hhFqswQgErlQ5HjU+dSvgd7kzHs6f2ND4DDbvxFokbXV3w9I6dNogJHUi73OLfatGxA==
X-Received: by 2002:a5d:5233:0:b0:241:cc24:b65c with SMTP id
 i19-20020a5d5233000000b00241cc24b65cmr16659995wra.545.1669379802289; 
 Fri, 25 Nov 2022 04:36:42 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 k15-20020a5d6d4f000000b002366dd0e030sm3574111wri.68.2022.11.25.04.36.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 04:36:41 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Date: Fri, 25 Nov 2022 12:36:21 +0000
Message-Id: <20221125123638.823261-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
References: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 01/18] dt-bindings: msm: dsi-controller-main:
 Fix operating-points-v2 constraint
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robdclark@gmail.com,
 robh+dt@kernel.org, agross@kernel.org, daniel@ffwll.ch,
 dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org, swboyd@chromium.org,
 airlied@gmail.com, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The existing msm8916.dtsi does not depend on nor require operating points.

Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml     | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 7782bff89afc7..27ebfd5ffb22f 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -135,7 +135,6 @@ required:
   - assigned-clocks
   - assigned-clock-parents
   - power-domains
-  - operating-points-v2
   - ports
 
 additionalProperties: false
-- 
2.38.1

