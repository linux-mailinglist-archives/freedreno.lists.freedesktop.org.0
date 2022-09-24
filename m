Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E58E75E8A73
	for <lists+freedreno@lfdr.de>; Sat, 24 Sep 2022 11:01:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B41F710EC09;
	Sat, 24 Sep 2022 09:01:28 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADCFA10E55A
 for <freedreno@lists.freedesktop.org>; Sat, 24 Sep 2022 09:01:14 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id a8so3587938lff.13
 for <freedreno@lists.freedesktop.org>; Sat, 24 Sep 2022 02:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=j581I6y16QMywUJd42oZyyiZPcAlNY9LHk2IDMp3gZc=;
 b=slZKdNCcjMHPjl8dcAYUaKBJqkK+HCbSBlMRoNW2Ymp7RhVe4254AvD+Qg9YuNhvnN
 ieZR0R9X9SP9YGkUg29J1B/KfoMa92sPDDbBN+4Wd/2ssGQ+uDB/NAwjREHRU/rEqdbc
 Fu2nGMHJCIso2oPmgNlg2BzUEJjcqO7aMKCZwor64Sm0oNlSjkMOs2pvaB3CE06GoelW
 7nZyvSHQ4dg6YNbg6r8MTWgLie7MY8HoniH0n2H9jGvTryKHn3YjPqaFVUBwF7oyJNBD
 F508jjMKtoK91OjjWzCCdqTda8RCip/zVDSGCwD0bGL5JHrTxElmCHRGTdCZVgcGmRPO
 Rh9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=j581I6y16QMywUJd42oZyyiZPcAlNY9LHk2IDMp3gZc=;
 b=nBepKEoeTZ5EEx0eBK19lAlQ9mHGGwPtCU3ujcAEh3W7izXw4tOWIEVIB2a0x72GeJ
 UO+AwWYrG7UbaLSEdDVwG8h7h8qV7baRugjtgPKMrifpPonp4eNL5KXj6nwtCXBCk5a0
 ZkZDLffJaVS+R0W5LUMoqNdHAXB/6bazWyzoxi6KeKbfdgfNophp3lJ229MV6D4NUOhv
 wKm5bg8xQrYS8Rzc84ZnzHfiwi7PeRYiZAfElpYcHzZTQ2+fVGQcb86HxFqNEpctvy1z
 fK5/wwwFI52JWyO1E0hRH1Qv5PlpESAuxFHbxDInqdu1Zlifoc5hr1CZYXsNbmhK7J14
 5P5Q==
X-Gm-Message-State: ACrzQf25QqGSsnct2SdLaqQ8so2wp6jufgoeRY/UVabsiZQBYRFUpyL6
 rovlcN+jkI6p04J6eO2L3vLvyw==
X-Google-Smtp-Source: AMsMyM5C2pctjkWXizfCG6OsPX445JfO6ygaicYDxuyS/bluikTiXUG3Gkw2+vDF0QHKQ4A8xa/0Nw==
X-Received: by 2002:a05:6512:3b8d:b0:499:b113:865f with SMTP id
 g13-20020a0565123b8d00b00499b113865fmr4654473lfv.505.1664010074265; 
 Sat, 24 Sep 2022 02:01:14 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 o4-20020a198c04000000b0049f54a976efsm1830024lfd.29.2022.09.24.02.01.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Sep 2022 02:01:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Sat, 24 Sep 2022 12:01:05 +0300
Message-Id: <20220924090108.166934-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
References: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 6/9] arm64: dts: qcom: sdm630: change DSI PHY
 node name to generic one
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Change DSI PHY node names from custom 'dsi-phy' to the generic 'phy'.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 1bc9091cad2a..dc83329689a1 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1633,7 +1633,7 @@ dsi0_out: endpoint {
 				};
 			};
 
-			dsi0_phy: dsi-phy@c994400 {
+			dsi0_phy: phy@c994400 {
 				compatible = "qcom,dsi-phy-14nm-660";
 				reg = <0x0c994400 0x100>,
 				      <0x0c994500 0x300>,
-- 
2.35.1

