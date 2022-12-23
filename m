Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75919654AE5
	for <lists+freedreno@lfdr.de>; Fri, 23 Dec 2022 03:11:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2730D10E5FD;
	Fri, 23 Dec 2022 02:10:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D122B10E5EE
 for <freedreno@lists.freedesktop.org>; Fri, 23 Dec 2022 02:10:46 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id m14so3382743wrh.7
 for <freedreno@lists.freedesktop.org>; Thu, 22 Dec 2022 18:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZI/lLtloM4Tug4sA61Civ+cVcFduOFVW5YccHSGp9ig=;
 b=Lixs1LtEmxS//vCTrerJk1KgAHJNQEhXyIFjU8wANYI4EzWGUrB1M8R3vcEt3sMz97
 97sFqlabHsvnk7jlW8M04OyRODzQYe4QH5Gg3JTsQBCe5VQt2kII5Xqx7A/yMcMcrm4z
 9HujaErRwi1Xyh127xnT65LeCPl3ZsvFstn2+LSTFY9SHLBXmDd1P9j9qN88iOTyCLHR
 ow8si8IEq5RTdawFy27ba3RL4ZUAMEn/QrE56VcnFPaSDHccoGick03G4R85huF6DUE2
 mmMchZz2rVDkrvYw9bYaFcvxFJzaFsIcU0OGHpKtKW5nK8qEo/HSiIWNYoHPVI8DFlZt
 GHxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZI/lLtloM4Tug4sA61Civ+cVcFduOFVW5YccHSGp9ig=;
 b=JMa3DTPkok3b5J7Z+5h+G2nqxsFFI9FxyUNA2I2RK21LHyY5w5JWI4hqdMIVepFGUO
 kmt8WSUvfnJkKX5WQN/jhtHBh1kL+gDk862dOQv3r+YIkc/R6lQiJrTHFw4rok8ZWkgu
 J7JUumE/EiAhrTUGXLZyvSFoQIhHLfMYdlhlFUBqeM42uPJ87EFzYldK9PQnZEE7vbkz
 MZF88BNcQlcNyD7Kx3l44xCJXkFZy4OeZ6vUAt+goNKHHZVCt8PBfrf25tQs8/gltCea
 VBnSpjzGAoBB7/TB0UwgU+OxUbMCYjU2wahpR0jwClZKm3SAyalMuZ3+5bUweiQYUNSF
 0M9A==
X-Gm-Message-State: AFqh2kpxeS82qPX/9f2oYhg1Zq+qIo2laeic05bPvzo6F6HU60nketEx
 94R3wpicSuLejetfKCfVApocqw==
X-Google-Smtp-Source: AMrXdXu0Ct5sH64r5l0zVx5XSTFPb97WZmvS9DEvDVB13mOCtVUu/cj4T64SwhJp3Zu63rwRBDxBXg==
X-Received: by 2002:adf:a15b:0:b0:256:ffcc:49b7 with SMTP id
 r27-20020adfa15b000000b00256ffcc49b7mr6150135wrr.62.1671761446435; 
 Thu, 22 Dec 2022 18:10:46 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 j11-20020a5d452b000000b0022cc0a2cbecsm1849725wra.15.2022.12.22.18.10.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Dec 2022 18:10:46 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Date: Fri, 23 Dec 2022 02:10:24 +0000
Message-Id: <20221223021025.1646636-18-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221223021025.1646636-1-bryan.odonoghue@linaro.org>
References: <20221223021025.1646636-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v6 17/18] arm64: dts: qcom: sdm845: Add compat
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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 65032b94b46d6..623e5d7dddfd2 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4645,7 +4645,8 @@ opp-810000000 {
 			};
 
 			dsi0: dsi@ae94000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sdm845-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae94000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
@@ -4716,7 +4717,8 @@ dsi0_phy: phy@ae94400 {
 			};
 
 			dsi1: dsi@ae96000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sdm845-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae96000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

