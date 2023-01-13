Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7820766912B
	for <lists+freedreno@lfdr.de>; Fri, 13 Jan 2023 09:37:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 009D110E9B6;
	Fri, 13 Jan 2023 08:37:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B80210E9B6
 for <freedreno@lists.freedesktop.org>; Fri, 13 Jan 2023 08:37:32 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id y25so32090759lfa.9
 for <freedreno@lists.freedesktop.org>; Fri, 13 Jan 2023 00:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hLJMlwIE2ivCM5iNS4Yl4cLBMQjZouDwHRiiDzcW0CY=;
 b=am7RllIibc+4w5K4PgGtPzH98gavdp+XAnkoTcKSphbyuEveEVTFguX7mGPiSFjZ1s
 H/Af6MZHaAxbXS896sBuSK6z8wmewuUO5vPLYn+FeuEcKV19/qqjJRdzzwdx6LPQqicg
 apl2HxJ3DUEGrrydUTA+elfCpkBC8u0xOIDcDcX1+M+M1EIPCTH2i9R0qd4A9W3+O1ZI
 R5JVszRpmVTdVTXQhUbo7l1rZWwBheIQ6DF2lZJ3je0ItK25Og7pRUJ/QfgXp4DMNqDS
 c0Mx2HgyvuniOO0tK1XQ4a6GZE+XwAsbGFFYPOyK8cqbWdzxII6/3Wd5f0kSS74V9rMZ
 VNUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hLJMlwIE2ivCM5iNS4Yl4cLBMQjZouDwHRiiDzcW0CY=;
 b=urfWfLy+lOF7Kh/nNhGiwll6NG+TINvEXk2tpl1yV4UAufHkqlyMcTGI6q5mmYXzDs
 whVX1/WjZY2TVvS6lsjLcn6iPCzl2dyXkPpPJf8uVyZ5DSQQrLu62uqZfctImOmhPLVH
 8t/L7syYhcABAMp44v/keAERjkQi04bLYJY71yKV1gO0I2/lrKBHaG/441WRMXhguarM
 NRmYQzY3bc0eUJOC0htXi5OfHX3q0Xu6vg120u+gT+FwajcIFn+aYd6+92JOv08LF8XT
 BbQU3SvYvXrbvKnoUiJ8vL2fsk25+tDYbrw9qDAvliwd60W4u9kaxIUrt4BVyAJhfiJ/
 NVFw==
X-Gm-Message-State: AFqh2kpgqD6bmUCnl7v7vvvHQ02TUErh7ma7jiWljW90s2sNdgaA6mpS
 7Bm05s5pyjSGtjnIwGzO2DYTOw==
X-Google-Smtp-Source: AMrXdXvMzCtBw7xkuMvF9lviswazfUgh4vuKBTBKu8bOtElTX6ETEDv711lEA2TMVSbhPLifcOGYYg==
X-Received: by 2002:a05:6512:3482:b0:4d1:5baf:8453 with SMTP id
 v2-20020a056512348200b004d15baf8453mr171156lfr.11.1673599051591; 
 Fri, 13 Jan 2023 00:37:31 -0800 (PST)
Received: from eriador.lumag.spb.ru ([194.204.33.9])
 by smtp.gmail.com with ESMTPSA id
 o6-20020a05651205c600b004994117b0fdsm3748038lfo.281.2023.01.13.00.37.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 00:37:31 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Fri, 13 Jan 2023 10:37:15 +0200
Message-Id: <20230113083720.39224-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113083720.39224-1-dmitry.baryshkov@linaro.org>
References: <20230113083720.39224-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v6 06/11] ARM: dts: qcom-msm8974: add SoC
 specific compat string to mdp5 node
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

Add SoC-specific compat string to the MDP5 device node to ease
distinguishing between various platforms.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 3226507a6f09..1d8b8870b990 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1578,7 +1578,7 @@ mdss: mdss@fd900000 {
 			ranges;
 
 			mdp: mdp@fd900000 {
-				compatible = "qcom,mdp5";
+				compatible = "qcom,msm8974-mdp5", "qcom,mdp5";
 				reg = <0xfd900100 0x22000>;
 				reg-names = "mdp_phys";
 
-- 
2.39.0

