Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 155057507AA
	for <lists+freedreno@lfdr.de>; Wed, 12 Jul 2023 14:11:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE46310E4FF;
	Wed, 12 Jul 2023 12:11:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BCD410E501
 for <freedreno@lists.freedesktop.org>; Wed, 12 Jul 2023 12:11:50 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2b734aea34aso19722521fa.0
 for <freedreno@lists.freedesktop.org>; Wed, 12 Jul 2023 05:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689163906; x=1691755906;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3K3L1z6H/Jl14Mmz6QekO68wz73mQz13XTIjAHvmQqA=;
 b=VfOcQGXFNbLoNG983UM9HHP01DkcBXp/hPNXk78DCABNBrDBeu1ydogeBsb4rh3ZLV
 EMQtfpm83rlOYCWbb79fxeT7QwLQmPMUHmTCCv8M4ungyXPAi3kTun03fG2gtB2C6Zhr
 G8ADegoFsiRmOyAlfsndo9P6JGSjBJ8eDkbulDLi6stmR2Ta+LhMj+dEADhUkAwoNSNW
 9MbnZCwsfX0UpaQ2y/7p9jYLbFhF6LC0b/IJFJqMPm9Y2VwOBM5c3HC9Gcp1qsDw3xhZ
 GG4RAs2ZikHkCOfpVb6TTDl3tRcwEcIVbcIPr/zXxyhPL/HokQWKqjJilMZPALcOru0u
 Orsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689163906; x=1691755906;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3K3L1z6H/Jl14Mmz6QekO68wz73mQz13XTIjAHvmQqA=;
 b=N3qgDIpBkKlkkv8ssDKzAbBJ4ML74ZPvHMB4QhXqPn6LFr7m38GOaWWn/lysQMfe02
 ccmNRcBeaJMjqkPDmLsmVzQl4TUP05tWru2JM/BSScdIMK7xjTPClJPapu86EcXUaYg3
 p7SelfVrTSykbPECtrhrFFlRQZKOb+Ev5gI6GrucQowhHe+Z0ERs7Vw3udU8kCIlAeeP
 tOpqYGiTAYoO80LUIzxRPSFUn7a3njQ7NHzpgCNpU7HllOZZ0tpxW61vbjj5LA4PsHh3
 OKYVv7JXIYxxvbeMYDzdAwNzG7PsY9lWt2cJ2J4ur+iR0i1NxpB5SKkk5sZV+Rz7TJQQ
 Xczw==
X-Gm-Message-State: ABy/qLblv+dYmra2iesV19TO3rHVy6g2ruJhuVASQ6ISTN3/yOs7105D
 G5LOn0nvhXjW3QCYJLvEG9m/Rw==
X-Google-Smtp-Source: APBJJlFIvTTTpjP6vYotlLnUf/OtRjwWQVGnYkZgtEomA+mnUxdLIwbX/0a5xcbGFJmaK44tw6980A==
X-Received: by 2002:a2e:980b:0:b0:2b6:dc55:c3c7 with SMTP id
 a11-20020a2e980b000000b002b6dc55c3c7mr17011894ljj.20.1689163906493; 
 Wed, 12 Jul 2023 05:11:46 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 p14-20020a2ea40e000000b002b6c8cf48bfsm913135ljn.104.2023.07.12.05.11.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jul 2023 05:11:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Wed, 12 Jul 2023 15:11:37 +0300
Message-Id: <20230712121145.1994830-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 0/8] MDSS reg bus interconnect
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

Per agreement with Konrad, picked up this patch series.

Apart from the already handled data bus (MAS_MDP_Pn<->DDR), there's
another path that needs to be handled to ensure MDSS functions properly,
namely the "reg bus", a.k.a the CPU-MDSS interconnect.

Gating that path may have a variety of effects. from none to otherwise
inexplicable DSI timeouts.

This series tries to address the lack of that.

Changes since v1:
- Dropped the DPU part, the MDSS vote seems to be enough
- Reworked MDSS voting patch. Replaced static bw value with the
  per-platform confgurable values.
- Added sm8450 DT patch.

Dmitry Baryshkov (6):
  drm/msm/mdss: correct UBWC programming for SM8550
  drm/msm/mdss: switch mdss to use devm_of_icc_get()
  drm/msm/mdss: inline msm_mdss_icc_request_bw()
  drm/msm/mdss: populate missing data
  drm/msm/mdss: Handle the reg bus ICC path
  arm64: dts: qcom: sm8450: provide MDSS cfg interconnect

Konrad Dybcio (2):
  dt-bindings: display/msm: Add reg bus and rotator interconnects
  drm/msm/mdss: Rename path references to mdp_path

 .../bindings/display/msm/mdss-common.yaml     |   2 +
 arch/arm64/boot/dts/qcom/sm8450.dtsi          |   9 +-
 drivers/gpu/drm/msm/msm_mdss.c                | 138 +++++++++++++-----
 3 files changed, 108 insertions(+), 41 deletions(-)

-- 
2.40.1

