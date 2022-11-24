Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA9C636F21
	for <lists+freedreno@lfdr.de>; Thu, 24 Nov 2022 01:48:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9F9F10E66F;
	Thu, 24 Nov 2022 00:48:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2A6A10E66E
 for <freedreno@lists.freedesktop.org>; Thu, 24 Nov 2022 00:48:13 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 o7-20020a05600c510700b003cffc0b3374so202630wms.0
 for <freedreno@lists.freedesktop.org>; Wed, 23 Nov 2022 16:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tY9zIcCRGEu7zo0/qER9MM7m6z693FsbNLfr6+dvuHk=;
 b=HioKk5uWFil0Wena7oP7RdN+LDvb0Fz4Cr8QBLcParrvhSNKE4aP3CD5Cr2E8W5GsP
 /JBhSfjTQLHz93Ti5CeJytS8yS6J9dHiozFEtkZou9sEOm4Nb8tvC8EFEFaClK7nmsRO
 oSJXj2MHtlJDqUWeibWa02dCTVKGEtRco7qxY2loBi9IFWdAy/i8570iGgLtXqUO5aWw
 VRV99cZNi4fRi3zfhv0EMeItbYCeVeTf9gnZel4hsM0xhaM1gMiNT7AGaMEXIdiD7KyI
 FhllxQ5N/+3TZVLiUznkmblAYM5T2nWemUti7w3sP5ryRD7m7t79Y89Ds7/3BZzv7U9h
 gyIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tY9zIcCRGEu7zo0/qER9MM7m6z693FsbNLfr6+dvuHk=;
 b=gmY2SKPcG+zPTM1B77gHHOxYRNIP+0NyAEt+eINTmqk83kd5egsYSXRUjBXAJ7MU+D
 A7mHjrmXcEFBvIfrv2gsWyxhOydSPJsKdw6kRMmoaTox1WmXOrEJlVTkYxT6qiNrBILZ
 1gqtOiC9BDx3w5kP45/A8JK7Ws2aUKN1b5GxSn9wBEYfo+8M+wVtg2T5FtDdrITROfWw
 AY4IP7EfC4jzUvxzVfmteDHp4gk72UMeXzJLnNv29R/5lqRiCCgaBLIm5kPjW03xzRlv
 Bin13pQBrfqBPtdvSRt4Le6qlpMa1n5cn/2vw01xE4pkdQ4Kte3mvXBu/qHsvdQgldK0
 DrdA==
X-Gm-Message-State: ANoB5plIVdkY6hU6Sq42OPAcV2p/bAyXKmnGXKezV4SqIiHXqUaasbMs
 voJTw+B2bA4CBXw/SzU/GAfBOw==
X-Google-Smtp-Source: AA0mqf7g4djkFPxv22hQv3S9vFbRPNPg6xb2eSD1P08WLUS7G5q4KIZhgyvhyz/SXAZRY2dgSh6cRA==
X-Received: by 2002:a7b:c3d5:0:b0:3d0:306c:f7a3 with SMTP id
 t21-20020a7bc3d5000000b003d0306cf7a3mr4849498wmj.128.1669250892155; 
 Wed, 23 Nov 2022 16:48:12 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 n38-20020a05600c3ba600b003c6bbe910fdsm5245076wms.9.2022.11.23.16.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 16:48:11 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Date: Thu, 24 Nov 2022 00:47:49 +0000
Message-Id: <20221124004801.361232-7-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
References: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 06/18] dt-bindings: msm: dsi-controller-main:
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
index 88aac7d33555c..0c09b9230b7f5 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -40,7 +40,7 @@ properties:
       - description: Display byte clock
       - description: Display byte interface clock
       - description: Display pixel clock
-      - description: Display escape clock
+      - description: Display core clock
       - description: Display AHB clock
       - description: Display AXI clock
 
-- 
2.38.1

