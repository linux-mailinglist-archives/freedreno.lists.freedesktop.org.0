Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2144856CDE0
	for <lists+freedreno@lfdr.de>; Sun, 10 Jul 2022 10:41:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D83811BE88;
	Sun, 10 Jul 2022 08:41:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CC0A11BE7A
 for <freedreno@lists.freedesktop.org>; Sun, 10 Jul 2022 08:41:38 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id m18so4215026lfg.10
 for <freedreno@lists.freedesktop.org>; Sun, 10 Jul 2022 01:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0RS04L3t2B9fDxy6bqcgfJbhi5mc1B07nUo3XEHnZLI=;
 b=eT0dBRFTsi6+MKJcfryHjQtRpNGIuEQUaOdgTzTP4lSTRfBNsed2GY+0l7K92llRQT
 t70V5Dt8wZI2B4I+yjnOy+HMoHYAp60aySfT49Z3rx4JqutUW2xx3PsIw2hvAvgn5b/L
 sKrsEmc5tFoXgbHdsupyVJuxcdjJi8nuYqGeZ04rsOqMi+xoqqn9E9XrrC0Alq4O6l0L
 /ve16DHUDmC5TTDH8tyWRseIFO0wwH6nWF2bhoQ5v3vqXpLOEYqoovMGEEvmqJbx7sP7
 teQu1ZeiEtprQfnEgyLuvDoZN1BhvA9CDcuQX95OMynxlCE24DXk5uucv/p9bDefTwRh
 4Vkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0RS04L3t2B9fDxy6bqcgfJbhi5mc1B07nUo3XEHnZLI=;
 b=18aXMahEmA2CO9daqJanpl5/C7yWUrEP+GyVU6PeCQmrb6B+DpJXY9l/BPrIe9ptJl
 GDHZtvmP3x33XDQlDiiEHI0n5F/yCP/BYVv5PJE+rHs0WIVq9pQGgzlHCZL4BCLh3llq
 rhmyT5hfIIeC4WA0HA0/yNX/0+SWin6rL3QMnQu2i2WZU9NKnVp71OHkeJjaFYsZu0RU
 7IyI1QZSWcgCEA+W14fJCMMy9MPwn4IWTeCGbrfU1Ccdo9VuFMb3oDO7hw6uQSjHVVoZ
 VcYDC1VRCk/rCMSSlMNG07sWvWCGEEnkvWOFma/cSjFZJJyg2X5j8PP6dcn4FFgT6fLK
 vGtA==
X-Gm-Message-State: AJIora9L0iYKRa5bcD8WiO1Hux27l1bD+GfOvOa8YCH6o5sbbYC0KFT6
 nF017QN8iHoVoai103unQMf97w==
X-Google-Smtp-Source: AGRyM1t+2cUnkeU4pfWfOR5f6jc/0AReGSLWhak70YmTyaCnmL/bCnDil/M3r1cKsxc4M8oiMsuvNA==
X-Received: by 2002:a05:6512:3995:b0:489:d974:33d3 with SMTP id
 j21-20020a056512399500b00489d97433d3mr1302885lfu.458.1657442496336; 
 Sun, 10 Jul 2022 01:41:36 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 i21-20020a2ea235000000b0025d4addbad4sm912536ljm.91.2022.07.10.01.41.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jul 2022 01:41:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Sun, 10 Jul 2022 11:41:25 +0300
Message-Id: <20220710084133.30976-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
References: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 1/9] arm64: dts: qcom: sc7180: split register
 block for DP controller
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
 Kuogee Hsieh <quic_khsieh@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Follow the schema for the DP controller and declare 5 register regions
instead of using a single region for all the registers. Note, this
extends the dts by adding p1 region to the DP node (to be used for DP
MST).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 47ce5787ed5b..875808cf0614 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -3080,7 +3080,11 @@ mdss_dp: displayport-controller@ae90000 {
 				compatible = "qcom,sc7180-dp";
 				status = "disabled";
 
-				reg = <0 0x0ae90000 0 0x1400>;
+				reg = <0 0xae90000 0 0x200>,
+				      <0 0xae90200 0 0x200>,
+				      <0 0xae90400 0 0xc00>,
+				      <0 0xae91000 0 0x400>,
+				      <0 0xae91400 0 0x400>;
 
 				interrupt-parent = <&mdss>;
 				interrupts = <12>;
-- 
2.35.1

