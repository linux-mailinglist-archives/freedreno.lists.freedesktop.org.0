Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 487B84E62C5
	for <lists+freedreno@lfdr.de>; Thu, 24 Mar 2022 12:55:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5D2A10E89A;
	Thu, 24 Mar 2022 11:55:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ADC510E899
 for <freedreno@lists.freedesktop.org>; Thu, 24 Mar 2022 11:55:41 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id p15so7602757lfk.8
 for <freedreno@lists.freedesktop.org>; Thu, 24 Mar 2022 04:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=32M7oTSyOKeaf1CysC1hida7B7hRSXqH2Qo2sPYMO9o=;
 b=GervhNkGgzo6q0SIVF78plM2Y7tJnDrD3UWvo6IdGmFUwiFJozGw27EoNeRo/f3+HI
 n/4DJ3MPpIcPbkvQW+C0OV3DCLB8M85KPtXukjgZ6HJ8fXGgdTnD9J6iS5kGWxORuR23
 gIkDlRjOOEK1JqYiu2fcBfzvH8EQPElPO7AT5SHLZNmktok0QtRjAp7gW1fPlQ2kio/7
 7zbazcfXqyNqHA/BIt3qUupCcfrxrtMSeNNG2Bv2klt06enaexI2WbZKnbmOZj+1Rz6d
 f8x3tUnp21vVvurAjGkZrAy+47V6dfKf4IXKGK7Y3p9e3yGXTkGD0G4fJUCJE+xtpMpL
 XXag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=32M7oTSyOKeaf1CysC1hida7B7hRSXqH2Qo2sPYMO9o=;
 b=TgCJBvnr1iiJRmJJ0Iru6MWUNCbJY7ynK9uIEehAlI12X5zzh+Xu7POWdTPycu/4pQ
 6sIRQqD8zzXoQsICbLkVkYd/sMMmzXBGAXs/sEfZaarqsYl6Cz0+PaX1eVXs9aReCnye
 u0P+8xLzca68pPgMFH5JX4S5p3DJsBkOH1tm75fa5gqIXWEHwQc8vjYDR2LLoeDaaD94
 yuURwA6QfzNPpYFGIs9rlfjkQmHPsbHBykSd+ZBzSHLfoFq6XcLr3z4aTF8PnPL5TB3G
 r1vK2skgg+QoUHMg11BOuAGndXaDGwOzZ/YJi1tK4C1lU7Ek7Twjowy743vg5716ecSC
 Kadg==
X-Gm-Message-State: AOAM530BvBxGeuH6fY46ijfdFMdKv+8jTihN+ELBUXKFxXK8k9uj72tx
 D+dPGO0ej+heP8m13eVjcTi2GQ==
X-Google-Smtp-Source: ABdhPJz4VOkKb9/awzSsxxP+26JXp48DHN5W+2ym/3IF32yD4FWcqh/X7ZVJA/dp3KMDu07/RRytVQ==
X-Received: by 2002:a05:6512:38ca:b0:448:28c4:88c8 with SMTP id
 p10-20020a05651238ca00b0044828c488c8mr3365486lft.327.1648122939611; 
 Thu, 24 Mar 2022 04:55:39 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 p8-20020a2ea408000000b00247e5087157sm305327ljn.101.2022.03.24.04.55.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Mar 2022 04:55:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Date: Thu, 24 Mar 2022 14:55:36 +0300
Message-Id: <20220324115536.2090818-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] dt-bindings: display/msm: another fix for the
 dpu-qcm2290 example
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
Cc: devicetree@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>,
 Rob Herring <robh@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Make dpu-qcm2290 example really follow the defined schema:
- Drop qcom,mdss compatible. It's only used for MDP5 devices.
- Change display controller name to display-controller as specified in
  the yaml

Reported-by: Rob Herring <robh@kernel.org>
Cc: Loic Poulain <loic.poulain@linaro.org>
Fixes: 164f69d9d45a ("dt-bindings: msm: disp: add yaml schemas for QCM2290 DPU bindings")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/msm/dpu-qcm2290.yaml          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
index d31483a78eab..6fb7e321f011 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
@@ -160,7 +160,7 @@ examples:
     mdss: mdss@5e00000 {
         #address-cells = <1>;
         #size-cells = <1>;
-        compatible = "qcom,qcm2290-mdss", "qcom,mdss";
+        compatible = "qcom,qcm2290-mdss";
         reg = <0x05e00000 0x1000>;
         reg-names = "mdss";
         power-domains = <&dispcc MDSS_GDSC>;
@@ -180,7 +180,7 @@ examples:
                  <&apps_smmu 0x421 0x0>;
         ranges;
 
-        mdss_mdp: mdp@5e01000 {
+        mdss_mdp: display-controller@5e01000 {
                 compatible = "qcom,qcm2290-dpu";
                 reg = <0x05e01000 0x8f000>,
                       <0x05eb0000 0x2008>;
-- 
2.35.1

