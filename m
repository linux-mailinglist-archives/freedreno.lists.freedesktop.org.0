Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF625E8A74
	for <lists+freedreno@lfdr.de>; Sat, 24 Sep 2022 11:01:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A41B10EC0F;
	Sat, 24 Sep 2022 09:01:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A64A10E557
 for <freedreno@lists.freedesktop.org>; Sat, 24 Sep 2022 09:01:15 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id c7so2357658ljm.12
 for <freedreno@lists.freedesktop.org>; Sat, 24 Sep 2022 02:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=PvODwQsClbAheS5ZXq5eRU2TCXD9zS/IOaEPEmqSeEs=;
 b=YnoLM0y8AhGG9ToxHsUlnsYxMNsaLZxpSlgp7WGtpNa6PZ6o3wi8hAmx+WXxKZSkSu
 lRGSMq69N61RNGainjYUAGwZsF3XhUytQzKNtq0XBuMcvNEM7xaAlRL2/bqORnlzyMJD
 RSxiz5MRxcc7taFMNG8iMXPKKtdaZGqTYpt8qG+Gee+pu+OLhpV3dvPE3h/G340a6arG
 WqxpiO87de9brfH2Y+qA0xnLOC4J+6YAOPhPz5KXQJNcOVdKgOpjcPUq2VzYRlQX3fDv
 DV2c0rZi7cduJ7k0as8lGCHDpRUjrSnTN+3G01izuN+2AWuXLTIgTPdSIORHKVTWHJcG
 kjwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=PvODwQsClbAheS5ZXq5eRU2TCXD9zS/IOaEPEmqSeEs=;
 b=ezHGeYJrGYSb6NPgqtkGu8zYZgDjwujHdh9qUm0G+S1CanqetTEqFmHTdU/PL54IZK
 53T0TGgfKsjSDuYPdtnpyJ6jakJlSfH+3l/YXSoIhnARF4XS5OAJzdMW4f3R50tsy5yN
 5e3UgulJXrRI7C+xD0G/h43CIQlA/vD+2Bl+T3WhIYccviFMFc2f0G71ru/IYgdJpmMn
 zwHzBrqokJtKd4IkwBbBM2AzQV8kQzyOrtzwbUtYWNuse6QFIZE+hV8YPf63AZZQ7dzr
 hhjMtndvkTnkzhZ0/REfRk+YCuDKvfgatsB7fR00fLxenO5YJmEGMnwyGdXMMcZI4Avd
 5DYQ==
X-Gm-Message-State: ACrzQf2RYHe4x/GT06DIGUqyeiLdTyFg3wz8w66Q5i2XeRqgYo2fVArZ
 7JZ8cCLDFDck+OHa5N+rCMZd3A==
X-Google-Smtp-Source: AMsMyM4fBEsoQRvqBRVpB3PfI7JBuZLag/KTlUsaqinmzb5YVo0OIT8IaaJB8tuIjyiIGtafJ+ofjw==
X-Received: by 2002:a2e:86cb:0:b0:26b:ff26:ebf3 with SMTP id
 n11-20020a2e86cb000000b0026bff26ebf3mr4076366ljj.445.1664010073478; 
 Sat, 24 Sep 2022 02:01:13 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 o4-20020a198c04000000b0049f54a976efsm1830024lfd.29.2022.09.24.02.01.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Sep 2022 02:01:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Sat, 24 Sep 2022 12:01:04 +0300
Message-Id: <20220924090108.166934-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
References: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 5/9] arm64: dts: qcom: sc7180: change DSI PHY
 node name to generic one
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Change DSI PHY node names from custom 'dsi-phy' to the generic 'phy'.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index b82c335c25af..0002d92eb29b 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -3057,7 +3057,7 @@ opp-358000000 {
 				};
 			};
 
-			dsi_phy: dsi-phy@ae94400 {
+			dsi_phy: phy@ae94400 {
 				compatible = "qcom,dsi-phy-10nm";
 				reg = <0 0x0ae94400 0 0x200>,
 				      <0 0x0ae94600 0 0x280>,
-- 
2.35.1

