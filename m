Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C295E8A6E
	for <lists+freedreno@lfdr.de>; Sat, 24 Sep 2022 11:01:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3280D10E55F;
	Sat, 24 Sep 2022 09:01:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46C0510E54E
 for <freedreno@lists.freedesktop.org>; Sat, 24 Sep 2022 09:01:12 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id b6so2371371ljr.10
 for <freedreno@lists.freedesktop.org>; Sat, 24 Sep 2022 02:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=QP8oHGThdjIPJ6Bvh0wbUBRr02al19D0DbDwHW8eD1Q=;
 b=LtiWl78tulO0DQf22boMhab7npcGDLc1zNzvhm+Q1bZY2YDwTfmByGUtvoacbRBhux
 2Trj5EaQ/PUB+RHtIYKUOfJxh6CXfrvWbdTOPsaKpqn0R49dk2A1SJmVab0UUaGh++bg
 3h0TbMWHSQxQmcR+ICwnjLY6FLLLe8J/qqrivd96x05/HIuRsxE7SvSRALvmgRc5l/4p
 GQcNYQPLXkptEqFo9qelVlW/BSLNGaLbPRdx2idVGYXQuI9O9LCjmppMIwlIKfcuvhlb
 PaETTdHxKUlCI1XSoE/s6e58eV/1OGydwtI2wZAZoWu1nzvV/09Ido6eYcOHj9OCqmJr
 TjYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=QP8oHGThdjIPJ6Bvh0wbUBRr02al19D0DbDwHW8eD1Q=;
 b=7Zd7HqAgUjXfsar33Hpvl1iruvddbjSqd8BVfWbQ5OJPWSDXs/mw2bnUuRanFTNARz
 sHDZdxeFo4hclekDbdqmOelW4dEhhd53FxuA9QOfyCiTN2lUI/gCchNsy42us4CwSKla
 /rIb1t3d3xlpw9Isu23gGLQbk0ka7F3u4YXR4VgPSJPyDQPjCX7f0nRNzmMXQ8GE3wWz
 8RPprcqrNJJDui1z6aSEnQopRKHUWY54ZGwhK6HygbhK3wGlW0eQaiDSPdVrRkp4kktw
 q0xS9OlszOpOuJkjhsNkJ944dqazU0BK4zCTAI++WRl1Ly0Q1lfWkB5UgKV7HfjHiuPK
 yBaw==
X-Gm-Message-State: ACrzQf2jW1I1+sszIEQcR3z22nStjVQzeW09ID/FUdKXzwxmF4URz7JG
 e4VnAO+d8xuNawXDZ3OgvvXfdA==
X-Google-Smtp-Source: AMsMyM7rhEhnNp3jHlIaDTHQIMDh0oXWzm6sxtj0R7KWmfAFkk+tBThQyFwkdqryE9tZKqyU3agaxQ==
X-Received: by 2002:a2e:bc28:0:b0:26b:d979:fc72 with SMTP id
 b40-20020a2ebc28000000b0026bd979fc72mr4450263ljf.292.1664010070260; 
 Sat, 24 Sep 2022 02:01:10 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 o4-20020a198c04000000b0049f54a976efsm1830024lfd.29.2022.09.24.02.01.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Sep 2022 02:01:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Sat, 24 Sep 2022 12:01:00 +0300
Message-Id: <20220924090108.166934-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
References: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 1/9] ARM: dts: qcom-apq8064: change DSI PHY node
 name to generic one
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
 arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts | 2 +-
 arch/arm/boot/dts/qcom-apq8064.dtsi                | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts b/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts
index fee278e32cb6..2c5ee2e98fe2 100644
--- a/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts
@@ -252,7 +252,7 @@ dsi0_out: endpoint {
 			};
 		};
 
-		dsi-phy@4700200 {
+		phy@4700200 {
 			status = "okay";
 			vddio-supply = <&pm8921_lvs7>;/*VDD_PLL2_1 to 7*/
 		};
diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index ada4c828bf2f..1b704c7ea890 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -1303,7 +1303,7 @@ dsi0_out: endpoint {
 		};
 
 
-		dsi0_phy: dsi-phy@4700200 {
+		dsi0_phy: phy@4700200 {
 			compatible = "qcom,dsi-phy-28nm-8960";
 			#clock-cells = <1>;
 			#phy-cells = <0>;
-- 
2.35.1

