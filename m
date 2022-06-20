Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FB5552405
	for <lists+freedreno@lfdr.de>; Mon, 20 Jun 2022 20:36:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A25D610F008;
	Mon, 20 Jun 2022 18:36:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E83E410EE71
 for <freedreno@lists.freedesktop.org>; Mon, 20 Jun 2022 18:36:45 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 b12-20020a17090a6acc00b001ec2b181c98so9912038pjm.4
 for <freedreno@lists.freedesktop.org>; Mon, 20 Jun 2022 11:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dYnEPoGZqfZYJAuPegqx++UzPWjcPYHxQtwczgOEqOY=;
 b=j27uV95QDHmh28z29YzfPn3mYVjgQeD4AjLpoagSqW19OAWVkRFOHjYUOCslMxwhqS
 8lw/4ul9kFOZw8r+4NfjnLyke4Ov1rf8JPUzzFfx2oPJU1GcZHlLopjosMj5XGo3nvUu
 ep4bc9OllPhyOPJ/95NZh5DTjYq3MXOjlURHmycUaCYajuixGmRxiCia5GFA3yo3JMuk
 3WFrf8GZ2yGDYglM9CNwrlf0gkpbcAVQ/hlVXD7L0hBLUFBsrDcrbDz+wnEK/0ixHu8L
 h2pPMd3Jhe4fy/M+xWzMzstO7ugktrNpSJCtX9eZUIdySavMl3jHcZy7PJt+Mgcqu5ec
 Efgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dYnEPoGZqfZYJAuPegqx++UzPWjcPYHxQtwczgOEqOY=;
 b=PD9oXf4lUGuglLO3bvWG/WOK8K0EzLnii1JqYLgYL9ijPyIjlx7QqOFLINCgexv6Zl
 n2EGCl9h5QP018tV7OZZwdBgpIdWJ6EehPlmDIndwcUhx3Ou06lUr5wG06BIqZ+X43YT
 9xA8ZXsaHLZZSMfva4vvu5kvU74mZ7TVVycWxFzcuyX/CD7FJ4+FF5qT6UPhW8BYZz8p
 LMC49e9x6kRPei4Zg12H1RbiwqmbBdeSTZBuzjkxc0v1MT3KvOkkTWuYZoYM7HFhDHFk
 D3MAeyTfpTHljkOG3lMyQxV/p5eFr0UR9vqkuxD5mRaWBMclVqh8Kf1ojcaFR6IQgOI+
 vlog==
X-Gm-Message-State: AJIora8v5jDnGcm5SlxJvC+xMojd1coxPcpTiS3w1q+PQU+rhFdawxXw
 UUUL3z8OE25b8c3jJ2vaCAc0Mw==
X-Google-Smtp-Source: AGRyM1uz/6Ko3AqqWsTQqB/KJYqsG9FJzSMzyl3BFf9B5wef0b4KsUd6G43yzj9L9DvutkGyCDta0A==
X-Received: by 2002:a17:90b:3b8a:b0:1e2:ee1e:6340 with SMTP id
 pc10-20020a17090b3b8a00b001e2ee1e6340mr28501640pjb.38.1655750205525; 
 Mon, 20 Jun 2022 11:36:45 -0700 (PDT)
Received: from wildbow.anholt.net ([97.115.187.17])
 by smtp.gmail.com with ESMTPSA id
 ds12-20020a17090b08cc00b001e0c1044ceasm8500041pjb.43.2022.06.20.11.36.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 11:36:44 -0700 (PDT)
From: Emma Anholt <emma@anholt.net>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>
Date: Mon, 20 Jun 2022 11:36:32 -0700
Message-Id: <20220620183633.1131760-2-emma@anholt.net>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220620183633.1131760-1-emma@anholt.net>
References: <20220620183633.1131760-1-emma@anholt.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 1/2] iommu: arm-smmu-impl: Add 8250 display
 compatible to the client list.
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
Cc: Emma Anholt <emma@anholt.net>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Required for turning on per-process page tables for the GPU.

Signed-off-by: Emma Anholt <emma@anholt.net>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index d8e1ef83c01b..bb9220937068 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -233,6 +233,7 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,sc7280-mdss" },
 	{ .compatible = "qcom,sc7280-mss-pil" },
 	{ .compatible = "qcom,sc8180x-mdss" },
+	{ .compatible = "qcom,sm8250-mdss" },
 	{ .compatible = "qcom,sdm845-mdss" },
 	{ .compatible = "qcom,sdm845-mss-pil" },
 	{ }
-- 
2.36.1

