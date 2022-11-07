Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C49E4620410
	for <lists+freedreno@lfdr.de>; Tue,  8 Nov 2022 00:57:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C53710E1F2;
	Mon,  7 Nov 2022 23:57:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 558FC10E320
 for <freedreno@lists.freedesktop.org>; Mon,  7 Nov 2022 23:56:59 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id v1so18482765wrt.11
 for <freedreno@lists.freedesktop.org>; Mon, 07 Nov 2022 15:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pgeozmPZqS6JXtBUtzz0XCzNbXeI8NLd/9teAZZ3ZoU=;
 b=Kr118oU3tWMRM9OSMDTcbOgWvtcP8ZX+qbTofQqOopNwYkeh3XrjPqa6V6VvNQvFvT
 buMppsTMAE9msYo92KDfPVh4w5Q5AkJkHxjoo21UDk4HoO7m0d+X3pqvW+c9s27zN6ji
 eAigHkl7x8GNbTxMKA3UOLEG7iPFPB5grRdVTKEncCeZQ4X7dPzTrZgrBEm0vuImwSdf
 GynTlyZRoiHPwRx0Z62w3A3uNl1VwtLVYX2fPCBpcT5fsD8hh1uopYrAGpCFro0X4IpW
 qvF8BiG7AS+gO99UC3oUTN0mzWxrLTASTXcJ5NIw9J/z7pW88w5/W7GxGgtLNFgJgOGz
 AwPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pgeozmPZqS6JXtBUtzz0XCzNbXeI8NLd/9teAZZ3ZoU=;
 b=mwam76r0ELpdDRIGxmLYV5FBE53v4DW8p1n9nzjqJvVrKQMlQ2ybM9a3EtZf4OV2/g
 OxhMRKx03EZqBNPBBTstg8kZlT6XYCxai3W/Byj5MlS9KGlsgKTgtrOwAx+ND8XvX2cm
 EKOVm0bUPE/ys6bTs8k7Tte4f8R8oroSPNvBGPjIYqRKdFWScNptB7+rNQDzc78gCx2e
 aj7mhOzmW+y/Xvj2M4+Uw4WeAVUWAXB5NvTxmEy8sIDjkaa9MkpTc9rK1R4CHcOuO5OX
 OesfSNmpe2vs/8WklvCMgNKkK+o7X0V4GL7cXLSwxLEZ4wERXAvb1xmkvpPYcVQhfk6o
 hDbA==
X-Gm-Message-State: ACrzQf2/24HcaRPhyFnYs1YMnpuLjzU7i7IgCf/4ZK54S5JQkQAiymVo
 cGYdVlj4fsFbz9eI7xPEn4fGVA==
X-Google-Smtp-Source: AMsMyM6a2iAeeRzZq19eqEqkJIwF+xt4p4o6N4GE+PRqYk+U2IE/mi3aZrpaVlpQnpPKNsKNm05xHQ==
X-Received: by 2002:adf:e44f:0:b0:236:59a3:c5a8 with SMTP id
 t15-20020adfe44f000000b0023659a3c5a8mr34097585wrm.396.1667865417559; 
 Mon, 07 Nov 2022 15:56:57 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 b18-20020a056000055200b00236545edc91sm8386161wrf.76.2022.11.07.15.56.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 15:56:57 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, krzysztof.kozlowski+dt@linaro.org,
 robh+dt@kernel.org, quic_mkrishn@quicinc.com, linux-arm-msm@vger.kernel.org
Date: Mon,  7 Nov 2022 23:56:37 +0000
Message-Id: <20221107235654.1769462-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107235654.1769462-1-bryan.odonoghue@linaro.org>
References: <20221107235654.1769462-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 01/18] dt-bindings: msm: dsi-controller-main:
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
Cc: freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The existing msm8916.dtsi does not depend on nor require operating points.

Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
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

