Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A1C33F325
	for <lists+freedreno@lfdr.de>; Wed, 17 Mar 2021 15:40:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2164F6E5C6;
	Wed, 17 Mar 2021 14:40:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 794C86E5C8
 for <freedreno@lists.freedesktop.org>; Wed, 17 Mar 2021 14:40:52 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id n16so3345036lfb.4
 for <freedreno@lists.freedesktop.org>; Wed, 17 Mar 2021 07:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VZ0geH6BqMBlmbQ30iyES93D0PKaLEePFxddTMOy9xQ=;
 b=no1y5QTnePloWF6Kf5NJI+KW4hcc8iSa7md8U/h+236ztkxrCWmLM76BfogRg1Ve16
 ic8UeNY3CQvCIj7LBtJihb+1OVqWASBOHdzCyKDLDy2js/EZ90sO55MK70CNPfwgfQ0a
 L2Ye9KT0n0j0ihVSz+W9IqJqF/4X+TVYMGXigMPr7xBd603Q3UKwoLSy1ZnSjHuDVLX3
 wB6Ft/pYSwnaePxzAXT2IVJjEc4Pd7OaiabwwFxAGW3m7GcKKh/1U4ti1HXk8/Lz0stZ
 FzhGd5BZYHT9Drn7Av/GitUBhlueIZEfh1k7Yi53NqZX4V+p+Ljn4mSKTUE5WiRPZfgn
 zoPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VZ0geH6BqMBlmbQ30iyES93D0PKaLEePFxddTMOy9xQ=;
 b=KKCQ4sd/lL4NZlfUfOVvxmKb1HqpTnSLF3rfCksgYpQ5Wt1uZrBy7oFKmMhvnUjXdO
 SMBDEPy2YBnd4e8BegjpTdojOO/0Sa/Lph2qlaQ3UlfmU7E0Zxmmzz6Tzj11mUskB9GZ
 xhYdoHnBHJWWIHvraQREWMDF8PGoKOcePNZxFSmXTSeRH4q2CrgfiMWDFeM6tdde4vZ5
 zkJReCVoEm3u/ApBepmU6CDzorvXwW16Oo1JmBTlFmR7PIpDhi1OPqvQoEpSjA59AiPJ
 /Ei3oeAJ/wLac5yVOX43MildfDKr8/6aiCKJrhZjE0WtigO03C47j2Pf0hZL8hs1UrX6
 +5iw==
X-Gm-Message-State: AOAM531w5jy/myjzUBAq2Y1m/l6QuhZx7c8ZsJnIBa6MHcrqMDsPeZo0
 3OQ4P9No8oL+8oSAeKd28iJ0kg==
X-Google-Smtp-Source: ABdhPJw5jus2v3pxW594CEk+SrRrg9htGKBQ1CbmXj1XxLuT4EdAEgnqIByVfE0lXaRf41wydng6qw==
X-Received: by 2002:a19:44:: with SMTP id 65mr2673123lfa.104.1615992050905;
 Wed, 17 Mar 2021 07:40:50 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id q8sm1484309lfc.223.2021.03.17.07.40.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 07:40:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>,
 Michael Turquette <mturquette@baylibre.com>
Date: Wed, 17 Mar 2021 17:40:22 +0300
Message-Id: <20210317144039.556409-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210317144039.556409-1-dmitry.baryshkov@linaro.org>
References: <20210317144039.556409-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v1 09/26] arm64: dts: qcom: sm8250: assign DSI
 clock source parents
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
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Assign DSI clock source parents to DSI PHY clocks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 947e1accae3a..b6ed94497e8a 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2445,6 +2445,9 @@ dsi0: dsi@ae94000 {
 					      "iface",
 					      "bus";
 
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
+
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SM8250_MMCX>;
 
@@ -2512,6 +2515,9 @@ dsi1: dsi@ae96000 {
 					      "iface",
 					      "bus";
 
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
+				assigned-clock-parents = <&dsi1_phy 0>, <&dsi1_phy 1>;
+
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SM8250_MMCX>;
 
-- 
2.30.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
