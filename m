Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7A566216D
	for <lists+freedreno@lfdr.de>; Mon,  9 Jan 2023 10:26:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5069B10E390;
	Mon,  9 Jan 2023 09:26:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA6110E38E
 for <freedreno@lists.freedesktop.org>; Mon,  9 Jan 2023 09:26:43 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id ja17so5779561wmb.3
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jan 2023 01:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=KqmLVgay/XqUNaT/xdLAcUPvxXRqKr/LkmMi0cg+BiA=;
 b=vFJGUQxQwVVfSUIbv6MJWzDEWqUs/JRKefkXc35uK/FCCbHEPD7ABHHP6l0i9Qtt3Z
 WdhjJorxYa6inL5U+nn+RuR+83hRqB+SN7Ux9vxjT1yhrMWhvgzWKfPoWxaTOvcmJlWG
 IMPACdhipUcalbBDuvNJLaLW1zwG84Pa2INJOcPoDvujWBQu0gprrTBVOWzSaxnBPV/0
 WYjhLSuDWl6hOY2Xkch74u3vT7jOxFKUJH6EVO26isuitnALNDcvlx+atOreULrRdWa4
 xBq066zR9tRavmyqO0QcINKaEscDcyycosuaDAymUfuZJjQyO7v2xJuFHVs/axNOETwV
 3/iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KqmLVgay/XqUNaT/xdLAcUPvxXRqKr/LkmMi0cg+BiA=;
 b=3K7cEd2BWjq3ztNAfCHmBdKW2E23n9PRepNSimZmz+HafX+1RGuBn4H1oksn4XU/je
 AwP3Nq/xaa3sX+8n5xXgIVdMs5u1/3vlmdLv5c/VedoWVsajS5ar7Gs3j8BcLR5JfZ3z
 +JgdVK9OMV5HvrRp7krOIckonHdq1icB/ugQgFRy0JZbMYki3s83MA9hvHd4cwxmXXNy
 pFN92V25QfT3+u+vVtH3SU9nv8AoW/xhhCGp8BGuXXbB+7U3WBPDil8WmGvVJTiLwS5Q
 OMgw5KLzPutAtrqKOCf7XSFCHD9/5QR0le3lFBI1oRKVKg446GdMfjZ7fCXPC5WoaInL
 mbrw==
X-Gm-Message-State: AFqh2koyaMmTkW2IVH4Ym6hj7yOxT7kuC4QzfVuoftHp/OZINotACOIV
 qyBGNzod1rpTCjiYZfgseg6Miw==
X-Google-Smtp-Source: AMrXdXs3M9hLBBet8rNXj4CgsKntDY7FRJIZhtrjOokvCd8hf+wIdnNNqKxE//VENUIdFVYjJ9kIQA==
X-Received: by 2002:a05:600c:12c6:b0:3cf:6926:2abb with SMTP id
 v6-20020a05600c12c600b003cf69262abbmr48660636wmd.7.1673256401693; 
 Mon, 09 Jan 2023 01:26:41 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 s23-20020a1cf217000000b003d1e3b1624dsm15195758wmc.2.2023.01.09.01.26.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 01:26:41 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 09 Jan 2023 10:26:33 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230103-topic-sm8550-upstream-mdss-dsi-v2-1-87f1c16d7635@linaro.org>
References: <20230103-topic-sm8550-upstream-mdss-dsi-v2-0-87f1c16d7635@linaro.org>
In-Reply-To: <20230103-topic-sm8550-upstream-mdss-dsi-v2-0-87f1c16d7635@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>
X-Mailer: b4 0.11.1
Subject: [Freedreno] [PATCH v2 1/7] dt-bindings: display/msm: document the
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
index 299751a9caea..78ab8c410ccd 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -20,6 +20,7 @@ properties:
       - qcom,sc7280-dsi-phy-7nm
       - qcom,sm8350-dsi-phy-5nm
       - qcom,sm8450-dsi-phy-5nm
+      - qcom,sm8550-dsi-phy-4nm
 
   reg:
     items:

-- 
2.34.1
