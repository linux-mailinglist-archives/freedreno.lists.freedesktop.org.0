Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9626636F46
	for <lists+freedreno@lfdr.de>; Thu, 24 Nov 2022 01:49:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7028D10E66E;
	Thu, 24 Nov 2022 00:48:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F0F010E670
 for <freedreno@lists.freedesktop.org>; Thu, 24 Nov 2022 00:48:19 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id e11so231239wru.8
 for <freedreno@lists.freedesktop.org>; Wed, 23 Nov 2022 16:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m7afU0zY2iy3fcGz+GawNZWOfW2OGctpWqTEihbQc8o=;
 b=X1ktmbuxUtprr95vwa/Jqij/BOKG3dAJ70YWLdPNa4R9yOaHzbwEnM7EmlhJVOLnQ/
 YkuiIHEJdvxQva+YwrJJzKTzIGqg798SZMRGvcmwqbCdEQdMKqiC80kgijD48kMcnfrm
 Nb7lQcbl/WM4F4/EbiEqH/6Pe2S49g83U85bFStaOjR/dUD5y2TZz5Een5C5jCs9W5BA
 j4KCxmn57v+OXYMLRhZKA1UqFyRc0ZbnxWyvDWp5aYNNcdVqpNTOaONfMKrbjFcXpJa/
 zxEEfB+SYOkC48GmICOo5fVLq16KF8vrKz+I1lQBaqYDcK369Kq9OWfJKbclALXt71Gg
 qG1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m7afU0zY2iy3fcGz+GawNZWOfW2OGctpWqTEihbQc8o=;
 b=CA+y/61+6huSlRqYWp+M4pJtc5G28mWjVTyUIx0zxhEhMkfdz3E5FVqPvmOUv3h4EC
 Q28h08CsJIXUKzWXsCKLGNfdKtS7eTkKXY1CBF+dQGGpnTjXqS0Ev3sNlKn8l/NUEi4D
 IzTnNw9gUYoKypsOAgiGw5ZQieHiYz+gDXnPLdxdvlxlkcyCblhGRr5AVAY0Bh0ltXZz
 bf1js5i9fEshkIqJ7yyWg8DxxFz7odGn89P5ZuwrQVz1shafSsWAeenVNOXdn4BnloVh
 wsoXHOiRqWFMWwx0w3dhv6xUZmxOTR8D9XwIQqshlCjod/QGLx29HsdYI9vTqR+vElC9
 79LA==
X-Gm-Message-State: ANoB5pmAOcClzWwg7CB3srBAtvbkgO1IdZUQ4hkaxhcSI9vi2oi4D+Wk
 1kJ5dWEMykjZ+M+XxdAge0Z6cA==
X-Google-Smtp-Source: AA0mqf7cEekN6X6KQ4eos1UGBo978jGXjtZiZg32pj/0lH0vHRvTIorDX3ON/RRVv4zJAeY6zcF4jg==
X-Received: by 2002:a05:6000:1105:b0:22e:3498:9adb with SMTP id
 z5-20020a056000110500b0022e34989adbmr7343268wrw.335.1669250898063; 
 Wed, 23 Nov 2022 16:48:18 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 n38-20020a05600c3ba600b003c6bbe910fdsm5245076wms.9.2022.11.23.16.48.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 16:48:17 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Date: Thu, 24 Nov 2022 00:47:54 +0000
Message-Id: <20221124004801.361232-12-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
References: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 11/18] arm64: dts: qcom: msm8916: Add compat
 qcom, msm8916-dsi-ctrl
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

Add silicon specific compatible qcom,msm8916-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for msm8916 against the yaml documentation.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index c1d8a1b388d27..20e72038cadfe 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1021,7 +1021,8 @@ mdp5_intf1_out: endpoint {
 			};
 
 			dsi0: dsi@1a98000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,msm8916-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0x01a98000 0x25c>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

