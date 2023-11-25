Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7E07F8B6D
	for <lists+freedreno@lfdr.de>; Sat, 25 Nov 2023 15:18:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C27B10E327;
	Sat, 25 Nov 2023 14:18:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCB8A10E04A
 for <freedreno@lists.freedesktop.org>; Sat, 25 Nov 2023 14:17:48 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a00191363c1so412507566b.0
 for <freedreno@lists.freedesktop.org>; Sat, 25 Nov 2023 06:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700921867; x=1701526667; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=mLrIlTcrfNZmEHwR1vKQ7waqjNZmvK/fvwshiqcqRAo=;
 b=uCCE9pdENJyXzc6e3joqsq3VTPgdpSXS/PVHR20neFT2OXPpTJaLWwnj2BDE+bjxIo
 XE4am/J22Vvoguk4F1F9/MQh+QipYDcd1Y0sQeZWy/nDJlkzGW5xql4/Uq/5/45ZM2mB
 KquySXcVLlBwttBsFHVB9hjvnXGBnEc/iBISFNBbRHhKG/BeP5mm3ZqYIcAELxdXtRbO
 R248RsDc3kTo5Wirk2DI7p0VGL4R5QvTEBp+BT5C61euL2wkmkZzaLSqbAARKiJReFOg
 ZOlH2SPh8yb4QNDf1ym1PUsy5bWv4kKoubXvSv89/TLTsqHhw+fbutQuQy9MAIfvVNfe
 m49Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700921867; x=1701526667;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mLrIlTcrfNZmEHwR1vKQ7waqjNZmvK/fvwshiqcqRAo=;
 b=aiaMg7S2USKfws5Is+HMLgnBOpgOuF8RmE63pheP4LXy00jyvaz6yHYccwt7gY6Tsb
 wQzHulJtSKlXh357rfh/0BwxSnapoJXFExuN3lXT8drN9KYq/cgtVwCUxWeywpqFsN1+
 R5VbW1K1NzBiFEUAVRmfC7X9aw3n/9KwjC8ONmcijzT9pA+d/RBP8+vYAX3AbMXQnFv6
 JXaLlQqwIEqXZBH6W+jPf1qxzLOzfLDAj3ql2onQxwcw1WJaHPcdn6tK/J93c4tejRgr
 D0yEBK5sIK/ELXz61AVCvEdG6FsYRjdhcpgSaR4GkWCSKFe5ZT0bvL/cC8oWVY5Kl2ZN
 dMjg==
X-Gm-Message-State: AOJu0Yx8vv91fhDv9/pdN6PKuS7tz7c/AUIQluG45Nz04vn6bsoC4Ue6
 NU9qlt6VAOyMXXTNuRsuSXgtsw==
X-Google-Smtp-Source: AGHT+IHy8KiePOZBp8lIAsCOZSPCZfjYQvCkrTWRBfU0HFRyq1+TOhdthnHNQZRG532gJ6TOTfvz5A==
X-Received: by 2002:a17:907:3c23:b0:a02:3f1e:57e8 with SMTP id
 gh35-20020a1709073c2300b00a023f1e57e8mr3984306ejc.36.1700921867257; 
 Sat, 25 Nov 2023 06:17:47 -0800 (PST)
Received: from [10.167.154.1]
 (178235187180.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.180])
 by smtp.gmail.com with ESMTPSA id
 19-20020a170906319300b00992b8d56f3asm3500345ejy.105.2023.11.25.06.17.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Nov 2023 06:17:46 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 25 Nov 2023 15:17:30 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231125-topic-rb1_feat-v1-2-11d71b12b058@linaro.org>
References: <20231125-topic-rb1_feat-v1-0-11d71b12b058@linaro.org>
In-Reply-To: <20231125-topic-rb1_feat-v1-0-11d71b12b058@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Loic Poulain <loic.poulain@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Georgi Djakov <djakov@kernel.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Robert Marko <robimarko@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1700921858; l=1875;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=AFFsjfQ/BWb6zbEE2kIE5M6+YBHmlQ+rokF2C+2Kd04=;
 b=Ko21H+lWGGl59y8qJsZ+LTUw0AWkhTziUlqwg4+lQP0Zq18rNp2fD1omovB6ZeBmhVmjSNMTp
 wKdjaAGzz5nAy1P3zo5fSusiUSJLqx/3Pre4Gi7Q7gCCuziLVKdW0lH
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH 02/12] dt-bindings: display: msm: Add reg bus
 and rotator interconnects
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, iommu@lists.linux.dev,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Apart from the already handled data bus (MAS_MDP_Pn<->DDR), there are
other connection paths:
- a path that connects rotator block to the DDR.
- a path that needs to be handled to ensure MDSS register access
  functions properly, namely the "reg bus", a.k.a the CPU-MDSS CFG
  interconnect.

Describe these paths bindings to allow using them in device trees and in
the driver

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
[Konrad: rework for one vs two MDP paths]
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../devicetree/bindings/display/msm/mdss-common.yaml   | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
index f69196e4cc76..c6305a6e0334 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
@@ -61,17 +61,27 @@ properties:
 
   ranges: true
 
+  # This is not a perfect description, but it's impossible to discern and match
+  # the entries like we do with interconnect-names
   interconnects:
     minItems: 1
     items:
       - description: Interconnect path from mdp0 (or a single mdp) port to the data bus
       - description: Interconnect path from mdp1 port to the data bus
+      - description: Interconnect path from CPU to the reg bus
 
   interconnect-names:
-    minItems: 1
-    items:
-      - const: mdp0-mem
-      - const: mdp1-mem
+    oneOf:
+      - minItems: 1
+        items:
+          - const: mdp0-mem
+          - const: cpu-cfg
+
+      - minItems: 2
+        items:
+          - const: mdp0-mem
+          - const: mdp1-mem
+          - const: cpu-cfg
 
   resets:
     items:

-- 
2.43.0

