Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C189B1A3A
	for <lists+freedreno@lfdr.de>; Sat, 26 Oct 2024 19:59:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F330210E424;
	Sat, 26 Oct 2024 17:59:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vQbNUthU";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2860010E424
 for <freedreno@lists.freedesktop.org>; Sat, 26 Oct 2024 17:59:55 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2fb518014b9so24290551fa.3
 for <freedreno@lists.freedesktop.org>; Sat, 26 Oct 2024 10:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729965593; x=1730570393; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=HC7ge2GOnUS59w3CE63WILUVafzgzFctamSgq8O3ZPw=;
 b=vQbNUthUXM5boSlb5vvoODKRkd7+gnt7J3ABz2S9Ba8ZIUaWsBV5F/LaiXfsieNExD
 9ef2Z0MJznbEpNz7mVz2YNf9kH/CwDJAo/QtjodLrgme4j6LfloYyI6KYtgyxcM4x6W4
 X1Zortq6ixRILCaX2f16+O+I04cSJl4yqLY3Es4XEOqMygmn+o7hQOXqCUTKaUoLwVgk
 ZQaFl+OOAcACo/H18U5EE0vLHtAPSYos70pt4Ln4tENXSfVTB1zUE3G5O3BZAJ86sn9H
 NehCxz1c7ubML6om7JFl56+uT/Rb8pjMBS9AnYHCEw6H26ww7Sb6X6j3mCoFG+mpwuZ9
 nRSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729965593; x=1730570393;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HC7ge2GOnUS59w3CE63WILUVafzgzFctamSgq8O3ZPw=;
 b=dSlfsyvO/To6NgjzU6PF5pgfr2s4V6QaiZnQ+dA2Bc7Vs2q08DISVg9I+G8TqMFygr
 IEiplRUu9IrxjFjJrHj3KIMIgi0rd5BIOhy1vJwsnxY0nz0zhzvH05rDjGjiYX/x3lGy
 8A1gvWMvL55mHPI9oTJ7Expgz3w9LCKVHCAbNEU2euomtjQ39w40YF3aRI4+nz4TKbRl
 CW4aOlKaZ0eQ2nUudG9gMY/I7vTS7sFKzbm2JeubIrFNUve1H+B6Poi2Cz2gEc8nt49r
 4QLR4mBWozzc12aFOPYY7RSJuFZasbyx3JGfFNhLh743Rmhy1sn7HfXoWEpVYdZFuNdm
 h+lQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXcDu6YPyTxEUoDsnXCChPLwMeTkttPcXnDC0vxYuAax1EjFhj3jjQZf0XIf6I/szThli+XgE3l+g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyBQr+wUGyrErFEGQWdIJONDqRAxuenxpUAeTkaesoYk7q5cZJ6
 ZkPHJWwLdenz17HR55848FoSryFAeKDZufyo5H9DPjidv5ldreWJ/HL3LXFolUQ=
X-Google-Smtp-Source: AGHT+IFJvk2eNmqZSTIMMdLk2drsnkEsAJMC4XT55QA6zfIctduoHpgiK823S4bxnu7DmuXh4AFEog==
X-Received: by 2002:a2e:b8c3:0:b0:2fb:382e:410f with SMTP id
 38308e7fff4ca-2fcbdfdb11cmr12029921fa.26.1729965593257; 
 Sat, 26 Oct 2024 10:59:53 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fcb453e53esm5970631fa.71.2024.10.26.10.59.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Oct 2024 10:59:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 26 Oct 2024 20:59:41 +0300
Subject: [PATCH v2 2/2] arm64: dts: qcom: sm8650: correct MDSS
 interconnects
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241026-fix-sm8x50-mdp-icc-v2-2-fd8ddf755acc@linaro.org>
References: <20241026-fix-sm8x50-mdp-icc-v2-0-fd8ddf755acc@linaro.org>
In-Reply-To: <20241026-fix-sm8x50-mdp-icc-v2-0-fd8ddf755acc@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1617;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=sKr/BvUYAOgHY4ZN/Rmk88OHIStViu1F6gSvWhlDBxg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnHS4R7YHfOs4vIQeSo2IOXxytBfzXP+eHYtHzL
 0nOcTCBSWGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZx0uEQAKCRCLPIo+Aiko
 1X3rCACPYqXa+RxJnVbTxsJwFRK+SLlbiS+cH1oWzz8Dx17wMpLr5kcR+oSiY42YGNV5g7xNtNy
 cmHF6Lce4m8UGHXobrl+NMJXqE77MuIa6xh7ND0vZ+FgVRWyXbEK7q134sK2u42WXJ9O0kPQYhN
 GlPzawZy+sg+iwfe6IkLOktfij65TS2pzSnyMgAg5mV2qZIG7Nw5/FeSh7fuU8DPBUq2OMB5YL3
 MEUnkoWEki/n0DbSZWzXa1YsfYbdJH8JBvNa8tMttePSFko4o2gEuD8XzmQTgqFNEEHCDRYv+yC
 +/OPUfSRK8hNGyZ303ln8mAkWa7Murcj4CemJEVCtKQRxw+A
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

SM8650 lists two interconnects for the display subsystem, mdp0-mem
(between MDP and LLCC) and mdp1-mem (between LLCC and EBI, memory).
The second interconnect is a misuse. mdpN-mem paths should be used for
several outboud MDP interconnects rather than the path between LLCC and
memory. This kind of misuse can result in bandwidth underflows, possibly
degrading picture quality as the required memory bandwidth is divided
between all mdpN-mem paths (and LLCC-EBI should not be a part of such
division).

Drop the second path and use direct MDP-EBI path for mdp0-mem until we
support separate MDP-LLCC and LLCC-EBI paths.

Fixes: 10e024671295 ("arm64: dts: qcom: sm8650: add interconnect dependent device nodes")
Cc: stable@kernel.org
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 173e092b15e2..4b54063c0e0c 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -3455,11 +3455,8 @@ mdss: display-subsystem@ae00000 {
 			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
 
 			interconnects = <&mmss_noc MASTER_MDP QCOM_ICC_TAG_ALWAYS
-					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>,
-					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ALWAYS
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-			interconnect-names = "mdp0-mem",
-					     "mdp1-mem";
+			interconnect-names = "mdp0-mem";
 
 			power-domains = <&dispcc MDSS_GDSC>;
 

-- 
2.39.5

