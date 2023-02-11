Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8AB6930A1
	for <lists+freedreno@lfdr.de>; Sat, 11 Feb 2023 12:52:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02EE910E2B7;
	Sat, 11 Feb 2023 11:52:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4036A10E165
 for <freedreno@lists.freedesktop.org>; Sat, 11 Feb 2023 11:52:12 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id bt8so1505144edb.12
 for <freedreno@lists.freedesktop.org>; Sat, 11 Feb 2023 03:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ep4dAxNDBfiGXuqBk5NhBpEX23ggwEaT57AExj6qK0E=;
 b=Ws9TMQBBjwg4Bf+XyEsFTANdDjnR52eVQqWllfm/eL6AswidbXnlQJFDHH4YLmfETD
 U3OxqDa/TZbXDxlHMmsZi40sD+HCNDSN34F3xv8sTzXEdmPfYuwUdiWzAWnb61rVQ0xf
 j8B+2w5F3dKIm3fGRFDOHXMjEtM6O+TU1dpWFBhRoB9K2Nv6uCaSb/rotnGu6iYPUOvA
 FuF2RJQaRu2z1CVEicVn07dV6HUMckQrZ67f3T8p84wIYZWVvYQ0Z+IO3oLs3J1l8Jk9
 6ZTftQ2i8DJ9seg2/lTq/0tRRfa1/PJlP2CkPgmbRZ8d5rL8G1g6yB1W82v84ptd3yGh
 gc/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ep4dAxNDBfiGXuqBk5NhBpEX23ggwEaT57AExj6qK0E=;
 b=4sVBf9Eauo0qHetLzs78JMcpHT9Z0MHNxlzw4TZykrvLDBpTtvPsEVaxRFTwJ10dyZ
 e6tm5Hq440dy6PP2da6pC4Fy52Kl/kv38iViwUySQJSldzwJ3iZz3wsOJ8c6EsY/bAjj
 uxi7BMHZIkf3mQtjJinQok3JUYbiAbN3xcmKqmsLEshuujoeCIKn4DQIfSrO0fjeHEmA
 ZZhX7+E6a6+SEexlqlnmulGB3z2NiLPjO0jWWT1ylR1s7297Ec2przaxRHioSGaK69xd
 smg0puv+gDgQxF41WJLkGmamip9yTjqwTQJlu2yr7UjgtK9Gb7zG1BfyJPnT+zVUa3W/
 gzYg==
X-Gm-Message-State: AO0yUKVTGO8kfadQi7k0yoWexPAFXHvLQ49HNlOpcTvmYXUETpzA7QCz
 gxVJWcLcwzzoga4waEjiyjgaJw==
X-Google-Smtp-Source: AK7set8nFD70BQHFMI+e62J+GhDF/grxODnHtEHEYhGYWTRQeWxm2mDUL3KfNlThoD0Bp0JBR/zXtQ==
X-Received: by 2002:a50:9e6e:0:b0:4aa:a709:8aaa with SMTP id
 z101-20020a509e6e000000b004aaa7098aaamr19205386ede.26.1676116331919; 
 Sat, 11 Feb 2023 03:52:11 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl.
 [83.9.1.117]) by smtp.gmail.com with ESMTPSA id
 r10-20020a50d68a000000b004aabb714230sm3636070edi.35.2023.02.11.03.52.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Feb 2023 03:52:11 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Date: Sat, 11 Feb 2023 12:51:09 +0100
Message-Id: <20230211115110.1462920-10-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211115110.1462920-1-konrad.dybcio@linaro.org>
References: <20230211115110.1462920-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 09/10] dt-bindings: display/msm:
 dsi-controller-main: Add SM6115
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

Add a compatible for the DSI on SM6115.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 2494817c1bd6..f195530ae964 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -25,6 +25,7 @@ properties:
               - qcom,sc7280-dsi-ctrl
               - qcom,sdm660-dsi-ctrl
               - qcom,sdm845-dsi-ctrl
+              - qcom,sm6115-dsi-ctrl
               - qcom,sm8150-dsi-ctrl
               - qcom,sm8250-dsi-ctrl
               - qcom,sm8350-dsi-ctrl
@@ -351,6 +352,7 @@ allOf:
           contains:
             enum:
               - qcom,sdm845-dsi-ctrl
+              - qcom,sm6115-dsi-ctrl
     then:
       properties:
         clocks:
-- 
2.39.1

