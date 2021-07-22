Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8213D1BDC
	for <lists+freedreno@lfdr.de>; Thu, 22 Jul 2021 04:44:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AC856EE96;
	Thu, 22 Jul 2021 02:44:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [IPv6:2607:f8b0:4864:20::c2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A07466EE94
 for <freedreno@lists.freedesktop.org>; Thu, 22 Jul 2021 02:44:11 +0000 (UTC)
Received: by mail-oo1-xc2e.google.com with SMTP id
 u13-20020a4ad0cd0000b02902638ef0f883so1014207oor.11
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jul 2021 19:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XOa5JGP/QaB36txylGv/8WA29Kpuziv0aJWiro9yf5M=;
 b=MdLMOtJG6blCFS9ZTH8S0B80YLCo+rjEFclH0ZS6wgaH36oW9KyEsV2io3pQh229QB
 Hg4275E0wMP8ec8vDpevFb0ibQgPKNiuYJYuf6cyZmpPJbOi8xP8QKcN2Xhg7fucV2u1
 XqA3sdsMV8N90YS2v+ZffQzjj59QXMtLT7OxtZ7UoEa0eHYL9UnqsJ4zXdXDfBx2vu4e
 6EGKV54M1Lpk7UOuR11x51iQ+n4sBYVX8a2nhsXB8ta3/QLWrwDStzmU7IJiHw599gb0
 KC+gTtmlYTYTvdcjp4jFox22COV4JYsQm9JD+zie7nTBbi3S4BDxbBQjJuyM44GF/hZ1
 ljzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XOa5JGP/QaB36txylGv/8WA29Kpuziv0aJWiro9yf5M=;
 b=rB3Wc8hqGMkIHJRu93PfTbeZpuH2BG4AGRuc7Vwu/Zed/T2Lxp2xkssw03TaoOaTqK
 mpO6I15lACU1QJAKS3jzu/ieKL88B07bk8RMnsx93zoF0xyBTILqX4P7UwbzOsDnUeh1
 ntB8Tjtzv5oONMKj+zkR/dOlIZ9GcNJrJUdGM3FA2YZYKSJgRrs1S3GMmTgCPZpucjvV
 Off03dGXiIKxgWDFDAcJ0NarwxZbv7uj2SR+ZtsMm54+xraPMGMynD3eZjaPkKXGxuEI
 4+aoCRTTiTRRmgOeY7qePwL7/Y2w8VVaTQwjkt00O+3Xjj3zr4+Ye8kVqPd9TTAGvke4
 5NTg==
X-Gm-Message-State: AOAM533iYh4YyNonHYkeiEg6DqFL/GvaWbGddE7aduBc3VUbM0ijOemS
 sLmPgRdu3z8z+ywDUwRXg31mKw==
X-Google-Smtp-Source: ABdhPJz2HYRl1Cim/GV648ggH+HYACL81Wpb3DNsLrReG79jvZfQmMU9JrGlmcKDwyeOs4OG9u2MIg==
X-Received: by 2002:a4a:4fca:: with SMTP id c193mr25835012oob.33.1626921850910; 
 Wed, 21 Jul 2021 19:44:10 -0700 (PDT)
Received: from localhost.localdomain
 (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id u18sm5346519oif.9.2021.07.21.19.44.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 19:44:10 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Date: Wed, 21 Jul 2021 19:42:22 -0700
Message-Id: <20210722024227.3313096-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 0/5] drm/msm/dp: Allow variation in register
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <khsieh@codeaurora.org>, Tanmay Shah <tanmay@codeaurora.org>,
 freedreno@lists.freedesktop.org, Chandan Uddaraju <chandanu@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

It turns out that sc8180x (among others) doesn't have the same internal layout
of the 4 subblocks. This series therefor modifies the binding to require all
four regions to be described individually and then extends the driver to read
these four regions. The driver will fall back to read the old single-reg format
and apply the original offsets and sizes.

Bjorn Andersson (5):
  dt-bindings: msm/dp: Change reg definition
  drm/msm/dp: Use devres for ioremap()
  drm/msm/dp: Refactor ioremap wrapper
  drm/msm/dp: Store each subblock in the io region
  drm/msm/dp: Allow sub-regions to be specified in DT

 .../bindings/display/msm/dp-controller.yaml   |  11 +-
 drivers/gpu/drm/msm/dp/dp_catalog.c           |  64 ++++-------
 drivers/gpu/drm/msm/dp/dp_parser.c            | 102 +++++++++++-------
 drivers/gpu/drm/msm/dp/dp_parser.h            |  10 +-
 4 files changed, 102 insertions(+), 85 deletions(-)

-- 
2.29.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
