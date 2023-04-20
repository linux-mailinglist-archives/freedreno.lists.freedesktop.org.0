Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F326E9EEC
	for <lists+freedreno@lfdr.de>; Fri, 21 Apr 2023 00:31:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B93A210ED34;
	Thu, 20 Apr 2023 22:31:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6292010ED08
 for <freedreno@lists.freedesktop.org>; Thu, 20 Apr 2023 22:31:42 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4ec81779f49so947173e87.3
 for <freedreno@lists.freedesktop.org>; Thu, 20 Apr 2023 15:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682029902; x=1684621902;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=UpOebqvOPbIqBzmR7NG/8rdRhqAcRj4FETPLZVvYR+0=;
 b=V0h1ZJjp6OhY4YDWAT7BDJ5ttf7U6iPjAi9Rcptq5HYQkQvwRLcYlr9TSkPIl+3ixf
 chauhhFx1ZN8Dfx0Xoq+3rCgOozjOiJ5wN+gqH/jJGiEYilnTuF87qQjPnr45ExRdyaT
 MbuNpZ3Or0OgZqfkZdOMgiGnx3OGnrLUVx8RI+O20k5lrzZ9pqeCd0sYU7wGItp31rO5
 UM17D2dm3AmUkxEe6xbXTxQufjSkOI7oNM7mdQtuwOnTWrPhwSEr3MxOskjLi1qhvWVK
 gyL7IK1KLNdkklcmVQsrymJiAE9BCiwyr08xJ8xhRwjQHGbTY68hcw1AJN/Quol7kj2O
 WXsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682029902; x=1684621902;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UpOebqvOPbIqBzmR7NG/8rdRhqAcRj4FETPLZVvYR+0=;
 b=cHeC1/PL+XZIq6VAB+RrdqEJCHuAevYQwJcPCsyTGY9jZnaheTh6LoPPKNMfOmLLf2
 LLO0tsASgvGhflwFsQhbGnHD8OKwE8v6TmKINFrNHNXfWCfp6J2D/2Ds64xnn+i4Emcu
 l9OxYL/RYd/mIreDM3rePydjNg3cD4FIpI37jolXCaXE+qoDPxhUjja3yq5XOO3ruGpk
 k+W2Hf8E3syhFuLVIdMc4b+IdE0BZphyI+jlEt48Hp5rWRGJsZD6Aa+Qpi6YOVmKBjko
 sKhT8fOUO4OdKS/hoa2232nMAXobxJ5k7OSvzeAjR0NyDQsfb9m98ERdr8tvUHm/gXD9
 DTfw==
X-Gm-Message-State: AAQBX9fRRD5oz8IQb+c/F2Vm0+QShS8ZmQfuHtRtBueXNwiYk1yBaxZt
 lTDzossq/eOQfKTdReWD5OOAhQ==
X-Google-Smtp-Source: AKy350ax7WiiZ7sdUoOrCa6zqvzc4la3MYIVSoMYrIr6DOVfjS5Y91sf5cpvtfvB3sHU712yldza8Q==
X-Received: by 2002:ac2:5204:0:b0:4dc:807a:d144 with SMTP id
 a4-20020ac25204000000b004dc807ad144mr905144lfl.39.1682029901820; 
 Thu, 20 Apr 2023 15:31:41 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
 by smtp.gmail.com with ESMTPSA id
 w8-20020ac25d48000000b004eedb66983csm324256lfd.273.2023.04.20.15.31.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 15:31:41 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 21 Apr 2023 00:31:21 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230411-topic-straitlagoon_mdss-v2-12-5def73f50980@linaro.org>
References: <20230411-topic-straitlagoon_mdss-v2-0-5def73f50980@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v2-0-5def73f50980@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1682029879; l=884;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=evqQGLlTFOqHDOuiOF22m7xaO9yZbbtIXtz5YEiBVu0=;
 b=fwJivKHapHtCQymUF6p9dE6yEgcAcMF20Cmrb7Mbb0/7cBIbuYECeiyai+qF+fsnSn/sBz3WaMRJ
 hzP05E9EDpr2STBp7wbUGqCGO5QmuBw56ySUAbFzHTnr6Xh3ffb8
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v2 12/13] iommu/arm-smmu-qcom: Add SM6350 DPU
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
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 995ab5172883..2daaa600ac75 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -255,6 +255,7 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,sm8250-mdss" },
 	{ .compatible = "qcom,sdm845-mdss" },
 	{ .compatible = "qcom,sdm845-mss-pil" },
+	{ .compatible = "qcom,sm6350-mdss" },
 	{ .compatible = "qcom,sm6375-mdss" },
 	{ }
 };

-- 
2.40.0

