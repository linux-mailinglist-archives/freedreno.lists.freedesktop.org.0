Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 220D16711D5
	for <lists+freedreno@lfdr.de>; Wed, 18 Jan 2023 04:24:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A52910E65B;
	Wed, 18 Jan 2023 03:24:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3694A10E65B
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jan 2023 03:24:38 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id ss4so72816250ejb.11
 for <freedreno@lists.freedesktop.org>; Tue, 17 Jan 2023 19:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9yOjPuQ6CEkm3Nq/ELehGQzsBDNAjM68X5nkPgdMs5Q=;
 b=g3c7+YQ1EJM8IKsNmfUYFSKpFtYbB6qR5Hz1eQVcCd1Mzr92XRCWFcVn5fABo0YWFd
 EOaaXaYDC+2NCV/Vmy45wyOiliod8czwMG4riNyZYBsmk4fkZ9qUaMsNmoBiLzN/MTkD
 edXihRbsu3i6mKV3f/R04TTMgXqsiiT329B06VKrhB44euEmQjGoqv+q48CVt1XOF/UI
 cSKMUKtCut/znSfu24UF85I26jOEmvQ2cTGDzLv+/xNLJ8JOzYXHJAWBQsopR36lJ+Ep
 MuYtUVMLBZGrXC3GV1rZCSRM7uqyvpgczZtSrFNT2rhWwEl5q5w06YJQTDOun7j/29F/
 PH1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9yOjPuQ6CEkm3Nq/ELehGQzsBDNAjM68X5nkPgdMs5Q=;
 b=gvnDuw6Xu2q5FtDxTot8YuxDRWwbYF7z9GAntII/oNTaHus+U/2ng8X0PYHbZG/kLQ
 DLPjHYagEL7ECJpZOBU8b5L5CkXFd3Num/KAs+0qXRS0I0l7H/nZcdK5Svmsx6vjqv5A
 5dDP8G4Jz6GLteTTfqe+3pglmo7GvcsoggrMo6dvHawscll+KYPyCh0d+/qhDyn679V7
 xnsEdof9MU7/cFGGgkqOC5P9v6mBXVUMuWIKGPgXjUUdDtcklpN+7Pleni9ujMkIc94X
 j4gGawJ+EsLDtUWZAwl0n1pcu92LeT6YG0R2HQHJvc5ynwhlvOUTD8NMeZ26vdxwL36k
 QqiQ==
X-Gm-Message-State: AFqh2koWDcpK3bsZ/CxVEhG8FUZBQ15qWUqpcpEKTSXwRSw476q8By7A
 1G3PxEDkMZtT0vNVa6pi7dTUEQ==
X-Google-Smtp-Source: AMrXdXssA/hakgWZgE4naeoB9z6EdLSKoJlaGcpYJydyzu2fjfgzgYxcL5zYzluE0+bh2eahd/J99g==
X-Received: by 2002:a17:907:8d18:b0:7c0:d6b6:1ee9 with SMTP id
 tc24-20020a1709078d1800b007c0d6b61ee9mr5948982ejc.11.1674012276788; 
 Tue, 17 Jan 2023 19:24:36 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 f11-20020a056402194b00b0048eb0886b00sm4713829edz.42.2023.01.17.19.24.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 19:24:36 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Wed, 18 Jan 2023 05:24:30 +0200
Message-Id: <20230118032432.1716616-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118032432.1716616-1-dmitry.baryshkov@linaro.org>
References: <20230118032432.1716616-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 2/4] dt-bindings: display/msm:
 dsi-controller-main: account for apq8064
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

APQ8064 requires listing four clocks in the assigned-clocks /
assigned-clock-parents properties. Account for that.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dsi-controller-main.yaml         | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index b07bdddc1570..357036470b1f 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -83,12 +83,16 @@ properties:
       2 DSI links.
 
   assigned-clocks:
-    maxItems: 2
+    minItems: 2
+    maxItems: 4
     description: |
       Parents of "byte" and "pixel" for the given platform.
+      For DSIv2 platforms this should contain "byte", "esc", "src" and
+      "pixel_src" clocks.
 
   assigned-clock-parents:
-    maxItems: 2
+    minItems: 2
+    maxItems: 4
     description: |
       The Byte clock and Pixel clock PLL outputs provided by a DSI PHY block.
 
-- 
2.39.0

