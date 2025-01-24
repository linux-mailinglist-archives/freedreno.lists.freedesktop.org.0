Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C41E4A1B474
	for <lists+freedreno@lfdr.de>; Fri, 24 Jan 2025 12:14:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FAC010E7C3;
	Fri, 24 Jan 2025 11:14:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zRSzF3q6";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40CC310E7E6
 for <freedreno@lists.freedesktop.org>; Fri, 24 Jan 2025 11:14:33 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-30762598511so20340321fa.0
 for <freedreno@lists.freedesktop.org>; Fri, 24 Jan 2025 03:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737717271; x=1738322071; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LyCh2co2HvzF8YB4tTCIA3m8yb9tduYDWXQJRjTUkgU=;
 b=zRSzF3q6YP2eusQOeesQE45ddlRgt3hIUa9tg0QImrobJunfAVSUS+Fr++tGtxvhDx
 HGF8Q3NRUceGRc/WrzKXQ/7d+M0K6FnxWBqIhFkvWLr4c7yCMreaXDwEtPYj4cpkWveo
 qtbVdLYr3jo6a3jHgBNPjuPV+nVu263T+hU5XHqtipZEEE8wb331D1B+T2/2DMamRuL+
 UADkvK2FO5bPAq9DA9RlRD1ohIWysvF5hOmIFa5q9t7xhLKeqCh0zV/Umu33il6liZ1J
 kjVnYAE1eLzMOzpyeE06Yx9wc7DnUCDtpzQFmCLvk0rG6CCP8alG7IgDOzImzg/zz9s4
 AFkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737717271; x=1738322071;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LyCh2co2HvzF8YB4tTCIA3m8yb9tduYDWXQJRjTUkgU=;
 b=nV1mIH5Q2debY4r7rpjcqQ26Wie2wpUlw4HOocbzyfnzPGhmxAc8ascswUT6tU/Vvc
 ztQ6BRMX5mMp/F12paKUQT67anfDT+2rc2LXZ+Of+tBvduW1vmticz/BzZF3FFG7ACjH
 fkzmmSyto7k7UT9hUDm2tHeAmm9OwG1ZGfllANKiNQ/t91rAeoZrEZ0qvYKGC9ew78pH
 frF5/Uc2l6s3d+OGg2Ep8Ifq6151MJ1jMNS3WAyPRE7zcfU9YWfS2G/MdxJFJJD2RFb7
 KhapnvtvFHHHAdepA+BrCxxPRNVGYO2P16s2QCI40CX6KHeib15UpehqRVm4GGza4ZZn
 G9Eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0kty3VciWnTk9TWd28wsuSmeUO4UshJHImDuMX2twQHjSsywaX0SHJ9FigGE31abcGUFNOyEiBHg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3oRNgxlNtUgs3M4xiLOMx9E1IKkOnyQmlgnya6vaAWXaJLcqS
 Kj92kf44xs59XJ/h2I/x8NFO4P9l3gO7qD+bDPA7u0M3lSZ8Sm89p2nj6i1smxk=
X-Gm-Gg: ASbGncuMEcMy3+rxdP+MiKhumj0A7xzW87ZGyNnEyx9+5+zxrEOqNgq46TOd/Onyojl
 kdHSptDlaoVnCoUJJc0rlCw3P/lpVsa0jBwnla8K7ARvDkzTnEGGhSjfORWzeXknwEa3c2YX0kG
 /WNRNo2CVXwb6d9d4gbcjSRNG7c/azJIu8tZBWDT4x+6Xqnhq5JbghbHiebT7638FG/B/H3fE+E
 U10aXeijZRNBxY1c3FPM/rEgD8zf1Ff9qxapkHwUnfuhUGwYa3ow8q517DgwvtbNkxzJ2WzNvCa
 74AS4k0rUTlV
X-Google-Smtp-Source: AGHT+IFoNbxUK/2G34MFyhMrdJfvS1tCcfDhoh+IuspqzwkrE0uCkVu1DBJS2Mcfjmd/yuee9uL1Uw==
X-Received: by 2002:a05:651c:221f:b0:302:34da:ac30 with SMTP id
 38308e7fff4ca-3072caa0b37mr132017841fa.18.1737717271258; 
 Fri, 24 Jan 2025 03:14:31 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3076bacba5esm3289701fa.36.2025.01.24.03.14.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 03:14:30 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/6] drm: introduce atomic_needs_modeset() callbacks
Date: Fri, 24 Jan 2025 13:14:18 +0200
Message-Id: <20250124-atomic-needs-modeset-v1-0-b0c05c9eda0f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAp2k2cC/02O0Q6CMAxFf2Xps4tQUHC/YngYW9E+jOk2CYbw7
 06J0bee5vb0LhApMEVQYoFAE0f2Y4ZyJ8Bc9XghyTYzYIGHosRK6uQdGzkS2SidtxQpyXY46hb
 rSldDA/n0Fmjg+aM9dxsHuj+yPW1L6HUkabxznJSwwUnH0ey/Q9bPCf47KJEb1CUiynfIckjP3
 /u2aE69xUbTUU0I3bq+AB/3PmvZAAAA
X-Change-ID: 20250123-atomic-needs-modeset-8f6a8243a3f7
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Airlie <airlied@redhat.com>, Jocelyn Falempe <jfalempe@redhat.com>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Kalyan Thota <quic_kalyant@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Simona Vetter <simona.vetter@ffwll.ch>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2722;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=OpiIQKhcNoT2pcXvUCeespOUMvgnpvQ7UQxxU9Ketjc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnk3YUy/SptSSxfa7unzJaW4XkVKCxp42DKSXo+
 H/zIR+fvTWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ5N2FAAKCRCLPIo+Aiko
 1RqjB/9hik2csnpKagfc4l6vaAEGXHOlJSRo3+qbDo95PTdip6kPT1+hisOnFKBhiKB8i+qCewy
 mmSuvtgx3t8Wcw7R3U5uwZlKWYp0rUIK2oHhjvTUBHrzYry/qk6tcFv4lt+n/ELOIvVXCFFqC3w
 xaHRjujTQ72+JqlND6FYo5paMDxND6aEeLpr41RDRQbJOMhcPDszRAQlrG+cC4mxrZzALUZP/Lj
 ljU236y6HOi9DET+sDuBGKdgwwGR1SFp3uVv6EYg5PS6A808SbAMQ4EPfDL+JANnLjC31ZQp6AW
 9MPA5C6mhlxxJCCQXI4Iu8szZb/Pkjf58pIZLVPm8GF+3aAg
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

There are several drivers which attempt to upgrading the commit to the
full mode set from their per-object atomic_check() callbacks without
calling the drm_atomic_helper_check_modeset() or
drm_atomic_helper_check() again (as requested by those functions).

As discussed on IRC, add separate atomic_needs_modeset() callbacks,
whose only purpose is to allow the plane, connector, encoder or CRTC to
specify that for whatever reasons corresponding CRTC should undergo a
full modeset. The helpers will call these callbacks in a proper place,
adding affected objects and calling required functions as required.

The MSM patches depend on the msm-next tree and the series at [1]. The
plan is to land core changes through drm-misc, then merge drm-misc-next
into msm-next and merge remaining msm-specific patches through the
msm-next tree.

[1] https://lore.kernel.org/dri-devel/20250123-drm-dirty-modeset-v2-0-bbfd3a6cd1a4@linaro.org/

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (6):
      drm/atomic-helper: add atomic_needs_modeset callbacks
      drm/mgag200: move format check to drm_plane_helper.atomic_needs_modeset
      drm/msm/dpu: stop upgrading commits by enabling allow_modeset
      drm/msm/dpu: move CTM check to drm_crtc_helper.atomic_needs_modeset
      drm/msm/dpu: use atomic_needs_modeset for CDM check
      drm/msm: drop msm_atomic_check wrapper

 drivers/gpu/drm/drm_atomic_helper.c         | 59 ++++++++++++++++++
 drivers/gpu/drm/mgag200/mgag200_drv.h       |  2 +
 drivers/gpu/drm/mgag200/mgag200_mode.c      | 27 ++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 15 +++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 44 +++++++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 26 --------
 drivers/gpu/drm/msm/msm_atomic.c            | 29 ---------
 drivers/gpu/drm/msm/msm_drv.h               |  1 -
 drivers/gpu/drm/msm/msm_kms.c               |  2 +-
 drivers/gpu/drm/msm/msm_kms.h               |  7 ---
 include/drm/drm_modeset_helper_vtables.h    | 92 +++++++++++++++++++++++++++++
 12 files changed, 219 insertions(+), 89 deletions(-)
---
base-commit: 0936f0e54426177b0f0263ddf806ed5e13487db6
change-id: 20250123-atomic-needs-modeset-8f6a8243a3f7
prerequisite-change-id: 20241222-drm-dirty-modeset-88079bd27ae6:v2
prerequisite-patch-id: 0c61aabfcd13651203f476985380cbf4d3c299e6
prerequisite-patch-id: c6026f08011c288fd301676e9fa6f46d0cc1dab7
prerequisite-patch-id: b0cb06d5c88791d6e4755d879ced0d5050aa3cbf
prerequisite-patch-id: fd72ddde9dba0df053113bc505c213961a9760da

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

