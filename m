Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9B8589F51
	for <lists+freedreno@lfdr.de>; Thu,  4 Aug 2022 18:21:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEEE19EA35;
	Thu,  4 Aug 2022 16:21:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2A7618AECC
 for <freedreno@lists.freedesktop.org>; Thu,  4 Aug 2022 16:21:18 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id s11so237052edd.13
 for <freedreno@lists.freedesktop.org>; Thu, 04 Aug 2022 09:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kvAqCBmhC1zB39spR1tg3XxszATJUMKEiGdcZPVBnEk=;
 b=UErQStKIF5hZVlCtEqf1Am7dqLpJ3Gf93i3FVYaQ4WnaZGrJrjTToT0UTJCKeJWi7F
 C+ASE7ShUEwtc8+vcatkrMMqsliKcY70qJzCb9Qlf9Pkfquo1CyCK8lv35BU0pIjOOWC
 vDkE68covrngok0XigFTlS5HlB4zBDCRKFjJJM48SyUrICpUP/bg/2FzpPwnEpgnfTQ2
 DELUKeugxTGXXTyQQHMmUQzzT2pMZVpi+PkYVvoCsuKElaZyanc/7Bb9OXKG4s9kxaXX
 HM7e45G9kdDwUwaMaNZT/WdQ289cMM5Ci4V4Bwk5qR5equtn3xIEJMy+oL1xCGN5WBTt
 ANFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kvAqCBmhC1zB39spR1tg3XxszATJUMKEiGdcZPVBnEk=;
 b=OVQ5OGtTaFYJKWMpJKf6MoOhrn2a0UPBjW76ljLf3R82sVrZFFVyUKuDUNZtc26ngp
 n5/M6schGr5kjMCeB70CgQamVkGIyZTOC3DGh2XBS8k1pHaMQlkPDASgK3Se7hAG0Uwh
 necTfwJjRhH0azmuesvJqjfKim9WWZ6ZJ+9+srZwjMUmdUVsMaaw4zDbygp2tqUGy8kq
 9v1AQ540dYuy62YVAnhDp5FUR7vgaCXNeDwYD4S85VcHW56eZa3qnQGkEKQbqO4GRuPh
 c9kAu8J+I60yEynydId3NJjxRVtpODIFWz80v6aKGfcJf/0mmsKYkshsBV+7P6QvS+wO
 PwrA==
X-Gm-Message-State: ACgBeo3CltEOaPIAvIkwBvsXT65Jiy0h21ZO0G6cktkqW5O5Wv3EDYvm
 JTWfx51DxqOY5xr7kk1yCK1bd0/ENV2DRykCqoPJKw==
X-Google-Smtp-Source: AA6agR4d07uIaAqAc9iaaznOWJ4GsUqNCVavrOx8TxPMdJe98XydwPgZ07U3x/6+7aPRKb0bACRT3oDA2mJN9dI52kg=
X-Received: by 2002:a05:6402:909:b0:435:a8b:5232 with SMTP id
 g9-20020a056402090900b004350a8b5232mr2845711edz.240.1659630077136; Thu, 04
 Aug 2022 09:21:17 -0700 (PDT)
MIME-Version: 1.0
References: <1657544224-10680-1-git-send-email-quic_vpolimer@quicinc.com>
 <CAD=FV=U_GStziLOCVLs_FC_2Vr=ykGfbb4ZtUp79iV8V=B0cEA@mail.gmail.com>
In-Reply-To: <CAD=FV=U_GStziLOCVLs_FC_2Vr=ykGfbb4ZtUp79iV8V=B0cEA@mail.gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 4 Aug 2022 18:21:05 +0200
Message-ID: <CAG3jFyv3up0o4S+UYMKaAjanKL6hxCNtEa5zQTQEeNREab-NRA@mail.gmail.com>
To: Doug Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v6 00/10] Add PSR support for eDP
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 quic_vproddut <quic_vproddut@quicinc.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 29 Jul 2022 at 02:22, Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Mon, Jul 11, 2022 at 5:57 AM Vinod Polimera
> <quic_vpolimer@quicinc.com> wrote:
> >
> > Changes in v2:
> >   - Use dp bridge to set psr entry/exit instead of dpu_enocder.
> >   - Don't modify whitespaces.
> >   - Set self refresh aware from atomic_check.
> >   - Set self refresh aware only if psr is supported.
> >   - Provide a stub for msm_dp_display_set_psr.
> >   - Move dp functions to bridge code.
> >
> > Changes in v3:
> >   - Change callback names to reflect atomic interfaces.
> >   - Move bridge callback change to separate patch as suggested by Dmitry.
> >   - Remove psr function declaration from msm_drv.h.
> >   - Set self_refresh_aware flag only if psr is supported.
> >   - Modify the variable names to simpler form.
> >   - Define bit fields for PSR settings.
> >   - Add comments explaining the steps to enter/exit psr.
> >   - Change DRM_INFO to drm_dbg_db.
> >
> > Changes in v4:
> >   - Move the get crtc functions to drm_atomic.
> >   - Add atomic functions for DP bridge too.
> >   - Add ternary operator to choose eDP or DP ops.
> >   - Return true/false instead of 1/0.
> >   - mode_valid missing in the eDP bridge ops.
> >   - Move the functions to get crtc into drm_atomic.c.
> >   - Fix compilation issues.
> >   - Remove dpu_assign_crtc and get crtc from drm_enc instead of dpu_enc.
> >   - Check for crtc state enable while reserving resources.
> >
> > Changes in v5:
> >   - Move the mode_valid changes into a different patch.
> >   - Complete psr_op_comp only when isr is set.
> >   - Move the DP atomic callback changes to a different patch.
> >   - Get crtc from drm connector state crtc.
> >   - Move to separate patch for check for crtc state enable while
> > reserving resources.
> >
> > Changes in v6:
> >   - Remove crtc from dpu_encoder_virt struct.
> >   - fix crtc check during vblank toggle crtc.
> >   - Misc changes.
> >
> > Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> > Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> > Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> >
> > Vinod Polimera (10):
> >   drm/msm/disp/dpu: clear dpu_assign_crtc and get crtc from connector
> >     state instead of dpu_enc
> >   drm: add helper functions to retrieve old and new crtc
> >   drm/msm/dp: use atomic callbacks for DP bridge ops
> >   drm/msm/dp: Add basic PSR support for eDP
> >   drm/msm/dp: use the eDP bridge ops to validate eDP modes
> >   drm/bridge: use atomic enable/disable callbacks for panel bridge
> >   drm/bridge: add psr support for panel bridge callbacks
> >   drm/msm/disp/dpu: use atomic enable/disable callbacks for encoder
> >     functions
> >   drm/msm/disp/dpu: add PSR support for eDP interface in dpu driver
> >   drm/msm/disp/dpu: check for crtc enable rather than crtc active to
> >     release shared resources
> >
> >  drivers/gpu/drm/bridge/panel.c              |  68 ++++++++--
> >  drivers/gpu/drm/drm_atomic.c                |  60 +++++++++
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  17 ++-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  56 +++++----
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |   8 --
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |   2 +-
> >  drivers/gpu/drm/msm/dp/dp_catalog.c         |  81 ++++++++++++
> >  drivers/gpu/drm/msm/dp/dp_catalog.h         |   4 +
> >  drivers/gpu/drm/msm/dp/dp_ctrl.c            |  73 +++++++++++
> >  drivers/gpu/drm/msm/dp/dp_ctrl.h            |   3 +
> >  drivers/gpu/drm/msm/dp/dp_display.c         |  31 +++--
> >  drivers/gpu/drm/msm/dp/dp_display.h         |   2 +
> >  drivers/gpu/drm/msm/dp/dp_drm.c             | 184 ++++++++++++++++++++++++++--
> >  drivers/gpu/drm/msm/dp/dp_drm.h             |   9 +-
> >  drivers/gpu/drm/msm/dp/dp_link.c            |  36 ++++++
> >  drivers/gpu/drm/msm/dp/dp_panel.c           |  22 ++++
> >  drivers/gpu/drm/msm/dp/dp_panel.h           |   6 +
> >  drivers/gpu/drm/msm/dp/dp_reg.h             |  27 ++++
> >  include/drm/drm_atomic.h                    |   7 ++
> >  19 files changed, 631 insertions(+), 65 deletions(-)
>

Which tree does this series apply to?
