Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5175B9C0A
	for <lists+freedreno@lfdr.de>; Thu, 15 Sep 2022 15:38:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8494010EB2C;
	Thu, 15 Sep 2022 13:37:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C41810EB20
 for <freedreno@lists.freedesktop.org>; Thu, 15 Sep 2022 13:37:48 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id p5so22242245ljc.13
 for <freedreno@lists.freedesktop.org>; Thu, 15 Sep 2022 06:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=QnLPNe+iKM00cshOq1HEgR2lwUHyezV+b5qRTjwgLIw=;
 b=tV6z3grq1vzzmNrhOtUiZd9uwgE0I0J/+LPx/Z46mh1AZc0+yRFiy1ygnMIZIgDSWb
 MGI1/mq77N56Agc5mhTYWGuoGDcRivTEujMPmAHOvh1DjROrIyAAZ4us5ZY3r2TDCzn2
 tIsGG4jm31Js6rpS2CO5h0CwaagM/BUg1ZCKWXG06VnmwSwEfmzGF7MhG02CTS/Ns9bL
 2WyvryUvChMZJ5L9OCQ4L4uMkTs6GxIU1XSOUoPoLD+rVTVq3vC4b6uguJAIWszqbreG
 QHCQ4mQ7uM74Zn8VcEUv/IuZj5fK+l5oj6rMXeSBdwb1QcT7EIttJIfXUeRv0G2NkNrM
 Z2GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=QnLPNe+iKM00cshOq1HEgR2lwUHyezV+b5qRTjwgLIw=;
 b=xryB0KHQcFapv3Z/bgIeIg0/rRas6YbxqRvpBOACPAks+gSfJjMiIAMtOlocnkwcXA
 oydXjCscMrSgWloltdqRbUvw+QsYNr1KpWbMpqRdSZ6cfJebQLMHAAAO0Aou6vS8RokI
 IZvuUT0tuNknH0+8qB366lszbFhNUDl1OhPYmR0pBO/esLXyq1tSNUIfycU67fVsHPkI
 qGjj/UhSShlbz+oIiUUm4Rhp8MaXU19iY9wFVBYJj8I5IZKWeP1FDsGhAm1L1WoDJZ0K
 SGfWCR3LLpMQFerko9m5uKIZ83z4JvOlx2Jp7lfpImb6BK7sh9B7E0oiPq+/Ifc5FVDt
 EMHg==
X-Gm-Message-State: ACrzQf05YDpJiUe/LpHX4Ksb6H3BdeRUiA30RQJAhps0uO2qXwDF5poX
 IiYrj5L1Am3nOIssYonzhu5PjA==
X-Google-Smtp-Source: AMsMyM4UD05VNVSpuNUyec7dDFdrKjwlOjPBwXubUGJVv/SN05yO8Ib1mfwD0wEoOmZeTs5yvTV8LQ==
X-Received: by 2002:a2e:a589:0:b0:26c:2a8a:4179 with SMTP id
 m9-20020a2ea589000000b0026c2a8a4179mr2013169ljp.288.1663249065931; 
 Thu, 15 Sep 2022 06:37:45 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 2-20020a2e0902000000b0026ad753448fsm3142634ljj.85.2022.09.15.06.37.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 06:37:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Thu, 15 Sep 2022 16:37:33 +0300
Message-Id: <20220915133742.115218-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220915133742.115218-1-dmitry.baryshkov@linaro.org>
References: <20220915133742.115218-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v7 03/12] dt-bindings: display/msm: add
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
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add interconnects required for the SDM845 MDSS device tree node. This
change was made in the commit c8c61c09e38b ("arm64: dts: qcom: sdm845:
Add interconnects property for display"), but was not reflected in the
schema.

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

