Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CED9E6389F7
	for <lists+freedreno@lfdr.de>; Fri, 25 Nov 2022 13:36:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E1B810E750;
	Fri, 25 Nov 2022 12:36:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95E6A10E090
 for <freedreno@lists.freedesktop.org>; Fri, 25 Nov 2022 12:36:45 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id bs21so6569783wrb.4
 for <freedreno@lists.freedesktop.org>; Fri, 25 Nov 2022 04:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2cozmslkV1HJ5ORZW/fLPcfuOLJG0p6+yjVrLX810OU=;
 b=gSrbme5axxsrUfHnJ9DqOnGjycqxrvH4JWeFUpEagKcA9Y9wG8ZVhVWb+j5c6NH3yB
 2Lj+kWBs7GuExgaBQtEwSVOdKFnww8VbwbGUO9bhMpNGL/cGmdc/32NToDKa/ek5gAts
 6nzwlj6PJzXAg+tT0H0J48wy4OyWooMjq1TY85zJteBL2QjV76TYfN5qiBMZoauF+lJ0
 VwhojtM5eqNF6u8hcVeIkFHwaAyudnmRvq5rCj0MGN9iJ4PKgBW3TiamUH2Kywh5s315
 Vfcn+0ihaZS99RgPcahniK9lKLLV9UTUkNKfRCD49CMODa/aEPy8FTPUCvFBFw75o1/G
 uXnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2cozmslkV1HJ5ORZW/fLPcfuOLJG0p6+yjVrLX810OU=;
 b=A/y3efulyfCK+hbMJyf7xxEcDr6GqGDmE2wahePTG/CNgZktuXNabpVkpoSq1BMkbO
 d0iCUckm8c3zFrpgiVYuUCsyhmY2PdumxCQgR+eBgmI0ZikMR6DsB0Y1vcfuZ8mZRf/I
 NxWpZHrKvoNsO3uUXP3jBUvrlgPnfADJ9KlikwQMMzP0EM4D4HWPo3yEwrEeK9YKc8o6
 HXiFZu9O8u96Q9WH53U0sczp0hThIAywPQmxwgg/y+33tlS/zTXXYT3axoo1oBwFKNs1
 bQU7C18gDwW6QoffKCe7oWZ2lAatA/r0ZBCfcowunY+ISevt01jETnfZI3TyYC17RvEO
 wKew==
X-Gm-Message-State: ANoB5pk/TMlgL3wDdHUmvjsP+ZdMWX+esRIiKWD0vbcxqFW605VqRC+O
 ozrDa+0bUGhwGrnNyq+/Na0zgw==
X-Google-Smtp-Source: AA0mqf6uPUyO7QCv468CYtFMBJdaaFEuo54w5kbk/FXdWI6X0qARaBXuLmS/8Kie9UtoOGkY8h36ug==
X-Received: by 2002:a5d:4b8c:0:b0:241:e1c6:7e0a with SMTP id
 b12-20020a5d4b8c000000b00241e1c67e0amr10626814wrt.463.1669379803818; 
 Fri, 25 Nov 2022 04:36:43 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 k15-20020a5d6d4f000000b002366dd0e030sm3574111wri.68.2022.11.25.04.36.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 04:36:43 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Date: Fri, 25 Nov 2022 12:36:22 +0000
Message-Id: <20221125123638.823261-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
References: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 02/18] dt-bindings: msm: dsi-controller-main:
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

