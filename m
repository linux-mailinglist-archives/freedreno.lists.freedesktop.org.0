Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A71D329533
	for <lists+freedreno@lfdr.de>; Tue,  2 Mar 2021 00:26:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21EB46E90D;
	Mon,  1 Mar 2021 23:26:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E63A96E908
 for <freedreno@lists.freedesktop.org>; Mon,  1 Mar 2021 23:26:27 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id e7so28345238lft.2
 for <freedreno@lists.freedesktop.org>; Mon, 01 Mar 2021 15:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F/g683yfKMbSwanrv0GKDcyKMtduWqmgNMeU84dPM/I=;
 b=u0I4XS9EQX/RrTgjEwRh1DB7T0t3yiqaL5emtUIOeGbIpVH0/EREIEzn4RvRWESsqA
 xEUUdpsONp6kPF32tGzTBE94mowKWllT6WY9CYChA2dnE2ynT7pGeDc4SdLMxrrpCSLI
 CAvN2wuXn92uG5cAgZc9hE7yokZMAPHejx4aSopWGqI7WoPMHLgt9ccVApik+q22aMz1
 pMcowInq9xmemsW1rvs7yc7doJMWX1hyMzuFKn/uncOPRs8WtaN0J7ReuR1Ln0zk0wZb
 DySM1kicgk7quh/UMfNsYudSI50LG/bjVJ/OXRF2l+jBcx0Ge67SmxeEJEY9PBguo1jX
 nnXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F/g683yfKMbSwanrv0GKDcyKMtduWqmgNMeU84dPM/I=;
 b=bxlut4hQS0n90q8a2eDUmJdGu871fgLN6N8X0xsHIQxcGjrWKEr1Lhj3j90V+GFp5I
 6u+lS7qKTrRaEGA3IMdhwrdQMq3Ka+SOw3m89u9MznzR6Y1tn2J2zst5FmuFrNospuTO
 E1ZOsdLcS4+n9G2Py5gTz9ZdvLD7Bb8sO7YI3dJvInuWiSDNSeboBPNv77dOX7a7UHX+
 wZqvrWnTQClvXAXbDdwQtjKR5jWRwRSF2TOOoW/o9CtMQxvXcbWHC1+8wG1BjZxxyvI4
 2s/oxrcXQEcksiGYo+xv8kLh6kK0NbyHZEv2DMutR5SoMkGnKzwDHgNbEbj0nxdJJu5d
 YLZA==
X-Gm-Message-State: AOAM531iywfF3gW9wsLRKPUiF6Y1J4hiu5eszSE0GkhHCMEuiRdqaumB
 5utBHnE9XQv7VT5eCdH7oyukBA==
X-Google-Smtp-Source: ABdhPJwPTWy+s1unheR5Ge4u57rIEixPwt6TRaRd9RWzxhBf4Acq36RsiXpxUxAqkYPLHx06kQ+yWg==
X-Received: by 2002:a19:9109:: with SMTP id t9mr10475451lfd.49.1614641186429; 
 Mon, 01 Mar 2021 15:26:26 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id b20sm154749lfa.183.2021.03.01.15.26.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 15:26:25 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>
Date: Tue,  2 Mar 2021 02:25:07 +0300
Message-Id: <20210301232506.3057401-25-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210301232506.3057401-1-dmitry.baryshkov@linaro.org>
References: <20210301232506.3057401-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [RFC 24/24] arm64: dts: qcom: sdm845: assign DSI clock
 source parents
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Assign DSI clock source parents to DSI PHY clocks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 454f794af547..2166549382c1 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4113,6 +4113,9 @@ dsi0: dsi@ae94000 {
 					      "core",
 					      "iface",
 					      "bus";
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
+
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SDM845_CX>;
 
@@ -4179,6 +4182,9 @@ dsi1: dsi@ae96000 {
 					      "core",
 					      "iface",
 					      "bus";
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
+				assigned-clock-parents = <&dsi1_phy 0>, <&dsi1_phy 1>;
+
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SDM845_CX>;
 
-- 
2.30.0

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
