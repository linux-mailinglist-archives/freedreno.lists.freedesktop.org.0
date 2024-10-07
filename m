Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE17993B47
	for <lists+freedreno@lfdr.de>; Tue,  8 Oct 2024 01:37:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58DC810E446;
	Mon,  7 Oct 2024 23:37:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OMZGjC3i";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41BDD10E442
 for <freedreno@lists.freedesktop.org>; Mon,  7 Oct 2024 23:37:13 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-53992157528so5327379e87.2
 for <freedreno@lists.freedesktop.org>; Mon, 07 Oct 2024 16:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728344231; x=1728949031; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=tXGWJXNTWFyBHQiOjJ39OoJK5jFoxYtKruKryESO2Ts=;
 b=OMZGjC3idjJQAVtwkzehli5Ni9ZwAJIxGsGOFThCU4j6X873oXTcRNLVeQkjj65W1M
 joz89pdUXoaOxuWR4KahoIaL+zaHo+0lkYfLAXQAoT3M5KvLzGhmdSTmxwxaq73Lv4z2
 x174F3XWzTiIwuLaJBg7K0iChLLqf/S5+9oalijzToo45jkdctn4JjoLHR4qrTrKRarO
 8j30WwkK7NpPLbmNijQLiRqB81Oo1hYJSp5phVQ4aiJ0ul3yDYmWr9lFzOHeAK4w33ba
 mROIVp61gJUcxKkrUyg2Xo/cWbpwVlWHM252BFRahgvYqQwdjFSCw4vCjtEmeV1Z2UAr
 /e5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728344231; x=1728949031;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tXGWJXNTWFyBHQiOjJ39OoJK5jFoxYtKruKryESO2Ts=;
 b=mRH1ScLX8ssTxe+VpIM3m5g0Trekp3nDRFDf4A599D4xxg4SqAarCW7BABHVdcNKU9
 KNndJKRk5U+hcxF5ZxocSzLhHblTuFSGlA4P9ttMhGICQhlbDc5VrmODwICLP2rwN3ZP
 yYshhXoFfchg6JKtPURCp1qz0lIN6Zz92NyY9+dMwx/lpUlwMqrg9mbaaa3vyVZEZpxM
 IzUjkd43j8WjJvTl02w+GulRPLFi5+sEsvQogp5Ixv+c4ga4rKm2bbTLgFTnlTWXpF6E
 zD1Ra5zgo2zZ/G3hRDfydXpS9u9R6j1YabY3Zj9722Hexmd+7pJdYosmjlU0QQzAmquC
 S54A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUp/82j01TSceDHj3F3gAb1vy+KiAke+Cs4P5pvi9KFik46rWijgufHVWaTD2ICBNl8K0mG5Z38J4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwT2waO85OeURF73DrTeZcDIRcPXNNkwKe1B0K4Hix2QykwWIQw
 lj9IL15xGNWFfk/eI7PX2CzQDW1J9m+BQirC89gJaNhGtJbEYUUXyCuxs5Wq2Yo=
X-Google-Smtp-Source: AGHT+IE+4VzcRhbm1VFqYCLGq2Nrkh1v+z8RzQxhbXAwdRI0uxpOV12A3qgzgle5GzStCLctDb2jwA==
X-Received: by 2002:a05:6512:b14:b0:536:53f0:2f8e with SMTP id
 2adb3069b0e04-539ab9dd5f6mr6662392e87.37.1728344231168; 
 Mon, 07 Oct 2024 16:37:11 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539afec1300sm1002256e87.17.2024.10.07.16.37.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2024 16:37:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 08 Oct 2024 02:37:00 +0300
Subject: [PATCH 2/2] arm64: dts: qcom: sm8650: correct MDSS interconnects
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241008-fix-sm8x50-mdp-icc-v1-2-77ffd361b8de@linaro.org>
References: <20241008-fix-sm8x50-mdp-icc-v1-0-77ffd361b8de@linaro.org>
In-Reply-To: <20241008-fix-sm8x50-mdp-icc-v1-0-77ffd361b8de@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org, 
 stable@kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1619;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=znBSTsvoia8jtv0vOla1luWvWrIdThhCQ3A7+DTU46M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnBHCeZFq3YI77GP+xE8vYq8jrRhjgLpkER4n3s
 EJe/us/uoCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZwRwngAKCRCLPIo+Aiko
 1S+ZCACjueCogk9kziFFtp2pQBwNgoEJIQOWFaoFCx6WssaAdkVv7aXZZB9N9+b8VXHEpE2XPfd
 bmvT9i3GzdC+IxJDCl6EjWpnP6MRhvvu+eZaBaIZtkr+MrW+o2BsXiHFt+rcwGzu6qiU4Q1iWYT
 N0jvH556UF45CesUsd/Pjr8oeL8E0ASt2e3/V8NTiujHTAoBUdEsOKvknFW5k3ZPWEA4LgpFYPS
 vXUn6zzsTVsuz3YXzGsuiQEtvrvSpfvENMd2JTix0FNJqLIN9iFuXd7mqWkzCBNel66CHeBgsqk
 W6kyjEqsoVwA/oQxEnmlq1+uggMQ14WFVo+gCL0TaqKxBKWS
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

SM8650 lists two interconnects for the display subsystem, mdp0-mem
(between MDP and LLCC) and mdp1-mem (between LLCC and EBI, memory).
The second interconnect is a misuse. mdpN-mem paths should be used for
several outboud MDP interconnects rather than the path between LLCC and
memory. This kind of misuse can result in bandwidth underflows, possibly
degradating picture quality as the required memory bandwidth is divided
between all mdpN-mem paths (and LLCC-EBI should not be a part of such
division).

Drop the second path and use direct MDP-EBI path for mdp0-mem until we
support separate MDP-LLCC and LLCC-EBI paths.

Fixes: 10e024671295 ("arm64: dts: qcom: sm8650: add interconnect dependent device nodes")
Cc: stable@kernel.org
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 01ac3769ffa6..455774516b08 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -3455,11 +3455,8 @@ mdss: display-subsystem@ae00000 {
 			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
 
 			interconnects = <&mmss_noc MASTER_MDP QCOM_ICC_TAG_ALWAYS
-					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>,
-					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ALWAYS
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-			interconnect-names = "mdp0-mem",
-					     "mdp1-mem";
+			interconnect-names = "mdp0-mem";
 
 			power-domains = <&dispcc MDSS_GDSC>;
 

-- 
2.39.5

