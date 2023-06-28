Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A415741667
	for <lists+freedreno@lfdr.de>; Wed, 28 Jun 2023 18:30:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BE3E10E382;
	Wed, 28 Jun 2023 16:29:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D98210E37B
 for <freedreno@lists.freedesktop.org>; Wed, 28 Jun 2023 16:29:55 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4fafe87c6fbso6187910e87.3
 for <freedreno@lists.freedesktop.org>; Wed, 28 Jun 2023 09:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687969793; x=1690561793;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9eMvEkJ/XegETFODHiz62mk7KCxYtx3hl5+l1ieaHBA=;
 b=M2eG9b/rwLJbJ+ZYensGn99Z3sahqkhwgsICE+uWcaeCOhsMZixj0R91WrZhWHqvcT
 n077rgit6FDUr5nM+sZR6cA1yP9+24oT3o4DzuvO5+NGFm2ZSHsfTWKQSmmq2ClZweEH
 KU0lHXDJObPPbiBqKhxzrEB2ZPPFI8it67dn8IqsxVpiJmTQKFanRhkpwsx3UmQuQV6P
 FN0/+23yrw/BmMu+s+bAodxLNjgUYIK6dwYMMOG3TsEfZ5zhdfnvcisUm26xEq+oBd6v
 SElLQ5rIRNneoicmeE1ikfUOSowdZa11gUYoCWgqZo6j/h6BHzPhG0Fh1tzyJAUjIspc
 lUWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687969793; x=1690561793;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9eMvEkJ/XegETFODHiz62mk7KCxYtx3hl5+l1ieaHBA=;
 b=JgouT6QqfL4o5AYI1pAZW+3qkbD96yRHuJaeVbHCMI3astGDUUonIcO6memKbBrGyD
 5ZYXK5hYMpjPXJRylI9tH3mT7Y4n9ohTFvC7Lub8fZgvMFzC9hglxPd6SY7vgtrlmf41
 LHgaqZcKkL1Pc+vgVKVjNW+MhI32DQXIvvf2GrW9905+qK/B2I8aWj5nXXjTxgXeI466
 9KkwBvTfp6IMiMFcL21DrMUUhMHYcmcgsWIQsPpFqGSOhqwvzIe2PIdF8CxdB1xPi/fr
 oFCnuhKEStclAB10e5TOwQbhwmYkuiltQn020JpLswtEUXwYphNg1tHuAh4zIcyNCQod
 6jLQ==
X-Gm-Message-State: AC+VfDxnjekEdk9BPXlKuFTU7vUPVixSe3kntGdvrXbHO0j2w0qUozVC
 WiyU8oFx7tDzL9slFt61QPNYYw==
X-Google-Smtp-Source: ACHHUZ51B3mrrRAOt7s7WF2oHJ0SQg/cpfsp3d3HETCr5iBgITcho1tWvUElbupu3H1F3zZdBZLC2g==
X-Received: by 2002:a05:6512:2024:b0:4f9:dac6:2f41 with SMTP id
 s4-20020a056512202400b004f9dac62f41mr6940702lfs.2.1687969792904; 
 Wed, 28 Jun 2023 09:29:52 -0700 (PDT)
Received: from [192.168.1.101] (abyk82.neoplus.adsl.tpnet.pl. [83.9.30.82])
 by smtp.gmail.com with ESMTPSA id
 v28-20020a056512049c00b004faeedbb29dsm1678783lfq.64.2023.06.28.09.29.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jun 2023 09:29:52 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 28 Jun 2023 18:29:47 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230628-topic-refgen-v1-3-126e59573eeb@linaro.org>
References: <20230628-topic-refgen-v1-0-126e59573eeb@linaro.org>
In-Reply-To: <20230628-topic-refgen-v1-0-126e59573eeb@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687969785; l=919;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=PSg1b4zAMPXvW/Hco4OyLK9NQz9E7zBcyA/3he+DDzs=;
 b=+OPEQNKdq4VxxdpETYujbLytJ4CfZJo5uT5nocAXxJ+Eyh9ZqgvBwYThV/7U27B/FHOT38/Me
 IiuUpQ7aMsjCNHKV40ETBzW3EwM7J1JB/Vf8qqxL5H0O4LwU2c1qKah
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH 3/4] dt-bindings: display/msm:
 dsi-controller-main: Allow refgen-supply
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Konrad Dybcio <konradybcio@kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

DSI host needs REFGEN to be enabled (if it's present on a given platform).
Allow consuming it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 01848bdd5873..76270992305a 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -166,6 +166,10 @@ properties:
     description:
       Phandle to vdd regulator device node
 
+  refgen-supply:
+    description:
+      Phandle to REFGEN regulator device node
+
   vcca-supply:
     description:
       Phandle to vdd regulator device node

-- 
2.41.0

