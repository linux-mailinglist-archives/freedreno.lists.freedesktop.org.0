Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6788E356FA9
	for <lists+freedreno@lfdr.de>; Wed,  7 Apr 2021 17:02:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 105986E93C;
	Wed,  7 Apr 2021 15:02:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 317A26E93A
 for <freedreno@lists.freedesktop.org>; Wed,  7 Apr 2021 15:02:06 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id c6so19611111lji.8
 for <freedreno@lists.freedesktop.org>; Wed, 07 Apr 2021 08:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UReEYo213vcg++rM9BnCxXvPAz9Gqu2yc6+O99aZXpU=;
 b=t9yU4v5QFQrksboxmgqw9CMDc3UhgK8w4UHj6YAEjjuUlA3SO4xhp+ykJv0YgaITyz
 3Pdf3NFCMzVvv0eypJIvSgnU+2f2n3Cq56lpUguxIW/KX92KPBXyQUDjViBk1wYvLklj
 syAqMQK2rL79Ln/PLRrMFDLbMHGjMiNxJfhN2NeRyIWdgkFtReSHJmGsRg1F2ZNHXdgz
 Lh9BkKyAD40vLGzi3lWY+kpDHuOxxg9n33ACAimjJTsat3A0eniO7TV8ZcQ4IKb+R5dK
 Jyhzp/oN7XKwI4oyByu6BUEbiEOaECCXcLTTlNzIcDxMuSagrGUzNhSFIC29gX9sHplk
 vxXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UReEYo213vcg++rM9BnCxXvPAz9Gqu2yc6+O99aZXpU=;
 b=to6ykLs52YzmlJQ00TFRkXpOGhhh78KLFirMnosMsUZmGEMrYdqc/XKdYy+qR3kSHi
 fk0rCJ9jv76Ios3+XqW7zSoY0A8uPKnVsTvoh7BS2nEBv2ZuEPY6HTSH2ZvdcE2mx7jL
 +K7NVzPxApXud/l8zmXFXOAwdaNwzJMFJLKMamdhtELonBEenlndy0i3t+uU9YfFzvRb
 r6xXsceTEhCdwIG1BKMXR+8lPn7NdTF/vtFwsB5k7RhU3AtA8wLtvvGHlGI48zPajUlt
 7lRdXLVkeekOYOmH5GcIrIBdaF9AefrwRISAUcFXuwd2v/XXmvgoWnq9v2RgmJr+ViWn
 uYzA==
X-Gm-Message-State: AOAM533NnQJTlXDO7lOME11t40Y/9f5UrY2OTMwDkrg+QQz+chrq5lvE
 JwyHAQnp1COEUoai6f0GBunR0XeXa+SFcw==
X-Google-Smtp-Source: ABdhPJxSlyf28SdfZfzsSLBQwJ0rK4f8aI77/+PnV7y9HKV9YtL3A4USpqOmNrcRfil2GQu8M9xpyw==
X-Received: by 2002:a2e:a60a:: with SMTP id v10mr2479817ljp.267.1617807724545; 
 Wed, 07 Apr 2021 08:02:04 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id o11sm2552142ljg.42.2021.04.07.08.02.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 08:02:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Rob Herring <robh+dt@kernel.org>
Date: Wed,  7 Apr 2021 18:01:57 +0300
Message-Id: <20210407150157.801210-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210407150157.801210-1-dmitry.baryshkov@linaro.org>
References: <20210407150157.801210-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v2 4/4] arm64: dts: sm8250: move bus clock to
 mdp node for sm8250 target
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
Cc: devicetree@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Move the bus clock to mdp device node,in order to facilitate bus band
width scaling on sm8250 target.

The parent device MDSS will not vote for bus bw, instead the vote will
be triggered by mdp device node. Since a minimum vote is required to
turn on bus clock, move the clock node to mdp device from where the
votes are requested.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 394973e778f7..60fe2eaf06c5 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2294,10 +2294,9 @@ mdss: mdss@ae00000 {
 			power-domains = <&dispcc MDSS_GDSC>;
 
 			clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
-				 <&gcc GCC_DISP_HF_AXI_CLK>,
 				 <&gcc GCC_DISP_SF_AXI_CLK>,
 				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
-			clock-names = "iface", "bus", "nrt_bus", "core";
+			clock-names = "iface", "nrt_bus", "core";
 
 			assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>;
 			assigned-clock-rates = <460000000>;
-- 
2.30.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
