Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 835E4661E07
	for <lists+freedreno@lfdr.de>; Mon,  9 Jan 2023 05:55:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F6E210E270;
	Mon,  9 Jan 2023 04:55:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C543410E26F
 for <freedreno@lists.freedesktop.org>; Mon,  9 Jan 2023 04:54:56 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id bt23so11195435lfb.5
 for <freedreno@lists.freedesktop.org>; Sun, 08 Jan 2023 20:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TOb1Aceo/UQvqSGAz4vmSvKygF6ghKxNjCdlHBbs6Qk=;
 b=BZ0lu8cck+L9o8kMSf6bqXTlkqR1NMtBTyERO3za3EJ5AIYvP3dgz+tvW9Ahm4Wygr
 9FEyd5QXE/QQE9Jzpn+c3M0OFM66uqywbkN79smKoPFbk2Yeuxc2T2lGmLcBJ7EzOFgZ
 1bHyNDfSdW7PgvAFlTLJIaVfsrTqG6vAtJ+DkqnmhPaiHoWx5/e2lkEQu9Gj14W2kIjk
 kOBarEfb+JleUS+nhCTAVstPySPS0MjjXGIJtLHCltJMgpSWAvxeVlwuDZcqrUjuaYnl
 u/sj5bN8ApXwOWmp9URG+0IJ+ia7HHT0XSOGKaU9wWBEIc+9+90e+wnpZ+zGSRKiCoTN
 5GiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TOb1Aceo/UQvqSGAz4vmSvKygF6ghKxNjCdlHBbs6Qk=;
 b=mt8KmzDP5aXb+qXHDcIGyqMWrb3L8Sn13J+Uil87DNLh11WS8uzdUB6B/dNWhkDxsV
 +vxhwe9aZ24NFMS6yw13fUl7jNAxbzopvVtg2jeqm4MaBceDj8A+cjly8nqbdxv+kVjw
 CX8Wr/n6qvEIUefWSlLQx7UB1s+Po3uMv9vZU+uM8Nxc9q8GE7aJFVx/820aufXEItj8
 Mu1nSSNee4bTRDhv5GaFvr3qUtXosYJYpB0ciHsGVWLwDkqFhuX666vOjb5MgGwnpDcp
 fxGrx7ksb3DGkLwvBzoKIiSORmRP30DG2bJu0pGseISPXq9Zb7igAjVn8QfqTURRWa3r
 q+ag==
X-Gm-Message-State: AFqh2kq17ylQZ4fuvwEpvEqHhOVejQ2+4v3TKUgEmRyWK4z5K6oKsTKO
 RLBIIUS6kBKZqziYUIQoaiPnkw==
X-Google-Smtp-Source: AMrXdXvY1I9+V6lYnXjJHZ298O+1S7YjqX9rn/Bkf4N0/3GBJ+YzRcriOJEnzgP+J9jmaO0i2U6aRQ==
X-Received: by 2002:a05:6512:2356:b0:4cb:4416:1e7d with SMTP id
 p22-20020a056512235600b004cb44161e7dmr8500518lfu.48.1673240094995; 
 Sun, 08 Jan 2023 20:54:54 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 q24-20020a056512211800b004cb131751dcsm1408980lfr.158.2023.01.08.20.54.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 20:54:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Mon,  9 Jan 2023 06:54:53 +0200
Message-Id: <20230109045453.316089-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] dt-bindings: display/msm: qcom,
 mdss: fix HDMI PHY node names
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

On Qualcomm devices HDMI PHY node names were changed from hdmi-phy to
phy. Follow this change.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/msm/qcom,mdss.yaml          | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
index ba0460268731..7479cd96fdec 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
@@ -107,12 +107,6 @@ patternProperties:
           - qcom,dsi-phy-20nm
           - qcom,dsi-phy-28nm-hpm
           - qcom,dsi-phy-28nm-lp
-
-  "^hdmi-phy@[1-9a-f][0-9a-f]*$":
-    type: object
-    properties:
-      compatible:
-        enum:
           - qcom,hdmi-phy-8084
           - qcom,hdmi-phy-8660
           - qcom,hdmi-phy-8960
-- 
2.39.0

