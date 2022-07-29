Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D75375848FE
	for <lists+freedreno@lfdr.de>; Fri, 29 Jul 2022 02:20:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 820EC1122AD;
	Fri, 29 Jul 2022 00:20:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF472113F23
 for <freedreno@lists.freedesktop.org>; Fri, 29 Jul 2022 00:20:21 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id mf4so5812724ejc.3
 for <freedreno@lists.freedesktop.org>; Thu, 28 Jul 2022 17:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=tGjb0yv2qHz2eed9IZ1i5rTk8Eynn94CI4Wx2sUGweo=;
 b=W9UAjOx5uPpd1JmlPNKp+NtqaVYeLK4GU1GwKzuPItS0Z1ouoQaVMhWQsrgrYFQOp0
 aUa26Wr96X2xIdpAxHirM+flYD2rApHRg6w2J8IJPrwyPRbaLlUmbV9Ybol+YsHq94gB
 8CpnLiwr6jQWt/Q3/NbCJzjMzVDbbpAazFGn0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=tGjb0yv2qHz2eed9IZ1i5rTk8Eynn94CI4Wx2sUGweo=;
 b=BtHGQfhlseTi8kChA93ls4dQ7SOQhLwKyJdXATqDKyRghzOi9TfFoS+Vm7v0mlnLRl
 lE6NPPbSAOEC/EF3etM+nKIlftqcdKe7fRyUJAdMV1A3089Lpv+smu3uTSfBxLDhdVDa
 HMM6uYfv4wkrvMpP7+Pa29x0EHB4+K03Pab+DddrP5YFubjS0RbH/KMwMPmYUIgQVN7C
 LPbMbdQU84dZvN0b02e82+dO/1dU5jRYTkWUts63pui3nI3SqWApyKTVTOqvpZl4LEkq
 7ywWoIuGI0HRZBCLdokWY9BPyqHZ6wvp/+5TRNxSqpqo8Gs+0kLqUiUausZUgyFLSPRQ
 3Rig==
X-Gm-Message-State: AJIora97yP9hodJAfmmR9eFLi3A0HpFPQueJk6lzoTB11nG//PE+sqG5
 1oGt6x6xvRJrKEMzyx/LFJ7Swurd4u09G/rQ
X-Google-Smtp-Source: AGRyM1tDAlfna0CRkP9TjmfQjQFQkeRk1SAuPkJcL+eKLQYbCCFU5bbDK6ep/p4+ClcgSXs638Zvog==
X-Received: by 2002:a17:907:1c95:b0:72b:4e37:7736 with SMTP id
 nb21-20020a1709071c9500b0072b4e377736mr955043ejc.516.1659054019353; 
 Thu, 28 Jul 2022 17:20:19 -0700 (PDT)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com.
 [209.85.221.45]) by smtp.gmail.com with ESMTPSA id
 i13-20020a056402054d00b0043ca6fb7e7dsm1486376edx.68.2022.07.28.17.20.18
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jul 2022 17:20:18 -0700 (PDT)
Received: by mail-wr1-f45.google.com with SMTP id m13so202027wrq.6
 for <freedreno@lists.freedesktop.org>; Thu, 28 Jul 2022 17:20:18 -0700 (PDT)
X-Received: by 2002:a5d:5889:0:b0:21d:bccd:38e3 with SMTP id
 n9-20020a5d5889000000b0021dbccd38e3mr698162wrf.659.1659054018014; Thu, 28 Jul
 2022 17:20:18 -0700 (PDT)
MIME-Version: 1.0
References: <1657544224-10680-1-git-send-email-quic_vpolimer@quicinc.com>
 <1657544224-10680-5-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1657544224-10680-5-git-send-email-quic_vpolimer@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 28 Jul 2022 17:20:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UN2tFNL=T+eXE4j7bnp6zWgCN4Nz8Q=qgu7y67yRPpdA@mail.gmail.com>
Message-ID: <CAD=FV=UN2tFNL=T+eXE4j7bnp6zWgCN4Nz8Q=qgu7y67yRPpdA@mail.gmail.com>
To: Vinod Polimera <quic_vpolimer@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v6 04/10] drm/msm/dp: Add basic PSR support
 for eDP
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
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Mon, Jul 11, 2022 at 5:57 AM Vinod Polimera
<quic_vpolimer@quicinc.com> wrote:
>
> @@ -359,6 +367,24 @@ void dp_catalog_ctrl_lane_mapping(struct dp_catalog *dp_catalog)
>                         ln_mapping);
>  }
>
> +void dp_catalog_ctrl_psr_mainlink_enable(struct dp_catalog *dp_catalog,
> +                                               bool enable)
> +{
> +       u32 val;
> +       struct dp_catalog_private *catalog = container_of(dp_catalog,
> +                               struct dp_catalog_private, dp_catalog);
> +
> +       val = dp_read_link(catalog, REG_DP_MAINLINK_CTRL);
> +       val &= ~DP_MAINLINK_CTRL_ENABLE;

nit: the line above is useless. Remove. In the case that you're
enabling you're just adding the bit back in. In the case that you're
disabling you're doing the exact same operation below.


> @@ -610,6 +636,47 @@ void dp_catalog_ctrl_hpd_config(struct dp_catalog *dp_catalog)
>         dp_write_aux(catalog, REG_DP_DP_HPD_CTRL, DP_DP_HPD_CTRL_HPD_EN);
>  }
>
> +static void dp_catalog_enable_sdp(struct dp_catalog_private *catalog)
> +{
> +       /* trigger sdp */
> +       dp_write_link(catalog, MMSS_DP_SDP_CFG3, UPDATE_SDP);
> +       dp_write_link(catalog, MMSS_DP_SDP_CFG3, !UPDATE_SDP);

!UPDATE_SDP is a really counter-intuitive way to say 0x0.


> @@ -645,6 +712,20 @@ u32 dp_catalog_hpd_get_intr_status(struct dp_catalog *dp_catalog)
>         return isr & (mask | ~DP_DP_HPD_INT_MASK);
>  }
>
> +int dp_catalog_ctrl_read_psr_interrupt_status(struct dp_catalog *dp_catalog)

Why is the return type "int" and not "u32". It's a hardware register.
It's u32 here. The caller assigns it to a u32.


> +void dp_ctrl_set_psr(struct dp_ctrl *dp_ctrl, bool enter)
> +{
> +       struct dp_ctrl_private *ctrl = container_of(dp_ctrl,
> +                       struct dp_ctrl_private, dp_ctrl);
> +
> +       if (!ctrl->panel->psr_cap.version)
> +               return;
> +
> +       /*
> +        * When entering PSR,
> +        * 1. Send PSR enter SDP and wait for the PSR_UPDATE_INT
> +        * 2. Turn off video
> +        * 3. Disable the mainlink
> +        *
> +        * When exiting PSR,
> +        * 1. Enable the mainlink
> +        * 2. Send the PSR exit SDP
> +        */
> +       if (enter) {
> +               reinit_completion(&ctrl->psr_op_comp);
> +               dp_catalog_ctrl_set_psr(ctrl->catalog, true);
> +
> +               if (!wait_for_completion_timeout(&ctrl->psr_op_comp,
> +                       PSR_OPERATION_COMPLETION_TIMEOUT_JIFFIES)) {
> +                       DRM_ERROR("PSR_ENTRY timedout\n");
> +                       dp_catalog_ctrl_set_psr(ctrl->catalog, false);
> +                       return;
> +               }
> +
> +               dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
> +
> +               dp_catalog_ctrl_psr_mainlink_enable(ctrl->catalog, false);
> +       } else {
> +               dp_catalog_ctrl_psr_mainlink_enable(ctrl->catalog, true);
> +
> +               dp_catalog_ctrl_set_psr(ctrl->catalog, false);

My PSR knowledge is not very strong, but I do remember a recent commit
from Brian Norris fly by for the Analogix controller. See commit
c4c6ef229593 ("drm/bridge: analogix_dp: Make PSR-exit block less").

In that commit it sounds as if we need to wait for _something_ (resync
I guess?) here and not just return instantly.


> @@ -388,6 +388,8 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
>
>         edid = dp->panel->edid;
>
> +       dp->dp_display.psr_supported = !!dp->panel->psr_cap.version;
> +

nit: remove the "!!". You're already storing this in a "bool" which
will handle this for you.


> +static const struct drm_bridge_funcs edp_bridge_ops = {
> +       .atomic_enable = edp_bridge_atomic_enable,
> +       .atomic_disable = edp_bridge_atomic_disable,
> +       .atomic_post_disable = edp_bridge_atomic_post_disable,
> +       .mode_set = dp_bridge_mode_set,
> +       .mode_valid = dp_bridge_mode_valid,
> +       .atomic_reset = drm_atomic_helper_bridge_reset,
> +       .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +       .atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +       .atomic_check = edp_bridge_atomic_check,
> +};

nit: the location of your new functions is a little weird. You've got:

1. DP functions
2. eDP functions
3. eDP structure
4. DP structure

I'd expect:

1. DP functions
2. DP structure
3. eDP functions
4. eDP structure

-Doug
