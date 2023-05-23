Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6927E70D5AD
	for <lists+freedreno@lfdr.de>; Tue, 23 May 2023 09:46:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4E7110E3DA;
	Tue, 23 May 2023 07:46:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CB4C10E3D5
 for <freedreno@lists.freedesktop.org>; Tue, 23 May 2023 07:46:49 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4f122ff663eso7602796e87.2
 for <freedreno@lists.freedesktop.org>; Tue, 23 May 2023 00:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684828007; x=1687420007;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=G7VSJ860e4Fh6HjTKl0hZQ20ZjzePmB9hlOaoC2DjYs=;
 b=LPfO4TNYtl3p+m/zpo5/0sKYt/Gk8NwiVakH6xONG0yzsLZwSf6njo71tOgMm2J6DP
 74Ca1SDWW3H7lntq4NxwzPIHa2cz/ySr6nM79JSoq+YvpvGfNjswJ3f0nlW8m3xteDmL
 tMaUEjbnaV5rpyUMcl5HcydyCLW4KzManse9QxkBRVnJkLFsIsMTNKoU0QhEDh38/NRH
 DfvqAL6LpwlH8WFgn/XPvPAHQR9/Uc+OWDVOGbcd7bkL1F2RBGXBBlRcziq99998+Yux
 dMCr4kO0AgGbYAn8gDSu59SXyGKsmBtzpMmwzUZr4DY8Vl6O9zPM+c8g4xIb+8YPwW7K
 eyIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684828007; x=1687420007;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G7VSJ860e4Fh6HjTKl0hZQ20ZjzePmB9hlOaoC2DjYs=;
 b=CXWTjWK9t3wi61SpFyZC/5JGr1MJWHwTN2DjdM+oy+gIRqyrZB8+hcK+jLgmrFBKHX
 KJwRqHe2FTcnyS5h4pzEnAhD17g9uM86+tKq02yoBbUOKAEEPgWioL/Xa9chdpmAU6Vo
 k7SUPCqNypWI+GavaZ7QX5Bw9fP4BaPzUymxsOtVrsYz+K05UklTBZBR2rhSx00C1jFn
 bKqBu6RdHOHWuDNcw+T8HTOCE18SJeveyilv+bMKb+NNFnatzftkbBkgViipQjsY4Xdj
 wjWoqNgANZMhf+HL3zq9lYo8D6ADoM2ma2LGtNvJiMQhhuBWnHdryOYqxzSzWj6Yhgn4
 cMyw==
X-Gm-Message-State: AC+VfDw+r+rQz1rny8M6seJDCqomMllv5zeo5WrvnMlU67lnubVHn0hw
 KfMSTMSZcGnxYl2rDSI/81esyQ==
X-Google-Smtp-Source: ACHHUZ4oGEBIae4rCVIdVQNqFVVBGfjQ0jdDLbNbELtK18p4kgkGWGFnwSZMy6yGRkihBvncLHQarw==
X-Received: by 2002:a19:f610:0:b0:4f4:b3e2:ff5a with SMTP id
 x16-20020a19f610000000b004f4b3e2ff5amr960851lfe.50.1684828006998; 
 Tue, 23 May 2023 00:46:46 -0700 (PDT)
Received: from [192.168.1.101] (abyk138.neoplus.adsl.tpnet.pl. [83.9.30.138])
 by smtp.gmail.com with ESMTPSA id
 t9-20020ac25489000000b004eb0c51780bsm1257070lfk.29.2023.05.23.00.46.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 May 2023 00:46:46 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 23 May 2023 09:46:12 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230411-topic-straitlagoon_mdss-v5-1-998b4d2f7dd1@linaro.org>
References: <20230411-topic-straitlagoon_mdss-v5-0-998b4d2f7dd1@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v5-0-998b4d2f7dd1@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684828003; l=1129;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=YH8eQbnbg0vjMQ5V3QSyUBMSn5oiwSvn85ByrDyOEfM=;
 b=iJOYYgaeSN0oSmq0j2H96FoSofQ6aG73eXrUH3db2gWxCPO3+Q2hzxrJvjTFj0XZSqpdnvZ1b
 eFNviWtWfF6ByrnsPcGQl6tIX9XWsO48jcxiKfqtGeYi79yI4815nIR
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v5 01/12] dt-bindings: display/msm:
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
index 130e16d025bc..43f801a94d79 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -26,6 +26,7 @@ properties:
               - qcom,sdm660-dsi-ctrl
               - qcom,sdm845-dsi-ctrl
               - qcom,sm6115-dsi-ctrl
+              - qcom,sm6350-dsi-ctrl
               - qcom,sm8150-dsi-ctrl
               - qcom,sm8250-dsi-ctrl
               - qcom,sm8350-dsi-ctrl
@@ -297,6 +298,7 @@ allOf:
           contains:
             enum:
               - qcom,msm8998-dsi-ctrl
+              - qcom,sm6350-dsi-ctrl
     then:
       properties:
         clocks:

-- 
2.40.1

