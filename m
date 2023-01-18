Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A5B671274
	for <lists+freedreno@lfdr.de>; Wed, 18 Jan 2023 05:13:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDAE010E676;
	Wed, 18 Jan 2023 04:13:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3CE410E678
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jan 2023 04:13:00 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id v30so47958333edb.9
 for <freedreno@lists.freedesktop.org>; Tue, 17 Jan 2023 20:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XixFfJqW7fWztjbCaUKdGCwc9XrR0sFINh15AHy3o88=;
 b=bXKU6XTtT9ieurvaDVda982TPoWPVwLPfGgMrGmIr3+RUX7uhaoL1IXd30pmBC/EeT
 T4o9xDSlFO+XRjee7e5ZW1tYtKZyXY5HmjmCueXu8AMYKHbFhKMSzgeDUzqtTOVoXhke
 jyb0OIZXAE7b9LQW1cozW2OwZ/Tf1kq5oXetYKLDc0mb1HwHL4zqy6FN9N26LNo/iCpR
 n4z8WLkAsy6fRrnu46ScykRUcohGdVhVcoFmgoxEfY26B70Ot0ENewCg6Iw8PCoGKXX4
 S9e3vDTn7KVyHCZFo+lbgLNKA4DO5Ic9xCl46TsRFv/gobFMbM3wnsISQOsFvMsMEZic
 Zjxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XixFfJqW7fWztjbCaUKdGCwc9XrR0sFINh15AHy3o88=;
 b=o72d+TKz3ZrCHVh40o+PbfMlTR/2e5F/aWEc6gtTc8ynvr4AS2OntrZMxtjIuyFDEB
 uvd2SvslPe9sRX5YOSzhNxD3VEGpapad8+G0BFCDPqS6mgovlrOwfcV+5Z2jpQcTx1Zr
 36Wj3iQaXG2nmMYRImka46qBdUfonw4b10e1dCreFQWxmW/LllpJ13S3kyNjTvlwZFjb
 56PPReupsEWoxF/ZMPQ1EaDbk2y+NG8mWnMqnAmCbPwkkQw2yGB8ZxPwR0y0cujmUiO7
 OLz8t7pLRXuw2C4PXl8J2WGHgcBt+CcXjhOMdhpk118e3y0qAienmVtyIRdeuFs19m9l
 RTuA==
X-Gm-Message-State: AFqh2kqZg8x13rFm/0thimaItl4jSJvVuwJEDozC8ig4pp8mmuDmEqcO
 0loK5Eaiz4HSvdFSzwQbegSZgQ==
X-Google-Smtp-Source: AMrXdXv+phuCKBPJgXH6uF3amx3393AwEaVxAucehUBhtjYRdM2N1Wl3T1MiOAdSSQrVR1H9TUIWyg==
X-Received: by 2002:a05:6402:24a4:b0:49e:1f0e:e209 with SMTP id
 q36-20020a05640224a400b0049e1f0ee209mr8903454eda.10.1674015179135; 
 Tue, 17 Jan 2023 20:12:59 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 hp24-20020a1709073e1800b008720c458bd4sm2314100ejc.3.2023.01.17.20.12.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 20:12:58 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Wed, 18 Jan 2023 06:12:43 +0200
Message-Id: <20230118041243.1720520-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118041243.1720520-1-dmitry.baryshkov@linaro.org>
References: <20230118041243.1720520-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v7 11/11] ARM: dts: qcom: rename mdp nodes to
 display-controller
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Follow the schema change and rename mdp nodes to generic name
'display-controller'.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 2 +-
 arch/arm/boot/dts/qcom-msm8974.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index e045edeb5736..95705703fe8f 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -1493,7 +1493,7 @@ hdmi_phy: phy@4a00400 {
 			status = "disabled";
 		};
 
-		mdp: mdp@5100000 {
+		mdp: display-controller@5100000 {
 			compatible = "qcom,mdp4";
 			reg = <0x05100000 0xf0000>;
 			interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index ec0c526d0483..2879b29a109c 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1579,7 +1579,7 @@ mdss: display-subsystem@fd900000 {
 			#size-cells = <1>;
 			ranges;
 
-			mdp: mdp@fd900000 {
+			mdp: display-controller@fd900000 {
 				compatible = "qcom,msm8974-mdp5", "qcom,mdp5";
 				reg = <0xfd900100 0x22000>;
 				reg-names = "mdp_phys";
-- 
2.39.0

