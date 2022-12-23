Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58517654ADA
	for <lists+freedreno@lfdr.de>; Fri, 23 Dec 2022 03:11:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29A0310E5F8;
	Fri, 23 Dec 2022 02:10:49 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B164710E1A0
 for <freedreno@lists.freedesktop.org>; Fri, 23 Dec 2022 02:10:32 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id h7so3387632wrs.6
 for <freedreno@lists.freedesktop.org>; Thu, 22 Dec 2022 18:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u+Ok/Y8Pr2ds0xVbkzxTKyFSBfTt/36m9CaPlTa4hTI=;
 b=MrhN4Xb9RiUuzbzu5slyO/DpcQyG5glXnDF/6fqL9FJZMT/5dc2CHnWYXtss5wwPn2
 ckcR8BQ/3elmwT5pBC3a4mf3/Adv99wKrgjZ9dEPMbJoc8bVMj7leoXXLPTtaldcvV3Q
 07dMJ4wwtxmyipd+bHdalaiHQahJM+JPV/dAz7lMU1OQp3Ne9y5wfMMtjlps0w6YqIUj
 z3ZR8mJsgvYejDkdD7B0wNV7uYQbZ+4qHAqTRMWUWAadb8kdcTmrPVKr6Gyennx5r4VT
 cSZYiLEhwi3T2GlyUNEYuS/0vtyn/v19F0TB+RBqGQDyUikwtsQPDwEdzVY4RyFCOms2
 xUwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u+Ok/Y8Pr2ds0xVbkzxTKyFSBfTt/36m9CaPlTa4hTI=;
 b=4/iq2jeXv0jjcw8G7QZw/RPxo3pZNR2C1KXKmGDe/X59VeudS+utLOKPHMdSa/3FyK
 aI3uy0ThOHKS1jUsY1djI/6q9+qXs9OW4uwiNuCPpXOIhidgc9S/3Upqp/aZXsO7W8Hd
 r4SddH/cgq9690Eyumvm07N61aVDmW63OPGb/z6HL3UhLZpM/jDqjk2VjjryOiNDeZtg
 qwuxaDKNSAXPvwXtoc/6EG3ZOo3OwybfK7vmjTrjtVwQg3pt2BSUayC8/eBaMmvUBJ9Q
 7oAei1U7GCgH92LvfQ8NY9CN7Amv238lCKhBEAuzKBhL677LIZfOITl0vNstEvesB6jS
 30Ng==
X-Gm-Message-State: AFqh2kqGkU01DaMebjbCupWmlCO3LAI8RkEuGhMj3KJ5HXtzH335xm+P
 D8nWGWB9GhvZ2RRs43a0MpsyjQ==
X-Google-Smtp-Source: AMrXdXuu2FQx7IxvbWNkPzFPFbP1DApQ4G+dhRhfQmOT0QbUCc2Q1fzyKDnhG2hNUyqkCCJ6/z7dag==
X-Received: by 2002:a5d:4d8c:0:b0:241:fb7d:2f15 with SMTP id
 b12-20020a5d4d8c000000b00241fb7d2f15mr4047043wru.29.1671761430916; 
 Thu, 22 Dec 2022 18:10:30 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 j11-20020a5d452b000000b0022cc0a2cbecsm1849725wra.15.2022.12.22.18.10.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Dec 2022 18:10:30 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Date: Fri, 23 Dec 2022 02:10:09 +0000
Message-Id: <20221223021025.1646636-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221223021025.1646636-1-bryan.odonoghue@linaro.org>
References: <20221223021025.1646636-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v6 02/18] dt-bindings: msm: dsi-controller-main:
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
has a similar dependency for example the apq8064.

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
index 55bfe1101d6f4..8ba61fef576a5 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -137,7 +137,6 @@ required:
   - phys
   - assigned-clocks
   - assigned-clock-parents
-  - power-domains
   - ports
 
 additionalProperties: false
-- 
2.38.1

