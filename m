Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBBF8B7029
	for <lists+freedreno@lfdr.de>; Tue, 30 Apr 2024 12:44:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E23210E97D;
	Tue, 30 Apr 2024 10:44:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="P4rHn+p1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FD0F10E68D
 for <freedreno@lists.freedesktop.org>; Tue, 30 Apr 2024 10:44:15 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-34d1e6ddb4bso1293966f8f.3
 for <freedreno@lists.freedesktop.org>; Tue, 30 Apr 2024 03:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714473854; x=1715078654; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=wHg7UtYU1KMEjXYLs7aZhgbiXDVGh+SnHXlklvKuJBI=;
 b=P4rHn+p1SgS4OEV8p6LLe2RaB7eMaFCixEOxMIzgMk6HdH6GAaH6fI3n6opI3ofnCs
 GpAqvdy66fY8ZGy1AEElOi3MrH3m/DD0zOFGn6iRH2NiPhJJsvnnr1n5GWX/K+CD8XXU
 mrEdQvl/ODcLmQQ6jTVBKFLPLioA7OJY3wFjYtj8cxBj+T9l9114hrbyxMWzlhXauNsP
 V4eqHCpoocUyaPfQ8NSljBNn7nQJSDoZWNXGvfAose4gQsDsZ+tn6+YYJ0NvFLnnZUoF
 7ZEEjwKAfRMpi7sLtnnu+Fx3NC1NkFNo4uBQSIsL2GefMePepqnFeDG9Z8qsB+x8sqHs
 B+rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714473854; x=1715078654;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wHg7UtYU1KMEjXYLs7aZhgbiXDVGh+SnHXlklvKuJBI=;
 b=DMllA1ItGMFpL740kTrLSdNPkShvjKEPtfZY3kk2Voc3DeWT+8i0QGlITAgGSeEyTm
 hU0u8Bfx6UpRvhWDOWYkt1g/u8MDjPvceQvf/GOMwGoD7n9NV5jOUx1qaDOn9exhPNS9
 tomnDiBQebswhjjK1kWzOhZfCppL8PChCTfG5UdZPEtQJYtEOCEEMlBzYZnWnInLu4/c
 j5kt3qynAbI0dFGP1kBkNLPI+mInB/0ELHW9fIGO/sw3T29DAJEBsZpxCT5qNWuH9vGI
 LPjYQaOd47Zj5/sJWGvrrfP0+YDeYF3Zja00FWjlON7FM5HFhZslgSiEL0cX2Ql6p4OO
 wHSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiXQgMqGyLeMksWCoUlK4b+iT/CYRcHa5jm1KybBNwLWgeFtnh6+Mz2MDeuhhvrbUPkiCEh7xoy0x4w8KCDdeO8V2d7X87nnxYGNJ207It
X-Gm-Message-State: AOJu0Yww3nx25nLgQ2BdZRojSzwDG1fGXnuJbfbgnwmmU7DUMIGq4Q6r
 EbQcskQ+x3k51RvOW4JpsWDaG4Ke0lq8mmx2Te4idYysOx2AQHnQ
X-Google-Smtp-Source: AGHT+IHTWKARXtM+OX30Ny91ja/jEBv3AnBIxeDt+3L3eLSW3k5m3ejus6fyMafMYPFEJVEb94bHLQ==
X-Received: by 2002:a5d:6c6a:0:b0:34d:b45:9b33 with SMTP id
 r10-20020a5d6c6a000000b0034d0b459b33mr5006036wrz.52.1714473852859; 
 Tue, 30 Apr 2024 03:44:12 -0700 (PDT)
Received: from [192.168.0.20]
 (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a5d48c8000000b0034af40b2efdsm23595951wrs.108.2024.04.30.03.44.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 03:44:12 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 30 Apr 2024 11:43:15 +0100
Subject: [PATCH v3 1/6] arm64: dts: qcom: sm8650: Fix GPU cx_mem size
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-a750-raytracing-v3-1-7f57c5ac082d@gmail.com>
References: <20240430-a750-raytracing-v3-0-7f57c5ac082d@gmail.com>
In-Reply-To: <20240430-a750-raytracing-v3-0-7f57c5ac082d@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Jun Nie <jun.nie@linaro.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714473850; l=1032;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=HdWAhjQ4Ivj20LLc1l3rIJf0eWqfBf5t1jj2qSpI0Qs=;
 b=uqOrau62L/MfHeD5TX92TkT+xOevf/c/Yi4elm/DQW1IHtSszoYJpU80NmvEDFBiFwqgvpNzT
 ru8WS1Ozt+MD8t4lnszsEdOAc8twvwEJ260RmG9Jd4qSSb/yCy/K/ah
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=
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

This is doubled compared to previous GPUs. We can't access the new
SW_FUSE_VALUE register without this.

Fixes: db33633b05c0 ("arm64: dts: qcom: sm8650: add GPU nodes")
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 658ad2b41c5a..78b8944eaab2 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -2607,7 +2607,7 @@ tcsr: clock-controller@1fc0000 {
 		gpu: gpu@3d00000 {
 			compatible = "qcom,adreno-43051401", "qcom,adreno";
 			reg = <0x0 0x03d00000 0x0 0x40000>,
-			      <0x0 0x03d9e000 0x0 0x1000>,
+			      <0x0 0x03d9e000 0x0 0x2000>,
 			      <0x0 0x03d61000 0x0 0x800>;
 			reg-names = "kgsl_3d0_reg_memory",
 				    "cx_mem",

-- 
2.31.1

