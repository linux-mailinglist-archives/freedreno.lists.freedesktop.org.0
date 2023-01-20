Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8B1675F42
	for <lists+freedreno@lfdr.de>; Fri, 20 Jan 2023 22:01:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E048810E3A7;
	Fri, 20 Jan 2023 21:01:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66F1D10E3A5
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jan 2023 21:01:20 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id kt14so17035043ejc.3
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jan 2023 13:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HZI0mGZqPWNWXo10nShEsAnlud3zWKZXf/8L1lgJABU=;
 b=VKHyVpdfr1VP8s+ttJ18P1ptwa5pjtcz8Pd4A71OK+zYUz7QfN9HCLCaEf6v3vXD7I
 Po3EdOboLWrqsQe68s4V9be5TB/HvlFC2v6PCuE6NoX7JMgveySJRdFlTCGWkcrZG2C6
 Lgb8KW+orzRBZe6Wp0GI+CVCYgOMUUs6Jvxte9riSrqcGxlIsoF87FAE+e5L43I7+VrK
 6Qyv4kFRgi92nF1tKNB/YiDiEbBc7Uz8KKacz0fKEerLTYk6fOVjnmNv19GF98gEBCtL
 wpPKK6yjdp7zyJ98+Z+ciRWf66F6mQRhNfeObR+D3eSYK1bosWkpGjqPXolURzJLg6fM
 wIMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HZI0mGZqPWNWXo10nShEsAnlud3zWKZXf/8L1lgJABU=;
 b=FmPBqCnNpEXe+KqI5qACjjbl+sgSX1ODG9WIlzsVbCA4rsnoxc1+xVTPRHs1cXeQgL
 yqnaS1GdJhgkrzddhHWYjAfNisLymuxDbzJgjs1a05DWDad9oAnjJxUVrCTCd797BB3l
 yBDSehebVqdJDZaJmfLir0PNgLSpPuvlfptuzjqpGMpbS1wEyi8JLu4uJnaM4VjvuvAc
 6dRlOgts1jWBvdT/o4NPU9uuwrjllbV1TB9SlmV6A9ecDm8U24/QnoEkHF232zo/cuRX
 nS5CM4sDtT6Qi9tbFym8NnqeDT2uWZBegrQZUqbYnV82cRPf+/+lIClkf1QKstvCohLA
 1apQ==
X-Gm-Message-State: AFqh2kolkyQ3TrxWjjB0LM2j9Eiyhsxz+BRC64zVJWySTrDElnOnzsqj
 z6BF8bSN6EzDNo6USL6dZZgzCQ==
X-Google-Smtp-Source: AMrXdXtGHb97GiTH9eM7hMgq/1duL22/HTOfybkpkkSEk6RfbLNX2jepelJYZxwPa5Um3RKUWXJi6Q==
X-Received: by 2002:a17:906:1605:b0:872:41a5:7c78 with SMTP id
 m5-20020a170906160500b0087241a57c78mr21938890ejd.3.1674248478851; 
 Fri, 20 Jan 2023 13:01:18 -0800 (PST)
Received: from localhost.localdomain (abyk37.neoplus.adsl.tpnet.pl.
 [83.9.30.37]) by smtp.gmail.com with ESMTPSA id
 g22-20020a170906595600b0087221268e49sm6581229ejr.186.2023.01.20.13.01.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 13:01:18 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Date: Fri, 20 Jan 2023 22:00:55 +0100
Message-Id: <20230120210101.2146852-3-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230120210101.2146852-1-konrad.dybcio@linaro.org>
References: <20230120210101.2146852-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 3/8] arm64: dts: qcom: sm8350: Fix DSI1 interrupt
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

The interrupt was wrong, likely copypasted from DSI0. Fix it.

Fixes: d4a4410583ed ("arm64: dts: qcom: sm8350: Add display system nodes")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index c0ba67747c24..ed0106829cb9 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -3062,7 +3062,7 @@ mdss_dsi1: dsi@ae96000 {
 				reg-names = "dsi_ctrl";
 
 				interrupt-parent = <&mdss>;
-				interrupts = <4>;
+				interrupts = <5>;
 
 				clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK>,
 					 <&dispcc DISP_CC_MDSS_BYTE1_INTF_CLK>,
-- 
2.39.1

