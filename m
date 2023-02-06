Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C68E768C0C0
	for <lists+freedreno@lfdr.de>; Mon,  6 Feb 2023 15:57:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A36B10E48F;
	Mon,  6 Feb 2023 14:57:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D0FB10E46B
 for <freedreno@lists.freedesktop.org>; Mon,  6 Feb 2023 14:57:19 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id hx15so34858549ejc.11
 for <freedreno@lists.freedesktop.org>; Mon, 06 Feb 2023 06:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rvpJire9Oix0QZVP0x0MsRm7055RqWG85WNJGR1ah78=;
 b=FhbKMLoNFUAWgn+KHQ69RJuJ/z1JEUNsDQLrN26ILh2sf38Q3tVGNkFLuWo7zm3hH4
 VLLg21KcCOr24lh65lsSoa7CFwvGDQg42Xs4nYoAgezqd74ZEifIf7d99YOwT2POgPxu
 j04Uzj4TeRpRGz/s1hUBFsC0C6dM0EcH5wEgBez56Xx15AdyJ/h91W2KsUEBWywAiVoO
 wx63kmm1nCsonj4IV3MCPAY8NJPyJylDJZEps7dYSqUZT3dHnoOkB2IbRt5G+ZvIOmf+
 7DNnzBJwmUc79kb6U31NzTmt4lWLA3gS4hqhDcw2RKrAyNwORB1EVwHdF44tBgTWs+gc
 Qpbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rvpJire9Oix0QZVP0x0MsRm7055RqWG85WNJGR1ah78=;
 b=SELQri3kywSHGfgz1yQDUVwBf8zsGCJVg9y6xstVeg2t6gEFBwsrZrWTPYiXT6P6Z+
 4haL4aotoE/cbH4yYAk5T1hGebDvH58rVJHqxPH8z/hkDWpQy79tzrdz9MjyopODJMrR
 uifg9OyyUFfhYF568PU+LNhg5D1E2AkDeVkQ5aGZm8s7L6udIIuBVLOEjgta1Bw34kzG
 FdMXz+76qSzsxC5O1ezqO0VvGWkITzVWS0TGzeIy4rR7fd0apvYh3Ox6WLveyW0eujEF
 2iEVBL1YppFBo+UBMMi/Xpd29WesWnSxth1jL5Ep2JfvBu6wq0d88C6EpBZJBR1NccsU
 eaxg==
X-Gm-Message-State: AO0yUKWbobqRmUxFI9dHZAZt0fKIMIqwWDPZ+5x2FPZApQXz5oLiikh6
 fbDbFy5iDkkKBuuMT1d3/i8kkQ==
X-Google-Smtp-Source: AK7set/BbBwZ2tUdJQcmNpQqX0iYCeNQD2U/sxj9vmbzbl37IVzdRVXDEFmvzjMIvEIWKes98WxnkA==
X-Received: by 2002:a17:906:4b57:b0:885:2eb5:68a5 with SMTP id
 j23-20020a1709064b5700b008852eb568a5mr17647451ejv.66.1675695438882; 
 Mon, 06 Feb 2023 06:57:18 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 gw1-20020a170906f14100b0087bd4e34eb8sm5495533ejb.203.2023.02.06.06.57.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 06:57:18 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Taniya Das <quic_tdas@quicinc.com>
Date: Mon,  6 Feb 2023 16:57:07 +0200
Message-Id: <20230206145707.122937-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230206145707.122937-1-dmitry.baryshkov@linaro.org>
References: <20230206145707.122937-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 8/8] arm64: dts: qcom: sm8350-hdk: enable GPU
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
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, linux-clk@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Enable the GPU on the SM8350-HDK device. The ZAP shader is required for
the GPU to function properly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index df841230d1b7..5e744423a673 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -284,6 +284,14 @@ &gpi_dma1 {
 	status = "okay";
 };
 
+&gpu {
+	status = "okay";
+
+	zap-shader {
+		firmware-name = "qcom/sm8350/a660_zap.mbn";
+	};
+};
+
 &i2c15 {
 	clock-frequency = <400000>;
 	status = "okay";
-- 
2.39.1

