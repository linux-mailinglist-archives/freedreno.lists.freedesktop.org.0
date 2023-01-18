Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB6B6711A7
	for <lists+freedreno@lfdr.de>; Wed, 18 Jan 2023 04:17:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E540710E651;
	Wed, 18 Jan 2023 03:17:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87DA810E652
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jan 2023 03:17:21 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id ud5so80120780ejc.4
 for <freedreno@lists.freedesktop.org>; Tue, 17 Jan 2023 19:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YuXEVz5lZVRCSDGEzKxtDD/QLwFWgZQYOz3RZgwz8FQ=;
 b=qplg+wrjhIH6EEdvDp1srATPDxbgXUvXY9aBqyjZkSL7ZHb8SLbi1Y4b6hzEG1GHSf
 2+4IoimjE4KNYJKVQANsWfbUOhRoIHgV9+7wWRB7h787Rse787N8I3OwypipHduAeIma
 uLz4ACNFGt5gBZFgNZxrC563Nvp1qg6jyUPW3wu0yJcZ2tTu9E6mfiMJ3GV53Lz5PWSU
 Lv9yo89HTNXhGHcbUBXvOwAet1GMreDBeyQcRf9xSEWpT+ep1XgIuCoaxk3to5xMRBuf
 DMtKSrfbkRz+3ozcA0V+IOrzcxUb7HfmrPLlVjtfz7XJTK9IR1TgYKGUtZ/liu5irGnd
 zgMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YuXEVz5lZVRCSDGEzKxtDD/QLwFWgZQYOz3RZgwz8FQ=;
 b=1UD5+JvN79hdUqpWxMTCYPa8B5zIYeFsXJgE+7XYxvyZ+5rpvenhFhbmSDmAwtL2ZS
 6/yxyKAbhZGPm6WXZMU6INfY3/eGG9TmX3Wv2GyAJTrD//YzvW6FvPVVg7R5UcMixW/g
 a6R7+p+odzSDLTHhsioVaoBsZ9LgyG0tvGmqfQ8HXpFteeO4tgg4TkufZgSe5X9eN4P1
 Zm3JiL3TnPNV7hMpHlVHy/EtJQqm8FmJVH2wlqe8G+lkmzB3i3kImDCvIkmsH7hrLb/T
 2axLaIECecyfMoBz++xH3NymIyzy2IdmrXX4TYKQXK7JOCBSJ6fFPWU0S/7rZiV3sNYR
 4M3A==
X-Gm-Message-State: AFqh2krDMJvvhhCw4alQNau66DWoNc9m2oV/slWKbNars3Cd32Xnd6fs
 QT6VarDkvRp5Wj7uQi4HfjIo0g==
X-Google-Smtp-Source: AMrXdXuKcerAn5f2RBWfmyK+LN/3rQh8i7OXoydjvcr98jXhNoQjDuIph3i03ywLQyfjDWIK+zD5Hw==
X-Received: by 2002:a17:906:fcb3:b0:86f:8ccb:5d0a with SMTP id
 qw19-20020a170906fcb300b0086f8ccb5d0amr5353941ejb.36.1674011840044; 
 Tue, 17 Jan 2023 19:17:20 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 2-20020a170906210200b00876479361edsm535639ejt.149.2023.01.17.19.17.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 19:17:19 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Wed, 18 Jan 2023 05:17:15 +0200
Message-Id: <20230118031718.1714861-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 1/4] dt-bindings: display/msm: add qcom,
 sc8280xp-edp to list of eDP devices
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

Add qcom,sc8280xp-edp to the list of eDP devices, unblocking `aux-bus'
property and fobidding `#sound-dai-cells' property. Also since
sc8280xp-edp, overriding sc8280xp-dp, will contain 5 reg resources, drop
the reg contraint (as it will become equivalent to the top-level one,
requiring min 4 and max 5 reg entries).

Fixes: b6f8c4debc00 ("dt-bindings: msm/dp: Add SDM845 and SC8280XP compatibles")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/msm/dp-controller.yaml         | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 3e54956e57db..efe4257c031f 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -151,11 +151,10 @@ allOf:
             enum:
               - qcom,sc7280-edp
               - qcom,sc8180x-edp
+              - qcom,sc8280xp-edp
     then:
       properties:
         "#sound-dai-cells": false
-        reg:
-          maxItems: 4
     else:
       properties:
         aux-bus: false
-- 
2.39.0

