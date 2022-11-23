Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7673636BF7
	for <lists+freedreno@lfdr.de>; Wed, 23 Nov 2022 22:04:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC9B710E64B;
	Wed, 23 Nov 2022 21:04:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 755E510E248
 for <freedreno@lists.freedesktop.org>; Wed, 23 Nov 2022 21:04:08 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id s24so22713703ljs.11
 for <freedreno@lists.freedesktop.org>; Wed, 23 Nov 2022 13:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Eq+xrGXQkafyNxdD3bUOX4BO/00RbY/2YQOJ/yUkbp4=;
 b=rB1+P0BUkPh/YewhokMj4qsH1MK+rmFWlFLw7TS/yD0FskwXBk2OYi2sYJ7ZQZCea8
 Qui4u5xoHF6KMj64eb1RDSjnbwMo50qctsPZKiCJ7UxEqLcD0XKqWfQGLGc8yRVBWpL2
 5Boj8NXE1E+UTA3LIMOQspN4Fp9LebRfobqTCRVufslL6QofIvyUvwlM3SySweKrQm8Y
 q9NttdZoxQAgKlSKvoSx1rR5f29gPvKQLQ2XyiG1QqEV5Eg0Szrv9eQz2YpgIo/siTMH
 NMrn2Gd3Q9bKdlCgsQdnMz89Yp38XYCTHrnYDuVfswCKxwqssijnzeU6pUZMJnypWv2X
 gZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Eq+xrGXQkafyNxdD3bUOX4BO/00RbY/2YQOJ/yUkbp4=;
 b=cLUh027++fn12mjAOcsSVXerIOMIQjL9cBgWHUtJifIpn0ToPJqw9kMtDP6HapLS52
 BLXWroV3RZVNSvZpo3kn8ahUl6++gBugpQZFfWVyplJrQXNkDvh2zohcfnXyA3qJ4Ha+
 /0nclISB9o/QwXCjlWqtU8VckNzVSI1yg1zy1oTLqhb4uElHTuWYSoicMimfbJjf3i/y
 u+baBHnroF3r2KLRu7SJt/RtjO0pXPeoSXQ/vdSeCg4jF1vHegcxHP34wjLjcIdLyT1T
 3+gKpuaTxJiGW8aKDu0JTMi6EMsZnil0UOMSdeQUZ7NVyTXccNxUcdd7A2PFkQdk2LK3
 3wVw==
X-Gm-Message-State: ANoB5pmpUOtEvT9OVI9Mno38k8A359j5InCTIGKsQStimmo/XEMVwMnD
 i6BIA6NGeaHLyUmAGOv/CPNyCg==
X-Google-Smtp-Source: AA0mqf46OPUyvCRaV+rXrsIF9CJYhxP7BlmdS/3i551xkHAdarx4Z1u3pcQyFY30qtT6rTJMI9Od8A==
X-Received: by 2002:a2e:6812:0:b0:279:4159:ab79 with SMTP id
 c18-20020a2e6812000000b002794159ab79mr6177776lja.144.1669237446669; 
 Wed, 23 Nov 2022 13:04:06 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 c3-20020ac25f63000000b004b177293a8dsm3009913lfc.210.2022.11.23.13.04.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 13:04:06 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Wed, 23 Nov 2022 23:03:56 +0200
Message-Id: <20221123210403.3593366-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221123210403.3593366-1-dmitry.baryshkov@linaro.org>
References: <20221123210403.3593366-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v5 03/10] dt-bindings: display/msm: add sm8350
 and sm8450 DSI PHYs
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

SM8350 and SM8450 platforms use the same driver and same bindings as the
existing 7nm DSI PHYs. Add corresponding compatibility strings.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index c851770bbdf2..bffd161fedfd 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -15,6 +15,8 @@ allOf:
 properties:
   compatible:
     enum:
+      - qcom,dsi-phy-5nm-8350
+      - qcom,dsi-phy-5nm-8450
       - qcom,dsi-phy-7nm
       - qcom,dsi-phy-7nm-8150
       - qcom,sc7280-dsi-phy-7nm
-- 
2.35.1

