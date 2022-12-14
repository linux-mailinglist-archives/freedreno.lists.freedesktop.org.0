Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2C364D262
	for <lists+freedreno@lfdr.de>; Wed, 14 Dec 2022 23:29:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1B7010E080;
	Wed, 14 Dec 2022 22:29:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3158810E080
 for <freedreno@lists.freedesktop.org>; Wed, 14 Dec 2022 22:29:39 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id e13so24664855edj.7
 for <freedreno@lists.freedesktop.org>; Wed, 14 Dec 2022 14:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1bSdi2nTZFfN0KO3twl810Uns3X1CbpenS2xYlJiGPM=;
 b=QS+/BUVNsbN6h+tQwIBW7N0LXW4/Jg584fdK+n867YoxGH2EVT3pvpOv0U+9ZxfOF/
 rC+A8JiiEJr2R7MGbILNYNFTad0rr0C8KD/sy/c1V8PbqBkKH32/xb29IPq+heVzZkXp
 klpRQ11wYfFmdLXqkEepJLbDXUndJHe8njFAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1bSdi2nTZFfN0KO3twl810Uns3X1CbpenS2xYlJiGPM=;
 b=v0PyltC3Emu+xkakzBhbjxlkfyBc5rW3KnCmM947BbnYKGbzphRiApJQhnNuXfiwOG
 GhTB6gdHZSYoyLZyw75SSCysGCgECjPEToRM7TVIkvcq/9U40NZZSnVTTXjI5k+OJfUM
 O4tyGVu2UHVkAlaL58ZpqglJxm8Aka1mu85CDVNNA6G4NIedssaeu73ZjZRI3dzcfsio
 M/fivjC65cqJKhXl6ne2kcdAsENvgLvYNuB3OXld951QFOFQLTV9QyABtXNdwsORgXDG
 VH8TTh59qwn1VynV87mJLp6UR0R7Rp3Qaoow4cFBB4vMC9tE9FQiw+4mfuEKb/TsY8EF
 N/Uw==
X-Gm-Message-State: AFqh2kpPW2+arGdxBCtfcRbu+zS3gltocHsswUjzLnjEE3s+xR7mwMa0
 rbqRvZkHnreR5IF6YEP+1mne9uquCh//GInjg8E=
X-Google-Smtp-Source: AMrXdXtOTHlAq6+7IohQOM0F5P4Ssf+IwxgRQHgMmZJ4GpxqaQle/nXFg4qV4QonYK3rY7QiRqFaPA==
X-Received: by 2002:a50:ee17:0:b0:473:bd4:84ca with SMTP id
 g23-20020a50ee17000000b004730bd484camr1657802eds.6.1671056977728; 
 Wed, 14 Dec 2022 14:29:37 -0800 (PST)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com.
 [209.85.128.53]) by smtp.gmail.com with ESMTPSA id
 v17-20020a170906293100b0078e0973d1f5sm6325369ejd.0.2022.12.14.14.29.35
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Dec 2022 14:29:35 -0800 (PST)
Received: by mail-wm1-f53.google.com with SMTP id
 ay14-20020a05600c1e0e00b003cf6ab34b61so517082wmb.2
 for <freedreno@lists.freedesktop.org>; Wed, 14 Dec 2022 14:29:35 -0800 (PST)
X-Received: by 2002:a05:600c:2d91:b0:3d0:69f4:d3d0 with SMTP id
 i17-20020a05600c2d9100b003d069f4d3d0mr191822wmg.93.1671056974914; Wed, 14 Dec
 2022 14:29:34 -0800 (PST)
MIME-Version: 1.0
References: <1671052890-11627-1-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1671052890-11627-1-git-send-email-quic_khsieh@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 14 Dec 2022 14:29:21 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UTeCU7BcfPMXz8J-9uOp_7Fn9PFdtFMsu46x5wKa0RyQ@mail.gmail.com>
Message-ID: <CAD=FV=UTeCU7BcfPMXz8J-9uOp_7Fn9PFdtFMsu46x5wKa0RyQ@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: do not complete
 dp_aux_cmd_fifo_tx() if irq is not for aux transfer
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 quic_abhinavk@quicinc.com, sean@poorly.run, andersson@kernel.org,
 vkoul@kernel.org, dri-devel@lists.freedesktop.org, swboyd@chromium.org,
 robdclark@gmail.com, agross@kernel.org, daniel@ffwll.ch,
 linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org, airlied@gmail.com,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Wed, Dec 14, 2022 at 1:21 PM Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> There are 3 possible interrupt sources are handled by DP controller,
> HPDstatus, Controller state changes and Aux read/write transaction.
> At every irq, DP controller have to check isr status of every interrupt
> sources and service the interrupt if its isr status bits shows interrupts
> are pending. There is potential race condition may happen at current aux
> isr handler implementation since it is always complete dp_aux_cmd_fifo_tx()
> even irq is not for aux read or write transaction. This may cause aux read
> transaction return premature if host aux data read is in the middle of
> waiting for sink to complete transferring data to host while irq happen.
> This will cause host's receiving buffer contains unexpected data. This
> patch fixes this problem by checking aux isr and return immediately at
> aux isr handler if there are no any isr status bits set.
>
> Follows are the signature at kernel logs when problem happen,
> EDID has corrupt header
> panel-simple-dp-aux aux-aea0000.edp: Couldn't identify panel via EDID
> panel-simple-dp-aux aux-aea0000.edp: error -EIO: Couldn't detect panel nor find a fallback
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_aux.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
> index d030a93..8f8b12a 100644
> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> @@ -423,6 +423,13 @@ void dp_aux_isr(struct drm_dp_aux *dp_aux)
>
>         isr = dp_catalog_aux_get_irq(aux->catalog);
>
> +       /*
> +        * if this irq is not for aux transfer,
> +        * then return immediately
> +        */

Why do you need 4 lines for a comment that fits on one line?

> +       if (!isr)
> +               return;

I can confirm that this works for me. I could reproduce the EDID
problems in the past and I can't after this patch. ...so I could give
a:

Tested-by: Douglas Anderson <dianders@chromium.org>

I'm not an expert on this part of the code, so feel free to ignore my
other comments if everyone else thinks this patch is fine as-is, but
to me something here feels a little fragile. It feels a little weird
that we'll "complete" for _any_ interrupt that comes through now
rather than relying on dp_aux_native_handler() / dp_aux_i2c_handler()
to specifically identify interrupts that caused the end of the
transfer. I guess that idea is that every possible interrupt we get
causes the end of the transfer?

-Doug
