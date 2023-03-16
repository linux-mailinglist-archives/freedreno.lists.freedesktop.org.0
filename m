Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C936BC9CF
	for <lists+freedreno@lfdr.de>; Thu, 16 Mar 2023 09:51:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFB2A10EA1E;
	Thu, 16 Mar 2023 08:51:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B16810EA55
 for <freedreno@lists.freedesktop.org>; Thu, 16 Mar 2023 08:51:14 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id b13so846437ljf.6
 for <freedreno@lists.freedesktop.org>; Thu, 16 Mar 2023 01:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678956672;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lGx1EMDayEFQk6t13uD2RfqUM6dmmVIVZCz4JA+bL8w=;
 b=k2cZi+Jizy40BMhfzsFTiSKLERA9RYxhndpDgUsgMlfQIwRh66hPqO35fyMbMVapCd
 K8wIf7Hi3PQqH/klEXZWCIiqLmfx/1/T/fbFgi5QsQ/7TyqIvr6xdvS4CAnrdDxz08xM
 MNFE7NYLeQux8D4Eyd1mcyjW65Im5o4IsopklTpdzkERhfGKIM13ArVFWU0gDnH8Gq0d
 zB8h3bjeXJKf7V4mLC5Eoc12alyTrk8Wz4ZJGBIoZxzuUs8YITb9G9OrRBFA2Pf2faTX
 xtUTEArirXWTU39FinWou3VtsdAbpLicVipmbHTkyLV6egSpWaNrc3+FD4GZkKKxsS49
 SRSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678956672;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lGx1EMDayEFQk6t13uD2RfqUM6dmmVIVZCz4JA+bL8w=;
 b=z3BvBHrLTC883UJIM5qNejU2hnV82Z1QEFvF9G9hfmgBfUEgYuilKXaMPt8k6Y8zjp
 S19yJS2N/9Ywl+O8bfn+wTouTOPpwnxvLPqbue4u2wlvzV7Y8ybcC77NTc+JlbTMZkKv
 uqk02rxYRoLlw5aOQaMzbdWMUiD0XQN6nbiL5U5vA2Y3GMTdMxt2HdO6CwexsPBfyGLf
 5q9gykVI69zuuHXsKd6bWZ8qnu+suaoDih1Q8hlMIA6y3zc4qaC5H2szC/sJXwsSvCMT
 67WNn+ez0tSi69olaJCBUC/XIxGI8nXx4N6gKGT6vwF3hVjZ32v9wmAqlKk0ezBqbBz0
 DAAg==
X-Gm-Message-State: AO0yUKUcTrmQCfpbmBHpKAA5n0rqp+BsE+lMsn2SWRrE2vsyWU65WW0r
 xksEj3OEpAxtNLVRrujmOzgxsC2audftwhLdRKc=
X-Google-Smtp-Source: AK7set+LOdjLIijgTnxittedEAg9C0JxSXja6pNSpgc6AZvJIVz8rS3AEv6aIeHCQyAyI4Z2IzC4eA==
X-Received: by 2002:a05:651c:550:b0:290:6e01:8d0b with SMTP id
 q16-20020a05651c055000b002906e018d0bmr2495303ljp.26.1678956672023; 
 Thu, 16 Mar 2023 01:51:12 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
 by smtp.gmail.com with ESMTPSA id
 o11-20020a2e730b000000b002991baef49bsm251566ljc.12.2023.03.16.01.51.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 01:51:11 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 16 Mar 2023 09:51:07 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230307-topic-dsi_qcm-v5-1-9d4235b77f4f@linaro.org>
References: <20230307-topic-dsi_qcm-v5-0-9d4235b77f4f@linaro.org>
In-Reply-To: <20230307-topic-dsi_qcm-v5-0-9d4235b77f4f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678956668; l=1083;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Eh63V3hQJ0V0iEgOzc+LSRnQ4e7sliZ5heAo7YfywsQ=;
 b=0aBVkVeI/ZqqJNMp8miJ4K//LS3qrTKMSBxQoa70P28PuSQ+d9x7z6eVXh31sSjvZLUoOUVrG7eo
 znTwkN6hCC+O6+mSA0aiGA588ugQL8OuLP0emYeXYR9x/WhUM8b3
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v5 01/10] dt-bindings: display/msm:
 dsi-controller-main: Fix deprecated QCM2290 compatible
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
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The qcom, prefix was missed previously. Fix it.

Fixes: 0c0f65c6dd44 ("dt-bindings: msm: dsi-controller-main: Add compatible strings for every current SoC")
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index e75a3efe4dac..2494817c1bd6 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -33,7 +33,7 @@ properties:
           - const: qcom,mdss-dsi-ctrl
       - items:
           - enum:
-              - dsi-ctrl-6g-qcm2290
+              - qcom,dsi-ctrl-6g-qcm2290
           - const: qcom,mdss-dsi-ctrl
         deprecated: true
 

-- 
2.39.2

