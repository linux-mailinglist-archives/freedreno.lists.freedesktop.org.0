Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D12F6196E2
	for <lists+freedreno@lfdr.de>; Fri,  4 Nov 2022 14:03:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29FBA10E759;
	Fri,  4 Nov 2022 13:03:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A6C510E751
 for <freedreno@lists.freedesktop.org>; Fri,  4 Nov 2022 13:03:31 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id g12so7334009lfh.3
 for <freedreno@lists.freedesktop.org>; Fri, 04 Nov 2022 06:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QNrknjkwY6y7Nl2U9FfGOLqpO7+QERv2EXshAod3N+Q=;
 b=v0heW5S1Jn7iGCMqNDKVJf4qL/DJ0z8sJTh8IzmLrHaihk3vKDUNoB78z+Mgpv/GSI
 Ac7k/2QGz4IolW3GBdEogZxSURhotEJv1fazJHDzNpY29loarznugYLVjKNyW6v36oxC
 vquTkWKlonhinXx1gZlSAP2B5N3ckALJsMr76Jn0VrfKbLpQgzWCyfNZEniiOG6rvnPK
 m607J6LCHYRrQFcL7FXS3j7eGjdf2MgpN8PdbnEC9Xd43uRBvvy0tIv2dLy47NdWyXiJ
 DRUjiFyt8GJdN11lMXOrzaX+eg493NMWvdnNsDkJ7h5ADmju930sIZMDoOYy/FRzoYyN
 f0Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QNrknjkwY6y7Nl2U9FfGOLqpO7+QERv2EXshAod3N+Q=;
 b=zBoPzznAxaMjv6JucoeCVAjvy0iVNA/ARotPhlu+mdIJ9UwWKflpb8VhJStrKZS7TP
 ZdgfNH0/dfNirhJ3VQ6tKWxXISCzERuNYGpMVqcPLfRJYq7rLy/fnOo/PSgZKlePYciS
 k3/QG3+fGl+bYrTliAjXar0xIeQaObyoaYqn2zqHSZFGWpWLRYQjNLForrO3A5pKou1g
 umUtRkjbTuWvv08oVuXOjy63Bmxv8zON0i8/Or1EKlg2YKJVdKMhlm5VjheFycoCXjh1
 Y/Libp++aptn4+NAgYhYxmJ4j8q3N49cyISrZcmBbgnQ2SOSYFuwxt4WGXRk9Aq3sItz
 sq/Q==
X-Gm-Message-State: ACrzQf0yNXtfmyVuEblKiEbJ5Sr+O83tIAeG0bZZKsEjcdh/eNfxo07l
 0jzPwApnPVlZGCpz1GlRVdY4+g==
X-Google-Smtp-Source: AMsMyM4OhY9/soUr3/Yu6/mBlVo1w6eYUp/ojteavHzsT/k8xoq6igsCEFJ2PP/9/dtHSu6sdgKLZA==
X-Received: by 2002:ac2:4c0f:0:b0:4af:e7d3:e97d with SMTP id
 t15-20020ac24c0f000000b004afe7d3e97dmr12943317lfq.467.1667567009346; 
 Fri, 04 Nov 2022 06:03:29 -0700 (PDT)
Received: from localhost.localdomain ([195.165.23.90])
 by smtp.gmail.com with ESMTPSA id
 s6-20020a2eb626000000b0026fe0a052c5sm419975ljn.129.2022.11.04.06.03.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 06:03:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Fri,  4 Nov 2022 16:03:17 +0300
Message-Id: <20221104130324.1024242-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221104130324.1024242-1-dmitry.baryshkov@linaro.org>
References: <20221104130324.1024242-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 1/8] dt-bindings:
 display/msm/dsi-controller-main: allow defining opp-table
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Allow defining DSI OPP table inside the DSI controller node.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml   | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 3b609c19e0bc..c37dd9503da0 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -80,6 +80,9 @@ properties:
 
   operating-points-v2: true
 
+  opp-table:
+    type: object
+
   ports:
     $ref: "/schemas/graph.yaml#/properties/ports"
     description: |
-- 
2.35.1

