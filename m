Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB9C6E4D34
	for <lists+freedreno@lfdr.de>; Mon, 17 Apr 2023 17:30:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE78710E413;
	Mon, 17 Apr 2023 15:30:28 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF7B310E40A
 for <freedreno@lists.freedesktop.org>; Mon, 17 Apr 2023 15:30:26 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4eca19c3430so1570992e87.1
 for <freedreno@lists.freedesktop.org>; Mon, 17 Apr 2023 08:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681745425; x=1684337425;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=I90y/7rpQhg6YUQFfZTZY2uS59Y2M6cbexfqSajHymg=;
 b=cBdpYIQkmpBvQcA19uIxq8DIzIxn/YHqxAMe1ne3kE4qr5osry4Gxa8uc/YU7f4e8H
 S3g+89G0OXAuHXlLKUiP1L8xZzouy8FdyNpZUmNgtPB8nIgLaVJCLC+KIFh+EmgUBt1N
 sgtKTVvjuTfE0WBHT13nOf7oS9lpsjQGwK5j5ELzlowcRw97jlAndrI8NM9NIrtGnpGn
 RKzilb9+cIshO0gMSlceyHLK86vpxKa53i9rpRll0DxL2IKO9ZvD3O203PX64qfMLYE+
 lfzaFStRSfG+fcSL8415DWD5SYr9shlSGKeBw1TRFUWenH2QmiaTp6o8EUmiiZh+W0WY
 x7Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681745425; x=1684337425;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I90y/7rpQhg6YUQFfZTZY2uS59Y2M6cbexfqSajHymg=;
 b=Keu8BimVN1eJcUeLx32B+tvWDxXKm9n/SBsH3/e+nIPoFu5ulIGJzZ5FOuW4KC9aTi
 1VKaM33KQmlkl9hitgjCgblfNhH/fy1n474kCU6R1sB0bZVgie7S1TK072ccdZTN1rHH
 UqMlZlJMPTHDJLt53TFfrllR/FBr0rRC2UGqbs+L+641b3/dFFYUK7ugvsDx2gk7SDz/
 XM+HvbuNxVidgabwc2+GUdlM2iLzCUEDCRxNhostzqmWK6rMTBZN6favgHfDad+ubfdg
 pRJuZiXvXVaFnuvM8D3qBdTtqyVYISn6cWhrqge/p+/k7ZDxZ8MuSmYZXBu/shBgLJdy
 +zeA==
X-Gm-Message-State: AAQBX9e5vJtfw/41H5VoPcYDlCnQBBqx2/okoujUecQYR8zh7dryXKhz
 v1mBf5O1Cz+wuVRCeHFu6GQ0yw==
X-Google-Smtp-Source: AKy350YrBMiWQVD3rFcIp7nOl3eyAywpZ94NVeCMQMqSAtmVv0NwGkthpYow6QZrcREILnpPqcp/7Q==
X-Received: by 2002:a19:5518:0:b0:4ec:8362:1880 with SMTP id
 n24-20020a195518000000b004ec83621880mr2506141lfe.48.1681745425060; 
 Mon, 17 Apr 2023 08:30:25 -0700 (PDT)
Received: from [192.168.1.101] (abyk99.neoplus.adsl.tpnet.pl. [83.9.30.99])
 by smtp.gmail.com with ESMTPSA id
 b16-20020ac25e90000000b004ec8a3d4200sm2053439lfq.293.2023.04.17.08.30.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 08:30:24 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 17 Apr 2023 17:30:15 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230417-topic-dpu_regbus-v1-1-06fbdc1643c0@linaro.org>
References: <20230417-topic-dpu_regbus-v1-0-06fbdc1643c0@linaro.org>
In-Reply-To: <20230417-topic-dpu_regbus-v1-0-06fbdc1643c0@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681745422; l=1021;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=DgEhAwck/2UMFZpU98hoIh71vdQR9UmmeTw0XAyM3ys=;
 b=ciJNKHjiF7ITdMqgyQfJ5T8aGhSzJ7QpX1an0grzifZiCGiobk7sJ7VxHrZq7Ks1lDIevGYZ2Ppn
 gZhM6RO4AVtKPj9aTKdLen85YbNGGGyEr8b2giju+qcxUh69exFG
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH 1/5] dt-bindings: display/msm: Add reg bus
 interconnect
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
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Apart from the already handled data bus (MAS_MDP_Pn<->DDR), there's
another path that needs to be handled to ensure MDSS functions properly,
namely the "reg bus", a.k.a the CPU-MDSS interconnect.

Gating that path may have a variety of effects.. from none to otherwise
inexplicable DSI timeouts..

Describe it in bindings to allow for use in device trees.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/mdss-common.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
index ccd7d6417523..9eb5b6d3e0b9 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
@@ -72,6 +72,7 @@ properties:
     items:
       - const: mdp0-mem
       - const: mdp1-mem
+      - const: cpu-cfg
 
   resets:
     items:

-- 
2.40.0

