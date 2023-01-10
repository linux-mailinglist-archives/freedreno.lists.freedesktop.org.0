Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B926638DE
	for <lists+freedreno@lfdr.de>; Tue, 10 Jan 2023 06:54:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE86010E53A;
	Tue, 10 Jan 2023 05:54:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50C3B10E0DD
 for <freedreno@lists.freedesktop.org>; Tue, 10 Jan 2023 05:54:38 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id j17so16662241lfr.3
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jan 2023 21:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J9V7IctxQhFjqqHOvM2m2n5NBsQdf9FVh6jp3d8ejZw=;
 b=FKBjCgTMxGWGC2SnMZtgtilG9ExKqtnmPah5aZiRq038jV2T+JM8/bOsQG+15l3l/6
 gIuk3NrAgotZYn0yHDXAHl7MxHnWk04Ca3ITsvkHfr8nH7slvwlDlcuDSzcFfmwQlDRd
 R7ZZXdapDthIKaCyaas8O4j3X5D5NzdlNnpNmmkMs34IPSV0HFQr9csyl/yT6O2GlVzl
 4M18QY10TKUH9uEjJGl61WPmOc6SPV2UyDX85JEif+jtWYVq06lWcXzyZhbSlrWOFO08
 /vqqwWcR4dzBDZzWSYWoPQotQgnI6SlsJblOKpJMjRTYmarIux+ex0rbCCvQWnRbOPjX
 7avA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J9V7IctxQhFjqqHOvM2m2n5NBsQdf9FVh6jp3d8ejZw=;
 b=KYAnbOJtX0FEPzhmi1nj68P+fHxLRziyZ7Bb8VR6W4fsvVBxEkaoL8di5GFvvQjeKT
 f3PxVMxwxF+bczONzD8YreSh4S4YvAfiZZR48XhyO/psTlSWj3rbs4egOtntCEpUGr59
 S34AEFVm9NqxC+HsYyatEa5MC+DUEf91Npzz/ik7I6cQeZ65WHOMatlAgqwbiBruShzd
 /00bQU8YNFyxbQzrAq+KIEyKhVZWm0OJOtzcP2h317Aa+tkkzvRC7Ce339iYTJVvV29f
 BRpFYA/CFUbyESNbpsPrq/8jLAygNXQLF69+HAqk15pWaliZ9dCkXTK981jn+LDyIcLW
 KvZA==
X-Gm-Message-State: AFqh2koHRFCY5BHTUcQtPKFabYHuvsDh+/ADsWOVJHtvUUq1hjqegQDX
 Yz589UplqMYCUyPI3rG4vHS+jw==
X-Google-Smtp-Source: AMrXdXuBRJ6AoE5cMdln4pKXDM+GdLkXNO5wAWcrdtKsooiDYDw7hTF53AbF9itFsxzRM9IlZw/iLQ==
X-Received: by 2002:ac2:5088:0:b0:4a4:7be4:9baf with SMTP id
 f8-20020ac25088000000b004a47be49bafmr18724211lfm.59.1673330076556; 
 Mon, 09 Jan 2023 21:54:36 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 h37-20020a0565123ca500b004b52aea5ff8sm1987227lfv.30.2023.01.09.21.54.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 21:54:36 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Tue, 10 Jan 2023 07:54:33 +0200
Message-Id: <20230110055433.734188-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230110055433.734188-1-dmitry.baryshkov@linaro.org>
References: <20230110055433.734188-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 3/3] arm64: dts: qcom: sm8450: Add compat qcom,
 sm8450-dsi-ctrl
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
 Daniel Vetter <daniel@ffwll.ch>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add silicon specific compatible qcom,sm8450-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for sm8450 against the yaml documentation.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 0c13e9b428ce..52aa6f1f08f5 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -2770,7 +2770,7 @@ opp-500000000 {
 			};
 
 			mdss_dsi0: dsi@ae94000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sm8450-dsi-ctrl", "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae94000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
@@ -2862,7 +2862,7 @@ mdss_dsi0_phy: phy@ae94400 {
 			};
 
 			mdss_dsi1: dsi@ae96000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sm8450-dsi-ctrl", "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae96000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
-- 
2.39.0

