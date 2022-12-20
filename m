Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 439406520C1
	for <lists+freedreno@lfdr.de>; Tue, 20 Dec 2022 13:38:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33F3710E3C5;
	Tue, 20 Dec 2022 12:37:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94D9A10E3B0
 for <freedreno@lists.freedesktop.org>; Tue, 20 Dec 2022 12:36:51 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id h7so11595349wrs.6
 for <freedreno@lists.freedesktop.org>; Tue, 20 Dec 2022 04:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qZdjxc2y9QTXw1oO8jfVxT9zUH2M6g93k1qq74sNBIo=;
 b=VN2EHTlMijRwA2gumbvAukjq5JQGGSzpEZHISjpbp7wHa5cT/oLZL72zN6GkR4RqBx
 5xGTGNH5eCWEIIra7WEJBoK7wJjqeC9Ylk+7n25byjRFdow2zMkZ9pXMTTlnogagQf9K
 RAzL0oK46q3O3CVNLXT2z5DZyUH1OPIwtMI1Y7hPqUkGF8zDy2m7IJb+8ocdvKRAccxH
 ofhxSnNL/YW3BeBOUlZnOiNHavF5MWsXlMaRlKlACTnxvfMQYCgGtqfzQSMj4X/VpvHD
 G4nVAml5D7BlqPb7dTrlseDzWNBdJjxr3oYC+ZwgctGGd1ub5f7PLGyFpCoUg3vEyQPc
 SWrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qZdjxc2y9QTXw1oO8jfVxT9zUH2M6g93k1qq74sNBIo=;
 b=XKnPyiFDSLk4I7vTX2eHxFoiCkJxOxeyJIVHSQFW80jskbjvBdo3eE+k9a5ENrWKBC
 wxGMGQo9rKdSeurYAIp/Cj1LtkLJGTv3VC1ION/VOeoqG1VQmHnQoNKtRyurME0qMaVS
 CMpgHf88RU/+nKXuBIgCXyvHrkyGaUP6GVQc9vyezdKT8fxA24SFRRgryi7AAcDWP+VI
 YRstsL8N5MfxWtZEDGO/nqMpD3JOiGaQYkYlOEBUwwVxKCwm21HlGjeMLW67jWdmGISp
 KUneoQiOmH8hOtt/gIcLjPhLY1oa24I6/n3UzLn38CVqzy3k1ZeIhYsxFxD5u3ZJJpCE
 xDhA==
X-Gm-Message-State: ANoB5pn1D4g7/zBVel4uDbkbkW3bZ8rhUc04WRvgJ1T5YzjDvpAor+m0
 A/EotrpjiIurCdUlAJkFCpsSGA==
X-Google-Smtp-Source: AA0mqf4ou8Wfv7LYEJf9ZX1y6xnGlJwzjYjJHVlXJxS9zugLliWxBQgeTXDN5gQNsC2iGal62WS7/A==
X-Received: by 2002:adf:f643:0:b0:242:2ae6:7c27 with SMTP id
 x3-20020adff643000000b002422ae67c27mr25980964wrp.19.1671539811192; 
 Tue, 20 Dec 2022 04:36:51 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 da13-20020a056000408d00b00242257f2672sm12641208wrb.77.2022.12.20.04.36.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 04:36:50 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Date: Tue, 20 Dec 2022 12:36:25 +0000
Message-Id: <20221220123634.382970-13-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
References: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v5 12/21] ARM: dts: qcom: msm8974: Add compat
 qcom, msm8974-dsi-ctrl
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

Add silicon specific compatible qcom,msm8974-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for msm8974 against the yaml documentation.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 8d216a3c08511..3ab3665b28aaa 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1579,7 +1579,8 @@ mdp5_intf1_out: endpoint {
 			};
 
 			dsi0: dsi@fd922800 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,msm8974-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0xfd922800 0x1f8>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

