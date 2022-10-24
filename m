Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0C760B20A
	for <lists+freedreno@lfdr.de>; Mon, 24 Oct 2022 18:42:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCB5010E450;
	Mon, 24 Oct 2022 16:42:35 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B214010E470
 for <freedreno@lists.freedesktop.org>; Mon, 24 Oct 2022 16:42:30 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id r12so1435070lfp.1
 for <freedreno@lists.freedesktop.org>; Mon, 24 Oct 2022 09:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2rC5Rchk8Av3pvvEimOqZHjNpVOqnGT2anEFSOvGN64=;
 b=QDZDSBW5anamlQS8GPZPxxzWcygPwO2VSgV3gBG9Z0ZJr5rKWNvdIP8qEdqNANCTD4
 i2NFLMFUHC/GOw/12mTQMMy+lzf2lsdPf9o4g0820J7qi04eyf1jMZl8Z6RwnMgVXtQT
 xx4P+L50dU7Wy1hzT3eaWuj7UrX4/m17z0m613Mugj+Wtd0mVCTQZirwrKCUZjDqZdzm
 jPOrrwmXI+dqMQMyaVQvMbMNZVcxN3BHlLuxiQmxMn0KHvha6K8wNrci7jxyAAymBkED
 Q/jeiiNi4kwh6aR0TKu1QJ8B6kXbth8BODvdqBwgzfGAe6GOiUnGwSUm+JZNPo182vrh
 T3lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2rC5Rchk8Av3pvvEimOqZHjNpVOqnGT2anEFSOvGN64=;
 b=gPOBKwRltoCe4gmF7sqrjW1qaFQ4VjCHlKnECok65OcHSoWeQbMZ8bErP6iW2tZbiW
 4HhQAOfbsVzS/pAFXSfHI8P4BM12Ut2uz+v4RM7MGyQ4mjk3qDZsPBSTucUsIGeLveRg
 lu3ybd4fDmd3jXIybofzweiK1kMV9KItmM6yL8gkX634xd2wyrjitdGajA4NmhHWHyrE
 n+cup6s3Hl8XtmekfErpnyc3RDKtqSyS9GU2T3u6WlcZowzgTVt5G9uMoFymmK2jbsco
 zLFm61zpafx0ZB+h2bKTbpbnlf9YPYDRqAgL7aF3RIY+iFXAekX5W+Weq2kH/PWVJUEK
 buVQ==
X-Gm-Message-State: ACrzQf3I9ngYT1ADcm0Y8Re6Feu5Ar35Hp5upiIDpeBSMxc42/oC8oxN
 bCE8bX+H7c1YaEw4w206wGUu1g==
X-Google-Smtp-Source: AMsMyM4wlpbgXydVg//p39YiLJv0ozNQ9bid8NqJHFnhVklpcpHnZ//ofwjtv7I+1UMzDD/wusMVTw==
X-Received: by 2002:a05:6512:3053:b0:4a2:6b9c:a853 with SMTP id
 b19-20020a056512305300b004a26b9ca853mr11679525lfb.666.1666629748475; 
 Mon, 24 Oct 2022 09:42:28 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 k14-20020ac2456e000000b004948378080csm4593978lfm.290.2022.10.24.09.42.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 09:42:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Mon, 24 Oct 2022 19:42:15 +0300
Message-Id: <20221024164225.3236654-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221024164225.3236654-1-dmitry.baryshkov@linaro.org>
References: <20221024164225.3236654-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v9 02/12] dt-bindings: display/msm: add gcc-bus
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
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>
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

