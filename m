Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8645F66BD04
	for <lists+freedreno@lfdr.de>; Mon, 16 Jan 2023 12:41:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C14310E3E5;
	Mon, 16 Jan 2023 11:41:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D49810E3D5
 for <freedreno@lists.freedesktop.org>; Mon, 16 Jan 2023 11:41:05 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id a37so3824098ljq.0
 for <freedreno@lists.freedesktop.org>; Mon, 16 Jan 2023 03:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bAzr3WbepHH/Xzw3XY7+Qyd2EYJHyzok2hFrIPSgsi8=;
 b=W3zFXG1CifPHncC3axUe9wXlorA4Z55HvPebPUfGeJXpgJbQG8XOEJ2h45A4eVBHip
 0x3+QEX/JBeZ+DrmbqnDk/x3ml+kmr6FtH3LaOmTW33IWrqGzAiglQPnb+Yie7+nKhoN
 6fEiQyWktJLR+nOFWggMUDK7agb2Xl71a62ZqaR1iCrgB2bS/3FLRHYFzDTIhwNE7z3z
 YTcO/GJihhOH8sFe7/4I1opzLrgzykmByosB9J5fGr2Zv4JWr88NVN+OulPziFYGFNMj
 izYkzknOqcKf2bSeEJx7EH5rewbX6ildpqYws+7JXUsPvCVobu0WGNJo6mAOawsWE4nN
 ArnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bAzr3WbepHH/Xzw3XY7+Qyd2EYJHyzok2hFrIPSgsi8=;
 b=8KQu8FDACnLT6j4r2n3LuwVIaBf8YZ0KS8hIBP0H7y4ZaxXqAx5ke7d73ZMPdlnBMn
 L58LsUVDKJUEhZTWPWI4Crl5xijsdtyoBUm73WvKmN6KYqEhtXoNkpdCvnuyRa3EWnCe
 JV6qrc0WF8A36kyE8aJz4Fo+TmKr62nb4ZP24Sw07m5Yrj19hEjeU26nnC/cS/f1z1wx
 lAKWc278MV0mEd49ucqYpFNFqy2/EEsvZThJTARjNL+4QVgrzj0UNoPsI63Q02gbHLIY
 5YM9oPXWuKrrns1voKk9oO7y0FxO2fqFNhYWnb0B9oc3w7sC0DlWfYCenDpPL2exJZW9
 GogA==
X-Gm-Message-State: AFqh2krRCD3k4B9euY8lBrCxEk2sCCN4qztOPkwBrdAoQLwprAcABqmJ
 x6F831GKGFovMWog6fUlUtQLuQ==
X-Google-Smtp-Source: AMrXdXuyo8z+lpPJjrE3F6tFchQ8Fr0hXF7Q1C6orut7naGETw7CiURB4lbO1OBvqDWT2nI+dH35AA==
X-Received: by 2002:a05:651c:1992:b0:27f:b2cf:85a0 with SMTP id
 bx18-20020a05651c199200b0027fb2cf85a0mr28139431ljb.43.1673869263688; 
 Mon, 16 Jan 2023 03:41:03 -0800 (PST)
Received: from localhost.localdomain (abym53.neoplus.adsl.tpnet.pl.
 [83.9.32.53]) by smtp.gmail.com with ESMTPSA id
 k10-20020a05651c10aa00b0027fb9e64bd0sm918946ljn.86.2023.01.16.03.41.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 03:41:03 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Date: Mon, 16 Jan 2023 12:40:58 +0100
Message-Id: <20230116114059.346327-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 1/2] dt-bindings: display/msm: Add SM6375 DSI PHY
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
Cc: freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>, devicetree@vger.kernel.org,
 David Airlie <airlied@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

SM6375 has a single 7nm DSI PHY. Document it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index 78ab8c410ccd..9c9184f94c44 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -18,6 +18,7 @@ properties:
       - qcom,dsi-phy-7nm
       - qcom,dsi-phy-7nm-8150
       - qcom,sc7280-dsi-phy-7nm
+      - qcom,sm6375-dsi-phy-7nm
       - qcom,sm8350-dsi-phy-5nm
       - qcom,sm8450-dsi-phy-5nm
       - qcom,sm8550-dsi-phy-4nm
-- 
2.39.0

