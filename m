Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0097F552408
	for <lists+freedreno@lfdr.de>; Mon, 20 Jun 2022 20:36:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1696010EEC8;
	Mon, 20 Jun 2022 18:36:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2588E10EEC8
 for <freedreno@lists.freedesktop.org>; Mon, 20 Jun 2022 18:36:47 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id 184so10974791pga.12
 for <freedreno@lists.freedesktop.org>; Mon, 20 Jun 2022 11:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cuXafal7oQMsPKjaUnSX0izJjoMCagq43H5IBdJoY/0=;
 b=HcNySfWkztX+IpyLdapmB5uQv+0HIWkTNMKKAUBo24pLvsbYdt0MhDUZ8AamP/aZZs
 2GiClOnQwtLaUHbNNgwZvIlNV1NxAv09YX1qM+M8ZsC+t+woA8HTL0xrUUVHTaXgQtFA
 8FBuTsB4XH9nq191ZTS4LYUooQk7H8oCGm9lmcuJSIiPLFVJ0s8wxOaDHR7c3PAHwUYk
 kkRkFNINd50B/k8Y+kWGdSjF7SLflNWx8DLSASQPsU02g3sr+8mEyVN+hHwDVzV9fGJ+
 iLaRwn7xGaqfvxbirLEalktbZwqgl36/g2RknT6Z1hinMikKYh5wNN89zPcWPQ4H9C2P
 uU4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cuXafal7oQMsPKjaUnSX0izJjoMCagq43H5IBdJoY/0=;
 b=W6jcN4H8ScopDi5vZDt8DfujQtrl46fcHSx3YbCHJ6/kihYpGRxjwi0Ax5aYMpbPsV
 CKRYh43b/rIEYLttJ0UyCVI6ZCTI4R4xUwwZl/aYIKucR4LY9VfFqPb6DhvJ9g8K3fyn
 E4ZUCK1O3fdyrM9jHVGHn3kR0YsyUkDs5iCKy42U0f0bfmeoXF+HUbMaIhQIvucQ1dmS
 UBdLgMb2haMcens09G4SLW7vJghhcK3nlIuIWHr+Hum3KN6Jdo4b6B9FZrGhcVU7eZDF
 TWWNoR9iZkBcGpwfLXj7nYqW6RZdG8K0ZgRK4NkaVbrhGOozde9Xwg89gZGfU1zC9L9p
 r92w==
X-Gm-Message-State: AJIora8exAMfn2ku0DOEHUIvYpqr8olEt1MBcSa/i2Ro+zqTxCNCpYFp
 rvCXP7cQYWQ77jUGp2acN5uJSQ==
X-Google-Smtp-Source: AGRyM1uaVMxPdAdbEkr6R5BXQkH4b9IPtINsC+QUA2arv2IQf8W7zqXF2oWl6/UIv0I4Iw1fk1cI2w==
X-Received: by 2002:a65:404c:0:b0:3c6:4018:ffbf with SMTP id
 h12-20020a65404c000000b003c64018ffbfmr23272611pgp.408.1655750206723; 
 Mon, 20 Jun 2022 11:36:46 -0700 (PDT)
Received: from wildbow.anholt.net ([97.115.187.17])
 by smtp.gmail.com with ESMTPSA id
 ds12-20020a17090b08cc00b001e0c1044ceasm8500041pjb.43.2022.06.20.11.36.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 11:36:46 -0700 (PDT)
From: Emma Anholt <emma@anholt.net>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>
Date: Mon, 20 Jun 2022 11:36:33 -0700
Message-Id: <20220620183633.1131760-3-emma@anholt.net>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220620183633.1131760-1-emma@anholt.net>
References: <20220620183633.1131760-1-emma@anholt.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 2/2] arm64: dts: qcom: sm8250: Enable
 per-process page tables.
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
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Emma Anholt <emma@anholt.net>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This is an SMMU for the adreno gpu, and adding this compatible lets
the driver use per-fd page tables, which are required for security
between GPU clients.

Signed-off-by: Emma Anholt <emma@anholt.net>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

v2: moved qcom,adreno-smmu earlier

 arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index a92230bec1dd..aae7b841b81a 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2513,7 +2513,7 @@ gpucc: clock-controller@3d90000 {
 		};
 
 		adreno_smmu: iommu@3da0000 {
-			compatible = "qcom,sm8250-smmu-500", "arm,mmu-500";
+			compatible = "qcom,sm8250-smmu-500", "qcom,adreno-smmu", "arm,mmu-500";
 			reg = <0 0x03da0000 0 0x10000>;
 			#iommu-cells = <2>;
 			#global-interrupts = <2>;
-- 
2.36.1

