Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF8A636F1F
	for <lists+freedreno@lfdr.de>; Thu, 24 Nov 2022 01:48:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2322A10E66C;
	Thu, 24 Nov 2022 00:48:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E594010E66B
 for <freedreno@lists.freedesktop.org>; Thu, 24 Nov 2022 00:48:08 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id z4so258884wrr.3
 for <freedreno@lists.freedesktop.org>; Wed, 23 Nov 2022 16:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2cozmslkV1HJ5ORZW/fLPcfuOLJG0p6+yjVrLX810OU=;
 b=NCtYnaGXUXEow8dtZclqy6wSoHW85K/gfhLzqpZpmDmMdQoo/248yXtDpGkc6ehSnZ
 sMn8ivZedEl4QV1vWgjHsTIbzTlPrfYIFG8C8xPyLCp1O5t9J2846hsPEK2CO0zYeJ5z
 RGIcs3pUXwpyxo+cXWRDAtXMgWvotmj5veWReeqN0e2awrDi3TrHa9dGq2DkOte0QHt4
 G/x6xwBW2Qc/kv6S3KF3PJ1OQeCRqryE3uchHFNTWFoeKwrtmKK4bzXsSR897nA6OaEj
 ruIhzRbUAEg4/ddzeOzGO7U3aaRMEBCmbondyqFXb9zOBvEe2BrX1Fmd5G4DXCdL3TmQ
 WJjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2cozmslkV1HJ5ORZW/fLPcfuOLJG0p6+yjVrLX810OU=;
 b=lmkAPkIRramWeBRMa1tOMyDWUXRCNuIh65H75G6PBQuurWSYKYlHMrIk8j0WL4uYq1
 7+ym4Ph1VyUySVndZfR1hSe1/CqlObUs4/KbO4wfIGH91lIlQtk46eYrucw8Zlivcjdr
 xak5oSnMo+HBfbMGmJ5KfT8+UBFz2xOYN5wZHP3IQ1eo67hUEQxzqJHkVgkmI2F+OhO2
 o+FJxVfkd9N5MI+kJ4RfkGIY0zep16nDltOHRPectgmAk2+wpMwjXTXkoo0Qt9n7RoOi
 CQvv1DvSW1Muqmp5WDrJuackoZwla5ehntW7fxi52ySHEWf6TbB0CqWvBzv+JJIO8E4C
 yeMA==
X-Gm-Message-State: ANoB5pmEP4eKPJ9/KyBIp1fiwqypJmVcUCsiewCjE6qavmGXVfuHA9dg
 lPa35Eztl9KjZofORWyhXuCwoQ==
X-Google-Smtp-Source: AA0mqf7gWy9dLJkORYXwUKApzl58c0COI+hNsY1/jGFqtioTMSjLfmaAqNohwv6mu9l4g5RAZKCYNA==
X-Received: by 2002:a5d:5965:0:b0:236:7148:4b98 with SMTP id
 e37-20020a5d5965000000b0023671484b98mr18152044wri.229.1669250887071; 
 Wed, 23 Nov 2022 16:48:07 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 n38-20020a05600c3ba600b003c6bbe910fdsm5245076wms.9.2022.11.23.16.48.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 16:48:06 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Date: Thu, 24 Nov 2022 00:47:45 +0000
Message-Id: <20221124004801.361232-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
References: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 02/18] dt-bindings: msm: dsi-controller-main:
 Fix power-domain constraint
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

power-domain is required for the sc7180 dispcc GDSC but not every qcom SoC
has a similar dependency for example the aqp8064.

Most Qcom SoC's using mdss-dsi-ctrl seem to have the ability to
power-collapse the MDP without collapsing DSI.

For example the qcom vendor kernel commit for apq8084, msm8226, msm8916,
msm8974.

https://review.carbonrom.org/plugins/gitiles/CarbonROM/android_kernel_oneplus_msm8994/+/7b5c011a770daa2811778937ed646237a28a8694

"ARM: dts: msm: add mdss gdsc supply to dsi controller device

 It is possible for the DSI controller to be active when MDP is
 power collapsed. DSI controller needs to have it's own vote for
 mdss gdsc to ensure that gdsc remains on in such cases."

This however doesn't appear to be the case for the apq8064 so we shouldn't
be marking power-domain as required in yaml checks.

Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml     | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 27ebfd5ffb22f..cf782c5f5bdb0 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -134,7 +134,6 @@ required:
   - phys
   - assigned-clocks
   - assigned-clock-parents
-  - power-domains
   - ports
 
 additionalProperties: false
-- 
2.38.1

