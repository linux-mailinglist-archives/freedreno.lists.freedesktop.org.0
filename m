Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6811A6576D3
	for <lists+freedreno@lfdr.de>; Wed, 28 Dec 2022 14:11:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2EAC10E3A3;
	Wed, 28 Dec 2022 13:11:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E2CD10E1A2
 for <freedreno@lists.freedesktop.org>; Wed, 28 Dec 2022 13:11:15 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id bj12so38213308ejb.13
 for <freedreno@lists.freedesktop.org>; Wed, 28 Dec 2022 05:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yIvj6CLKAGPbCzVViYil+tBlKneBu3LIA/3PrIIlxx4=;
 b=DRQ24GnDGTJCp91rOOPpd4MtC7ukbeiX4EMp7aaJqkpCm2c4YkEhnQWvzuFja3CjCQ
 xI8qWXKmegyowqhNcU0SRG6LG/3GTHzQVxYleWpeTMVFfvPr7egRzwtTTWtdAUS8KHRO
 szlcy8xQTiLOXFeK0pyHFjIIfvlKZynD1wkg68WL3IGYgSEl67eXeV9d/EvA/oEkJV/1
 GMf0IFUgvhrMLi2dGnhjqq2drvfm7x3zG1+No14q//ZhIWA14kk3GPU+MXbaNLB38jvA
 JNIql6COciiep7X4T8M1aFIBNsgChvXrzni5hhVsOsLBBV5BarNDFp4VFceKo2y4iE8s
 N6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yIvj6CLKAGPbCzVViYil+tBlKneBu3LIA/3PrIIlxx4=;
 b=7J0v/GBF1LSOYo9Je4n2i264En2OE0F1cCQ5AASKpKYZ6QtMG8F2xKm7Nb2qroYfPU
 GzNg02mdt/0t6UFBVim/y1l2LEd3IxtJ0Fid7eDEzsElAtm/jzGH2Sm/eA4jwJdFk1Xq
 TOe7mqOBm38yyPsbxiLpcBJPhIVAwK+FekXpzRGHzl+/0WUxVkwjtD092GEt8rh+xSFY
 a/MpM04rYB2B8VPbFjsHXZkX/65YfE37cD7Ieccx6dfzFGqpL///Azb6f3u+w0mhu0T7
 Dv/5+Tta5cS1GE8rcsmEwQPV/JVMlh0GOQtoSO7kj3NoDTt0vAYhDx1EcE3EL6yT0Jmz
 q9jA==
X-Gm-Message-State: AFqh2krQ9SwD646+iV4LZEfCIUkS/lc8KAXUGVAm+N6pWIdO8LhcDQ6r
 4miii4TLVqSc8AOip0T5ZKft9A==
X-Google-Smtp-Source: AMrXdXvpJhSvObvLScgLH6nL9n1cKt22C9piLD5CYaGNWqas2AZDzHDkw5CZGHCuOLlqJ7typZS3DQ==
X-Received: by 2002:a17:906:6b96:b0:7c1:4bb2:f62b with SMTP id
 l22-20020a1709066b9600b007c14bb2f62bmr21246963ejr.27.1672233073820; 
 Wed, 28 Dec 2022 05:11:13 -0800 (PST)
Received: from planet9.chello.ie
 (2001-1c06-2302-5600-85f6-04b5-1651-3b6c.cable.dynamic.v6.ziggo.nl.
 [2001:1c06:2302:5600:85f6:4b5:1651:3b6c])
 by smtp.gmail.com with ESMTPSA id
 g11-20020a056402180b00b0046bb7503d9asm7099545edy.24.2022.12.28.05.11.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Dec 2022 05:11:13 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Date: Wed, 28 Dec 2022 13:11:10 +0000
Message-Id: <20221228131110.213116-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221228131110.213116-1-bryan.odonoghue@linaro.org>
References: <20221228131110.213116-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 1/1] dt-bindings: msm: dsi-phy-28nm: Add
 missing qcom, dsi-phy-regulator-ldo-mode
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
 andersson@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, quic_mkrishn@quicinc.com,
 bryan.odonoghue@linaro.org, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add in missing qcom,dsi-phy-regulator-ldo-mode to the 28nm DSI PHY.
When converting from .txt to .yaml we missed this one.

Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-phy-28nm.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
index 3d8540a06fe22..95076c90ea171 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
@@ -25,6 +25,10 @@ properties:
       - description: dsi phy register set
       - description: dsi phy regulator register set
 
+  qcom,dsi-phy-regulator-ldo-mode:
+    type: boolean
+    description: Indicates if the LDO mode PHY regulator is wanted.
+
   reg-names:
     items:
       - const: dsi_pll
-- 
2.34.1

