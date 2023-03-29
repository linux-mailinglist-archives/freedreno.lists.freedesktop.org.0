Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 800166CF65E
	for <lists+freedreno@lfdr.de>; Thu, 30 Mar 2023 00:25:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F5B210E23A;
	Wed, 29 Mar 2023 22:25:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E02710E1A7
 for <freedreno@lists.freedesktop.org>; Wed, 29 Mar 2023 22:25:05 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id h11so15171940lfu.8
 for <freedreno@lists.freedesktop.org>; Wed, 29 Mar 2023 15:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680128703;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QEueJb8wxFS51D5H+YQGZcmoJREAPX/3P/EgTv1KRmQ=;
 b=lRUgCTj8FbwxUykPzPj+tXrYXzquUMA2SE3l2V7o5HuwDGblXGkm5u3lUL3x/myZo8
 GSEGBQAQ+ti9lfTG9xS3ZbCuS7pIgHc9qpQ+c7c35los6UTyTjRQE4WrUaNhEBVxQJqb
 tnq5+OBi2/9rJ4P/COOh2QjYcTX3fq0W2OIFW/fgIUTSh9M7djIZXioLdhD7WKOxHdPp
 V4hxBsrHLOTINBXq6err0YTWXfThPMLIZrrYekvrBQ/o0BJrDPf5rPku8cboAJr+vWBV
 c8AX5APP22S5qZ/3G/y2i7ecgg+hzcAJhbTxQ9+6rp0ibWKYX11Vzhyuhm3weNzRw14k
 jUdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680128703;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QEueJb8wxFS51D5H+YQGZcmoJREAPX/3P/EgTv1KRmQ=;
 b=BdueKs5Zp9gLKljpKlexTNj8z62LKSR3kVZDznr+3tqdk6rMomi+W4KD870MfXteay
 060guxz8yL8fXibzDuEl9SFrZH3H2rNJ4Xtlvv40QgrkoJOj9trzLikaCXZwCtbdhG01
 zbD+giuTd6+uWCmKSPHD7J3pwUnQ7yfZxPEsBm9Xr09tbehl/kLIv+VIwT9DcsW/8M0K
 FnPW3H+Vc7naA9iTUmdwBCqfPn21Z9ZX7fpDELWk/AotDMVBL6pQa4P6eKw9r1x3uP4v
 0OLEdOaFYt2jkaV+QOZ4NOLvU5fxs2Sse+dVnnpq36QMF3XjnjnHyvnbbHBO5R5B7szO
 3gQA==
X-Gm-Message-State: AAQBX9eWyzHEdd3I0El+MbPdUdd4RuuDqJ0HH3AzlqfVQpMiTGuXSMg2
 1q1ML0Fu7Ak73mL/W64xf94aJw==
X-Google-Smtp-Source: AKy350auET5GfqVeLoBe8QXogMU0qUTo2PHB76nYRpaWXwMAGBCpKiFuj5I23ncL6OK5zEWUTpjDSA==
X-Received: by 2002:ac2:4c26:0:b0:4e9:a16f:a176 with SMTP id
 u6-20020ac24c26000000b004e9a16fa176mr6731039lfq.36.1680128703439; 
 Wed, 29 Mar 2023 15:25:03 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 y26-20020ac255ba000000b004e9b307d2c8sm4724226lfg.238.2023.03.29.15.25.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 15:25:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Thu, 30 Mar 2023 01:25:00 +0300
Message-Id: <20230329222500.1131836-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230329222500.1131836-1-dmitry.baryshkov@linaro.org>
References: <20230329222500.1131836-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PATCH 3/3] arm64: dts: qcom: specify power domains
 for the GPU
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

The GPU on msm8996 is powered on by several power domains. Add
configuration for the GFX CPR and MX domains.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 905678e7175d..ff4fb30f9075 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -521,6 +521,10 @@ rpmpd_opp5: opp5 {
 					rpmpd_opp6: opp6 {
 						opp-level = <6>;
 					};
+
+					rpmpd_opp7: opp7 {
+						opp-level = <7>;
+					};
 				};
 			};
 		};
@@ -1228,7 +1232,8 @@ gpu: gpu@b00000 {
 			interconnects = <&bimc MASTER_GRAPHICS_3D &bimc SLAVE_EBI_CH0>;
 			interconnect-names = "gfx-mem";
 
-			power-domains = <&mmcc GPU_GX_GDSC>;
+			power-domains = <&mmcc GPU_GX_GDSC>, <&rpmpd MSM8996_VDDMX>;
+			power-domain-names = "gx", "mx";
 			iommus = <&adreno_smmu 0>;
 
 			nvmem-cells = <&speedbin_efuse>;
@@ -1251,30 +1256,37 @@ gpu_opp_table: opp-table {
 				opp-624000000 {
 					opp-hz = /bits/ 64 <624000000>;
 					opp-supported-hw = <0x09>;
+					required-opps = <&rpmpd_opp7>;
 				};
 				opp-560000000 {
 					opp-hz = /bits/ 64 <560000000>;
 					opp-supported-hw = <0x0d>;
+					required-opps = <&rpmpd_opp7>;
 				};
 				opp-510000000 {
 					opp-hz = /bits/ 64 <510000000>;
 					opp-supported-hw = <0xff>;
+					required-opps = <&rpmpd_opp5>;
 				};
 				opp-401800000 {
 					opp-hz = /bits/ 64 <401800000>;
 					opp-supported-hw = <0xff>;
+					required-opps = <&rpmpd_opp5>;
 				};
 				opp-315000000 {
 					opp-hz = /bits/ 64 <315000000>;
 					opp-supported-hw = <0xff>;
+					required-opps = <&rpmpd_opp4>;
 				};
 				opp-214000000 {
 					opp-hz = /bits/ 64 <214000000>;
 					opp-supported-hw = <0xff>;
+					required-opps = <&rpmpd_opp4>;
 				};
 				opp-133000000 {
 					opp-hz = /bits/ 64 <133000000>;
 					opp-supported-hw = <0xff>;
+					required-opps = <&rpmpd_opp4>;
 				};
 			};
 
-- 
2.39.2

