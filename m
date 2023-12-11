Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C870480CFE5
	for <lists+freedreno@lfdr.de>; Mon, 11 Dec 2023 16:44:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A38D410E48E;
	Mon, 11 Dec 2023 15:44:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FE9210E48E
 for <freedreno@lists.freedesktop.org>; Mon, 11 Dec 2023 15:44:50 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2c9e9c2989dso61148011fa.0
 for <freedreno@lists.freedesktop.org>; Mon, 11 Dec 2023 07:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702309489; x=1702914289; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MEK43V9yIRVqJnm4P3NZA5kYSX3VWqUkzCX7w77Xo/Y=;
 b=ry/YP1p+13RZFOoF00mZvBBjE8rpG572fgjv4dI+SoBSA4vzbY6SJdbxKO0tb7VCdK
 8WKw4Meyb8BAm77mIZVMeoxv6ouIHEZF7Oehv8BYGhuCqXhu9YlSiBu9TqwAWfUf7wmV
 mxWgvII4EK5IO8g4jQhj0nJGW1Kj+rhWMnKnngE66Dox5pongQXYIGlCwoZ1aNJe4szS
 awZD5lEfmMJ0NdCETPNjCpJpayC3yPKbII31ASm/iIR9XDAP6BI6lSnJzK9InZ10hfY3
 O1EKQV9C2OSc6fMVLtayijppUFHpIMbW304IDLOM6x6hQfd1UiMK84VbL1k/F9LqChwF
 wA6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702309489; x=1702914289;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MEK43V9yIRVqJnm4P3NZA5kYSX3VWqUkzCX7w77Xo/Y=;
 b=ucpr8x6zSnj/PGGmj6UW12a3xFesRv0UUVqmWgxhKXncNydS4egCByHsuh0chjLf0x
 iPDU1ZsLS9GLvRVdwaR8ovUdL0GW8kOeZzFuvRjhda3uuIx7vfoOyY8TMEDEbyhgl/2y
 yEFNs8GalE/QmtDd6GB6fq6k7WctlkN9Cj52yTLeWrCKm98ya83GM7EzvN+Jy5QAIGHK
 pGfv4hxAeeu6DqDGkeOWAp8G9hg7qSeo9rOKGmevOiuhsH2W7F+Kvj/3+Em3YOtLx5J6
 oBMwzlFa96djYflN39iogpARbCXFpU9LqVtGJa3LhLWZNrgkY6SjUm8wqwJlFXOp5of8
 4zzA==
X-Gm-Message-State: AOJu0YymjKL2F8+8sOU45rsNkn8w2L0951Uo17LvMGOVSdeLIqChVv3S
 9kGXXGDV8Bwl9MC62SI2O1md0Q==
X-Google-Smtp-Source: AGHT+IH9/Y+1gcwCpPn7xa1mzp2YcdXrFEVyvR6Ns3iDEf9MbtKQDoXsa3ElBa3w9w2aGvcdxQULAw==
X-Received: by 2002:a19:690e:0:b0:50b:f268:7ed9 with SMTP id
 e14-20020a19690e000000b0050bf2687ed9mr1865801lfc.124.1702309488635; 
 Mon, 11 Dec 2023 07:44:48 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 c5-20020ac244a5000000b0050aa6e2ae87sm1109646lfm.2.2023.12.11.07.44.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Dec 2023 07:44:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 2/8] arm64: dts: qcom: sm8150: make dispcc cast minimal
 vote on MMCX
Date: Mon, 11 Dec 2023 18:44:39 +0300
Message-Id: <20231211154445.3666732-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231211154445.3666732-1-dmitry.baryshkov@linaro.org>
References: <20231211154445.3666732-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add required-opps property to the display clock controller. This makes
it cast minimal vote on the MMCX lane and prevents further 'clock stuck'
errors when enabling the display.

Fixes: 2ef3bb17c45c ("arm64: dts: qcom: sm8150: Add DISPCC node")
Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index fb41f91cefc6..153c531c1d41 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -3925,6 +3925,7 @@ dispcc: clock-controller@af00000 {
 				      "dp_phy_pll_link_clk",
 				      "dp_phy_pll_vco_div_clk";
 			power-domains = <&rpmhpd SM8150_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
-- 
2.39.2

