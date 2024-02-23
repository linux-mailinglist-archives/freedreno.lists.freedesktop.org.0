Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5777861EC1
	for <lists+freedreno@lfdr.de>; Fri, 23 Feb 2024 22:22:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 406EC10ECAD;
	Fri, 23 Feb 2024 21:22:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sYzsjlRi";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 949D210ECDD
 for <freedreno@lists.freedesktop.org>; Fri, 23 Feb 2024 21:22:04 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-a3f48422fb6so193397266b.3
 for <freedreno@lists.freedesktop.org>; Fri, 23 Feb 2024 13:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708723323; x=1709328123; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=z1FkVd0ZOd4HuLhR6rsPDjyD4D3QNLPmtuC+OU6cTVA=;
 b=sYzsjlRi4na23zS1+NT2uvy4FnhDI56mtDXBa/qTrai+Hy9DuLzx+enn/7oACOT3EB
 +B24XLsILF+dwj+V+7zQf314I/Gtrnt94pRJYizxdkjlDA8gKys/6IM/xxxcHgn4Z7JU
 djS/rBuq8qNZpL+7RLi1ZfD/0ebFPBBhGm+Y3NC83pTdhXeyU4w7NkRpMoAoq4Utm3fJ
 2d+COhp7oCbuf+JqnBbC5im/COwL0NtVHdwLI9pQR8s+S2/27GexW1sps0/26AWIZMjU
 kSA/ESUKWdd1Q2bi7lqxxQwiRk3Oebc+5SbWO0uEV7QIzXllHN1qsJdpuUp9BWyKq4yC
 eI0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708723323; x=1709328123;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z1FkVd0ZOd4HuLhR6rsPDjyD4D3QNLPmtuC+OU6cTVA=;
 b=aJ6ptuC/fyOV67O2nxhhNkQ4UHRD1uB4c3Quvc/i2kfKrCWfeyAlCdLyHmw8RCR+2K
 sOH0LouZFOsALei49iun0O76bSWdfC7eji3/RcqVRmVglA8ZyAELDxRhidHItKHAqzpm
 Madf3ASMEJmxlcpHKf4j6aS5OSf6zq/4/bPeoovHXU1AnrojCGvsejyY/Xr8I/qQfnVA
 2ZR+cTjKRrUG64F8AIb/GpQv1cRzJR9NSCfDeODMwmPkh0IeHAozdugbFBvYxW2K/4ME
 Xfcm7oLMu1ueCXC/wogApITgL6gnnoLt0EaNybT8IV8LFzrN6DNJ0mjmmOqPKeIb0dxB
 gzOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU31md8tEU7+aNwIoY15j0oGOzu8gkKrp7gSuDOkHokDWLkFINTGT9dZFvw6zJICuxIOP6dVdkKxvZJBGMCneEKOonWvxdOb5DfnXKqnIQi
X-Gm-Message-State: AOJu0Yxsx1vyteeC7Q0VFpZH0fvHKzShupjhGfsBXF9EK+7/yz/4Z+q2
 RHlhCSEsTrVkLCayg7NTBSWz6Pa2942zNYErZYVljPGurQq67hzdcJFafjVseEA=
X-Google-Smtp-Source: AGHT+IGOTeJ72nc86iYe9aCP0RR8+Z6aDoD/m/NIKZ620up7wC2li1nmXfS7jDE9C25SuU9Ep338Kg==
X-Received: by 2002:a17:906:f215:b0:a36:5079:d6cb with SMTP id
 gt21-20020a170906f21500b00a365079d6cbmr656216ejb.56.1708723322827; 
 Fri, 23 Feb 2024 13:22:02 -0800 (PST)
Received: from [10.167.154.1] (078088045141.garwolin.vectranet.pl.
 [78.88.45.141]) by smtp.gmail.com with ESMTPSA id
 mj8-20020a170906af8800b00a3ee9305b02sm4091226ejb.20.2024.02.23.13.22.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Feb 2024 13:22:02 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 23 Feb 2024 22:21:43 +0100
Subject: [PATCH v2 7/7] arm64: dts: qcom: qrb2210-rb1: Enable the GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240219-topic-rb1_gpu-v2-7-2d3d6a0db040@linaro.org>
References: <20240219-topic-rb1_gpu-v2-0-2d3d6a0db040@linaro.org>
In-Reply-To: <20240219-topic-rb1_gpu-v2-0-2d3d6a0db040@linaro.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1708723303; l=915;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=/vlAxfs5pRi3jedgeW7eSy/wWzvCwowVIaHNbXcWUPw=;
 b=4NlbjUV1GBwZhD/RgzQVAtB0KvTlyLizT1CamJiEGMHqdxMJ9uLicJBWYxiAk+HFlJirPhazp
 Vg14+VV3wZTAdFOGnvbdNKKrCCVqvlFJbUo88fKB1HZyJF7PN0UX4Z8
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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

Enable the A702 GPU (also marketed as "3D accelerator by qcom [1], lol).

[1] https://docs.qualcomm.com/bundle/publicresource/87-61720-1_REV_A_QUALCOMM_ROBOTICS_RB1_PLATFORM__QUALCOMM_QRB2210__PRODUCT_BRIEF.pdf

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index 6e9dd0312adc..c9abca5a7e39 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -199,6 +199,14 @@ &gpi_dma0 {
 	status = "okay";
 };
 
+&gpu {
+	status = "okay";
+
+	zap-shader {
+		firmware-name = "qcom/qcm2290/a702_zap.mbn";
+	};
+};
+
 &i2c2 {
 	clock-frequency = <400000>;
 	status = "okay";

-- 
2.43.2

