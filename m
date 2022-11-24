Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A36FD636F37
	for <lists+freedreno@lfdr.de>; Thu, 24 Nov 2022 01:48:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 408F110E68A;
	Thu, 24 Nov 2022 00:48:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD6AE10E66A
 for <freedreno@lists.freedesktop.org>; Thu, 24 Nov 2022 00:48:09 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id i12so302867wrb.0
 for <freedreno@lists.freedesktop.org>; Wed, 23 Nov 2022 16:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s/+izB6qlYb6bRq2XQ4xWOaK3HaQF+2lrKRrNqk2qGA=;
 b=N32F+OR79SQSbdzR9yWva0KCvzcWwerTV8JNMiYs6YGEtMsN2oSR0ESzOTYSJZRjCQ
 oNOZPF4RJP0nGRRwAuWrehizOTxtA5fHf30kEybQSz+3l/WqA07/W88RdUVpT9wBvUFG
 TUG56AkPQO7nkbzZeTkKl1itm7NWKdJE57xXL35iLg0VkgeDPihlrpQb5wua3ubXRfMQ
 3otFhGEi7HQJaZzaLVX+p93EnY6y1ehTvmiISj4f8Wg09ReGDGDu9i4wUio/rnirmNv3
 PIKagl/R+ib9xFiQYHNmgiy+f6B6H1peyk9L9f62q723vqhdDt3kWfGAQ15tAz+/s9Xl
 VjkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s/+izB6qlYb6bRq2XQ4xWOaK3HaQF+2lrKRrNqk2qGA=;
 b=roVByquIsxG1w1CP9FZws2sLvS5F35Yf0yGU/3ZjEJgwOG3pg04BFlaVmkDvN9YFfi
 70IdDVa+FKVw3IogV4rBFo+fIWGu8fBdD+IAcP5WvBNmf+NP8MTX9pubhR6ygWOmVslF
 MKWtQZhFfWFVigpItmy+NMEeo1UxTEijUKdiwAztsc1+vbNU1lfP7BXi93bcHnnzkFBG
 71ri4ePkZGCOZ0k4PkbeNB45WHv7v1v0hRSgcwG+0aS7PObwHGimPMawX2uJaUee1xSW
 R7QMq+ITZmn9104OdkUeSr1lIcU0R9TPHhJZ36JggGm5qe835U1aN0G1w7oLgiXebqb9
 4oJA==
X-Gm-Message-State: ANoB5plDEOIPGzNMpapWEYHH4ySqLMclOFF7PzIFs/fS5rfDTv2YeW/K
 2cAxiXVtqT6y3gN9zAdp8s1ZOg==
X-Google-Smtp-Source: AA0mqf4n6UAjOVx73G5DDWEIyanuAsi+GDm8ViisN1rp1gp8RC3B5/SOI1xrQeyK7p6Q4i2cyQVBmA==
X-Received: by 2002:a5d:4706:0:b0:241:e77b:a81c with SMTP id
 y6-20020a5d4706000000b00241e77ba81cmr4995736wrq.145.1669250888449; 
 Wed, 23 Nov 2022 16:48:08 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 n38-20020a05600c3ba600b003c6bbe910fdsm5245076wms.9.2022.11.23.16.48.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 16:48:07 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Date: Thu, 24 Nov 2022 00:47:46 +0000
Message-Id: <20221124004801.361232-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
References: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 03/18] dt-bindings: msm: dsi-controller-main:
 Rename qcom, dsi-ctrl-6g-qcm2290 to qcom, qcm2290-dsi-ctrl
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
 robdclark@gmail.com, robh+dt@kernel.org, agross@kernel.org, daniel@ffwll.ch,
 dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org, swboyd@chromium.org,
 airlied@gmail.com, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

We will add in a number of compat strings to dsi-controller-main.yaml in
the format "qcom,socname-dsi-ctrl" convert the currently unused
qcom,dsi-ctrl-6g-qcm2290 to qcom,qcm2290-dsi-ctrl.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index cf782c5f5bdb0..67d08dc338925 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -16,7 +16,7 @@ properties:
   compatible:
     enum:
       - qcom,mdss-dsi-ctrl
-      - qcom,dsi-ctrl-6g-qcm2290
+      - qcom,qcm2290-dsi-ctrl
 
   reg:
     maxItems: 1
-- 
2.38.1

