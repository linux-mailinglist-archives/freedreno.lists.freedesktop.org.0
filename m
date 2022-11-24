Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F9C636F30
	for <lists+freedreno@lfdr.de>; Thu, 24 Nov 2022 01:48:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F4ED10E68B;
	Thu, 24 Nov 2022 00:48:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CA7710E670
 for <freedreno@lists.freedesktop.org>; Thu, 24 Nov 2022 00:48:17 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id g12so221110wrs.10
 for <freedreno@lists.freedesktop.org>; Wed, 23 Nov 2022 16:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DE+PlQB0cKY1Moq0C5fwuxl0f1qcbiOIElHev/W70x4=;
 b=S3iq9reBoNXzjyZUJ4Y1oiTjkQbS8Ds2/ZBf83ZYm+RwXkFfktXpOQD7E9KECYGAZB
 RDTMqDxNcDmdcpuIOEGbRPTHvm2gSzax/TaSJb23/2Umkx50rbTeBZGFqQ8x6SzJ+Tm4
 Mbfb4ZgcDxme3I8zegWrFAnkA4P4U4fqctsBVVaV2kaRxePmzBdsxm6IJAI22NbIJ3Az
 LDcdel4HN5OWHlQKuczzkDY2ETb2Vz+D0hCF7TiQFvEp/vUDv0suDlAZvZeeXOIZKUhr
 ENw5YYBTnH1XVfiFPEjTd0bbyNbdgQ2qBbWX224Y/eS0NRielSAfzTl1+EBIXInvMrYZ
 r6bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DE+PlQB0cKY1Moq0C5fwuxl0f1qcbiOIElHev/W70x4=;
 b=H0W8He45Zo8v195DISc1XnHtDAL4+3bQKtPurNs4aSge1R0Qa7FeAE35ph0ajUN7D6
 3mVVdtPe3tqfNkYzTTS61qI9FAt+xmO1xrsH2sxW7cJi/7o+jb/sK9NEcELcGATZFoEZ
 bV3+zj/GTJJcdERuO41CZHt4qcUdsmC9dBLNSR9HpY3I3gF+LPEbinbeAeN1y9+sPmGA
 Yyqc7Ab5qjmzL7FpQd6qDVRtsxijvTSaLWahBj6PPyxDBtNuMwiJndK7E/13rRrkm28L
 Zz+PFzOWc/SSrdtxngAwmHqrhMfpfKRTZR38hs24AbI3Wx+VKroYPQztYmqYAPfm/8nM
 /YLA==
X-Gm-Message-State: ANoB5pmJbgAhczmN9rpA+bI62sV9Lg2WV1E7bnX3l+3Ye2J35y7C8Rkk
 aE5gB949qScEFk5mfbRiZVjcFA==
X-Google-Smtp-Source: AA0mqf6fjZn0prOEpCWcToLazE5h25TknfPSJG2hbEg0kzP8UkJ/xnf+irWkERN8nfS904+UjNdNZg==
X-Received: by 2002:a5d:5744:0:b0:236:b7c6:7ef9 with SMTP id
 q4-20020a5d5744000000b00236b7c67ef9mr6874183wrw.10.1669250895693; 
 Wed, 23 Nov 2022 16:48:15 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 n38-20020a05600c3ba600b003c6bbe910fdsm5245076wms.9.2022.11.23.16.48.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 16:48:15 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Date: Thu, 24 Nov 2022 00:47:52 +0000
Message-Id: <20221124004801.361232-10-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
References: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 09/18] ARM: dts: qcom: apq8064: add compat
 qcom, apq8064-dsi-ctrl
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

Append silicon specific compatible qcom,apq8064-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for apq8064 against the yaml documentation.

Reviewed-by: David Heidelberg <david@ixit.cz>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index d036dff4b14f7..a8b089eb0dad2 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -1287,7 +1287,8 @@ mmss_sfpb: syscon@5700000 {
 		};
 
 		dsi0: dsi@4700000 {
-			compatible = "qcom,mdss-dsi-ctrl";
+			compatible = "qcom,apq8064-dsi-ctrl"
+				     "qcom,mdss-dsi-ctrl";
 			label = "MDSS DSI CTRL->0";
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.38.1

