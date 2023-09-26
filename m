Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 562047AF2AF
	for <lists+freedreno@lfdr.de>; Tue, 26 Sep 2023 20:25:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B187610E425;
	Tue, 26 Sep 2023 18:24:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF89210E41F
 for <freedreno@lists.freedesktop.org>; Tue, 26 Sep 2023 18:24:55 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-533d6a8d6b6so7580353a12.2
 for <freedreno@lists.freedesktop.org>; Tue, 26 Sep 2023 11:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695752694; x=1696357494; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=gcsTNpsjbN2SKqWT86OIi6rzpyQaQonBZGDEar8VbjY=;
 b=cz9tx9i+2pWWUfcvKbiVzglo5IAxUXaK1SSTSlxMFb41/75iqRvKrQhowL4h1JWRCx
 NYFjiYh0gbq8iuwrICGWiffNa9KaUh5R/KdtdpOz0p+DaGg9citjY7Jn2/SGzolzlsPV
 WtjkVgsqKXCzUnjOzdTO5kJeJtqnLOFDatEEf6xnQV3AmwQIXv3auoCkcQ+S0H7fixdK
 w1Ea0OSs/niS2xS3eaElmaGavYvVd2p3V3iRcd7t3kUGeEHqS55WqVd/cO2tEKgkHSh/
 ZLy68ujXbYXFO7GHfyxH9Xkn1oC6GQlKsWMFn5brGQiJgeE1sQQjiMUMX8Jh8zRY473Z
 TWqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695752694; x=1696357494;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gcsTNpsjbN2SKqWT86OIi6rzpyQaQonBZGDEar8VbjY=;
 b=F7RMV9aMCA1XDuM6lIJDMGaiT+w4KZULmUaT3HtTpdn8MB3k8y8vbx/hBGm6mNnhMK
 N6ZfLrGbQUzDbDfWVD+KHgYgsRKtPghi/9L9iaskKFhFDYRADtsIbWCXZZHZFZo5Iq0y
 t6qS6vQhjSlfo5+otd6VcHA0Mk74es0FDT6C+2s1wOblujMPq0QAx9WYmexDnNb3hf3B
 fP2LjXyxjt5DRB30dQVfKOtAsrT4fsw023GA/2K1RXEOuuSxaE3xQVCIVUuhQwlYsZ1J
 TXc/lrKDN20UjBzYenhfAAM7smj6Qttoq3H/tOm/R3Eib1zObNt/bTOMrqwN8n9Zda0c
 Wnsg==
X-Gm-Message-State: AOJu0YytYGzt1KB21eUXHVYkye2U9+k8BFSQTx6p5UcrnmqFH069evHn
 HZul/xo+Omfl4AskKhrgKCxnSwzOiap5/DdTJcMPiQ==
X-Google-Smtp-Source: AGHT+IHSDS5XqFLTJ3Fj4mnDdxfJXQcOrG9mYsIt1RG52uxZWsc1JdF5u15aBVAjCYJy3NW7NDbP+g==
X-Received: by 2002:aa7:da8b:0:b0:52a:66c0:1e9b with SMTP id
 q11-20020aa7da8b000000b0052a66c01e9bmr8454988eds.30.1695752694412; 
 Tue, 26 Sep 2023 11:24:54 -0700 (PDT)
Received: from [10.167.154.1]
 (178235177023.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.23])
 by smtp.gmail.com with ESMTPSA id
 f19-20020a056402151300b0053090e2afafsm7020643edw.22.2023.09.26.11.24.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Sep 2023 11:24:54 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 26 Sep 2023 20:24:42 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230926-topic-a643-v1-7-7af6937ac0a3@linaro.org>
References: <20230926-topic-a643-v1-0-7af6937ac0a3@linaro.org>
In-Reply-To: <20230926-topic-a643-v1-0-7af6937ac0a3@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 cros-qcom-dts-watchers@chromium.org, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695752677; l=2100;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=9BePAqziunVu9kZivYgvv/caBkDoTl2qS9g1hj02Wgg=;
 b=DftHVsKPD4gXQnOXwv6J08JDe4kPe9q61Uq+Yk6OGVwbAalLbxGFp7JSs/NLklUN8hzuG4ORl
 P20Q6ZH69KsAaETW8eBjDpCidhznk2dyYWm7+g8ddSZevjirhjhF8yS
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH 7/7] arm64: dts: qcom: sc7280: Add 0xac Adreno
 speed bin
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Luca Weiss <luca.weiss@fairphone.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

A643 (A635 speedbin 0xac) tops out at 812 MHz. Fill in the
opp-supported-hw appropriately.

Note that fuseval 0xac is referred to as speedbin 1 downstream, but
that was already in use upstream, so 2 was chosen instead.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index edaca6c2cf8c..ccc2dd6c45de 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2626,14 +2626,14 @@ opp-315000000 {
 					opp-hz = /bits/ 64 <315000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
 					opp-peak-kBps = <1804000>;
-					opp-supported-hw = <0x03>;
+					opp-supported-hw = <0x07>;
 				};
 
 				opp-450000000 {
 					opp-hz = /bits/ 64 <450000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
 					opp-peak-kBps = <4068000>;
-					opp-supported-hw = <0x03>;
+					opp-supported-hw = <0x07>;
 				};
 
 				/* Only applicable for SKUs which has 550Mhz as Fmax */
@@ -2648,28 +2648,28 @@ opp-550000000-1 {
 					opp-hz = /bits/ 64 <550000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
 					opp-peak-kBps = <6832000>;
-					opp-supported-hw = <0x02>;
+					opp-supported-hw = <0x06>;
 				};
 
 				opp-608000000 {
 					opp-hz = /bits/ 64 <608000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
 					opp-peak-kBps = <8368000>;
-					opp-supported-hw = <0x02>;
+					opp-supported-hw = <0x06>;
 				};
 
 				opp-700000000 {
 					opp-hz = /bits/ 64 <700000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
 					opp-peak-kBps = <8532000>;
-					opp-supported-hw = <0x02>;
+					opp-supported-hw = <0x06>;
 				};
 
 				opp-812000000 {
 					opp-hz = /bits/ 64 <812000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
 					opp-peak-kBps = <8532000>;
-					opp-supported-hw = <0x02>;
+					opp-supported-hw = <0x06>;
 				};
 
 				opp-840000000 {

-- 
2.42.0

