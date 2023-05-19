Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5700A709D31
	for <lists+freedreno@lfdr.de>; Fri, 19 May 2023 19:04:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2031E10E5B8;
	Fri, 19 May 2023 17:04:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15ADD10E5B6
 for <freedreno@lists.freedesktop.org>; Fri, 19 May 2023 17:04:38 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4f13d8f74abso4009753e87.0
 for <freedreno@lists.freedesktop.org>; Fri, 19 May 2023 10:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684515876; x=1687107876;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Olp/PVXIJr8fEMjOP3fCHDkSYD0xJnBud5aoQtWwMD4=;
 b=P9a3mKGxCtfXzLKVP5SAo8qOjOSf2qX1HaGd/cu8Xc9t6oXlMn3jlr7AlPWcfXUcGc
 uUhl0unwQ+QMiJ6B95v/v6z2cKzszb/5BcyqYLd7UX6POBBNCYBgyiW9RxMBgaN6hejk
 e5D56a96OYOJrhs0upUZj0VDGFDjlBPbXLW5Zn8C16wqz0mPgyN8kUQ3fqDgk7Namlas
 HVeSscM5QregjAWpfKtNE+sc6VScflt0U/8InDCjzdAoRKFZyZmym1t93dB0RircufHa
 bGbO6VyI3Gi0Ao+Ofz035mXiB43bMiH19+BPZ+69ER1Vz9PioKXed9KGziR2h0GuwWKh
 kjzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684515876; x=1687107876;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Olp/PVXIJr8fEMjOP3fCHDkSYD0xJnBud5aoQtWwMD4=;
 b=PaX9vrJcNASwPRponeMbU+GjYks8UzZeKaZIL8ep11QFi25QUewC/sK4BwM4uM86g5
 NMAMIwTCAW4FG5PbEiHqvSWDxt2HliY/4jC59JJ26O5TdmKKpkttYY2ogErAQxExSF8A
 ydLR9hX+qURLf686vGiWCY+TFjBeq9y8lTv8kLZRNqinuO+dd2z7UESrGuUel/ny2J1K
 McGNfNXn6afEY70Gso3waltK12xUR1ZGmdx9nIZ8d8/xTpwUxoEor8PeY1ziDhKVCvEs
 WRSza2KFHwjh+rg03qfeWGYAKLwUIM390yskc234qlM/P8CV8Nch4Z/Lk4vo1MeucPpS
 4N4w==
X-Gm-Message-State: AC+VfDwTju5gHQTJFRhCuLQs1EfWPQnFRDPNmZMhi1zomwX2qYsIGTVR
 LN8w3q8hWrboX+x8N4qKtMLIPQ==
X-Google-Smtp-Source: ACHHUZ4IeHr3sqM5Wn5U1+TjNStYTlQDUVag+a9X5qZ3WvOtBOeS4Z5TH4sFCy3lI4XYAyk9EC+kwg==
X-Received: by 2002:ac2:4c90:0:b0:4f1:95cf:11eb with SMTP id
 d16-20020ac24c90000000b004f195cf11ebmr972148lfl.6.1684515876323; 
 Fri, 19 May 2023 10:04:36 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
 by smtp.gmail.com with ESMTPSA id
 a6-20020a19f806000000b004f38260f196sm654478lff.218.2023.05.19.10.04.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 10:04:35 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 19 May 2023 19:04:23 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230411-topic-straitlagoon_mdss-v4-2-68e7e25d70e1@linaro.org>
References: <20230411-topic-straitlagoon_mdss-v4-0-68e7e25d70e1@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v4-0-68e7e25d70e1@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684515870; l=1145;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=VsWoYP7GHCgHOv33piyXwEtJ6/KtKH5SJYQ2EDUVEdo=;
 b=QPzbrNxaTLE/p9WkBiuxekU0fx4pSTlLLWeihi35wm/6b4DUhAxEznO6YIPT1cqT9vE73a++B
 KIBa/uP4RVtC4cpGHCHGC0eyloeNuPrCeuqwfmpNxDSXB2Gr7rCN3Yh
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v4 02/12] dt-bindings: display/msm:
 dsi-controller-main: Add SM6375
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

Add the DSI host found on SM6375.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 6f367a1fabf8..f7dc05a65420 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -27,6 +27,7 @@ properties:
               - qcom,sdm845-dsi-ctrl
               - qcom,sm6115-dsi-ctrl
               - qcom,sm6350-dsi-ctrl
+              - qcom,sm6375-dsi-ctrl
               - qcom,sm8150-dsi-ctrl
               - qcom,sm8250-dsi-ctrl
               - qcom,sm8350-dsi-ctrl
@@ -354,6 +355,7 @@ allOf:
             enum:
               - qcom,sdm845-dsi-ctrl
               - qcom,sm6115-dsi-ctrl
+              - qcom,sm6375-dsi-ctrl
     then:
       properties:
         clocks:

-- 
2.40.1

