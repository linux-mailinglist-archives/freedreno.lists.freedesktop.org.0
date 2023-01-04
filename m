Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C44C565CF1C
	for <lists+freedreno@lfdr.de>; Wed,  4 Jan 2023 10:08:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4094510E509;
	Wed,  4 Jan 2023 09:08:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EB2510E500
 for <freedreno@lists.freedesktop.org>; Wed,  4 Jan 2023 09:08:49 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 z8-20020a05600c220800b003d33b0bda11so534403wml.0
 for <freedreno@lists.freedesktop.org>; Wed, 04 Jan 2023 01:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ywhy8rwxYugaCOCt736qav9wiltG83VAN5edYIDMMK0=;
 b=gigiGe5rRb34aJVuvZjpbTHFslzpbK2INEVyJg46HZdizq9iJkHqeWLrcZY53ohhlh
 fikpvJ8gRcsyuZxgSLEmhcJG+kPGas5eE3ZOrkRn2EwYTkWHR/JmKRZ97lNGxQnLX4uG
 DlNIdZFuWWoWA6HrcISfJh9C7+LFbZQWXg9mJDhkhB7ieSb2K5yjS5fqaCWu8BAOgnhZ
 pnDS8UAX9fljmbMBwsSU8AjMrFd+EghtZhCJV44K8OSvCNnAubvO7sgsMk79uYsucp0C
 vwVR8lT3MF0MF8DlhgAlczYqfETFbVYvASaAFQKXxSmGdnETbNxvVGz+MZDrZF2RxfXd
 HJbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ywhy8rwxYugaCOCt736qav9wiltG83VAN5edYIDMMK0=;
 b=MEz23gYi/VpqDnfzEQZOQWUFmKmjOnONuT50lG9L7dY+QkMg/RAi2zXChnc3p/w90C
 d/VAJ7pakAFG2omBcVfoEEnQi9H+AFMauRyOrKjiL3W7C6441Bqdk2uzfZ7AXKuEdPfF
 07vhzyDjxTuuYhPljj4u96YuOLH0uk+PJKjZXFoKkJ7i3wPjfnKd3SFVjTWg1e0OXQ+f
 Q6djKoQNuEz9tsmqW9xrfcaun2VahQ4bUZ/igXsx8rWuhUw91qsosrv8UjpwXI0euwIB
 7UMuJ+K0ospHs5tqk5NTw/xqpZA41E3+Mz8YWufT0OpmP4Mcx4DX3MHVL2ZNwZl0U/ZD
 EwrA==
X-Gm-Message-State: AFqh2kp79m8dg97rS+5WMB8eqsgV/hRcevEiYlVfjYSKjRolqvnznKCC
 lGDZthDJehzAG5FDib2mBx5kFw==
X-Google-Smtp-Source: AMrXdXv6qX18TiGEiG+Y4uCV64Ch859OaM/nIrmW1EaY04J7vq8U2dgvbt0GY9jY+48Ed5nWeP9bkg==
X-Received: by 2002:a05:600c:254:b0:3d2:2c86:d2b2 with SMTP id
 20-20020a05600c025400b003d22c86d2b2mr41360582wmj.24.1672823328004; 
 Wed, 04 Jan 2023 01:08:48 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 j34-20020a05600c1c2200b003d98438a43asm36124622wms.34.2023.01.04.01.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 01:08:47 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 04 Jan 2023 10:08:43 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230103-topic-sm8550-upstream-mdss-dsi-v1-1-9ccd7e652fcd@linaro.org>
References: <20230103-topic-sm8550-upstream-mdss-dsi-v1-0-9ccd7e652fcd@linaro.org>
In-Reply-To: <20230103-topic-sm8550-upstream-mdss-dsi-v1-0-9ccd7e652fcd@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>
X-Mailer: b4 0.11.1
Subject: [Freedreno] [PATCH 1/6] dt-bindings: display/msm: document the
 SM8550 DSI PHY
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Document the SM8550 DSI PHY which is very close from the 7nm
and 5nm DSI PHYs found in earlier platforms.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index bffd161fedfd..f72727f81076 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -15,6 +15,7 @@ allOf:
 properties:
   compatible:
     enum:
+      - qcom,dsi-phy-4nm-8550
       - qcom,dsi-phy-5nm-8350
       - qcom,dsi-phy-5nm-8450
       - qcom,dsi-phy-7nm

-- 
2.34.1
