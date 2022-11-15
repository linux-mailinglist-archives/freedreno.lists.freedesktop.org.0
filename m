Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A830629A67
	for <lists+freedreno@lfdr.de>; Tue, 15 Nov 2022 14:31:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DFD010E3E1;
	Tue, 15 Nov 2022 13:31:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E50D010E3E5
 for <freedreno@lists.freedesktop.org>; Tue, 15 Nov 2022 13:31:38 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id s5so5645632edc.12
 for <freedreno@lists.freedesktop.org>; Tue, 15 Nov 2022 05:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=cCi/ES9FuqiQm+KWnSYhmAQtDDx+gMJGxqOaQjv7UIk=;
 b=Wzx8DYBHXIYeswZwDCSF56PUk7V4nUuegWHM7Fy6L+Mg6b4kHm8LTHxaeNZEJMoA/i
 dzCxvPoOj7o8hhckG6o7DbOmNuZ61dazbyjTHKsXFh0Aqi4g33YZRH0uXNgYacvfIWr7
 NHdFsxnUyE5PZ6Jscp+azDvCoZZkalOuZC5C7QdYPVJAI5nZHMs+A4M+lUrH17UpkfHZ
 62UFl4cRGDB9vMH+ULMSCIs+He7M3K/OQ4qPSHBo/qziRcuXxI1LPC46dnuHHD3x4exP
 0lWJ7xY9ASWgL/r9a2P8cOPxycPcI98RxyMAI0ejbAGex4DBC163JVxGwuBHgv1Vgfbk
 UzOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cCi/ES9FuqiQm+KWnSYhmAQtDDx+gMJGxqOaQjv7UIk=;
 b=SQ/KfXdC80/kxPOeFbJTBpCSmgT6FrIp2r07ABBQngnI1h+zQ9mu5qLOu+Si0Wbf9n
 arXQ1G3+eLreoo0ysoyKEDyqeY/cD+aM7W7KoeNa8fuNKKqnpPaHoA3zsc6FS0Bsa3KW
 aWTrtpH+i8eWYm49tfEglzvMP2NtLwEfvc9sDNIr3Nnhgp/bXR7u3zqh7dtJpzxvDbLq
 4ujpeW2LQMyyCsqQSf5s0KWHRUgU2quLkTIPgynyqn7AfsBT3OOhr5RzrT1y96tSItob
 pIdK5xVPlRTb443vhQdrfLf1vJrSbuPb+CVE10v6Q2+DWLPS+yHQp29/jWUDTzdC1l64
 jhXg==
X-Gm-Message-State: ANoB5pkyhZaobg9poSr4fswdJwvH6gvBfnP5gBN94OmT7oOmGEdMz8ub
 x5c22hf/gb78vxYw6N277ONtEg==
X-Google-Smtp-Source: AA0mqf7bl80L9QHfvrgMQcRIUQbJ3AxQoxSjPv/3VC37LXF/mTDNhPsQrYKvsB8QW8ZSzZywGnLJ+g==
X-Received: by 2002:aa7:d799:0:b0:461:6f87:20bb with SMTP id
 s25-20020aa7d799000000b004616f8720bbmr14959954edq.300.1668519096017; 
 Tue, 15 Nov 2022 05:31:36 -0800 (PST)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
 by smtp.gmail.com with ESMTPSA id
 q22-20020aa7d456000000b004618f2127d2sm6162176edr.57.2022.11.15.05.31.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 05:31:35 -0800 (PST)
From: Robert Foss <robert.foss@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 agross@kernel.org, bjorn.andersson@linaro.org,
 konrad.dybcio@somainline.org, quic_kalyant@quicinc.com,
 swboyd@chromium.org, robert.foss@linaro.org,
 angelogioacchino.delregno@somainline.org, loic.poulain@linaro.org,
 quic_khsieh@quicinc.com, quic_vpolimer@quicinc.com, vkoul@kernel.org,
 dianders@chromium.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonathan Marek <jonathan@marek.ca>, vinod.koul@linaro.org,
 quic_jesszhan@quicinc.com, andersson@kernel.org
Date: Tue, 15 Nov 2022 14:31:04 +0100
Message-Id: <20221115133105.980877-12-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221115133105.980877-1-robert.foss@linaro.org>
References: <20221115133105.980877-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 11/12] arm64: dts: qcom: sm8350-hdk: Enable
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
index e6deb08c6da0..39462c659c58 100644
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
+	vdda-supply = <&vreg_l6b_1p2>;
+	status = "okay";
+};
+
+&dsi0_phy  {
+	vdds-supply = <&vreg_l5b_0p88>;
+	status = "okay";
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

