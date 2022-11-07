Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D896620435
	for <lists+freedreno@lfdr.de>; Tue,  8 Nov 2022 00:57:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5DC910E403;
	Mon,  7 Nov 2022 23:57:20 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6319710E3DC
 for <freedreno@lists.freedesktop.org>; Mon,  7 Nov 2022 23:57:03 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 p13-20020a05600c468d00b003cf8859ed1bso8106798wmo.1
 for <freedreno@lists.freedesktop.org>; Mon, 07 Nov 2022 15:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gmRVXehGl7BjVeULyOgQDE3jzh0cHlXlniJb8HTQ51k=;
 b=b9oxJUNpC76hFseEBEJhcEq0HY8cJBySOrChqrDYugbyPtlpk+wLm6oq1kfH05gF6J
 d/R+goe9J1Zko2jsaYSD9fogNuZepgTLKm6sD+mjPwKefVv3S9PLVMNUBHzDAW7ZLUkc
 GF+8r0ug21/ffp0ijykY5l1qguDPv+Dw3ebR78F5nGX6z1UNC92e6QbEK5IOXR1d4EPN
 jtp4HA/RJ463sgCzYa2k667E8EvzZjVrMF2YBzbAY5wF5pK1IOQS38dlHUt85TciJJQb
 5ionRofZELysr4Mfq6x+De1yoCfXfKQMmSGQ06i/muFRmNxS4zKOuUPam3rFzvu69X9A
 /YJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gmRVXehGl7BjVeULyOgQDE3jzh0cHlXlniJb8HTQ51k=;
 b=O/fItFDT6JctGnNTjHaY0oge2h9O86xIHTWcO1obtsZljGAxZi86gBVdiSlEDF64Km
 RIvYwat6jLRKPbTd9dBSWDv6AthK5IlDMYmeW43s3JbrATsQwZrmC+cgGK2dQ/7OnYwJ
 Q0WO1imPWBoD8jN0DWf2oxLMQKV4R4UPBbKdFWbSIujx9sJdZFih0f3ag43+Hsd5ChvJ
 8SPySq2uICCBFE8TZEaJYQ6FGZcjEHN1bDHeDjFh6tfibjI5S2ftWQITLVZQqPdB2/Dm
 5lX4Hv2pGL+E9QvlESHgV6hvC8kWdioFm+OTpvyT9sXTNOskA8KvqQUm2gZUBjsr2d4u
 rleA==
X-Gm-Message-State: ANoB5pnK6Q/SsyS/pLaUU8k1xTe9iIGyAwzFtCNg7kVuVVd7rZh29bF+
 /mJgtFUrq2hqubc2e0R8RhR9IA==
X-Google-Smtp-Source: AA0mqf4HO3FJtOGQ+2GOf7xGG6RzopIwB5XDIIFs67J5E0Or1hcP24cv6MjDbyT9V6+Is5ZVcJRz5w==
X-Received: by 2002:a1c:4c14:0:b0:3cf:add8:3fe5 with SMTP id
 z20-20020a1c4c14000000b003cfadd83fe5mr4501746wmf.55.1667865423015; 
 Mon, 07 Nov 2022 15:57:03 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 b18-20020a056000055200b00236545edc91sm8386161wrf.76.2022.11.07.15.57.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 15:57:02 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, krzysztof.kozlowski+dt@linaro.org,
 robh+dt@kernel.org, quic_mkrishn@quicinc.com, linux-arm-msm@vger.kernel.org
Date: Mon,  7 Nov 2022 23:56:42 +0000
Message-Id: <20221107235654.1769462-7-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107235654.1769462-1-bryan.odonoghue@linaro.org>
References: <20221107235654.1769462-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 06/18] dt-bindings: msm: dsi-controller-main:
 Alphanumerically sort compatible enum
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
Cc: Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Sort the order of the compatible strings alphanumerically.

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
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index a607ccd4a905a..b35130a77b43e 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -15,8 +15,8 @@ allOf:
 properties:
   compatible:
     enum:
-      - qcom,mdss-dsi-ctrl
       - qcom,dsi-ctrl-6g-qcm2290
+      - qcom,mdss-dsi-ctrl
 
   reg:
     maxItems: 1
-- 
2.38.1

