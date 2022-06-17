Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A4554F581
	for <lists+freedreno@lfdr.de>; Fri, 17 Jun 2022 12:36:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67A8511A9CE;
	Fri, 17 Jun 2022 10:36:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C7C611A97C
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jun 2022 10:36:19 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id c4so6264846lfj.12
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jun 2022 03:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+mbF+CT4pj0sqOG4T30LpuUV61IhgblfEF1NrGou+hc=;
 b=kx4PfLy2XLmc8jxKBvCw5y+bwlmV5LhtLO3ZV3A/LS5GqtkQDVOaiRGkIWzZIoVFsy
 ETBCtf0RCSBO4mgakTkVDr0ZCygFPtjWf1pE6rPf7dxjqEZyNszlv2709v/GZkwauE7z
 HWndjnaUKvNquf+3uL5laRFKMqMBp0Oia50ho90s1CAYpW0tIOQHilUH7NwnzVPXjuTv
 h5w9MepAt61gsMO2hA57hk4h28oW8of6+JvN1jhBNHdyTLTQ/RSeZciiOJ/Z711E45t+
 mg72oZRK6I2dDL1509XFIuZthHQUuU1vdJ2C0oK42L2z8UVUHs9w+UcQeQa6FT2E4Sh0
 ChSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+mbF+CT4pj0sqOG4T30LpuUV61IhgblfEF1NrGou+hc=;
 b=WHbZgEZ7cq1VzgBaQtTf+h+re3YRbC2S1Qobw8X0ZtVEhTsBGL15ja1Z5+7098IDgE
 zaGWK/VsAnMSGGAE4fpWU4Mj+qr0oDARbpHxu63zbCh6nGzfDNFSlRQg/vPUdKwKBkD/
 HIikAxYGOETU3dx68MuIwtNEmQcWuu9uiE/qak/ISosLw3yPJlDzDrf+kVXtkN3TBwze
 vGF0PnKDfgng5fjC+ZtoMsItjdoJEB5459Z7rAsWgUeSbsSzTri/RxERsb0XeDFHD5RS
 d9YHtD6n6jWNzB+fZYm5VRfxKvIyAjsly+dPm4Ooh52ZkBqBBdC+LfztkFEUlJD4pvxj
 kEsQ==
X-Gm-Message-State: AJIora/c5qQ13+3wtuJNB7jeijrlWnGp5OC3F2a87BHEfQjpuygO2L4a
 575U2dGwa0RYSvSUqP+i4sJHPQ==
X-Google-Smtp-Source: AGRyM1sKdiIYMNjTRBjuxiCZLxXGBdUfp5MBs0U9Q+lvXrTgNjerprVbhOZjK57i7s5XIItJ9Jcy4w==
X-Received: by 2002:a05:6512:3a93:b0:479:76e7:3861 with SMTP id
 q19-20020a0565123a9300b0047976e73861mr5188182lfu.446.1655462177295; 
 Fri, 17 Jun 2022 03:36:17 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 d3-20020a056512368300b00478ff020832sm591803lfs.106.2022.06.17.03.36.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jun 2022 03:36:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Fri, 17 Jun 2022 13:36:06 +0300
Message-Id: <20220617103608.605898-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220617103608.605898-1-dmitry.baryshkov@linaro.org>
References: <20220617103608.605898-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 1/3] dt-bindings: phy: qcom,
 hdmi-phy-qmp: add clock-cells
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 linux-phy@lists.infradead.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

As the QMP HDMI PHY is a clock provider, add constant #clock-cells
property. For the compatibility with older DTs the property is not
marked as required.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml
index eea2e02678ed..1ada0d9857c0 100644
--- a/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml
@@ -44,6 +44,9 @@ properties:
   vddio-supply:
     description: phandle to VDD I/O supply regulator
 
+  '#clock-cells':
+    const: 0
+
   '#phy-cells':
     const: 0
 
@@ -78,6 +81,7 @@ examples:
                <&gcc 214>;
       clock-names = "iface",
                     "ref";
+      #clock-cells = <0>;
       #phy-cells = <0>;
 
       vddio-supply = <&vreg_l12a_1p8>;
-- 
2.35.1

