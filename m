Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D35AB347C0B
	for <lists+freedreno@lfdr.de>; Wed, 24 Mar 2021 16:19:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2D6B6EC83;
	Wed, 24 Mar 2021 15:19:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 034D36EC82
 for <freedreno@lists.freedesktop.org>; Wed, 24 Mar 2021 15:19:26 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id i26so16652169lfl.1
 for <freedreno@lists.freedesktop.org>; Wed, 24 Mar 2021 08:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d5gXnaS6/FhBtkbwF8y1QR9zxelWPPlPpq/TCaYVKkQ=;
 b=ahp+fVKPZwAYJOW7LBbtb9n9bOtkcZ8QEH92zF0ab5N9I6JC/bQAFlWBWCXj/7GxMY
 KXs1r/ByTAchuEe9IEHPZU0h+05/u29eJIiggZRbHuSnVAulRDX62LU5xFRFyLkUHNnL
 +oqsGuNEul9eDR/gWiAR/YPHklWTlVq1iwa2CIvvxNokMlgb3nskHwPfabCcQL1Fa1zL
 sd1p1G94PgZkt5kszyIIj2+jyLcg83O039DV/ojycQFbwB5EqIt01IgL78QLQHdVhxSf
 2Lf490CyWN4LD+V8qFbEMm+gB16bQgXbpaWuEWEJF3BPBq/7zpKxrFtkkUuUjrcOOnHD
 4MhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d5gXnaS6/FhBtkbwF8y1QR9zxelWPPlPpq/TCaYVKkQ=;
 b=R3We0xjuJPGsnYuCU8R/Mpx54dVvaPkof3SIKpEsdbynSjavPvU5Gj4BonRF7HnLdz
 LgNl0bn/x6AFg7iZFxt9v6PvFtzv6AZT73KJXCajylgVnlzIGZcFAIF1P6PhFbx6JmfL
 oP+4WlpPKBRaRaMpAYHz1CjfEACJxlIKFsX0BUVRyoRmbN7PfztTsS22aoRw+yfQ4RaW
 nbbUsxcB5Or7RtlfsDEQDs1Z8tYNTagu9pX0ueDAfSP4JvljnT6OtT7Rw+jYJks6SFM0
 n2C2WZ6LUBVOB5FBRVNilokPNR76KIbvZN26UJyKEP3Rw/wKVgOeuMh6qWaW8EiJjb+R
 BZhA==
X-Gm-Message-State: AOAM5327f65nmpEeg0gTNbuKsYlersuhFbVec9sGM460t4F5AA2MqXJ8
 xUId+vdYIHKu56YjqzJEXpxyhg==
X-Google-Smtp-Source: ABdhPJx8XJ9coT+NGmhTsbhOuiSRspWWg3awMGtpNTVWXUtP3HYMg5dWhk1AsT5lXPxJa92lUn+ukw==
X-Received: by 2002:ac2:4ac4:: with SMTP id m4mr2215124lfp.404.1616599164364; 
 Wed, 24 Mar 2021 08:19:24 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id d22sm255199lfm.267.2021.03.24.08.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 08:19:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>,
 Michael Turquette <mturquette@baylibre.com>
Date: Wed, 24 Mar 2021 18:18:31 +0300
Message-Id: <20210324151846.2774204-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
References: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v2 13/28] arm64: dts: qcom: sc7180: assign DSI
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
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 22b832fc62e3..c16ddabb3a92 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -3076,6 +3076,9 @@ dsi0: dsi@ae94000 {
 					      "iface",
 					      "bus";
 
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&dsi_phy 0>, <&dsi_phy 1>;
+
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SC7180_CX>;
 
-- 
2.30.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
