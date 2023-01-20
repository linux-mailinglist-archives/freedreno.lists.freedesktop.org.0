Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E8D675F45
	for <lists+freedreno@lfdr.de>; Fri, 20 Jan 2023 22:01:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB6F110E3A9;
	Fri, 20 Jan 2023 21:01:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5442610E3A7
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jan 2023 21:01:25 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id x10so8166843edd.10
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jan 2023 13:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LXpRK66Qxpazw7ZBSDhL2VuarYJmczwhTFpn31yFY6A=;
 b=h0j0tqp1w3CO7sLntH/Nj7Q3502f/+thyrgH/kZl+06qK6bFfQainS6HYKgabaCqZa
 2SenyT+Zynf64H7S77s/s4ZA7ZPqXiFqgJBPzO6GIf9QgOuopU7d+AvYUgVShhWzUPsa
 ccl3Wgrfy4LY1sxsVXfPKKmjzgHM8nTE/ZjFHhkhRKfpqvECIK0CaDIX75+JOdXE0jQU
 HOG9f3TJau/PDMyyun9j5IlkZ/TqbuQHlFFqqG66fjcSehSWaGKm2m7lwl9z5YEnwli3
 9TLmbAnSkUxdtRVgJIZL8LY6WH8dJ31ntenfHEcXkAoK78JYd3yzXFCbUv9ttCr2CmVb
 qp8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LXpRK66Qxpazw7ZBSDhL2VuarYJmczwhTFpn31yFY6A=;
 b=AUdd8dEOTj37mVu5zWy/b2B+I8VSyaRmTVSdaUFtIDbAIKyhrHjGcK8z90jtVVmr/U
 YIRMwxsjxLCvl1arDtcg846+aUoGeZSmCveySQBFgStOxnBv6LksSzu6y/TnkjOPSmL3
 h0xuNVoCdx1rYqXKszPXUkS0jZuHm4MxNVEx8m6G9yN/ZqnDu0TiYe6Mec9TVrMPiERk
 UDCSzF22iTWbYKRZACZq09zIm2g74MgsjzxJrwysZcy9erQBdtwFNHv0es+YYMkloLAz
 cym0gMYM9+GA2yL/LlOcSMmc2bnaix+yyOiGnsW60cZ7bbZQ3f/egaUHQ+cTBVdckKA4
 QXZw==
X-Gm-Message-State: AFqh2kpzClRnwKXLMT7BLJt+gF9VfVhPo7dJv17tPox4FS2RYIEn21bh
 1bff6B8zRNnsE1NQXCxAT58VhA==
X-Google-Smtp-Source: AMrXdXvc3+ZcD59sVWvBuYUWfY+UrxFOxehiFF1cS8qCPTMQQJktRtG9mdhI20ZezkeaPgmLt7Piuw==
X-Received: by 2002:a05:6402:454:b0:492:8c77:7dad with SMTP id
 p20-20020a056402045400b004928c777dadmr15808302edw.8.1674248483799; 
 Fri, 20 Jan 2023 13:01:23 -0800 (PST)
Received: from localhost.localdomain (abyk37.neoplus.adsl.tpnet.pl.
 [83.9.30.37]) by smtp.gmail.com with ESMTPSA id
 g22-20020a170906595600b0087221268e49sm6581229ejr.186.2023.01.20.13.01.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 13:01:23 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Date: Fri, 20 Jan 2023 22:00:57 +0100
Message-Id: <20230120210101.2146852-5-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230120210101.2146852-1-konrad.dybcio@linaro.org>
References: <20230120210101.2146852-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 5/8] arm64: dts: qcom: sm8350: Fix DSI PHY
 compatibles
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

The compatibles were wrong, resulting in the driver not probing. Fix
that.

Fixes: d4a4410583ed ("arm64: dts: qcom: sm8350: Add display system nodes")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index c964d939289b..22bf6239c757 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -3038,7 +3038,7 @@ dsi0_out: endpoint {
 			};
 
 			mdss_dsi0_phy: phy@ae94400 {
-				compatible = "qcom,dsi-phy-5nm-8350";
+				compatible = "qcom,sm8350-dsi-phy-5nm";
 				reg = <0 0x0ae94400 0 0x200>,
 				      <0 0x0ae94600 0 0x280>,
 				      <0 0x0ae94900 0 0x260>;
@@ -3135,7 +3135,7 @@ dsi1_out: endpoint {
 			};
 
 			mdss_dsi1_phy: phy@ae96400 {
-				compatible = "qcom,dsi-phy-5nm-8350";
+				compatible = "qcom,sm8350-dsi-phy-5nm";
 				reg = <0 0x0ae96400 0 0x200>,
 				      <0 0x0ae96600 0 0x280>,
 				      <0 0x0ae96900 0 0x260>;
-- 
2.39.1

