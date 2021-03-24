Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D549D347C06
	for <lists+freedreno@lfdr.de>; Wed, 24 Mar 2021 16:19:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE73E6EC88;
	Wed, 24 Mar 2021 15:19:28 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEF7C6EC78
 for <freedreno@lists.freedesktop.org>; Wed, 24 Mar 2021 15:19:24 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id s17so30686699ljc.5
 for <freedreno@lists.freedesktop.org>; Wed, 24 Mar 2021 08:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uOwO8iANW7saI2yo/rKV3plq3B/8JH8KOWGKGoDTU2M=;
 b=HSrTD8Xdjt+QEKCvw5WgkS71Vcl/EUopfIf3Af5r8fWOFz5Cym7/FQ+BFQIbmz8GFm
 cx296qZIIxdNR+2dlViqrjUNR3z6Ny7uz1sRisaFEpwEZL36NaNh6HQVdamNVdDzYEXF
 Ou2rzif4QfT4B4Dw22StjRHcQzPJCR0NSZ/TGTarLcPlvTEBDDQMnVdHqagDh51mfDBR
 KK3H86b9Dp5r4fZnexUoHrDBp9KArCKfj+sDZhBejAl5NfoNc/VLLZOQgKWcwV+xE/58
 Y0bOgbHVSax9IPD4RGuNie0gL1y/QMv60SLXAj9nKUyvgapz5z+gUlaJKH9llFBMXT2h
 Pvyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uOwO8iANW7saI2yo/rKV3plq3B/8JH8KOWGKGoDTU2M=;
 b=VDXXmNdT83AGpllsX291yDU/e62dAQCICHgfP+32zHyQFBN7uUiA5Ar2B/U2YVnW0Z
 9O2GcrkVhiyQuYpr3hMXCblkSWYGb3ikm4S+UEogmIAenz1l4WGYA/tlu+7P9b1uGF6q
 PJJOqhlV+1MVhTcBL/lSuU83hnDCkJiFmRM5w3mE0xJhVuw7g+qLho55vV5bk+w2oeWW
 jhrJjdw5nyujEN1TQNoc/SGQjMfNdg4SCy/AYGqMNpIKqBxSOSdDIId1gddyRQHeC2kk
 YHYKQS+UB9gf5ZzvE22207hwHr9iauTl9LMY+aBQnzPmsYhG1OVCx547MF2lFDDOyegH
 6DxA==
X-Gm-Message-State: AOAM532aV2VTwJ2D7J0Rc7MFBK3JFGNu/m3h2ivmE0PHv0fJDqaIU5HU
 SN53RchO5I5FdFBnidHR0ulJiQ==
X-Google-Smtp-Source: ABdhPJxJPE/lsidWG4sbxqSE0fAKJ8DVwJ4yZRMkgFbAdV1HDkewtc2cAtHfGeQhL7IK39T6JBQWAA==
X-Received: by 2002:a2e:b6c7:: with SMTP id m7mr2386715ljo.241.1616599163322; 
 Wed, 24 Mar 2021 08:19:23 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id d22sm255199lfm.267.2021.03.24.08.19.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 08:19:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>,
 Michael Turquette <mturquette@baylibre.com>
Date: Wed, 24 Mar 2021 18:18:30 +0300
Message-Id: <20210324151846.2774204-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
References: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v2 12/28] arm64: dts: qcom: sdm845: assign DSI
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
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index bcf888381f14..8e0c5dfbd639 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4115,6 +4115,9 @@ dsi0: dsi@ae94000 {
 					      "core",
 					      "iface",
 					      "bus";
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
+
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SDM845_CX>;
 
@@ -4181,6 +4184,9 @@ dsi1: dsi@ae96000 {
 					      "core",
 					      "iface",
 					      "bus";
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
+				assigned-clock-parents = <&dsi1_phy 0>, <&dsi1_phy 1>;
+
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SDM845_CX>;
 
-- 
2.30.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
