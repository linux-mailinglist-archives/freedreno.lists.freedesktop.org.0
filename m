Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B3A9B1A39
	for <lists+freedreno@lfdr.de>; Sat, 26 Oct 2024 19:59:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4201510E423;
	Sat, 26 Oct 2024 17:59:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MXxcPyo1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7FCD10E423
 for <freedreno@lists.freedesktop.org>; Sat, 26 Oct 2024 17:59:52 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2fb443746b8so29575301fa.0
 for <freedreno@lists.freedesktop.org>; Sat, 26 Oct 2024 10:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729965591; x=1730570391; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ix2+YHi6Hwn7k02ZYsRrumtAZZIu1FGEvAr1ZAiI+6Y=;
 b=MXxcPyo1KZ4pYkJpJ7Pz3y/Ag1G644oVXKn+t3jcYit86nNGMD9SJGXysAFknLbScs
 u9/Jd2XzMDi4HmecSVch4FnJHlMww2MqJ4nXnHR/1BJsMa1VJ+TPID2T0b8FqOEkvLL4
 GUszcLb/sm3rv8fgOttea18fyv3OYhrmInNxIOtbibElLYeZX2AI5OSH5SOERtzI86ij
 /z3vF8QopT6MQtCxzljI5XnRAJSYFnzwxCIbWL0bVqh1R/5ZhkV88Lm6Jae/HkFRp5dF
 NdE0bUflQiXYDzgBKZUgWHTbY26RErX9JMDdqV2rLW3JncUqGoUI6HGRWrLj3z8FMDPj
 uzXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729965591; x=1730570391;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ix2+YHi6Hwn7k02ZYsRrumtAZZIu1FGEvAr1ZAiI+6Y=;
 b=b3triLiry4gfk2Y7j0AWe+mtbHnEnMjMlKccfbdJwcD9hWUVpgzaJU0yMPiDJ7bGi0
 Ggv6BrdkHyzqhPZcnJUrqgiiO3Xx7Btd6rb7GT55lw26LqP39g1r+L8NmAftNNxNDIbr
 +odcvCybJe9ezDwAZkMWfMVtQ6buoa15qOfRncw+kbFqk2JgFTATDNm5zn0ZdiKUsp1C
 FkMCEXAAOnmJ0xTAclE8x3QhYk7D8CBNnEppH3HV/EtPEevJUuEc2z9E/mBHTMLeAG+V
 hLrZJkvenB+HA/M+xqJXCuJN9hQ7FOifHeHtcIs6LcAesQOOLia0DGjZD5CZf6UcHza6
 yWUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmnlBdXU+xptWnk5t+/iqXQs0ySyLcTdNKUwdAsa9Qj8L/5qApEM6aEFTtSfBQYIFFIooQgK2CGT4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzSWrEw9xi2uGYGdgRfl800UlYxCRjqfgOHw1v7Eto6RT4EORpT
 Gv3Cw02LLzZrkL4vEloU+lp8yAdT1feTyucCBJ5ySFNQ6Mb1RgrCp9KmR7rPea8=
X-Google-Smtp-Source: AGHT+IHJENZiqkul8liw5mKMMkdYQixr2MLk7dKug07H53qh3Nesxap3BkNWKvtYQ7V/0e9vXr2p7w==
X-Received: by 2002:a05:651c:2228:b0:2fb:5a19:5b92 with SMTP id
 38308e7fff4ca-2fcbe0b5efbmr10792691fa.40.1729965590716; 
 Sat, 26 Oct 2024 10:59:50 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fcb453e53esm5970631fa.71.2024.10.26.10.59.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Oct 2024 10:59:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 26 Oct 2024 20:59:40 +0300
Subject: [PATCH v2 1/2] arm64: dts: qcom: sm8550: correct MDSS
 interconnects
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241026-fix-sm8x50-mdp-icc-v2-1-fd8ddf755acc@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1570;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=W+RGPqPnbhu9Q3x8lJkcTlZu/uDp2T0PEcID/5CYBT8=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ7qsnkCq4pN4vY07jQTfy5q8zGCe4SiUm9PW0GGbxFejW
 r7uk0wnozELAyMXg6yYIotPQcvUmE3JYR92TK2HGcTKBDKFgYtTACbitZH9D4eYlZRfaDrfjvKQ
 qsvNvnIXXAUbkzOS2RZ6pOy+2eUxR59nC0fDsjIJoZC3Jy93/72mtuKe1JeJahsrup+d0j+iJt7
 5741AqZRv3nlDGyNjLeveK9ZNZvdZNttesV/29x2f7+yPe35cSHmg9as+/ZdLqtnLSeYeic8dsi
 +euXIqSe7xzFP3Fk7dnpSgG74q01qf1zhhWt7GIv46do2iiQZT8/4r/xdss1Q7s+Dij6fbjl/4f
 5NfXlar/O/jjuu53gIXHl9wOfWn5wM7c9el3HzFPLcOk+dVm3MzyvYlObzcZPm8b+/vXaXz0lna
 XYJaDMqDtAp/Mm8+I2VxqlSiY3JHduuixGXf37vkMGUDAA==
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
degrading picture quality as the required memory bandwidth is divided
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

