Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 114696C865E
	for <lists+freedreno@lfdr.de>; Fri, 24 Mar 2023 20:56:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B247B10ECA8;
	Fri, 24 Mar 2023 19:56:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3893C10EC95
 for <freedreno@lists.freedesktop.org>; Fri, 24 Mar 2023 19:56:30 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-53d277c1834so52295177b3.10
 for <freedreno@lists.freedesktop.org>; Fri, 24 Mar 2023 12:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1679687789;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RhYYIOBYcZyuSgRg3T8Pd2sS16OkXMZ4m3rP2gSu380=;
 b=Ag1iuj+S6Z4Y1lJXAJrY3Mn8rfl+2AN6RUbB8FF2Efu80+W0eu2S4qc4iffzQK5imi
 KtGvwVv+Y81ZAhJfdbRo4IJWyWDQAbD3q1mJB1aw+lbPCOObJxjMBH+DQV0k89wiZOCa
 HPsFgWcc5IvMIKhtXVJ5xFdQR04JSYSXzZuAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679687789;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RhYYIOBYcZyuSgRg3T8Pd2sS16OkXMZ4m3rP2gSu380=;
 b=Tz2aI9ynLU1AnvzVnYS4i9uqU5nXtmpwcdHuUYKFxVDdo36uVWWkJrDSf6YtlrxWY3
 ztJXo/rg88oT+RwHpsa4a38mIGWvumcxhlt2LK0GS+XpY08WJxTHBOXztqmUkSwe8DC6
 5xWAOutMOvbY12DJYn+J5D88CjLKiX65WPAjFpkqLdIrtxgJsSGnuSCZE0MqUSh7O6QL
 ZjeWrFefZit+cgntV5xnf1fMuhWJvbPfEDKMiz3E3QyEdUTO/ZsZsPIUGHwjF85XAstf
 uGYZLEOKnNifa/5OdVASxADV1ilp9y5gEkgEFltKHkQWdSab8+Q2bf3Qklfj/rJu4qo0
 KGbQ==
X-Gm-Message-State: AAQBX9fTU3yTepL+hI0P531Me+5ukMqzf3Q9VKWwho4o8vAS4r132D9W
 eYX+W0r8LymaDSz8/Ksu4sBaiA==
X-Google-Smtp-Source: AKy350b0eLq7t4fJJ/Zw35tvDmcmY1talDrP39suxk4lgr7xXjMPvQemHVU5OnqjI17ffqbpaaE2mw==
X-Received: by 2002:a0d:e808:0:b0:543:53c:e3c with SMTP id
 r8-20020a0de808000000b00543053c0e3cmr4002039ywe.2.1679687789154; 
 Fri, 24 Mar 2023 12:56:29 -0700 (PDT)
Received: from localhost ([2620:0:1035:15:5509:ec45:2b32:b39f])
 by smtp.gmail.com with UTF8SMTPSA id
 204-20020a8112d5000000b00545a0818495sm594780yws.37.2023.03.24.12.56.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Mar 2023 12:56:28 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
X-Google-Original-From: Mark Yacoub <markyacoub@google.com>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Fri, 24 Mar 2023 15:55:53 -0400
Message-Id: <20230324195555.3921170-10-markyacoub@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
In-Reply-To: <20230324195555.3921170-1-markyacoub@google.com>
References: <20230324195555.3921170-1-markyacoub@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v7 09/10] arm64: dts: qcom: sc7180: Add support
 for HDCP in dp-controller
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
Cc: devicetree@vger.kernel.org, suraj.kandpal@intel.com,
 Mark Yacoub <markyacoub@chromium.org>, intel-gfx@lists.freedesktop.org,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, seanpaul@chromium.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

Add the register ranges required for HDCP key injection and
HDCP TrustZone interaction as described in the dt-bindings for the
sc7180 dp controller.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
Signed-off-by: Mark Yacoub <markyacoub@chromium.org>

---
Changes in v3:
-Split off into a new patch containing just the dts change (Stephen)
-Add hdcp compatible string (Stephen)
Changes in v4:
-Rebase on Bjorn's multi-dp patchset
Changes in v5:
-Put the tz register offsets in trogdor dtsi (Rob C)
Changes in v6:
-Rebased: Removed modifications in sc7180.dtsi as it's already upstream
Changes in v7:
-Change registers offset

 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index 47f39c547c41a..63183ac9c3c48 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -816,6 +816,14 @@ &mdss_dp {
 	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&dp_hot_plug_det>;
+
+	reg = <0 0x0ae90000 0 0x200>,
+	      <0 0x0ae90200 0 0x200>,
+	      <0 0x0ae90400 0 0xc00>,
+	      <0 0x0ae91000 0 0x400>,
+	      <0 0x0ae91400 0 0x400>,
+	      <0 0x0aed1000 0 0x174>,
+	      <0 0x0aee1000 0 0x2c>;
 };
 
 &mdss_dp_out {
-- 
2.40.0.348.gf938b09366-goog

