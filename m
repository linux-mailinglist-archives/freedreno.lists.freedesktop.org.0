Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD656F9B16
	for <lists+freedreno@lfdr.de>; Sun,  7 May 2023 21:07:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF6E610E2CD;
	Sun,  7 May 2023 19:07:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32DA610E2C6
 for <freedreno@lists.freedesktop.org>; Sun,  7 May 2023 19:07:42 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4f24ddf514eso488104e87.0
 for <freedreno@lists.freedesktop.org>; Sun, 07 May 2023 12:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683486460; x=1686078460;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wt+EbN0hwDOiIGnoCwwD0C5MozLHDgMBCyuph5K3wf4=;
 b=XrhwPCUVXiDVuU/7M84RcriDD+kkz65HdTllc39o/O6IRoRtUaqVF/+7t0SlXrmweS
 DY7owPJNuDzyZIXCnohLrS6jY77jSoD4eOEvFv9KLAHjwYX+znLCtRGf/+nF9+NNXnsU
 2S4gD9obfIDG0G5mVh+j1+4RZIFa8CzOKNBaMs1Dpp5WcgLPLWqrlBFxMgi8ruoqjOVM
 S+k/nZtJqKg6E+/Fb1g3h6YY/tsf/RZUb8sHn4+EQjM/ptlPVbhehP47TKgNuQMBDPld
 31ojuS4RlEMUVh67KgoO10SuRDLA3NX4flmLUSnN9gpMN7Mwmus02fdkbTb3vaVwtQ1d
 JvWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683486460; x=1686078460;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wt+EbN0hwDOiIGnoCwwD0C5MozLHDgMBCyuph5K3wf4=;
 b=AVJDfwrmEbWceRg/JY6eoDKXx65hXbIYdqcXS8eZULEnv87OqnYNaGDiEGXNji3a+x
 8pxUVp2xOK0KpBORTYhCSRa66wl3fT4LJdEUcDUv/BihnpUJyiSySVRwRlVT13qQxR+i
 R99BvUES1GJl2Qfk9c+pSnyOOrLCEBOu2TAg7Fs8d8xjiknFKnliCq58qe92UOflHNIo
 EeUMbyY/36l7+aydgfG7f18erjJs/ezPd2Pi1QtD0MXyg4LaYQeH4nWH4Mu9JZuqDSiw
 zC67EfATdNXBb1HKBuJFc+HxuOVlLNfMVapjN3TmRdaEarkmjrO1sJ0pT3nYW1qenWIn
 d8vw==
X-Gm-Message-State: AC+VfDzQVyUEtkhCR592fytnaTbFZPfs53wdySE8EHPE9iUPj5ezaxKP
 PJdx4winEmdZkL5CSVJ/GA/MIQ==
X-Google-Smtp-Source: ACHHUZ4HTHySU0+5n1d7HinlNa8FFLgd4USGZRm896mhh/4Ct2YmMYGFo40o7zNESd/6HpO2yCYeIg==
X-Received: by 2002:ac2:4907:0:b0:4ee:d8f3:1398 with SMTP id
 n7-20020ac24907000000b004eed8f31398mr1906642lfi.68.1683486460339; 
 Sun, 07 May 2023 12:07:40 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::ab2]) by smtp.gmail.com with ESMTPSA id
 f8-20020a19ae08000000b004f14ecc03f1sm755841lfc.100.2023.05.07.12.07.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 May 2023 12:07:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Sun,  7 May 2023 22:07:35 +0300
Message-Id: <20230507190735.2333145-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507190735.2333145-1-dmitry.baryshkov@linaro.org>
References: <20230507190735.2333145-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 4/4] ARM: dts: qcom: apq8074-dragonboard: enable
 DSI panel
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

Enable MDSS, GPU and DSI panel output on the APQ8074 dragonboard.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../arm/boot/dts/qcom-apq8074-dragonboard.dts | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
index c893afc00eb4..72f7e09a5bbf 100644
--- a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
+++ b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
@@ -48,6 +48,57 @@ eeprom: eeprom@52 {
 	};
 };
 
+&dsi0 {
+	vdda-supply = <&pm8941_l2>;
+	vdd-supply = <&pm8941_l22>;
+	vddio-supply = <&pm8941_l12>;
+
+	status = "okay";
+
+	panel: panel@0 {
+		compatible = "sharp,ls043t1le01-qhd";
+		reg = <0>;
+
+		avdd-supply = <&pm8941_l22>;
+		backlight = <&pm8941_wled>;
+		reset-gpios = <&pm8941_gpios 19 GPIO_ACTIVE_HIGH>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&dsi0_out>;
+			};
+		};
+	};
+};
+
+&dsi0_out {
+	remote-endpoint = <&panel_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&dsi0_phy {
+	status = "okay";
+
+	vddio-supply = <&pm8941_l12>;
+};
+
+&gpu {
+	status = "okay";
+};
+
+&mdss {
+	status = "okay";
+};
+
+&pm8941_wled {
+	qcom,cs-out;
+	qcom,switching-freq = <3200>;
+	qcom,ovp = <32>;
+	qcom,num-strings = <1>;
+
+	status = "okay";
+};
+
 &remoteproc_adsp {
 	cx-supply = <&pm8841_s2>;
 
-- 
2.39.2

