Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 356BF6520A8
	for <lists+freedreno@lfdr.de>; Tue, 20 Dec 2022 13:37:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33FF610E3BD;
	Tue, 20 Dec 2022 12:36:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CA0E10E37D
 for <freedreno@lists.freedesktop.org>; Tue, 20 Dec 2022 12:36:43 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id f18so11602410wrj.5
 for <freedreno@lists.freedesktop.org>; Tue, 20 Dec 2022 04:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rCgXMkElDYqgdV46E7QV9LorbFrf8YId9h6ETaNIJMc=;
 b=ysUM3TyM4x7/ARqi7orfI4/3OE5NUDF3GYwg3z8BZYyeScLXCW7HvWfj61HcBNKV8y
 kfbtPzTtWRKzsHpHA6TSzVarKiMWXOFDQmnfk42i+JZAY4ZUae2PGHuGcLFUNCFk+VB8
 DEFJRAFUunis3rSYASIMzCZj9jyPMYfNHklvmOQTf9+gOrECj+lZnCN68IPZq1HXhxPO
 T5JtsUgDBe19iFKpN3YzGNXvU4DoSvkV2kJ9/m+UZzf06490/Umz2xUE0eYJRfwyTlAr
 VJlfLkpbHpOVSGmg9HIERXNSfZ7iKDmWJH+vvGcO8XyG+n53D4d9ZsXVpsBb6dZx5Kjb
 Bw3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rCgXMkElDYqgdV46E7QV9LorbFrf8YId9h6ETaNIJMc=;
 b=40Jzz7I8/DEc89R4EfMrve6AnCYrt6q4nF0gNf/zeGbA6HDQLY/NkcKsS5sSTOyE3+
 PD7hXO3/HuwunG5hDL1PeyyRp4pTKFdt0rTaeW1F0/4vK5Bcs20+AvNSyvbj+ujoK0ZC
 8JY6UqGopfKtnaonKPHtqqff9zjdxF3EHnxi006F4xE+9XL5H48RlC2++NJ5xAmG/uZB
 WhkaVASgUKtoBiGDkCvK8llps8m7dbJcR36rknABBNfSX3D0eZV5IWLnWVupUxuMI9J2
 GOro4We73ifG8oiXkzzH4IoNT/gITl3Os0UdmwW9zo48MfEyPKewxH+KXFqgxB+MUVhM
 dggw==
X-Gm-Message-State: ANoB5pl+q8jGIl/sDc/40krClSlXDOYCSieI+RuMKxhGbyxqSC0YMvYs
 4FqczRCvw/kGU2b5jawjUWgYvQ==
X-Google-Smtp-Source: AA0mqf44yzSRLzxTnB39n8g/cioxs3y0QI8AP93lUwcNm8oeHjPRiXxBx0pLqpsT9KMKflaH68MMbA==
X-Received: by 2002:a5d:6045:0:b0:242:24a7:c7f2 with SMTP id
 j5-20020a5d6045000000b0024224a7c7f2mr26227823wrt.58.1671539800753; 
 Tue, 20 Dec 2022 04:36:40 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 da13-20020a056000408d00b00242257f2672sm12641208wrb.77.2022.12.20.04.36.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 04:36:40 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Date: Tue, 20 Dec 2022 12:36:16 +0000
Message-Id: <20221220123634.382970-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
References: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v5 03/21] dt-bindings: msm: dsi-controller-main:
 Fix description of core clock
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

There's a typo in describing the core clock as an 'escape' clock. The
accurate description is 'core'.

Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 8ba61fef576a5..6e2fd6e9fa7f0 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -32,7 +32,7 @@ properties:
       - description: Display byte clock
       - description: Display byte interface clock
       - description: Display pixel clock
-      - description: Display escape clock
+      - description: Display core clock
       - description: Display AHB clock
       - description: Display AXI clock
 
-- 
2.38.1

