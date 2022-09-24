Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A155E8C81
	for <lists+freedreno@lfdr.de>; Sat, 24 Sep 2022 14:36:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EFB910EBF6;
	Sat, 24 Sep 2022 12:36:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE1E810EBF6
 for <freedreno@lists.freedesktop.org>; Sat, 24 Sep 2022 12:36:17 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id h3so2799406lja.1
 for <freedreno@lists.freedesktop.org>; Sat, 24 Sep 2022 05:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=+VYxtSYA5OyiLl7gExkakIULMtqhutc086nOHC83lPk=;
 b=Pk42gobi31Pm88gcWY0dliXVdoXZB1oWlCvEO8Nz4ebyNe4xlnzz4xgJ+0I/DrrVZK
 4P5L+rY4aP24dF7TFUvHDbH/cNECmIkbpy5vPFLttoTVEEOwvAo6eLvM/s1HTa/Fl96S
 2A7Bx0K5/XWZr19eYlE9tM0NjLcvBKdUz1rur+l3EpccsCsHjvEYG0ZYflsul1sk20iA
 S5hNnxBIXJsfZNFPmKlwxrdGCo92MBP5VOwdX7p/95L9WIsRPj5nD56BX5BGUeijlEDn
 ZyzXOutODty+Y2E2zTPEfRZHy080nsIVrXa6L57aXmtw4cg2dd8Pd4EFbaiqim13T+ds
 5hLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=+VYxtSYA5OyiLl7gExkakIULMtqhutc086nOHC83lPk=;
 b=1BxMx1ewHclI1Hbw5093z/d+1huDXktxr0OMClazVOJNZgYdtmvpomstENA9PqiBc6
 E2kwco5fRW2LXxT+2F6ZhTZXLi/vR1R0ZiAdnpVurwlu8zcsILdSRudfvZAT95aq7gvo
 xLWXxhVDvtYhD1Cit8a3qiysqCXViG/DLAR1O3AOm7qjLHD8SG4eENg7D3MLASiylf8u
 MMLfYAu+SfKQLGdeby/URyCJNLSo242tgHep2X3umlSVYoOKZL9XOzLR6gB/jhDagXJa
 7lSH7BuxO5NHZsXqauxca0KtXL3blFg2N/Bnfndt4wA9z3yXftoFufQPZx6kiZsn69+H
 r9CA==
X-Gm-Message-State: ACrzQf1mbQEkPCoh5TkkqHBrhf9vq6wVR5IlODIGESvLbyv/TnvzEYxK
 gAr8BmpABEwn1YwHYmIsnq5ONA==
X-Google-Smtp-Source: AMsMyM51NES3RCACwNbkEyT0lYAlozhLRWFpnLns2BDFA5C0F1f9eA/hhnH/8ncrW25blwnsjWzGMA==
X-Received: by 2002:a2e:bc28:0:b0:26b:d979:fc72 with SMTP id
 b40-20020a2ebc28000000b0026bd979fc72mr4757161ljf.292.1664022975566; 
 Sat, 24 Sep 2022 05:36:15 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 u18-20020a2eb812000000b0026c4113c160sm1707269ljo.109.2022.09.24.05.36.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Sep 2022 05:36:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Sat, 24 Sep 2022 15:36:02 +0300
Message-Id: <20220924123611.225520-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220924123611.225520-1-dmitry.baryshkov@linaro.org>
References: <20220924123611.225520-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v8 03/12] dt-bindings: display/msm: add
 interconnects property to qcom, mdss-smd845
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
 Stephen Boyd <swboyd@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add interconnects required for the SDM845 MDSS device tree node. This
change was made in the commit c8c61c09e38b ("arm64: dts: qcom: sdm845:
Add interconnects property for display"), but was not reflected in the
schema.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/msm/dpu-sdm845.yaml    | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
index 3cb2ae336996..a87deea8e9bc 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
@@ -57,6 +57,16 @@ properties:
 
   ranges: true
 
+  interconnects:
+    items:
+      - description: Interconnect path from mdp0 port to the data bus
+      - description: Interconnect path from mdp1 port to the data bus
+
+  interconnect-names:
+    items:
+      - const: mdp0-mem
+      - const: mdp1-mem
+
   resets:
     items:
       - description: MDSS_CORE reset
-- 
2.35.1

