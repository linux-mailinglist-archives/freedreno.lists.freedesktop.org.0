Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3184A43B79F
	for <lists+freedreno@lfdr.de>; Tue, 26 Oct 2021 18:53:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D530689E01;
	Tue, 26 Oct 2021 16:53:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E626389E01
 for <freedreno@lists.freedesktop.org>; Tue, 26 Oct 2021 16:53:11 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id s19so20338379wra.2
 for <freedreno@lists.freedesktop.org>; Tue, 26 Oct 2021 09:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DM+aJPjsd48FUeJElqQHCbFgsOMymWLw+lsiNqSlzXg=;
 b=WJX7nKNlKxTAaJ1K5jyrLkCetXEeMs36mDlugrjFC97UEg9FEHzPJTBavQBb70HNMV
 AFkH5K1juVFYViscnCu/1CTEnL/WR8nxZhcBmVXn2N7rBRQh8FrgV7siPVVf0oHaHiec
 /5vNHxf6bvxq6dBIPSqpRuLqPQARibnsfOQsWVAyVVNO2NwcBH9gtfyY2b1M7N2Y55xQ
 UXCLTxaH0tmkv5Mj7Viw0Dp2YBgy/lQ+b30P5QUnLZYjy2fF/u4s6OaOrdwjnN3H7Z+x
 AVpph8NVC00eG1Cx4jUbLfxpQOvnlHVd7a8QKW4IRJJMTeq7G6+vwbAkVj0Y8A/InNNT
 DATA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DM+aJPjsd48FUeJElqQHCbFgsOMymWLw+lsiNqSlzXg=;
 b=kczhT34QwFpHT6fCU/myxE3fTiJ0O0/gUp01tsqRdOwiq2Wo1etXFPDcnQQTTt7Ljo
 9g5KSD+yZdMbiCRb2G2xEvxH7H9e4KEDIZ/Ouz3uQAuvETNqLozIe/WSlgTlze9KCEsX
 rlLIgZd6WMpF42FDkox0ApbBFD0CvHChTnDudaVVqKuhpcupptpjqP6ZpGiWW9K3nDNT
 NUeGi1xjOGew4996Krx9nydu07Nga1Vf9GX0H25/SCxLb9YkCFdEG9NVtsLYEvg36inI
 JzaC08t95u2Ajxg0HDkhQpAIw6S6zq86C9cgaeB/PhijYA1STJ3U+CoDm0V3lDfmpZQE
 plLA==
X-Gm-Message-State: AOAM532nP98IV9szA7cejGJp3mdmc8jMb8UTs8c3qL1YNySTQksEmxrO
 4zqQI2MK34/2MgV2On7JomCyKoN4+kQOam1m00ncQ+HP
X-Google-Smtp-Source: ABdhPJyv6ySr3f13pX6/rGh854q2f2e9oKVNMojw5SdliRIWOoFzd/ZKJto0acTyBgFOYHKPuhpm0VnEbXNTqB4MmcU=
X-Received: by 2002:a5d:64c8:: with SMTP id f8mr33527882wri.398.1635267190450; 
 Tue, 26 Oct 2021 09:53:10 -0700 (PDT)
MIME-Version: 1.0
References: <1635204907-412-1-git-send-email-quic_abhinavk@quicinc.com>
In-Reply-To: <1635204907-412-1-git-send-email-quic_abhinavk@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 26 Oct 2021 09:58:01 -0700
Message-ID: <CAF6AEGvZRuhRXnMzcMyo8DvPw6ASkLyPOaAE8ufW6du37Y7Q4g@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 freedreno <freedreno@lists.freedesktop.org>,
 Greg KH <gregkh@linuxfoundation.org>, 
 Sean Paul <seanpaul@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 nganji@codeaurora.org, 
 aravindh@codeaurora.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] MAINTAINERS: update designated reviewer entry for
 MSM DRM driver
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, Oct 25, 2021 at 4:35 PM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Adding myself as a designated reviewer to assist with the
> code reviews for the changes coming into MSM DRM.
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Acked-by: Rob Clark <robdclark@gmail.com>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5b33791..503112d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5938,6 +5938,7 @@ M:        Sean Paul <sean@poorly.run>
>  L:     linux-arm-msm@vger.kernel.org
>  L:     dri-devel@lists.freedesktop.org
>  L:     freedreno@lists.freedesktop.org
> +R:     Abhinav Kumar <quic_abhinavk@quicinc.com>
>  S:     Maintained
>  T:     git https://gitlab.freedesktop.org/drm/msm.git
>  F:     Documentation/devicetree/bindings/display/msm/
> --
> 2.7.4
>
