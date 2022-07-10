Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 455F656CE4D
	for <lists+freedreno@lfdr.de>; Sun, 10 Jul 2022 11:01:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69502113D0B;
	Sun, 10 Jul 2022 09:00:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36AD7113B08
 for <freedreno@lists.freedesktop.org>; Sun, 10 Jul 2022 09:00:51 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id o12so446894ljc.3
 for <freedreno@lists.freedesktop.org>; Sun, 10 Jul 2022 02:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r8uP7epyJQsP5rWLMlZPU+2WIXogmdHgKsCg4a6KbsQ=;
 b=kKvMJpP/ZP5JytTzFf0NPpp8SzSAfBXi7jIqa8Hk+QV/PNSoE+sayfQtZTrEoBYI7g
 zh1795kR7Ag0oYToA8bVBDV63ZDa25O2kr9/slwZOiuq3YVXmZnE/XueoDzXzCK25KC8
 Ja9SHBSKnWtTnKsOHT4hLR5PRhPv1Wili1yg9pfLS0xpOjl2Dy+E7PKoRY6X15LptQAw
 xj9XJmWz98sTcxxSvIAzoSpOutu1J1Usqjf4PzUq9yKQokTadq+1+S/qQPk2/Ru9c6+T
 bKflirilmwVHMJuW/U5LaoJce+IUl9y+PkbmTIIogjjRUJ3NO/aS0mjooKx7edaIv1I7
 9ipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r8uP7epyJQsP5rWLMlZPU+2WIXogmdHgKsCg4a6KbsQ=;
 b=oMMTlmBjbv6lawFw/O6V/WHpY87wnXuxJx/B0Ys0GIFS80Tyy0rCbMViWN7lIwVZpj
 8XV+WRafZVMcuaMJUYlQKhPoxHBOFqDwOEkJoF82vy5n5X7RSEEinW/uq40Ru0jZyP0I
 7kM+Qc5KJGzGsRYV9k60aadB+B8Oo7+c9gVs8vTmX5LasCGl3P1AjWKw4nZP1oTeHToL
 GaJ8ubJHXP9PxFjxCvnRdHPROICVqf1enBzBxtS+U+AbKkJ3uyPlxtovhNMpYyufHxBR
 cBtyBXSj4Jvd9R63gb/T6ZF3GZ9s4ICTipPvJneS2GOKaZR3ophfH+FOYYtKBOOuDqEt
 icxA==
X-Gm-Message-State: AJIora+RJxPGY0zJIvOncXGorWRRKoixS4Y/j9pXJL4a3av4cTuPeq4i
 s14mS1kDMZRrzvt8GIHjnHAxHQ==
X-Google-Smtp-Source: AGRyM1tRRC56ermrH8sFgyeA0GHovNm/nUTSJV/sXXfkIPvFNvOYIpxVOLE4kCIzUkymapoQz2jyjg==
X-Received: by 2002:a2e:82cf:0:b0:25d:490f:4035 with SMTP id
 n15-20020a2e82cf000000b0025d490f4035mr7391229ljh.290.1657443649443; 
 Sun, 10 Jul 2022 02:00:49 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 u16-20020a056512095000b004896b58f2fasm822881lft.270.2022.07.10.02.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jul 2022 02:00:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Sun, 10 Jul 2022 12:00:39 +0300
Message-Id: <20220710090040.35193-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
References: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 10/11] dt-bindings: display/mdm: add gcc-bus
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add gcc-bus clock required for the SDM845 DPU device tree node. This
change was made in the commit 111c52854102 ("arm64: dts: qcom: sdm845:
move bus clock to mdp node for sdm845 target"), but was not reflected in
the schema.

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

