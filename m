Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E1D690A7F
	for <lists+freedreno@lfdr.de>; Thu,  9 Feb 2023 14:39:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2640810EAE6;
	Thu,  9 Feb 2023 13:38:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 403DF10EADE
 for <freedreno@lists.freedesktop.org>; Thu,  9 Feb 2023 13:38:49 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id jg8so6410799ejc.6
 for <freedreno@lists.freedesktop.org>; Thu, 09 Feb 2023 05:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=teoBKH/xnumZutLhR1lTsGt6HiXAAYfHJxJM2LYx8fk=;
 b=G/uuvbOxNB1jOHxuIz+T35oO8H5+UMf98NvOjAmZ6vFzlgXXhaqyNlQZyV1Smi3nD7
 woTPs7dozQ/4iNsI5dT/a3zrLY/iFisvMeaxYuRF2Ni+SxfpdBzuCmZ5JUNHQcpfijRi
 vK5/bbPms/NUvTNyotHEHrQbbtUkjfrZ1d1nDlCg8kq7X2yUCrGBhhzsAXHFQl1aY4x7
 /Fc+VchqkCYIJ+5tbEuoMvNHKwkFYERkiTf3yFSGEROU2DaKslQw4Q/LNbUnGx9QY3Iv
 stL+PC0TtOwzlCsGTIJPLrgtg0KkqUul2x5Ok7IH2ElgzNFABW0xuZRQqgRy+zRysD/5
 m9Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=teoBKH/xnumZutLhR1lTsGt6HiXAAYfHJxJM2LYx8fk=;
 b=xKXmGE3qsjwwYcCI5yrtEp+pP/HbntNUp2VZp47WLdwT6jPfp2A6r+KKhNBIE0znM3
 0LodgHi0brZJe9s3PFlIDYxOcI3SbsW8ZpIiO1MMIKizCPIuC2s8zu4H99LKN55j9hNY
 br8PPfgTQ9y1OpJIIBYJ0d/3fqIGZ1ARdOzLBw21ZIsgOJHRZH26nKir4u2+j6BnuB3A
 GxR0gDt04MDecyERBPr8Q2qXE1zcl9TMIfW07Jjov88VeVPX+TMTZ88YKCCG3ApWwu9X
 wNmP+ePWdramfD/dqNPfbSEilopgo1iNQ+P4o07J/ijNjQfuJWDOarh262at7TF0eERQ
 c+Vg==
X-Gm-Message-State: AO0yUKW0tt3uqWAOeX7BjtmcISKqBJkhWzJsnNNEmVLZ4DcxoD7pxCbH
 SzkMgWYAtVLFqQhhClvChv6TRg==
X-Google-Smtp-Source: AK7set+DHeRxdOeZF9XY/umYouZ9f/FTI2/QQ8wP/VEMl2Sh87/V1u0FZRWMTxgofkpHc3TJyGBUtw==
X-Received: by 2002:a17:906:149b:b0:88c:8c2e:af17 with SMTP id
 x27-20020a170906149b00b0088c8c2eaf17mr12516883ejc.2.1675949928898; 
 Thu, 09 Feb 2023 05:38:48 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 cd17-20020a170906b35100b0088f8ee84b76sm885553ejb.105.2023.02.09.05.38.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 05:38:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Thu,  9 Feb 2023 15:38:39 +0200
Message-Id: <20230209133839.762631-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230209133839.762631-1-dmitry.baryshkov@linaro.org>
References: <20230209133839.762631-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 6/6] arm64: dts: qcom: sm8350-hdk: enable GPU
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

Enable the GPU on the SM8350-HDK device. The ZAP shader is required for
the GPU to function properly.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index 54654eb75c28..09baf6959c71 100644
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

