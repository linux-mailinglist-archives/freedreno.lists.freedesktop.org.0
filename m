Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD036A7558
	for <lists+freedreno@lfdr.de>; Wed,  1 Mar 2023 21:32:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D48A10E252;
	Wed,  1 Mar 2023 20:32:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EEF910E24D
 for <freedreno@lists.freedesktop.org>; Wed,  1 Mar 2023 20:32:23 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id 4so9110916ilz.6
 for <freedreno@lists.freedesktop.org>; Wed, 01 Mar 2023 12:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TYLUGupyjMeev27c+qWxeJczPJEjR3Ydgup+v8f48I0=;
 b=GmGgxIMa7jgrR0m+YdLsk7vfyL/4rJnMGC5mfcGR/R7G0gFYRjWDlZl3TA0bO7F+Qg
 RwBcF1jdEoNchqOUUlWul6LxOLORwwjrjhzZzDQPClEh29xaJAHBiR2Ma4FzFHT6dv+B
 O8/SdUNfByPhJ947xgUUtecxVu5h5xtRet+y4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TYLUGupyjMeev27c+qWxeJczPJEjR3Ydgup+v8f48I0=;
 b=d+5PQ1CqidyFvgcIquGog93zLwJNjI8nMfCDrR46W8O+YZKQCy1d1v7o+62CMQ3ooY
 1xBho1SHV0pt0Apgh0L4myGpaOgtg7GYk4hLbSmiKOKURj2ALsrCmB/TSBrbyOkcQ/cQ
 qei6wlLg35ZoINTkW7wpb8RX0l+ouq1mRHxiyozrAX9aUErT0XkDaN5nCWF3N2ZAUpHQ
 sy8/jBUWpnstHGYtGtW9vBObPuuQIVseinmiGgavPu2pG9aHRC+gdy/daD+iE0BsaoLR
 5deUM0gjeg+czxi7ucrToB6qzJdKjYJwNXKBtxBrhtblPM023pMXgt/gG/PzeAKiK8FY
 vyGw==
X-Gm-Message-State: AO0yUKVWSCEcnfgseEJPB9aylwN4WYnb/N0XSc2ojqTQXT+YUa6mHuMV
 nPTYnsIRE94HLYL1STAZjROsh4uU3sOesLrj
X-Google-Smtp-Source: AK7set8edkO7EgNrM3g0N38ohSiFBSdwVVSIceyNQR+XvIHs4timSelMYUuaN7y047Ax1keufdEDxQ==
X-Received: by 2002:a05:6e02:20eb:b0:316:e6e4:570b with SMTP id
 q11-20020a056e0220eb00b00316e6e4570bmr6899751ilv.11.1677702741898; 
 Wed, 01 Mar 2023 12:32:21 -0800 (PST)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com.
 [209.85.166.47]) by smtp.gmail.com with ESMTPSA id
 w16-20020a029690000000b00375a885f908sm4009139jai.36.2023.03.01.12.32.20
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Mar 2023 12:32:21 -0800 (PST)
Received: by mail-io1-f47.google.com with SMTP id k17so667877iob.1
 for <freedreno@lists.freedesktop.org>; Wed, 01 Mar 2023 12:32:20 -0800 (PST)
X-Received: by 2002:a05:6602:14a:b0:745:b287:c281 with SMTP id
 v10-20020a056602014a00b00745b287c281mr3679858iot.2.1677702739460; Wed, 01 Mar
 2023 12:32:19 -0800 (PST)
MIME-Version: 1.0
References: <1676219337-6526-1-git-send-email-quic_vpolimer@quicinc.com>
 <CAD=FV=XvjFQ-7KNsW2YQQ-LzJonCcHz_rj-oOhB0jh_99ficKA@mail.gmail.com>
In-Reply-To: <CAD=FV=XvjFQ-7KNsW2YQQ-LzJonCcHz_rj-oOhB0jh_99ficKA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 1 Mar 2023 12:32:07 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VD2V=NvNCotU_bLH4LuGEO8W8a0sH0uc--KsaUsneSFg@mail.gmail.com>
Message-ID: <CAD=FV=VD2V=NvNCotU_bLH4LuGEO8W8a0sH0uc--KsaUsneSFg@mail.gmail.com>
To: Vinod Polimera <quic_vpolimer@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [PATCH v13 00/13] Add PSR support for eDP
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
Cc: quic_kalyant@quicinc.com, devicetree@vger.kernel.org,
 quic_sbillaka@quicinc.com, quic_bjorande@quicinc.com,
 quic_abhinavk@quicinc.com, quic_vproddut@quicinc.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, robdclark@gmail.com,
 dmitry.baryshkov@linaro.org, quic_khsieh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Wed, Mar 1, 2023 at 11:06=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Sun, Feb 12, 2023 at 8:29=E2=80=AFAM Vinod Polimera
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
> >   - Move bridge callback change to separate patch as suggested by Dmitr=
y.
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
> >   - Remove dpu_assign_crtc and get crtc from drm_enc instead of dpu_enc=
.
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
> > Changes in v7:
> >   - Add fix for underrun issue on kasan build.
> >
> > Changes in v8:
> >   - Drop the enc spinlock as it won't serve any purpose in
> > protetcing conn state.(Dmitry/Doug)
> >
> > Changes in v9:
> >   - Update commit message and fix alignment using spaces.(Marijn)
> >   - Misc changes.(Marijn)
> >
> > Changes in v10:
> >   - Get crtc cached in dpu_enc during obj init.(Dmitry)
> >
> > Changes in v11:
> >   - Remove crtc cached in dpu_enc during obj init.
> >   - Update dpu_enc crtc state on crtc enable/disable during self refres=
h.
> >
> > Changes in v12:
> >   - Update sc7180 intf mask to get intf timing gen status
> > based on DPU_INTF_STATUS_SUPPORTED bit.(Dmitry)
> >   - Remove "clear active interface in the datapath cleanup" change
> > as it is already included.
> >
> > Changes in v13:
> >   - Move core changes to top of the series.(Dmitry)
> >   - Drop self refresh aware disable change after psr entry.(Dmitry)
> >
> > Vinod Polimera (13):
> >   drm: add helper functions to retrieve old and new crtc
> >   drm/bridge: use atomic enable/disable callbacks for panel bridge
> >   drm/bridge: add psr support for panel bridge callbacks
> >   drm/msm/disp/dpu: check for crtc enable rather than crtc active to
> >     release shared resources
> >   drm/msm/disp/dpu: get timing engine status from intf status register
> >   drm/msm/disp/dpu: wait for extra vsync till timing engine status is
> >     disabled
> >   drm/msm/disp/dpu: reset the datapath after timing engine disable
> >   drm/msm/dp: use atomic callbacks for DP bridge ops
> >   drm/msm/dp: Add basic PSR support for eDP
> >   drm/msm/dp: use the eDP bridge ops to validate eDP modes
> >   drm/msm/disp/dpu: use atomic enable/disable callbacks for encoder
> >     functions
> >   drm/msm/disp/dpu: add PSR support for eDP interface in dpu driver
> >   drm/msm/disp/dpu: update dpu_enc crtc state on crtc enable/disable
> >     during self refresh
>
> I'm curious what the plan is for landing this series. I could land the
> first two in drm-misc if you want, but I'm a lowly committer and so I
> couldn't make an immutable branch for you nor can I officially Ack the
> changes to land in your branch. That means you'd be blocked for an
> extra version. Do you already have a plan? If not, then maybe we need
> to get in touch with one of the maintainers [1] of drm-misc? That's
> documented [2] to be in their set of responsibilities.
>
> [1] https://drm.pages.freedesktop.org/maintainer-tools/repositories.html#=
drm-misc-repository
> [2] https://drm.pages.freedesktop.org/maintainer-tools/maintainer-drm-mis=
c.html#maintainer-s-duties

The above question about how we'd land this is still a good one, but
perhaps less relevant quite yet because, at least in my testing, the
current series doesn't work. :-/

I know previous versions worked, so I went back and tried older
versions. It turns out that v12 _does_ work for me, but v13 doesn't
work. The difference is very small. I'm assuming you made some changes
in v13 and they looked so small that you just sent v13 out without
testing? ...or, of course, there's always a possibility that I messed
up in testing this myself, though I did repeat my results and they
were consistent.

FWIW, my testing was roughly to do this on a device that had a
PSR-enabled eDP display:

echo "dp_catalog_ctrl_set_psr" > /sys/kernel/debug/tracing/set_ftrace_filte=
r
echo function > /sys/kernel/debug/tracing/current_tracer
echo 1 > /sys/kernel/debug/tracing/tracing_on
cat /sys/kernel/debug/tracing/trace_pipe

I should see a splat in the trace buffers each time PSR is entered or
exited. On v12 I get splats as the cursor on my screen blinks. On v13,
it's just silence.

Please confirm that you tested v13. If you're confident that v13 works
then I can dig further myself.

-Doug
