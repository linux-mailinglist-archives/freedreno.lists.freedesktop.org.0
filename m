Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C25654AE2
	for <lists+freedreno@lfdr.de>; Fri, 23 Dec 2022 03:11:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2E4A10E5FC;
	Fri, 23 Dec 2022 02:10:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D13F610E5F2
 for <freedreno@lists.freedesktop.org>; Fri, 23 Dec 2022 02:10:47 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id m14so3382764wrh.7
 for <freedreno@lists.freedesktop.org>; Thu, 22 Dec 2022 18:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eHjoTnRNTZFA0ZBsqDkIXARH9jeUb+0DAfgRumKgoyA=;
 b=lBDQtSit+1LqfmJbT1uhbKUQP17QT6jOYcXSoMTBTOZLa2xXlUhOmhQKhAvtRFKopi
 Ay1nv3bo5Xrq8o5PcsK6DjS4wliQlovmoSSTSpInMaUc8mErA8Ro1SyVnrhidsTAfAzl
 SFv5CVFN01XmU0CiED1g7Wh6QdmlHPrvuSv0YkFUQWkCjCY4Crb582wgyPwFIVloO4iv
 UVn9aehPzGoeFjylzhnKGyO4yMuMEQIiQ/My8GmvBzObXQ4uLD6kmTKz3PeVzkTgXorZ
 RvAw4sA4vGMjWnfUnjv7wxYrvC92tR8p5w0OpByZ87hIyTzNOnVlEOFoKOix2lgJCbH3
 zzzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eHjoTnRNTZFA0ZBsqDkIXARH9jeUb+0DAfgRumKgoyA=;
 b=HH0JM9lalCdLKtqHVlT2QLnP3COQtpwKY9zp90sBE4dkxPaJAcBRTZu6U90mf8duz+
 cwVgU72ea3oTM57xA3OjiDGyoJRdPxOMr84xSQf6TtDjGCzaSZgrVYKHtJ5rT6Gc2X3Y
 dZURZMWozHJU6MohvhCdCRrL0o5FtzUDvzsDpgnh9HfCjwv3nZCE8GAzAcGW3LZCZ6RY
 6buuIptfXFwdMyWzABKfio7s6qUAj3zOIkgHQOs6OF6Zp1BTaz6CV9Rn1cLCOr+pYAJH
 QifPmjwsC8Ax+4SidfsMioy6bzhug/GV9KYil4V5r56sDGb3IVwNk7XIYRmf+GTclhQL
 4JZw==
X-Gm-Message-State: AFqh2krs0KANV8FEzM0PYmWlVlyM71MkmMQ4qsdgO/fwaPW7uYchv18I
 Gc9HRR2tzcoK40VximYPf3PvGg==
X-Google-Smtp-Source: AMrXdXsjlvDyNSKBvKq4fxfuBOK1I1bluwc0R6MKJ8g3VyJ6MY+VRGeAv1iWAuoPLG8kUzwNT8Trjg==
X-Received: by 2002:a5d:4950:0:b0:26e:7604:6575 with SMTP id
 r16-20020a5d4950000000b0026e76046575mr3878257wrs.65.1671761447428; 
 Thu, 22 Dec 2022 18:10:47 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 j11-20020a5d452b000000b0022cc0a2cbecsm1849725wra.15.2022.12.22.18.10.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Dec 2022 18:10:47 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Date: Fri, 23 Dec 2022 02:10:25 +0000
Message-Id: <20221223021025.1646636-19-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221223021025.1646636-1-bryan.odonoghue@linaro.org>
References: <20221223021025.1646636-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v6 18/18] arm64: dts: qcom: sm8250: Add compat
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

