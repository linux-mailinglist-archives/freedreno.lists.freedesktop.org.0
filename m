Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2256711D7
	for <lists+freedreno@lfdr.de>; Wed, 18 Jan 2023 04:24:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A59E10E65C;
	Wed, 18 Jan 2023 03:24:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 402EF10E658
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jan 2023 03:24:37 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id 18so47851616edw.7
 for <freedreno@lists.freedesktop.org>; Tue, 17 Jan 2023 19:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ec+3vW1T9VybCypq+CSoRlgfeIlNrQ3oQZEGbJKYIC4=;
 b=zAHvllqq6rUVY5iYfOhH98ZC7MciV6bFnK+rqLYh4bRRJQXU97ZrWMQxORJMwyznPi
 BB35MM6SMhAXFT/BohQWOmDJyX6Wh0biF3vMkgekxW/oC/EdJP0EKlCsM0FJvBnqIUvr
 c8eVa3Ox4/7XWmuo3r8A63TuqKO8a+dApNkNlcfPDlMTtJsAwMLsGiarsiF2XfyqW4rZ
 03znCWUFoih1cXMC1gYe9Eefmg2C5HEgcZQbRj1aiExFMRMblTkfDQqYcZHOERuX4gAs
 7eKGdESU8FVWwxNLdsTWmOvS/XjtJDAQ382auxASuIWO33gyE7nCmlLPuVPceRAm544D
 p8vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ec+3vW1T9VybCypq+CSoRlgfeIlNrQ3oQZEGbJKYIC4=;
 b=EVGJig3mryuRSeelx21BIfmM4VH+8ZiLSfHu5iQnBmqqbZ8MNHnjZXEt+EHaE8fnKC
 3NP4TLVKO4wmNaz8m3L7rmLR0RnGo7J4jt2h79PJDC+y5cOTyL43yS4Zmix8wgKVh314
 DPtgZkC4laROerFOFOF/JWSadTG+qg+atDqLzObVL4gvTHi9bQkqrdkZt8ECfwMIQLbz
 hZdLq6XtvAM5ZQWBVBo5C3fYfmK+jyf9oGM5UZ8fjnOZW6Awr8e8Fq58Rhptxez/2AEo
 Sch0XNjhSXAcYKhGVJwHziXlKiunE/262WGN8INu4tK+uYnlFv5QD9WRFIEp2rjpKyGi
 C10Q==
X-Gm-Message-State: AFqh2kqgnF+CUWnSLraCEPg/oJG52/b8tt5aN8DS7Zkev3EwhVyM0xaP
 HJrX+frV4nO4Q7CCCX2yORCS6Q==
X-Google-Smtp-Source: AMrXdXu5gi5ru//W/fWSwPRe4S1umaY4zHYGJpQmH9GsUo17e2O3IClFpdFWvpSftRfWxpfcmdKzuQ==
X-Received: by 2002:a05:6402:2289:b0:498:f82c:7068 with SMTP id
 cw9-20020a056402228900b00498f82c7068mr4439994edb.35.1674012275649; 
 Tue, 17 Jan 2023 19:24:35 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 f11-20020a056402194b00b0048eb0886b00sm4713829edz.42.2023.01.17.19.24.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 19:24:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Wed, 18 Jan 2023 05:24:29 +0200
Message-Id: <20230118032432.1716616-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118032432.1716616-1-dmitry.baryshkov@linaro.org>
References: <20230118032432.1716616-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 1/4] dt-bindings: display/msm:
 dsi-controller-main: remove #address/#size-cells
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Stop mentioning #address-cells/#size-cells which are defined in
display/dsi-controller.yaml. Use unevaluatedProperties instead of
additionalProperties to allow skipping properties defined in other
schema files.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dsi-controller-main.yaml           | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 7c326f8927fc..b07bdddc1570 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -72,10 +72,6 @@ properties:
     deprecated: true
     const: dsi
 
-  "#address-cells": true
-
-  "#size-cells": true
-
   syscon-sfpb:
     description: A phandle to mmss_sfpb syscon node (only for DSIv2).
     $ref: "/schemas/types.yaml#/definitions/phandle"
@@ -357,7 +353,7 @@ allOf:
             - const: iface
             - const: bus
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.39.0

