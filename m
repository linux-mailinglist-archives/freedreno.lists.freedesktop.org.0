Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AB6544BDD
	for <lists+freedreno@lfdr.de>; Thu,  9 Jun 2022 14:24:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CA6711BEBC;
	Thu,  9 Jun 2022 12:24:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DB8A11BE65
 for <freedreno@lists.freedesktop.org>; Thu,  9 Jun 2022 12:23:56 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id u23so37741485lfc.1
 for <freedreno@lists.freedesktop.org>; Thu, 09 Jun 2022 05:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EY69blhAfLwlzhpt3ykQvo28dBBPjots5a/LOCelKuM=;
 b=IjpDkqE/seTW6CIHsQ7Hfj04A0JuPKLtjnMjErJkpXYhl3WM7UKcxD0rkphldo8FZC
 Mt4ewdaEMkw0E16QV2L9dZFqPbtQA33ZlEvTfYhrCm9TuHTYZjC6A9Rwby1HFvcu2Q31
 OBEQkbqwpslCgU5lAnkn/2YDYmtsefhglKT72IebkRpVx9KaHI2rGrRIFYginXZUm8ET
 1L170gjwFR5mP4d5WCrlSlsuPeCLhPtT/3RF/E/oK1/wndCGVc5TLkKNS1FsNWvZJh70
 jmZey/NNpZY0X/F4Bmbc7/vjsTjnbiHMzqcX7YXKU78liLB6/BOcSFOprVkZeQiOYJjo
 bKbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EY69blhAfLwlzhpt3ykQvo28dBBPjots5a/LOCelKuM=;
 b=lZFv7dwF14HtkUy1IBOssF28Exm/XnGCRLNV3h8fgO9IUolDZu4tHg+q+kYJVL7QvA
 YDHIXLR9+L8oie1z5xvR5KzV0o1Uxv3sW926V84/HDJFB0PdKApn3mRra5vKhmqCLYVI
 aZD8IqhbiwT08LBj4GS/kQR0hSsHqrUTYl9u3T9TLmecBBNILo+UsORPV/4JbF5I5Uue
 6uPSBov/2w8akAVbdQGt8Z26f9jtVzYuYNZ5lEUPBMmmR0W/fsDArQPOJTXDNAqI1/sr
 yqut01P0SJYMxumPCNeftPXTEyhbGH1qJSkRK06OctEmPKOjN+a8biSPyBlwmfPOWFB8
 m8lQ==
X-Gm-Message-State: AOAM5323QZ1KyLycUi00YyMICrtXIZtr1w/jl1HJmkWdqDY8NMoqiP5s
 13cC+t+K3elJaHjhgeuP3bUQwg==
X-Google-Smtp-Source: ABdhPJzyp0Hfr5XdSnJVDwteMfnRMn7T+LClAtbpwVJRURvWT0U8/5q5O/b5BG1sUgsG0uwrLVVaUA==
X-Received: by 2002:ac2:5bdd:0:b0:47c:bea8:f254 with SMTP id
 u29-20020ac25bdd000000b0047cbea8f254mr1682585lfn.407.1654777434599; 
 Thu, 09 Jun 2022 05:23:54 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 f11-20020a056512360b00b0047daa133decsm32421lfs.166.2022.06.09.05.23.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 05:23:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Thu,  9 Jun 2022 15:23:39 +0300
Message-Id: <20220609122350.3157529-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220609122350.3157529-1-dmitry.baryshkov@linaro.org>
References: <20220609122350.3157529-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 03/14] dt-bindings: display/msm: hdmi: mark
 hdmi-mux-supply as deprecated
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

hdmi-mux-supply is not used by the SoC's HDMI block, it is thought to
power up the external logic. Thus it should not be a part of HDMI
bindings, but it should be declared at some other device in the DT (like
HDMI mux, bridge, etc). Mark it as deprecated.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/hdmi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/hdmi.yaml b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
index 99b07abcd960..47e97669821c 100644
--- a/Documentation/devicetree/bindings/display/msm/hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
@@ -56,6 +56,7 @@ properties:
 
   hdmi-mux-supply:
     description: phandle to mux regulator
+    deprecated: true
 
   core-vcc-supply:
     description: phandle to VCC supply regulator
-- 
2.35.1

