Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC565E8A72
	for <lists+freedreno@lfdr.de>; Sat, 24 Sep 2022 11:01:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BD9210E5A0;
	Sat, 24 Sep 2022 09:01:28 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4F0410E55E
 for <freedreno@lists.freedesktop.org>; Sat, 24 Sep 2022 09:01:13 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id bu25so1738056lfb.3
 for <freedreno@lists.freedesktop.org>; Sat, 24 Sep 2022 02:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=nt3ly742saM+ooy2Ge0k9OPYJi77YIE+XtYlPKoVPVg=;
 b=Nf17Hv9/3d1w81jq7zPO0FWbmZK4GzEhX7dmqdc5/r5cPKDzZkfsS5Bi0YM4AshXT1
 BLWEukG1bWL1CsoLv/EB9jFsDVtxnOlDDbeWc4wIIOJt3v6fvl9tRavquHJcoxfueOAq
 2L0titf2fN71Cs/uxQRM0ppqmeSTAflhrRFVSR2Lw6U/UAkaOurPMJHqA580SieKzY2N
 jP2q6Yso/tpd2d8VA/8NhWIpRMF9/Dgb2upzsFU52hwU86GQooX3FJhyK59rm6183jbB
 JuFYVeaJg1Ydf4wY46rqh6nr1elp/kS/3f5BFnKdkuZYumfSvglVnZIq7GZDQ7GsyK8G
 Gn0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=nt3ly742saM+ooy2Ge0k9OPYJi77YIE+XtYlPKoVPVg=;
 b=w06md3GPk4pSikp6hPwQ3mukYzhuWIqo3+LRKsu77Em4yvDASUKE0IJrKrDeMvb1RU
 CrgKRwAStsO6JmSfRcEj1roVcitvWtdN2CMcbIEof21ir6gMAmNE3gmz2g3yY8hu520U
 B1oOCGO4RV2U/9wDmQBsWbf+5Frqb/A8le0cz4RxLzECZe01VtJ/ksIv29ITi4FodGAg
 Yy92B6wTv7GYS2kdOxZAVDbwpjSXkLV+QWMsS3gHSHC04gj8EhsXa+ISCDaJcrDfhK/i
 4NpsjIId5Glr9lOvZVG8X6TqjvT1DzdIfNKm8UqkunsU7nyozZ4vZ/zlKMRIxs7mJ8Et
 dkWw==
X-Gm-Message-State: ACrzQf0ReOUlsZ/D088JdrUVw5sVG9UGO8AVSkVjHNTQesFl/gXArbQ2
 8ZKTvmizmvXJ2cUJnNpa+CQNfw==
X-Google-Smtp-Source: AMsMyM60FADsIDDOHN8292FlkwEBPZbf0+dMJXtC4n9IjeEQDpyhczoExn9djzd1uQHEZs5rBDi0AA==
X-Received: by 2002:a05:6512:12c7:b0:49b:755d:fde5 with SMTP id
 p7-20020a05651212c700b0049b755dfde5mr4578773lfg.182.1664010071796; 
 Sat, 24 Sep 2022 02:01:11 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 o4-20020a198c04000000b0049f54a976efsm1830024lfd.29.2022.09.24.02.01.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Sep 2022 02:01:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Sat, 24 Sep 2022 12:01:02 +0300
Message-Id: <20220924090108.166934-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
References: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 3/9] arm64: dts: qcom: msm8916: change DSI PHY
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
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 48bc2e09128d..9e0a5cb469c8 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1056,7 +1056,7 @@ dsi0_out: endpoint {
 				};
 			};
 
-			dsi_phy0: dsi-phy@1a98300 {
+			dsi_phy0: phy@1a98300 {
 				compatible = "qcom,dsi-phy-28nm-lp";
 				reg = <0x01a98300 0xd4>,
 				      <0x01a98500 0x280>,
-- 
2.35.1

