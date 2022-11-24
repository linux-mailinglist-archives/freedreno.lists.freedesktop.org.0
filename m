Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7AC636F53
	for <lists+freedreno@lfdr.de>; Thu, 24 Nov 2022 01:49:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04E6110E67E;
	Thu, 24 Nov 2022 00:48:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D070010E686
 for <freedreno@lists.freedesktop.org>; Thu, 24 Nov 2022 00:48:25 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id d1so208040wrs.12
 for <freedreno@lists.freedesktop.org>; Wed, 23 Nov 2022 16:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hrZRxDUkNBpr7/CO3VUWuIRRJhqQxCbIa8B1ayhBv+4=;
 b=alnNX5/8pjWpNqitFxc8xrGTxdcS0z3LULJuF81hAIpPFFWTTo3LQ9bQALG3/37BLS
 QhbJWzQnPq+rBm8pE1V3rDXM0K0as0+3/GzJ1BFGrcg0mJvjaRUv9pqRng5j5oREb00x
 5OsaJvyHkqsUiXfbozEVFjM0/Ci4P7gOzaMSAAtM/GZLwE9kWNFWvg3OT4Ge38a5tYuZ
 A84lQPS7W7jnt3BQMmtofHlx8od+Mu+5FuaF7Sa0K0ry747MqpXVmfJb7yhTw9WxR52+
 aF4g+VsT7XdURvdFng3eMnRpH8sZtxLGc1B/25xlH9urLJDIG1+WUZ0Ti1+JhUcqyO20
 HYPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hrZRxDUkNBpr7/CO3VUWuIRRJhqQxCbIa8B1ayhBv+4=;
 b=jlQCV6j8jCRgrzs4WHMgFNN9BbhVoVq90QhzTJQ6LsId9Uqai8WFudd7keY/pWvBEA
 +UPdytgSloAist7wm4MQ5T87DvQwAYQ06NezECJIvsS1x37l4nIBd2Iwd++mvzO1gBwi
 u8oroLqgIu3cEIYVJef7ZLWsV94C7AdqJJpq+f+qZcEu2lUbrdWqJHtsPSpMRsot0/ds
 rUfjGRg+pJT5W9O3VhrrcZ83C3CS837VG4KDhAppBmlNtVkyobURTqUviRTWKYRKF4Kg
 s1lB1DHlPvot32z4iTpS/0MuA/BqIrcwGqxC/9kqoJ99A7FlqiJSeZvI3QvBYV4ybHBD
 8kqg==
X-Gm-Message-State: ANoB5pkdRk2juNemZgC2yAh0Sfx+viGuvbUjRd4HSLK7AbdKNwK4S2rS
 3O/xdVtak2aoqk+YFy6v0IJO6B/MZVEMlg==
X-Google-Smtp-Source: AA0mqf6FIDKl6U6xGN7PD002PybHgTf1Ig9NQ4P4OYT2DJSYPVWiWf5kxCCUb3pADhOUezMf3B0tpA==
X-Received: by 2002:a5d:4ec7:0:b0:241:e27f:840e with SMTP id
 s7-20020a5d4ec7000000b00241e27f840emr6368859wrv.690.1669250903944; 
 Wed, 23 Nov 2022 16:48:23 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 n38-20020a05600c3ba600b003c6bbe910fdsm5245076wms.9.2022.11.23.16.48.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 16:48:23 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Date: Thu, 24 Nov 2022 00:47:59 +0000
Message-Id: <20221124004801.361232-17-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
References: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 16/18] arm64: dts: qcom: sdm660: Add compat
 qcom, sdm660-dsi-ctrl
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

Add silicon specific compatible qcom,sdm660-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for sdm660 against the yaml documentation.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm660.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm660.dtsi b/arch/arm64/boot/dts/qcom/sdm660.dtsi
index 10bf1c45cf6ec..f8ec728e67f3d 100644
--- a/arch/arm64/boot/dts/qcom/sdm660.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm660.dtsi
@@ -154,7 +154,8 @@ mdp5_intf2_out: endpoint {
 
 &mdss {
 	dsi1: dsi@c996000 {
-		compatible = "qcom,mdss-dsi-ctrl";
+		compatible = "qcom,sdm660-dsi-ctrl",
+			     "qcom,mdss-dsi-ctrl";
 		reg = <0x0c996000 0x400>;
 		reg-names = "dsi_ctrl";
 
-- 
2.38.1

