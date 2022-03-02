Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 997D64C9A26
	for <lists+freedreno@lfdr.de>; Wed,  2 Mar 2022 01:52:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 324A910E993;
	Wed,  2 Mar 2022 00:52:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35E6210E91D
 for <freedreno@lists.freedesktop.org>; Wed,  2 Mar 2022 00:52:15 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id bn33so140017ljb.6
 for <freedreno@lists.freedesktop.org>; Tue, 01 Mar 2022 16:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5dxVC0XYMtIkeKswxmMMqBeM9Azi7/GfbM0XxG5vLXE=;
 b=oEmqBkXAdaJ9rnJDQtmTdrV6zzeyI3SIDdlyVBZ4QLxJAkUw4VYGbn5hLe0c2y4m1l
 1i0hPWf5Us3QDEj8Wmu2DvR4cT0LcqhXE7NLRBSS5et5XaSCjpl0Sof4nZtburkGLa+w
 I/QrvAYTnr4A0E2gkFhQdlYSuvHXK1LAdkqnZrJtADJb1ZVsU2mRi/gP+T2oL6Jw1Sgf
 zF9cPkzMEpSD34t2STfywILF8DBgRD1GdlERGKgQveauH+uqiGKOUB3MbJwDxg2cx+GA
 QlP3l4jeP1S5bOq+1i1fnDX6Fk6DyoD6seumYqf1xQqYMs0EIPeImFgpX+0gwDqqjw3/
 seqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5dxVC0XYMtIkeKswxmMMqBeM9Azi7/GfbM0XxG5vLXE=;
 b=DJVPMiMO6hkCus52GSwUtLQJrAHkpxZwBohhnvS940mUL+gupOOiXQsKV7hsEUIcc3
 asgIlXiAGu8rb59kkr01qnwf0Imnm+1XMYp24xbkoOJGhMvxpoTfgMyk2YSFx9nGJxby
 eO2Tf38EWgIeuaFqnIN/hjwCXN4LjknkJrleYItNjZg+9sEZuDNSs5LQGWdUJxLGllQg
 TlYB09G0kNPz8/NnzoAGKHRhtt513K5DemRiJJJjBSSUnR3Pcuas2eYx+tyxEzVdIhXP
 1L8Y22VJ+hLfGjQWU4UwQlKVYKV2SUVeKEzyeiym5t2+HOrS1xhvjRKaHTSNYWKtMDOq
 Cl1Q==
X-Gm-Message-State: AOAM530GCqpKHTqkPFlhxnTaXOn0JPVPDyaAJmKCBDeLFVJx94dROkRG
 30OyaJUFBgEsCFPlUwPDJTHPng==
X-Google-Smtp-Source: ABdhPJw1dajR6vcW+/GGOcsIoftUlKpFkCNvxRaWyG04WZEO0cJhVTEkXW+He7bQtZfg+1bUDlFVSA==
X-Received: by 2002:a05:651c:514:b0:246:8b8c:a97b with SMTP id
 o20-20020a05651c051400b002468b8ca97bmr8544838ljp.238.1646182333544; 
 Tue, 01 Mar 2022 16:52:13 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0:5258:5528:7624:3edd])
 by smtp.gmail.com with ESMTPSA id
 n23-20020a19ef17000000b00445b8db3c42sm198171lfh.172.2022.03.01.16.52.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 16:52:13 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Date: Wed,  2 Mar 2022 03:52:07 +0300
Message-Id: <20220302005210.2267725-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302005210.2267725-1-dmitry.baryshkov@linaro.org>
References: <20220302005210.2267725-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 2/5] arm64: dts: qcom: sdm630: Drop flags for
 mdss irqs
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

The number of interrupt cells for the mdss interrupt controller is 1,
meaning there should only be one cell for the interrupt number, not two.
Drop the second cell containing (unused) irq flags.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 240293592ef9..7f875bf9390a 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1453,7 +1453,7 @@ mdp: mdp@c901000 {
 				reg-names = "mdp_phys";
 
 				interrupt-parent = <&mdss>;
-				interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <0>;
 
 				assigned-clocks = <&mmcc MDSS_MDP_CLK>,
 						  <&mmcc MDSS_VSYNC_CLK>;
@@ -1530,7 +1530,7 @@ dsi0: dsi@c994000 {
 				power-domains = <&rpmpd SDM660_VDDCX>;
 
 				interrupt-parent = <&mdss>;
-				interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <4>;
 
 				assigned-clocks = <&mmcc BYTE0_CLK_SRC>,
 						  <&mmcc PCLK0_CLK_SRC>;
-- 
2.34.1

