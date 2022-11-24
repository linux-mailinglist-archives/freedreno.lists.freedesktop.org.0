Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D3A636F52
	for <lists+freedreno@lfdr.de>; Thu, 24 Nov 2022 01:49:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6AB410E677;
	Thu, 24 Nov 2022 00:48:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 932F710E684
 for <freedreno@lists.freedesktop.org>; Thu, 24 Nov 2022 00:48:25 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id g12so221529wrs.10
 for <freedreno@lists.freedesktop.org>; Wed, 23 Nov 2022 16:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dx2lQyIeBTqpqJ7X6Q0LzKVhxGjP5f4ToZ9EXleXAr8=;
 b=nZq0LPUCzHJydTVKuG9joKgS9Qp7pU83zNbU+NQ20OQf1e1drNWPcarofOJ4TPxY6G
 pbgtIt4W4cAFvpt/5B36QxjMAnM0ENr16AZ5xM16GtVrRWHgkasfMF2utVpixdDgr874
 Wrd0HZtJd2D1Hgs4C4YuVOIZZ/2QgE6WsklCpndc26fisc3bqhvtjZMlvTAyCG19jWFL
 EKwUlZsWoF3zpsRp78kz5avnTgN8Igg2lJ0XLzYQhQP6dVoCCSqjM9nnFP21Rncvnm+j
 RiRcKyiF2cfiUeeuUcuf6MdqkScJw2iIN44qGBZZ6pU042/jvy9B7RqBJRtGtpxU7kfo
 iSrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dx2lQyIeBTqpqJ7X6Q0LzKVhxGjP5f4ToZ9EXleXAr8=;
 b=kttH/swyvOWBWd0RpqWWeSe5xYe1eIf1CTivJOvLSTVDBVU/8jORjHjTxX8/QopCAc
 neNCZeGEBR91Cp+c4bTcpn+XfvI2aElCq5h8OJtdE0n2T/VvKVo21WEfuDIutChKL+4I
 faXr96iM27icBvegPxSDIc/vHl/DVCOPFeXvU3N5iAkv8ilxYvOBlEUDjyLnE1jteKdG
 VGblK/BfKk7Ddd9cCqAQZwx+LTORjrGWFE2EQkrnbVdSwVQ1XXnR6Aj98xCS7pWD4bhR
 ZDna2ChtszTyM5bSk2Qv8n5vpEuDSPmifZ77Ke1e3ORIx9yO2Coh9FGvCA80tU6ADE1h
 ucMA==
X-Gm-Message-State: ANoB5pm99terUFJl3i/N45y/NXrGqQizaUWHyBbejgQmFkDlcxgh/Mnz
 rHKPh1Ydgbg3d1O4l7LqkXUaxQ==
X-Google-Smtp-Source: AA0mqf6wmkoiUIkHFGYgoiY9tEn7mW3LakV3Zlc0BdyUOyrcyG1anqxl5v9rPZjACtASN9zGPvI3fA==
X-Received: by 2002:a05:6000:1564:b0:241:e722:3f8e with SMTP id
 4-20020a056000156400b00241e7223f8emr5430030wrz.133.1669250905128; 
 Wed, 23 Nov 2022 16:48:25 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 n38-20020a05600c3ba600b003c6bbe910fdsm5245076wms.9.2022.11.23.16.48.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 16:48:24 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Date: Thu, 24 Nov 2022 00:48:00 +0000
Message-Id: <20221124004801.361232-18-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
References: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 17/18] arm64: dts: qcom: sdm845: Add compat
 qcom, sdm845-dsi-ctrl
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

Add silicon specific compatible qcom,sdm845-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for sdm845 against the yaml documentation.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 5420205417c81..c14e49c9655c3 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4522,7 +4522,8 @@ opp-430000000 {
 			};
 
 			dsi0: dsi@ae94000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sdm845-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae94000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
@@ -4593,7 +4594,8 @@ dsi0_phy: dsi-phy@ae94400 {
 			};
 
 			dsi1: dsi@ae96000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sdm845-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae96000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

