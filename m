Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F561616CCB
	for <lists+freedreno@lfdr.de>; Wed,  2 Nov 2022 19:44:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AC9B10E560;
	Wed,  2 Nov 2022 18:44:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C30A10E560
 for <freedreno@lists.freedesktop.org>; Wed,  2 Nov 2022 18:44:24 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id b9so11206017ljr.5
 for <freedreno@lists.freedesktop.org>; Wed, 02 Nov 2022 11:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tgMhdFkKLkhPhfVCNQ6+pSsp5VjoW+jEZtcFsBXxEx4=;
 b=FksAD5v1C/TpK1XjS0IBQ4/8HsPn7ot3DprBWYnIB9syyukB4rLZPBb6tA0YZm2tdv
 mnMaDUlUVzzxEOuHjhj0E0xDth/1mrNzQZySXRXjYKDLaqJdoW4gPEJutPuOOw0mBRhu
 QBnxD5QgfCDrbOm43ALL0L3iFoGFeMmdijmI4pGEMGLC2PgBo/rLjrpnc3g8009OSv3c
 JqiPmvd04K1mi86IKSyGp524T3D0UQn/ssEOWsDEIqHJeX14TNdIeWk8096C7KRdK7Es
 OPwK7kUcb3JKonk2wxDfSNMC9vltEt78EzvAYfbF3yi4VJ1BzX+t5KNwx232jXnz+9mJ
 7+hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tgMhdFkKLkhPhfVCNQ6+pSsp5VjoW+jEZtcFsBXxEx4=;
 b=ZhVdnaL2VK6+zYfYmLuGRZ/IxY6k8UEJ4hPoJebDx3MdHGrZfhXpQtRM+uHO/sq28f
 Our3P8IeoXhE5Zx9xbGV/Qh1b+H8kASoQEhXO+/kWujOwmW56r4wOud2GyC7axPii2hB
 +4VVCX8AiUBSuzHzukpvdIRZw1mdEhPWWEXeSD3EaIsXC8Ufehf+8zRdBHwX+Q5HIyY4
 dYI3s8ic4SzVLrGKcVhrEWJqekDiSuIZqlE2xxDxJKC/e7gEmp5zLovaxNG7ws3IJi+r
 o6kzRtE0ibNQd28bAGZiZHQ1SaWHUXmvuydKyQv1l0hAyrO5bvcnvRkgCohpxEV7y/e7
 YWVQ==
X-Gm-Message-State: ACrzQf0c9h1HyPRFVFAVBejUEoUDIKo0gNbLPuUEGMgx+OIeqr6DrpBA
 PVIM7pfDUB76y1dHz3vBBSYyFA==
X-Google-Smtp-Source: AMsMyM4QRl5werbPkUscSIzc2q729LvDrgthZOrKbD+rv3ezGvOX+tkpxYFYAI/j+MoIwm7qkGu0zg==
X-Received: by 2002:a2e:834c:0:b0:277:24e1:7b80 with SMTP id
 l12-20020a2e834c000000b0027724e17b80mr9314376ljh.302.1667414662496; 
 Wed, 02 Nov 2022 11:44:22 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a05651c204800b00277092c03e7sm2277540ljo.33.2022.11.02.11.44.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 11:44:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>
Date: Wed,  2 Nov 2022 21:44:10 +0300
Message-Id: <20221102184420.534094-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221102184420.534094-1-dmitry.baryshkov@linaro.org>
References: <20221102184420.534094-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PATCH v2 01/11] arm64: dts: qcom: msm8996: change
 order of SMMU clocks on this platform
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
Cc: devicetree@vger.kernel.org, Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
 linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
 Vinod Koul <vkoul@kernel.org>, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Change order of SMMU clocks to match the schema.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 31 +++++++++++++--------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index c0a2baffa49d..9331327678d8 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -2205,9 +2205,9 @@ adreno_smmu: iommu@b40000 {
 				     <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>;
 			#iommu-cells = <1>;
 
-			clocks = <&mmcc GPU_AHB_CLK>,
-				 <&gcc GCC_MMSS_BIMC_GFX_CLK>;
-			clock-names = "iface", "bus";
+			clocks = <&gcc GCC_MMSS_BIMC_GFX_CLK>,
+				 <&mmcc GPU_AHB_CLK>;
+			clock-names = "bus", "iface";
 
 			power-domains = <&mmcc GPU_GDSC>;
 		};
@@ -2272,9 +2272,9 @@ mdp_smmu: iommu@d00000 {
 				     <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>;
 			#iommu-cells = <1>;
-			clocks = <&mmcc SMMU_MDP_AHB_CLK>,
-				 <&mmcc SMMU_MDP_AXI_CLK>;
-			clock-names = "iface", "bus";
+			clocks = <&mmcc SMMU_MDP_AXI_CLK>,
+				 <&mmcc SMMU_MDP_AHB_CLK>;
+			clock-names = "bus", "iface";
 
 			power-domains = <&mmcc MDSS_GDSC>;
 		};
@@ -2292,9 +2292,9 @@ venus_smmu: iommu@d40000 {
 				     <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>;
 			power-domains = <&mmcc MMAGIC_VIDEO_GDSC>;
-			clocks = <&mmcc SMMU_VIDEO_AHB_CLK>,
-				 <&mmcc SMMU_VIDEO_AXI_CLK>;
-			clock-names = "iface", "bus";
+			clocks = <&mmcc SMMU_VIDEO_AXI_CLK>,
+				 <&mmcc SMMU_VIDEO_AHB_CLK>;
+			clock-names = "bus", "iface";
 			#iommu-cells = <1>;
 			status = "okay";
 		};
@@ -2308,10 +2308,9 @@ vfe_smmu: iommu@da0000 {
 				     <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH>;
 			power-domains = <&mmcc MMAGIC_CAMSS_GDSC>;
-			clocks = <&mmcc SMMU_VFE_AHB_CLK>,
-				 <&mmcc SMMU_VFE_AXI_CLK>;
-			clock-names = "iface",
-				      "bus";
+			clocks = <&mmcc SMMU_VFE_AXI_CLK>,
+				 <&mmcc SMMU_VFE_AHB_CLK>;
+			clock-names = "bus", "iface";
 			#iommu-cells = <1>;
 		};
 
@@ -2336,9 +2335,9 @@ lpass_q6_smmu: iommu@1600000 {
 		                <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
 		                <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>;
 
-			clocks = <&gcc GCC_HLOS1_VOTE_LPASS_CORE_SMMU_CLK>,
-				 <&gcc GCC_HLOS1_VOTE_LPASS_ADSP_SMMU_CLK>;
-			clock-names = "iface", "bus";
+			clocks = <&gcc GCC_HLOS1_VOTE_LPASS_ADSP_SMMU_CLK>,
+				 <&gcc GCC_HLOS1_VOTE_LPASS_CORE_SMMU_CLK>;
+			clock-names = "bus", "iface";
 		};
 
 		slpi_pil: remoteproc@1c00000 {
-- 
2.35.1

