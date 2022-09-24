Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF655E8A7A
	for <lists+freedreno@lfdr.de>; Sat, 24 Sep 2022 11:02:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4021110E57D;
	Sat, 24 Sep 2022 09:02:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB66C10E55E
 for <freedreno@lists.freedesktop.org>; Sat, 24 Sep 2022 09:01:16 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id j16so3667476lfg.1
 for <freedreno@lists.freedesktop.org>; Sat, 24 Sep 2022 02:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=RKaMREXXqOL68I6N+y+TYA76CR+nfO5iIXlaX8/B/Dw=;
 b=igZmIfL79mdW17lR/C2YwLncV6t1ku0tWIMrp6HpBnlWkFtctSv6j/GWxaZaTkxHGd
 p2tMg4Sc1dKi0DmBdWY150BS31Hssr6vdxid8CbQ0hZSS3jBWPBsm/FHDDfYp7wJWMZ4
 /m/WwNwjEnPm4ncjCRFH6F4KKOS5DeH+h0o4dH3GjJ6bKPyZVlQHHV0TkrMQGV3H2rkn
 PkiaEP+sQUeWQr+Rxheebd/M3GczQJ0rW81qKVyCtYzug23kyL0Qn1f/y2YS42NvKh1F
 ssNxM6vfxbqIZBBREDkHSOLPqer0JFlCqA2bSi02q9evUFNpYRTsla4wcmXc1X2IEdQ8
 N6Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=RKaMREXXqOL68I6N+y+TYA76CR+nfO5iIXlaX8/B/Dw=;
 b=36yfy1UF1+bzAvCWjOCs+rMx/c7FsQo0SaMYbHoO1voLnFl4nPrz9lwNOC7jq15wT7
 i2C/Xj5MLw9wxJ2c9mwIk7DwwCfZjfkiCK2n5qygxTllpbVo0GTG4QAJpX8cTlTAseYo
 b7e+usc/Sr8okpJCaa0DfbEeu+qnD3nhIQzPSTKfbmmth0qIHb22rrm7Ll5pSyc54+ZI
 7btJ66Pc40U+BWVP3vpEZSQ1LcjEMcMhtXs4htpXabNY8H2pEfvGKoLCZfPMf0U4Ev4p
 WGwjyvn0vcbTLE4Yb3f3P7ghV1lfCxFVGUB4PX2fSd5RWL0pT0UkkE0D/08OkFFBXA9o
 1kCg==
X-Gm-Message-State: ACrzQf3b4EDmwgqCeym9Qmkk4qNPVEgV2PAq/UdMFGoOnQURD07EDbo9
 tDDCm1rJUAIcOaKpUuV83E/N3A==
X-Google-Smtp-Source: AMsMyM7queyoTFKENmEVrltMwdGmqrLcCMvduATdgv82zehPA2UC5zICXV4KkNJOsYg1/A1lep9W4A==
X-Received: by 2002:ac2:5cb9:0:b0:498:eb6f:740d with SMTP id
 e25-20020ac25cb9000000b00498eb6f740dmr4631460lfq.106.1664010075079; 
 Sat, 24 Sep 2022 02:01:15 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 o4-20020a198c04000000b0049f54a976efsm1830024lfd.29.2022.09.24.02.01.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Sep 2022 02:01:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Sat, 24 Sep 2022 12:01:06 +0300
Message-Id: <20220924090108.166934-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
References: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 7/9] arm64: dts: qcom: sdm660: change DSI PHY
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
 arch/arm64/boot/dts/qcom/sdm660.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm660.dtsi b/arch/arm64/boot/dts/qcom/sdm660.dtsi
index 43220af1b685..d102c7e25b79 100644
--- a/arch/arm64/boot/dts/qcom/sdm660.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm660.dtsi
@@ -213,7 +213,7 @@ dsi1_out: endpoint {
 		};
 	};
 
-	dsi1_phy: dsi-phy@c996400 {
+	dsi1_phy: phy@c996400 {
 		compatible = "qcom,dsi-phy-14nm-660";
 		reg = <0x0c996400 0x100>,
 				<0x0c996500 0x300>,
-- 
2.35.1

