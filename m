Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCF26E9EFF
	for <lists+freedreno@lfdr.de>; Fri, 21 Apr 2023 00:32:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4650F10ED38;
	Thu, 20 Apr 2023 22:31:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA4D110ED08
 for <freedreno@lists.freedesktop.org>; Thu, 20 Apr 2023 22:31:40 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4ec81779f49so947115e87.3
 for <freedreno@lists.freedesktop.org>; Thu, 20 Apr 2023 15:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682029898; x=1684621898;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1Gx9hOgjws0YjXjWKNVHvwkPmSavQFOa1C9EN/R+wqo=;
 b=r69+OTvdPAJ4sKqvjR7kEd3QeVT7UrZWAtHfwc9VPuD4P23u0aKU04R04eI1I4vDhv
 ZLdrDuU/SUV972AzJsfmBa834BQ/eT8x3IKHJvnSaAchmOcUDNaly1SCgXKZdSTFmv/A
 XkqyQqJU707bQACaa4zhxHd6AQ54Bxzi2OCLHdhRnRLf2h940aCzSUSN9HaD+jKB4kKx
 IXstLdu1YaFPc+VJOKHFJQpYpS/QIMt/BJPvMLoEVPD0PKVRs4k/L/kDbUzt8EeRpl2y
 rUkgnfn1GHnqxWI72pKXIPH6Sk0KFQY3n2tAjaq2QxtzhU6GVA0HqL/S/hXiW861V0bI
 RGwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682029898; x=1684621898;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1Gx9hOgjws0YjXjWKNVHvwkPmSavQFOa1C9EN/R+wqo=;
 b=l+FBEty0nZ2r4p6JiC5nUuJrth3G/ISMwDI4YjWxMs1fYi9/ZH+ONy/sh6xCsleMid
 y3Br1mPdnh5jT5hN3ZrQAAdL1do7NUsBos39jloi53l1n6mLI7kSnUfPljwKlSsYnScy
 jsPCXSfYbOHe2IML2ioeIm9rBvyRzZQAdqBBzZaXZG8F0jlPfkaG34KIqImEoJUGgeuP
 JJVaaLk1UszuxKZCKLTEBAunNy4XCLxQs6+8cyMAImd4wXpW6R+Nt5v+6zVC9U1mCCeA
 3dcoOj9rIElUkkbo1G1lzRM3TOpq06owKd3Y2NF11IH4CJh3MSGESQsQbo0g7uSquJaC
 D2Vw==
X-Gm-Message-State: AAQBX9dumNmSHH/8jdi2UOChmZAKmRnEHNCxFZPgAQQYHpK/UBzGHzyz
 X7QC16C+ylNM2wXzZcuuvaP1xQ==
X-Google-Smtp-Source: AKy350agF//FITNbmTr+sk0Wqprb9qhtIJOjH7KH5TKwATYHuhXeon0c3RlBjUadrSwCnVZyDBKCMg==
X-Received: by 2002:a19:ad4c:0:b0:4e8:3b51:e7eb with SMTP id
 s12-20020a19ad4c000000b004e83b51e7ebmr826262lfd.7.1682029898488; 
 Thu, 20 Apr 2023 15:31:38 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
 by smtp.gmail.com with ESMTPSA id
 w8-20020ac25d48000000b004eedb66983csm324256lfd.273.2023.04.20.15.31.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 15:31:38 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 21 Apr 2023 00:31:19 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230411-topic-straitlagoon_mdss-v2-10-5def73f50980@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1682029879; l=1357;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=IZraHC2rKjwAxvGejhLYdH/8ZPnRD2vaDl4IpBKvSDs=;
 b=FP2ipxs5Nr8YDG41US/6zI6ekAMslR4vE0K4u7LOeT1EivuPnX1w5tKQTXEck12W9qVTOEtDivz3
 WuRS5/DZDjHC58OaEhn697/T/kdfsd1bZWmPg7vS1HYlJv1GAHpk
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v2 10/13] drm/msm: mdss: Add SM6375 support
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, iommu@lists.linux.dev,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add support for MDSS on SM6375.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 4e3a5f0c303c..f2470ce699f7 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -546,6 +546,15 @@ static const struct msm_mdss_data sm6350_data = {
 	.highest_bank_bit = 1,
 };
 
+static const struct msm_mdss_data sm6375_data = {
+	.ubwc_version = UBWC_2_0,
+	.ubwc_dec_version = UBWC_2_0,
+	.ubwc_swizzle = 6,
+	.ubwc_static = 0x1e,
+	/* Possibly 0 for LPDDR3 */
+	.highest_bank_bit = 1,
+};
+
 static const struct msm_mdss_data sm8150_data = {
 	.ubwc_version = UBWC_3_0,
 	.ubwc_dec_version = UBWC_3_0,
@@ -580,6 +589,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sc8280xp-mdss", .data = &sc8280xp_data },
 	{ .compatible = "qcom,sm6115-mdss", .data = &sm6115_data },
 	{ .compatible = "qcom,sm6350-mdss", .data = &sm6350_data },
+	{ .compatible = "qcom,sm6375-mdss", .data = &sm6375_data },
 	{ .compatible = "qcom,sm8150-mdss", .data = &sm8150_data },
 	{ .compatible = "qcom,sm8250-mdss", .data = &sm8250_data },
 	{ .compatible = "qcom,sm8350-mdss", .data = &sm8250_data },

-- 
2.40.0

