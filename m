Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B80A75E8C3B
	for <lists+freedreno@lfdr.de>; Sat, 24 Sep 2022 14:19:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68D7A10E604;
	Sat, 24 Sep 2022 12:19:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BC1010E602
 for <freedreno@lists.freedesktop.org>; Sat, 24 Sep 2022 12:19:04 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id s10so2742837ljp.5
 for <freedreno@lists.freedesktop.org>; Sat, 24 Sep 2022 05:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=wD3ZI06u4uCsqVEUfwh957mdvUPp6OmvWbWypMR79T8=;
 b=nBK+COj+qWJOJr1vEWAq+PPZHyzDP7XVnSdgqieDOO8CI/VStgLHD8bmqQIJfm1bta
 JUkAMWVV7E8deEZR/5vohz7L7QBhWwdyZEP7aHo0wKEShQDPuWfO1uL8DyXvq7yFSoob
 NydCexnqlGYKcYrfhHiQk0B9BuW3xqJlSBGypzzdy17kZKwf2kCoBVSZReK4wowS2sRP
 IgjX+TvJIlmCXjayZWe35NqtFMHrDbqVEPWRarFFew+MrI3g8WKXwHvncJ/eKoz599Jd
 ZJWhiaUVAHWO2EoXngRkGog7CR04r+MuUry3BjHv6WHHQLKtelA3H0qtn67UHotCQn5j
 X5qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=wD3ZI06u4uCsqVEUfwh957mdvUPp6OmvWbWypMR79T8=;
 b=HxlFgo8I24rgzpjPdh1Qt8EwEJ4lINjP7onRxtwF2MCmVqX3oUeelcSf8Q1VPFS45U
 CpFxmNN4Qw9a1DitQnXJTLgSsgO7twJtullO8w9fk1HGxgJ90QKQXj+45WgZLyk0BaMd
 vWBBKQ38/fJd8R0ZUmzLgBExzYAeBF3Y7dWohVMsjqtoCC9TsmCedHzBCAcorbED1xH4
 iiFmxflex6BJl8xIWKRGQJIGxB/B3E8hoYma03n5AyslctQFw9shNvKdba191nOtm8Q3
 1IwDnlNpkl5K8f0LBtigMk4bxnQGDIWn+wJJitiww/hjNOas3OndApKpGkn4aTrh/8pk
 883Q==
X-Gm-Message-State: ACrzQf3S9F+uisynjAmTaYAcrjlZC21iK1zfiRHXrGjwGI2serJkjN6s
 MVtAvpbkQPqKlXlxg1JKHTl+Hg==
X-Google-Smtp-Source: AMsMyM4e34UZotqqQpuUajQ6KhUnIaVDH3NbpeLeHKBsw2Xz7QmrnNeD63hJ98FQOiIMtktXyORJ4A==
X-Received: by 2002:a2e:8917:0:b0:26a:a520:db52 with SMTP id
 d23-20020a2e8917000000b0026aa520db52mr4288881lji.289.1664021942396; 
 Sat, 24 Sep 2022 05:19:02 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 v12-20020a19740c000000b00497a2815d8dsm1870113lfe.195.2022.09.24.05.19.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Sep 2022 05:19:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Sat, 24 Sep 2022 15:18:59 +0300
Message-Id: <20220924121900.222711-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220924121900.222711-1-dmitry.baryshkov@linaro.org>
References: <20220924121900.222711-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 1/2] dt-bindings: display/msm: Add QCM2290
 DSI phy
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
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Loic Poulain <loic.poulain@linaro.org>

QCM2290 platform uses the 14nm DSI PHY driver.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
index bc3d0b4063c7..054d8f65d9fa 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
@@ -15,6 +15,7 @@ properties:
   compatible:
     enum:
       - qcom,dsi-phy-14nm
+      - qcom,dsi-phy-14nm-2290
       - qcom,dsi-phy-14nm-660
       - qcom,dsi-phy-14nm-8953
 
-- 
2.35.1

