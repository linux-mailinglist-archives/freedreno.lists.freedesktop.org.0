Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EA156CDF7
	for <lists+freedreno@lfdr.de>; Sun, 10 Jul 2022 10:41:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97A6911BFBF;
	Sun, 10 Jul 2022 08:41:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FFAA11BF2A
 for <freedreno@lists.freedesktop.org>; Sun, 10 Jul 2022 08:41:43 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id o12so421395ljc.3
 for <freedreno@lists.freedesktop.org>; Sun, 10 Jul 2022 01:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oNLGCTerIVU1NE0L2+9ZJZEaHYA06VymBP0XUK3FvOI=;
 b=f1xZvLdxIkr/qu2hjEDFS8sXYLdPm7Jtl0doodfayg3Vd0Wsfirqs5uPdAGaih45Bn
 jJaZ2nLWojWiJFP5bCZfyeUnHN22yuHH9Xe/YVxItgOa6egYddq/OJ43eby/JqyueMpJ
 MXS4oTxiCtadilu93wXnJz6ZJakP1PTK60Z27+9QZdNU7oZFBUN0kvGN3ZW7gHM3fNUS
 3gufFqAeuvwVWaP1M8IajxlauhOuUCfbTDYaBS/ezl612F6ruN9sVYbjFPNyD21yXd6g
 UhXEaWJGkq3HtsGfd53APbxKuk5GIZmAWoMvTZEbZjmA7sEjiDr9jHQla+GmY1qdk0to
 pRxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oNLGCTerIVU1NE0L2+9ZJZEaHYA06VymBP0XUK3FvOI=;
 b=XKAql9qqaJKkme37SgyKRmyx4/kAkmYfEyucNyQj9mrMeUeSq9PV9yAW3RYjBdxSDW
 w5kchZvT01vB4RVkie55R78x+D0BPZovCc0lW/Imt2rhmA7UIZtH7fvRQ/KmEY3W1iCl
 t37QtfV+0C7Vs8yCJqsHBUxVX9FJCnXRpCgUg0Ivqm7GTm661eHWpFb3v9GtaFUeTPpI
 OkkND2nio/GCP6c08X5uUh1wzox/7D2nfrl8qs0ombLo2sBuVH5x9h7d94rzn29B0Wfq
 9qSik+kHi42ONFW6wpOphiFLY1SJZF+dzIvsB7D10XABz75lYQ6YpkHa5FwGxKFTZnEW
 oD4Q==
X-Gm-Message-State: AJIora+wihEcj0WUl6LUdssSrXBEMYxpywkmBzhLZhRSUs7IuAOmPFrS
 pWQJzGMWN3ueoaQdmwVbisLC6w==
X-Google-Smtp-Source: AGRyM1uMQ+Au377P7UQcUkkMJiumuyq+AuV4ZGQK5zcJ79AGgiGLygxHH0WKoJXCOE4P7zCEhBnN5Q==
X-Received: by 2002:a2e:b049:0:b0:25a:89a2:df44 with SMTP id
 d9-20020a2eb049000000b0025a89a2df44mr7018017ljl.207.1657442501548; 
 Sun, 10 Jul 2022 01:41:41 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 i21-20020a2ea235000000b0025d4addbad4sm912536ljm.91.2022.07.10.01.41.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jul 2022 01:41:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Sun, 10 Jul 2022 11:41:30 +0300
Message-Id: <20220710084133.30976-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
References: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 6/9] arm64: dts: qcom: sc7280: drop unused
 clocks from eDP node
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

The eDP node includes two clocks which are used by the eDP PHY rather
than eDP controller itself. Drop these clocks to remove extra difference
between eDP and DP controllers.

Suggested-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 13590e84772e..5bb536d76f5e 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3716,16 +3716,12 @@ mdss_edp: edp@aea0000 {
 				interrupt-parent = <&mdss>;
 				interrupts = <14>;
 
-				clocks = <&rpmhcc RPMH_CXO_CLK>,
-					 <&gcc GCC_EDP_CLKREF_EN>,
-					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
 					 <&dispcc DISP_CC_MDSS_EDP_AUX_CLK>,
 					 <&dispcc DISP_CC_MDSS_EDP_LINK_CLK>,
 					 <&dispcc DISP_CC_MDSS_EDP_LINK_INTF_CLK>,
 					 <&dispcc DISP_CC_MDSS_EDP_PIXEL_CLK>;
-				clock-names = "core_xo",
-					      "core_ref",
-					      "core_iface",
+				clock-names = "core_iface",
 					      "core_aux",
 					      "ctrl_link",
 					      "ctrl_link_iface",
-- 
2.35.1

