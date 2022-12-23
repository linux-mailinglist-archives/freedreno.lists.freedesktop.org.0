Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A760F654ACD
	for <lists+freedreno@lfdr.de>; Fri, 23 Dec 2022 03:11:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD0CB10E5A1;
	Fri, 23 Dec 2022 02:10:35 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78F5210E19E
 for <freedreno@lists.freedesktop.org>; Fri, 23 Dec 2022 02:10:31 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id bx10so3427493wrb.0
 for <freedreno@lists.freedesktop.org>; Thu, 22 Dec 2022 18:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2Hu/pgFNNxfeH2Gjp98s64ccughmNvrwi5MiArHpcHo=;
 b=yGfe4DQ3KTq24nSAmHQc46jlKLMrFw+CZHP76fuhN/IebnDh20dINzhgLujYqKVX+Y
 dXgJ2eP1ZKXLeOM6QoxMhqcpwOgoEejsvHf9d2BghPVYx62uqO2xtM2ky4/bLGMMHWXt
 rI9xvCXv3MSDG5h0FyJl5qV4R6BUPJB63A7kN86CDGbvDqJB7sP5y9Bz8s3zHfDTx4Wh
 1rmntAJPoc2qG9vCfGqtnQ75Srt6XE8pzFV9AbvBfcJd2ReH0qUsjsoYvGUOe4nPAWcl
 8YFRd04buMiGVmi+MF7lA0m064vhPo+nshLgB18tEfW9vYMl/lO5oUnGdPE1Ti3BXwM3
 nvog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2Hu/pgFNNxfeH2Gjp98s64ccughmNvrwi5MiArHpcHo=;
 b=nqwk64ZJCeJWJRKgF/OEQX0O73QOdX3MJrAX1onQ8OytZCU6kXsh2cGSds0+H+hf7w
 jRHsIk2lvCYP63RkEdDlib1vAtT/1jv7wW1b85PnKnqxA3KjewGljpXChQNocgI0FS91
 mLAi7+z3Mq5rqrcNzOHCrDQC2Q+vHHxSvJZh06VE1f4lsz5yUI0NCYuC4LHhuzx1/cOR
 3tTBKcHXPNwBdUbRoY7/IvIo83jSfu7V2XviOIQ7zKxNhAX1lXoeP6hM+KrP6MrpCh5p
 uyjhy84VPpcO4MpT/nMPBMGu3S9u+yx0OKjkMNPAlNU6BxQYsYjjmwHYFkX7Kc/fIi54
 buUg==
X-Gm-Message-State: AFqh2kqD1uG5+G69fVlFavLBA996VO1vUv7+4Yynr2JsUJ84JTvtPXl0
 mN9oO3lCmKGAHhXHlWQ4m868Xw==
X-Google-Smtp-Source: AMrXdXsqclnk5dTKs8dX2sprcRns0P/6Ejt8NwsXpgOv6nEraTPK8YW8miSgwRDhRTOx+hRIEHHMcQ==
X-Received: by 2002:a05:6000:1373:b0:242:30b3:3ca7 with SMTP id
 q19-20020a056000137300b0024230b33ca7mr4544772wrz.11.1671761429741; 
 Thu, 22 Dec 2022 18:10:29 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 j11-20020a5d452b000000b0022cc0a2cbecsm1849725wra.15.2022.12.22.18.10.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Dec 2022 18:10:29 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Date: Fri, 23 Dec 2022 02:10:08 +0000
Message-Id: <20221223021025.1646636-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221223021025.1646636-1-bryan.odonoghue@linaro.org>
References: <20221223021025.1646636-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v6 01/18] dt-bindings: msm: dsi-controller-main:
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
index f2c143730a551..55bfe1101d6f4 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -138,7 +138,6 @@ required:
   - assigned-clocks
   - assigned-clock-parents
   - power-domains
-  - operating-points-v2
   - ports
 
 additionalProperties: false
-- 
2.38.1

