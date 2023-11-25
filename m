Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A73FC7F8B7A
	for <lists+freedreno@lfdr.de>; Sat, 25 Nov 2023 15:18:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61A6710E383;
	Sat, 25 Nov 2023 14:18:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6456010E381
 for <freedreno@lists.freedesktop.org>; Sat, 25 Nov 2023 14:18:17 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a00c200782dso409331066b.1
 for <freedreno@lists.freedesktop.org>; Sat, 25 Nov 2023 06:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700921896; x=1701526696; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6AuHxZr8x/Uk1Y12/gMeKhnjQeN0t/qZ6GCe7PtBack=;
 b=GKb8PUykC5ItU1ktgs/X4D0LeyO89/oNcqT15qNPIMwSrgng3n9UQk8KqHD2XMjChL
 MmCU+Zozsx0GcGqcfnfFxecQsDbDTkar1aVy+5+U/GfcgHShUq27HDhudpibx8du+dxJ
 OIkoD6dLpOcKlQ55y+F+hQzN9+wLy5FpwqKIHiwaVjJseEay+shHIYCVyyjkoVz2OIWK
 1CwinzJjb7/98K1oibf/Pz0Y7SOa1PseQqVzDEBsQgPtaQM2pIYKMYnyl+ADuH2hkCjN
 7f38gN/sh+44M4rW5nqRYilbWNdkkcwheogJqIf4xf0//fA7ns4DaJwM+tv/boaOe9Zz
 35eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700921896; x=1701526696;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6AuHxZr8x/Uk1Y12/gMeKhnjQeN0t/qZ6GCe7PtBack=;
 b=UQKg7Qkks47LSAidHcWDytN7tVgnu7vdIllhtN4RZW7n7oXMfiej+eJmqT0CJHBKG0
 pcOyk+NB5ILo4mlXl1LTyGc6vlM9JmOQy9+G767vHCkEtwtcbei9ljgFGHrQ/oNa4jyH
 5Kvdy5f9M3SVGWQRkqZNXHDvt7HAoAzoCwJKwj+0+5yK7Fa3viFzNHyM4CmkoSVIslP1
 yf2kwJTw0XWBV+D28JQlaQ5ZnsEGnGj/a9RAOkwnbDfAMKhYAHt4VUBHJcuVue9yN7GL
 gPU1xr8PeY/A/fCRrso/pRo2U22ya/UM7vECQpxTKpbUTpCQv4p9+CKAADQoQC5YO6qg
 6kNA==
X-Gm-Message-State: AOJu0YywpnAf0gJMymbOF037L4TYh1h5JFRSSV6hVUzkdK3Hu/TaWPsF
 W7/VjqKNkiaxEQTKi9VkyQxQ7g==
X-Google-Smtp-Source: AGHT+IEWEyRd878coT3XTG8rCeCot3GJrL6vUjbz+4PBaJEmtJMsQ18SwIYunDl7AGB0ZPe2YkQmiQ==
X-Received: by 2002:a17:906:eb0f:b0:a02:95ea:1289 with SMTP id
 mb15-20020a170906eb0f00b00a0295ea1289mr4986720ejb.20.1700921895817; 
 Sat, 25 Nov 2023 06:18:15 -0800 (PST)
Received: from [10.167.154.1]
 (178235187180.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.180])
 by smtp.gmail.com with ESMTPSA id
 19-20020a170906319300b00992b8d56f3asm3500345ejy.105.2023.11.25.06.18.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Nov 2023 06:18:15 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 25 Nov 2023 15:17:40 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231125-topic-rb1_feat-v1-12-11d71b12b058@linaro.org>
References: <20231125-topic-rb1_feat-v1-0-11d71b12b058@linaro.org>
In-Reply-To: <20231125-topic-rb1_feat-v1-0-11d71b12b058@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Loic Poulain <loic.poulain@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Georgi Djakov <djakov@kernel.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Robert Marko <robimarko@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1700921858; l=1845;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=F+2+KPEjbmpD3TQ3tmcuJpeM3OLd440fgCNNO64cW48=;
 b=AHM7tx93ACOm+aMCiZmKs/B4UljcUXbt0A+dc2es12Xj+N/o+z8cKNsnWXmZtr0qEc8JRam6s
 DUqeIzB6YY9B3ImyhknQxgukJrl8Xik6yjChJIsSWnbLMjE49IYoq3C
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH 12/12] arm64: dts: qcom: qrb2210-rb1: add wifi
 variant property
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, iommu@lists.linux.dev,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

The RB1 platform doesn't have board-specific board-id programmed, it uses
generic 0xff. Thus add the property with the 'variant' of the
calibration data.

Note: the driver will check for the calibration data for the following
IDs, so existing board-2.bin files will continue to work.

- 'bus=snoc,qmi-board-id=ff,qmi-chip-id=120,variant=Thundercomm_RB1'
- 'bus=snoc,qmi-board-id=ff,qmi-chip-id=120'
- 'bus=snoc,qmi-board-id=ff'

For the reference, the board is identified by the driver in the
following way:

ath10k_snoc c800000.wifi: qmi chip_id 0x120 chip_family 0x4007 board_id 0xff soc_id 0x40670000
ath10k_snoc c800000.wifi: qmi fw_version 0x337302d3 fw_build_timestamp 2023-01-06 01:50 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HL.3.3.7.c2-00723-QCAHLSWMTPLZ-1
ath10k_snoc c800000.wifi: wcn3990 hw1.0 target 0x00000008 chip_id 0x00000000 sub 0000:0000
ath10k_snoc c800000.wifi: kconfig debug 0 debugfs 0 tracing 0 dfs 0 testmode 0
ath10k_snoc c800000.wifi: firmware ver  api 5 features wowlan,mgmt-tx-by-reference,non-bmi crc32 b3d4b790
ath10k_snoc c800000.wifi: htt-ver 3.114 wmi-op 4 htt-op 3 cal file max-sta 32 raw 0 hwcrypto 1

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index ac597eb3fe9d..bd7bcf803654 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -535,6 +535,7 @@ &wifi {
 	vdd-1.8-xo-supply = <&pm2250_l13>;
 	vdd-1.3-rfa-supply = <&pm2250_l10>;
 	vdd-3.3-ch0-supply = <&pm2250_l22>;
+	qcom,ath10k-calibration-variant = "Thundercomm_RB1";
 	status = "okay";
 };
 

-- 
2.43.0

