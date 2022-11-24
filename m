Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77632636F2D
	for <lists+freedreno@lfdr.de>; Thu, 24 Nov 2022 01:48:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 122AD10E687;
	Thu, 24 Nov 2022 00:48:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E7B510E66D
 for <freedreno@lists.freedesktop.org>; Thu, 24 Nov 2022 00:48:18 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id t1so243003wmi.4
 for <freedreno@lists.freedesktop.org>; Wed, 23 Nov 2022 16:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I+k5fH615JqiFsP7tNa0DK5jiBnHb78Vs4d6jr8q48o=;
 b=HZlfh6U6lIrNSFoHiUXC4H5BGYR8JWCmyUon8xnAvLCVukXkfbzf7i9ekoTKRSnUKL
 G725IXSmVSx/E8f4FAAKG9idiFXsFneHXZCMS0rRB6QRDvOsXvj9Uoq8Em9lIDs5AZhD
 3D9VRngp/LjR1V54VOunrhXurcfwcC+5UGIIc+ptx2mcJoxUdejH3UAEaVh+Ljs6uE3Z
 BnfOpmhZdO0NVytUjaR9UB8t3FHzGFs5++P9eakcjkAVRJVhlftNPPYkeXs8incbW8VK
 6wmB8XZlOI0xj7ZJHyDXztuCLA7FmRGKVCXdJs1TNx16JweFmJkpglJPhmExCEJv6oKz
 zRJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I+k5fH615JqiFsP7tNa0DK5jiBnHb78Vs4d6jr8q48o=;
 b=5RtyqgCsU/aqnGxegzIYe22xTeCEXE5x+9sW2ed2/7CBY43gUboa+M4n0rUusIfN3s
 w3e79MZ4ib24HoQwpP4wcz5c1jZQT7QpCbw4HMVjT7rTGRuJRPHK+OwtsfAG//Ob0s37
 fj2xAlLgcjg5d4A0yD0qbGKayUlbGylIvBXeQ2g9iofZQez7vGUzWJ5JybeCSoeZitYu
 yhgm5gpTW5JDzTf7+eGAY44oWslgR5ZuIoTiK4eWFPFgb3bwvqlJzU5O4LjupudoQtjc
 FnKex2/wYETbWMvh9w4rrZZBrPl6vKy7sKZhRthsRV8WqtO1dw+6If8Xfwyrn/JkUJN7
 QpNg==
X-Gm-Message-State: ANoB5pnj9/5aVFogt2HNbotqCe8ql4jw+CKHzxidAC8RE1Iza12Qtruf
 1JZIYt/d2zGXB6IXyEeARGcHeg==
X-Google-Smtp-Source: AA0mqf4PnVQZ+5TxNNbiaKv4WegvybTXylYzzZSe2sLB2eHHUB9bGvqfhr99Xzjp2z/BIWPw1jw/sA==
X-Received: by 2002:a1c:7404:0:b0:3cf:b091:e5a1 with SMTP id
 p4-20020a1c7404000000b003cfb091e5a1mr21589916wmc.44.1669250896906; 
 Wed, 23 Nov 2022 16:48:16 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 n38-20020a05600c3ba600b003c6bbe910fdsm5245076wms.9.2022.11.23.16.48.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 16:48:16 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Date: Thu, 24 Nov 2022 00:47:53 +0000
Message-Id: <20221124004801.361232-11-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
References: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 10/18] ARM: dts: qcom: msm8974: Add compat
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

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 21d943d4b02d7..b4361f4318ece 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1545,7 +1545,8 @@ mdp5_intf1_out: endpoint {
 			};
 
 			dsi0: dsi@fd922800 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,msm8974-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0xfd922800 0x1f8>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

