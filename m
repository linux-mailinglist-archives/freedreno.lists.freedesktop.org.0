Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4236A7401
	for <lists+freedreno@lfdr.de>; Wed,  1 Mar 2023 20:06:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C21510E0ED;
	Wed,  1 Mar 2023 19:06:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9668210E0ED
 for <freedreno@lists.freedesktop.org>; Wed,  1 Mar 2023 19:06:34 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id y14so6892560ilv.4
 for <freedreno@lists.freedesktop.org>; Wed, 01 Mar 2023 11:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4nKAIImYnR4VY+mZrL40T8w+LQbikOjFpNewqlXCyj8=;
 b=OV8S586G9AFm1/8w9oYCFIsznJuud/neA8wqia26BClD7KXP2fGeGaDSsVRI8TIL37
 4io6dzUbTNvMTMEN1uTw4P/Dv4z7VnZh6cp25YrBJ2G6r35Jszp2pJQSK3255wnfYC4j
 h9AZfEPujFC6V+vLfeqxylvCcgQFSaDqrbeN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4nKAIImYnR4VY+mZrL40T8w+LQbikOjFpNewqlXCyj8=;
 b=ylXwTdtKyxQsexNoh4JdOvsv+0+6lLbPhHjZJG7Zt6p22x2l8JZ8sPtMdnkFoNrdvm
 sxPJ9xblSHXvlwT5ORaCbNs96Xc10vksYu1/+BjNCQxoNLnCE+A4nrmfMBmmnIqyUdL0
 v0YB39X4/+11j+Q870ohiQY/fgWXG81t5YOxGRzV+c+VpdS0Z0+sb01y387AbVwZH15F
 M7AEfVmH2pIuJfLu/F5eDcShyfbwWswieo8ssjUFzB0TFOkfQVLHXBqMdU8hzOEnEOH6
 MCx/C2/l8td5Gqambd3JA5Lci2P2SI6fa+fOum35/RMdZuS77Wv9NmXyyf8x26v6mbKb
 s2Kg==
X-Gm-Message-State: AO0yUKX9KMyb0UdABu+8/avpUDF2Gh2773pCsIuuvz/kYJkDiJ16toTR
 lAPRlC8ywh4ibemuHM0SF7qbHmPr76YPADcw
X-Google-Smtp-Source: AK7set+PmUpMOABoqafkaIFzmX+uAnsAiGJ9naeDcO/NELBGfyRRcQ5Y5vyNCOR/bDMQwYrET8ua0g==
X-Received: by 2002:a05:6e02:1a27:b0:316:e033:86ba with SMTP id
 g7-20020a056e021a2700b00316e03386bamr6395593ile.31.1677697593325; 
 Wed, 01 Mar 2023 11:06:33 -0800 (PST)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com.
 [209.85.166.53]) by smtp.gmail.com with ESMTPSA id
 r5-20020a92ce85000000b00316e3a38becsm3779425ilo.18.2023.03.01.11.06.31
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Mar 2023 11:06:31 -0800 (PST)
Received: by mail-io1-f53.google.com with SMTP id d12so5801911ioe.10
 for <freedreno@lists.freedesktop.org>; Wed, 01 Mar 2023 11:06:31 -0800 (PST)
X-Received: by 2002:a02:858c:0:b0:3c5:1971:1b7f with SMTP id
 d12-20020a02858c000000b003c519711b7fmr3401570jai.6.1677697590506; Wed, 01 Mar
 2023 11:06:30 -0800 (PST)
MIME-Version: 1.0
References: <1676219337-6526-1-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1676219337-6526-1-git-send-email-quic_vpolimer@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 1 Mar 2023 11:06:19 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XvjFQ-7KNsW2YQQ-LzJonCcHz_rj-oOhB0jh_99ficKA@mail.gmail.com>
Message-ID: <CAD=FV=XvjFQ-7KNsW2YQQ-LzJonCcHz_rj-oOhB0jh_99ficKA@mail.gmail.com>
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

On Sun, Feb 12, 2023 at 8:29=E2=80=AFAM Vinod Polimera
<quic_vpolimer@quicinc.com> wrote:
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
> Vinod Polimera (13):
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

I'm curious what the plan is for landing this series. I could land the
first two in drm-misc if you want, but I'm a lowly committer and so I
couldn't make an immutable branch for you nor can I officially Ack the
changes to land in your branch. That means you'd be blocked for an
extra version. Do you already have a plan? If not, then maybe we need
to get in touch with one of the maintainers [1] of drm-misc? That's
documented [2] to be in their set of responsibilities.

[1] https://drm.pages.freedesktop.org/maintainer-tools/repositories.html#dr=
m-misc-repository
[2] https://drm.pages.freedesktop.org/maintainer-tools/maintainer-drm-misc.=
html#maintainer-s-duties

-Doug
