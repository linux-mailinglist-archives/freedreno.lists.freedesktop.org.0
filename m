Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CF55A3831
	for <lists+freedreno@lfdr.de>; Sat, 27 Aug 2022 16:52:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB63410E130;
	Sat, 27 Aug 2022 14:52:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83EC110E130
 for <freedreno@lists.freedesktop.org>; Sat, 27 Aug 2022 14:52:52 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-11c5505dba2so5565968fac.13
 for <freedreno@lists.freedesktop.org>; Sat, 27 Aug 2022 07:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc;
 bh=ENmTEz2sdDhPaUZ1YuMYFzj0qZyorVVrht0Q7zVdl5A=;
 b=fakL+gb4E+NtO3ziLxu6HuOpkO2QrjQpPe1EVZfpWbzH1HcwGI68uVScTaQT3nVfot
 te93JwTHEON9VLtXHqfmz4mbAzimgcNYXt+qnZOEQXAEcgyIcdDAqrq6Ea50SXBOQZIX
 wa4pahhhhrQNV4zWXd1keaPg2JRUa8JaFHD+ESqFAavwRQnm5yabmSk+kkVUORI/gut8
 7fRBJ6ozmmGUvbpAwJlREqcsTo//MN4QYq0vy7xp4TUFqUfDs6UgnjwC5Lnj8uYNa3Wi
 F1wBbsQI/XLBHM3dPLX9Cx0Cyxk34imk2OaV4cT+jTQHW5YXUnGGpW4vKUW+80NJCTsa
 kufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc;
 bh=ENmTEz2sdDhPaUZ1YuMYFzj0qZyorVVrht0Q7zVdl5A=;
 b=mdpRcPN9iE+gDcHLYA8hloQZkgL0HPw9s7kFowwrdE3l+Ty4kRIhB2HSVljt6LnBHF
 cZhDTqiBabMcxh8ExN2hcv55cttSSpQnO+oBkn+2T/RXFfs6DzC97vf1bsMlRCJ0IQ4g
 Vg3fUCwL6dUChsjtbuyy4LoKyJTJxblk4GX9BlFH04/elk6pG14zv/Qy11mbqUJAh/9T
 nLFfaFWWKp8aKigx1JFPZHDekychuptIGx6+gEpM9DW8DkazLRmkwXx+rjPgK2Djb58e
 6MgOBOj2LITadJ7vR2V8rka5QUlMZJAlbURin+VliEcPJarBYesl4K9o/0mnY4/WOAMv
 aFmQ==
X-Gm-Message-State: ACgBeo21C+bPCH8VYSF5iYR5CYAbfYMJRgSopX6uyj1VFrE0h4H19Jw9
 yxxesdG19WhKSzcy4aWDDpu9lDXEyvio96rnUF0=
X-Google-Smtp-Source: AA6agR6xFP1IuWf9MCarhROFl12ZJ69qAgM3HKlcNhwJmBXJWgSZZ8VoaeuW7OLYEGjbjMsVVrUAevhz2rw83amLtDE=
X-Received: by 2002:a05:6871:825:b0:11e:8862:d5f5 with SMTP id
 q37-20020a056871082500b0011e8862d5f5mr2679762oap.183.1661611971709; Sat, 27
 Aug 2022 07:52:51 -0700 (PDT)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Sat, 27 Aug 2022 07:53:27 -0700
Message-ID: <CAF6AEGvwuAN2ekr4o-RybqSnUSmJm_Watu4kBztnddE9brqmiA@mail.gmail.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Subject: [Freedreno] [pull] drm/msm: drm-msm-fixes-2022-08-27 for v6.0
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
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi Dave,

A few fixes for the v6.0 cycle.  I meant to send this a bit earlier
but ended up at the bottom of other rabbit holes.  Summary below (and
in tag msg)

The following changes since commit cb77085b1f0a86ef9dfba86b5f3ed6c3340c2ea3:

  drm/msm/dpu: Fix for non-visible planes (2022-07-08 08:10:58 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-fixes-2022-08-27

for you to fetch changes up to 174974d8463b77c2b4065e98513adb204e64de7d:

  drm/msm/rd: Fix FIFO-full deadlock (2022-08-15 10:19:53 -0700)

----------------------------------------------------------------
Fixes for v6.0

- Fix for inconsistent indenting in function msm_dsi_dphy_timing_calc_v3.
  This fixes a smatch warning reported by kbot
- Fix to make eDP the first connector in the connected list. This was
  mainly done to address a screen corruption issue we were seeing on
  sc7280 boards which have eDP as the primary display. The corruption
  itself is from usermode but we decided to fix it this way because
  things work correct with the primary display as the first one for
  usermode
- Fix to populate intf_cfg correctly before calling reset_intf_cfg().
  Without this, the display pipeline is not torn down correctly for
  writeback
- Specify the correct number of DSI regulators for SDM660. It should
  have been 1 but 2 was mentioned
- Specify the correct number of DSI regulators for MSM8996. It should
  have been 3 but 2 was mentioned
- Fix for removing DP_RECOVERED_CLOCK_OUT_EN bit for tps4 link training
  for DP. This was causing link training failures and hence no display
  for a specific DP to HDMI cable on chromebooks
- Fix probe-deferral crash in gpu devfreq
- Fix gpu debugfs deadlock

----------------------------------------------------------------
Abhinav Kumar (1):
      drm/msm/dpu: populate wb or intf before reset_intf_cfg

Bjorn Andersson (1):
      drm/msm/gpu: Drop qos request if devm_devfreq_add_device() fails

Douglas Anderson (2):
      drm/msm/dsi: Fix number of regulators for msm8996_dsi_cfg
      drm/msm/dsi: Fix number of regulators for SDM660

Kuogee Hsieh (2):
      drm/msm/dp: make eDP panel as the first connected connector
      drm/msm/dp: delete DP_RECOVERED_CLOCK_OUT_EN to fix tps4

Rob Clark (1):
      drm/msm/rd: Fix FIFO-full deadlock

sunliming (1):
      drm/msm/dsi: fix the inconsistent indenting

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 6 ++++++
 drivers/gpu/drm/msm/dp/dp_ctrl.c            | 2 +-
 drivers/gpu/drm/msm/dsi/dsi_cfg.c           | 4 ++--
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c       | 2 +-
 drivers/gpu/drm/msm/msm_drv.c               | 2 ++
 drivers/gpu/drm/msm/msm_gpu_devfreq.c       | 2 ++
 drivers/gpu/drm/msm/msm_rd.c                | 3 +++
 7 files changed, 17 insertions(+), 4 deletions(-)
