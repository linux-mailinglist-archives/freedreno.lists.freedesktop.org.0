Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAE66711CF
	for <lists+freedreno@lfdr.de>; Wed, 18 Jan 2023 04:24:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A89E510E65A;
	Wed, 18 Jan 2023 03:24:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5745B10E659
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jan 2023 03:24:39 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id z11so47893253ede.1
 for <freedreno@lists.freedesktop.org>; Tue, 17 Jan 2023 19:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7gfBgFMCglJwiGtp0Su/fVc++xtqk3QZfhniXX5gUFE=;
 b=OdTpnb3J63Ut9HB0AGI5ycBVBTpKNSIqYi3xKa04tWIpj22ol6hTPj/kXEY+MxM95A
 SXp8ewlzRqKXO6XDYEstLqNPZnh+ISACHqGK284MEex24omx1HVsd/oXGs0FHm92Hqx0
 8VIBwRvpmdd6Ws1LOLkSaOibqn5oXYbFnKcfEHn8Wj5uBpN2C/8rZvgZ+LHPwyR0URBs
 LuttA0yFxGOx/Ub11VOszVgRvcMPJrx5KlzAUHAWvb350weh3Bs9FwlG+aho58Ljoc8W
 UM0vlW2vCu8HjfQ8RxWAVyER4jdB6xPqHExWv3LjZAvSFX1VJyhRd3gilZkmE39z1fTF
 Z3nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7gfBgFMCglJwiGtp0Su/fVc++xtqk3QZfhniXX5gUFE=;
 b=VP7jOyV1A7lc8sWAG2B5kWwHk24pN65QFI053JwOxr90xZoJ9Vc0oU50O0pl6DDcrx
 9vWkgvCJQMoHoTlUD/r7w/0AwI8bKuMvwPXex70ggRC/1TCfhz/av7PzF5V19j13IIm2
 h6+R/LtrDrg7izFY4KT+JY/NfrIvc82OMtEzf/7N9jU+jKDYTbRSAjsE23+dfyVIARml
 1tG3v+9/8H13yG1wOVMY4ZFe1AqGM/+wuHayQ7n7cHmK9T/FNVViFnE/fqEiqDZ2Ln8K
 bFz1sE1A4qWTuwb31k3bfqWT5Qf9wjXPcTgqpNVVm7IXxlelLq9eo0m4oj0OniHsyVL0
 SWtQ==
X-Gm-Message-State: AFqh2ko540A9KnAAU+heAcdUTLy2o9ps1aL8RRom/9kBBLTflKa9y41D
 yk9LWWx8CUI25IMq+oRR/wIQjQ==
X-Google-Smtp-Source: AMrXdXt8oddItr2P36DuY7+xZsptoMdQIh0DJJedzDOGjW814zXo1noWgpEsw6tkZ59eMYnQ0Yvgqw==
X-Received: by 2002:aa7:d887:0:b0:499:1ed2:6461 with SMTP id
 u7-20020aa7d887000000b004991ed26461mr5387548edq.17.1674012277888; 
 Tue, 17 Jan 2023 19:24:37 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 f11-20020a056402194b00b0048eb0886b00sm4713829edz.42.2023.01.17.19.24.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 19:24:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Wed, 18 Jan 2023 05:24:31 +0200
Message-Id: <20230118032432.1716616-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118032432.1716616-1-dmitry.baryshkov@linaro.org>
References: <20230118032432.1716616-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 3/4] dt-bindings: display/msm:
 dsi-controller-main: allow using fewer lanes
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

Some platforms might use less than full 4 lanes DSI interface. Allow
using any amount of lanes starting from 1 up to 4.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 357036470b1f..dc318762ef7a 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -123,7 +123,7 @@ properties:
             properties:
               data-lanes:
                 maxItems: 4
-                minItems: 4
+                minItems: 1
                 items:
                   enum: [ 0, 1, 2, 3 ]
 
@@ -139,7 +139,7 @@ properties:
             properties:
               data-lanes:
                 maxItems: 4
-                minItems: 4
+                minItems: 1
                 items:
                   enum: [ 0, 1, 2, 3 ]
 
-- 
2.39.0

