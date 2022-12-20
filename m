Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BE86520A6
	for <lists+freedreno@lfdr.de>; Tue, 20 Dec 2022 13:37:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FE9810E3B0;
	Tue, 20 Dec 2022 12:37:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E76C10E37D
 for <freedreno@lists.freedesktop.org>; Tue, 20 Dec 2022 12:36:52 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id h16so11551089wrz.12
 for <freedreno@lists.freedesktop.org>; Tue, 20 Dec 2022 04:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xqJ/2ht7lbI+cE9vNUibll19HYg9bvHab40pOiTr8QE=;
 b=bWiX1bT4m3K5rX8A5b9lYS9TWaxEfROhuNxLiByd3L6Cwp6mtPbZ+0zrxBO/POeUi7
 76ZB/l3/eli14mBS3i22/0Y6W9Z+u1gJxbqlG7LweUCn2giuESt/HVd86OaxcH/+UW75
 EIJo5sLLdasrKwwHvClaM6/d5ZHcWuH8AGoqEU+AbdNn9/MXFV9Pxc26SHa6oX0L6XWF
 t/nD78fMJPAY7U0O6RRCq5tbUf1vIYief2ktc17hGyGJ/jfLQ03ZGgbc+pwgPVCkP04A
 xfCEXNsnPsHImBDjseF8P1TjXN8kN99aBEcHi+DB3hpzJPjyARm6FaybKXqooS6pKG7+
 Diwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xqJ/2ht7lbI+cE9vNUibll19HYg9bvHab40pOiTr8QE=;
 b=3z3ANkSe6wYED1zjhXIVNJrQJWHpcYvARB7De2QlclGNxaTXnzM+ezyjBnguUT27hB
 DveFRjQ9jMiqb+hzbep8vkAfu6bRnYKpAx4XGaWZaExvg7rZCarrcGwXQHwk26iRCniR
 YwJo6LkY2eYtzmJLPhrX01wyoPwBL0nXfoT7x+4fQGDyTokff7XNOaQnmILEDFNvMqJi
 fEUhNtI4FlKyAcWu57UgEKlpikL2ATwfC0YcYr5NVSiuGDoF8PLjyl+xNCc+M6O5mpif
 N+fd3/VbMfFczNCC0g0hTdKtA/eg4xb5qDrSYvFVn4PF+VXADYSyM3gL3+bGxrLDtDKq
 lH1g==
X-Gm-Message-State: ANoB5pnEq8xTIgW6SufydK1hKPgQhFaEQhEVP9eqANMLQyZsVXot1YUS
 w3oQ95+Z8P4cYm2e6HqSrjxomA==
X-Google-Smtp-Source: AA0mqf6Sc9Y+9CNxhHcnsKtt7FIMeS3KstnOErEjMMoR2KOLlNbcn4cz/d+S1IX5I0KfAVTuzBy7gQ==
X-Received: by 2002:a5d:5d0b:0:b0:23a:5a31:29f5 with SMTP id
 ch11-20020a5d5d0b000000b0023a5a3129f5mr32784279wrb.23.1671539810014; 
 Tue, 20 Dec 2022 04:36:50 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 da13-20020a056000408d00b00242257f2672sm12641208wrb.77.2022.12.20.04.36.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 04:36:49 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Date: Tue, 20 Dec 2022 12:36:24 +0000
Message-Id: <20221220123634.382970-12-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
References: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v5 11/21] ARM: dts: qcom: apq8064: add compat
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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index 0da9623ea0849..1f3e0aa9ab0c8 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -1277,7 +1277,8 @@ mmss_sfpb: syscon@5700000 {
 		};
 
 		dsi0: dsi@4700000 {
-			compatible = "qcom,mdss-dsi-ctrl";
+			compatible = "qcom,apq8064-dsi-ctrl",
+				     "qcom,mdss-dsi-ctrl";
 			label = "MDSS DSI CTRL->0";
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.38.1

