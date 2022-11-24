Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C83636F54
	for <lists+freedreno@lfdr.de>; Thu, 24 Nov 2022 01:49:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B209310E67F;
	Thu, 24 Nov 2022 00:48:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B03E710E66F
 for <freedreno@lists.freedesktop.org>; Thu, 24 Nov 2022 00:48:26 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id b12so264877wrn.2
 for <freedreno@lists.freedesktop.org>; Wed, 23 Nov 2022 16:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fJAlFZkHe4ktdw1E/cS67Ub6i2g6utdoyS6sjNqUgDg=;
 b=BmMvNzdp4Xr4It8CS2XqOsQ0/1pysRn+1u1rAugAEK5HREZVFB7vvN4R59kbSwCMIn
 z7VsyDiQMa30nyPISddzck50OSKNyKCEyi9+LEFtWgFgaJraxZ8XHTtOtcPBBOPexMJz
 3VlirAd7VrzLNDbK+LHzCwvuY0+Pvt1clDQ+1YfsxYA6WNsEyy6uPcnATNbEtUe1qsju
 1zDQWMq1i2xavL48Hunj9aWqU9S3KDz7OKVg/61HjKG/4HB7bSG2fi5dAJfP9majhq84
 94gupsXkuxRex8D9lkr9O0Gg9V9E6MaiuCOxXbQBh5ecClvbtQC2nCxXqH8XY0zCnEoo
 HZQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fJAlFZkHe4ktdw1E/cS67Ub6i2g6utdoyS6sjNqUgDg=;
 b=Bhcs+M8cCSflTt7S6Vww9VCJ6hxY1M72vxc61eV8pLJzMLoUnXmTA/boWMafkjFo5u
 2VwVi04kacoWljLGf2/+6iAwEynL+K8ojKxm5csWBA/y/rtHTYl6AiWZZv+ULT7tYycy
 sqG1kvOY3TKBTUbxBgh52Ne89TNbw4JvNLP2rKFbCNcAEycgfRjtV1YLtCvHWXOTzb8W
 5ZmQbQ3ipoHLX6YOFvUftg4G8MTXXYZbSNQ9ocpKK3nfDWX5Bu8L7sekY3Y/zCt5++/X
 Ld8ELYRNLwefXDKjAz173Ahzo22fgNiT8E08sUG793gfSVtaAfuLlcwfYTmQiBd+cSWw
 5qDw==
X-Gm-Message-State: ANoB5pnx0ToBN2L3+9eq6z5lvt7ok6ziSrKXqn6xAZnQxE/PLS6ANa55
 rlAGn7a0uNMaKAXmJoOMvq0gmA==
X-Google-Smtp-Source: AA0mqf409kRCLs15fCT6QuF9r3/Y5UfFTpHhWtaSGVJ2ihs3KhdXLmuB8UNDqK9RXjsd3IYNETwofA==
X-Received: by 2002:adf:e2ca:0:b0:22e:4ac2:aaa5 with SMTP id
 d10-20020adfe2ca000000b0022e4ac2aaa5mr18599351wrj.455.1669250906331; 
 Wed, 23 Nov 2022 16:48:26 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 n38-20020a05600c3ba600b003c6bbe910fdsm5245076wms.9.2022.11.23.16.48.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 16:48:25 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Date: Thu, 24 Nov 2022 00:48:01 +0000
Message-Id: <20221124004801.361232-19-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
References: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 18/18] arm64: dts: qcom: sm8250: Add compat
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

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 0d47c5b7148e1..8a73f1b487043 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3528,7 +3528,8 @@ opp-460000000 {
 			};
 
 			dsi0: dsi@ae94000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sm8250-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae94000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
@@ -3619,7 +3620,8 @@ dsi0_phy: dsi-phy@ae94400 {
 			};
 
 			dsi1: dsi@ae96000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sm8250-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae96000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

