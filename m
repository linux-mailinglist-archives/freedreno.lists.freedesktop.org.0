Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14354675F4A
	for <lists+freedreno@lfdr.de>; Fri, 20 Jan 2023 22:01:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D6EB10E3AE;
	Fri, 20 Jan 2023 21:01:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8F0510E3A6
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jan 2023 21:01:22 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id qx13so16904044ejb.13
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jan 2023 13:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Veplr5IplpsIE+N/JtztnF6OOoAX9f7YpVDcqrasHfM=;
 b=Xls9h+sYxcvDr5UTEpAeFZMPxFyMeCNqBGGV7vygDNLUNL+XxP8sxdaL1TXOzP/NEN
 Uba+eSQOUlOscqZ/ysX0/G5a1PQ58eo9JjVOlhlPMK/JkjAzoZOlVJxs9jxTAznK/4bQ
 gmF6latMIRPTBp5X0pDHLu38t4lZ6w/XmXKhiMfd1FkNwFt+dgjjL4fz6XO4u9RA6mV6
 YIRr81WWZJLEKILxG/vyq2gkFliFC5fQN2l+Qo3oIVFcX4v2/i7L17WA8U2N/bOtXnr4
 d/2lSTaYG+BmxoJYIjbM4J6IYAIxNytRW/c44R03mmcWJY7gHAwPvqw64COrjEHf2Tbd
 yYqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Veplr5IplpsIE+N/JtztnF6OOoAX9f7YpVDcqrasHfM=;
 b=P0JyuZY4BOhE7A5KSRHz91WBPOg6ioowp1i45z5VWOVli9q6ZVPADk7g9a8dQ6+oEr
 bcKrJnKfQlmvs08DXcw4cI1LzFGIhvYOKD++7v5GMyt1qd7O7EDLTQhlspdR3bTuQDvl
 omihyjXOeUt0/M90spCi8AS4k6d+iwxbPmznFwTQ7tFaDBTqZAskpfCho7iXGBPcZRL0
 m96r8BFiImo9bGy/ao5hEN0rqIEcnPvfVDezOew4367Sa/g91DlXcBJd2Y94cBfD9zuV
 3b26FmqAtJZ+iIvklz9nprVlqmzomPJLQkl5xavnu37AwC3iekPSYOK8cjrJ0nJvy6HH
 aUqQ==
X-Gm-Message-State: AFqh2kp4PdZa7TClLA2/ylzfWtuTjWS4/S9Gt/i9IE6YLbOvuPeXuI8M
 homb6dCRFML30i+hNk7SRPUEIw==
X-Google-Smtp-Source: AMrXdXsGSpMHspdo9UKJBzUTwC3A7SP/koad8iFC23sChS1yCaQRgkl0iJPOCJHE71sUkuP+nLdtKg==
X-Received: by 2002:a17:906:5f82:b0:871:45b2:19fb with SMTP id
 a2-20020a1709065f8200b0087145b219fbmr16125826eju.25.1674248481420; 
 Fri, 20 Jan 2023 13:01:21 -0800 (PST)
Received: from localhost.localdomain (abyk37.neoplus.adsl.tpnet.pl.
 [83.9.30.37]) by smtp.gmail.com with ESMTPSA id
 g22-20020a170906595600b0087221268e49sm6581229ejr.186.2023.01.20.13.01.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 13:01:21 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Date: Fri, 20 Jan 2023 22:00:56 +0100
Message-Id: <20230120210101.2146852-4-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230120210101.2146852-1-konrad.dybcio@linaro.org>
References: <20230120210101.2146852-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 4/8] arm64: dts: qcom: sm8350: Feed DSI1 PHY
 clocks to DISPCC
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, David Airlie <airlied@gmail.com>,
 freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Rajeev Nandan <quic_rajeevny@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This was omitted but is necessary for DSI1 to function. Fix it.

Fixes: d4a4410583ed ("arm64: dts: qcom: sm8350: Add display system nodes")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index ed0106829cb9..c964d939289b 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -3159,7 +3159,7 @@ dispcc: clock-controller@af00000 {
 			reg = <0 0x0af00000 0 0x10000>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>,
-				 <0>, <0>,
+				 <&mdss_dsi1_phy 0>, <&mdss_dsi1_phy 1>,
 				 <0>,
 				 <0>;
 			clock-names = "bi_tcxo",
-- 
2.39.1

