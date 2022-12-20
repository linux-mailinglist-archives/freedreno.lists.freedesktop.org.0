Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7756520D8
	for <lists+freedreno@lfdr.de>; Tue, 20 Dec 2022 13:39:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A21410E3D5;
	Tue, 20 Dec 2022 12:37:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 527F010E3AB
 for <freedreno@lists.freedesktop.org>; Tue, 20 Dec 2022 12:37:02 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id o5so11608181wrm.1
 for <freedreno@lists.freedesktop.org>; Tue, 20 Dec 2022 04:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eHjoTnRNTZFA0ZBsqDkIXARH9jeUb+0DAfgRumKgoyA=;
 b=rs4vgJC3RjuWDo/TltLbOoul1JyKztAoXim5pF33Rv50LulrE9vvKu2elONP3paQwe
 ZuineT+WHrcIQqs7witjl7gO9IqNDgmcvxWBoeTIlFBxALafwhO1dp2zpWPAk5J3HXqO
 6PcI+bdsQKR2DeFVOD2VUekON4gFQVu06bcOA9Eomy5+MB94rtg3o1DP2lM8vkJlrdVp
 6BWQ6jHBAitCdsj9JtUOcfyyki9SSd2tswGsluN8vkIudGrclGUCbUAi2Ae/c0+JnMsJ
 SN963JlDQpGO4LQYghqtsu5zZv//f4aJQZESsyZZAqzev4J9Q1z69r9EOm0huSA6haWf
 RsGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eHjoTnRNTZFA0ZBsqDkIXARH9jeUb+0DAfgRumKgoyA=;
 b=CcML3sDII9/fc1xR6OvKcpLUGSEGodUlXnKh8ajS8P0qo6yC/UnGv2pOoikP2A4z7X
 ZoBcDcl1tmui85f8i963j7eY7Sgz7QlVAv6oJBqam5c8DT+F8TN0Z0oNkXv4vJQ5Pun9
 gbQt1XeOgcvs+BuhhuZgc5x+fGcGspusFDzB3hrbD3c8hZrJNH2AsmZU6GfogJzEZPwm
 N9tJ1g4q1KFEp6Zoj4FfLkZulvATK+gmxiOFJTnwdcWQDSMxzwHvaBr7HvbVeHwdfJGZ
 nrtwKqLx5silzvJJNZ9JTwGvGRFIQ3qzaWvFDISaO8H1Lk44bzafmWekH9gx3k/Wsr0V
 x+4Q==
X-Gm-Message-State: ANoB5pkyV0/mzrVjTuDGuRBHIxHCd4O1AJgU7D2eNNOW8QpmpeZVgoiz
 FFFiIXT3Uh7BhyurAPY+u3TazA==
X-Google-Smtp-Source: AA0mqf76Dkn/qsfn4A7uaYveYdNp3mxxfhohI84VViwRDT4kCZjSM4XJBKu3rIUNeF9yuK1lessWFA==
X-Received: by 2002:adf:f30e:0:b0:253:62a0:2dbf with SMTP id
 i14-20020adff30e000000b0025362a02dbfmr17910945wro.62.1671539821883; 
 Tue, 20 Dec 2022 04:37:01 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 da13-20020a056000408d00b00242257f2672sm12641208wrb.77.2022.12.20.04.37.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 04:37:01 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Date: Tue, 20 Dec 2022 12:36:34 +0000
Message-Id: <20221220123634.382970-22-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
References: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v5 21/21] arm64: dts: qcom: sm8250: Add compat
 qcom, sm8250-dsi-ctrl
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
Cc: dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sean@poorly.run, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_abhinavk@quicinc.com, david@ixit.cz, dianders@chromium.org,
 robdclark@gmail.com, robh+dt@kernel.org, agross@kernel.org, daniel@ffwll.ch,
 dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org, swboyd@chromium.org,
 airlied@gmail.com, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add silicon specific compatible qcom,sm8250-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for sm8250 against the yaml documentation.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index dab5579946f35..9240132efa75e 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4050,7 +4050,8 @@ opp-460000000 {
 			};
 
 			dsi0: dsi@ae94000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sm8250-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae94000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
@@ -4141,7 +4142,8 @@ dsi0_phy: phy@ae94400 {
 			};
 
 			dsi1: dsi@ae96000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sm8250-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae96000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

