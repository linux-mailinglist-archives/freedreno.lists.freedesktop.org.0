Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B30AA58A012
	for <lists+freedreno@lfdr.de>; Thu,  4 Aug 2022 19:55:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93BF314BB65;
	Thu,  4 Aug 2022 17:55:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7880A14B443
 for <freedreno@lists.freedesktop.org>; Thu,  4 Aug 2022 17:54:54 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id e69so264325iof.5
 for <freedreno@lists.freedesktop.org>; Thu, 04 Aug 2022 10:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=Q94Q2VDlGnfmsIVyKku4OjRypxckGbu+KvrwMMNdhgs=;
 b=lvlLlE7olQ5iMWyiRKxfNMtkZzWDdxp8/mVxNcRkMZH6idmzmJ+atn9c5BDlpGUrKu
 FVhK6HEEUsRFAHOdZY+MRmjSYBywMpoNw2sneaMMNrqkdn8AZoP1vdPmR1Ls7aHDiEyc
 l5HOCLI+BuYNahdSsPJrSNvwqhvEx7O6pe8qE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=Q94Q2VDlGnfmsIVyKku4OjRypxckGbu+KvrwMMNdhgs=;
 b=s2/krumkskr5BtxubDR0D6bf3M2yjby5XTSNSw3Itqa8Sba3tN3s6b/TIMTC7oeuTQ
 0DPW6n2f3ULLvZ2PsPIYuj3bT1vrY3N4URzAqy63R9Zy0x+hTi/d/+GqZ4WWYXpsBbr9
 tG9aeIJJ50SAE00pxKx4G7BGkpusqrLCVvh1T2aaP28HF/QABLO5N7FGuAAIrvg6t0xc
 EaUid9A95hVxveHSE9CqB31sPz40/CI0cmbwYouWcDn6vr84p3IzxbErGmCw5Az3Bvjc
 ngi+l7Tse8ix/rO350VUm6jg/g+LXTg7HW71ORaLprQphi9vt7y/8uRT/u5mPvaqMYyN
 +ESQ==
X-Gm-Message-State: ACgBeo11NFgKcVJWkdGtZPeNtb0lBzVrPV0fYvr2INhpqUApzNaOE2mV
 Ov3/EePoNfW14KcDFpQlo+GX9h9HrkW2A3fS
X-Google-Smtp-Source: AA6agR5BuzQJMi31AIRLI5qsO529WO2Yh7Z+gHtnDZ/k6Ph3PjTO3Xg8Owfq8i/ylUNx0LxdhlWdhQ==
X-Received: by 2002:a05:6602:26c3:b0:66c:f8b2:53c with SMTP id
 g3-20020a05660226c300b0066cf8b2053cmr1196897ioo.50.1659635693011; 
 Thu, 04 Aug 2022 10:54:53 -0700 (PDT)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com.
 [209.85.166.54]) by smtp.gmail.com with ESMTPSA id
 x19-20020a026f13000000b00342a1021507sm688325jab.123.2022.08.04.10.54.51
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Aug 2022 10:54:51 -0700 (PDT)
Received: by mail-io1-f54.google.com with SMTP id s7so303176ioa.0
 for <freedreno@lists.freedesktop.org>; Thu, 04 Aug 2022 10:54:51 -0700 (PDT)
X-Received: by 2002:a05:6638:2614:b0:33f:5bc2:b385 with SMTP id
 m20-20020a056638261400b0033f5bc2b385mr1356611jat.246.1659635690978; Thu, 04
 Aug 2022 10:54:50 -0700 (PDT)
MIME-Version: 1.0
References: <1657544224-10680-1-git-send-email-quic_vpolimer@quicinc.com>
 <CAD=FV=U_GStziLOCVLs_FC_2Vr=ykGfbb4ZtUp79iV8V=B0cEA@mail.gmail.com>
 <CAG3jFyv3up0o4S+UYMKaAjanKL6hxCNtEa5zQTQEeNREab-NRA@mail.gmail.com>
In-Reply-To: <CAG3jFyv3up0o4S+UYMKaAjanKL6hxCNtEa5zQTQEeNREab-NRA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 4 Aug 2022 10:54:36 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VL2ATy=Ap5fAVxMYZZ5G6_8pdFGw=gdOc=PuqiOPHMow@mail.gmail.com>
Message-ID: <CAD=FV=VL2ATy=Ap5fAVxMYZZ5G6_8pdFGw=gdOc=PuqiOPHMow@mail.gmail.com>
To: Robert Foss <robert.foss@linaro.org>
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

Hi,

On Thu, Aug 4, 2022 at 9:21 AM Robert Foss <robert.foss@linaro.org> wrote:
>
> On Fri, 29 Jul 2022 at 02:22, Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Mon, Jul 11, 2022 at 5:57 AM Vinod Polimera
> > <quic_vpolimer@quicinc.com> wrote:
> > >
> > > Changes in v2:
> > >   - Use dp bridge to set psr entry/exit instead of dpu_enocder.
> > >   - Don't modify whitespaces.
> > >   - Set self refresh aware from atomic_check.
> > >   - Set self refresh aware only if psr is supported.
> > >   - Provide a stub for msm_dp_display_set_psr.
> > >   - Move dp functions to bridge code.
> > >
> > > Changes in v3:
> > >   - Change callback names to reflect atomic interfaces.
> > >   - Move bridge callback change to separate patch as suggested by Dmitry.
> > >   - Remove psr function declaration from msm_drv.h.
> > >   - Set self_refresh_aware flag only if psr is supported.
> > >   - Modify the variable names to simpler form.
> > >   - Define bit fields for PSR settings.
> > >   - Add comments explaining the steps to enter/exit psr.
> > >   - Change DRM_INFO to drm_dbg_db.
> > >
> > > Changes in v4:
> > >   - Move the get crtc functions to drm_atomic.
> > >   - Add atomic functions for DP bridge too.
> > >   - Add ternary operator to choose eDP or DP ops.
> > >   - Return true/false instead of 1/0.
> > >   - mode_valid missing in the eDP bridge ops.
> > >   - Move the functions to get crtc into drm_atomic.c.
> > >   - Fix compilation issues.
> > >   - Remove dpu_assign_crtc and get crtc from drm_enc instead of dpu_enc.
> > >   - Check for crtc state enable while reserving resources.
> > >
> > > Changes in v5:
> > >   - Move the mode_valid changes into a different patch.
> > >   - Complete psr_op_comp only when isr is set.
> > >   - Move the DP atomic callback changes to a different patch.
> > >   - Get crtc from drm connector state crtc.
> > >   - Move to separate patch for check for crtc state enable while
> > > reserving resources.
> > >
> > > Changes in v6:
> > >   - Remove crtc from dpu_encoder_virt struct.
> > >   - fix crtc check during vblank toggle crtc.
> > >   - Misc changes.
> > >
> > > Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> > > Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> > > Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> > >
> > > Vinod Polimera (10):
> > >   drm/msm/disp/dpu: clear dpu_assign_crtc and get crtc from connector
> > >     state instead of dpu_enc
> > >   drm: add helper functions to retrieve old and new crtc
> > >   drm/msm/dp: use atomic callbacks for DP bridge ops
> > >   drm/msm/dp: Add basic PSR support for eDP
> > >   drm/msm/dp: use the eDP bridge ops to validate eDP modes
> > >   drm/bridge: use atomic enable/disable callbacks for panel bridge
> > >   drm/bridge: add psr support for panel bridge callbacks
> > >   drm/msm/disp/dpu: use atomic enable/disable callbacks for encoder
> > >     functions
> > >   drm/msm/disp/dpu: add PSR support for eDP interface in dpu driver
> > >   drm/msm/disp/dpu: check for crtc enable rather than crtc active to
> > >     release shared resources
> > >
> > >  drivers/gpu/drm/bridge/panel.c              |  68 ++++++++--
> > >  drivers/gpu/drm/drm_atomic.c                |  60 +++++++++
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  17 ++-
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  56 +++++----
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |   8 --
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |   2 +-
> > >  drivers/gpu/drm/msm/dp/dp_catalog.c         |  81 ++++++++++++
> > >  drivers/gpu/drm/msm/dp/dp_catalog.h         |   4 +
> > >  drivers/gpu/drm/msm/dp/dp_ctrl.c            |  73 +++++++++++
> > >  drivers/gpu/drm/msm/dp/dp_ctrl.h            |   3 +
> > >  drivers/gpu/drm/msm/dp/dp_display.c         |  31 +++--
> > >  drivers/gpu/drm/msm/dp/dp_display.h         |   2 +
> > >  drivers/gpu/drm/msm/dp/dp_drm.c             | 184 ++++++++++++++++++++++++++--
> > >  drivers/gpu/drm/msm/dp/dp_drm.h             |   9 +-
> > >  drivers/gpu/drm/msm/dp/dp_link.c            |  36 ++++++
> > >  drivers/gpu/drm/msm/dp/dp_panel.c           |  22 ++++
> > >  drivers/gpu/drm/msm/dp/dp_panel.h           |   6 +
> > >  drivers/gpu/drm/msm/dp/dp_reg.h             |  27 ++++
> > >  include/drm/drm_atomic.h                    |   7 ++
> > >  19 files changed, 631 insertions(+), 65 deletions(-)
> >
>
> Which tree does this series apply to?

It ought to apply to msm-next, but as I mentioned in my reply to patch
#1 it doesn't apply to the top of msm-next. I think I also had to
manually apply a few of the later patches with "patch -p1".

-Doug
