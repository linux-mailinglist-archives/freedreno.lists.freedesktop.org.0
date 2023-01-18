Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C786711D8
	for <lists+freedreno@lfdr.de>; Wed, 18 Jan 2023 04:24:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF6F010E65F;
	Wed, 18 Jan 2023 03:24:43 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E51410E65A
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jan 2023 03:24:40 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id qx13so21723250ejb.13
 for <freedreno@lists.freedesktop.org>; Tue, 17 Jan 2023 19:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9CVQKGFNAlYAjUpoXQgv1oLPkAX+tyEdhblxpqFV4cw=;
 b=SDPgSkODr61lQewXQXI9MyT/fdS8sLKxVe8zbDt480jNYNViWZKlB66TQ50+RHpObd
 aeYljotojqgrgkvZlwwbJl/6Sckkt8wFAAhfvYY4gMK/CQWUidj76qIl0ByCh5lmVn5G
 KrDRo8cqO8Bwlynja54VfKNFRq+WfFcB1HW/FwgQ2qniA4JxP4kFH4zlewRyLcHM6NRn
 qPM1y8jkksW9f2tpT0hZLivrX4bYFKfZlt4DP/BSA7bkFXdauJsAx71pW+MdpIJusJ7v
 pZPSTjo99Uz4hqVaIUTnUvxkJ53TMTsGQYV/enMc+qyb1ez5A8vFmb1TObju1Mee0FYS
 YJBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9CVQKGFNAlYAjUpoXQgv1oLPkAX+tyEdhblxpqFV4cw=;
 b=ZTlulq+RjfSGtRK9kF7zfRNT2S8HDb5Y0fPr5Q/nlFqt32RRDGwszbYly32hjw1sVm
 YxM9FUwM1WXtmUoQruiVrctdH8e2mZOOecEEG5iiC0HMvWPZxF8f55n2kWZ42RDW/g/A
 E9ClAjJRYjStlZkzOwiBRjb8zwSqknUHVIn1URCjOBTXv+0n1ExKomtgsFisAudbPF8J
 GdrlX2GFO8yG6rcisLXVY0mvC+uFQ21T3higbCFBTQ4+IJpgm+wKSL3HH9xKoGNcKX1P
 8h21MFQo/jbrLF40eEh9AM81AprPRoBvNDtkWu9AVyNDdnfkFXdUjg5p4RPPpZvUVWOT
 fxcA==
X-Gm-Message-State: AFqh2kpLCauGxfDbIu1nqLcRO3jfKdfPrPUKrETFQT2zmAwXXcCfasv/
 AWrRf4o1V1JuoFqweCz7Tx6K4w==
X-Google-Smtp-Source: AMrXdXt03VdBtNqUkusVgtXrGcDHG8DymvlEvlG/t1HO+TD2pWZa0lVglqyym5GI9849sj0aYeM9Og==
X-Received: by 2002:a17:906:7116:b0:78d:f454:ba46 with SMTP id
 x22-20020a170906711600b0078df454ba46mr1383522ejj.69.1674012279005; 
 Tue, 17 Jan 2023 19:24:39 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 f11-20020a056402194b00b0048eb0886b00sm4713829edz.42.2023.01.17.19.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 19:24:38 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Wed, 18 Jan 2023 05:24:32 +0200
Message-Id: <20230118032432.1716616-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118032432.1716616-1-dmitry.baryshkov@linaro.org>
References: <20230118032432.1716616-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 4/4] dt-binbings: display/msm:
 dsi-controller-main: add missing supplies
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

Describe DSI supplies used on apq8064 (vdda-supply) and msm8994/96
(vcca-supply).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dsi-controller-main.yaml         | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index dc318762ef7a..31d389249c1d 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -147,6 +147,14 @@ properties:
       - port@0
       - port@1
 
+  avdd-supply:
+    description:
+      Phandle to vdd regulator device node
+
+  vcca-supply:
+    description:
+      Phandle to vdd regulator device node
+
   vdd-supply:
     description:
       VDD regulator
-- 
2.39.0

