Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7039D79F9E2
	for <lists+freedreno@lfdr.de>; Thu, 14 Sep 2023 07:07:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B20C810E50B;
	Thu, 14 Sep 2023 05:07:31 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD37110E50B
 for <freedreno@lists.freedesktop.org>; Thu, 14 Sep 2023 05:07:29 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-9ad8bf9bfabso70150266b.3
 for <freedreno@lists.freedesktop.org>; Wed, 13 Sep 2023 22:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694668048; x=1695272848; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/FDKM0kqt8x0UbxVfV3bjcjIyAdF1y2yMeGqfjlTgnI=;
 b=PHtODBl4oagIf+hSXAMFtFo4uqAP1wVTzIk+3USutvDNSwFxrbg03yQDVVqWo010s5
 WpaUMTwMhdshXi6B00qRXyBn11MHPhAF3wSPt7zzZ/t3lLR90h9fcXJCY6kWdeeeKY46
 5Opz4JYDmzD84Mu/+p3asRz6VylJTJu31EAuRFcwkcXf0N0rEGFZSmDOd3ZcmTnpQ2Tv
 ufCJmIMuS+v3mHr9YF38MWF4hrgsT9xQTpqdvCbIUXBOg0Gbut2QZROl1m9f8ndE3cYj
 cljmEax3Xt4ibSinY3tFcj+/02V0DYAhA+PACKnKaREbTdS2Jm3MqOVxkLJhnRlDRPlS
 p+Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694668048; x=1695272848;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/FDKM0kqt8x0UbxVfV3bjcjIyAdF1y2yMeGqfjlTgnI=;
 b=fGS/TZg/qQ9P1XmITfGF6gcGkZWBRrYH/e6LUVaRTIPkdhpSOa0B5oNQeLUMloAwYe
 mU3PMDHRp4B9ueaqRHdZfNcpCEx+Txm7qLdVtJz/PO0HIkgn00WkI3r6nfbZve+wZYSO
 fig1y783NuEA0SqTmWnatecIwlR/HN+9+wC1qbFxSglHWEfynOrMNln4zoYFaGlEdMTe
 w1f0LC0dJnnY+1wRBbxWKMzQDmQ0lRLQV5HCzaT6V8T2qWBrs8nwpLz5Iq6o+z3kd3kn
 VOg4pQCQGp5tH8TaxwnHpx5p1EmEjFuLKwopaq61L6UoagFdu+LMnpLDm3PjLfBGYlPP
 CI7Q==
X-Gm-Message-State: AOJu0Yx5m0MmTc4xXdv4X079njWNytOSEGrkg8yN9kw0h+wywWRrOtFq
 XAYXinXMBETa9o0SNGjm0zwg7Ll10WfgmL+3qGk=
X-Google-Smtp-Source: AGHT+IHtMHUUYGm+veS7ba1V0nWBgHsVD++J4m55U2tdtgdIV/FDoAJGB8Y/p4NrroeH4BC5sdNsBw==
X-Received: by 2002:a2e:9791:0:b0:2bc:c557:848a with SMTP id
 y17-20020a2e9791000000b002bcc557848amr3834635lji.50.1694668027841; 
 Wed, 13 Sep 2023 22:07:07 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a2e978f000000b002bce38190a3sm124777lji.34.2023.09.13.22.07.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Sep 2023 22:07:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Thu, 14 Sep 2023 08:06:54 +0300
Message-Id: <20230914050706.1058620-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 00/12] drm/msm/dpu: support virtual wide
 planes
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

As promised in the basic wide planes support ([1]) here comes a series
supporting 2*max_linewidth for all the planes.

Note: Unlike v1 and v2 this series finally includes support for
additional planes - having more planes than the number of SSPP blocks.

Note: this iteration features handling of rotation and reflection of the
wide plane. However rot90 is still not tested: it is enabled on sc7280
and it only supports UBWC (tiled) framebuffers, it was quite low on my
priority list.

[1] https://patchwork.freedesktop.org/series/99909/

Changes since v2:
- Dropped the encoder-related parts, leave all resource allocation as is
  (Abhinav)
- Significantly reworked the SSPP allocation code
- Added debugging code to dump RM state in dri/N/state

Changes since v1:
- Fixed build error due to me missing one of fixups, it was left
  uncommitted.
- Implementated proper handling of wide plane rotation & reflection.

Dmitry Baryshkov (12):
  drm/atomic-helper: split not-scaling part of
    drm_atomic_helper_check_plane_state
  drm/msm/dpu: add current resource allocation to dumped state
  drm/msm/dpu: take plane rotation into account for wide planes
  drm/msm/dpu: move pstate->pipe initialization to
    dpu_plane_atomic_check
  drm/msm/dpu: split dpu_plane_atomic_check()
  drm/msm/dpu: move rot90 checking to dpu_plane_atomic_check_pipe()
  drm/msm/dpu: add support for virtual planes
  drm/msm/dpu: allow using two SSPP blocks for a single plane
  drm/msm/dpu: allow sharing SSPP between planes
  drm/msm/dpu: create additional virtual planes
  drm/msm/dpu: allow sharing of blending stages
  drm/msm/dpu: include SSPP allocation state into the dumped state

 drivers/gpu/drm/drm_atomic_helper.c         | 110 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  59 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  26 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |   6 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 671 ++++++++++++++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h   |  29 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 130 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |  36 ++
 include/drm/drm_atomic_helper.h             |   7 +
 10 files changed, 924 insertions(+), 152 deletions(-)

-- 
2.39.2

