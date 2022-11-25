Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3B9638A38
	for <lists+freedreno@lfdr.de>; Fri, 25 Nov 2022 13:37:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4695110E754;
	Fri, 25 Nov 2022 12:37:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3112010E751
 for <freedreno@lists.freedesktop.org>; Fri, 25 Nov 2022 12:36:53 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id n3so6581756wrp.5
 for <freedreno@lists.freedesktop.org>; Fri, 25 Nov 2022 04:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DE+PlQB0cKY1Moq0C5fwuxl0f1qcbiOIElHev/W70x4=;
 b=hTnWBF8gOJ9vRgggU2IojcyTD3+1Fc67nH8pxvJSMMP0JOUwEIbjTEhxygAGczHvw0
 4hlqWojOetYSNxUNv/Xoq9Va6iFDPbPn3WWDvI0fSueyubthuDFgAvpdmKygGv/igAMQ
 vfJIn9J9OV4x4Vaioood3wuFkHN3Ijyn3j4JmYv0MVXiLq6hpsXx5O++FsLraQ/bN4sk
 bPrecAXDL5J7ZtBjOWtpYJqgRYAsN6MQDhkPIzp+o6CtlJxjg4UEJoh5Hx4AcgL7ml+4
 aPWvzpF3gQSpLVIvE263fX9FMo1dn42jwYqXfSElMqVkMVWQ/f9LOlPRU5SOAFQLc0p0
 pNyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DE+PlQB0cKY1Moq0C5fwuxl0f1qcbiOIElHev/W70x4=;
 b=T7DQxAFTKzrFv93cz+548j5wbu7i6ytQZy7RASD+Z3WdDmmHxTTx2FaSX8XP+p9p6O
 CYq464XCk87Vyc+YXYr4wRHWr8THHRhcGLuid6Ay1qR8MqhxJ+6vIXeaDgvwmJHfYtSG
 UzTpJoNQAw5zAgFG9m2QiPJokIDo0ZlQhu39ADDE4I2HC1Ne6WOdk9wPwQKKN6KFK/ui
 a2KbplLsyF8VTxdFwg+fI5d/e727eqfDrfk+UJ3iJGV8kLrC5DEcYExc4Lsy3GhoxtQP
 Ifvc2qusjKUQPRf12ERP4EP0sH1/L2AcrpymrHr2ePW9b0qk3zKiEcIiJbPTXHMI4nEj
 nA3Q==
X-Gm-Message-State: ANoB5pkDAmn51EeM1Nll/u4fsPBK5I5Ycf4nHEa0fZvlu5Bj7n9vQ8Ao
 IcuWgS3vSoek0NjHyy91MJfGhw==
X-Google-Smtp-Source: AA0mqf41spKNpGP4sg5rp59xzmuqV9V8xm7qreYN+DnGAc9OlVl0HCBAqEyf37Gi8iVQWjt21Vivpw==
X-Received: by 2002:adf:eb88:0:b0:22e:3e3b:24fe with SMTP id
 t8-20020adfeb88000000b0022e3e3b24femr21908861wrn.668.1669379812729; 
 Fri, 25 Nov 2022 04:36:52 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 k15-20020a5d6d4f000000b002366dd0e030sm3574111wri.68.2022.11.25.04.36.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 04:36:52 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Date: Fri, 25 Nov 2022 12:36:29 +0000
Message-Id: <20221125123638.823261-10-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
References: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 09/18] ARM: dts: qcom: apq8064: add compat
 qcom, apq8064-dsi-ctrl
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

Append silicon specific compatible qcom,apq8064-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for apq8064 against the yaml documentation.

Reviewed-by: David Heidelberg <david@ixit.cz>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index d036dff4b14f7..a8b089eb0dad2 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -1287,7 +1287,8 @@ mmss_sfpb: syscon@5700000 {
 		};
 
 		dsi0: dsi@4700000 {
-			compatible = "qcom,mdss-dsi-ctrl";
+			compatible = "qcom,apq8064-dsi-ctrl"
+				     "qcom,mdss-dsi-ctrl";
 			label = "MDSS DSI CTRL->0";
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.38.1

