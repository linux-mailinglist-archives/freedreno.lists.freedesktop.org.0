Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3D0785834
	for <lists+freedreno@lfdr.de>; Wed, 23 Aug 2023 14:56:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4469510E423;
	Wed, 23 Aug 2023 12:56:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E309810E422
 for <freedreno@lists.freedesktop.org>; Wed, 23 Aug 2023 12:56:04 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2bb99fbaebdso86732481fa.0
 for <freedreno@lists.freedesktop.org>; Wed, 23 Aug 2023 05:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692795363; x=1693400163;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=76F0+BldbGsR8SBANuEdRlfBFJURUSsOZA3YGl1lILM=;
 b=d339VLvxc2xBNXBI8TejX4+7NlBPgSgXVKhUFkuogzXuNf3WwQTKzIAyWkQgRtgz6N
 F7nO/fEUrmgFIeo4tJnf/6mqjrtMs6EiPgcsAvCKIBPLvAEwgxvhcjgIvX0xgxLgoJ4b
 F9Yg1JFbIVjN4Mu8A/asqRvCS4j03LFv5r3pbAxQ+V8uFfzHRPhLneZ0e0ErsMmUAB63
 aZno/46a6gGFUCY6VmV/9Xtukor6YiYNmKM8xRQUPRB6qj6UUg516rw/6DLP6mR16WDr
 GulW70kLB5EU9B8Y9/Xsk5u4XN/yFdUCKpmg6Sih8alZ6180UalioQ2FTxlSrUr60ds1
 n7eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692795363; x=1693400163;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=76F0+BldbGsR8SBANuEdRlfBFJURUSsOZA3YGl1lILM=;
 b=O1fUBw3AzVzanUOPf+cHhzWwr1/tna2gRoF4jCaXHwFDdea1QCs2hU0GYlVl+Km29g
 6Ujofhn8kZSf3yevDFYpBjN4vSeSw4NebCrn5z334JJOLSlTH4IIR5i3iOSvv/2xLUY/
 g0i3ulr+kUIFqdC6ZiLaaHT7qSrzqYNriFnmkqVWiH/ZJuNtnsryr9xB5XtY6VtYvQFb
 YFt+Y0bCT8kPHwVEuhCnLJWL19nSuKSgICVFdzKdHr6kIwEddsNSaqZbDIEHa/oQpVjd
 VpGj5qVFbU1IYs9Hh43rUfaU0piQnN7+LfnWX2QIxqAkPNPV7iryIaNBij8f5P8rC2Sw
 jmfQ==
X-Gm-Message-State: AOJu0YzbxjoeLiMd6QN5pqmhSwgaKj8Wx8pLaJmuWmf114jaR3JXX5xb
 SIkeAwRC9eKGAdE5S3BW8U787g==
X-Google-Smtp-Source: AGHT+IHvFs4X24Epg1IVK3P4hu0nrPCKXp4OGPnYYYUa4cw2jBs/S2XC4r6kM1PdFztlZ+eeZzI5cQ==
X-Received: by 2002:a05:651c:22f:b0:2b6:e2c1:6cda with SMTP id
 z15-20020a05651c022f00b002b6e2c16cdamr9054421ljn.46.1692795363222; 
 Wed, 23 Aug 2023 05:56:03 -0700 (PDT)
Received: from [192.168.1.101] (abyj76.neoplus.adsl.tpnet.pl. [83.9.29.76])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a05651c011200b002b6db0ed72fsm3220256ljb.48.2023.08.23.05.56.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Aug 2023 05:56:02 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 23 Aug 2023 14:55:55 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230628-topic-a7xx_drmmsm-v3-2-4ee67ccbaf9d@linaro.org>
References: <20230628-topic-a7xx_drmmsm-v3-0-4ee67ccbaf9d@linaro.org>
In-Reply-To: <20230628-topic-a7xx_drmmsm-v3-0-4ee67ccbaf9d@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692795358; l=1312;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=f8Ks5qBU/xHwVpGLbBaIcN6/JSh0hSEZ3lbJ3m6GXGI=;
 b=+zsPrPBNgU+UvUpCRZBUkV0XrbEyNRiLu6ro/qGbRpWTLJlZS6Y+u4gk1SS/eIS7MgeDRNY3+
 tOUUvSeoUiNARNIfE4tGHdknPC91GZH4QxCovczOScI7ZuIXbmX0ECE
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v3 02/10] dt-bindings: display/msm/gmu: Allow
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

When booting the GMU, the QMP mailbox should be pinged about some tunables
(e.g. adaptive clock distribution state). To achieve that, a reference to
it is necessary. Allow it and require it with A730.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # sm8450
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/gmu.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index 20ddb89a4500..e132dbff3c4a 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -64,6 +64,10 @@ properties:
   iommus:
     maxItems: 1
 
+  qcom,qmp:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Reference to the AOSS side-channel message RAM
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
2.42.0

