Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6F8552660
	for <lists+freedreno@lfdr.de>; Mon, 20 Jun 2022 23:31:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90AC910F3BA;
	Mon, 20 Jun 2022 21:30:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52F4110F3AE
 for <freedreno@lists.freedesktop.org>; Mon, 20 Jun 2022 21:30:58 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id a29so19243293lfk.2
 for <freedreno@lists.freedesktop.org>; Mon, 20 Jun 2022 14:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j8/WOG9Lsdn9ThuiG2M5ftng7nETTq8B1iAmvxjeBug=;
 b=DMvnfxq233w/GmdsxpzV4vv8ETe0Ea4DP0HAWe9RzMJT0EW4BFw22LL2eRyoD4l8MX
 xoP4wld2PU/5dFRoPIE56XwLFVEw3OU7F5UlVcrYtElh4+oQRwGGVf7ONp+M9Qx9glcZ
 4LSDaCgaPoGEEqlbMqYG46iMzWa9sMyXl9gJscXoAA/KwxJ2CF21v6Ls8p5bQzC0QOZv
 0fZ5ehxz/1LDilzlOEgcUGT6UayaNUxIPYyLBolFnqpCojFnMIun6LUl2xR2737ZRPvy
 qa/V2D8Yl8UN/5VDaLQKYT36oO6vCW+WYKX7t0mWqra3LKPEQ/Plj2d+MqMfs67WdqtM
 81aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j8/WOG9Lsdn9ThuiG2M5ftng7nETTq8B1iAmvxjeBug=;
 b=Rh5Q3Lbgip/J7DhYCFEjW1hAFeFPiTXpu3Rhs5Igdv8QN46lqy+1pR6/OL375yRs8c
 E48iJh3DV50FZXvwhiPiFTkAybNrP8hQnFkw9f+wPPkDUbxTIOzobVZSFtG3LUbmxzTC
 PgcBZdmENLD7Y1cyxO4eifsYqkSnijy//Cfb7a5BF4QOjuBIUtco1FVNeYet2gGPvigu
 4pT9CYzD3en37sFmpXcReqt6LvZeUHSz6m+MavfNxDlVHkLF8ORn00rsr5xfX3yPityX
 4TmSAD5OCBU3WStSlXuB3Xox5QuqZiRyObZRb1pzsKYffYAK6ynr+X10c9UOPUCKQHfC
 ytDQ==
X-Gm-Message-State: AJIora/sUQfeTSX6vxahZcyWaV2IhU78XSpKIReoJet8JJnHMuE3WXgR
 1MiANbtYn0+9E98Ur3TYMsR5nQ==
X-Google-Smtp-Source: AGRyM1vGER7uc8+o7jLkwjr73U+Xk8bqIzgQ+EV3WTWt2dZ0kQRBft7p5LqNORhapHoi6vI89MmzKQ==
X-Received: by 2002:a05:6512:11cb:b0:47f:6906:6b94 with SMTP id
 h11-20020a05651211cb00b0047f69066b94mr5429172lfr.497.1655760656580; 
 Mon, 20 Jun 2022 14:30:56 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 l17-20020a2ea311000000b0025a681a7616sm838866lje.105.2022.06.20.14.30.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 14:30:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Tue, 21 Jun 2022 00:30:50 +0300
Message-Id: <20220620213054.1872954-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v1 0/4] drm/msm: move resource allocation to the
 _probe function
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

As discussed several times on IRC, move display subdriver resource
allocation from kms_init to probe time to let it bail early.

The first patch fixes an issue with drvdata and is probably a -fixes
material, but it is still included as a base for the rest of mdp5
changes.

Dmitry Baryshkov (4):
  drm/msm/mdp5: stop overriding drvdata
  drm/msm/dpu: move resource allocation to the _probe function
  drm/msm/mdp4: move resource allocation to the _probe function
  drm/msm/mdp5: move resource allocation to the _probe function

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  62 ++++++------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 107 ++++++++++-----------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 116 +++++++++++------------
 3 files changed, 137 insertions(+), 148 deletions(-)

-- 
2.35.1

