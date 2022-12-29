Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 185D7658CCA
	for <lists+freedreno@lfdr.de>; Thu, 29 Dec 2022 13:45:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F9C010E1F3;
	Thu, 29 Dec 2022 12:44:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 749D910E198
 for <freedreno@lists.freedesktop.org>; Thu, 29 Dec 2022 12:44:52 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id g1so12341044edj.8
 for <freedreno@lists.freedesktop.org>; Thu, 29 Dec 2022 04:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rxg/cFQV5AJ+KK+e2LcSmN9+piXsVTnLsnVoNNfzlWY=;
 b=RN+xJDnlX/Nks9M2zzXKHBUUN3mNvGk5Rx4W+JlCaa8LqmMUm+Ls0gZLS/E+lZVuiw
 pfKgnm0PNSxb0lvFRMYLWJn23/j1VKmsrq+9dnUip/pTY3W35H+M7IGqnwi3zcOaLr27
 Fav7zW75RA37CptvTK2rIxYUHtN9SeimcTtS/47LqIWW0FflZchIPnNdaSQYXLrXuL9Q
 RykR//wzIBEnH+xmiZ/qVnYiUCWT0xeJ6rlwWOWUTO5bouV79d6lc5rgSlREFmVioU5d
 XVEKp9KJiQ/4KFY1K9Z6jBhnOSzrnnnhQwyxHd95Qa+rBY+8cPxD+Nb6bfB1xE+vtqb7
 66BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rxg/cFQV5AJ+KK+e2LcSmN9+piXsVTnLsnVoNNfzlWY=;
 b=xTzk/zZvzwikN4Ip/WZ+Px3G3/6MoqlJYm+JYrXCpiQl2bDJRruuPn3aaEXDjIULML
 E4fMZxBVv8b1pNk7qBv/6XJVQXtHx2GU3HNX7V2bmMHrJdd+2k2HOz5UyA1KTaVJIFA3
 +h6K4SDQWTi682RERBgAJ5AyObbHdk67YSnXeJSDD+yOfNfkFW3ZAhJ3GQ3GaPAnkrnn
 kmQ+DDRrH9Q4VHg7E+hvlLLt3ywLijKIFlvRXa85CvSdgr/8u13HNw/ViWGrv4Jj037c
 dWT0J2yzqgfwFdfqwb6Pqy2A8ppdRqOQD/7QtLnXAjokN5omPd75RUXUoobap0XlbPP2
 cPuw==
X-Gm-Message-State: AFqh2kq+rp9idVjeqXlzXNxggTDVHf82o2CgagGyryVyrZJan8qZk8yv
 q8C5FGi9eA7RCSydlP151m3K7w==
X-Google-Smtp-Source: AMrXdXuUPNTQPjnr1WWBCZcOc80Er1IGpuAXTohqoM/RvMoJrvIxqy9gwwTiAwv9NbYKfn2wl+PhGg==
X-Received: by 2002:aa7:db53:0:b0:45c:835c:c6d0 with SMTP id
 n19-20020aa7db53000000b0045c835cc6d0mr24246529edt.1.1672317891042; 
 Thu, 29 Dec 2022 04:44:51 -0800 (PST)
Received: from planet9.chello.ie
 (2001-1c06-2302-5600-12a8-8cf4-e3f6-f90f.cable.dynamic.v6.ziggo.nl.
 [2001:1c06:2302:5600:12a8:8cf4:e3f6:f90f])
 by smtp.gmail.com with ESMTPSA id
 15-20020a170906318f00b0078db5bddd9csm8483461ejy.22.2022.12.29.04.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 04:44:50 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Date: Thu, 29 Dec 2022 12:44:38 +0000
Message-Id: <20221229124438.504770-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221229124438.504770-1-bryan.odonoghue@linaro.org>
References: <20221229124438.504770-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 1/1] dt-bindings: msm: dsi-phy-28nm: Add
 missing qcom, dsi-phy-regulator-ldo-mode
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
 andersson@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, quic_mkrishn@quicinc.com,
 bryan.odonoghue@linaro.org, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add in missing qcom,dsi-phy-regulator-ldo-mode to the 28nm DSI PHY.
When converting from .txt to .yaml we missed this one.

Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-phy-28nm.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
index 3d8540a06fe22..2f1fd140c87df 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
@@ -34,6 +34,10 @@ properties:
   vddio-supply:
     description: Phandle to vdd-io regulator device node.
 
+  qcom,dsi-phy-regulator-ldo-mode:
+    type: boolean
+    description: Indicates if the LDO mode PHY regulator is wanted.
+
 required:
   - compatible
   - reg
-- 
2.34.1

