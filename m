Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F353544BB0
	for <lists+freedreno@lfdr.de>; Thu,  9 Jun 2022 14:24:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E11FB11BE67;
	Thu,  9 Jun 2022 12:23:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18D9011BE5E
 for <freedreno@lists.freedesktop.org>; Thu,  9 Jun 2022 12:23:54 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id u26so36991038lfd.8
 for <freedreno@lists.freedesktop.org>; Thu, 09 Jun 2022 05:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dKhPg/cmcxmOfyln8LHNh+0LZCcWe3u5I/ocqfZ0+pI=;
 b=lI3jQFgc0+LXTMushC5OLGDeMWomfNObhV/nHldYgNqyiCEbc+LzVtRtngp0TpUmJ3
 5s3cCPUStcNQmnUVxDTpSLH0V77bLR9Ov3SQMS6hv/pZj+E/PPqn2HLcq8ruAwAxyp0b
 CsAPFwyFO7D4M8HDoOcg7p/jxrGDhhePTuLyeVWDmXsM4RNHPVqI2hyjapqLNhZLaBwQ
 9X5tEFTGiCYxuxifIO9UnpWX0LY4J7Hykix2MI38I6xRGI2t7J160PWwALBeqTFujh80
 wa0gEsblY96daHAxDEslxTqbYwc1mlBoNGIXo+n2JKweCmjnSYl6r6NnQyotLK1lAjSZ
 2K1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dKhPg/cmcxmOfyln8LHNh+0LZCcWe3u5I/ocqfZ0+pI=;
 b=Z4vB6i6nXQRvgcwfIcMvy9svnVAGQM5C8tq2wh5FH0PsuR5PoEuJyy/AGVY+jbsl5/
 +g8wV9IRfH85KV3prm0WGgvIpTiAfqWWAedy+rOfUMy5gy027ezqKV/zXzsRhPw2zk+L
 Aq2ewGEevM/EvWbeLSodEGQZOqog5nrPIrYDyY5eZssGzuq0AMHR/B7qdrWmqZMXLxft
 d3s1YB2wPk08v7ilt8J4/wJ3nK2izHGAXAjxLHMIIZn86JAPmKyW6xA7HY/vC0Ceq7g6
 p0W6oYXi2eiYVl8BvUJhv26c+LW1CzgfvwghIxYWUR/DpjfEq89islUCy8YBsX2QfECY
 qM9w==
X-Gm-Message-State: AOAM532UFWLIN0a8MW+MgY70hhgdCYM8Np4GkPWjO9Iz6G0ErDzqxIaS
 7aOaXXAOZ+oQ2rACIJwmnwAugg==
X-Google-Smtp-Source: ABdhPJw3aoUmQUcvwbwWhKIumYnCx/E7+cjUB82s+Zz4Vy/vCI85MMS9FqQTOhQanhAqebfhanQMSQ==
X-Received: by 2002:a05:6512:1115:b0:479:36b5:b8e2 with SMTP id
 l21-20020a056512111500b0047936b5b8e2mr14394247lfg.522.1654777433621; 
 Thu, 09 Jun 2022 05:23:53 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 f11-20020a056512360b00b0047daa133decsm32421lfs.166.2022.06.09.05.23.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 05:23:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Thu,  9 Jun 2022 15:23:38 +0300
Message-Id: <20220609122350.3157529-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220609122350.3157529-1-dmitry.baryshkov@linaro.org>
References: <20220609122350.3157529-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 02/14] dt-bindings: display/msm: hdmi: mark
 old GPIO properties as deprecated
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
 Stephen Boyd <swboyd@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Mark obsolete GPIO properties as deprecated. They are not used by
existing device trees. While we are at it, also drop them from the
schema example.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/hdmi.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/hdmi.yaml b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
index 861678b2bf94..99b07abcd960 100644
--- a/Documentation/devicetree/bindings/display/msm/hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
@@ -66,14 +66,17 @@ properties:
 
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
-- 
2.35.1

