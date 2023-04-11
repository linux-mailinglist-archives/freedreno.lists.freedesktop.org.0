Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2D96DE4D7
	for <lists+freedreno@lfdr.de>; Tue, 11 Apr 2023 21:22:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E4FE10E656;
	Tue, 11 Apr 2023 19:22:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C985410E650
 for <freedreno@lists.freedesktop.org>; Tue, 11 Apr 2023 19:21:59 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id y69so16259183ybe.2
 for <freedreno@lists.freedesktop.org>; Tue, 11 Apr 2023 12:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1681240919; x=1683832919;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/UKK5UX1sxA/fn51ycSNCkY1kfW7huepZ1JtlF3gmCU=;
 b=MODAKOLAe1mrFHbVLmSTy4tXpGrI6txQIJfm5HU7lN1WAtmS7oqJ7klQsvQAaLo3Mv
 k8OMqRaomz/vkCR9BzzUkJJv28dzjJvu2nY8yN03/fbdeRP2ul5C3BOPODjVzN1fjkmK
 /WmeqkGRYSOVzBsjuQZyqTqHPf3MZiaBOuQN0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681240919; x=1683832919;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/UKK5UX1sxA/fn51ycSNCkY1kfW7huepZ1JtlF3gmCU=;
 b=vxS02S3tO+/RyDckKeVwRoRgyCaaaT/dfjzxTbX24jmypuzojHqLcyyWfE1b0IeyUw
 CGYlWyY2P9Tfks4Df7f3PMiTB3oMHdzImFS9U85HN/u4l8MO2p72aNJ1C8l8h7AApsQV
 6wOFaPIV1suWrY4JKoAhPbcj+MKh6XTu18yMEW/d95DQMuDnmlCPaGcn33A47vINc3Yd
 2zAAbMKd9hGZ5IPnzaYB4bkNn5B7ae1DlZiu9xQRX0+4jZdgxQCiqpFUkJ7fMF78g98t
 egCSupGv+6rZcEBqfXMSV32w4/wKMs1oi7yBcj8QjR8n9QFu5e4/xEikwh1lqCZjRMEz
 4uxA==
X-Gm-Message-State: AAQBX9dhzPWuoujEi515fqmkCC7fLa6snsZ5/VEZfGv8Oj+s46LaqsxN
 fWvJtmC/kL5TlpEvV8/OJdq8rw==
X-Google-Smtp-Source: AKy350Y0AFVRCh26uZEEXl/caeeSKSUSmctYd6tMGvN9clthojK4HZRfhP/DRCF/UTqrV0O1hw6atA==
X-Received: by 2002:a25:6d87:0:b0:b8e:e918:33ac with SMTP id
 i129-20020a256d87000000b00b8ee91833acmr5372721ybc.1.1681240919489; 
 Tue, 11 Apr 2023 12:21:59 -0700 (PDT)
Received: from localhost ([2620:0:1035:15:2991:9b76:4e62:65bf])
 by smtp.gmail.com with UTF8SMTPSA id
 u74-20020a25ab50000000b00b7767ca7485sm3834942ybi.34.2023.04.11.12.21.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 12:21:59 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
X-Google-Original-From: Mark Yacoub <markyacoub@google.com>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Tue, 11 Apr 2023 15:21:33 -0400
Message-Id: <20230411192134.508113-10-markyacoub@google.com>
X-Mailer: git-send-email 2.40.0.577.gac1e443424-goog
In-Reply-To: <20230411192134.508113-1-markyacoub@google.com>
References: <20230411192134.508113-1-markyacoub@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v9 09/10] arm64: dts: qcom: sc7180: Add support
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
 linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

Add the register ranges required for HDCP key injection and
HDCP TrustZone interaction as described in the dt-bindings for the
sc7180 dp controller.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
2.40.0.577.gac1e443424-goog

