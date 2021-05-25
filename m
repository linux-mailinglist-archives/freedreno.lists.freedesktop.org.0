Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C748A3901D8
	for <lists+freedreno@lfdr.de>; Tue, 25 May 2021 15:13:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73F08899D6;
	Tue, 25 May 2021 13:13:20 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8BC3899D6
 for <freedreno@lists.freedesktop.org>; Tue, 25 May 2021 13:13:19 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id q1so3584256lfo.3
 for <freedreno@lists.freedesktop.org>; Tue, 25 May 2021 06:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hJL+Uzw/r0kzj1iQLltCJOxsq9P55CtDFAUVNl5JQjU=;
 b=PfYI/8d1lZPks+9Vdpgd1k8YHa1+KvlIPpcZ3yQ+xjYNtdtld4C7r0gSjZQ+5QCy75
 jWF26RjNKZneKVFOPPsskK+1lUWUyaMarlLt4oFCXeXYymdq7JKGfys5DOid1wx6lPzq
 OwnhV9PNkI6NXLRlUmA1EClF0uMJkDtE2UcBt2+2p7xEv/AOs9s2DUrqOhnYT1rdNwSg
 INicbcOgJLfEkPRxv8GHZVxVOdmspYuKjXvKzPdsiu2k+wAedNwuIjglAaXL11EAcZVa
 +Qr2MPNx/xkW3i+GnkLJTQnzP6iZAjDpYT4nsUw/Qge+YQJrGlNJbHJcP1N6Omm03JSZ
 Xm6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hJL+Uzw/r0kzj1iQLltCJOxsq9P55CtDFAUVNl5JQjU=;
 b=o0cWMbdLGJ9Kw0L1ZY09iEz3hpZA/+lbbxjxzWzR0BccEIoVJDUD+6F1/g3/UDgkRH
 KrLAXRbqVg8WdLEkTqFPlammUU+93CEtHN+13MUom60lwicWwEFYSaCsQmI5S01VgN0r
 uVVuMtTzI8E4xQJcbpbIPc9hY7i7LibpeYC3TcuLKfBNR3vrNbHANhT2o+Y1fM2F6xpg
 MKhcCxv6KTO1ZYXPoJ//B4FFDXtLc53HldlaeN/JNSundzBBN+HQ8hmZtKih/NFy3wHs
 Jnif2BrjqKLqW5T9dNNoOTA7Ri4pBsFVk2YctbapxmrYcg7x27RBR5lTLJAjoDhJWoRi
 nMgg==
X-Gm-Message-State: AOAM531YxkPxXEC+tvMq4qrxexJVjN1IQygV/jU0C2ebdmDKT6LDQLCK
 fWU7SDdE1IuVnKx5JBICBgmn/g==
X-Google-Smtp-Source: ABdhPJyLqqm8SZ2+GAzB/vRBl3YPCvaDaU9DFYRtpQJr62LEnKvMf8pXwgoXO2ZS17zZvgKdfCLa5g==
X-Received: by 2002:ac2:50da:: with SMTP id h26mr1845382lfm.390.1621948398298; 
 Tue, 25 May 2021 06:13:18 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id t20sm2101108lji.53.2021.05.25.06.13.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 06:13:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Date: Tue, 25 May 2021 16:13:09 +0300
Message-Id: <20210525131316.3117809-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 0/7] drm/msm/mdp5: add properties and bandwidth
 management
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Update MDP5 display driver to support current implementation of
alpha/blend mode/zpos properties. On top of that port bandwidth
management from DPU display driver.

The following changes since commit 8dbde399044b0f5acf704ab5f8116bd8b1dfcf95:

  drm/msm/dp: handle irq_hpd with sink_count = 0 correctly (2021-05-24 16:08:33 -0700)

are available in the Git repository at:

  https://git.linaro.org/people/dmitry.baryshkov/kernel.git mdp5-update

for you to fetch changes up to 501c3f8c40e139d97b17240e0a5492a12b6c722d:

  drm/msm/mdp5: provide dynamic bandwidth management (2021-05-25 16:10:17 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (6):
      drm/msm/mdp5: use drm atomic helpers to handle base drm plane state
      drm/msm/mdp5: use drm_plane_state for storing alpha value
      drm/msm/mdp5: use drm_plane_state for pixel blend mode
      drm/msm/mdp5: add support for alpha/blend_mode properties
      drm/msm/mdp5: switch to standard zpos property
      drm/msm/mdp5: provide dynamic bandwidth management

James Willcox (1):
      drm/msm/mdp5: add perf blocks for holding fudge factors

 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c   |  35 ++++++
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h   |   7 ++
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c  |  56 ++++++++-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c   | 119 +++++++++++++------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h   |  17 ++-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 177 ++++++++++-------------------
 6 files changed, 249 insertions(+), 162 deletions(-)


_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
