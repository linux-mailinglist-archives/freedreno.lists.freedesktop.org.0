Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABFF37252E
	for <lists+freedreno@lfdr.de>; Tue,  4 May 2021 06:42:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DC5B6EA84;
	Tue,  4 May 2021 04:42:28 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A89146EA84
 for <freedreno@lists.freedesktop.org>; Tue,  4 May 2021 04:42:26 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 92-20020a9d02e50000b029028fcc3d2c9eso7205658otl.0
 for <freedreno@lists.freedesktop.org>; Mon, 03 May 2021 21:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=11Nzt21PGgG7EY1Zm8LPZ6J+bFs0Dr0fBy2u4R0XE/M=;
 b=eMDxI/J5JXLmmKxTyVqOM4RrALRwtyMIm7+ZVgBG5CshybG7FGuLkpX5f0siwUVD/Y
 HoFLI68bUSlqWKu34+h4BOf+B3SG6I0D93xctqrZUs8i1JCfWEqKvdEQ8AyQH2KDklLw
 8hkXj1MLvgoLX3BWvOfcXqJ54hj5dHndfr7ic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=11Nzt21PGgG7EY1Zm8LPZ6J+bFs0Dr0fBy2u4R0XE/M=;
 b=SRwjYyLblB65wCZZJWwLBOxQ0u6IBXIiX9mg8iySo8i6q3iCQCm9z6+XwdDakb9Xez
 6Wu46miWBHJw61UqdyHGP9x5kya7iY+gKDI/gQLtmSM38/ek9AIWImhaKC/3zY7ZdQ7C
 VHmM1jOMuE4evB8+nOZmUVJj3+cAoqc/6UV1FfNFbyAljUkrtSUGIy+oeyEEapmkWZNo
 L6QBWnkX3+C0lcSuj/viJ9Ym1P/TCWW4iPMjWG9IWgaH1L+wFkVuOb9oM3mbiaNG7NA3
 ZcgOp9cUHtWvvSbCmzVUUARw3lVo8w00QKSAaaDVePXV8zUsVSs3Oxxa05HgM4cFUraX
 cbBQ==
X-Gm-Message-State: AOAM530GfXqs9U6De+xrRwEx4tUPNVfaMoBU6nnv1Xkzo096ftBx2bif
 PWPhqbjfN4sIHNjDmYhVLTfMtB6HGZA1EM/iHSa7nw==
X-Google-Smtp-Source: ABdhPJxCezCWHhNH1naSml5SlQdlnfQJrJxORDMFSaHhNEWOV1BLyNy+3WNmkZObBEETMxJdHv/XU00MVUB6ixxxRwc=
X-Received: by 2002:a9d:5e19:: with SMTP id d25mr17278425oti.308.1620103346067; 
 Mon, 03 May 2021 21:42:26 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 3 May 2021 21:42:25 -0700
MIME-Version: 1.0
In-Reply-To: <1619048258-8717-4-git-send-email-khsieh@codeaurora.org>
References: <1619048258-8717-1-git-send-email-khsieh@codeaurora.org>
 <1619048258-8717-4-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Mon, 3 May 2021 21:42:25 -0700
Message-ID: <CAE-0n50EW8evqt1NtbjEbSS71CzSAzXR21-FvCrTmvsaj+GGHQ@mail.gmail.com>
To: Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com, sean@poorly.run
Subject: Re: [Freedreno] [PATCH v4 3/4] drm/msm/dp: check main link status
 before start aux read
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
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 abhinavk@codeaurora.org, daniel@ffwll.ch, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2021-04-21 16:37:37)
> Maybe when the cable is disconnected the DP phy should be shutdown and
> some bit in the phy could effectively "cut off" the aux channel and then
> NAKs would start coming through here in the DP controller I/O register
> space. This patch have DP aux channel read/write to return NAK immediately
> if DP controller connection status is in unplugged state.
>
> Changes in V4:
> -- split this patch as stand alone patch
>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_aux.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
> index 7c22bfe..fae3806 100644
> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> @@ -343,6 +343,11 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
>
>         mutex_lock(&aux->mutex);
>
> +       if (!dp_catalog_link_is_connected(aux->catalog)) {
> +               ret = -ETIMEDOUT;
> +               goto unlock_exit;
> +       }
> +
>         aux->native = msg->request & (DP_AUX_NATIVE_WRITE & DP_AUX_NATIVE_READ);
>
>         /* Ignore address only message */

Can the code check for aux timeouts? So instead of blindly completing
'aux->comp' we would do the transfer, and then dp_aux_cmd_fifo_tx()
would check to see if the completion was completed from the irq
handler because of a timeout or a nack, etc. I think the code is
probably racy, given that dp_aux_isr() is called from irq context, and
aux_error_num is set from the irq context and tested in non-irq context.
This code needs a spinlock and then to check the isr bits to figure out
if it should tell the upper layers that the address was wrong, or there
was a nack or a timeout, etc.

I don't think we need to check the link to see if it is connected, just
look at the irq bits to see if the response was bad and letting higher
layers know that should quickly cut off the transactions.
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
