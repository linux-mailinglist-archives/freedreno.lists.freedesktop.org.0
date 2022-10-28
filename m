Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 974846110CB
	for <lists+freedreno@lfdr.de>; Fri, 28 Oct 2022 14:08:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B435F10E81D;
	Fri, 28 Oct 2022 12:08:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0EE110E81D
 for <freedreno@lists.freedesktop.org>; Fri, 28 Oct 2022 12:08:41 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id ud5so12483318ejc.4
 for <freedreno@lists.freedesktop.org>; Fri, 28 Oct 2022 05:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JtRwy+4HAfMc7GVoO6XoNWELcyR2UkUd1zXAHj0aQ9A=;
 b=qjpUTmDfugkj9yvRKDxIq5N1qqwBducxc7dR6mribRQvRRCQ3H7Wcj7roTA3eI5AuM
 gfYA2dZIF8VXPzBvND79At/Z8iJTljOSp5Bt1tqs7EaquGYNoykpCZfX9ioinFaMMrYJ
 yepEQcGfcxdspJqN2r/zwqxxR7y6VyRv300XI7F0FoXrjSmg9Fjda1MmtAJt2mKch5Vs
 TP2yoCd04KbbPLYhKznFbEYkID3gK21PIFuZWhsLKhwbHaAFEJbfahBY5iWmGIuK2DQz
 8EDDPtAP63UcOXdoctrjf3Bdt47AmW4paFzkIZHUjp+YP+M4WJFyPl+xau+kg4TMFEgh
 2T8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JtRwy+4HAfMc7GVoO6XoNWELcyR2UkUd1zXAHj0aQ9A=;
 b=lHxFQ4BokUo0vumqtqQDVxw+x0UtomR224+qaDMRS0l35a18XJomoery4QqE2qO0vG
 j6AhnmtING4+3Pj9I/re9f3nc/jEnevVi2RuYOdvW1RtDdEBVXAUdx61+OLXnF+4IVlN
 gPvyhZQyZa8LdZHTQuBCePkTo8gzKaMk6Ud51V6DAtgXkb/xJf8OlaGaObqdqurA5skf
 GR3wIE+jU3PTroX2xpXU35L+GY6JPqJNjpq1o1t5vFuyFBddVzR1E0zoRVeArOSSzmuI
 FzhHydTFQpmuL+O5U2Geu0d1Nue/Yi+H3+zIGBzRtbAITvLYyzFx5xavUz2kZKPUuXMA
 6R1w==
X-Gm-Message-State: ACrzQf0OCM7hW48CwoZPj1Ey4ecSJA+WIUiEM9Jz2CdQHy2+9hlabbrv
 4IvImLbZ4I6uRFdtxtRlGtWwhw==
X-Google-Smtp-Source: AMsMyM5lH5Y9QOouFAZ+PUSWbWP0YbOcyG6BHmV6+6eAWcPmUy2mNbbxlNt0L1sLlJcWnlXzXsbATA==
X-Received: by 2002:a17:906:5ac2:b0:78d:3358:7694 with SMTP id
 x2-20020a1709065ac200b0078d33587694mr46608360ejs.276.1666958919782; 
 Fri, 28 Oct 2022 05:08:39 -0700 (PDT)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
 by smtp.gmail.com with ESMTPSA id
 u13-20020a170906124d00b00782e3cf7277sm2067258eja.120.2022.10.28.05.08.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 05:08:38 -0700 (PDT)
From: Robert Foss <robert.foss@linaro.org>
To: agross@kernel.org, bjorn.andersson@linaro.org,
 konrad.dybcio@somainline.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, quic_kalyant@quicinc.com,
 swboyd@chromium.org, robert.foss@linaro.org,
 angelogioacchino.delregno@somainline.org, loic.poulain@linaro.org,
 quic_vpolimer@quicinc.com, vkoul@kernel.org, dianders@chromium.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 vinod.koul@linaro.org, quic_jesszhan@quicinc.com
Date: Fri, 28 Oct 2022 14:08:11 +0200
Message-Id: <20221028120812.339100-9-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221028120812.339100-1-robert.foss@linaro.org>
References: <20221028120812.339100-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v1 8/9] arm64: dts: qcom: sm8350-hdk: Enable
 display & dsi nodes
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Enable the display subsystem and the dsi0 output for
the sm8350-hdk board.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index e6deb08c6da0..6e07feb4b3b2 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -213,10 +213,32 @@ &cdsp {
 	firmware-name = "qcom/sm8350/cdsp.mbn";
 };
 
+&dispcc {
+	status = "okay";
+};
+
+&dsi0 {
+	status = "okay";
+	vdda-supply = <&vreg_l6b_1p2>;
+};
+
+&dsi0_phy  {
+	status = "okay";
+	vdds-supply = <&vreg_l5b_0p88>;
+};
+
 &gpi_dma1 {
 	status = "okay";
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_mdp {
+	status = "okay";
+};
+
 &mpss {
 	status = "okay";
 	firmware-name = "qcom/sm8350/modem.mbn";
-- 
2.34.1

