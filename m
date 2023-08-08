Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE02E774C0E
	for <lists+freedreno@lfdr.de>; Tue,  8 Aug 2023 23:03:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0428B10E214;
	Tue,  8 Aug 2023 21:02:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8962C10E20D
 for <freedreno@lists.freedesktop.org>; Tue,  8 Aug 2023 21:02:55 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4fe61ae020bso5736550e87.2
 for <freedreno@lists.freedesktop.org>; Tue, 08 Aug 2023 14:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691528573; x=1692133373;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=eeeLPCy6qfu7VzyO6TB+4obhTO937OTJDmGqSEAL/C0=;
 b=eRcfceqdGyPWbfW1IJ46N3yGau4WsQ2IRDMKSpvhwjcuY1kR0EXgSKZpXQ3cPEYebb
 u8qMEteJ4St0tBsKjVoNTAPoxcM9D/47M/CQRXFqAjX/yvHuRXVZ0+ODhS/Gskr8soZb
 Mc7Vrr/yzIunoEBRd3AuGknL9b0pCsDPDvZYA/5ibX5mov+umg9pP/66rpmtQUe+YX2v
 C6A/wF6LhVTDNx+EFnJaR1Xp8kpiVmIGtbimvgXP1qaJr0Nx6OBgkSmbmENhPkUokxKW
 BDs3DXMbWlh74cFvqyVIEZGZYprXcQx222sijRafq1m/gmV4i5fhRI7qFcAQWaZoswM/
 Zrzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691528573; x=1692133373;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eeeLPCy6qfu7VzyO6TB+4obhTO937OTJDmGqSEAL/C0=;
 b=AUefCB9WKuoVIevjQjwrJ46AtNQyTS68yX6ibWEFfrZTmVFvVui8bQx1DuBSUQu2Kp
 Wb3E79ErqGNgDOec4XEamjHog0lTz0/s++UD1g8hfTEMHUWoL9OrGRHfR3pGE6lUr1/Z
 CvOyhqx/O2ogDAzOnUJ3RyqOMQe2dxrwEIhF+XkSEtsxGJVbf9cGZFfPfLH+hjiSNOni
 xCkciINSUE1nmm9wDRWql8iwjYuxGae4FsYY0iyqJGWy1C1oHfCcs5Ccek+WGSfoJfuH
 d3TNwVdfocbA7zKEk0umGZy9NIe186jbe5GlU+GzDIfrYKGHqm2idRlKyilTQ+Yz+/Ny
 J+/g==
X-Gm-Message-State: AOJu0Yx6/fpAidAZfaBrtfuZ0xxMqJr6Tl77YYoD/CxoS7mxqm8nIo3o
 AwcAe3ePe3AELL3ahEtULt1mRg==
X-Google-Smtp-Source: AGHT+IHn7Bj8Chf85274C6TwBy1wODZyxABYbM3L3w6Y3HCaMqYLDNJjbcllz+vIgP1YjMj8QqwXZA==
X-Received: by 2002:a2e:7305:0:b0:2b6:da66:2d69 with SMTP id
 o5-20020a2e7305000000b002b6da662d69mr477165ljc.28.1691528573769; 
 Tue, 08 Aug 2023 14:02:53 -0700 (PDT)
Received: from [192.168.1.101] (abxi185.neoplus.adsl.tpnet.pl. [83.9.2.185])
 by smtp.gmail.com with ESMTPSA id
 h11-20020a2eb0eb000000b002b6cc17add3sm2431483ljl.25.2023.08.08.14.02.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Aug 2023 14:02:53 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 08 Aug 2023 23:02:41 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230628-topic-a7xx_drmmsm-v2-3-1439e1b2343f@linaro.org>
References: <20230628-topic-a7xx_drmmsm-v2-0-1439e1b2343f@linaro.org>
In-Reply-To: <20230628-topic-a7xx_drmmsm-v2-0-1439e1b2343f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691528566; l=1566;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Ora3efxJ7ruQmdmZDV+9TI1SKqnioWIl7z/BhTRZm+U=;
 b=wxvCDdd4et5qNx/FesBXpu/lrapN0Cbryw33tqS57rBAVhyK7YZ8hVwPyuZo002qCn38q+GUZ
 BqucMQIeANyCEn41/g72zvwEiRwCHGIpRxtGArMsrIZQL1zjQ1MI0S5
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v2 03/14] dt-bindings: display/msm/gpu: Allow
 A7xx SKUs
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

Allow A7xx SKUs, such as the A730 GPU found on SM8450 and friends.
They use GMU for all things DVFS, just like most A6xx GPUs.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # sm8450
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 56b9b247e8c2..b019db954793 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -23,7 +23,7 @@ properties:
           The driver is parsing the compat string for Adreno to
           figure out the gpu-id and patch level.
         items:
-          - pattern: '^qcom,adreno-[3-6][0-9][0-9]\.[0-9]$'
+          - pattern: '^qcom,adreno-[3-7][0-9][0-9]\.[0-9]$'
           - const: qcom,adreno
       - description: |
           The driver is parsing the compat string for Imageon to
@@ -203,7 +203,7 @@ allOf:
         properties:
           compatible:
             contains:
-              pattern: '^qcom,adreno-6[0-9][0-9]\.[0-9]$'
+              pattern: '^qcom,adreno-[67][0-9][0-9]\.[0-9]$'
 
       then: # Starting with A6xx, the clocks are usually defined in the GMU node
         properties:

-- 
2.41.0

