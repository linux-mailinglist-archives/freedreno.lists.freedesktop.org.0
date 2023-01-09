Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D01661E36
	for <lists+freedreno@lfdr.de>; Mon,  9 Jan 2023 06:14:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 253C510E273;
	Mon,  9 Jan 2023 05:14:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B1B910E02E
 for <freedreno@lists.freedesktop.org>; Mon,  9 Jan 2023 05:14:05 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id f34so11242604lfv.10
 for <freedreno@lists.freedesktop.org>; Sun, 08 Jan 2023 21:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=frGsD/U3T8SDUQuobb0ngHDLYJCFfGHMt+azRt7XMrg=;
 b=CE9nKNLaE5wnGtR/t1d58awzkiYYz+xKLQ+8aEtYlS9wQH1vGZTKZDGiFh+fqnExf7
 P+WJtDuEJHJH80cOyWdXMkMLEDqRFT/j0AuqXSYKjGX2PRC8JBK4hqoCLZuSkEcbexJ/
 JaS7WmuEfRGNJPyKjY6YX5qPllrqo6xds51s/D5QI9YdfAIFh79bQLV8+DMYO3Ccnyst
 MeR91lnlPsPtv3LTClyU+e+czjryRnKpX/YIR3LdHaQEtRzYD174JmDmEdH4w7tWWByL
 eUwUxD99VLlWfUVvuV9KEqttu+wQIhLD3PqXeM6M2iapVnjdT3W7aYM4hUpHzCmetTWx
 H9YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=frGsD/U3T8SDUQuobb0ngHDLYJCFfGHMt+azRt7XMrg=;
 b=6rAm5PA8RDYq2ISnoC+gzQ6mwmod94sVQK5CDceE4dWRjv9DF9LLZXyyGQmwwzHT23
 LoFQF9pBXYJiumj75ZJkNBv0jsazdct4ISmF/89Xttftpwv5tKm34uqtsaBtGSDwodKY
 +vCtNnQZFBLgfdSasNSFBouF6IleRRJrB/oud9tVR1MvCDwcFhRrgzO7n3E4EgHQhOvQ
 qp3+x99mPNDazfgybTWq2cotJF06h/D2wTk9U6kWRfWWKdNU9dWnq4cLAdsG8BDeYxxq
 njNPR4phgr1NU6+MDkM0a6kPBtKKUu7gW1zsAuAUiqOzTUPFpG18z+wbpS8ogkUUt57w
 QTDA==
X-Gm-Message-State: AFqh2kqEkFsCtav2fn3YiELoX19j/dFfxjsXtSwPlVw29YCxUIxSYe5u
 jVceO131c7YcF3DMxWu7FlJKwQ==
X-Google-Smtp-Source: AMrXdXtnCjMD5u5PYXTfWGp56VSnr8APOpEoohppOB/KTnfYBe/lILcOXtWt1FquP9UjvWbNR4jR/Q==
X-Received: by 2002:a05:6512:3e0e:b0:4a4:68b9:1a14 with SMTP id
 i14-20020a0565123e0e00b004a468b91a14mr21662849lfv.60.1673241243614; 
 Sun, 08 Jan 2023 21:14:03 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 w4-20020a19c504000000b004b5812207dbsm1426880lfe.201.2023.01.08.21.14.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 21:14:03 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Mon,  9 Jan 2023 07:13:57 +0200
Message-Id: <20230109051402.317577-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109051402.317577-1-dmitry.baryshkov@linaro.org>
References: <20230109051402.317577-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 1/6] dt-bindings: display/msm: rename mdss nodes
 to display-sybsystem
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

Follow the 'generic names' rule and rename mdss nodes to
display-subsystem.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/msm/mdss-common.yaml      | 8 ++++++++
 .../devicetree/bindings/display/msm/qcom,mdss.yaml        | 5 ++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
index 59f17ac898aa..ccd7d6417523 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
@@ -15,7 +15,15 @@ description:
   Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
   sub-blocks like DPU display controller, DSI and DP interfaces etc.
 
+# Do not select this by default, otherwise it is also selected for qcom,mdss
+# devices.
+select:
+  false
+
 properties:
+  $nodename:
+    pattern: "^display-subsystem@[0-9a-f]+$"
+
   reg:
     maxItems: 1
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
index c218c9172608..47fde9b6779f 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
@@ -15,6 +15,9 @@ description:
   encapsulates sub-blocks like MDP5, DSI, HDMI, eDP, etc.
 
 properties:
+  $nodename:
+    pattern: "^display-subsystem@[0-9a-f]+$"
+
   compatible:
     enum:
       - qcom,mdss
@@ -153,7 +156,7 @@ examples:
   - |
     #include <dt-bindings/clock/qcom,gcc-msm8916.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
-    mdss@1a00000 {
+    display-subsystem@1a00000 {
         compatible = "qcom,mdss";
         reg = <0x1a00000 0x1000>,
               <0x1ac8000 0x3000>;
-- 
2.39.0

