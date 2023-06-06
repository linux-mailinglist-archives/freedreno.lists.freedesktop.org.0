Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4F4724296
	for <lists+freedreno@lfdr.de>; Tue,  6 Jun 2023 14:44:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4294510E33D;
	Tue,  6 Jun 2023 12:44:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D5CD10E338
 for <freedreno@lists.freedesktop.org>; Tue,  6 Jun 2023 12:44:10 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2b1badb8f9bso43202921fa.1
 for <freedreno@lists.freedesktop.org>; Tue, 06 Jun 2023 05:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686055448; x=1688647448;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=HwN0tI2Kl+T0HN09yLqjcLaiWYt+x33veuBBB/2tgTQ=;
 b=aVWZFuHUTRWDrX0ticH4FlzHopsuDKvHUr124ajPfFWICxW6XYstyo1cqBGcB1hjJo
 SzOlOJ3v3H0PXU2Z+AJTmtihRZbKjLYpP1pCRdnD/oD/6KPqgXrzjP15M442rAmVWF+w
 cXtw1HZdvMYKbMBpnASuMSyILmM1QqNn4IB0VCjqCvRWMiT3xVqUho8ukTIvHtcne2ND
 isBrW1qcAVtJafjViAOEcb0zs+8J8lrNNwNDyCyzZ17h7m0D4dGUlacHszw2bELdpIbT
 XIUJF7tAtVg26qTJ1sWSjFTGkZBvaAvZb7mu7PC4aPT+CkdXmIhmL9iS9e7+oVujy1TC
 8cOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686055448; x=1688647448;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HwN0tI2Kl+T0HN09yLqjcLaiWYt+x33veuBBB/2tgTQ=;
 b=lWFNa+n1xoGhEPKYaiRl5VTjoyzqhTeapk/D3CP3Z2zjcw/1LhBgEO4kd70CKxQ5B7
 IwcXwXu9IO8OhKr7wy1CqdPZm8XxerSYmbQVrvbqFO0hgDkp0/hWDzD2NqllRSwP7XvP
 PbdM6j0v/h5doCvsdPFXOZH+xtgwearCj0FsWHfT60BdY9q2h1oTDiNSNEaLIpO9gbnw
 Rdi3+59zd7Sihz+LXnfj8te/TZ3p1wVdyXcAxIH+juziYSjp8/yImNd6/Ur+u3D7JX5W
 IpJVYRFoG4f2LzWmC8Uemaa1me6nvYtR8IV8yU+K0TPtTMjAtMU2ooURDJZH4s5EDxHj
 0sUg==
X-Gm-Message-State: AC+VfDzwx+6Thr4wJaKNpW2H8JJFbswZ0Vs2Rx2kl06DDJvbSCvk7ZTm
 X7KBltzY6OmI99/0drfXi5p/2e3dcC3sftcOLq4=
X-Google-Smtp-Source: ACHHUZ6aO/1pq8KEvhZVd8M0EaZRDyi2x3/mS986KEl4lpoS9FLEUfcwiol40awMVLj9BbM/1PnLkw==
X-Received: by 2002:a2e:9258:0:b0:2ac:dd01:e169 with SMTP id
 v24-20020a2e9258000000b002acdd01e169mr993850ljg.40.1686055448226; 
 Tue, 06 Jun 2023 05:44:08 -0700 (PDT)
Received: from [192.168.1.101] (abyl150.neoplus.adsl.tpnet.pl. [83.9.31.150])
 by smtp.gmail.com with ESMTPSA id
 u23-20020a2e9f17000000b002a9ebff8431sm1830823ljk.94.2023.06.06.05.44.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jun 2023 05:44:07 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 06 Jun 2023 14:43:52 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230411-topic-straitlagoon_mdss-v6-1-dee6a882571b@linaro.org>
References: <20230411-topic-straitlagoon_mdss-v6-0-dee6a882571b@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v6-0-dee6a882571b@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686055444; l=1129;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=jRckpE5DBdoe5VmYMwGlXlu4F2L97YNKmiEsTH+Z5Jc=;
 b=kpFcKUbuEtgTQtQl2WDDIygCPWJ3FbhWGRd2lOkRMB99UVp6BQaxv4NPaP1Br9hU0SNvditq6
 nCiQe0g3DZXBUQZexQr5BOBbwfYCSYUsPu8ssuRodOg2s9+x9rkQOu6
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v6 01/12] dt-bindings: display/msm:
 dsi-controller-main: Add SM6350
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
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 iommu@lists.linux.dev, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add the DSI host found on SM6350.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 660e0f496826..8081ced7b297 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -27,6 +27,7 @@ properties:
               - qcom,sdm660-dsi-ctrl
               - qcom,sdm845-dsi-ctrl
               - qcom,sm6115-dsi-ctrl
+              - qcom,sm6350-dsi-ctrl
               - qcom,sm8150-dsi-ctrl
               - qcom,sm8250-dsi-ctrl
               - qcom,sm8350-dsi-ctrl
@@ -299,6 +300,7 @@ allOf:
           contains:
             enum:
               - qcom,msm8998-dsi-ctrl
+              - qcom,sm6350-dsi-ctrl
     then:
       properties:
         clocks:

-- 
2.40.1

