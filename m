Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1785B58E5AD
	for <lists+freedreno@lfdr.de>; Wed, 10 Aug 2022 05:48:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8266BA6CA5;
	Wed, 10 Aug 2022 03:47:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 613B9E663E
 for <freedreno@lists.freedesktop.org>; Wed, 10 Aug 2022 03:47:38 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-10cf9f5b500so16437238fac.2
 for <freedreno@lists.freedesktop.org>; Tue, 09 Aug 2022 20:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=rxO1yJUE3IlkLApY46vIfgmzfPEQ54X/NIOEVG3JrrQ=;
 b=wZnC4appiqNUEiQGmLWSwEltHJUt+9QDq46haOzM+ed0GT2SVOeWxlwCGYGOAAr9Ly
 u4WzjVgE6vTJI3VlWMbdo8iq5hE8Tsu4wUoWaO3m0PoSJoQ1EfYGIdUbtZIY02vB4t29
 1z9Gs1IwzuzpKJ9jGqIXWKqCzFPLzu+wC1Nz+fdIAytGCkyyjWsQRZeBib7Ra95+sFac
 eyhw9vzbJmqEqy2hZ7XtmYSKxDvOcVlAVFs04yDetvqqnsX3YIJ1a63zAhb6/SzYah0F
 GexPGZ/Am0SsnZQ/OQTN/62QJgzI9BJ+KEtwl/pNKxM8cjzOY5pCXvVOOm3ExIjIhjL/
 FBpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=rxO1yJUE3IlkLApY46vIfgmzfPEQ54X/NIOEVG3JrrQ=;
 b=BBIZ1zqLiZWg8fCGEwiEDu8JuC2OPWcSx7cjDIheM0l5cD+7/aK+Vl4me3UMm92lgg
 aytL93+5Y+MXEWXiRXX9RGc3nB3xYhY2hgglswgWu70/Guw1mTIsCxN/uciUzrQ5L5aJ
 hw9Gv3djdLBzKAGoWsuCCf5S9cFgw6ByJF98kWxAo4eotiuDccCfsON2TaOL1sc94rLn
 BrgqMuIbYZP/ZJExyqROg27gzLH3SRxpsdP2VuKpH2R+BEm2AABcedbcUtnBpQtDbXN7
 NSo0ljYwUbdG8WoOneH08G6HKVEYYmagskp/l8yHUKZdYxKSWPn9J6IJkJ251BYMV6HG
 eIcA==
X-Gm-Message-State: ACgBeo3l82cc4jPmfCYXVEnWmsCElWwlSiE1RlUYB2a/MpLdj6UQtfpl
 gSbzkuRqM7Muwj/2zCzngsT9Qw==
X-Google-Smtp-Source: AA6agR5Fu2RRDv1UHVCEFfelP9y7yZj87HztXn4G3e065ctAs40MSp5H03fK49MziNwWhwN8ZkUhCg==
X-Received: by 2002:a05:6870:89a9:b0:101:d81d:e970 with SMTP id
 f41-20020a05687089a900b00101d81de970mr651827oaq.43.1660103257025; 
 Tue, 09 Aug 2022 20:47:37 -0700 (PDT)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186]) by smtp.gmail.com with ESMTPSA id
 n2-20020a4ae742000000b00444f26822e5sm454337oov.10.2022.08.09.20.47.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 20:47:36 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Date: Tue,  9 Aug 2022 20:50:07 -0700
Message-Id: <20220810035013.3582848-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220810035013.3582848-1-bjorn.andersson@linaro.org>
References: <20220810035013.3582848-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 1/7] dt-bindings: msm/dp: Add SDM845 and
 SC8280XP compatibles
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
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add compatibles for the DisplayPort and Embedded DisplayPort blocks in
Qualcomm SDM845 and SC8280XP platforms.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../devicetree/bindings/display/msm/dp-controller.yaml         | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 94bc6e1b6451..90f9302d1731 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -16,11 +16,14 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,sdm845-dp
       - qcom,sc7180-dp
       - qcom,sc7280-dp
       - qcom,sc7280-edp
       - qcom,sc8180x-dp
       - qcom,sc8180x-edp
+      - qcom,sc8280xp-dp
+      - qcom,sc8280xp-edp
       - qcom,sm8350-dp
 
   reg:
-- 
2.35.1

