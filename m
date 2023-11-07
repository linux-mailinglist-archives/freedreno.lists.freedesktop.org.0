Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F2D7E39EE
	for <lists+freedreno@lfdr.de>; Tue,  7 Nov 2023 11:36:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B912610E144;
	Tue,  7 Nov 2023 10:36:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9D0410E144
 for <freedreno@lists.freedesktop.org>; Tue,  7 Nov 2023 10:36:05 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-9d2e6c8b542so822652766b.0
 for <freedreno@lists.freedesktop.org>; Tue, 07 Nov 2023 02:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699353364; x=1699958164; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=V9Vc2qkKhkx61HztjKbbqVRx45srzZVqd+8CPW3yS50=;
 b=YbpsoTv7lfQSP2VPEGJVnJhm87UgacPVDYv6bpSsK7XazHGHJDTzRSO7j1g8rAQ+S1
 /GhjYVI3UhCgUvKFPHTxBz3b6+bwCG0GVi6uyBBI1Osn6Bts8GgHh06OIm1WfmSuyXZT
 538KnBc4MdI3VlBmanc0NchtrbbXJDVdy1974/3zu9UqdcuVfATPdwiYPHFOAzCUuj+K
 a1aq19bi+rveIm9iLf1vTnhIkVSpzWZCdTEoMocANkHHKUOx3FxnOGiGQCxaSxAS/mcl
 Ymu5RKNvlk+8QdA/bG9l+NmiILGeEyWfFO55ZdUZib168cFDbdbqDSUaijgoIKwOLrEa
 4osA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699353364; x=1699958164;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V9Vc2qkKhkx61HztjKbbqVRx45srzZVqd+8CPW3yS50=;
 b=Am/R3yXkUV31Wa3kXvbenWfL0HG55cepPYihhW6jDInuVzlb8Tnr1qmehw1BXJbrWm
 GqPaiA/Vlypa20FYldFSwzOGZxNVV1DfVd8vXyGRc4Hpk6mbrPq9jtsBieb6uK6X3Gr6
 9dGxvnl2L0My3TZRRrrBMcKcTCtc+rBXsAm8qwYSFMCDQjZViBlLJt3H6uCuMIDRBBjc
 aYJdpioPqrFhBAszT3TtmXivyUvqT4Cv4J9sKGsZGOkDSAnHOQS9IJXzMTtd1mNrinGL
 ekUuejogmMqDAbWsP0DxxJer5oJiDsJseLCf5LFLRthxgKH9cEeRveTWDoHNiJr5mZuh
 swJg==
X-Gm-Message-State: AOJu0Yxmsfo0D84BIX0Y7Up/pbwJxrM+js0DGOUII4ro9Rvu6McNXXtq
 IRxct8URNs8PUeJiP6D1Qc3J4Q==
X-Google-Smtp-Source: AGHT+IGlcsVnMGNpyWLBotkYWP9vhPvQ1zyDE2+TWGxgndROuli3GOxflA+1dY6Ar37umkuXKpUK5w==
X-Received: by 2002:a17:907:74b:b0:9ae:65a5:b6fa with SMTP id
 xc11-20020a170907074b00b009ae65a5b6famr15853415ejb.32.1699353364150; 
 Tue, 07 Nov 2023 02:36:04 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.126]) by smtp.gmail.com with ESMTPSA id
 g7-20020a1709064e4700b0099d798a6bb5sm877590ejw.67.2023.11.07.02.36.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Nov 2023 02:36:03 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue,  7 Nov 2023 11:36:00 +0100
Message-Id: <20231107103600.27424-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] dt-bindings: display/msm: qcom,
 sm8250-mdss: add DisplayPort controller node
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Document the DisplayPort controller node in MDSS binding, already used
in DTS:

  sm8250-xiaomi-elish-boe.dtb: display-subsystem@ae00000: Unevaluated properties are not allowed ('displayport-controller@ae90000' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/display/msm/qcom,sm8250-mdss.yaml         | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml
index 994975909fea..51368cda7b2f 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml
@@ -52,6 +52,16 @@ patternProperties:
       compatible:
         const: qcom,sm8250-dpu
 
+  "^displayport-controller@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        items:
+          - const: qcom,sm8250-dp
+          - const: qcom,sm8350-dp
+
   "^dsi@[0-9a-f]+$":
     type: object
     additionalProperties: true
-- 
2.34.1

