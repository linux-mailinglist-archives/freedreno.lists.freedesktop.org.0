Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E66435A0D31
	for <lists+freedreno@lfdr.de>; Thu, 25 Aug 2022 11:51:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B80CD11AC1F;
	Thu, 25 Aug 2022 09:51:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E3E5113412
 for <freedreno@lists.freedesktop.org>; Thu, 25 Aug 2022 09:51:14 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id x24so816128lji.9
 for <freedreno@lists.freedesktop.org>; Thu, 25 Aug 2022 02:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=DmWp0uy89TPiPu8UitGlfJ4fqSkdwaIvyUKOGTjMH64=;
 b=F+XB9cd63aY9IouNoB5Mm0wxVzYEXXc//IevbAgG1v+ccxUbKvSfYbaM2+KG2wZhJP
 EA+ttydRKnlkqqNLTFaw+PXRZzuN0yn/1ivj0iJzfUVsdFlwkVmHvnD3/pmet6tcv7Vu
 VUAHdrYgi5HlPYnI19akMIX86ty09/ZCe3Mh8S6dhHcvtBCOpkST6qpTqZFCWXBo38vl
 gJR85LSm5HsGL4KnYGiD2/SMxm7qNsawswh8etaTtJNaANp7RAk9zrcEm5oXMdKxTXEt
 fj4On0YzP1rgRVfV3uzwDdT3VAwbzEryzc5RvRjJJJzBudLcB69C8ts9r1Uig4cawZAO
 j6og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=DmWp0uy89TPiPu8UitGlfJ4fqSkdwaIvyUKOGTjMH64=;
 b=Ss+q2P9hGIdlN3rupBWx5kqZSORQdxTEcWj2PtXZlmfYZJzmsm02m19MHjIBwEscL3
 PeqR3aN1p9z8wiFjGvfjMQCFMz6TsKSFZBoEEo3iBbrxI18ItjkDmxrP3Fib09tlL3CL
 1xmGUU0jKALWaxF9l2MHlXn/0qR2xLlt7jjAYr3mbchWiHg2TWZXKrpWU3ph9Tq3HBre
 CmzsAze4wsBGY4yuNc8W1wPxD7nrsMnQ0P2HmXj76xk1+Q6XeryuQyjmGJT03X3kEJvt
 SpLs8Hq793VKUJq6PTxUJlNDwBK70qIodqdwKcMyfcIU0xsOf8dgh7uw1obrCxwEQGEQ
 Nqng==
X-Gm-Message-State: ACgBeo196Xb/iYHHET3oSLKVWbEpG67D8rtokpoOYnMzlygbfJtD/lJB
 zgNxXJkJdxW7Y+KDDn2D8hh3Yg==
X-Google-Smtp-Source: AA6agR6hyi4jQGGTPThz5bMq67PFnK9qnxRl0rMJwYMP8RA5+UGh7yGLAWfRmT/+N66e4+Li5MG7xA==
X-Received: by 2002:a2e:9e56:0:b0:261:7544:d79d with SMTP id
 g22-20020a2e9e56000000b002617544d79dmr917898ljk.296.1661421073687; 
 Thu, 25 Aug 2022 02:51:13 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 h10-20020a056512220a00b00492cfecf1c0sm398502lfu.245.2022.08.25.02.51.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 02:51:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Thu, 25 Aug 2022 12:51:02 +0300
Message-Id: <20220825095103.624891-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220825095103.624891-1-dmitry.baryshkov@linaro.org>
References: <20220825095103.624891-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 09/10] dt-bindings: display/msm/dpu-common:
 add opp-table property
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
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The display controller node can contain the opp-table describing its
frequencies and OPP levels. Allow specifying the opp-table in the DPU
devices.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dpu-common.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
index 14eda883e149..42e1616a5670 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
@@ -22,6 +22,9 @@ properties:
 
   operating-points-v2: true
 
+  opp-table:
+    type: object
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
     description: |
-- 
2.35.1

