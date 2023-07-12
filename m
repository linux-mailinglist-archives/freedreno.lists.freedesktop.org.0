Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDDC7507BF
	for <lists+freedreno@lfdr.de>; Wed, 12 Jul 2023 14:12:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 128A310E515;
	Wed, 12 Jul 2023 12:11:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A19610E4FF
 for <freedreno@lists.freedesktop.org>; Wed, 12 Jul 2023 12:11:50 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2b70bfc8db5so95903981fa.2
 for <freedreno@lists.freedesktop.org>; Wed, 12 Jul 2023 05:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689163907; x=1691755907;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xeo65L2NJAVXx3OSsVrW86rIAaQdgF7GM9jGTkSsIa0=;
 b=qIx+hFXzT4QUfv6gfdjTr20uOFXj7aSkZ8rt/Go/9qOK6dmFnmFK6nPI596wGQf61g
 qk2yii+ozX0XGNd4rsW2FlBLWeY41RvlHIUQkuztrAD2osxhq+pCFu631Jui0nTUO05I
 551RHHOHJfoldu5nxjLnh1/+Eusd+ugw2qOI8ZEuINhjM0NkV8vbkhzKlsqnEF3MlB0E
 vz3J5kW/JASwPbugVcZ7pYmlCMHlxwmXGolhYDV5tnQlx49sUbtCcBRghNxA+HiyzPI8
 BREhjwINwBIk8rtoigzUugMCM/FYcqOH81f6RMVVJhw4phXlGT71GidCdNv6eplCL4KW
 b6zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689163907; x=1691755907;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xeo65L2NJAVXx3OSsVrW86rIAaQdgF7GM9jGTkSsIa0=;
 b=AHuANqeAN2HLlxgwJGh3KHHkoXlAU/pMQ/LwMTo5BGwB6zkEkpo8k68NUnUcetx3Ar
 FQTSiwn+mOBe+TPtkKVijK9d+La+I5hNAETy72UBmWyjaeap+UVvu89e7fivRswSXJ8w
 1yBBcfXymgoai6b9OK+lYvvxaL7mlmw2ZRKVA2rn3Ydb+B2qyC7J6sxEVBHn3h0izOrM
 LwoLQ4iV/p63+eK73Nx3tGN3pT4bx5u3VY2APGQCHpK8vBDOvmpesbL7wUJScnmb1dOH
 Ylmllm8c7vEnR/n4ihJreSGG37KFIKaBQBEkGfGGaljdqmEAPRamxfeS9ZUJ7DC14Ui4
 4PgA==
X-Gm-Message-State: ABy/qLapqN9qvzMwXRFm1VXHcza7AhLYT0I+TcsveMdEYVjKtzoaCNma
 U6tRQra50814l2wkLaoNa3tR6g==
X-Google-Smtp-Source: APBJJlHX3LSxXbQZ7LzQgs1IgUmaguPDd0mcHEiDkITKFZIq0UxTRQm764sGwP/qVZFXV5DZp4MQ9w==
X-Received: by 2002:a2e:b0c7:0:b0:2b6:ec69:7c3b with SMTP id
 g7-20020a2eb0c7000000b002b6ec697c3bmr14812840ljl.46.1689163907276; 
 Wed, 12 Jul 2023 05:11:47 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 p14-20020a2ea40e000000b002b6c8cf48bfsm913135ljn.104.2023.07.12.05.11.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jul 2023 05:11:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Wed, 12 Jul 2023 15:11:38 +0300
Message-Id: <20230712121145.1994830-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230712121145.1994830-1-dmitry.baryshkov@linaro.org>
References: <20230712121145.1994830-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 1/8] dt-bindings: display/msm: Add reg bus
 and rotator interconnects
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

From: Konrad Dybcio <konrad.dybcio@linaro.org>

Apart from the already handled data bus (MAS_MDP_Pn<->DDR), there are
other connection paths:
- a path that connects rotator block to the DDR.
- a path that needs to be handled to ensure MDSS register access
  functions properly, namely the "reg bus", a.k.a the CPU-MDSS CFG
  interconnect.

Describe these paths bindings to allow using them in device trees and in
the driver

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/mdss-common.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
index ccd7d6417523..30a8aed4289a 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
@@ -66,12 +66,14 @@ properties:
     items:
       - description: Interconnect path from mdp0 (or a single mdp) port to the data bus
       - description: Interconnect path from mdp1 port to the data bus
+      - description: Interconnect path from CPU to the reg bus
 
   interconnect-names:
     minItems: 1
     items:
       - const: mdp0-mem
       - const: mdp1-mem
+      - const: cpu-cfg
 
   resets:
     items:
-- 
2.40.1

