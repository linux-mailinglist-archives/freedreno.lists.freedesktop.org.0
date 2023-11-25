Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B817F8B5C
	for <lists+freedreno@lfdr.de>; Sat, 25 Nov 2023 15:18:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCC3F10E070;
	Sat, 25 Nov 2023 14:18:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B32C210E2BE
 for <freedreno@lists.freedesktop.org>; Sat, 25 Nov 2023 14:17:58 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a0b65cbf096so60730266b.1
 for <freedreno@lists.freedesktop.org>; Sat, 25 Nov 2023 06:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700921877; x=1701526677; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=KWCPgxbV31hYh8dy6WyfWoyvdSmmu8EadahKhw6DkWw=;
 b=Qga9KrnkcBNCafOAfjxtj+QeqeE5Y0qEZctdzUrLc4H1QmJC1VxOxFzMIE5hXmGXIy
 MZOmbm/v5BtYPL0G+E0PemRy51Ue1q9YzeWgCe6f6Ma3Q+pa+8RNSILDuo6tfdgZGiac
 lSm3DI3/18m6Y2PH/HgL0luMhJknPPCSEbE5UwsYxXu8hNbXdtQLKvfDEm+NK3fQBWn1
 CtaiPr66i0Ke53rGpsXBFtQqhMMiJ0M/E5FuG9XiKtox531M7WIxgxULTpjrb9sRV70R
 d/7N7E/v3DzmXujehAONDu+qlNHxf7RBPrWhDeCrkiQS5uWyqtY7BtLcnUw3mf+j0qg9
 S9WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700921877; x=1701526677;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KWCPgxbV31hYh8dy6WyfWoyvdSmmu8EadahKhw6DkWw=;
 b=ACDRGMdnQKdx7DMo+dYSpNvZKI+Dcdc94vEu9mS0zO+jgfBsruurfUSqSCOlXPFBvW
 zl38ufOyMX42OXLzTGYr/fszs/8NfxBIS54Mm9g2a81ovz1JxsschSGZfACQ2uiOJMyz
 zm3gNmdPxJqhri1WIhOcT6Tu4kMVRJ51xIjlG6aJpec26frtKVmpjxAHIHod2HJVz+r4
 yhx/aMCAtoPwLPvazrzyOkanrY/NsQ3RSkiGT3MU1rdSnFVwJnHG6Ec4nH9xnexTTPh2
 PhZB9VhY3+kHhhkM24L+SEVgNnayLPamaP7vwlfoPRQEiAP3x46hP/Zn6DYJuZcdb8X7
 HAFQ==
X-Gm-Message-State: AOJu0Yw7iI2j73yYZKowwO/9irswNqwCizycNM/vGPrCg739wXN7zYSW
 aqsup4HylDuSdAkE6jRE8bZyVQ==
X-Google-Smtp-Source: AGHT+IHvD1QUH58vfrh+JuFXiAspD6f2yTyYe0BNJ9QJi9uFvF8FzZqrsK628r6rcj/cdkeKg5L5Ow==
X-Received: by 2002:a17:906:608d:b0:9d2:20ee:b18b with SMTP id
 t13-20020a170906608d00b009d220eeb18bmr4065922ejj.42.1700921877219; 
 Sat, 25 Nov 2023 06:17:57 -0800 (PST)
Received: from [10.167.154.1]
 (178235187180.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.180])
 by smtp.gmail.com with ESMTPSA id
 19-20020a170906319300b00992b8d56f3asm3500345ejy.105.2023.11.25.06.17.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Nov 2023 06:17:56 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 25 Nov 2023 15:17:33 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231125-topic-rb1_feat-v1-5-11d71b12b058@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1700921858; l=892;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=4p1t3ladITCzScGHKWRD4AUO04YXuJiZkuRiWJFiujo=;
 b=HgtcxdLyklPczRRLJMxdrlC1sVeNSeCuWIN6F4Xkr9dxy/a75RHP8Tm9mVxVipeW+jkpJiDqG
 jjrxeMEwW5LBwHqcbF7tqgSlw1eWMPkjI1ABsatTSpX8EHUOrDEKyaC
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH 05/12] dt-bindings: interconnect: qcom,
 msm8998-bwmon: Add QCM2290 bwmon instance
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

QCM2290 has a single BWMONv4 intance for CPU. Document it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
index 7cb8df757477..a88cea732370 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
@@ -25,6 +25,7 @@ properties:
       - const: qcom,msm8998-bwmon       # BWMON v4
       - items:
           - enum:
+              - qcom,qcm2290-cpu-bwmon
               - qcom,sc7180-cpu-bwmon
               - qcom,sc7280-cpu-bwmon
               - qcom,sc8280xp-cpu-bwmon

-- 
2.43.0

