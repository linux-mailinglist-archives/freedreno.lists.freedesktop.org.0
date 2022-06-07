Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8A2540E8A
	for <lists+freedreno@lfdr.de>; Tue,  7 Jun 2022 20:58:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA7FE10F004;
	Tue,  7 Jun 2022 18:58:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A0E210EF72
 for <freedreno@lists.freedesktop.org>; Tue,  7 Jun 2022 18:58:11 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id a29so1226587lfk.2
 for <freedreno@lists.freedesktop.org>; Tue, 07 Jun 2022 11:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aGzqYEGQn+If9ubvMiuRbk2B+EdJKY+QHOiiUFFUgLA=;
 b=Sj2qVill9L+8Omi1aXH+ITfabJemTKGx5YdS65gfo5MKRt51SxHahuPZdrVhAwkqWi
 6GKL8CY71YignAnsb7FS5qEuahe4EHe2lDKvSxCklkwaVDn54B0+wwMWOWzCWr5ehS8g
 wQGVjfEIc1i2TdNEZUwLSaLPDCiWtcZvnKr+urn/LGuirb3I4yYJPQSCq/lcaeGOJ5NK
 e8IbYxw2bZ7pzXXFGmnBOdaxAvL5YHPS+QM8Fx3iWbkDbaeXuagC9CQ4i5vSQ1GWaY0b
 O8yGgBqnp5VzG7pMTLEZh0E9dU1V+Iq3LNEYIq6hWRP3kuLZB8Dnc6Zf0B3H2V6fkfiD
 Wqow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aGzqYEGQn+If9ubvMiuRbk2B+EdJKY+QHOiiUFFUgLA=;
 b=xRrzbTDDPYKkm2FptWWpD43oph5aBGZg0dpRLna5ocaebd/cIz6gl5Jgo/GXo2xuNt
 HdQJ4cUnihTHd31F44xTLtB6EZwG5pC+hcQRD4lcwqARVkwe+BS/232GAdiCC72QsEzh
 hjvmeA7IJr+fPGr5ZVkufu2ovIQ9KkFQlInNiOhlg5EBdnMrTwAtcvsDwqwV/Ty9B0TX
 b0muFoH+H0WLVUDGkoH5w7+1bjM/U7xXKryFZ7Ox83a+/DtWAjbLcsKUIdBfELH4w5N6
 Ye4/yce5VyqeAT5ERK94g4MhGTQVzjbZ9uahTgkHOc4XQirlr9A+XEfgJJeYHVF7dbux
 8V5g==
X-Gm-Message-State: AOAM530Qls5GvItB8yBf+q26eRUYBDNP/xj0uTgB1LsLViSyVEm28fqW
 PR3DnxtZp0qu0O2gCQ96YnUdFw==
X-Google-Smtp-Source: ABdhPJzEpQjDU9eJCieoZIm+7e2VEurWFXSje1/LOnq676gG9dGxHWnm+QON/hUbK3UpJK4BXh8MKA==
X-Received: by 2002:a05:6512:22c1:b0:479:54b6:8281 with SMTP id
 g1-20020a05651222c100b0047954b68281mr5727582lfu.291.1654628289821; 
 Tue, 07 Jun 2022 11:58:09 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 d19-20020a2eb053000000b0025587b872cesm1611668ljl.70.2022.06.07.11.58.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 11:58:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Tue,  7 Jun 2022 21:58:01 +0300
Message-Id: <20220607185806.2771739-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220607185806.2771739-1-dmitry.baryshkov@linaro.org>
References: <20220607185806.2771739-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v1 2/7] dt-bindings: display/msm: hdmi: mark old
 GPIO properties as deprecated
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
 Stephen Boyd <swboyd@chromium.org>, David Heidelberg <david@ixit.cz>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Mark obsolete GPIO properties as deprecated. They are not used by
existing device trees. While we are at it, also drop them from the
schema example.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/msm/qcom,hdmi.yaml         | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,hdmi.yaml b/Documentation/devicetree/bindings/display/msm/qcom,hdmi.yaml
index 2f485b5d1c5d..2b1cac0851ce 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,hdmi.yaml
@@ -59,22 +59,27 @@ properties:
 
   qcom,hdmi-tx-ddc-clk-gpios:
     maxItems: 1
+    deprecated: true
     description: HDMI DDC clock
 
   qcom,hdmi-tx-ddc-data-gpios:
     maxItems: 1
+    deprecated: true
     description: HDMI DDC data
 
   qcom,hdmi-tx-mux-en-gpios:
     maxItems: 1
+    deprecated: true
     description: HDMI mux enable pin
 
   qcom,hdmi-tx-mux-sel-gpios:
     maxItems: 1
+    deprecated: true
     description: HDMI mux select pin
 
   qcom,hdmi-tx-mux-lpm-gpios:
     maxItems: 1
+    deprecated: true
     description: HDMI mux lpm pin
 
   '#sound-dai-cells':
@@ -171,8 +176,6 @@ examples:
           <&clk 61>,
           <&clk 72>,
           <&clk 98>;
-      qcom,hdmi-tx-ddc-clk-gpios = <&msmgpio 70 0>;
-      qcom,hdmi-tx-ddc-data-gpios = <&msmgpio 71 0>;
       hpd-gpios = <&msmgpio 72 0>;
       core-vdda-supply = <&pm8921_hdmi_mvs>;
       hdmi-mux-supply = <&ext_3p3v>;
-- 
2.35.1

