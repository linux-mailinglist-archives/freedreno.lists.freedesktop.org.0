Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 811786196E4
	for <lists+freedreno@lfdr.de>; Fri,  4 Nov 2022 14:03:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D7A910E75C;
	Fri,  4 Nov 2022 13:03:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A23D10E750
 for <freedreno@lists.freedesktop.org>; Fri,  4 Nov 2022 13:03:32 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id b9so6257498ljr.5
 for <freedreno@lists.freedesktop.org>; Fri, 04 Nov 2022 06:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Eq+xrGXQkafyNxdD3bUOX4BO/00RbY/2YQOJ/yUkbp4=;
 b=ZiAuXKe8Rzc52FzKCj1P6vLEukBXj5jyCz/b9mAAKh0BTHoyVAsE+eG77G3IjCP6/C
 uf5M8d0DbcHOsA8nEm1G2+rgbkWmIwDYuDAfu8h2Bcto/uzfK+Uou1wzUnDNsixsxBRn
 zGD1wzXUAfFppM5FiNoHnaVAi8tOAkcqHIkXJGMXLdzkn/EPaiDgXuU2zmQvENqU4dU+
 dfzfVKvm8xgI7llaTDks/rkeLArgt6bW/08+cfLFElXOe+oUMT7LkSB0SljNstEE8tLX
 v78biHFO4I2Q2LHBGwL2INNvRKIq763Cue0ATSMVKue4NusiX+lE4BV1A2yPQ9zlzx3U
 PM0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Eq+xrGXQkafyNxdD3bUOX4BO/00RbY/2YQOJ/yUkbp4=;
 b=bSWue8Vp5/pg1wDCMCVphjdH3DyqdR14CDUwYBKPUNCn7VWN2ZLa49gWZeUFjeD4aT
 Iz7tgnaKNn6vurM79gW9sflMQfx5FonEQyfuUOpFwijA+aeYsD83TAbS5T7+Z54Zx3fd
 V57WHGEF7oeFpLEGEw83CHTdk/q7NCGiCJEGnkKHSgI0tYGb+emzq7/UqlN5xrZLrkzX
 hpgyTc8YBNQ01R1dtAB0zdtPrnbQYgJ9L942j3V1NarZ3x3C4JiS96TI5BTOzILQy3Xe
 Vej3PMM4CvxXXcXvHqcFSZyUqqL9tf8Q8MnJlhfHmCv7wtKyi28OxExUtT9oSULvrFoS
 3+4A==
X-Gm-Message-State: ACrzQf3S/ceDJFb0UfNOwEU1YhMpcN0zZXKIrPtSrsC4FnVe86xo6Tsb
 4BzjVfCZkgBaPHwrZJsdZuje0w==
X-Google-Smtp-Source: AMsMyM5hN5nl5fyFXYAKV2CP6o7qjJSaNcDR/PFkXWZ8jUMBTE5L6jIxU05R9fdSkfnwDLw9Rst+xg==
X-Received: by 2002:a2e:88d3:0:b0:275:ae74:c5ed with SMTP id
 a19-20020a2e88d3000000b00275ae74c5edmr1901801ljk.13.1667567010388; 
 Fri, 04 Nov 2022 06:03:30 -0700 (PDT)
Received: from localhost.localdomain ([195.165.23.90])
 by smtp.gmail.com with ESMTPSA id
 s6-20020a2eb626000000b0026fe0a052c5sm419975ljn.129.2022.11.04.06.03.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 06:03:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Fri,  4 Nov 2022 16:03:18 +0300
Message-Id: <20221104130324.1024242-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221104130324.1024242-1-dmitry.baryshkov@linaro.org>
References: <20221104130324.1024242-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 2/8] dt-bindings: display/msm: add sm8350 and
 sm8450 DSI PHYs
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

SM8350 and SM8450 platforms use the same driver and same bindings as the
existing 7nm DSI PHYs. Add corresponding compatibility strings.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index c851770bbdf2..bffd161fedfd 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -15,6 +15,8 @@ allOf:
 properties:
   compatible:
     enum:
+      - qcom,dsi-phy-5nm-8350
+      - qcom,dsi-phy-5nm-8450
       - qcom,dsi-phy-7nm
       - qcom,dsi-phy-7nm-8150
       - qcom,sc7280-dsi-phy-7nm
-- 
2.35.1

