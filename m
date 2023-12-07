Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E123808885
	for <lists+freedreno@lfdr.de>; Thu,  7 Dec 2023 13:55:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C679810E899;
	Thu,  7 Dec 2023 12:55:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFE4510E06A
 for <freedreno@lists.freedesktop.org>; Thu,  7 Dec 2023 12:55:05 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2c9eca5bbaeso8301591fa.3
 for <freedreno@lists.freedesktop.org>; Thu, 07 Dec 2023 04:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701953704; x=1702558504; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j5KSmEP1TGocOwJYVVwYZKa9nj2Hg1ok92vdy7xwTe8=;
 b=axDE9QT8SaHuEXkttAKMOogsaFAw3fYTwfsLyE9KowfIKNNvIp2FLHWydOLi1pnZng
 HBw1J2XGJ6op0iHgNzYpnMBOoTkP3/KVEJ7vA6CL6kkoa2WeyiUtVFYmfKn0C2KtYAll
 pAwZ5nT6Dwj2fHY9Xf0XEDdktRuYYlfY5mWh88TDHIxdpLggbgnloL3gvqkPZHQQelWt
 eDInYkGkY2Nuiu8JktaSpAEDO94XaOLoY/uofnsWVGFLqO9YX10tj1QPGYt7/h2tpLuL
 dDJYuSkKIwZtQQyhbjeuYIO5+GNK3ghagFUxpmYeawKv53iYUqyXsSWqTmuMesWhE51R
 41Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701953704; x=1702558504;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j5KSmEP1TGocOwJYVVwYZKa9nj2Hg1ok92vdy7xwTe8=;
 b=G8LqnpacfTiLL88ACqT2R1ddIgaKL4tVST5QfQ4fpsjPRTm5w3QchSgUIRKsydSbAf
 qD0t1uFIdFFYzPzBgJ758FUaa6VCWz9MQeEjUmrbHs/BrpfT0y6CfKb1P+HARAhISyV3
 kuO0h84vvaIRP9oQ3icPX9cg85WljO8HhOkLzE4CkxAiAq5ZVC0cTzQs1FMNwmdeqH9f
 NfMAJc5bZ0ghec9/mBDWKK8bzoIOzNkWoIR2srG7PAqCftzbT1hvYg4vAE7nGvEAB3FZ
 3XxHJ0u0tLTYP87FK6yPx2QfYs2yCM+4ypH3vRCp4XknLUdO99IkztDO/r5oawtJRM+w
 IhVQ==
X-Gm-Message-State: AOJu0Yx0XuZ1bMTp8oisDmVAW9BPR/W7zeUtxuR6/gwpzz450jAA3bbW
 AzuohkOOIv3C5lqFZAKbXxaqUw==
X-Google-Smtp-Source: AGHT+IEPd3y1di3O6hl7akm24VuD+UvFlBj59LsViuKsxVfNbyodkQMJ3vhlHaDmvfNAZZhg7vxVeA==
X-Received: by 2002:ac2:538b:0:b0:50b:f881:862a with SMTP id
 g11-20020ac2538b000000b0050bf881862amr704995lfh.128.1701953703825; 
 Thu, 07 Dec 2023 04:55:03 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 cf30-20020a056512281e00b0050bfc6dbb8asm163659lfb.302.2023.12.07.04.55.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 04:55:03 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>
Subject: [PATCH 3/3] ARM: qcom: merge remaining subplatforms into sensible
 Kconfig entry
Date: Thu,  7 Dec 2023 15:55:00 +0300
Message-Id: <20231207125500.3322229-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231207125500.3322229-1-dmitry.baryshkov@linaro.org>
References: <20231207125500.3322229-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Three remaining Qualcomm platforms have special handling of the
TEXT_OFFSET to reserve the memory at the beginnig of the system RAM, see
the commit 9e775ad19f52 ("ARM: 7012/1: Set proper TEXT_OFFSET for newer
MSMs"). This is required for older platforms like IPQ40xx, MSM8x60,
MSM8960 and APQ8064 and is compatible with other 32-bit Qualcomm
platforms.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/Makefile          |  4 +---
 arch/arm/mach-qcom/Kconfig | 13 +++++--------
 2 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 5ba42f69f8ce..45fa8ac001c5 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -158,9 +158,7 @@ textofs-$(CONFIG_ARCH_REALTEK)  := 0x00108000
 ifeq ($(CONFIG_ARCH_SA1100),y)
 textofs-$(CONFIG_SA1111) := 0x00208000
 endif
-textofs-$(CONFIG_ARCH_IPQ40XX) := 0x00208000
-textofs-$(CONFIG_ARCH_MSM8X60) := 0x00208000
-textofs-$(CONFIG_ARCH_MSM8960) := 0x00208000
+textofs-$(CONFIG_ARCH_QCOM_SMEM) := 0x00208000
 textofs-$(CONFIG_ARCH_MESON) := 0x00208000
 textofs-$(CONFIG_ARCH_AXXIA) := 0x00308000
 
diff --git a/arch/arm/mach-qcom/Kconfig b/arch/arm/mach-qcom/Kconfig
index 27d5ca0043be..0c99d0a746d4 100644
--- a/arch/arm/mach-qcom/Kconfig
+++ b/arch/arm/mach-qcom/Kconfig
@@ -15,13 +15,10 @@ menuconfig ARCH_QCOM
 
 if ARCH_QCOM
 
-config ARCH_IPQ40XX
-	bool "Enable support for IPQ40XX"
-
-config ARCH_MSM8X60
-	bool "Enable support for MSM8X60"
-
-config ARCH_MSM8960
-	bool "Enable support for MSM8960"
+config ARCH_QCOM_SMEM
+	bool "Reserve SMEM at the beginning of RAM"
+	help
+	  Reserve 2MB at the beginning of the System RAM for shared mem.
+	  This is required on IPQ40xx, MSM8x60 and MSM8960 platforms.
 
 endif
-- 
2.39.2

