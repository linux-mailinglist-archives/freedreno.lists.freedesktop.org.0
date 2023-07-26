Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DA5763784
	for <lists+freedreno@lfdr.de>; Wed, 26 Jul 2023 15:27:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A632310E47B;
	Wed, 26 Jul 2023 13:27:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C39110E47B
 for <freedreno@lists.freedesktop.org>; Wed, 26 Jul 2023 13:27:28 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-666e6ecb52dso4003514b3a.2
 for <freedreno@lists.freedesktop.org>; Wed, 26 Jul 2023 06:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690378047; x=1690982847;
 h=content-transfer-encoding:author:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8lxc77XWTDPTeWKbOVls7trvqC1maeRESKQ7JlGBAVk=;
 b=tzlf/K6lA2nbzCK73P1REKEDFjco9nWhyDMS8OpMrVB0n5mWFKtD++dNg2lByeu7m0
 d/zJYAKzFrMg3vWf5aU7sOnjhvN5QHBX0y7FQ9UYQgnKfr9xuvMsFHiYG2QDmHD7k+8q
 wvw/MD+Gf1t21AqrcccEsCI6otUTJ+XKxBvHL62rhWbUpKt55bqx0UCVcaZlogJ81HYp
 Tlhm31L8wPRXG3h53U/ofo4BB5wXwgYOqIGcj+szBaXFhZSG9s6mA/xAfsKweCycf+hG
 V4WdnEeL5ZPUsyVYERCtTl0/y3YymEbtIwL0xCguLZsY5qIrXdFrHUa1iF3dlgHOdJRZ
 vCwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690378047; x=1690982847;
 h=content-transfer-encoding:author:mime-version:message-id:date
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8lxc77XWTDPTeWKbOVls7trvqC1maeRESKQ7JlGBAVk=;
 b=gCkZsmp6BBEQwdGsAWEJxkyXx+LPrzL2saHnxytT/Gq+0eyWbSiabaEKHPNl7wQf2J
 i3IN6ol+akvU4AZEpqgVrBAcZN+KfrGpm1OtyeW8lwSsNwdiiQ1fRbqA169gDwJrX9/w
 5wF0UFODQIgAzFUhyEeeY6UZINXH6H5iJI1EzuI9XB4089vzszpABfrAEBmsEX9cK6yh
 keslquugkjHhZqkDHS+6YPoyq3tY7Qh2W6t4OZW/qCHUm820//5f2zWP3JSJZvpkA0O6
 wZ7G8rip6AglxGE1UW4DWPFa2u3j7lytd49JcgNY8WjAn3cPs3I9vfpQNLR27qpYi9sj
 lYHQ==
X-Gm-Message-State: ABy/qLZDacwbldRIKg2VyKgqM70xci2qBdyrVOmrhdkyFhWgp6mIgq0N
 FH7pUczFrEui/K8/4Rc3Yn59AQ==
X-Google-Smtp-Source: APBJJlEkGaXvYl0Z4D2WNxjIzaFmZ0xG0IQslvweGeXL3npbZc6MEWn92JA3fL7KJSzJy2bGF2OmTQ==
X-Received: by 2002:a05:6a00:2d09:b0:667:e17e:85c1 with SMTP id
 fa9-20020a056a002d0900b00667e17e85c1mr2058353pfb.1.1690378047425; 
 Wed, 26 Jul 2023 06:27:27 -0700 (PDT)
Received: from x-wing.lan ([49.207.50.231]) by smtp.gmail.com with ESMTPSA id
 x52-20020a056a000bf400b00682ba300cd1sm11485918pfu.29.2023.07.26.06.27.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 06:27:26 -0700 (PDT)
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
Date: Wed, 26 Jul 2023 18:57:18 +0530
Message-Id: <20230726132719.2117369-1-amit.pundir@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Author: Amit Pundir <amit.pundir@linaro.org>
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v6 1/2] dt-bindings: display/msm: mdss-common:
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
Cc: dt <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add and document the reserved memory region property in the
mdss-common schema.

For now (sdm845-db845c), it points to a framebuffer memory
region reserved by the bootloader for splash screen.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
---
v6: Re-sending with review and ack tags. Ideally this
    dt-binding patch should be marked for stable as well,
    like the follow-up sdm845-db845c.dts patch in the series
    but it can't be cherry picked cleanly on older LTS
    versions. I can do it separately if it is required.

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

