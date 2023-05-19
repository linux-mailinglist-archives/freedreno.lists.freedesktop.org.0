Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3961D709D41
	for <lists+freedreno@lfdr.de>; Fri, 19 May 2023 19:04:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C65A310E600;
	Fri, 19 May 2023 17:04:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DC3110E600
 for <freedreno@lists.freedesktop.org>; Fri, 19 May 2023 17:04:53 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2af177f12d1so25182411fa.0
 for <freedreno@lists.freedesktop.org>; Fri, 19 May 2023 10:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684515891; x=1687107891;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6Cgx0VgjSWF36kTiyIdxe2LPUi4kT2lQKkyyJC5x69s=;
 b=IsY0da0u/JDDGZ3J9pfUfxvXvYtnLy1D+JtipBNPvBMtbtDtTz7HNBPcotwGkAmlfy
 PORzwnfF1eE1o74F4V53MF8I4B6xYtH+/1Qeh3ai0UEn3Jbg7koeCdcgjxciv4skpxKK
 Dd+OZTmBUhedVkMuG9TyM9xC6Tdma/4p8vFJNPL5zQJAICD7bqgmefISwx9CqL5EPLXd
 D4Nr8+FEO4bgOpv3+Xfx91X+dElds3dF083I77oRfdnjU5BfyOe6J+CN2+/rZxk+h23n
 Naxe+XT5eXF+9OG41/F/kawP49Vretx4AX4CFfC5mqxpFEdDmR9enO1+5bcPInK1F/k4
 j2XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684515891; x=1687107891;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6Cgx0VgjSWF36kTiyIdxe2LPUi4kT2lQKkyyJC5x69s=;
 b=BMJ7p51oWZkFbRw3YnVyworgwJipDXIA8ab75mQMS/UK1gVbMx/Ox5GXc9Uzp70VgN
 hHNG9+49Q1YjwtaDpPhJPaEPlsR7rdLr2nH21/aHNHJGzCYcXLO6OKZ/elxo3ccd1da6
 E49RJAJ249NeWFGSHeA5ySvMUEHkBGI2ew9tXJGwNB66WP4IUb+Vc3NbxnvmylgpL/0g
 Gqn7fF+m9fR5TTlfGkLdGZw9rwQgoMGYcg6YxbNQnb46mpVVvRTyfr1ergOywhdRpsNb
 7bl41B4ENW+cn/Ov0nLdh7vThqBRCvg67Jko6lYjSdy/exOKj/AeoW0Jkv7pnlwDJzFw
 eihw==
X-Gm-Message-State: AC+VfDzpJtJg8rzLC9ARNu3Owdhk3TeUfDwOfCuVpVBkapjCQZobLOj+
 ShNgAwciYah28hepcGsaYFgPBQ==
X-Google-Smtp-Source: ACHHUZ7Ds1+/AWoTFgM3T6UfzCXKF2mivsVSYkyWxs5tAN5cNPFGwbnFQ0oWsighigcXlZcHgEYaQA==
X-Received: by 2002:a19:f00a:0:b0:4eb:42b7:8c18 with SMTP id
 p10-20020a19f00a000000b004eb42b78c18mr963212lfc.53.1684515891515; 
 Fri, 19 May 2023 10:04:51 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
 by smtp.gmail.com with ESMTPSA id
 a6-20020a19f806000000b004f38260f196sm654478lff.218.2023.05.19.10.04.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 10:04:51 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 19 May 2023 19:04:32 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230411-topic-straitlagoon_mdss-v4-11-68e7e25d70e1@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684515870; l=919;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=hMmDD+SgonZLP46KBM866xQojXqpPqEZ25ow2fxLp/E=;
 b=R5FoZY4Lqorac7OGiiU0hCgTpb7/pGRuboSGxvm7lhbIzQY6O4CtC/NrOwAerHytiT6x+EkhV
 M+R6OmHtCA7AQ3JrOawU6BYsdkdEV6mk6MgjQ/tb3RtgeGijwLddrRa
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v4 11/12] iommu/arm-smmu-qcom: Add SM6375 DPU
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, iommu@lists.linux.dev,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add the SM6375 DPU compatible to clients compatible list, as it also
needs the workarounds.

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index f945ae3d9d06..d7d5d1dbee17 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -253,6 +253,7 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,sc8280xp-mdss" },
 	{ .compatible = "qcom,sdm845-mdss" },
 	{ .compatible = "qcom,sdm845-mss-pil" },
+	{ .compatible = "qcom,sm6375-mdss" },
 	{ .compatible = "qcom,sm8150-mdss" },
 	{ .compatible = "qcom,sm8250-mdss" },
 	{ }

-- 
2.40.1

