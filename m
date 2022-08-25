Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7139A5A0D30
	for <lists+freedreno@lfdr.de>; Thu, 25 Aug 2022 11:51:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD4811ABE8;
	Thu, 25 Aug 2022 09:51:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 074371133C9
 for <freedreno@lists.freedesktop.org>; Thu, 25 Aug 2022 09:51:12 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id l1so26967847lfk.8
 for <freedreno@lists.freedesktop.org>; Thu, 25 Aug 2022 02:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=b0csbqWjuX0z1ouVyH85kpMRal2rBTuFqDlpM2dtaGs=;
 b=eNCIILDIJzua2xb3HJ/jtB91lR7e4w0zBqPlbkTItj1VqOdfvGDP4RPXgxztpdSeLK
 OFEeze1xWYIfqA8D91PkGqTvSZEoQkvo1XRjtGmnSV8/IuFIzc/+TnCqVeZozvNLM7Tq
 MfyMN2N4r2aBliR4GI76ByROek6aAU6rI8CaEHBiVOiZVnNF+86sH5tiJ0cLgldwXQ8g
 PVLYaNr9sJpPR6Q8LKHBdPY7XkBWEY/3bLbfZtjw6luo6cZjLxrtBy/1SvIZmFcmCS/i
 50g2sq2PZ8kNk1q2UR49VJKb8spoBHcR2iFL0VojSuheoOoTdEu1aZHHKX1Pt9fAL/UW
 9ycA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=b0csbqWjuX0z1ouVyH85kpMRal2rBTuFqDlpM2dtaGs=;
 b=rZmZNwIpJiNN29Q+cyGUO3uHYs+gzAl2ypiAL7W9TnkxGl4+Eediflr12wSN4REVL/
 ssw2KiVKsC3yDvQgrXFJXXzceVTLalB/4fOcS1zRlamDomOAgze51Hl/sFbH+AmnEv5y
 pmyNpsQ2+Imj10MyowjCg4Gz8+QpMkjipYxvgTqyUCDyi8MhcyknD+OjHYJxvpO+3Ea9
 sFnjCJdenxoFMcGf1YK5aqJpw2/cKgAOdg4Hz2x/A2hElbGaOirigd0vTEXOrsIzV1/J
 LFveyphDcOQ4U5BbNazkEpICRl8MyCvO7QJlm1xXS0MZ543dpdu7kqHwOfgkYEuIDbOX
 bCVw==
X-Gm-Message-State: ACgBeo0Omx4yewsUohWHJYqwe7xhnrM1owhpGwUYmwcWL1Lt+9VWXQZr
 VoTfRaoAcHSssjZYQgHMv7KjWA==
X-Google-Smtp-Source: AA6agR5FxI3LjNhtKaRXTDtQoJj06JpTJUkI9fx15d6tYKnc1zDcxDgsSF79bDFFEOtFgJHx+28sSg==
X-Received: by 2002:a05:6512:1101:b0:492:da22:bc58 with SMTP id
 l1-20020a056512110100b00492da22bc58mr959116lfg.219.1661421071551; 
 Thu, 25 Aug 2022 02:51:11 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 h10-20020a056512220a00b00492cfecf1c0sm398502lfu.245.2022.08.25.02.51.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 02:51:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Thu, 25 Aug 2022 12:51:00 +0300
Message-Id: <20220825095103.624891-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220825095103.624891-1-dmitry.baryshkov@linaro.org>
References: <20220825095103.624891-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 07/10] dt-bindings: display/mdm: add gcc-bus
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

