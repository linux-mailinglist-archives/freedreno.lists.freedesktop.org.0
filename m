Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DB42FB238
	for <lists+freedreno@lfdr.de>; Tue, 19 Jan 2021 08:00:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF9F66E826;
	Tue, 19 Jan 2021 07:00:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF01C6E829
 for <freedreno@lists.freedesktop.org>; Tue, 19 Jan 2021 07:00:31 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id e70so3411805ote.11
 for <freedreno@lists.freedesktop.org>; Mon, 18 Jan 2021 23:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TB6FTIfittFs99dug22EPlbke7plMpi7fTZPZrg+0CE=;
 b=UfFuyUq4YZunDhcSrPRGQWTcnz0pmPg4Uvk+3+WFFn8kejqKwQngot05xy/ZfWXo1n
 tQjn3xm0qNwH0VJ/lrvp20l5Gp/ncfSUrdFS8uGr+KpTxUhp+hodDqDjkHZTeAJ8lJDT
 FbGa3LddeIelpkFa8UvSjmvPx/nRiDgj3/r/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TB6FTIfittFs99dug22EPlbke7plMpi7fTZPZrg+0CE=;
 b=R7nYh49AfTY2TDy3ix5/Ax2+8t/7GmpIpKSeRVIEofKfMDPpaJ7eDBVVMMJsNscc04
 ZMgWLYEVWFAlx3ApN7bxzCsZy01GT5XW+k1w0uJBNrVdUpSEoKWZ53yUgUtqSUi6dpKI
 VTvoyJ3lFn0OCNsCWBLnbn0ugk8cbTUiPnciZlzHvNvQaX6Ql3ucyQDdUvX504BfYPYm
 s9FRK1yqFCqmEuTqMM+AFqgMbdTSo3GkV762afSfOQv0/2jvHDP9FViz2UUyfQidYw/S
 5Cap1a7G/GcVq9SoDorhMcurn6zHFVbHKmeWmQMgMN3aRwjl948sQND2EXZjIH3tzBYR
 BTMQ==
X-Gm-Message-State: AOAM532LV4tL9Jqz00R+D9vBSPigHVvTHDC66fur+ebUW6YFSROjCL2Z
 496w4Lyvl1w9U5AVYuOUNNToVHNPiXdbKkts4YMp+Q==
X-Google-Smtp-Source: ABdhPJxXid5tfYESEzvOWaKE8HbioQrlcSyKOGoWm/5iR/86kHI6lj4Dy2chyY/WDn6CPSrHjhUv7s+NFTpNllHybSw=
X-Received: by 2002:a9d:ea6:: with SMTP id 35mr2452410otj.188.1611039631002;
 Mon, 18 Jan 2021 23:00:31 -0800 (PST)
MIME-Version: 1.0
References: <CAOMZO5D_dDTOgDZNy-NkQSPTiKhmrNKjEiqFWGX4rbZr2grDxQ@mail.gmail.com>
 <CAOMZO5DbgM6kPbNsu2XJcZsRauwey9UttSomquY8L4eyDLtZgw@mail.gmail.com>
 <CAOMZO5CP=xW8kFZpQxb35odUBs_9+-EDawENHeCLmVoMEYOnMA@mail.gmail.com>
In-Reply-To: <CAOMZO5CP=xW8kFZpQxb35odUBs_9+-EDawENHeCLmVoMEYOnMA@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 19 Jan 2021 08:00:19 +0100
Message-ID: <CAKMK7uFmY7u84QOSrWy_qRDQQAzEP-97ALmP2e9N+9mXiwWA8Q@mail.gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [Freedreno] Reboot crash at msm_atomic_commit_tail
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
Cc: Jonathan Marek <jonathan@marek.ca>, Sean Paul <sean@poorly.run>,
 Jordan Crouse <jcrouse@codeaurora.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sascha Hauer <kernel@pengutronix.de>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, Jan 18, 2021 at 11:00 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> On Mon, Jan 18, 2021 at 6:44 PM Fabio Estevam <festevam@gmail.com> wrote:
> >
> > Adding some more folks in case anyone has any suggestions to fix this
> > reboot hang.
>
> Not sure if this is a valid fix, but the change below makes reboot
> works correctly.
>
> kmscube still works.
>
> --- a/drivers/gpu/drm/msm/msm_atomic.c
> +++ b/drivers/gpu/drm/msm/msm_atomic.c
> @@ -207,8 +207,12 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
>         struct msm_kms *kms = priv->kms;
>         struct drm_crtc *async_crtc = NULL;
>         unsigned crtc_mask = get_crtc_mask(state);
> -       bool async = kms->funcs->vsync_time &&
> -                       can_do_async(state, &async_crtc);
> +       bool async;
> +
> +       if (!kms)
> +               return;

That looks a bit like a hack papering over the real issue.

From your report it sounds like earlier kernels worked, did you
attempt bisecting? Also for regressions put regressions into the
subject, it's the magic work that gets much more attention.
-Daniel

> +
> +       async = kms->funcs->vsync_time && can_do_async(state, &async_crtc);
>
>         trace_msm_atomic_commit_tail_start(async, crtc_mask);
>
> Any comments?
>
> Thanks
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
