Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EBE56CDF6
	for <lists+freedreno@lfdr.de>; Sun, 10 Jul 2022 10:41:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F36611BF88;
	Sun, 10 Jul 2022 08:41:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 267D511BEFD
 for <freedreno@lists.freedesktop.org>; Sun, 10 Jul 2022 08:41:43 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id f39so4254401lfv.3
 for <freedreno@lists.freedesktop.org>; Sun, 10 Jul 2022 01:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uL7wiVg1RgrpxbM/E5AHKRDJeIFgAkbS4akWzL7eFSM=;
 b=cduRVgw3BOsc7BKIWJ1NZS3FAwj24GNmlO+somU5Bcit3gf6AnzVVzJuU7gvux7O9D
 8uZq4Y0nZ9o0Fl9dGvnGSPVmHmQq5TvJiAxnR3omUILA8LD5HNoSh0NmPyyLe1qMhEhd
 IZvhJapk8M18k5UF07RQ7eXmXRqXpRNrM01qOzVPGtudfIRS4irAPRcLoM7JrRZwL8jt
 Etxj+Q9GX6u9Z/EavcWWVNjqj669zdSyqJEQkFzojAX+aIr8OVm6cx1BPH5Gh4KwzUQn
 Wfhb7W1bzbaOlWvZbT2c3nSayub/Tn66VZdgKcboKKsRCIr+CH4ibLKSLZ/mnO708moY
 LjnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uL7wiVg1RgrpxbM/E5AHKRDJeIFgAkbS4akWzL7eFSM=;
 b=o0fVKCBIRly6+Jtm8sxsyOKzMtQNlOemy7eMA80pXiZ5FKbeLIiSRQbVAaitKd0iXU
 5Kfuvk3kgJ2AU4N9iU0GGFfOLm0uHGEwsyvC2gbU8WXh0PUcwphpuEiyG2Zoo/OBJIxw
 JPjeiVBCa/grD6b9pyVYuW17BkzbTdRWfwStml8bNdqK0L1lrv2fiCdmMN+/j/awfWcS
 f2fV0DyUZGAUBJKIxNVkFpCjVv7NQL7gC7lwxxiYInG5974nIoYz1BGJYfKLt9cj7tWh
 qCAi5ORSZ9jfqYzPeUvNnXK9c2hJT8WhHhCfbWpNNuUR9Ks0C+ELyPlh6B1orPCtEY+m
 CxRQ==
X-Gm-Message-State: AJIora/1ybUiQOMbD0hcs/Z8I8174RGan+LU2M++AOBJ9/uGdNBFAvHC
 c9N/Vkf158Vm/OMcYz7J8DIOtQ==
X-Google-Smtp-Source: AGRyM1v3sQKMx15SYFl9GMpgtDEpQhV6ZiOxRN71c1mR6H49vk4tEqt3nmzxHSnEcHRz4fU7sQn+Ag==
X-Received: by 2002:a05:6512:e93:b0:486:5c68:e46d with SMTP id
 bi19-20020a0565120e9300b004865c68e46dmr8631570lfb.670.1657442502675; 
 Sun, 10 Jul 2022 01:41:42 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 i21-20020a2ea235000000b0025d4addbad4sm912536ljm.91.2022.07.10.01.41.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jul 2022 01:41:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Sun, 10 Jul 2022 11:41:31 +0300
Message-Id: <20220710084133.30976-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
References: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 7/9] dt-bindings: msm/dp: mark vdda supplies
 as deprecated
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
 Kuogee Hsieh <quic_khsieh@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The commit fa384dd8b9b8 ("drm/msm/dp: delete vdda regulator related
functions from eDP/DP controller") removed support for VDDA supplies
from the DP controller driver. These supplies are now handled by the eDP
or QMP PHYs. Mark these properties as deprecated and drop them from the
example.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/msm/dp-controller.yaml   | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 94bc6e1b6451..391910d91e43 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -76,8 +76,10 @@ properties:
   "#sound-dai-cells":
     const: 0
 
-  vdda-0p9-supply: true
-  vdda-1p2-supply: true
+  vdda-0p9-supply:
+    deprecated: true
+  vdda-1p2-supply:
+    deprecated: true
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
@@ -140,9 +142,6 @@ examples:
 
         power-domains = <&rpmhpd SC7180_CX>;
 
-        vdda-0p9-supply = <&vdda_usb_ss_dp_core>;
-        vdda-1p2-supply = <&vdda_usb_ss_dp_1p2>;
-
         ports {
             #address-cells = <1>;
             #size-cells = <0>;
-- 
2.35.1

