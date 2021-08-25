Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B943F7F15
	for <lists+freedreno@lfdr.de>; Thu, 26 Aug 2021 01:41:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D38D6E442;
	Wed, 25 Aug 2021 23:41:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80C656E43D
 for <freedreno@lists.freedesktop.org>; Wed, 25 Aug 2021 23:41:25 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id n27so2165935oij.0
 for <freedreno@lists.freedesktop.org>; Wed, 25 Aug 2021 16:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4Qbn6rk6sj87tSTKdnnYPYuRTniKiqOezdw+dFrRZCg=;
 b=Vm4G3uftCW/T6dCqbkA7vokLZMlA9pX5RbXLwF33YGHY9/epjZ2UZRq5k7X3sXH2RQ
 4+j+0+P2XLOlMPSqqzjNNRFMB/sIERKlX72b+Eeou62AjSWYpl4HwXsgkShSu/ocFCP0
 +fTSaHJTwWznLYOaQMKHxMmyAQobljjla/3hbvDh73lP2ApfNpf5ph3Ie/ucWtBwQ2S0
 NbkVeJQAvKsCUMKHe1xLa8liMwqfwWgkzF68oUGavZjOxTIfdwFnnqEC1VggZpcwu56V
 1feLQBw5xIKHNORbnU9/8AMfk3UdSZUHrO+707Wz1k9Vp00gj+Wf+qCj312VNn0EXzzh
 BmZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4Qbn6rk6sj87tSTKdnnYPYuRTniKiqOezdw+dFrRZCg=;
 b=QvGBetgKUs51vcH/O98ylcrgwqkFwXXgK1fSXeXbOq2OCEarTI3ocoCtqoihqBFRbM
 jE81JwCgwceQNBvJKpqMeVXygzbh7gJ7Vpdo9pEidkVCoPlWmFunma0oEn0Hko9TViCt
 EjFM/+oH7CSxr5i9XNfy6jwZB6i0PJQaBjUx/HgQuwJoPX8ehxtTIgX8C8jKm6eodNAj
 +EpzgkOYcOa9zJDHwy9pX9iG8wPC9Yso8kFdDVRzduupx8FBU4cA4vRhrZFxWhyoNJA0
 6+Ol5R+gUdqxItrLYdiUiqQQSgh1kSAQ46Fhv1jJe4rUXzRmkpidoFfiQQTtM9BkpZEE
 Rj6g==
X-Gm-Message-State: AOAM532OECuj6CIGmm3LxSnlemnxM+aMzbol+zGSTnMb4GkCUk6BShdf
 APfodmX+wlEbwxMU3KGe7h6J4Q==
X-Google-Smtp-Source: ABdhPJyFkHXrqo/1gbNpklgbgydgMUEHj+c+RHwxsH9rWtBe4qTlWfvRrH5wOgrgwP5OTelW+GQ8rw==
X-Received: by 2002:a05:6808:2ca:: with SMTP id
 a10mr427499oid.44.1629934884855; 
 Wed, 25 Aug 2021 16:41:24 -0700 (PDT)
Received: from localhost.localdomain
 (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id g10sm267136oof.37.2021.08.25.16.41.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 16:41:24 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Wed, 25 Aug 2021 16:42:32 -0700
Message-Id: <20210825234233.1721068-5-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210825234233.1721068-1-bjorn.andersson@linaro.org>
References: <20210825234233.1721068-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 4/5] dt-bindings: msm/dp: Add SC8180x
 compatibles
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The Qualcomm SC8180x has 2 DP controllers and 1 eDP controller, add
compatibles for these to the msm/dp binding.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Picked up Stephen's R-b

 .../devicetree/bindings/display/msm/dp-controller.yaml          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index f915dc080cbc..b36d74c1da7c 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -17,6 +17,8 @@ properties:
   compatible:
     enum:
       - qcom,sc7180-dp
+      - qcom,sc8180x-dp
+      - qcom,sc8180x-edp
 
   reg:
     items:
-- 
2.29.2

