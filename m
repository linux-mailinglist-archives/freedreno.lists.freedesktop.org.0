Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1346C7B58
	for <lists+freedreno@lfdr.de>; Fri, 24 Mar 2023 10:29:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D51B10EBAB;
	Fri, 24 Mar 2023 09:28:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C28410EBA5
 for <freedreno@lists.freedesktop.org>; Fri, 24 Mar 2023 09:28:53 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 r19-20020a05600c459300b003eb3e2a5e7bso547539wmo.0
 for <freedreno@lists.freedesktop.org>; Fri, 24 Mar 2023 02:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679650132;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rm2CqI1B2hHOJ8Hl9EI4NwacgguNWTWv0kuPmfPl+UI=;
 b=t284nf1k9sv2iMsS86WPPjUxEiH7BfXG4hgg1nU4y34toO5vT/a29fpKktjfH8TRsX
 WKS6kJIznte2assEdru4gLMRsF3SWOdyLZVAPvXs43YUPEJ6n/F3NeWexEsAsRSwLrjw
 yUe0h3iuWuWqj/y+rA/I6HWd8vBmb0mOTGWWwN4mJBYJW4HB6pZNgUEubzJjcRK3VcDd
 iO6F6pGXhkfM8SABVu1qJyxt6EVoCVNfLUy6euuvpGLWqWgVRN60CyjxP2KyXqqYLg5m
 w0cnrdp2AZ/VPL9p0K2LTKSn0J6qztMZzMMnWlY3wkduF9xXg2lB1uQz9pWgTv7ClySz
 PlFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679650132;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rm2CqI1B2hHOJ8Hl9EI4NwacgguNWTWv0kuPmfPl+UI=;
 b=ZXpGUcvv4szM+nh03cNb4YVN20fh458e5YWjw79VGr9oBKRdhHrNjbX6EYW5poHnkU
 xUDGdFKdqCRGqiC+E3OaYnY2j+3WmsX5rC0hSJ1uH6R08f7sar+DRdZIG6JKB3HqKhfa
 y3+Y5vlMXT0gxW3UTL2isz5D8FgO1+vo//QtfCqEAwzOCP/LmaFtcszWNKOmeBHXvc2Z
 1DpiMEOguREiWhFgGRgmnkF3RCMSV7L9t5/pNTgvLOwe/oghihaAYfZswkYf+ZbGICuS
 JpinrVDTfDpOWGjDapKRZTjbpJiWiuls63kbRuXONPj5pwucbJWFoGnhFu5GT7zfSD68
 Bsqw==
X-Gm-Message-State: AO0yUKW5FvOhAHtI49XAoCis8CdeaQ5T2l1E1vWSGYumTw1RoEOHZRtq
 PZi4OePEZwAVfW/3diXgS6hJxw==
X-Google-Smtp-Source: AK7set/KO0ZKtP+ZNvxHzZXCh5+l/McQL+zEOhxzhknt4p1EcpvbrKTkz/jkNtk7LgYtfkCuZ5V61A==
X-Received: by 2002:a05:600c:28b:b0:3ed:5cf7:3080 with SMTP id
 11-20020a05600c028b00b003ed5cf73080mr1917189wmk.5.1679650131787; 
 Fri, 24 Mar 2023 02:28:51 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 v14-20020adfe28e000000b002c5a790e959sm18029980wri.19.2023.03.24.02.28.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Mar 2023 02:28:51 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 24 Mar 2023 10:28:47 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v2-2-0ca1bea1a843@linaro.org>
References: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v2-0-0ca1bea1a843@linaro.org>
In-Reply-To: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v2-0-0ca1bea1a843@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
Subject: [Freedreno] [PATCH v2 2/4] arm64: dts: qcom: sm8450: remove invalid
 properties in cluster-sleep nodes
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Fixes the following DT bindings check error:
domain-idle-states: cluster-sleep-0: 'idle-state-name', 'local-timer-stop' do not match any of the regexes:
'pinctrl-[0-9]+'
domain-idle-states: cluster-sleep-1: 'idle-state-name', 'local-timer-stop' do not match any of the regexes:
'pinctrl-[0-9]+'

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 78fb65bd15cc..ff55fcfdd676 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -255,22 +255,18 @@ BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
 		domain-idle-states {
 			CLUSTER_SLEEP_0: cluster-sleep-0 {
 				compatible = "domain-idle-state";
-				idle-state-name = "cluster-l3-off";
 				arm,psci-suspend-param = <0x41000044>;
 				entry-latency-us = <1050>;
 				exit-latency-us = <2500>;
 				min-residency-us = <5309>;
-				local-timer-stop;
 			};
 
 			CLUSTER_SLEEP_1: cluster-sleep-1 {
 				compatible = "domain-idle-state";
-				idle-state-name = "cluster-power-collapse";
 				arm,psci-suspend-param = <0x4100c344>;
 				entry-latency-us = <2700>;
 				exit-latency-us = <3500>;
 				min-residency-us = <13959>;
-				local-timer-stop;
 			};
 		};
 	};

-- 
2.34.1

