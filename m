Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7552C3F07
	for <lists+freedreno@lfdr.de>; Wed, 25 Nov 2020 12:24:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56EE26E90A;
	Wed, 25 Nov 2020 11:24:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BC666E90A
 for <freedreno@lists.freedesktop.org>; Wed, 25 Nov 2020 11:24:50 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id x25so2430772qkj.3
 for <freedreno@lists.freedesktop.org>; Wed, 25 Nov 2020 03:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=agmpj2HBmWrLN3MVuSVDvn8VNwMgC/NxRRqXNQElq+c=;
 b=Xek41XwpQigUAOEeTJBGHWL790+lASvVIv15zxh3iAJ1zijkjfVfs9eVex27OfCuXA
 kJdW59wrQn1P9fA1QwhwcZG8R3hzDh9VApTT6RicMbfuwQCmYi2DVJmFpe27824jWafL
 Z+HcAq9jhCmUjGVHK+2nF2Y/jqCEFBtWVYC3vbbXALj0NjPLbNx1snXzCd9TOUOPyQPa
 TsvhSX5+VzpEoHmFpb834YUk/5gmOhFG8ZSqrIOfyJ2NHQ/nf0TtsQsaTxmrSe24nIZS
 OyTVn5zFIQ+IEXvHDeNaqtrmH18lXKQrB6Xafri4msJHpPoeH8lbmXm1OqF8yFBOBMB+
 hrlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=agmpj2HBmWrLN3MVuSVDvn8VNwMgC/NxRRqXNQElq+c=;
 b=QLNwcDgv0jW9nISLHEfgeBQjCZD01A/L1cGGaeq+gxPAKqUJtOyXWFgEW9MveTHnp8
 Q2vcEfugKxYObLNHq2AsjCg32KI3620nW84idyEuqcYAVrBeMRa/ABeDAqNzXv+/9KRk
 4uigc6kKA1ch6RtxjTrHQaOt4BY2qr7TEhYcA3Dh9PbzeGMApukA7DOzejKM7ivUnSTN
 Fzb2NuotXtRFGNkX4BAlKWNOfb7J3tbpq+Q40xiEwyTcY9wFa/IcMkIN72zdRparBMPt
 eKw9ZYPwU32KQPRCKbeAidWzfbp1ZSdHlWsZkFM+djzTnJFp9q2Q3ysfL3jim8axbgME
 GfJQ==
X-Gm-Message-State: AOAM531zGHKBmsllelHhmJY5+4DIySMJh64l0gd8sX0tGFDtOpBiCb3g
 PaHH+ms6RazA6W5qy/svpT8qd/MVdU7zVTRdcthcGA==
X-Google-Smtp-Source: ABdhPJwWhnzD0lDZFoqtnfER27VsEtm05heWcR/zUGhYgUn6H9hWU74Sr5XzjkLVg9dn0GVTJoyr0OxmFzYOq0n5cUA=
X-Received: by 2002:a25:7481:: with SMTP id p123mr3005268ybc.167.1606303489272; 
 Wed, 25 Nov 2020 03:24:49 -0800 (PST)
MIME-Version: 1.0
References: <1606298560-3003-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1606298560-3003-1-git-send-email-kalyan_t@codeaurora.org>
From: Amit Pundir <amit.pundir@linaro.org>
Date: Wed, 25 Nov 2020 16:54:13 +0530
Message-ID: <CAMi1Hd3fjrJXJ1puZ6SCn0FXPNZdoJh19GALcVr_R93tZnxW_w@mail.gmail.com>
To: Kalyan Thota <kalyan_t@codeaurora.org>
Subject: Re: [Freedreno] [v1] drm/msm/dpu: consider vertical front porch in
 the prefill bw calculation
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
Cc: Sumit Semwal <sumit.semwal@linaro.org>, dt <devicetree@vger.kernel.org>,
 Krishna Manikandan <mkrishn@codeaurora.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Raviteja Tamatam <travitej@codeaurora.org>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Doug Anderson <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>,
 nganji@codeaurora.org, Sean Paul <seanpaul@chromium.org>,
 abhinavk@codeaurora.org, ddavenport@chromium.org,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>, y@qualcomm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 25 Nov 2020 at 15:33, Kalyan Thota <kalyan_t@codeaurora.org> wrote:
>
> In case of panels with low vertical back porch, the prefill bw
> requirement will be high as we will have less time(vbp+pw) to
> fetch and fill the hw latency buffers before start of first line
> in active period.
>
> For ex:
> Say hw_latency_line_buffers = 24, and if blanking vbp+pw = 10
> Here we need to fetch 24 lines of data in 10 line times.
> This will increase the bw to the ratio of linebuffers to blanking.
>
> DPU hw can also fetch data during vertical front porch provided
> interface prefetch is enabled. Use vfp in the prefill calculation
> as dpu driver enables prefetch if the blanking is not sufficient
> to fill the latency lines.

Tested on Xiaomi Poco F1 (sdm845).

Tested-by: Amit Pundir <amit.pundir@linaro.org>

>
> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 7ea90d2..315b999 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -151,7 +151,7 @@ static void _dpu_plane_calc_bw(struct drm_plane *plane,
>         u64 plane_bw;
>         u32 hw_latency_lines;
>         u64 scale_factor;
> -       int vbp, vpw;
> +       int vbp, vpw, vfp;
>
>         pstate = to_dpu_plane_state(plane->state);
>         mode = &plane->state->crtc->mode;
> @@ -164,6 +164,7 @@ static void _dpu_plane_calc_bw(struct drm_plane *plane,
>         fps = drm_mode_vrefresh(mode);
>         vbp = mode->vtotal - mode->vsync_end;
>         vpw = mode->vsync_end - mode->vsync_start;
> +       vfp = mode->vsync_start - mode->vdisplay;
>         hw_latency_lines =  dpu_kms->catalog->perf.min_prefill_lines;
>         scale_factor = src_height > dst_height ?
>                 mult_frac(src_height, 1, dst_height) : 1;
> @@ -176,7 +177,13 @@ static void _dpu_plane_calc_bw(struct drm_plane *plane,
>                 src_width * hw_latency_lines * fps * fmt->bpp *
>                 scale_factor * mode->vtotal;
>
> -       do_div(plane_prefill_bw, (vbp+vpw));
> +       if ((vbp+vpw) > hw_latency_lines)
> +               do_div(plane_prefill_bw, (vbp+vpw));
> +       else if ((vbp+vpw+vfp) < hw_latency_lines)
> +               do_div(plane_prefill_bw, (vbp+vpw+vfp));
> +       else
> +               do_div(plane_prefill_bw, hw_latency_lines);
> +
>
>         pstate->plane_fetch_bw = max(plane_bw, plane_prefill_bw);
>  }
> --
> 2.7.4
>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
