Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1CE41F34B
	for <lists+freedreno@lfdr.de>; Fri,  1 Oct 2021 19:42:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F2576EE77;
	Fri,  1 Oct 2021 17:42:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AA806EE78
 for <freedreno@lists.freedesktop.org>; Fri,  1 Oct 2021 17:42:15 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 o59-20020a9d2241000000b0054745f28c69so12415406ota.13
 for <freedreno@lists.freedesktop.org>; Fri, 01 Oct 2021 10:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=T4Pk/SKGcDml8g9kQfIFxWSgB1QkZnzEqcqoMDRtiFU=;
 b=VRR2kMxgmb9zJjO0qYX8lZqyUNeV+qdczrK/Y59b/4E3QvXYlZ0QNQ5xWsfIh6rK4H
 nD4pIRu9YpKAIAdKd4oIkEF5ff3HecWkEyDSfCgCzmipUezsGOpwt1SxEu3gQbyT0ESX
 nKFje9Tgi0BiW6/BVW4wLn1l4GLuvW2UMx7naANaAnWjU+st9NQKlnGP+yeh/ZWdSEG2
 kfk6c3KYIkOzZN4LkqhYvnfEu+uBHf/g74EKVcCHmv5Ghd/hqILcluFBIBM/RO8lFyFx
 ZMNd1UynGsc3QBwsehEFGtmj3RGwdff8DeSzbHhGQAV1ziSq/XR+ACZlKODvoO079f5N
 yg8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=T4Pk/SKGcDml8g9kQfIFxWSgB1QkZnzEqcqoMDRtiFU=;
 b=nrx64NEAivavzmqJMc++Fq0xbpmCFpT7xyEm1m+2h3JvYZxMJ5kKSk2r2BjJE2V2wC
 jE+U7HnDQP/lblf2/Sbtiv0noHyoywB21BAhDGeXkwvyjS2+j8BO7ucyll7uj9nQ/Scr
 jlq665X6Z1I8N4oElDT4bnooL/yG9PegVW63kwl7cVdAQ4NCNGclJTBB+5JegMjXIEsB
 HRkqXpJnT0qBT+43RCHNF3NlhfEfs56VeXqLfCfbmJkF+fRb3L0QeSutMiY6i4eTQXml
 KJ03E9iuwvTYQoxIxCFRmlzzCcCnNICaBNhzOsx+NF+oCFu6hyiybf9Wh9+CwpFTWrFW
 xlog==
X-Gm-Message-State: AOAM532aVx81u2NMShyv/xLHrjkBI7tAMO/9UUiMGkTjum1CN+DHNOut
 jak8kfA0tpKbO3wCYxK0XwKy7w==
X-Google-Smtp-Source: ABdhPJwsyNL/kZct1ui5XlNR0vlk5yVHdKEYNUXX7kt5RL34oCziPyKWeZrHRi9vLGJtc5+BkxMkzg==
X-Received: by 2002:a9d:6399:: with SMTP id w25mr11409273otk.53.1633110134535; 
 Fri, 01 Oct 2021 10:42:14 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id
 u15sm1369264oon.35.2021.10.01.10.42.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 10:42:14 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Kuogee Hsieh <khsieh@codeaurora.org>, Tanmay Shah <tanmay@codeaurora.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Fri,  1 Oct 2021 10:43:55 -0700
Message-Id: <20211001174400.981707-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 0/5] drm/msm/dp: Allow variation in register
 regions
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

It turns out that sc8180x (among others) doesn't have the same internal
layout of the 4 subblocks. This series therefor modifies the binding to
require all four regions to be described individually and then extends
the driver to read these four regions. The driver will fall back to read
the old single-reg format and apply the original offsets and sizes.

Bjorn Andersson (5):
  dt-bindings: msm/dp: Change reg definition
  drm/msm/dp: Use devres for ioremap()
  drm/msm/dp: Refactor ioremap wrapper
  drm/msm/dp: Store each subblock in the io region
  drm/msm/dp: Allow sub-regions to be specified in DT

 .../bindings/display/msm/dp-controller.yaml   |  13 ++-
 drivers/gpu/drm/msm/dp/dp_catalog.c           |  64 ++++-------
 drivers/gpu/drm/msm/dp/dp_parser.c            | 102 ++++++++++--------
 drivers/gpu/drm/msm/dp/dp_parser.h            |  11 +-
 4 files changed, 100 insertions(+), 90 deletions(-)

-- 
2.29.2

