Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C847568BBC
	for <lists+freedreno@lfdr.de>; Wed,  6 Jul 2022 16:52:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6058810FB24;
	Wed,  6 Jul 2022 14:52:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBCE210F99C
 for <freedreno@lists.freedesktop.org>; Wed,  6 Jul 2022 14:52:26 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id y18so7907700ljj.6
 for <freedreno@lists.freedesktop.org>; Wed, 06 Jul 2022 07:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8RbT729/NK/J3aZcEME2h8k43LmZZ+ZCamZPbQqvBkw=;
 b=hkNxFhxVPmr2OSV43R7kX0VItWyrk0s/R5UB8rc1B5Jmj4ElrbJlMF1PQjdzDmPI1e
 RsExrvVhLLbi1DG+c2XxN3OEXh5gQSaLYWzIxwP6vLEriJnrDiLGdw+yXk4mbxw01Ya2
 2jLmYEN26Bl3rb1CfBoPIHZFCaOhRNMIV2PKpwz7sJBbFh7NMt4obsJtT+swham02g3j
 bkc4IPEDXlG8vIHsSW8ZZLkryGHrZAhU5g+B9uWIGcld+3xyLLCA2PIxe7xcrEQBrLOl
 2yC5ARRh3mruQ3lz2BirmBpTXBkM9Ziw89Z3rnAKaqA4YjBRv0hkVu/OYXXPrcL51hbK
 W/dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8RbT729/NK/J3aZcEME2h8k43LmZZ+ZCamZPbQqvBkw=;
 b=uaHhL06FCjZJHLucDmyGI+cFVjGbW8d4YUHUHKohBSfr+YWDIUOoVQW2dOtgA1oDYM
 JwgB9fJBK4Z7QXYPvS0tiwvmsdEXqCuDIB2f7d6Gmz8ma+SndFE7A/C7xPEsDZ6GFWJI
 WzBQRKey/XtkbosAuyv8RfWJVs3AN3bf0z3TrzWc+LYr4lQy4I5kX9uncHmQdZwhIilM
 1/7HYc/vaMtWRbqhQj+Jumzy265s7K3vFCLVsTglVaKIDqJ8pwz2z4hzr90MKV1Xyj89
 wPJveY34tRv6/nrf4Q1rwSLf30L42P33LRyjkzLhCLUFVi1mv5eiXd3L05d64uw4v2gO
 NKNw==
X-Gm-Message-State: AJIora+mqwBGP3zRaGJjDu7XDjtI6SHdda0SeD87PCqdKcedFwgGZIoh
 KiP+1ZHkS9cVicnSYSImBZAE0Q==
X-Google-Smtp-Source: AGRyM1vqFw7qQvdl0zt0pIdJF37OotKd8BH1Pqwi8aIWe4/HT+CDDVwuOttF8QA5UYJQHTVPRGS63w==
X-Received: by 2002:a05:651c:4d0:b0:25b:b6f4:ae2d with SMTP id
 e16-20020a05651c04d000b0025bb6f4ae2dmr23587703lji.472.1657119145197; 
 Wed, 06 Jul 2022 07:52:25 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 v25-20020a056512049900b004855e979abcsm556617lfq.99.2022.07.06.07.52.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 07:52:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Wed,  6 Jul 2022 17:52:19 +0300
Message-Id: <20220706145222.1565238-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220706145222.1565238-1-dmitry.baryshkov@linaro.org>
References: <20220706145222.1565238-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 1/4] dt-bindings: display/msm/gpu: allow
 specifying several IOMMU nodes
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Different platforms require different amounts of IOMMUs. The APQ8064
uses 64 IOMMU instances for GPU, adjust the schema accordingly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 3397bc31d087..346aabdccf7b 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -58,7 +58,8 @@ properties:
       - const: ocmem
 
   iommus:
-    maxItems: 1
+    minItems: 1
+    maxItems: 64
 
   sram:
     $ref: /schemas/types.yaml#/definitions/phandle-array
-- 
2.35.1

