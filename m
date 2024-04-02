Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61835894990
	for <lists+freedreno@lfdr.de>; Tue,  2 Apr 2024 04:51:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5083410F81A;
	Tue,  2 Apr 2024 02:51:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="x9YWJKLD";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8198A10F818
 for <freedreno@lists.freedesktop.org>; Tue,  2 Apr 2024 02:51:48 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-513d4559fb4so5703413e87.3
 for <freedreno@lists.freedesktop.org>; Mon, 01 Apr 2024 19:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712026306; x=1712631106; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YOfJ3g/to7EyTLgt+Fv+Z4h7uzKPNiClRQu90BLeUVg=;
 b=x9YWJKLDr0Dym4qWKwTJHNekUlk7U0TXSv6Cbsf6P2M3SOru36KrnXol0GVaeLAgtV
 o/TeWwdIkp73+nEDnjHsfE0Ei2FVCQ4JLaiOMEEI+C449Ts2q8JYBqURFSxu55Xb+OiL
 v6zHUyuXv+9K4mVuwvW7S2g0ySIHbUzQiqTYMhWsV+3BDZuqqTrNKTHB7AUMeWtlVBjS
 N2ovUMJzvwaquIqo4rM88RU3Diki2b7YBwf5PKUF2VuB6kohDqWay0H4/M3mmBNhE2EL
 R4esYRpInC3CqsmPPjx5cO+dbbeTROCBuuc7eE9PqdI6WBDz9S2Nvk5YOR2jit+W6exA
 gHUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712026306; x=1712631106;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YOfJ3g/to7EyTLgt+Fv+Z4h7uzKPNiClRQu90BLeUVg=;
 b=oqQibIH7+Ev+0Quj7mKRmwEajTgGh8oBbDFaFMLsCu5QBlfOdRDZ7KimDkDlEuJEJ7
 +dcjH/Sic26xNzFysTBgKB3oPtX2LvTabllWNVTxSHUCfOluWnF5q3R7TKykmGg4E9jX
 0cWBv7oMrJnEg3/+w9F92QrE3uJf5CaL+p40KPKspQNX3fSHguYnPFWtA/q5+xJGoSur
 +ooGj8ENcTM+gu4HVp0F0UnwtHgT5FdP0/hOJ71crXbvFdm+y3Qux1WEKn6RIchGT613
 z069aiF9dJrRz02quuRH9lHuranAt5WhrRCfTU6I5+Vio1ZlMlMOQ81ukFKgHwu1A1oY
 N7GA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9HXJeBOl0z6qD2gsPQd1ly+jfCACk3Gwt2jHYyfqj4itNzl5xuPYFuLr9a20YLsA8QP+Isdo7burKK5gJ8J/QJOsiG+K7Geihhfi7rlJY
X-Gm-Message-State: AOJu0YyNDMBY5en4Th/go/G4fZK3oJJQ5hrUBK+xAPYH8VxhBH8TdQmM
 ooC5xqA/V9HM0ZUw82oR+cI1FmzOxaFXDhjRlF/z4EW65rKI1avBdr32r9Rv1iM=
X-Google-Smtp-Source: AGHT+IHNUvGeXt87CyX5BTmaYHcEFwZghtzCXxveGiaB51yrxkZpJLWdYcOya03zz/NEhrSjzF5R0A==
X-Received: by 2002:a19:3801:0:b0:515:d5dc:d32b with SMTP id
 f1-20020a193801000000b00515d5dcd32bmr6257098lfa.25.1712026306505; 
 Mon, 01 Apr 2024 19:51:46 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 h26-20020ac24dba000000b00516a1e2a6fcsm738824lfe.256.2024.04.01.19.51.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Apr 2024 19:51:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 02 Apr 2024 05:51:44 +0300
Subject: [PATCH v2 2/4] arm64: dts: qcom: sc8180x: drop legacy property
 #stream-id-cells
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240402-fd-fix-schema-v2-2-39bf90051d83@linaro.org>
References: <20240402-fd-fix-schema-v2-0-39bf90051d83@linaro.org>
In-Reply-To: <20240402-fd-fix-schema-v2-0-39bf90051d83@linaro.org>
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
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=807;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=mipBzLhXme/edDDsNRRaHmAV/zjI88iNQMd61g5M1kU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmC3K/9tLaaKflxdYIwpCBLpwR7Rr00FbdzyH1u
 rioPNQYRrWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgtyvwAKCRCLPIo+Aiko
 1VwFCACTFvbQU+Q4PmKNdSn8Gpct+tMjw2VxhIicMc83/UknCX70PYqne35++283QFaMq9OWMFP
 uusglJLuCVVOYBjn+Z0YmePgt0BLfuLPTyUqM6gjfe3Fl0saLj+EGzf5Okkcs64+h2SWnHNZg5v
 5h5T3lUOCzF3bePwAwWWErrrDVV0EcSMdnQw+PSV/JvyhFiRbjiBnP1s1Hsg7nFFpqd2xSJQ7EV
 pRgh9r3lY3bRj7sIN8uEjBPw/YRrqUeqzEjL1u7ESkKI58akpAsSFtuZKSkPlNaoH4mzdQQwAOl
 5UMjyMP29KXrvRn7+SSQtzpeJOOsgUsyrVSJfh+U0IPdYb/P
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

