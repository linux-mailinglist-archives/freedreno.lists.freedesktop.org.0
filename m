Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 429A0993B46
	for <lists+freedreno@lfdr.de>; Tue,  8 Oct 2024 01:37:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CFD610E1AC;
	Mon,  7 Oct 2024 23:37:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="C2x81IQw";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3CC010E1AC
 for <freedreno@lists.freedesktop.org>; Mon,  7 Oct 2024 23:37:09 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2fadc95ccfcso54756341fa.1
 for <freedreno@lists.freedesktop.org>; Mon, 07 Oct 2024 16:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728344228; x=1728949028; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=CQLfPZ1C+8kI9P19huvG/Kxk4mb+t0/CSSYBX15+NYM=;
 b=C2x81IQwCIsTlUtXWMnskoU5Ui9zvc31gH+gH+0wVwuUyXIcdnWKSKvabCp8V3qxlq
 +fQ1bImmdfLF+ey4o9aaoLTGwYTAC6U9QVAh1e7zrzCPdutrk8k/dWAtcJTPtWgpV+Dy
 lhtfOm7o8NRDC16cwk0CAHX+0nb0UtqK3KQUFIy2cAyCv8XJJrpvPfO4CrnZui5dcruV
 r53Sz5tKfzS2A5kv9tDk10oifxpp+DC9MFOd6h/gmKIaF0rUqvtxQjsCzS/PWDutSuEl
 2ohRArrkm1jVzlRU/JP5iw5Bv90XO+rchG+Jhdbt3a35dB8MgSxyXByBXUJhmPYCAIoj
 Pc8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728344228; x=1728949028;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CQLfPZ1C+8kI9P19huvG/Kxk4mb+t0/CSSYBX15+NYM=;
 b=fgDq+hBQCl7mSg13RlJfgto9SJHA3l9YqftOiBCEHmD0gxtkq+f9PA+BIBOqmQnTXm
 SaUWMJDTmSmLPG9/e6BbAOwCbVxzQiJ1Y9AAUtjknct+lQkNZ/WSi8sK7PIc1i5imgmc
 veerQ+9vpDAiyKoFQF9c0HxMQPJ/qFviSmmcpCaADdc/URSjX16KraPyBAu6E1DS0l4J
 oNVqZOw4j6YqFqo68yDcNw2yUH0VU+89IMMDZCCWg/VfJlk/x+066sfejLEjIyQhcbqr
 wpwwnKlo9wjMUUZDH8ACsbs9arYzn22gXdp03jnvHGqojehqjk5SIStc198HL24SF3u2
 6S+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8riQxyHYxT30fApc3sJ7YiMhdavu6Ak6oHOJ3xV+9NqktnUHV4gvlNfeSzgMD86kEYg9ZkcL7a9k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzwPiI8BYBjZwsrCmgbT2iwEF9MI6PIJdHQfoAnlcygmDOm0b97
 4J/U9gXYvt+uHUGNXgl8xzHUjegdA7Um8S+nIK0nph+7u5GxpZLTHl7gXVs2I4Q=
X-Google-Smtp-Source: AGHT+IHAafBH9iXxZ06NKjJKiojqYjIYWAGrzT88XaX5aKORPvqqhBENvj5aMrFvDMFNdGahwiqgLQ==
X-Received: by 2002:a05:6512:3ba6:b0:52c:d645:eda7 with SMTP id
 2adb3069b0e04-539ab87712emr7373147e87.18.1728344227991; 
 Mon, 07 Oct 2024 16:37:07 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539afec1300sm1002256e87.17.2024.10.07.16.37.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2024 16:37:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 08 Oct 2024 02:36:59 +0300
Subject: [PATCH 1/2] arm64: dts: qcom: sm8550: correct MDSS interconnects
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241008-fix-sm8x50-mdp-icc-v1-1-77ffd361b8de@linaro.org>
References: <20241008-fix-sm8x50-mdp-icc-v1-0-77ffd361b8de@linaro.org>
In-Reply-To: <20241008-fix-sm8x50-mdp-icc-v1-0-77ffd361b8de@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org, 
 stable@kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1572;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=YQocvzYtQugoKxgD8nHuIxgQRJHdd9/v/IZp+pC+8dE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnBHCeEpL543RrUo9Z7rVDf0efOxV1fnhzZJITr
 iRfdb/o/jOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZwRwngAKCRCLPIo+Aiko
 1QFXB/4u855teCcg8ExURYV6FCQ8peftzz6joCv38Tr0CKTKHy2CcAG8NbBxqvAN2J2PSMPgvRD
 MRwHus6hw2GV2WLtoCv/IiAMY4c7TpHXlsVWjc+hurwgqgay2NWVJ7gBdrqlPpYPcZ/zpB7BllG
 SR2fqZgfMUwh2RrauwjF3c5xUxFcq/WzmVHvRg54zdDOEjQ8e1G9ANQJ8WHA6RLA/g5piIddWI8
 NfO5PqNErESUpBZEuSZJaGZa/4Z5/Lcvm+Td20f8q2wY/z1wwW9ncvxdjcO9dOPzuyoXPZMceQU
 98N0JCD9zH9JE3zzcJji6Shs1acdd/aVlqgkHQLt1A6OnhH/
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

SM8550 lists two interconnects for the display subsystem, mdp0-mem
(between MDP and LLCC) and mdp1-mem (between LLCC and EBI, memory).
The second interconnect is a misuse. mdpN-mem paths should be used for
several outboud MDP interconnects rather than the path between LLCC and
memory. This kind of misuse can result in bandwidth underflows, possibly
degradating picture quality as the required memory bandwidth is divided
between all mdpN-mem paths (and LLCC-EBI should not be a part of such
division).

Drop the second path and use direct MDP-EBI path for mdp0-mem until we
support separate MDP-LLCC and LLCC-EBI paths.

Fixes: d7da51db5b81 ("arm64: dts: qcom: sm8550: add display hardware devices")
Cc: stable@kernel.org
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 9dc0ee3eb98f..cca10f9faa14 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2871,9 +2871,8 @@ mdss: display-subsystem@ae00000 {
 
 			power-domains = <&dispcc MDSS_GDSC>;
 
-			interconnects = <&mmss_noc MASTER_MDP 0 &gem_noc SLAVE_LLCC 0>,
-					<&mc_virt MASTER_LLCC 0 &mc_virt SLAVE_EBI1 0>;
-			interconnect-names = "mdp0-mem", "mdp1-mem";
+			interconnects = <&mmss_noc MASTER_MDP 0 &mc_virt SLAVE_EBI1 0>;
+			interconnect-names = "mdp0-mem";
 
 			iommus = <&apps_smmu 0x1c00 0x2>;
 

-- 
2.39.5

