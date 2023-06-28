Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBFB741988
	for <lists+freedreno@lfdr.de>; Wed, 28 Jun 2023 22:35:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD17A10E399;
	Wed, 28 Jun 2023 20:35:35 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A2FF10E38F
 for <freedreno@lists.freedesktop.org>; Wed, 28 Jun 2023 20:35:31 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4fb7373dd35so1830126e87.1
 for <freedreno@lists.freedesktop.org>; Wed, 28 Jun 2023 13:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687984529; x=1690576529;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ShOVFQ7RXIUW1rLCJcISdnIxitPcQmG9jiBKht2mxDw=;
 b=fNvzPeTrPGUOqRRGumNpPGd+754lAgnO/eYgAcwbEajTsV4Yo9vtXgYRlrfMy4vOU+
 4wxSxfNS3KuLFWtJHAPSlMoS4+RZZt+tE/T7mhO1l8d0SD4nlBSZwIL86qzm7eaLNzfO
 ciYaMhg86FJ3nK+zMXRGDwK2PxCeJ8E1UfJpReNszWZN6Bxtv0yeOg0V+RqzK1Zg/tXj
 RWglgcVmVxoRURGvKVGscpioN2Bklr19WjycEAAX9VmQ4wkhSgxfbTA6UDjpbrSytcJH
 /vPYU3GcNZ+ytrB9EEAuW5M+KZLsGRJSRe1w7uK3lWpIPi4i0mXWrKi2S0ItZBWaJ/o+
 wBnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687984529; x=1690576529;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ShOVFQ7RXIUW1rLCJcISdnIxitPcQmG9jiBKht2mxDw=;
 b=ETgBpJhlSJBEnwfP1x8X0ctlKsB52L5Ojo+9gzJjBqaUEb6tdmscQPF6Q1e5UTE9ws
 iPMOQVWvnd5DjM1SZ+rSzaQUrq7zzJ3MM4Bnd8R6A5ov75K7xwB27Dw1enstnJj1FdTN
 dp0Lwhw0MLD0WfQQoz3K846OJEMduOergYg42vHBoonPf/GYxDPGUD8NLFpecRsJ1CB6
 uE6xBk3stGm2YbKiLzmrzxUdyyL3+y+ISrJIIwGSvocc/2zmYbTZSdY+gJLS3q3XAa9G
 FMb60dUQ6nmw/Rl0IVAEYOkpEJOG9ezYeQl8Lzcd46yUYzAApO1IJYPOQ/yjj5ncOc/2
 lSFQ==
X-Gm-Message-State: AC+VfDxel36d9ed/Ph2jATQ79yoRAq4nnvFmsIGU60ynm2ldMwGTEC9Q
 sVZqdq4F+ZoPNgu0kr5b3UtXPA==
X-Google-Smtp-Source: ACHHUZ4dLQxKfpMvztzQNRy1edX0OC2T290+P4zJDP5A2ev5l2RQiBfE3/TQZlBoIovP20Zhyqtz9w==
X-Received: by 2002:a05:6512:308a:b0:4f8:6e1a:f3ac with SMTP id
 z10-20020a056512308a00b004f86e1af3acmr818922lfd.28.1687984528942; 
 Wed, 28 Jun 2023 13:35:28 -0700 (PDT)
Received: from [192.168.1.101] (abyk82.neoplus.adsl.tpnet.pl. [83.9.30.82])
 by smtp.gmail.com with ESMTPSA id
 m25-20020a056512015900b004fb86c89fa1sm753363lfo.135.2023.06.28.13.35.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jun 2023 13:35:28 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 28 Jun 2023 22:35:02 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230628-topic-a7xx_drmmsm-v1-2-a7f4496e0c12@linaro.org>
References: <20230628-topic-a7xx_drmmsm-v1-0-a7f4496e0c12@linaro.org>
In-Reply-To: <20230628-topic-a7xx_drmmsm-v1-0-a7f4496e0c12@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687984524; l=1089;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Zi8pu5SYXNW6tkMGEBTZIqc+2Rypg7fUU6hDiwoM2xw=;
 b=uC3bn2D19iI0waNc/bVHfDh6gUGVjhjvACMWf6s7R7DndLYPdT5QGdN5du2GLi5C+sV5+aWWM
 XXKWRLPMxBMDrz+ghSG6R4/ez/yar5S7D68HsS/BTPVOnOUHc83YUEZ
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH 02/14] dt-bindings: display/msm/gmu: Allow
 passing QMP handle
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

When booting the GMU, the QMP mailbox should be pinged about some tunables
(e.g. adaptive clock distribution state). To achieve that, a reference to
it is necessary. Allow it and require it with A730.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/gmu.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index 20ddb89a4500..9e6c4e0ab071 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -64,6 +64,10 @@ properties:
   iommus:
     maxItems: 1
 
+  qcom,qmp:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the QMP mailbox
+
   operating-points-v2: true
 
   opp-table:
@@ -251,6 +255,9 @@ allOf:
             - const: hub
             - const: demet
 
+      required:
+        - qcom,qmp
+
   - if:
       properties:
         compatible:

-- 
2.41.0

