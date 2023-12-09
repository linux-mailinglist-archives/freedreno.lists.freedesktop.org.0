Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D08980B773
	for <lists+freedreno@lfdr.de>; Sun, 10 Dec 2023 00:21:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8D0010E30E;
	Sat,  9 Dec 2023 23:21:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F276A10E2FB
 for <freedreno@lists.freedesktop.org>; Sat,  9 Dec 2023 23:21:37 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2c9f9db9567so36655711fa.3
 for <freedreno@lists.freedesktop.org>; Sat, 09 Dec 2023 15:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702164096; x=1702768896; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JgDxAEuhsmBMeANv3N0te/wPGHFbBpN6eVt4De9yE3Y=;
 b=kUGANCd0Q3sHYYXJMfCLWi+iqv77yW535iZ7UGKIPHQo0dLmGWdYe6qCa/fM6fO1ZN
 lb56INDn4mX6zYpFSPZKrEGZI7k+S3ELnX93QGOLWoYNlKXSSrsag/0TEwl+gLGoq5OD
 801WjGkfuNTFoZhNSY01KZyfzKS/7PgsD0RGKM8OCHMeJsXrMNfw3rfaCaGp1VkjF8Zx
 k0xJy0WmqQDBsWMcWxoTTOcPuRfK2Z9O8VoxgjAXDmItKJUaswkstVkq86YLbmBvnHFa
 iZVxXjSDhlnrFIitre7NwyZ/1PxCnEPnXtoJ9z5R+2r+3Aqk2JDh532BeN3XfO3iv/nD
 ZGTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702164096; x=1702768896;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JgDxAEuhsmBMeANv3N0te/wPGHFbBpN6eVt4De9yE3Y=;
 b=OTnlzUo+Kphi1yXZsUcGxa9ZM2CH/ybACSm0dbkCdN0PPDfGG4KLzGOCIxlAZMkWzV
 lR2CM+kxUcn6LBsjFhG9gjiKBsUGQ1m0JW7/Jfyq3QdcR4FgQ4/L32VbZi5F9Nu29v3T
 BEA17zcu7Nn4Yh8Ot2xR/S8Lm0nARek6t0Xt1cwGBMP759w4V48mvxn9L7QAMsJO8DnM
 ujcsDpsNV5TVGvo+1V7+QTaAZcD4ztV8Ovd5cxSGIMF2mTRAmeQummwDJqhtEkGVUEhx
 4nqzKuoNRA1bSPyGcUoDmeZe/lxErE/GPL6EAiubZf/STklUfkv55cplDMAgi8KAoRno
 vKYA==
X-Gm-Message-State: AOJu0Yy+jAtDxAgQFpwMOwlNvBMn0UYDJLX5mAtwtB9O4gbovKd8ajpd
 wXPCGY9y4IaO0D/TfrK+epl+9g==
X-Google-Smtp-Source: AGHT+IGUzLLBnvyzByTUcEtcoTK0ECG9194KSNjYB+OpKYDRaX+qfDCUoY7QFKr9d9SKUTVhFBsolA==
X-Received: by 2002:a2e:94cd:0:b0:2c9:f4ac:ccc6 with SMTP id
 r13-20020a2e94cd000000b002c9f4acccc6mr704022ljh.46.1702164096346; 
 Sat, 09 Dec 2023 15:21:36 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z18-20020a2ebe12000000b002c9f59f1748sm685258ljq.7.2023.12.09.15.21.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Dec 2023 15:21:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 3/9] arm64: dts: qcom: sm8150: make dispcc cast minimal vote
 on MMCX
Date: Sun, 10 Dec 2023 02:21:26 +0300
Message-Id: <20231209232132.3580045-4-dmitry.baryshkov@linaro.org>
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

Add required-opps property to the display clock controller. This makes
it cast minimal vote on the MMCX lane and prevents further 'clock stuck'
errors when enabling the display.

Fixes: 2ef3bb17c45c ("arm64: dts: qcom: sm8150: Add DISPCC node")
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

