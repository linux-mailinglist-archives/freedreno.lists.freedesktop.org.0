Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D58E2638A30
	for <lists+freedreno@lfdr.de>; Fri, 25 Nov 2022 13:37:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 130BC10E765;
	Fri, 25 Nov 2022 12:37:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A7BD10E757
 for <freedreno@lists.freedesktop.org>; Fri, 25 Nov 2022 12:36:57 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id t4so3341404wmj.5
 for <freedreno@lists.freedesktop.org>; Fri, 25 Nov 2022 04:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m7afU0zY2iy3fcGz+GawNZWOfW2OGctpWqTEihbQc8o=;
 b=RtfCLuTjMOeEDfRS48uKivIdq58YtbVd6zFyIyPNRNT8PGIH0gITEYukf/jWJNGTNc
 KPEsrwq6GE/Cm5tlna11JjJ4pS+W56jS03C2RCdCvkzTIQWF8Q8V9lF2UHYXxfnBNSni
 P+en2LB13pE+PZeqPmBIH2Z7PJ1F3+W5pD8V6oedNSPOYuHZTy/EKSULOZtUsBqzilxX
 I46MszbXaU02kyT2GLc8vBBFr0OTmbtfEuWaXoQcelq6K93pDuS+n3mbHXejdoZYgcge
 7L6WUFknD4r6YWwKV+acOzAS/i38hYNKM+oVijhVA54yLRxkK1JL8WRF8UHOQ/A69Eqy
 ferA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m7afU0zY2iy3fcGz+GawNZWOfW2OGctpWqTEihbQc8o=;
 b=kRxLdtZ+/Dp0wnmlymU/UvtH0ysjwrS2FyblYl5WGsC4VWlLrRxJDJNvs2ROtQ3emK
 pbcfOxVh4KXBQM5Ev6aFqhDpYoqrzTkXFB9uLT7087vR2zXoHJlTQtMzwn810+dly3vA
 436XUejJ28bzdPf7EJQlb3iAXJSoF7aelssXjqJATeT0nAKG9BUK0ulGgc5I2f7YmJcV
 d7AWiEtUzl5H/9/B5jrsnFeIIapjR7qTjaGo5OjDPknZYWAh9qdrH50etNYUcoI78N24
 dKCAjCEaJLh/pOnEpCvyezdhTC4wwyzU9LHkbWiUD2lvW+n6WH+MQ91bVmvg9ePC95cz
 GHiQ==
X-Gm-Message-State: ANoB5pnLJRG1yAbpdGv2i/6Ye2Wlzs4dWijnaUDZED4vnrbY+dO2BVy3
 i4GmhkX4GH7+QOcBRP23cIPAsA==
X-Google-Smtp-Source: AA0mqf4zbOnZG7Lcv6nwc1RMCswiHsVB+h3CFBFo7Ogg96m69jqkj5cPX3nRzaNd0SrYH+9uusDcXg==
X-Received: by 2002:a7b:c3d2:0:b0:3d0:475f:d390 with SMTP id
 t18-20020a7bc3d2000000b003d0475fd390mr1852235wmj.149.1669379815380; 
 Fri, 25 Nov 2022 04:36:55 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 k15-20020a5d6d4f000000b002366dd0e030sm3574111wri.68.2022.11.25.04.36.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 04:36:54 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Date: Fri, 25 Nov 2022 12:36:31 +0000
Message-Id: <20221125123638.823261-12-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
References: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 11/18] arm64: dts: qcom: msm8916: Add compat
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

