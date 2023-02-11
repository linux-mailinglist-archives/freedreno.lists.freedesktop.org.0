Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EF76930D7
	for <lists+freedreno@lfdr.de>; Sat, 11 Feb 2023 13:27:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D0DF10E171;
	Sat, 11 Feb 2023 12:27:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03D7810E179
 for <freedreno@lists.freedesktop.org>; Sat, 11 Feb 2023 12:27:02 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id qb15so19801285ejc.1
 for <freedreno@lists.freedesktop.org>; Sat, 11 Feb 2023 04:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UHheap62xUTlR5nYAk+Jh1vpzTppzTaMXhpOmRALAYI=;
 b=JZMN+4hSY640k6Kja8OEBIuj0yWLh5OZ1zOwcmtNaNn0KoXB0JLEBY9/Kwc7/GqgiF
 m1ajvu/oQv9m83TfWB2xAJ8XRJTq+b6iDh92VLLtaqcKXEgguqz5BlupzibNuRLjbcEZ
 YosZ6bhGT2WfNj9cLqEZYVGDKk6FCjMzxWI8i7R9/l1Ca1x6IO0mHBtfBX3RsHJYsM8S
 2c6Ila8w+ZbK+3pe/IWZq+aV7lSBHAtsUPDn0UyIMVgYYsrJxKo/ACJivXEmt6GFzTPE
 +/a3l/WMkp5C33z0vtu06C6DtXfbAfgSxPEtrhA6DgE16cTUUhbxNMYbAKNdcmu6+Wh6
 pbZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UHheap62xUTlR5nYAk+Jh1vpzTppzTaMXhpOmRALAYI=;
 b=K8UO9oeZ83x6OlVTG6Y92+zOz5FFOUgsvsp5NlCxjQruCX+1NyKcnpmrrJCq5EmzOJ
 Ct10PrhL9yS0ByphYjvMpWT+hQOYdgxXbjwaYzY88neHmaETbRfdYNUReFZA8t41N0iR
 l/xIg/OsCD0E2IEUudWhIvpeAn8r+ARq++S/RBdoeBdK/7BtWpq7gOEOaBJyFRR6TK+N
 yjw1n4qARW/hanlfxiSTi54sFKRVUoCh6pdv5SJ0k1VSakcPqOXvDFOfBbKe4klYRZ8X
 FWCnBunFU0N0648I4tREzyV/LQDapdTqtIMAd3QW3wDs22qHTOKS8JZim7VDoob6Hc8y
 QVwg==
X-Gm-Message-State: AO0yUKVr2QdDBy/MwNiFBXymCEvdcGIB521rNN169aQMjt4zEL8FO5aj
 ih9C8ytJjP+NATHZp/fqn9wtJg==
X-Google-Smtp-Source: AK7set8ZFbIY5TBzWXOS1C1MfTjkBrsnU/cixmxrIKXASrqcqd0fgrjzx9nXG8WSbxwhzFSQIByu3Q==
X-Received: by 2002:a17:907:6e17:b0:8af:2af5:1191 with SMTP id
 sd23-20020a1709076e1700b008af2af51191mr12961239ejc.18.1676118421369; 
 Sat, 11 Feb 2023 04:27:01 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl.
 [83.9.1.117]) by smtp.gmail.com with ESMTPSA id
 mv9-20020a170907838900b0087bd2ebe474sm3767941ejc.208.2023.02.11.04.26.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Feb 2023 04:27:01 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Date: Sat, 11 Feb 2023 13:26:47 +0100
Message-Id: <20230211122656.1479141-2-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211122656.1479141-1-konrad.dybcio@linaro.org>
References: <20230211122656.1479141-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 01/10] dt-bindings: display/msm:
 dsi-controller-main: Add SM6350
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

Add the DSI host found on SM6350.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index f195530ae964..2f946bb9fe24 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -26,6 +26,7 @@ properties:
               - qcom,sdm660-dsi-ctrl
               - qcom,sdm845-dsi-ctrl
               - qcom,sm6115-dsi-ctrl
+              - qcom,sm6350-dsi-ctrl
               - qcom,sm8150-dsi-ctrl
               - qcom,sm8250-dsi-ctrl
               - qcom,sm8350-dsi-ctrl
@@ -286,6 +287,7 @@ allOf:
           contains:
             enum:
               - qcom,msm8998-dsi-ctrl
+              - qcom,sm6350-dsi-ctrl
     then:
       properties:
         clocks:
-- 
2.39.1

