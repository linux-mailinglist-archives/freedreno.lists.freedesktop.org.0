Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC36E6711B2
	for <lists+freedreno@lfdr.de>; Wed, 18 Jan 2023 04:17:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDD4610E6A4;
	Wed, 18 Jan 2023 03:17:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB8F410E656
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jan 2023 03:17:23 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id ss4so72791691ejb.11
 for <freedreno@lists.freedesktop.org>; Tue, 17 Jan 2023 19:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/H38JSzifnwb7zs7IwlqqhUAxLsg6bbjCNQsPXDmKcE=;
 b=S0/ecNIzhjTqJgJqGM+ySaF6GeNHGO8yws1sSR6cc7Ib9iXESkQKGsW76Dqwh9iCyp
 tRTW7/INysF97pqqsUKJtO5uI0t3P0ZmSyTB71y5X+AqQzPsUXgZrLs8g8a4CipLeJaC
 fsOszYgN+a6MHL0ffagmo3soqCFqy8Tcb7sIDT7JVD/2m0Ex0tnNQmRJIqGx4phmoLbA
 I/s6vSXGkhLcmR6LqbYkbxb5C8wzIfgkU43rprmR2K4N1W/pvuouV4cpq1uzgDPbuwsf
 ThXncM7jshb96QVbTUEf4hacGvPCySHCwmir0uhRXZ4ugy2rXQxoMzXST5IHgF32GsBq
 77yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/H38JSzifnwb7zs7IwlqqhUAxLsg6bbjCNQsPXDmKcE=;
 b=onSCDQr24NPrhgm5ftSFaHa0+dhF68/D1i5VbF9sf0aPmTtkDpvTjIw44x+1Pxonmb
 2S4UEQCLf6nILYtTR1wSSUfs+hyawDG8mzWqHZhzVOhyaUzAm6WO459Zw011hdsIIvHU
 F3YMxM/ViO/FoGSDAUuLQIak7pKmqLyVHKrkHPFtC8y3yu9h7I9QeIgSzWVN7bDeOcjI
 PmAq/gO2WtCkIj7KgEqXeMc8bAVL4Tfxfv5ByiZ/Ht3q42KPeX6n9uR839K7wle0l/Aa
 yvlIAw30iJDicdBEiLr4ujRF6+asIhwwpcHELLvukjwQx0frhdnAiOBX8H3V029jVMSs
 hTZQ==
X-Gm-Message-State: AFqh2kqcGUYW3Nn2+tVAV9i+2y0riBc/QRG4TngIdE/FDN9ts8J7bToD
 YNulBLWPerZOmwmpmV6mBi3vKw==
X-Google-Smtp-Source: AMrXdXuy/67RMVL67giu9fCmAhYbyAzLaNrTa0UAmfawO033JlwKiwAoZZcOuajvnq1/pBuotkybbQ==
X-Received: by 2002:a17:907:a092:b0:85a:4230:756c with SMTP id
 hu18-20020a170907a09200b0085a4230756cmr5522046ejc.59.1674011842388; 
 Tue, 17 Jan 2023 19:17:22 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 2-20020a170906210200b00876479361edsm535639ejt.149.2023.01.17.19.17.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 19:17:22 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Wed, 18 Jan 2023 05:17:17 +0200
Message-Id: <20230118031718.1714861-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118031718.1714861-1-dmitry.baryshkov@linaro.org>
References: <20230118031718.1714861-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 3/4] arm64: dts: qcom: sc8280xp-crd: drop
 #sound-dai-cells from eDP node
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

The eDP device doesn't provide sound DAI. Drop corresponding property
from the eDP node.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
index 4e92dc28e2ce..a3b9c9d0a94d 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
@@ -253,6 +253,7 @@ &mdss0 {
 
 &mdss0_dp3 {
 	compatible = "qcom,sc8280xp-edp";
+	/delete-property/ #sound-dai-cells;
 
 	data-lanes = <0 1 2 3>;
 
-- 
2.39.0

