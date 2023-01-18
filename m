Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D152B67125E
	for <lists+freedreno@lfdr.de>; Wed, 18 Jan 2023 05:13:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9659D10E666;
	Wed, 18 Jan 2023 04:12:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A8A110E666
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jan 2023 04:12:53 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id v6so37255906ejg.6
 for <freedreno@lists.freedesktop.org>; Tue, 17 Jan 2023 20:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sFUVlLSeACjj16WsHbkWsVSEVF2l2EcRva5uQa0P5eA=;
 b=ta6cKFKIcnvxcLSDER30uqEhLewgKf7nJnld+v4uH1szhfnRVQlvzKt5Wu4mtDdWfR
 7NiTX+lr4xdrblHUP5hoA3h1hTpOnrwMfUoNqdlaeKug4u+Bi6u7+kwzzZGUEYUR5bjG
 BTNVNLTCJrTkm8pjmkFBFp94ViuXTGrFuY1/B3R63gwfVNtMpuWb+QUYmdZ76beRF55e
 H0N/n4gZr47liFFfZjfY7sZGNTn+T9YPHUWPSuhZ6+GuVyneWnfjYSIoJQiS+dKRMy+/
 k1rNUTAvv9SL474tfV8mCduzK5mAnke1Dr5RFo9WJqw42Wd6kkkMnmKeERRfpPo7IFpe
 GJww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sFUVlLSeACjj16WsHbkWsVSEVF2l2EcRva5uQa0P5eA=;
 b=Vebq1pQy2epCEY/ucvfkhPxIyRVJXK8pAjGMsEFhOMd6GjJfuv8dV4h5hQgkQfa37Z
 /BVv6I47wdZVaKwr8iFk8GMMnIwP7Z+5Erv46dcpZt7IHRbs9Ke0pLp3p1NdP+UGlvpd
 G36F5Ypy/iT/uq2s31P7S5HeSLTHDRkoaqXFU1INBPQUjdhVIt7SSJkam5nS/LvDFLPs
 mY/2SKH/NehSSJZ3Mvimgm+iv5znu8x5cRvWtYSNSrh/KFOz1IPhkjtip3cGe1KF1Dkf
 SZanxQiYdmcMLqH4xzAd3oK0HNceq2Oi3pJMS1jfPI5SppYXBQtQsy8v8C7+CiRGVZbv
 acJQ==
X-Gm-Message-State: AFqh2krEqEPkE1z0WeL1SNjdm5AuY1rjVI7QhQetf3R2Dlp30TuDOxEY
 4FdhIvXi6l3Xs7HVLHJFAGqgJQ==
X-Google-Smtp-Source: AMrXdXuwL+cahMr2hpDfw/s2+Q4zrO5FoqSL7dApKKtmlsGal/fg0nT9rnQSjPR2eepeEBEQf/h3QQ==
X-Received: by 2002:a17:906:1605:b0:872:41a5:7c78 with SMTP id
 m5-20020a170906160500b0087241a57c78mr7561088ejd.3.1674015172894; 
 Tue, 17 Jan 2023 20:12:52 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 hp24-20020a1709073e1800b008720c458bd4sm2314100ejc.3.2023.01.17.20.12.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 20:12:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Wed, 18 Jan 2023 06:12:38 +0200
Message-Id: <20230118041243.1720520-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118041243.1720520-1-dmitry.baryshkov@linaro.org>
References: <20230118041243.1720520-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v7 06/11] ARM: dts: qcom-msm8974: add SoC
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
index 44c4d8d8f51f..ced62937165a 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1580,7 +1580,7 @@ mdss: mdss@fd900000 {
 			ranges;
 
 			mdp: mdp@fd900000 {
-				compatible = "qcom,mdp5";
+				compatible = "qcom,msm8974-mdp5", "qcom,mdp5";
 				reg = <0xfd900100 0x22000>;
 				reg-names = "mdp_phys";
 
-- 
2.39.0

