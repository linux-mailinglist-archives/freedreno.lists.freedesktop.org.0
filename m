Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CD5675F4B
	for <lists+freedreno@lfdr.de>; Fri, 20 Jan 2023 22:01:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9358F10EAB2;
	Fri, 20 Jan 2023 21:01:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19C5110EAB2
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jan 2023 21:01:28 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id az20so17041807ejc.1
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jan 2023 13:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vMsCj9RG25O4A3HEOR6OR/jKZMnByaByNeXu250+UU0=;
 b=UblonUr+s3jct0bytTz09CEi/dhtVtIrCOEUydaKUCV/nj16FhVjCmy54wjNSZm3+J
 ilMkrDQHn9ekTI+QHM7HysK9lmccuS18P7DqbuUnIAHp1vxkoiUdP8jTxlyGqBHOrApL
 95czCWtwnx3dVgFJ9x6Qa6L4CdiFEUuTlrff5BsWS0WB/XvshTs+WnF2fvlcveY2+bRd
 8Gs6f4pmBQx6Jytc3dBfH7Ia0NZ8yYgBcDQ463zYzUpU0VtJwUodwawbWHH76FuenpAv
 180PMagFbFmzpRk2XcLSTA5IVHgWiciW8XotlLwTP+US0JryCSTsCwqy99RK2ANUZMjK
 +OZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vMsCj9RG25O4A3HEOR6OR/jKZMnByaByNeXu250+UU0=;
 b=QroMwu/m/trGayIkLGKCjhsftR6e3AQlWNm8bP4w8KAy7V1tkzyhtOsH+ymRg+ZBa8
 M/pVfsV4f79mGzoG2MU5rrwIGmjBnRk/garO4XpCPOTnV9Yh3Bm4A/B5Ll1qmTJnX64J
 5Amfs6ZL8T71Vo5PNYX2a8HM2BVbN7QQ0Q0MV/JF/TresOyiLC8UOQYsSU0y9Boyu3kp
 BgspZhDVY/sCZ2r2mFwrun2SEVR+K1k7MPKOpZOirWdj8eatCunmRgF5NXdDTBeia/NJ
 4HMAi2Zzp1cejsHKGzWJ9LWJPt3Jml3Mwdy1c5/fbsqpSfDdIAt0pSr8wbHCiqONBG8j
 y9wQ==
X-Gm-Message-State: AFqh2koOyUePuyhruhAqW56RXVo1x4d4XNkwQ30WTupVKN/yr89R1W3E
 WZbhIpYNG4yzo7D1dWC2zkgxtg==
X-Google-Smtp-Source: AMrXdXsnKTMnn8pBggT8wypvx4ly24qXZso6gSXtYC3gBFgndudQ2tx35A3eKs1c9jb4wVpBxKIXeg==
X-Received: by 2002:a17:906:3610:b0:7c1:8ba7:3182 with SMTP id
 q16-20020a170906361000b007c18ba73182mr17143993ejb.69.1674248486565; 
 Fri, 20 Jan 2023 13:01:26 -0800 (PST)
Received: from localhost.localdomain (abyk37.neoplus.adsl.tpnet.pl.
 [83.9.30.37]) by smtp.gmail.com with ESMTPSA id
 g22-20020a170906595600b0087221268e49sm6581229ejr.186.2023.01.20.13.01.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 13:01:26 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Date: Fri, 20 Jan 2023 22:00:58 +0100
Message-Id: <20230120210101.2146852-6-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230120210101.2146852-1-konrad.dybcio@linaro.org>
References: <20230120210101.2146852-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 6/8] arm64: dts: qcom: sm8350: Fix DSI PLL size
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

As downstream indicates, DSI PLL is actually 0x27c and not 0x260-
wide. Fix that to reserve the correct registers.

Fixes: d4a4410583ed ("arm64: dts: qcom: sm8350: Add display system nodes")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 22bf6239c757..b09eb8880376 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -3041,7 +3041,7 @@ mdss_dsi0_phy: phy@ae94400 {
 				compatible = "qcom,sm8350-dsi-phy-5nm";
 				reg = <0 0x0ae94400 0 0x200>,
 				      <0 0x0ae94600 0 0x280>,
-				      <0 0x0ae94900 0 0x260>;
+				      <0 0x0ae94900 0 0x27c>;
 				reg-names = "dsi_phy",
 					    "dsi_phy_lane",
 					    "dsi_pll";
@@ -3138,7 +3138,7 @@ mdss_dsi1_phy: phy@ae96400 {
 				compatible = "qcom,sm8350-dsi-phy-5nm";
 				reg = <0 0x0ae96400 0 0x200>,
 				      <0 0x0ae96600 0 0x280>,
-				      <0 0x0ae96900 0 0x260>;
+				      <0 0x0ae96900 0 0x27c>;
 				reg-names = "dsi_phy",
 					    "dsi_phy_lane",
 					    "dsi_pll";
-- 
2.39.1

