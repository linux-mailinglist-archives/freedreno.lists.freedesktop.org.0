Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E01708DCA
	for <lists+freedreno@lfdr.de>; Fri, 19 May 2023 04:30:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BF7110E5A1;
	Fri, 19 May 2023 02:30:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30D8110E59F
 for <freedreno@lists.freedesktop.org>; Fri, 19 May 2023 02:30:15 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2ab3e8f4efeso4129551fa.0
 for <freedreno@lists.freedesktop.org>; Thu, 18 May 2023 19:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684463413; x=1687055413;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pj9i7TSBfCmQXvwdyG14BdtYQitwst+9y3+gcByW2D4=;
 b=NuwG2uPjamA6Yx0vJDLArcowBr4ZoSpGnYB9+jv/JCan6gx5QKwaE00loNgAjwRn2F
 H4yW+W96CcshJkTqxQavCiJ3qm8F0d1tlBoODob+MTYdazhASYurCy5uWpksGA4CXkbu
 CKjFtHRIdedDmJxfVK22AAydMOmDO6ouswHNJ03TZSWXJ8+xUHy6bSG4fsqVLYNx/S5y
 LsYQtUCH/H1cZXkQ0NptXtqJKbp1ZLW5dMTt1rvfhv93VD935e6snE7mf1W4rhzqwqjI
 Aok5kdiSP2FZt/HsnYL+1ZdqyNgUKTo2wTCnmIQC7CZjdQFV39uiJmhHEfPU8Ah0RLVS
 RwkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684463413; x=1687055413;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pj9i7TSBfCmQXvwdyG14BdtYQitwst+9y3+gcByW2D4=;
 b=R3EhYm6D1D5pkb1ynieso4yNN1fH+xKob1EUBhP7euFgbUtODTAGc+l0XnAJ38rxq6
 f0ze4nlkAbEYssqcUGoB1v82bd7Vt09Tk4xIxrfSkXjiuWsqFJ3MmK83ozHJ4kc1hDD+
 9GRvdzWzoPq/5xIG+8Qu7JtNVBn4fCiGk99OuDFfsaEi5sk9K6J3Hhlv7Chx2BOB3p3p
 9LPUwWcmQAnFZlQdNJyp5dBEOjxy0w4p22sK9F6LE8UhFBSbCNJn8lrVvbr5jUGDT4DF
 +AwUt0/2kuiNZC2Vqbjqi+iwJagfPqAMstrzMPwOo0IcjOnNmyFpHkb0e2mOpIFEtxBF
 xbHQ==
X-Gm-Message-State: AC+VfDzknL5pDcu1xIR/ema5qdlTjXs/HXkSA4HtauFVZmmTygfL9H5B
 WYJX1Ez6A2+KqV3RYJBuYzIA0g==
X-Google-Smtp-Source: ACHHUZ4oeJ5J16LVLCVISH6GDvEJK/vLNpUO437sEPnP1IpDfHiUbChHlbnBXJhiN3q9XOGwc7ugzQ==
X-Received: by 2002:a05:651c:33a:b0:2a8:ea26:5c72 with SMTP id
 b26-20020a05651c033a00b002a8ea265c72mr94875ljp.8.1684463413315; 
 Thu, 18 May 2023 19:30:13 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a2e9d10000000b002aa3ad9014asm573709lji.54.2023.05.18.19.30.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 May 2023 19:30:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Fri, 19 May 2023 05:30:09 +0300
Message-Id: <20230519023011.3837868-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 0/2] drm/msm/dpu: remove
 dpu_encoder_phys_ops::atomic_check()
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The writeback backend of the dpu_encoder is the only user of the
dpu_encoder_phys_ops::atomic_check() callback. Move corresponding code
to the DPU's drm_writeback_connector implementation (dpu_writeback.c)
and drop corresponding callback code.

Dependency chanin:
- https://patchwork.freedesktop.org/series/116851/
- https://patchwork.freedesktop.org/series/116615/
- https://patchwork.freedesktop.org/series/117148/
- https://patchwork.freedesktop.org/series/116530/
- https://patchwork.freedesktop.org/series/117150/

Dmitry Baryshkov (2):
  drm/msm/dpu: move writeback's atomic_check to dpu_writeback.c
  drm/msm/dpu: drop dpu_encoder_phys_ops::atomic_check()

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 15 -----
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  4 --
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 54 ------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 57 ++++++++++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h |  3 +-
 6 files changed, 60 insertions(+), 77 deletions(-)

-- 
2.39.2

