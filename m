Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0366520C5
	for <lists+freedreno@lfdr.de>; Tue, 20 Dec 2022 13:38:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE33D10E3CF;
	Tue, 20 Dec 2022 12:37:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F025E10E3C5
 for <freedreno@lists.freedesktop.org>; Tue, 20 Dec 2022 12:36:59 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id i7so11581000wrv.8
 for <freedreno@lists.freedesktop.org>; Tue, 20 Dec 2022 04:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kKVEXvGef5P9tA5LLEzuk1hrh35Tg71vyheIdv7ZSrI=;
 b=corPTYl/tlJj9NEIuUOL2PfV0ebOWXVFNh4B9E36y5XxcsLpsoK5RRnwwrhYnQ27Tn
 xVrtSdmaRoXb6xXFalMvEJdcBPlhyYBzcgxL2Bun/z7b6korMgOi0ydi4LDoBgF0VrlR
 KCQaYEka1k+LjKsJSFjfEbUQbLFd4EfUbxp8ZLrzYilpf7CpqX+rz92a/8k2ia5B2flW
 RXANYu/YFDmcasaiD1eigN+2+bTPy5/gHMn8vZNNYDiCMOKep8RlHD41GWQ3sYpguX11
 zrkpOkehZUpIaHpr2Z0tMV1QBd9HbcHlLmXlmfenrShszX3FzzITummW8O/aY1feIScS
 /pBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kKVEXvGef5P9tA5LLEzuk1hrh35Tg71vyheIdv7ZSrI=;
 b=XPbGd8+6cCNiZ5KWOwBB9s7wfh0HdHBz+6tYCAARQh7A3Q/PL0K32tRLoj2hoBGmRu
 LWRzGSBqY0N9he7sK11DqnIjnAmny45hedTgZKvODJrKNyQSivOvTBLwB1DZ08i/lUgT
 8lf2LfJhUtdcRsEYDgf+T2a4K88aEG3MUsPMLj1ZWdUyoTN5M/xbUd7A/r7oUdFa+sMl
 D63Qn3cdGLJOcz2kzp++hc9xlR0X0YyTZJXfPkZRU3HGK1AGKq2JmSSQzXRVETECVL8m
 zZfDDS7TkHAA2aerAjXSOv1Gys/L/2Q0J4VDYatf60qG33xP0MxB0yOttwon06Zjodcg
 i0xA==
X-Gm-Message-State: ANoB5pm3jA+CfdYkpdHbCRItGRLevC6u0kueyCFPbfcXMjkxMIp9qVVd
 FO5l4t9YqoBXFWxHJaShigQccw==
X-Google-Smtp-Source: AA0mqf7zfD7dMeMe/X8AXuK4TXSuvR8MUh+RMZMzmqRSP7U0a2/nS/5R18XyXiqUvuFD3ps5poFWnQ==
X-Received: by 2002:adf:edc6:0:b0:242:43d1:6d8a with SMTP id
 v6-20020adfedc6000000b0024243d16d8amr35238084wro.59.1671539819547; 
 Tue, 20 Dec 2022 04:36:59 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 da13-20020a056000408d00b00242257f2672sm12641208wrb.77.2022.12.20.04.36.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 04:36:59 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Date: Tue, 20 Dec 2022 12:36:32 +0000
Message-Id: <20221220123634.382970-20-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
References: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v5 19/21] arm64: dts: qcom: sdm660: Add compat
 qcom, sdm660-dsi-ctrl
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
Cc: dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sean@poorly.run, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_abhinavk@quicinc.com, david@ixit.cz, dianders@chromium.org,
 robdclark@gmail.com, robh+dt@kernel.org, agross@kernel.org, daniel@ffwll.ch,
 dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org, swboyd@chromium.org,
 airlied@gmail.com, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add silicon specific compatible qcom,sdm660-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for sdm660 against the yaml documentation.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm660.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm660.dtsi b/arch/arm64/boot/dts/qcom/sdm660.dtsi
index d52123cb5cd31..e8a15b9cee18f 100644
--- a/arch/arm64/boot/dts/qcom/sdm660.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm660.dtsi
@@ -154,7 +154,8 @@ mdp5_intf2_out: endpoint {
 
 &mdss {
 	dsi1: dsi@c996000 {
-		compatible = "qcom,mdss-dsi-ctrl";
+		compatible = "qcom,sdm660-dsi-ctrl",
+			     "qcom,mdss-dsi-ctrl";
 		reg = <0x0c996000 0x400>;
 		reg-names = "dsi_ctrl";
 
-- 
2.38.1

