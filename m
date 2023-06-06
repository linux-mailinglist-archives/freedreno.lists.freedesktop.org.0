Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 650A07242BC
	for <lists+freedreno@lfdr.de>; Tue,  6 Jun 2023 14:44:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD3DC10E33F;
	Tue,  6 Jun 2023 12:44:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B12010E357
 for <freedreno@lists.freedesktop.org>; Tue,  6 Jun 2023 12:44:27 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2b15a327c20so73812311fa.1
 for <freedreno@lists.freedesktop.org>; Tue, 06 Jun 2023 05:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686055467; x=1688647467;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=71R2q19ZXsGZnOPocAOTBJ3+IZ1FZhz4Wl6PP95R9qE=;
 b=I8bal3u2MbL5N2wtAHwu70IeyshjqDHEG6e07z9uY66vw9fstpsDTVU/yXP/+3pU7s
 wO0H6Q+rw12fnt8EaLmOJiC95oWyxw3WB3DdPnoaCxwZWA/80UushCnOXdZX+VqSxYXX
 OuysNYXfN3SP2qfmickHoD56ST0CxDc9VFuq9IKwvkixzpZgdJPU+BINxK1jTrYsGHiM
 hPl4koRIiwslemS3vQy0NDzvKEPYK8bkv5BPj10GWB/rIsFl2a7RvoJvgrBUTmqebxHI
 NL413CB37yFJbklwP95xy+Jl2Zj3FHnlS+YYv2UI62cirRTab1rRUArQdwQo1+AeE8bW
 Ntjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686055467; x=1688647467;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=71R2q19ZXsGZnOPocAOTBJ3+IZ1FZhz4Wl6PP95R9qE=;
 b=YLdrzjQ3wyQDVOP/PLItVukKXmLW9gWEo681q/VydEChI0gsRkG8GhaCr/bWKydFaa
 8jOHzIaGMp+259QjRF8v+UYeL4DAaiw963vSH5am62Hv8LPI0O/VLQjBIrpW3tLo2dcA
 PgpCk/DWYnOp5SPT7RhYEz/u2qnBO9iv61i/bzZBbFIONAtTFizeooymZ9wfywqxndYE
 0aCtP3+27w8h4kxpq0/aCZAKcZrYg+32X+Gh0Xy0siGZP9bsfO6LSMehDFB57/TlJIlP
 1VrKUcGg8cjwhYrtmO3RfJKx8p2K+DNE7p6WsETCu73GNSoS0ggoqXMimfw1hWbBisqE
 FvbA==
X-Gm-Message-State: AC+VfDx3MlFXBxdL1rN1/oVTVyOfH1nhBq4ZDTiOeJ/8bAlDGhCMD6Yz
 mw7LoUtjxLOrzHuvOlcaXxR18A==
X-Google-Smtp-Source: ACHHUZ4c+yMvlAIdZkCiNRfIWyTpQZD41YEWXcpVJkwRTIOU6+57/WT/SEZI/YDq4XG3X0FHRp1KAw==
X-Received: by 2002:a2e:86c8:0:b0:2b1:bd11:a71a with SMTP id
 n8-20020a2e86c8000000b002b1bd11a71amr1161537ljj.17.1686055467141; 
 Tue, 06 Jun 2023 05:44:27 -0700 (PDT)
Received: from [192.168.1.101] (abyl150.neoplus.adsl.tpnet.pl. [83.9.31.150])
 by smtp.gmail.com with ESMTPSA id
 u23-20020a2e9f17000000b002a9ebff8431sm1830823ljk.94.2023.06.06.05.44.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jun 2023 05:44:26 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 06 Jun 2023 14:44:03 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230411-topic-straitlagoon_mdss-v6-12-dee6a882571b@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686055444; l=1014;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=CPO6pRkqp9OH9BXcQBO5PamnhFLC+q+SwQwF41wCtLY=;
 b=EpXSpLvNfkNwN2LETbMboB402kF8n6aEw8/3XRGdYE/p0jqbAcEhn9jwTJy9yIh5JXIvC2O2n
 Qgs41nBrZ/NBuK4rPGepMA17UT/akizQC5SR5/YqACBatIfFVMeJDPK
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v6 12/12] iommu/arm-smmu-qcom: Add SM6350 DPU
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
index cc574928c707..bdeb587552c0 100644
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

