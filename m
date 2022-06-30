Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7607561EFD
	for <lists+freedreno@lfdr.de>; Thu, 30 Jun 2022 17:17:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6AA310F5E1;
	Thu, 30 Jun 2022 15:17:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DE4311A2BA
 for <freedreno@lists.freedesktop.org>; Thu, 30 Jun 2022 12:08:53 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id v9so11398944wrp.7
 for <freedreno@lists.freedesktop.org>; Thu, 30 Jun 2022 05:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qw+FrcK8UL5qu8ONac/uqXSaLs1ISOMfbcLfGwuhXDE=;
 b=dZ4HRsYHTwt8haiFE3hGMawaqkoZU0n2a/IY+4Dmx89wDrrt7nP7KDIL4r6uGM9cuh
 sMEq7Tfc7a0iV0aJuz+6KIfBdRnkdni+bvpWA65weJj6/cwSy+smead6Gmi0opV8AN6e
 IUprbZAmIoqAP18YpDWpZovQWRkdFy5Z1bcX+OZPbrMNpjf3mtg7lSY+khiiYQoK0wT7
 5jt+Xdzo7KE1a//RW6cd6q4pcit38/G6JVXHgEfDEJIAyB8u1QTHgx0veDqw5wvbYdy/
 qt0L2KkT9YIWNL1DRbEM0j0BMONiU9rd+jzGkJ3me6KdUhb9lrGVwHVzMCqiRl2iT/+R
 M7Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qw+FrcK8UL5qu8ONac/uqXSaLs1ISOMfbcLfGwuhXDE=;
 b=H0r67vnGVJ0k+QNOfaR5l86ee8Xu2RlEoZRyy72ZRlYqiZ/xt3p82Si/cpcd7VTrki
 HqC5otjkkTgjBySSaRu43TO06CBwceJRhTlPraCQTyUAqG7u8UC44fk3srmEitXbSzwk
 8ZDW+v79CBpAYpAj3Qcr0XcPwdsGVzQmZoSojZqKymYaq8ilc3yX5lMDzebONr8tW1fA
 zzs5/Tu/misGeIAKxAZEASM00fZcR+lowD8rkbi1854RK+gHB3IuKVTlb2QNzKdM3dTY
 /zhtismm7qR0Ii6GvkxkVEhK3Ady9dO0fWpnXteaaTbszedRQuEapErQmVbZdQzRHQIn
 9B2w==
X-Gm-Message-State: AJIora8uVX4/aKd5OFJMGQzZIBaKiJItWlc2Jc77JMUXhZLr+IKiwnj2
 W2c2ClOHtl0wIhbeLM44pBgwZNGO9wyJ2A==
X-Google-Smtp-Source: AGRyM1vw/qWPMCqZcAMlORKxceCBDPBznemmed3RSo+O4t9zNeHUWYv2GFQMWw3MrhWnPp2h/OzJog==
X-Received: by 2002:a05:6000:1705:b0:21b:bcff:39d3 with SMTP id
 n5-20020a056000170500b0021bbcff39d3mr8141430wrc.502.1656590931841; 
 Thu, 30 Jun 2022 05:08:51 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 m1-20020a7bcb81000000b003a05621dc53sm6286532wmi.29.2022.06.30.05.08.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 05:08:51 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Date: Thu, 30 Jun 2022 13:08:41 +0100
Message-Id: <20220630120845.3356144-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
References: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 30 Jun 2022 15:17:39 +0000
Subject: [Freedreno] [PATCH 3/7] dt-bindings: msm: dsi: Fix power-domains
 constraint
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 quic_mkrishn@quicinc.com, bryan.odonoghue@linaro.org, swboyd@chromium.org,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The existing msm8916.dtsi does not depend on nor require power-domains.
Drop from the list of required.

Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml     | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 101adec8d9152..91324f0828448 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -136,7 +136,6 @@ required:
   - phy-names
   - assigned-clocks
   - assigned-clock-parents
-  - power-domains
   - ports
 
 additionalProperties: false
-- 
2.36.1

