Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8639642D0D
	for <lists+freedreno@lfdr.de>; Mon,  5 Dec 2022 17:38:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB21010E257;
	Mon,  5 Dec 2022 16:38:14 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9136B10E259
 for <freedreno@lists.freedesktop.org>; Mon,  5 Dec 2022 16:38:12 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id td2so29152771ejc.5
 for <freedreno@lists.freedesktop.org>; Mon, 05 Dec 2022 08:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b7SDPTYTDrfGEJ+RynD2emKN+BNWTJBfUnEQ5w+gbNU=;
 b=ZhC2zj14H0eBmdnWzrKouWVPbOm5dk5S/NuWAx5+8eAyP12MMQahYkPEr4yqoDddt3
 FWiVAw+SwGMBeFuo8I9hrXXoOw2UYPVWB4Y2qovyyQQEUua9mkJmCNzwOYtFmH8CNJdO
 NcCFZ9m4OyPlFWF/mfgWGhblIf8mwPIFxcFji4inEG9hgANnHgEVPfkhz3qw8n+ZbeUO
 ELznAooSanBdflFmyqAe9bLrP056n0G5733Eb+edIhJaMITf9WB9zuRvy1OgPUNSIic5
 3pfhp3sskn2oNhh4YOX1O5nTkAifEu2gmtpPIa5VSwTQMjIzxfefj43/tf9FPb0EhE7u
 Xkag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b7SDPTYTDrfGEJ+RynD2emKN+BNWTJBfUnEQ5w+gbNU=;
 b=yv8wPqRxybyPfeYzJuHzptcqoRUvSPVQ35mksQ/FEW7L+pC5iV+fgCoyxN6X8cW3HL
 CHEfuBWOD4h/PnVpUx2tCUBFYu2LXseky3Jcz5vK1hYx0JOyB1h2TuBjy4t42larzrWM
 LAtYRVilkFemSchHsIxR/B2qTIGpItGrAJuVckTn7n3kP0DFyl3saA1Ajo7tDJ2XFLDX
 TaEOevLiWUihDwZcD28dDnCVb+n4dR1Qkkj5cNj/ALnZ7xxDc8owUO4SjW3KNkvwc5NV
 2qN64v5HawGQ8aNL9GURYZmIOMf04ls6GVXwZrraf2bb/jvrwJU3t/lHJd0nyqL5tc/2
 pgSw==
X-Gm-Message-State: ANoB5pnFzo+jHwvdAXhxQMTX3GSIajcl/0k81i8/EwlbXjfwjjcBuGTk
 AmtJPPvQ4HJBCZc07rZiw1ujcA==
X-Google-Smtp-Source: AA0mqf43JomvYsw3VZj9x6ZUq2+n2hGeCCKmwzrPs7hKUSlkv5/K9Lwfty0KSSSuXHZrRy0kTQrtVg==
X-Received: by 2002:a17:906:4087:b0:7c0:e6d8:7661 with SMTP id
 u7-20020a170906408700b007c0e6d87661mr6269511ejj.242.1670258290825; 
 Mon, 05 Dec 2022 08:38:10 -0800 (PST)
Received: from prec5560.localdomain (ip5f58f364.dynamic.kabel-deutschland.de.
 [95.88.243.100]) by smtp.gmail.com with ESMTPSA id
 e21-20020a170906315500b007bed316a6d9sm6413610eje.18.2022.12.05.08.38.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 08:38:10 -0800 (PST)
From: Robert Foss <robert.foss@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 agross@kernel.org, bjorn.andersson@linaro.org,
 konrad.dybcio@somainline.org, quic_kalyant@quicinc.com,
 angelogioacchino.delregno@somainline.org, robert.foss@linaro.org,
 loic.poulain@linaro.org, swboyd@chromium.org, quic_vpolimer@quicinc.com,
 vkoul@kernel.org, dianders@chromium.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonathan Marek <jonathan@marek.ca>, vinod.koul@linaro.org,
 quic_jesszhan@quicinc.com, andersson@kernel.org
Date: Mon,  5 Dec 2022 17:37:50 +0100
Message-Id: <20221205163754.221139-8-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221205163754.221139-1-robert.foss@linaro.org>
References: <20221205163754.221139-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 07/11] arm64: dts: qcom: sm8350: Remove mmxc
 power-domain-name
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The mmxc power-domain-name is not required, and is not
used by either earlier or later SoC versions (sm8250 / sm8450).

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index cbd48f248df4..805d53d91952 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -2558,7 +2558,6 @@ dispcc: clock-controller@af00000 {
 			#power-domain-cells = <1>;
 
 			power-domains = <&rpmhpd SM8350_MMCX>;
-			power-domain-names = "mmcx";
 		};
 
 		adsp: remoteproc@17300000 {
-- 
2.34.1

