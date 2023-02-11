Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A52D46930DD
	for <lists+freedreno@lfdr.de>; Sat, 11 Feb 2023 13:27:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 077DE10E2B7;
	Sat, 11 Feb 2023 12:27:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E642C10E171
 for <freedreno@lists.freedesktop.org>; Sat, 11 Feb 2023 12:27:04 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id jg8so21876533ejc.6
 for <freedreno@lists.freedesktop.org>; Sat, 11 Feb 2023 04:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LCJBJqQCcyLQd2npv843DzJ+BwQfckxzSozxdJyGi5Q=;
 b=sHWvN42dWrU/g6lxiby2XZnb861ebOkI0S9P1oAciJsf205ek1LaHUJnQxaIS0oXKY
 DeUvHlqa2U32CEO+TfcWX7yLoXFXPDAGzFjRgOAjNPjCdMNoCVEkf26GX8+X39fbYzUA
 PXgrzyTChmFpPL1Sk89eqVOxwzlLDciDB9fy35b70fn5DNAAW8OQyHFhcTAOsiB6lIr7
 azH1O8pJNC2pMsIVTB+zsv2d6LdaFh5kJ596rVpxlAmelaRN/KTUbeD0qpeDXmcyyC/7
 /xzSsTgkPw8HIpdgzy3rFrtRQpYNdgdsAAWnPIBaJkVvjk7/m/z3tG5rmlm6tEOPGkyX
 1cDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LCJBJqQCcyLQd2npv843DzJ+BwQfckxzSozxdJyGi5Q=;
 b=T9jDPFsOvVeK6bd2j6f/hq2wuZohLGKfOKQYQMWqmJo38Owk6Cng+u9jhbBPcSmEMa
 Wi44zXVViSIsr/aDOrtID6Fpwh3HTbaUgWD70Ugq9c18wd62MyQNS0qYP2b1HvqcX7Ro
 wrv4nlIgVC+z2QR96If8uhAE7Ul6NfMxwpqWObsX4NWrgD+WnXnaDDNe0zwgUmjfE9kr
 GMEmRux7NhKtgGtYnWKk47UNPzDFnJSDkhOVwx2K/EnzSFX2DPzWr6GVf9PGpcisBxop
 eYaBK1+vDrspiJVfBniSZUhCNWMGmRsxZoBnFIFpEhAfYz7D+NT4lwhBwQcNudEQ65Mh
 fyPQ==
X-Gm-Message-State: AO0yUKWR5/j7c4wlb+X/peDiVLUr+vLfCwh5UzYEZ9HUdbQ2jmr3tP+l
 J7bVMXi4+Z2ck7c2tfGeOeU3Cg==
X-Google-Smtp-Source: AK7set+bK56mjbbPp+UWSHs9x73Jo4yaH42c3isyrxt6UL0JHcFwHw/7m8zQx+6R/avr/CAh0Hxv7w==
X-Received: by 2002:a17:906:b0c3:b0:878:59b6:c194 with SMTP id
 bk3-20020a170906b0c300b0087859b6c194mr17624887ejb.32.1676118423428; 
 Sat, 11 Feb 2023 04:27:03 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl.
 [83.9.1.117]) by smtp.gmail.com with ESMTPSA id
 mv9-20020a170907838900b0087bd2ebe474sm3767941ejc.208.2023.02.11.04.27.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Feb 2023 04:27:03 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Date: Sat, 11 Feb 2023 13:26:48 +0100
Message-Id: <20230211122656.1479141-3-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211122656.1479141-1-konrad.dybcio@linaro.org>
References: <20230211122656.1479141-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 02/10] dt-bindings: display/msm:
 dsi-controller-main: Add SM6375
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
Cc: freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add the DSI host found on SM6375.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 2f946bb9fe24..41cdb631d305 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -27,6 +27,7 @@ properties:
               - qcom,sdm845-dsi-ctrl
               - qcom,sm6115-dsi-ctrl
               - qcom,sm6350-dsi-ctrl
+              - qcom,sm6375-dsi-ctrl
               - qcom,sm8150-dsi-ctrl
               - qcom,sm8250-dsi-ctrl
               - qcom,sm8350-dsi-ctrl
@@ -355,6 +356,7 @@ allOf:
             enum:
               - qcom,sdm845-dsi-ctrl
               - qcom,sm6115-dsi-ctrl
+              - qcom,sm6375-dsi-ctrl
     then:
       properties:
         clocks:
-- 
2.39.1

