Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DF480B774
	for <lists+freedreno@lfdr.de>; Sun, 10 Dec 2023 00:21:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D81AA10E313;
	Sat,  9 Dec 2023 23:21:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F86110E30B
 for <freedreno@lists.freedesktop.org>; Sat,  9 Dec 2023 23:21:41 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2c9c18e7990so44532491fa.2
 for <freedreno@lists.freedesktop.org>; Sat, 09 Dec 2023 15:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702164099; x=1702768899; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3GZgKuZu+RtdOCNxwqqoLLGadbIzwEY8PzUJoUplRZg=;
 b=QYNgcilUNPXKgS6k2O3P+xhX7jyNia7Hx6KE5XwsUYedOFyAYJdkFRweQemRwSz+No
 Lm7zqCR24XzUtBhbGllWNg11QfhuuDvdBILSntllwWO/ef3unxoc63GCwfa6CBR8m+ZJ
 zo9wPd1KAtWWtz2Sa5SMBvtIyevjEpeMhdv5sKyAMv86gu2nFKql7JvFpg+6RZzFaCoZ
 5lDjN0ynUfW+H3i9NXfM0qhX+I/kqgMD+HR+Q6Zosufn8SBSptx/LpQA9ZYg0Dsw2VJx
 THdqU8DsWPoemPkn82Mt3JL3vu5fAE1ThUykGnDWBCWoJuGiwTn1LR1DcWAksWuU3ptJ
 jzuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702164099; x=1702768899;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3GZgKuZu+RtdOCNxwqqoLLGadbIzwEY8PzUJoUplRZg=;
 b=LTX/yJ2Ej+c9Ic0lerse7Mw8yxy3f8DHZZsc8+3kviA0LWI+vUcrP96iD2rF1NIGW4
 KWlJAYkupBgOD7oGUtw18VgP82t/znUv6J0se4IJp/zcJln7odA7MVeMG8q2CVtov5hM
 vAJ0HBtpy0PIQ9qg1qG3eQ2XN5mt76iM2SMBt6qWCDYP9KIJUtLgViY8FtV7Auec8ROt
 wm4l2sfTvOCHhuTdjBtzCF0zlFK15B/5oHyY7QQydx8ZtO60XvJgb7OAILQFR0bFe4Zh
 AqYdGy+h1ADXXBppmgWr73dNOD8hK/T7cN/v4+K6Xed8UTvE25MOgbpjpgCNbxHKw5ix
 LnCg==
X-Gm-Message-State: AOJu0YyAXHEl0VJ4ReXHoSJR4A0Z1iy0gwi6brDG8yNHz7NJ0GGf+Mg4
 /l8vJmFEGtjoMOTYTKrtQ8Vi0w==
X-Google-Smtp-Source: AGHT+IEYSsMk9cOndMCGOckOeg7OcH8sDXc9AxxmkfBY4lvASvw2U6bIWjPnfGmMGFoIvrwOAtRbbg==
X-Received: by 2002:a2e:b013:0:b0:2c9:f4c5:7f1f with SMTP id
 y19-20020a2eb013000000b002c9f4c57f1fmr764271ljk.74.1702164099406; 
 Sat, 09 Dec 2023 15:21:39 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z18-20020a2ebe12000000b002c9f59f1748sm685258ljq.7.2023.12.09.15.21.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Dec 2023 15:21:38 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 7/9] arm64: dts: qcom: sm8150: add USB-C ports to the USB+DP
 QMP PHY
Date: Sun, 10 Dec 2023 02:21:30 +0300
Message-Id: <20231209232132.3580045-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231209232132.3580045-1-dmitry.baryshkov@linaro.org>
References: <20231209232132.3580045-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Expand Combo USB+DP QMP PHY device node with the OF ports required to
support USB-C / DisplayPort switching.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index ea7c92c0e405..38423a9f8408 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -3447,6 +3447,29 @@ usb_1_qmpphy: phy@88e8000 {
 			#phy-cells = <1>;
 
 			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					usb_1_qmpphy_out: endpoint {};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_1_qmpphy_usb_ss_in: endpoint {
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					usb_1_qmpphy_dp_in: endpoint {};
+				};
+			};
 		};
 
 		usb_2_qmpphy: phy@88eb000 {
-- 
2.39.2

