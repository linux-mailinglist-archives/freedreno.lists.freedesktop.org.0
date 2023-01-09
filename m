Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46480661E1F
	for <lists+freedreno@lfdr.de>; Mon,  9 Jan 2023 06:02:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C57D10E274;
	Mon,  9 Jan 2023 05:02:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C94810E26F
 for <freedreno@lists.freedesktop.org>; Mon,  9 Jan 2023 05:01:57 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id d30so6332219lfv.8
 for <freedreno@lists.freedesktop.org>; Sun, 08 Jan 2023 21:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bSLHFGtlV6IdhXFw/KT1ECmlzZ16Rq0TtNZKL66C2M4=;
 b=xu304eW80PXRPkwguL8tScz3jsXndREwKC8psSrXxGZp+cutvmxwetF7DqxsI0UMNh
 moaNEiX0dLhgMypkx0gDSkC90Oygtbqr2Whab/b2t10gQ/l7HDgjweuPdHdBaZeHSZo7
 vCiDKVsPD4IdMKQUG3HWlZOXNDAyeTmwyiZiad08g0737IIXC2LvqYd5d994oKolOSHj
 hB65XHqepjP1WuDIMvnbOSGwYntbS3JpRC3MQW/Z9ehr68/rwZl52v33HeYD1KOdRwif
 qPCirjbLjIpBvV0y9GuXRFhwohxDbmrvyesY+081abV5NCfEgFBRUTqVva1tpes9SNbW
 7H2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bSLHFGtlV6IdhXFw/KT1ECmlzZ16Rq0TtNZKL66C2M4=;
 b=nVNQFt4zuJV1W2H+DjVsC+L5zanmjpit4Mmyi55d2P5/fo0SYVshj87X6hoXTylgga
 5p3qw0S/yLq5l66OLrcNv5qs+8OThSEaqNpd+5KWWKIDYOIoYk6NKZGfn+TfCTlgYAin
 Pc631A3DZ/vAy0/N/pEGv/7kS77aWyPRLdFZo0L8yWCNYR1aDpGyemRAwitw7kdiJgo2
 UVSeFNHZgw7Mkqy7aWVi0BQFWpBYUHV7QbAInhEFMbb6tOGYkfcheX4z6ZiuU6jmM/4k
 SkM1FGiNVUAMVTuCMuecPZub5XNz413HGc/oVjAsi/kdM9ecLk962NA5a4HBFoftzKml
 vvBw==
X-Gm-Message-State: AFqh2kpxYJutXZw3gaWzbHui0dh2KYF6weEhXiHTse4M7C6Gzx98SpvO
 De98TFmM6z/I2uMDNIxJIuUj2g==
X-Google-Smtp-Source: AMrXdXuhLyLawiMO9nZM6mutd0P/iAqsp5Hx51Bc83l0y0c5bKKO9s50ZUq5+oKjiufUtrpNGN/j3A==
X-Received: by 2002:ac2:4ec4:0:b0:4b5:2c5d:4573 with SMTP id
 p4-20020ac24ec4000000b004b52c5d4573mr16207946lfr.45.1673240515463; 
 Sun, 08 Jan 2023 21:01:55 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 j12-20020a19f50c000000b004b59067142bsm1008257lfb.8.2023.01.08.21.01.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 21:01:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Mon,  9 Jan 2023 07:01:50 +0200
Message-Id: <20230109050152.316606-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109050152.316606-1-dmitry.baryshkov@linaro.org>
References: <20230109050152.316606-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v5 2/4] dt-bindings: display/msm: add
 SoC-specific compats to qcom, mdp5.yaml
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

Add platform-specific compatible entries to the qcom,mdp5.yaml to allow
distinguishing between various platforms. For msm8998 list
qcom,msm8998-dpu rather than -mdp5 to allow this binding to be handled
by either of the drivers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/qcom,mdp5.yaml         | 17 ++++++++++++++++-
 .../bindings/display/msm/qcom,mdss.yaml         |  6 +++++-
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
index cbcbe8b47e9b..681d6ac48d33 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
@@ -16,7 +16,22 @@ maintainers:
 
 properties:
   compatible:
-    const: qcom,mdp5
+    oneOf:
+      - const: qcom,mdp5
+        deprecated: true
+      - items:
+          - enum:
+              - qcom,apq8084-mdp5
+              - qcom,msm8916-mdp5
+              - qcom,msm8917-mdp5
+              - qcom,msm8953-mdp5
+              - qcom,msm8974-mdp5
+              - qcom,msm8976-mdp5
+              - qcom,msm8994-mdp5
+              - qcom,msm8996-mdp5
+              - qcom,sdm630-mdp5
+              - qcom,sdm660-mdp5
+          - const: qcom,mdp5
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
index 7479cd96fdec..7a81a10c0a9b 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
@@ -88,7 +88,11 @@ patternProperties:
     type: object
     properties:
       compatible:
-        const: qcom,mdp5
+        oneOf:
+          - const: qcom,mdp5
+          - items:
+              - {}
+              - const: qcom,mdp5
 
   "^dsi@[1-9a-f][0-9a-f]*$":
     type: object
-- 
2.39.0

