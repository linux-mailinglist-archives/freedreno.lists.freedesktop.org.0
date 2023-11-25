Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F19D67F8B4E
	for <lists+freedreno@lfdr.de>; Sat, 25 Nov 2023 15:17:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 718AE10E076;
	Sat, 25 Nov 2023 14:17:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7679610E076
 for <freedreno@lists.freedesktop.org>; Sat, 25 Nov 2023 14:17:46 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-543456dbd7bso7302848a12.1
 for <freedreno@lists.freedesktop.org>; Sat, 25 Nov 2023 06:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700921865; x=1701526665; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+rQujemNns2ndt1lXcUIici3g0rf7w22fn5B+qvqdAk=;
 b=cxYgfYDSxqcJBtRbLRwRkwn5B2x0fAd7yGcpj7KI3tftovDm/5QG3s1PDNIJMBy61j
 YgU87RNkdZVBlESq50awPE4cw/IoUbBAa182nNOEvvNFfpGGdCmquUrElVFbnYPWPl+n
 4HVtrLGkZHYQEef1r78Zmevdcv1PU5bqAAN/mPd/biwcjsn45GmR9tfWYwxKZ+DXs0k3
 WE9tPqnHoex/p7X5LnXZsS8ZqOILmONZPdxRl+XR273812OWC5dtPXLTFhKCcK1OiFqD
 RQeSN0+u+K11T3aTUf/mcwz/C0FGvGByeMqEtImFylX925F/8PHcF3ehcJIqLu2ZvYSm
 Z98w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700921865; x=1701526665;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+rQujemNns2ndt1lXcUIici3g0rf7w22fn5B+qvqdAk=;
 b=IQKTt+oqGMFW9L1pvLeQocwCSu/TTwMwieWLRWB3lg4vggEntLSVykFNHaQK0mSRzs
 FxsQ2nrHyGKib9a4BrlcrDPa+OPAG3zNulVbaqBtBKO050fphWTbB+Da6YbdQVOaVwd1
 n1x5fDCFcfw9C7GKcW/rIRRxhVl/df1kWv6x+JKSvdUcfy5S9Vn/tcubretRPz9/KRXV
 iUcUzIzi+lJhls9SeYY9dkZNkiEr+eKwvGGxuQna2YwKcwQekXQUOzEdd4ssgHCnFUPi
 I7P/lqtvaKPBmBGAD0t/J5mRj2veb9S9YvcXiiSn4XCxCXoH0zy+xoOL0zJgC3FDwnEB
 a1pQ==
X-Gm-Message-State: AOJu0YxXR+WloPz8VcpXNGCMQO+SzrZx0z59BRiMWEMyLb+hEMn0YTvf
 O21x8tdaQxYtC/ATWCwvyVY+/A==
X-Google-Smtp-Source: AGHT+IGPxq21Qjgc/GrNJp+OS6vlYQiVZrLBsYgKptJdvk4KWzY/ul6KxNZYKidVLZt5GlelpE1RPg==
X-Received: by 2002:a17:906:1c0b:b0:9a9:f042:deb9 with SMTP id
 k11-20020a1709061c0b00b009a9f042deb9mr5318580ejg.19.1700921864631; 
 Sat, 25 Nov 2023 06:17:44 -0800 (PST)
Received: from [10.167.154.1]
 (178235187180.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.180])
 by smtp.gmail.com with ESMTPSA id
 19-20020a170906319300b00992b8d56f3asm3500345ejy.105.2023.11.25.06.17.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Nov 2023 06:17:44 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 25 Nov 2023 15:17:29 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231125-topic-rb1_feat-v1-1-11d71b12b058@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1700921858; l=1164;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Y1sirvX5YFsJjlPb48bi4MpncyZ0lMCRlJZu7X2yRoM=;
 b=UiGcO+L4/a0dmckDlbkw20ULhUpsIjv/+kQuhdQaBChp5KRuCtnnqN8CqLFyn7qRa5+5NOM2B
 ozznslemdQeAT1tVEV7J9StfijAPcDgoNEvSOjEwpF9tAfdtcIiixbC
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH 01/12] dt-bindings: display: msm: qcm2290-mdss:
 Use the non-deprecated DSI compat
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

The "qcom,dsi-ctrl-6g-qcm2290" has been deprecated in commit 0c0f65c6dd44
("dt-bindings: msm: dsi-controller-main: Add compatible strings for every
current SoC"), but the example hasn't been updated to reflect that.

Fix that.

Fixes: 0c0f65c6dd44 ("dt-bindings: msm: dsi-controller-main: Add compatible strings for every current SoC")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
index 5ad155612b6c..3d82c00a9f85 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
@@ -56,7 +56,9 @@ patternProperties:
 
     properties:
       compatible:
-        const: qcom,dsi-ctrl-6g-qcm2290
+        items:
+          - const: qcom,qcm2290-dsi-ctrl
+          - const: qcom,mdss-dsi-ctrl
 
   "^phy@[0-9a-f]+$":
     type: object

-- 
2.43.0

