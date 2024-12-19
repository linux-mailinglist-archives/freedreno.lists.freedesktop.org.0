Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB199F760E
	for <lists+freedreno@lfdr.de>; Thu, 19 Dec 2024 08:49:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F8210EC9E;
	Thu, 19 Dec 2024 07:49:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bnTbg/pU";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BE6E10EC97
 for <freedreno@lists.freedesktop.org>; Thu, 19 Dec 2024 07:49:33 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-218c80a97caso4466005ad.0
 for <freedreno@lists.freedesktop.org>; Wed, 18 Dec 2024 23:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734594573; x=1735199373; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2/Mxxt7JQ84hYIkD870zHq5o1qoiTTZ87YF88ScgcDE=;
 b=bnTbg/pUS6XILHqOE91FOMoYJicxsfoDwYME+55kwyliPuEq5uvoIlgIT97OEEdN0Q
 Xt9yR/CMwe9gGsDV58umpc2AW9zDixd1F0+18mf/fJrWJF32/sW0SGyJMQ/I+XqauYtX
 rsfIqBTYgqLexEmmtGrorBEAzViUWCbhhQsfYxUklQ7z3TC8PpmQwJGGlyJ8dG0V9Yw5
 ZhjN9z2+isnmHbHi/E68xk+EmI3M8T2jMhgqfh+MWFdhsXKZJZFblnkkAIT8Qf88lhMB
 wu5So8DhLjYJUiX7hwHlKRUXz195yBQnN3DQhfgRtOPiB/Vj9LSJpmhJtNEnIFhjxg1r
 u6Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734594573; x=1735199373;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2/Mxxt7JQ84hYIkD870zHq5o1qoiTTZ87YF88ScgcDE=;
 b=r2bkrd+r3fBaobb7Mr9pCk2VwfF1byFM5iyBBz5MVTTTKy8E9L15bST3ir9zwMxhhf
 ENN2ZW+tEOW2fGRLP1xvvnJpDo88It6wgUyXibJjA0u5vzxdyknH+2KCLf446fH10AX4
 kCjrVOb8ACR+hotTDcm95D0fiEn+WQRbSValpHU1j3w2fmk9eJqnllAMPbODnp/QLwVR
 MfhFW9ylGusKPm58TIQSr6rd7/+fVs9Td5mevQ0oJwFJUzEZO4afCzqcTkiWtaFBHZMi
 CauSTxO9yBwbHIR7vPC8yV6zio7AlxUgL8io/uWA2+z2jyLxsgwcbY0nfoK1swJHTlHB
 pKUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWixcC2u9/BO35mqiTJ8e0mqfE7iBaaknFEJF7TezTBaGM+tciSYCOvt5+sbKdKP1n8RxphevwaePY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzD1NV8/Edu+Hmq4JCxOvAlzKFn/+rzCIFo4LpJso1hpz0m+5qq
 1u4zkrrELjCA4T2QZ0U5qQZv/QhN/DKJ/Vopi1HtUiWRM9DCRT9lPN58bl4isapJbH1IguIBdff
 h8XQK8g==
X-Gm-Gg: ASbGncu2BPfnCcqCBAbkWgrDz0IDrCBm+FDftm38KpNOGCNeKsj4UgwqeZcu7Bkgfn8
 PHMAJ1AruvfsFg1n1nrUA4bFnavIKDUhX+jTDItF6aaYWjQ7DrAXH9ai8MBD64Qumk2cMKWhz2V
 TlApgGG1F63u/4F8d0W+vUqhHndiVf9EfVJ52IzKQ4peVzqcAc+eNz2FJ/skf3AbdZEwVD5rYwI
 TqVhssrA8YOFLNXbLL8h/77ex39+ZQ6UzJSijP9WU8WAym1V0k+WA==
X-Google-Smtp-Source: AGHT+IEh8MiBuiAY+wfmZGe08P3F4Y76Bzu8LbffXNv+nNHhutAo7IXQzLoeGJyZkYO8Cv/crpJlpA==
X-Received: by 2002:a17:902:f549:b0:216:2259:a4bd with SMTP id
 d9443c01a7336-218d726bd64mr84564155ad.52.1734594572962; 
 Wed, 18 Dec 2024 23:49:32 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-219dc97432dsm6784445ad.110.2024.12.18.23.49.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 23:49:32 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Subject: [PATCH v3 00/15] (no cover subject)
Date: Thu, 19 Dec 2024 15:49:18 +0800
Message-Id: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP7PY2cC/x3NQQ6CMBBG4auQWfsndCpEvYphUZhBGlPEjhATw
 t1tXH6b93YyzVGNbtVOWbdo8TUX+FNFwxTmhyJKMXHNZ8fuCkuXtqmxtXAeUxKIDs+QBUnM8F6
 DYF3skzUkeAb30g/MY+O8oxJdso7x+x/eu+P4AUg3yg6AAAAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734594567; l=4394;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=zN5HnqTuUFbHWN2xmfhJlV9TJeBXDkMJL6nQoOxSw4A=;
 b=ow/wPrSYS0qN3Mb0AB6k1A3Gr8FCtLxfXa9/nNNTJRV7O0G9MFIp9FwyVun43XY23cyRuP5kH
 4xgdrFzNsEOAycx9wyYhTTOQq+M+zz2BkBFU/R566Iq8PIh722sWL6b
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
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

To: Rob Clark <robdclark@gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sean Paul <sean@poorly.run>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
drm/msm/dpu: Support quad pipe with dual-DSI

2 or more SSPPs and dual-DSI interface are need for super wide DSI panel.
And 4 DSC are preferred for power optimal in this case. This patch set
extend number of pipes to 4 and revise related mixer blending logic
to support quad pipe.  All these changes depends on the virtual plane
feature to split a super wide drm plane horizontally into 2 or more sub
clip. Thus DMA of multiple SSPPs can share the effort of fetching the
whole drm plane.

The first pipe pair co-work with the first mixer pair to cover the left
half of screen and 2nd pair of pipes and mixers are for the right half
of screen. If a plane is only for the right half of screen, only one
or two of pipes in the 2nd pipe pair are valid, and no SSPP or mixer is
assinged for invalid pipe.

For those panel that does not require quad-pipe, only 1 or 2 pipes in
the 1st pipe pair will be used. There is no concept of right half of
screen.

For legacy non virtual plane mode, the first 1 or 2 pipes are used for
the single SSPP and its multi-rect mode.

This patch set depends on virtual plane patch set v7:
https://lore.kernel.org/all/20241130-dpu-virtual-wide-v7-0-991053fcf63c@linaro.org/

Changes in v3:
- Split change in trace into a separate patch.
- Rebase to latest msm-next branch.
- Reorder patch sequence to make sure valid flag is set in earlier patch
- Rectify rewrite patch to move logic change into other patch
- Polish commit messages and code comments.
- Link to v2: https://lore.kernel.org/dri-devel/20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org/

Changes in v2:
- Revise the patch sequence with changing to 2 pipes topology first. Then
  prepare for quad-pipe setup, then enable quad-pipe at last.
- Split DSI patches into other patch set.
- Link to v1: https://lore.kernel.org/all/20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org/

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
Jun Nie (15):
      drm/msm/dpu: Do not fix number of DSC
      drm/msm/dpu: configure DSC per number in use
      drm/msm/dpu: polish log for resource allocation
      drm/msm/dpu: decide right side per last bit
      drm/msm/dpu: fix mixer number counter on allocation
      drm/msm/dpu: switch RM to use crtc_id rather than enc_id for allocation
      drm/msm/dpu: bind correct pingpong for quad pipe
      drm/msm/dpu: handle pipes as array
      drm/msm/dpu: split PIPES_PER_STAGE definition per plane and mixer
      drm/msm/dpu: Add pipe as trace argument
      drm/msm/dpu: blend pipes per mixer pairs config
      drm/msm/dpu: support plane splitting in quad-pipe case
      drm/msm/dpu: Support quad-pipe in SSPP checking
      drm/msm/dpu: support SSPP assignment for quad-pipe case
      drm/msm/dpu: Enable quad-pipe for DSC and dual-DSI case

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         |  77 +++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      |  74 +++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h      |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h          |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c        | 403 ++++++++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h        |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c           | 219 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h           |  32 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h        |  10 +-
 13 files changed, 511 insertions(+), 348 deletions(-)
---
base-commit: a9b9ea7b45d661fff0f3fd2937703a536f528cd2
change-id: 20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-2bdbc22f5131

Best regards,
-- 
Jun Nie <jun.nie@linaro.org>

