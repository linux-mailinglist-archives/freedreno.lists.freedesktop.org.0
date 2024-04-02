Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 346B68949BD
	for <lists+freedreno@lfdr.de>; Tue,  2 Apr 2024 04:57:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACA8F10F81A;
	Tue,  2 Apr 2024 02:57:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FaX9rtNX";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D4D510EA5D
 for <freedreno@lists.freedesktop.org>; Tue,  2 Apr 2024 02:57:20 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2d475b6609eso50304481fa.2
 for <freedreno@lists.freedesktop.org>; Mon, 01 Apr 2024 19:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712026639; x=1712631439; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=F5IC23W8dkfkeGv7PhNwXY6wfYxaTqv1Otp0zqPc/pE=;
 b=FaX9rtNXgpholL/JVfBB0ZHk73xpjsC7qPLRQ8DeUA9esHoLSqnmWEyArrEKSDuHC3
 nezvahSg59I2SdOxlL/ZXJMF9FMme0Jnf4d/oik8RouYKnt2uTEB9JNIrGzhKZKHISDv
 dagvFhnic5jKyHiMOJWbaYkUCMjwSVaNAqsYjC+IxrdZfIR3R2raFsEVm20yDQDbwWdx
 ZNv9GUHzw3MWF2rL2pd8PdGOcoKn6bsdwiBUxneaqVG6CRmnJdrTCN+w+8+ErMcF9v1/
 3RqLJ0toQnFyYxaVBZNJjNj2AS6NpZ2NopIZjFz8ycg4gfl/dsmG0HoaSFkpK4UUkX3O
 VO1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712026639; x=1712631439;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F5IC23W8dkfkeGv7PhNwXY6wfYxaTqv1Otp0zqPc/pE=;
 b=lSNgSoetWVRwxyMndEI08vUboTPIF6btWeiyHdb8BaWDFN+whCpEEdcnw1h3cUlaGB
 5CZnX/TQSgBRBghcABx2Aq457uAJOOsD88XzQtkQv3GomqsgUbphlARLnOHbQ7EVXh/n
 zZ52QGEks4yA9kPOoeuNLkzM/xgw1ezHS3mjrxB//ZLrY5XF+8yb1orVKx3mjIuujots
 t3cOLMw1SAuP92ze+yYujeUjhSCgHj+EKU548VCTkMAEl0L96UrwMuAtVX5D1xVhutGM
 WuS98BZGu7ZAfwqusdrIbQ015fLYBY9Z9H3OhdfQJjMIY3luMOPMMRtPJLoP9YW9Vfmk
 K1aQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeEaHb7H9cvWt85uAObGcCEXFj+SoK+C3ILn6Ifg5qLTxU3ph3wD91lMJQlQHE/ocoIcsqx4oSXumTxUWCAxt2NYLZRLryYo4JCGhJvCvX
X-Gm-Message-State: AOJu0YwTWlQMdUkvV3QtCOgVpXbfW3OfxLCnVDGDecds8rB6Ai+Dux+z
 iPtly8GVqK+Hw8yjLYMHuAKMPCErtvxgxJAd7jIH8DEqIXB5CIixj6yYof3rVPg=
X-Google-Smtp-Source: AGHT+IE5/I0Ui+n+NiAwymmYa3FFUUviJesGwNK15ik0L4EqKpZG6dgdOX1WTj1V5kOdlUI1dCc+Fg==
X-Received: by 2002:a2e:82d7:0:b0:2d4:35d6:1984 with SMTP id
 n23-20020a2e82d7000000b002d435d61984mr7265060ljh.6.1712026638803; 
 Mon, 01 Apr 2024 19:57:18 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 14-20020a2eb94e000000b002d48dcd10a9sm1562356ljs.86.2024.04.01.19.57.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Apr 2024 19:57:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 02 Apr 2024 05:57:16 +0300
Subject: [PATCH v3 2/4] arm64: dts: qcom: sc8180x: drop legacy property
 #stream-id-cells
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240402-fd-fix-schema-v3-2-817ea6ddf775@linaro.org>
References: <20240402-fd-fix-schema-v3-0-817ea6ddf775@linaro.org>
In-Reply-To: <20240402-fd-fix-schema-v3-0-817ea6ddf775@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=862;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=w5zQXOnPzB+6T+6japHE8hZUXFKbXI4e5KFMpuaJ0rw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmC3QM9OVJQVRYKxY615wIyW5tU7qgiHe2AT9Oh
 SAP7fUs9JqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgt0DAAKCRCLPIo+Aiko
 1eHpCACpIHEWWSt0ZG579x3SBHA4VNC/sjNCXH8JkSj1JtlfRqYbN/WdQ5nl1tw8/wVXUbj56ms
 AQwQxDLa9qQIgQT1sNNfryf8WQxIgYC0KtIFZC40l/3gB+2863sA1k+u+Z3Dt3RecGJfJkhYfBh
 ObYbuPO6WVE0+DAXD5QOtA/291yH2jCldHm+ZxqL/XYu/PEb4ZT26jyjL6bxmXSIftBmmBvlkH9
 t3t8iVJ2vxXz+7Za5GsbYpP5UDWF8+P6Lki9z+3d7dyJNXu1jMu+uNv3jgZb67zRKbZe0yee3e2
 ooZ6r/TUAKv9AvPeohukO87QN8LjEmI+kl/VfYY8hItlgTNs
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

The property #stream-id-cells is legacy, it is not documented as valid
for the GPU. Drop it now.

Fixes: 494dec9b6f54 ("arm64: dts: qcom: sc8180x: Add display and gpu nodes")
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index 32afc78d5b76..99462b42cfc5 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -2225,7 +2225,6 @@ tcsr_mutex: hwlock@1f40000 {
 
 		gpu: gpu@2c00000 {
 			compatible = "qcom,adreno-680.1", "qcom,adreno";
-			#stream-id-cells = <16>;
 
 			reg = <0 0x02c00000 0 0x40000>;
 			reg-names = "kgsl_3d0_reg_memory";

-- 
2.39.2

