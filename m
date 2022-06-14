Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F83354BE02
	for <lists+freedreno@lfdr.de>; Wed, 15 Jun 2022 01:01:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E28E910FDF8;
	Tue, 14 Jun 2022 23:01:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0923010FC41
 for <freedreno@lists.freedesktop.org>; Tue, 14 Jun 2022 23:01:38 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id o6so8966702plg.2
 for <freedreno@lists.freedesktop.org>; Tue, 14 Jun 2022 16:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RWlMcK/WiHaE2lupDQgc+icrhgmdMQxgOsPbDDDl0aE=;
 b=rxZaCTVb83tYMLMGAxqk8WP2FjGYRIoCovnvFYKSSOhMElgtlaDdZdSZMKPgSK4Yvo
 rC52cpeIJXo1GGTArDPxTrvH2g0j3p7QIUY5w78AbPKw2KsYXheKA8zc25on4qL9jc7k
 Pux+AQFyh9bQxZS2Av8mD7rxozr+inA00Hb7dAzDh+Di3oqIzFrchKq0vkDUvlbHaxek
 DRfGsep2dsYUDMjpJWrl4htAQKqUQVJIsWTNYxGeAn5KVIyPZqHF/KFc4lT4YMeLJIf5
 ry7iVS607W8w4IYMtJIee9psu43QKUIBJbDZIHwrUeV5l21LlnXFp0dg9U3JNTJh/a2F
 me6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RWlMcK/WiHaE2lupDQgc+icrhgmdMQxgOsPbDDDl0aE=;
 b=P8HJ/NNcyj2IZYtLnyTgH0sZx0SuTuBi/+hcAuGBYiygv5Dr4u8CSskKcRgalfSpIO
 5NRIuzjR6PcIm1tTr/8Zg1fn3DCoaVruLaEgkEI7WFEKyZElgaMXcTzgXs1WRpcpiaVq
 CALn48c5vRwhGQBiPcslWgUZu8jV+sLjbFQWP3iOyR7aZCI2RTTI60OuKts7g+/9fkwR
 QHMhfNHtHEYrL+bBpWKi0VXReM/nryFdAMM+yqXhDbzlm9roz6TjQyLayYs3FYtPfYa9
 I+KPsSAeFfxMOOTVjrCmmQS7X/uQZnXecvA6eK0rj4ncJGwMNn//oHe4ntbLXKoib6GQ
 RLqg==
X-Gm-Message-State: AJIora89QhmZteqV5jNIYqDDEVrNDqYGCX5dyTmB7O5pxFEsfvd8Fzdy
 CXbL97nGAqQt3vhnVLAzJSa47A==
X-Google-Smtp-Source: AGRyM1sug/F5zUgorGwld6/cvjxSjJ3Ba76jZNwLVen3RaltHSazhsqEJzh8eunYtM28ILlpP5FJ5Q==
X-Received: by 2002:a17:90a:a605:b0:1ea:6b4f:915e with SMTP id
 c5-20020a17090aa60500b001ea6b4f915emr6825913pjq.60.1655247697545; 
 Tue, 14 Jun 2022 16:01:37 -0700 (PDT)
Received: from wildbow.anholt.net (97-115-79-125.ptld.qwest.net.
 [97.115.79.125]) by smtp.gmail.com with ESMTPSA id
 cp15-20020a170902e78f00b00168c5230332sm7787768plb.148.2022.06.14.16.01.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 16:01:37 -0700 (PDT)
From: Emma Anholt <emma@anholt.net>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Jordan Crouse <jcrouse@codeaurora.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>
Date: Tue, 14 Jun 2022 16:01:35 -0700
Message-Id: <20220614230136.3726047-1-emma@anholt.net>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 1/2] iommu: arm-smmu-impl: Add 8250 display
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
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Emma Anholt <emma@anholt.net>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Required for turning on per-process page tables for the GPU.

Signed-off-by: Emma Anholt <emma@anholt.net>
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

