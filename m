Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E4E6ACAA8
	for <lists+freedreno@lfdr.de>; Mon,  6 Mar 2023 18:35:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 873A810E2F6;
	Mon,  6 Mar 2023 17:35:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41ACA10E2F6
 for <freedreno@lists.freedesktop.org>; Mon,  6 Mar 2023 17:35:49 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id b16so4329286iof.11
 for <freedreno@lists.freedesktop.org>; Mon, 06 Mar 2023 09:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1678124148;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iNHjWC6k5xJHMsKrCk2hHuizLw/uBoZMGCOR7dCoGpo=;
 b=d4pAAs1qHxDU9kH8PrG0Pudt41ZZBhrQozyqVL9AhytWJZTl4Z9I2BMfv+fyII/tPD
 sfasxnC9HZjm2Bo65Gs4jeaIF7KJsFSCyzHtzvjqgYAh5ZS4PX67WKYRcgpfUUZIEKBl
 5/HKvzkp3iTqJhtsNR5Ajm+4OCOExLKu9HGcw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678124148;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iNHjWC6k5xJHMsKrCk2hHuizLw/uBoZMGCOR7dCoGpo=;
 b=0FHIlzRUdF6B/wb7BRHuFjGU9QrRKFEB3fxkenMzP7GdOdozRwaXxM3PuGzqVUNiwk
 Djb8d+jiIaoTim99Y1AdkmbVfKYIT0DDdENibprBSQ0vNNGz3A9lrDTSh5UJFq4Kr/dj
 srq45fIivxYm/FwBBJMpoJxugNzTj6xISMyYuFdQ4yj04SohBRaCcdngKrzYPS3Mss3w
 8c+PdbwGaGzr/QV90ji60dl3v0sxGOgtBXBuhDlCNoL0klY9sxIy4U+sKtXrY7Yu0XKh
 cHkrXMI4C+8HvHsWG2Uk+x4zFxdmqeKpO0OBmP6aTbOa/m/n05ER9MWWRZQZXoatL9Kb
 znhQ==
X-Gm-Message-State: AO0yUKVFR2F+QqiC0Whz5RgmATAruY1CKKacF2BVpe3j2kcMyR+0R+kU
 ylg+S1vscXN5LlcIXAZKhZV8m02WOyVGOT9NmCGo8A==
X-Google-Smtp-Source: AK7set9ne649+JHzBB47soP8DjArEJs50fxgrcDxjnlNIn4WPajyot3w6+vIaJkb5Oz3a5Ho3IeSxg==
X-Received: by 2002:a5e:8910:0:b0:74c:bcdd:321f with SMTP id
 k16-20020a5e8910000000b0074cbcdd321fmr6985652ioj.4.1678124148406; 
 Mon, 06 Mar 2023 09:35:48 -0800 (PST)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com.
 [209.85.166.49]) by smtp.gmail.com with ESMTPSA id
 k18-20020a6b3c12000000b0074c8295db0csm3423701iob.6.2023.03.06.09.35.48
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 09:35:48 -0800 (PST)
Received: by mail-io1-f49.google.com with SMTP id m22so4344373ioy.4
 for <freedreno@lists.freedesktop.org>; Mon, 06 Mar 2023 09:35:48 -0800 (PST)
X-Received: by 2002:a02:634e:0:b0:3ec:dc1f:12dd with SMTP id
 j75-20020a02634e000000b003ecdc1f12ddmr6039903jac.6.1678124147517; Mon, 06 Mar
 2023 09:35:47 -0800 (PST)
MIME-Version: 1.0
References: <1677774797-31063-1-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1677774797-31063-1-git-send-email-quic_vpolimer@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 6 Mar 2023 09:35:34 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UvaE1zFxP7pAXAzh=6Qdu9dSjd73DfEgJfmBeHNcJ_oA@mail.gmail.com>
Message-ID: <CAD=FV=UvaE1zFxP7pAXAzh=6Qdu9dSjd73DfEgJfmBeHNcJ_oA@mail.gmail.com>
To: Vinod Polimera <quic_vpolimer@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [PATCH v14 00/14] Add PSR support for eDP
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

On Thu, Mar 2, 2023 at 8:33=E2=80=AFAM Vinod Polimera <quic_vpolimer@quicin=
c.com> wrote:
>
> Changes in v2:
>   - Use dp bridge to set psr entry/exit instead of dpu_enocder.
>   - Don't modify whitespaces.
>   - Set self refresh aware from atomic_check.
>   - Set self refresh aware only if psr is supported.
>   - Provide a stub for msm_dp_display_set_psr.
>   - Move dp functions to bridge code.
>
> Changes in v3:
>   - Change callback names to reflect atomic interfaces.
>   - Move bridge callback change to separate patch as suggested by Dmitry.
>   - Remove psr function declaration from msm_drv.h.
>   - Set self_refresh_aware flag only if psr is supported.
>   - Modify the variable names to simpler form.
>   - Define bit fields for PSR settings.
>   - Add comments explaining the steps to enter/exit psr.
>   - Change DRM_INFO to drm_dbg_db.
>
> Changes in v4:
>   - Move the get crtc functions to drm_atomic.
>   - Add atomic functions for DP bridge too.
>   - Add ternary operator to choose eDP or DP ops.
>   - Return true/false instead of 1/0.
>   - mode_valid missing in the eDP bridge ops.
>   - Move the functions to get crtc into drm_atomic.c.
>   - Fix compilation issues.
>   - Remove dpu_assign_crtc and get crtc from drm_enc instead of dpu_enc.
>   - Check for crtc state enable while reserving resources.
>
> Changes in v5:
>   - Move the mode_valid changes into a different patch.
>   - Complete psr_op_comp only when isr is set.
>   - Move the DP atomic callback changes to a different patch.
>   - Get crtc from drm connector state crtc.
>   - Move to separate patch for check for crtc state enable while
> reserving resources.
>
> Changes in v6:
>   - Remove crtc from dpu_encoder_virt struct.
>   - fix crtc check during vblank toggle crtc.
>   - Misc changes.
>
> Changes in v7:
>   - Add fix for underrun issue on kasan build.
>
> Changes in v8:
>   - Drop the enc spinlock as it won't serve any purpose in
> protetcing conn state.(Dmitry/Doug)
>
> Changes in v9:
>   - Update commit message and fix alignment using spaces.(Marijn)
>   - Misc changes.(Marijn)
>
> Changes in v10:
>   - Get crtc cached in dpu_enc during obj init.(Dmitry)
>
> Changes in v11:
>   - Remove crtc cached in dpu_enc during obj init.
>   - Update dpu_enc crtc state on crtc enable/disable during self refresh.
>
> Changes in v12:
>   - Update sc7180 intf mask to get intf timing gen status
> based on DPU_INTF_STATUS_SUPPORTED bit.(Dmitry)
>   - Remove "clear active interface in the datapath cleanup" change
> as it is already included.
>
> Changes in v13:
>   - Move core changes to top of the series.(Dmitry)
>   - Drop self refresh aware disable change after psr entry.(Dmitry)
>
> Changes in v14:
>   - Set self_refresh_aware for the PSR to kick in.
>
> Vinod Polimera (14):
>   drm: add helper functions to retrieve old and new crtc
>   drm/bridge: use atomic enable/disable callbacks for panel bridge
>   drm/bridge: add psr support for panel bridge callbacks
>   drm/msm/disp/dpu: check for crtc enable rather than crtc active to
>     release shared resources
>   drm/msm/disp/dpu: get timing engine status from intf status register
>   drm/msm/disp/dpu: wait for extra vsync till timing engine status is
>     disabled
>   drm/msm/disp/dpu: reset the datapath after timing engine disable
>   drm/msm/dp: use atomic callbacks for DP bridge ops
>   drm/msm/dp: Add basic PSR support for eDP
>   drm/msm/dp: use the eDP bridge ops to validate eDP modes
>   drm/msm/disp/dpu: use atomic enable/disable callbacks for encoder
>     functions
>   drm/msm/disp/dpu: add PSR support for eDP interface in dpu driver
>   drm/msm/disp/dpu: update dpu_enc crtc state on crtc enable/disable
>     during self refresh
>   drm/msm/dp: set self refresh aware based on psr support
>
>  drivers/gpu/drm/bridge/panel.c                     |  68 +++++++-
>  drivers/gpu/drm/drm_atomic.c                       |  60 +++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  40 ++++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  26 +++-
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |  22 +++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   3 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  12 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |   8 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   2 +-
>  drivers/gpu/drm/msm/dp/dp_catalog.c                |  80 ++++++++++
>  drivers/gpu/drm/msm/dp/dp_catalog.h                |   4 +
>  drivers/gpu/drm/msm/dp/dp_ctrl.c                   |  80 ++++++++++
>  drivers/gpu/drm/msm/dp/dp_ctrl.h                   |   3 +
>  drivers/gpu/drm/msm/dp/dp_display.c                |  36 +++--
>  drivers/gpu/drm/msm/dp/dp_display.h                |   2 +
>  drivers/gpu/drm/msm/dp/dp_drm.c                    | 173 +++++++++++++++=
+++++-
>  drivers/gpu/drm/msm/dp/dp_drm.h                    |   9 +-
>  drivers/gpu/drm/msm/dp/dp_link.c                   |  36 +++++
>  drivers/gpu/drm/msm/dp/dp_panel.c                  |  22 +++
>  drivers/gpu/drm/msm/dp/dp_panel.h                  |   6 +
>  drivers/gpu/drm/msm/dp/dp_reg.h                    |  27 ++++
>  include/drm/drm_atomic.h                           |   7 +
>  22 files changed, 683 insertions(+), 43 deletions(-)

I put these patches on top of msm-next. With that, I was at least able
to see the PSR transition function being called by:

echo "dp_catalog_ctrl_set_psr" > /sys/kernel/debug/tracing/set_ftrace_filte=
r
echo function > /sys/kernel/debug/tracing/current_tracer
echo 1 > /sys/kernel/debug/tracing/tracing_on
cat /sys/kernel/debug/tracing/trace_pipe

I didn't do anything to actually confirm that the panel was in PSR
mode nor that power savings are happening, but at least I can confirm
that the function is being called again (AKA the fix from v13 to v14
seems to have worked).

---

I also backported these to chromeos-5.15 and let a hoglin device sit
there on my desk for a few hours with the cursor blinking to see if I
could see any of the "flickers" that I saw before. I was running a
KASAN build and forcing cpus to the lowest frequencies:

echo userspace > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_min_freq > \
    /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed

echo userspace > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
cat /sys/devices/system/cpu/cpu4/cpufreq/cpuinfo_min_freq > \
    /sys/devices/system/cpu/cpu4/cpufreq/scaling_setspeed

echo userspace > /sys/devices/system/cpu/cpu7/cpufreq/scaling_governor
cat /sys/devices/system/cpu/cpu7/cpufreq/cpuinfo_min_freq > \
    /sys/devices/system/cpu/cpu7/cpufreq/scaling_setspeed

I did manage to see the screen flicker once over a period of an hour
or two. That's not terribly surprising because of the changes in v13
which dropped your previous fix for this. I'll look forward to seeing
a future patch to fix this in the core.

---

In any case, with all the caveats mentioned above, I'm OK with:

Tested-by: Douglas Anderson <dianders@chromium.org>
