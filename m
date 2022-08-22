Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA1F59C9DE
	for <lists+freedreno@lfdr.de>; Mon, 22 Aug 2022 22:18:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFF69A1A74;
	Mon, 22 Aug 2022 20:18:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFF29A1A43
 for <freedreno@lists.freedesktop.org>; Mon, 22 Aug 2022 20:18:18 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id q7so13153390lfu.5
 for <freedreno@lists.freedesktop.org>; Mon, 22 Aug 2022 13:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=b0csbqWjuX0z1ouVyH85kpMRal2rBTuFqDlpM2dtaGs=;
 b=RHkeOH/N8akKNzr5gPA24Je9viNjwBNlXDv55rzedGRjiMavLWCWofoMhLB49bN82+
 1PQU+/3Zwdsh5Vv65WlZAcp7VJGGai8hcLK1JPOb/jyZtlfctUch/8yDEDG1QiQPqLGA
 tQX6F8vNX8f9hCGtGXiBBiqUINhD0iAhcqoUvB0BCuZwVTnuB2GRqam3MNjLNpuib6SH
 HIgsSvTYbMhIHQqxRTjV4EJRcqUn++7ISlBJpiyHDIkd6NplmjGIKdqYxWPj1zLEIUho
 K15DViPkBTBFdHTcP8gX91xjRqlHBTC51h2N+oqKB+HO9cqYSLZXM3hzeJCHGj091o7A
 8laA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=b0csbqWjuX0z1ouVyH85kpMRal2rBTuFqDlpM2dtaGs=;
 b=S2VEl5lD7IhYT3R2acLWe8o0ZrnORAsyy2ELcOqBOOUq7wZ1FCnJoR+QUlVlzYzf6R
 HIiC5Se8Ag7D8tG1owxUMX1bBeK4AH8dJ8Ph/vwLBEVXEFb5djQc45leia4njBQlMrg7
 GRMUy8LIj2lUsFkcXoXeeERVyMX2nm4gREUFDVGYkdwjGaIVyJzrFVfi/VJV/wTuaimg
 m2cunSMZUhmLZ1/c0SmbQUs54Dym91pwQyj2OmRk+Enrwfr5jtx4UYSKckQFxGsx/rj9
 NGLueTCxVNSGUFWhtji97n1DZ4fK3PvZJ3xHbgBhPivaBb+MW+/peKRGu7B/YcQpPw+c
 /beQ==
X-Gm-Message-State: ACgBeo0saJf/qYHd6bO9Mjo/fRc99vurhOjrVSP+WNFJeQ9aae4UDGUn
 9whoYS24iEDCI3qK/smjiRJOXg==
X-Google-Smtp-Source: AA6agR68PJLvmGpy9/so9cyjZeepliYHidSqKXbaWXAiZpKWlnOVUiWZYg2lkmplE2B5xZd4BztLsA==
X-Received: by 2002:a19:5e01:0:b0:492:c03a:aa8e with SMTP id
 s1-20020a195e01000000b00492c03aaa8emr7659198lfb.139.1661199497047; 
 Mon, 22 Aug 2022 13:18:17 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 h16-20020a2e5310000000b0025e5cd1620fsm2000429ljb.57.2022.08.22.13.18.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 13:18:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Mon, 22 Aug 2022 23:18:06 +0300
Message-Id: <20220822201808.347783-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220822201808.347783-1-dmitry.baryshkov@linaro.org>
References: <20220822201808.347783-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 7/9] dt-bindings: display/mdm: add gcc-bus
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
index 2074e954372f..42ff85e80f45 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
@@ -29,6 +29,7 @@ properties:
 
   clocks:
     items:
+      - description: Display GCC bus clock
       - description: Display ahb clock
       - description: Display axi clock
       - description: Display core clock
@@ -36,6 +37,7 @@ properties:
 
   clock-names:
     items:
+      - const: gcc-bus
       - const: iface
       - const: bus
       - const: core
@@ -114,11 +116,12 @@ examples:
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

