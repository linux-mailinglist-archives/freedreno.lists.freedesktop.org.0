Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E95629A6A
	for <lists+freedreno@lfdr.de>; Tue, 15 Nov 2022 14:32:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38F0410E3EA;
	Tue, 15 Nov 2022 13:31:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C976A10E3E3
 for <freedreno@lists.freedesktop.org>; Tue, 15 Nov 2022 13:31:30 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id m22so35957687eji.10
 for <freedreno@lists.freedesktop.org>; Tue, 15 Nov 2022 05:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0Fov8iE/sdW1px1P+pOp4rUXG2qai5ScCDQVqwGHb0o=;
 b=csl4NTIIDxeh8MyyI+Ga/ULew0VG/j57aFAtB8Mjx8NgO2yoy//AuyswpL4h/hRKXf
 3gjn1bcuwulVoldABTYrOl8XxGq7Xr3L77R546yQGRykoR+4UWpv93Rh3wVcxmzMr6GS
 YHuw5G0aDXKKEm4P65PpUVaTmLCylxhunwi4BXOSAdlQl5VLnX66Et7MNoifRZWOiHhN
 e7SGHEf+fT/vYJshKcpbxpJVROcx8qA6Z3SJ7kYuySljtBQmtVbQKLuNmWGce4qZL2Ew
 BSCe26tX/OfGGg2gmGCAFpzM/lEXRFi0GKyTH6PKhZBQossvMc92Vh6VJdrXASMwqHeL
 x2fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0Fov8iE/sdW1px1P+pOp4rUXG2qai5ScCDQVqwGHb0o=;
 b=pAT4Dd+qlTXhWmS2lEgHwYgRamaLBle6Dpy0IJEUalHlq4HUItaFkrFLa780jQFAtG
 LGGNPDv+ln/rLo9ubBzo+RyW/ctGD/zxbu15rXhgUdT72g/7w0Lig2g41edV9iSSa9x9
 Qfv93kyNq32eYyl5sgGccpbjFd7GQStU/SRMysloYm2qyPM1UVJIRpRpbtbaphsO/LDT
 LZNEosMJdv8FJVKa0Ndc5UPxtoxv1TLduggqTbXkdqV2/Rcxtqcl/aiGZI/GW+vW6caN
 /ApeV9f9ePHhse9E1zGqB4vmPGsYyDODiSt3V8+TZgKUXb//8szapDb3C5UwpWTqwWtl
 VslA==
X-Gm-Message-State: ANoB5pl9+YANvgrj6v5xo73c/lKIiZvTC/2okYS3TAB3kXzA4xNRe2/6
 zLtx1tcNNQZ2vZGfIKl9Kb7+AQ==
X-Google-Smtp-Source: AA0mqf6/2IvtQ9tyYDU30EBz5bwd3Og7fYNxlk9thXt+BmYji4UroSU1/DeLM42jZ1SNFLkKsR0Vyw==
X-Received: by 2002:a17:906:da0c:b0:78d:b43c:81be with SMTP id
 fi12-20020a170906da0c00b0078db43c81bemr14106931ejb.600.1668519089264; 
 Tue, 15 Nov 2022 05:31:29 -0800 (PST)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
 by smtp.gmail.com with ESMTPSA id
 q22-20020aa7d456000000b004618f2127d2sm6162176edr.57.2022.11.15.05.31.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 05:31:28 -0800 (PST)
From: Robert Foss <robert.foss@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 agross@kernel.org, bjorn.andersson@linaro.org,
 konrad.dybcio@somainline.org, quic_kalyant@quicinc.com,
 swboyd@chromium.org, robert.foss@linaro.org,
 angelogioacchino.delregno@somainline.org, loic.poulain@linaro.org,
 quic_khsieh@quicinc.com, quic_vpolimer@quicinc.com, vkoul@kernel.org,
 dianders@chromium.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonathan Marek <jonathan@marek.ca>, vinod.koul@linaro.org,
 quic_jesszhan@quicinc.com, andersson@kernel.org
Date: Tue, 15 Nov 2022 14:31:01 +0100
Message-Id: <20221115133105.980877-9-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221115133105.980877-1-robert.foss@linaro.org>
References: <20221115133105.980877-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 08/12] arm64: dts: qcom: sm8350: Remove mmxc
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The mmxc power-domain-name is not required, and is not
used by either earlier or later SoC versions (sm8250 / sm8450).

Signed-off-by: Robert Foss <robert.foss@linaro.org>
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

