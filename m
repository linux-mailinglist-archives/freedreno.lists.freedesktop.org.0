Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA0D6F8B4E
	for <lists+freedreno@lfdr.de>; Fri,  5 May 2023 23:41:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E686010E698;
	Fri,  5 May 2023 21:41:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DB5F10E68F
 for <freedreno@lists.freedesktop.org>; Fri,  5 May 2023 21:41:05 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4f139de8cefso17557519e87.0
 for <freedreno@lists.freedesktop.org>; Fri, 05 May 2023 14:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683322864; x=1685914864;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=KKTw5Zfw+dKxxnY8fd/tof/aQPft5PObVsbIBwm4nOE=;
 b=ukT0/Gbl014hMNt6POWBZru46jjtyO67bCDOzbZQZOMZh/Xs1H+L8K6mDJGk6hCggf
 hP8OvDws58qepr8kd9WeIEaA83Rd6PluO+iUO5+29SlGxYywQWhIQE8qIa4GBG418mt8
 c5l3uHkpi/5r7sB13IdmqPFrrHzj/BxFMY0JaZPSq0RF8ukN/qvrdcvLllwn9NNL5paG
 xQMSTWDqos2eRlNGrdkBtaReQd/VjqO7SYfT15338L6qPFxVkRTh6Q6AfSncogyQyH45
 fZbyB/xTGzrtQcYxtMwV24Pyo+2bBYQzas5NnRA2v+FQniqofEXyRf8f/6JQ4+lNTg6F
 2clg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683322864; x=1685914864;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KKTw5Zfw+dKxxnY8fd/tof/aQPft5PObVsbIBwm4nOE=;
 b=VPoGjFhyDUWjUvSBC/MdfyZxvafBhdpGyWUN3mpjgPHmRxRBjLss/YEhFj1QIxE49E
 bVvOfkpT6d4HepyYHJn6bWMWqHsq2127dD0PHd5UOnJSc0o1R0SaGavnh7aVodF90qb8
 bsOG7wDin0YhoSChfuRCW2Qu3RghZOOEao4e4/dNwDl6qw2WK9IWBcHIwS/ieLRpE3ZN
 x3IPQLuJUo0IizfjWN1C5Gk6gXjS3TlOXTL3dknJySM8y86vU9X3iAsUseK0geFtPguW
 jebgpubt02q1qRxaMXQGCaafdK7U/FfaMbIAcsHRFkTLbg0X/52HOutFN1zVZieO4HPv
 yhuA==
X-Gm-Message-State: AC+VfDx0WLhdGWZeJahtD8BeUDNDpcLztuCyKBk58aIw4AYuQAm0lZUy
 o65rk3N1CDGYqrvN7vI6EHCakg==
X-Google-Smtp-Source: ACHHUZ6ZtEMdLb5DxiTNnLAorcEKFTUditPxbDFGZDHqLOLxFtWNDnrraKKGdt84CJWoao5/f5ySSg==
X-Received: by 2002:a2e:994c:0:b0:295:d7a8:559b with SMTP id
 r12-20020a2e994c000000b00295d7a8559bmr880720ljj.10.1683322863863; 
 Fri, 05 May 2023 14:41:03 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a2e720c000000b002a776dbc277sm126453ljc.124.2023.05.05.14.41.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 14:41:03 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 05 May 2023 23:40:38 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230411-topic-straitlagoon_mdss-v3-12-9837d6b3516d@linaro.org>
References: <20230411-topic-straitlagoon_mdss-v3-0-9837d6b3516d@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v3-0-9837d6b3516d@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1683322839; l=1014;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=d3S3xhOuliIdaa9KoHmUn1yxgnvenr1zId8Sw3Pr4Gg=;
 b=u3I52rgeZRIPJW2hyj/d+O+JrD0lLVAtextnz9mrc5yCQjY92j+5ZQdr3tADqPYJVA4RutRv3
 92CfHxICo1ADBe7zjWqCKUtgraxwFrHDFKvLO1TZbLhn+tvZjWcQpLU
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v3 12/12] iommu/arm-smmu-qcom: Add SM6350 DPU
 compatible
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
 Konrad Dybcio <konrad.dybcio@somainline.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 iommu@lists.linux.dev, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Konrad Dybcio <konrad.dybcio@somainline.org>

Add the SM6350 DPU compatible to clients compatible list, as it also
needs the workarounds.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index d7d5d1dbee17..e64c737724c4 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -253,6 +253,7 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,sc8280xp-mdss" },
 	{ .compatible = "qcom,sdm845-mdss" },
 	{ .compatible = "qcom,sdm845-mss-pil" },
+	{ .compatible = "qcom,sm6350-mdss" },
 	{ .compatible = "qcom,sm6375-mdss" },
 	{ .compatible = "qcom,sm8150-mdss" },
 	{ .compatible = "qcom,sm8250-mdss" },

-- 
2.40.1

