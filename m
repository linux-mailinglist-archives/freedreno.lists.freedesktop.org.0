Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C186CF653
	for <lists+freedreno@lfdr.de>; Thu, 30 Mar 2023 00:25:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEFE510E1A4;
	Wed, 29 Mar 2023 22:25:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B80E610E1A7
 for <freedreno@lists.freedesktop.org>; Wed, 29 Mar 2023 22:25:03 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id g17so22158097lfv.4
 for <freedreno@lists.freedesktop.org>; Wed, 29 Mar 2023 15:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680128702;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B/Gpn4+VfV0wCWDJ0YpMb1Da+cHbqOuOEqeu7hzsijo=;
 b=nDADtY1MNhUxuY6EGjRKHWNhT2q7zQLaqK91ZE3RoXB5dqE+denbqh6V+w/pvDckIm
 ziA9uOqyFRqDctqvJ0yJQw5G79+ToeSVEm39pRsnzbyrR/LnQIcpwg5GCPEf/2qZItoi
 nrue8Rko7VdFUgdueiy+rgNwvp/HhA0IKFOjSeqS67GN/yAZfaJwfTlEp9AyAmGsqyTV
 ZyC/6AVStmyAVIpo4L38QUyCsZH6Y00erOKa4UCbc5oNxFIduWa85OGcn+7hNK7eTydm
 B+Dqyl+FYHELJE6ttVsFKjqPU8PvhGDysthng0zkvjYiI0brRx1lWgacCTi5z6gBhg1e
 EI4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680128702;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B/Gpn4+VfV0wCWDJ0YpMb1Da+cHbqOuOEqeu7hzsijo=;
 b=5bIIPbO9r72tadUbudtvUlpjkLrLSMSMGFh9bI3NIV6c3bbfAXiHq2yc7EBjpek4dK
 MpJHTJE+Ao4YKcFrJfetVbWZg/++XMuJ3T4mU+/bZ/TIDMBhn7IZfQJEWf0cjXOY9mv3
 +2rx1rb9HuIgCAF5MFpYotiUR7h/L23n3RRk9o5+Q0GxcgqE1ZxjYfMaftcH/Qfsd8jX
 mP5b2PdxM4xz9ZZFoh0tf/eBg5OtGyHWdkg3+1xklOhwjhZgSv9aFlFDf8l8uhHlXhOC
 GnjxMXq+Kuw1HihqFp6QIr7+yAylnt1yiEb1TX7yJ24Qai4ompw44AIOFMfAI2yei9+H
 iY7w==
X-Gm-Message-State: AAQBX9co/W+ST/EqJSQsKhQaWtIvMpzAa0QfG+PSotH6dAPi3TmvhSmh
 9bRnN3R0p6GGwyojbpy3xsldNw==
X-Google-Smtp-Source: AKy350aKz0eSaRFpT7uZkTxnfGftY4OCRs6FePvYdaJqqR04XYMczWlf18G1+The6TPPmvj8l+u+vQ==
X-Received: by 2002:ac2:51cc:0:b0:4cc:a107:4227 with SMTP id
 u12-20020ac251cc000000b004cca1074227mr1131212lfm.22.1680128701854; 
 Wed, 29 Mar 2023 15:25:01 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 y26-20020ac255ba000000b004e9b307d2c8sm4724226lfg.238.2023.03.29.15.25.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 15:25:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Thu, 30 Mar 2023 01:24:58 +0300
Message-Id: <20230329222500.1131836-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230329222500.1131836-1-dmitry.baryshkov@linaro.org>
References: <20230329222500.1131836-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PATCH 1/3] dt-bindings: display/msm/gpu: allow
 specifying MX domain A5xx
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

Some a5xx Adreno devices might need additional power domains to handle
voltage scaling. While we do not (yet) have support for CPR3 providing
voltage scaling, allow specifying MX domain to scale the memory cell
voltage.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index d4191cca71fb..4dc1f6b2cdbf 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -78,7 +78,14 @@ properties:
     type: object
 
   power-domains:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
+
+  power-domain-names:
+    items:
+      - const: gx
+      - const: mx
+    minItems: 1
 
   zap-shader:
     type: object
-- 
2.39.2

