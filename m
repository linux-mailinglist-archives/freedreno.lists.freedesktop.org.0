Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E759F26A2
	for <lists+freedreno@lfdr.de>; Sun, 15 Dec 2024 23:44:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F237610E115;
	Sun, 15 Dec 2024 22:44:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="W159ikD4";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 038B510E115
 for <freedreno@lists.freedesktop.org>; Sun, 15 Dec 2024 22:44:15 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-3011c7b39c7so38392461fa.1
 for <freedreno@lists.freedesktop.org>; Sun, 15 Dec 2024 14:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734302654; x=1734907454; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wiyM++KsOVFJwW6aj3SElwGQilAMp0843gWRbVSsNyE=;
 b=W159ikD4v62lt7lp2gI24YJiyLxeIDhNqqmi1gBF/gWHCG1J9ycBKqzYLCsRbkcVqb
 wgmjG8RgRMnigzxs9cTQl37DN/lfJt69vTL3v80ZHXssUBcpgM0z1Q47B/YbXl7vUOPu
 Fx5tSdUF1lcwYIaxw6nR2my3PwTlpkj9ESqWf8flx21kXIbcdySIb0ok6fdtVLK4zdDA
 qtDKgJbTezO87Da7pyjFaZFffO91ofx1olADyUEORgdDTzOJ7dIRa4US/I5abIWCKf0W
 4fZs/pOuIal3Kz6btPf69pCVLeiHsuETMVHos738HIkZJ0WAWsOuG441qi3TgqWKEQft
 R3FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734302654; x=1734907454;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wiyM++KsOVFJwW6aj3SElwGQilAMp0843gWRbVSsNyE=;
 b=fGgAapRrsB72tbEjS/Vvir9Q5vknVu8pd4BcsCrEU/o/3mQVDqK+jJX/kK0QLRpWhz
 yP/7Tr5Eg2XE681K2nFx5/ntmp0bGhn6KuO0EL71L99oDYFVpDX9sw33aYpCf1r2i0C0
 jQkjhDIjUOxhfTsdfhO3WnZYz21bsW6Pkcj90V7xUjaXvQ8KxxyvptQoDBSNj1UEFEop
 8T6dxzL+sJ3Ioi6JMQzrXtArVMrvzEk6F23uPtKwSPlIolmZN0ryaGEHvH1rZkP1zOYN
 zeKGht2FLaLdDO05Lz7G5DA6QSK6DJ8Kp/PCgQ4i9DwqEpuTzMSD5GSTEqkn9FdGXKiQ
 6bFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6FNOg9CvOb4LJi8SNclP0TYJpW5ZByOKRObUhcMowTHP0NJQcF21yF9aTvge/b2RjUWdccMt2OOo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyegzQkEmJnebBnuTp8GM1TqXVSLNapr6Ro2lhQw+uFqOi48KbK
 7iFSRP0E2Del8681adPvdpHEl1yEoOXKFNt1aScFeDuP+ufuTNuUTFtYMah1x5g=
X-Gm-Gg: ASbGncu31Ws6pHWgpLZc2W/Y2hIwHQ+TXyeJcrom+C93+py3gHUrKedSxGFXkRFrFwR
 SQCWbf8XMoUenjIkSCQQ6HHKsFt3EP6u0m9s7/W5FOJ2eKLeF5FEpbnb4cxRsTcmBvX2bMavBW1
 /hS066VjmJSfbMpQFAwFeR0LtLIImUEne+BueAlCZdyD8cweYhBuLHdlNgO3zO2qkiHNfP9gEAr
 180hy2IBTbVs9Lm6hEjaOSBPXpnK75iwAmzZeH8PowSjYVRxySwrQmioYQkWyZb
X-Google-Smtp-Source: AGHT+IEOhOyrKe1fLpCJJfj1HpV10RlKePzB/U3HENJTDq1jhvZe00iwG9BTg13phbpjEcOYuHRqmQ==
X-Received: by 2002:a05:651c:a0b:b0:302:1861:6df4 with SMTP id
 38308e7fff4ca-302545b95a2mr31173471fa.35.1734302654082; 
 Sun, 15 Dec 2024 14:44:14 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-303441a41d1sm7201701fa.100.2024.12.15.14.44.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2024 14:44:12 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v4 00/16] drm/msm/dp: perform misc cleanups
Date: Mon, 16 Dec 2024 00:44:05 +0200
Message-Id: <20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALVbX2cC/23OzQ6CMAwH8FcxOzuzDxjDk+9hPIytwBLDyCaLh
 vDuFi5q5LL036a/biYJoodEzoeZRMg++TBgKI4HYnszdEC9w0wEEwVTvKSto26kZnI+0NY/J6x
 robUEU0PBCO6NEXCwmdcb5t6nR4iv7UTma3fTOGd6R8ucMlowqwEaxWxbXu5+MDGcQuzIymXxI
 fDZIwQSrua6wk8pZ9wfIb8IvktIJFjDrSqhco2RP8SyLG/EYisrOQEAAA==
X-Change-ID: 20240615-fd-dp-audio-fixup-a92883ea9e40
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>, 
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3146;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Wpqm+AyDhFEWkmbxwA9sIDOpZewkcmgIhwh63TRGv8s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnX1u4wieuIPQwzqElGGzCtUpWfcSN8u5hmioBG
 RarSfXTLzWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ19buAAKCRCLPIo+Aiko
 1RJcCACHIiksgRxZonl/xVOB+7hh+ZEPQ+0ON2piCtujhFjfY4qqgmkz0jzhN89O3CsYSmJtMca
 Ay3TCNKsqVU/ePat29r97DSBJs6y/rR4JLt6Mznv+mSNsapkLMvzguM6O9umxUe5WzqRID52g5M
 8EnVYbpmp3hDmdqVUiUE+eKQdmVzNw4E9jj7c6py2rgkLv+keNS1rzyZJ7UcKs+4wgoqjrO27KN
 LP/82VaUeROMzU8kUkSS/nYgK+PhQD44gU2b/U/5uCfNS8i8BsGUsA/IqRrptXX3vZqd9TNzIgf
 2x7cFeOF8A9Njdoei6P0E6bSqckwZdwML+b4jw+AYrDhbq3I
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

- Fix register programming in the dp_audio module
- Rework most of the register programming functions to be local to the
  calling module rather than accessing everything through huge
  dp_catalog monster.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v4:
- Rebased on top of linux-next + msm-fixes, dropping picked up patches
  (Abhinav)
- Reordered patches to move dp_audio patches earlier (Abhinav).
- Added several more patches, dropping dp_catalog.c completely.
- Link to v3: https://lore.kernel.org/r/20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org

Changes in v3:
- Fixed falce -> false typo (Abhinav)
- Dropped wrong c&p comment from msm_dp_read_p0() (Stephen)
- Changed msm_dp_aux_clear_hw_interrupts() to return void (Stephen)
- Fixed most of line length warnings
- Link to v2: https://lore.kernel.org/r/20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org

Changes in v2:
- Set safe_to_exit_level before printing it (LKP)
- Keep TPG-related functions (Abhinav)
- Link to v1: https://lore.kernel.org/r/20241108-fd-dp-audio-fixup-v1-0-40c8eeb60cf5@linaro.org

---
Dmitry Baryshkov (16):
      drm/msm/dp: drop msm_dp_panel_dump_regs() and msm_dp_catalog_dump_regs()
      drm/msm/dp: use msm_dp_utils_pack_sdp_header() for audio packets
      drm/msm/dp: drop obsolete audio headers access through catalog
      drm/msm/dp: drop struct msm_dp_panel_in
      drm/msm/dp: stop passing panel to msm_dp_audio_get()
      drm/msm/dp: split MMSS_DP_DSC_DTO register write to a separate function
      drm/msm/dp: pull I/O data out of msm_dp_catalog_private()
      drm/msm/dp: move I/O functions to global header
      drm/msm/dp: move/inline AUX register functions
      drm/msm/dp: move/inline ctrl register functions
      drm/msm/dp: move/inline panel related functions
      drm/msm/dp: move/inline audio related functions
      drm/msm/dp: move more AUX functions to dp_aux.c
      drm/msm/dp: move interrupt handling to dp_ctrl
      drm/msm/dp: read hw revision only once
      drm/msm/dp: drop the msm_dp_catalog module

 drivers/gpu/drm/msm/Makefile        |    1 -
 drivers/gpu/drm/msm/dp/dp_audio.c   |  379 ++++------
 drivers/gpu/drm/msm/dp/dp_audio.h   |    8 +-
 drivers/gpu/drm/msm/dp/dp_aux.c     |  216 +++++-
 drivers/gpu/drm/msm/dp/dp_aux.h     |   15 +-
 drivers/gpu/drm/msm/dp/dp_catalog.c | 1340 -----------------------------------
 drivers/gpu/drm/msm/dp/dp_catalog.h |  128 ----
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  607 ++++++++++++++--
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |   19 +-
 drivers/gpu/drm/msm/dp/dp_debug.c   |    1 -
 drivers/gpu/drm/msm/dp/dp_display.c |  157 ++--
 drivers/gpu/drm/msm/dp/dp_link.c    |    1 +
 drivers/gpu/drm/msm/dp/dp_panel.c   |  276 +++++++-
 drivers/gpu/drm/msm/dp/dp_panel.h   |   22 +-
 drivers/gpu/drm/msm/dp/dp_reg.h     |   19 +
 15 files changed, 1278 insertions(+), 1911 deletions(-)
---
base-commit: 952b5ed3020b50205f223e28ab182539210089c7
change-id: 20240615-fd-dp-audio-fixup-a92883ea9e40

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

