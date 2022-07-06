Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E71568BBB
	for <lists+freedreno@lfdr.de>; Wed,  6 Jul 2022 16:52:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0850110F4AD;
	Wed,  6 Jul 2022 14:52:28 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7C5810F477
 for <freedreno@lists.freedesktop.org>; Wed,  6 Jul 2022 14:52:25 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id e12so26339109lfr.6
 for <freedreno@lists.freedesktop.org>; Wed, 06 Jul 2022 07:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6HBzK/l93JxPEmhI/JaroF5KDLT4SrwcSehWqsU43NQ=;
 b=t5eWjH/Dg2AmKlwx139MJxWOxq1jBDfwI9WMSF9SAsITjUshwwbKTHgMGW7RsPmUEL
 WRjlBA9lYI4N6n9cI/+G6qoCxwnaTGChhWReYDxD7o59MfrLVGgn4kS3kBzwT9QobPUi
 NvVWvkeRTBQrbidYucWeDo0DhaVmV/lpGwP/2gU6MGUM4NDGG4y3Wv5mlQvQLODFDGvR
 vAZlDgycFrQfRjJQBrk96/jBs8pBtl/1NHdKuqiXr7kTk0bs0HfVHUTEC9KW2v0BDt/R
 HzkrRibSmZ2PNYK6/kmlVaBdzaMO0cfX3unVdnk/qwtXt57GyYullp+GmdIhDdMiIAF3
 z7Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6HBzK/l93JxPEmhI/JaroF5KDLT4SrwcSehWqsU43NQ=;
 b=bxK4RmugOogu/MEdBUoSkdQe5S1cFiqYXZDZ1i518hnL9sZ0L63V56SBlm5uc2dK1k
 DZR41sbkTF1GCRwv3jgtBTTV48oZq72/bTNnK6aqbVPQ9Vx2E+vFNz/eqQkiukMD6tym
 al75AT3lXHec3oYlM4Izk+W1M+tv0ZYM7ZKOmzRI/DZQgSLbXd/54ZzXPuZ94Ics1B2J
 5Wjf76cst0snxHzpKk6IFZXMAB1gwMzlfyWlU/W6EW57/7NPN9Dk5rRaB2ucIGskBC44
 KAPIMdxDOn+H5kTr2irYoK2Lu2l4bYTUBqBc0ym09nqRygLdPTIzRcUwuOQod6hI3Vhy
 DaWA==
X-Gm-Message-State: AJIora92Y/uWYGQGEoLQ/bNWIcY0hMreLtiNaVUQ1Djk1HaqYXKS56ER
 bMG9fHxlPTDk7b1iVlMH9dnPfg==
X-Google-Smtp-Source: AGRyM1tFUXYXbeJILL9shHP73Zaabp7CJDJi2SC1ggS6bSdLsSQuPcyJ0S3/TA7y9BPw7jXiyAx3LA==
X-Received: by 2002:a05:6512:3a91:b0:47f:97fe:fa16 with SMTP id
 q17-20020a0565123a9100b0047f97fefa16mr25290467lfu.120.1657119144151; 
 Wed, 06 Jul 2022 07:52:24 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 v25-20020a056512049900b004855e979abcsm556617lfq.99.2022.07.06.07.52.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 07:52:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Wed,  6 Jul 2022 17:52:18 +0300
Message-Id: <20220706145222.1565238-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 0/4] dt-bindings: display/msm: schema fixes for
 gpu, gmu and mdp4
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

Fix several issues in MSM display schema.

Dmitry Baryshkov (4):
  dt-bindings: display/msm/gpu: allow specifying several IOMMU nodes
  dt-bindings: display/msm/gpu: document using the amd,imageon adreno
    too
  dt-bindings: display/msm/gmu: account for different GMU variants
  dt-bindings: display/msm/mdp4: require 4 IOMMUs

 .../devicetree/bindings/display/msm/gmu.yaml  | 166 +++++++++++++++---
 .../devicetree/bindings/display/msm/gpu.yaml  |   9 +-
 .../devicetree/bindings/display/msm/mdp4.yaml |   2 +-
 3 files changed, 155 insertions(+), 22 deletions(-)

-- 
2.35.1

