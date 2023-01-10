Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D53E16638DC
	for <lists+freedreno@lfdr.de>; Tue, 10 Jan 2023 06:54:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C13A10E0DD;
	Tue, 10 Jan 2023 05:54:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0CD410E537
 for <freedreno@lists.freedesktop.org>; Tue, 10 Jan 2023 05:54:37 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id v25so16612592lfe.12
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jan 2023 21:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Od8NVQ7rke1dy63OziSV7bOj514f4mT68wZay8pjM14=;
 b=m9+Jas64suajSpQIRMpvHPgkRtW3P40QRWR282M9A9M4wfKPwWPJ8ps3lPb2JoQGS6
 URMcpxEUG2Kqi4AuWvyOabzm5Ul5bLxH1gIzoAkhZFi2KTEmlX4ZKnf5qVCYyEIvyCqe
 N5zxAv/9J/WXJg24kYZ5EsNJAbhrszKuNaHhiuuP5x92bgcPQWfY5Did38KOPuw9Wf/s
 odLQAzv0x+6FmJCujeYKr025VwYN+fhiA1c2ZIQfVvr3kglplY9kHv53wvUuJ2fKJ0/3
 5xsppfp0PQ8PFn3Z/9KtWb6ElP+GuGDV9f4ThF1yG95owl8nx0YalAeCH2+MFTpgIVlU
 ospQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Od8NVQ7rke1dy63OziSV7bOj514f4mT68wZay8pjM14=;
 b=hR4VvshzuhkZjn9mTg7FY6Crm8oxuRmsDY5zgwIk0M/yikenIJowdwkJHUIzlcryxt
 pzHBItZn/yisq3HfXyiu4BNjtJCVeJixeWr+O2zU/PD660JJOkARoBvL/ZFlBRO+w7WD
 M225Fk/4HjBW3BNiEBTzXV85+XsumoflwVjKs9fMg3OxcDpUiil8a3c0GpZPhKkKvKdr
 Skry9Ov8StjCUmGfGFxKXFJILdTEbVAxk8L0BQlqODagbZroPU7fQXMAQeLSOqfj1wvC
 EyaLQiDp0ZQB1PrQINJItpvFkYTEr+EC7QlEJXxg5tBnl/vQ/R+Ni654TgWuaqco5xxP
 HmMg==
X-Gm-Message-State: AFqh2kqTO0qYMnljxW/YcSgvnNOQtGmlZNcsV8nuitpe6xK47C8h9Emm
 NeB1/8G1aV0hZPktHfJPaCYBhw==
X-Google-Smtp-Source: AMrXdXtx4QrfwKdfzPS+27ZFVMOsjqDyn1MfQ+bdDV1TXDnoK7sgDn2jLTxkjowQdtjCufmdFwngNQ==
X-Received: by 2002:a05:6512:3b07:b0:4ab:f3f1:8299 with SMTP id
 f7-20020a0565123b0700b004abf3f18299mr20609955lfv.6.1673330075781; 
 Mon, 09 Jan 2023 21:54:35 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 h37-20020a0565123ca500b004b52aea5ff8sm1987227lfv.30.2023.01.09.21.54.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 21:54:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Tue, 10 Jan 2023 07:54:32 +0200
Message-Id: <20230110055433.734188-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230110055433.734188-1-dmitry.baryshkov@linaro.org>
References: <20230110055433.734188-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 2/3] arm64: dts: qcom: sm8150: Add compat qcom,
 sm8150-dsi-ctrl
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

Add silicon specific compatible qcom,sm8150-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for sm8150 against the yaml documentation.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 99750987c9d6..2c59ebe3320d 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -3690,7 +3690,7 @@ opp-460000000 {
 			};
 
 			mdss_dsi0: dsi@ae94000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sm8150-dsi-ctrl", "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae94000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
@@ -3783,7 +3783,7 @@ mdss_dsi0_phy: phy@ae94400 {
 			};
 
 			mdss_dsi1: dsi@ae96000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sm8150-dsi-ctrl", "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae96000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
-- 
2.39.0

