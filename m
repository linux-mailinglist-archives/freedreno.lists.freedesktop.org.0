Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F18C66D2B1E
	for <lists+freedreno@lfdr.de>; Sat,  1 Apr 2023 00:13:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ACB010F31E;
	Fri, 31 Mar 2023 22:13:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA75610E4D8
 for <freedreno@lists.freedesktop.org>; Fri, 31 Mar 2023 22:12:37 +0000 (UTC)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-5445009c26bso440868297b3.8
 for <freedreno@lists.freedesktop.org>; Fri, 31 Mar 2023 15:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1680300757;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SuHM3Ml3PogV+x216rKe1L3nHLFo1MwYXwE4UpoFNeE=;
 b=PJ8MIaChYf1hyLs02a/4OwDicqZnjK09rM5XKqAm5kRJiZa5OJwqNVE7oFW2ZdibeK
 DLhFewEDf6gi51fE2aKpYzwFuKnIE7aVvhhw078JOMiJbWaIWwJmypIV5qLpDRY/ZbNb
 ZGa4ZNgtOSJlDdYCu/11y+DUkz9cd1EB5gMpE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680300757;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SuHM3Ml3PogV+x216rKe1L3nHLFo1MwYXwE4UpoFNeE=;
 b=hgeEchsBb8si9A29Pfv6MdxPa5CuqF76RgGI3Ezw8RzumSfExZIISTVD+WuKpWHGdw
 uhUpYeV96PXQyTAZolKaEb34HLIrRvZ+zpuSCEJ5zpr/kC60Z1DbHc7J0LaYdDHEFxG/
 IHUiXxAujZFsC2LOVx8TmVMm5QTm2u+2F+jb/T8VaWonRRQxXJ5WPa7AaZxv4nuGxYLc
 WLsMANv0lPM1g1B6qn4zaUx11Gq3eK1EGW9LFRECO+E9i9gPwBlIYornp5iFCK4SM93p
 6H7ErNhtEBWTbzcnZ+O8Km7Tc5lvOja9TMTuthcI+eaNcaxYeS708N+hBKH46q/7BRgG
 rINw==
X-Gm-Message-State: AAQBX9eWas/vWNiPlmbRfW1a6yk7pUpQmd1Fd10/Xk1Owwvl3tEV1N0m
 fwdzYuCMiHeJgnqvtTFA3cOvWw==
X-Google-Smtp-Source: AKy350ZF5Y47obuwMo5tN+7rE24Wl2VFFeifocBWiFVazpaCUbskHkorQPmYpadclKW6c2w3vyqWDQ==
X-Received: by 2002:a0d:cb15:0:b0:541:8864:c4b5 with SMTP id
 n21-20020a0dcb15000000b005418864c4b5mr9469428ywd.12.1680300756885; 
 Fri, 31 Mar 2023 15:12:36 -0700 (PDT)
Received: from localhost ([2620:0:1035:15:a8f6:869a:3ef5:e1d])
 by smtp.gmail.com with UTF8SMTPSA id
 123-20020a810381000000b00545a4ec318dsm796675ywd.13.2023.03.31.15.12.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 15:12:36 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
X-Google-Original-From: Mark Yacoub <markyacoub@google.com>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Fri, 31 Mar 2023 18:12:11 -0400
Message-Id: <20230331221213.1691997-10-markyacoub@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
In-Reply-To: <20230331221213.1691997-1-markyacoub@google.com>
References: <20230331221213.1691997-1-markyacoub@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v8 09/10] arm64: dts: qcom: sc7180: Add support
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

Reviewed-by: Douglas Anderson <dianders@chromium.org>
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
Changes in v8:
-None

 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index 423630c4d02c7..89d913fa6e3eb 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -822,6 +822,14 @@ &mdss_dp {
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

