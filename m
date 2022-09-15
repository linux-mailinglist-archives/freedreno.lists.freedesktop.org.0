Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0C65B9C03
	for <lists+freedreno@lfdr.de>; Thu, 15 Sep 2022 15:38:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A15B10EB24;
	Thu, 15 Sep 2022 13:37:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AEBB10EB2A
 for <freedreno@lists.freedesktop.org>; Thu, 15 Sep 2022 13:37:47 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id i26so30399751lfp.11
 for <freedreno@lists.freedesktop.org>; Thu, 15 Sep 2022 06:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=2rC5Rchk8Av3pvvEimOqZHjNpVOqnGT2anEFSOvGN64=;
 b=IKP/mIBhN/OvoJh22Pux9rpkgDo2Br5ejssgu6BY7UZvH8vz4gl06Wt434iXnPt9Z8
 K6mvF2xXJSMr2h6+1omsJN/ndmTgCprt1tggK5ZHa+NTv+E9WaS4d+6sNIIq/GT7Eydi
 /m2i/HthmD+ES/SUqiP8SP3ljhBeZDgeRSvtFoXaowYn4bYFJikm62Ag2rrrJZw1UZgj
 CxwDJlWrBY7ifE5rEz7jvR7QnoGMIxes5ovd01MG9iw88YxYZyF6UfYm2HB6KyDnH3WC
 8VFfAVFUZxkwCgHDipkkteSi4lN5o+Uls/5G53hlwAVXoJNadbqkZ2lBwso5wwnk2d9+
 5rDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=2rC5Rchk8Av3pvvEimOqZHjNpVOqnGT2anEFSOvGN64=;
 b=zsA4+ASsc1nKMue7MKkRe6i3NfI4BzmoJRniywWcJ4784tpLGIFwxmmiC6VzGxRjfQ
 H1mrECZh12hQ4r06JLZCdlf/jkTZZkObRSwGMQkXJPHX5vZewX1WCuv37ENjA3Y6aLJj
 gZFT4Yj5H576Nj8xAQyhU2z6Wzph0oMenwyuw0riLEqAj+wpwl2XibXqLCRNtxq7wG35
 1qhhmc3v3fpbAMlHJ3f2Gn+OVMnb6KPZAdIXjerQtG3EK0dLqqc2enAATa3vRb4aDGOD
 bRKRqDWejpFid8Re3S9TYPeaI/nWQTltZ2rw2V0rNijTFAvfrlTrque7ziNvcIgYSeE8
 JY7g==
X-Gm-Message-State: ACgBeo3XDYCX88lci1mvwBkTF1Jo9XAAfCzWmB1NAs4lBH5emhefrHmP
 bMrMhzpkS06P/QJpwOAjKFe+Xw==
X-Google-Smtp-Source: AA6agR4Osl+CBl9CveKLxgRn7EUt0C6TM2YD+qTGpMXLBbPcTjuyLbj+xXJrCGodRMXTJmXjRKu7iw==
X-Received: by 2002:ac2:4bd0:0:b0:497:abfd:3572 with SMTP id
 o16-20020ac24bd0000000b00497abfd3572mr12099024lfq.200.1663249064985; 
 Thu, 15 Sep 2022 06:37:44 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 2-20020a2e0902000000b0026ad753448fsm3142634ljj.85.2022.09.15.06.37.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 06:37:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Thu, 15 Sep 2022 16:37:32 +0300
Message-Id: <20220915133742.115218-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220915133742.115218-1-dmitry.baryshkov@linaro.org>
References: <20220915133742.115218-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v7 02/12] dt-bindings: display/msm: add gcc-bus
 clock to dpu-smd845
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add gcc-bus clock required for the SDM845 DPU device tree node. This
change was made in the commit 111c52854102 ("arm64: dts: qcom: sdm845:
move bus clock to mdp node for sdm845 target"), but was not reflected in
the schema.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/msm/dpu-sdm845.yaml        | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
index 7d1037373175..3cb2ae336996 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
@@ -84,6 +84,7 @@ patternProperties:
 
       clocks:
         items:
+          - description: Display GCC bus clock
           - description: Display ahb clock
           - description: Display axi clock
           - description: Display core clock
@@ -91,6 +92,7 @@ patternProperties:
 
       clock-names:
         items:
+          - const: gcc-bus
           - const: iface
           - const: bus
           - const: core
@@ -183,11 +185,12 @@ examples:
                           <0x0aeb0000 0x2008>;
                     reg-names = "mdp", "vbif";
 
-                    clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                    clocks = <&gcc GCC_DISP_AXI_CLK>,
+                             <&dispcc DISP_CC_MDSS_AHB_CLK>,
                              <&dispcc DISP_CC_MDSS_AXI_CLK>,
                              <&dispcc DISP_CC_MDSS_MDP_CLK>,
                              <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
-                    clock-names = "iface", "bus", "core", "vsync";
+                    clock-names = "gcc-bus", "iface", "bus", "core", "vsync";
 
                     interrupt-parent = <&mdss>;
                     interrupts = <0>;
-- 
2.35.1

