Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98263675F4E
	for <lists+freedreno@lfdr.de>; Fri, 20 Jan 2023 22:01:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58EF810E29C;
	Fri, 20 Jan 2023 21:01:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F66710E29C
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jan 2023 21:01:29 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id mp20so16957716ejc.7
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jan 2023 13:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cplHg6mmZO77Jj4HjyqBizHDxHYMI91dvrCE+XRo9rU=;
 b=pyRBjQVaxGEuZeJXBEpUNUgHxD9Z3JgDHkxja3xv85n7MIQizfzpRmIhWtSLcKVsv6
 iGYQFUwZI//O/otLG9lQuAt1TAoUpqzw08rUfl50jZHBjljox+1s/hxc5umAE5SnxaXa
 uHJ2c6+dg/u5IPYb2Uks5dQ0BZNKfUo7jO+XBeUD13tQZ3yRFm4IzQRz8dhhvJVosxTu
 yrdRgGkZqkqZBUi0Ti7vGNGeyxN0xxUO03WgtrRFXGXS1vzNl62xuahhRFyrGG96JcTO
 QCKAxNUcKP6xhwWaTMC5oyaKEVYdDOTQ4oft3361FdqmpUmy8RSM6loxW6HJWB5iLPjx
 75+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cplHg6mmZO77Jj4HjyqBizHDxHYMI91dvrCE+XRo9rU=;
 b=aRhCjC7HmEwyGYppnv65nkgUYY9AYY/2PyLzmboxxto46lYJaaJokZA9nR1x8Gh859
 uBMUZBWjCxFaazN3zXfKXICjxjEWzToE+Zqm6iwv0bnQMiXfpFzlYw0+KZxkaVQNi/7Y
 h7KEmiPCT4BNR8Db8iCzoGM6F2b2vQG24afgcWd2k/zrMoKnXvfUhWDuT/veraBQ3Stp
 B7bbBWz+yxX7fpPghJrN0fzliEabPhlKkiGfWwUS4f3jPi+mFI2LUvQKeDQO69BPzp/b
 XcKS8lcM3hH9Vu760UtLR1jwZ/Z0y2Rf6cyhZxJApyQ6xKRs+ko0sYCntDEcj7dvkRtv
 RcLA==
X-Gm-Message-State: AFqh2kqzeJjKP94PmQ52IkL70h5U+EvIdjDIYXV/TJ1SBIGV3+z4OSFQ
 QovZgGyYIMc6KpBLjOnk7eXEEw==
X-Google-Smtp-Source: AMrXdXvhQI54/4nyNC2unGCcARW/ouKy70qQqZ5Werikg+NU9C96Tk/aCyOTWsXVvSMVhDpZ2CTH0A==
X-Received: by 2002:a17:906:a88c:b0:7c1:5098:907a with SMTP id
 ha12-20020a170906a88c00b007c15098907amr16687692ejb.35.1674248489093; 
 Fri, 20 Jan 2023 13:01:29 -0800 (PST)
Received: from localhost.localdomain (abyk37.neoplus.adsl.tpnet.pl.
 [83.9.30.37]) by smtp.gmail.com with ESMTPSA id
 g22-20020a170906595600b0087221268e49sm6581229ejr.186.2023.01.20.13.01.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 13:01:28 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Date: Fri, 20 Jan 2023 22:00:59 +0100
Message-Id: <20230120210101.2146852-7-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230120210101.2146852-1-konrad.dybcio@linaro.org>
References: <20230120210101.2146852-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 7/8] arm64: dts: qcom: sm8350: Add mdss_ prefix
 to DSIn out labels
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
 Loic Poulain <loic.poulain@linaro.org>,
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

Add the mdss_ prefix to DSIn labels, so that the hardware blocks can
be organized near each other while retaining the alphabetical order
in device DTs when referencing by label.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts |  2 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi    | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index 5a4c4ea4d122..df841230d1b7 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -309,7 +309,7 @@ port@0 {
 				reg = <0>;
 
 				lt9611_a: endpoint {
-					remote-endpoint = <&dsi0_out>;
+					remote-endpoint = <&mdss_dsi0_out>;
 				};
 			};
 
diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index b09eb8880376..0f9427f3319f 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -2952,7 +2952,7 @@ ports {
 					port@0 {
 						reg = <0>;
 						dpu_intf1_out: endpoint {
-							remote-endpoint = <&dsi0_in>;
+							remote-endpoint = <&mdss_dsi0_in>;
 						};
 					};
 				};
@@ -3024,14 +3024,14 @@ ports {
 
 					port@0 {
 						reg = <0>;
-						dsi0_in: endpoint {
+						mdss_dsi0_in: endpoint {
 							remote-endpoint = <&dpu_intf1_out>;
 						};
 					};
 
 					port@1 {
 						reg = <1>;
-						dsi0_out: endpoint {
+						mdss_dsi0_out: endpoint {
 						};
 					};
 				};
@@ -3122,13 +3122,13 @@ ports {
 
 					port@0 {
 						reg = <0>;
-						dsi1_in: endpoint {
+						mdss_dsi1_in: endpoint {
 						};
 					};
 
 					port@1 {
 						reg = <1>;
-						dsi1_out: endpoint {
+						mdss_dsi1_out: endpoint {
 						};
 					};
 				};
-- 
2.39.1

