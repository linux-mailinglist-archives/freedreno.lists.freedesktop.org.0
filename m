Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D195E8A70
	for <lists+freedreno@lfdr.de>; Sat, 24 Sep 2022 11:01:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEFC310E5AF;
	Sat, 24 Sep 2022 09:01:20 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B75810E55A
 for <freedreno@lists.freedesktop.org>; Sat, 24 Sep 2022 09:01:13 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id b6so2371384ljr.10
 for <freedreno@lists.freedesktop.org>; Sat, 24 Sep 2022 02:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=FKcY1W2Ufu4JQ+EqVO+YLggZ5mqT/tMoi3A2zFkedZs=;
 b=yZJaMhxaPJo4r627Rn6s4nMcD41MKDee1L3BsWTtncHRxn5ZTZr3BM4LUpeGvuRXHF
 c7jbIbhScCYQ/IyeQQIi555e3/zxLJfMeIYphevQc+hrSnQt8ucehLHvAQMnkW6Cit/f
 BCq3i8dycNUgkD1EfLGVZmEpXsnXQOzvfZxthl8kYSMnFOZJHEzVvg9GRKwo1/prA0Z7
 boqHCIhn+9T4nid6lOMl7guDE5y9P8/DDK/W8+RYyZWU5fWrD/qQdvrtumhrnHDtugr8
 6Mm1JHYTfRTLluzCxOIvXYuRmHi8trU3dVHjjwUZMIIOqkiIMAeKPK6/lms23nipfs+G
 sMgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=FKcY1W2Ufu4JQ+EqVO+YLggZ5mqT/tMoi3A2zFkedZs=;
 b=w8ErVhGlbcuKpDwCzBdoE5Zi/B/KsOWqf8AcrYdCqdRD1LBclkdYXsDVikDjDArDaV
 AOZbpAoTHdQy4z0giZW+5haGZmdNVlvnBBV9JV3QLVOgXU0yZmoGtx7jvH2FYpMYNBIP
 aFUP23yYuhpTB5G1DxXF3jKJJ+QeCGGg6XYRnimpcOnKAW6vYaTZTTWXNM1VdyOPhub5
 0Xe5W22/keyr6HEWpx77GgyO7RGX6/u1CwQlTieilPc5o8rq9inTVkwvbhotOUZcYXh5
 V8wsRJsZuVbMdykEN5uHNBlDfDOpEKt7Be7kvNxZdEq72p8X83ApjDQ2DGBUlCO/MZi7
 orcw==
X-Gm-Message-State: ACrzQf0OTzmZRZWTur07EGudWa3O+MI9+sNHjVg5Rc8aTQcEuLZqRuoD
 I5dkxyUxDt9TVwi6APYvhkWocA==
X-Google-Smtp-Source: AMsMyM7AxAAPiM/Ww6ae46+DM5Wk7Im+j6bfpj+Qj3AphHulNwU6t4DL2hz90rvjxRvxcugR7lgPjg==
X-Received: by 2002:a2e:b8c9:0:b0:26c:27c7:cb69 with SMTP id
 s9-20020a2eb8c9000000b0026c27c7cb69mr4178869ljp.37.1664010071077; 
 Sat, 24 Sep 2022 02:01:11 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 o4-20020a198c04000000b0049f54a976efsm1830024lfd.29.2022.09.24.02.01.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Sep 2022 02:01:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Sat, 24 Sep 2022 12:01:01 +0300
Message-Id: <20220924090108.166934-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
References: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 2/9] ARM: dts: qcom-msm8974: change DSI PHY node
 name to generic one
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
 arch/arm/boot/dts/qcom-msm8974.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 8baca2a77717..d3a7de42f693 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1592,7 +1592,7 @@ dsi0_out: endpoint {
 				};
 			};
 
-			dsi0_phy: dsi-phy@fd922a00 {
+			dsi0_phy: phy@fd922a00 {
 				compatible = "qcom,dsi-phy-28nm-hpm";
 				reg = <0xfd922a00 0xd4>,
 				      <0xfd922b00 0x280>,
-- 
2.35.1

