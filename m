Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A222212D9B9
	for <lists+freedreno@lfdr.de>; Tue, 31 Dec 2019 16:21:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A010C6E241;
	Tue, 31 Dec 2019 15:21:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C20486E23F
 for <freedreno@lists.freedesktop.org>; Tue, 31 Dec 2019 15:21:11 +0000 (UTC)
Received: by mail-il1-x143.google.com with SMTP id f10so30368591ils.8
 for <freedreno@lists.freedesktop.org>; Tue, 31 Dec 2019 07:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M7wDnYJLkdZ3OOSrLZqOeBqYHWkaMb/EXIdOIWi2ux8=;
 b=cbmWvu809wZwdtci+lKYzW4AhYVpnBdlWm0HloHr3t0MlPEoqkF+d3fd81CayHS+fh
 /A5cRX5GGeuxhJP503RVB9OZnzNuQCi33fmHjYSpw4ibMEb507/yR94QpjQCbTtvR4lI
 2ZR1pqe2d7rGSsTnq5T/ocPoKQjPUSsxO9bUua5KZW1NXDr+JCaOVDiiXIwU1Itc9Zu1
 A0XVdMFQvblvWdVT8PcxSdFkKxJ41sNrAYO4zptbeglWbEsFKtccfsBEa3PuoXrSgQEc
 96nk7odHY5j7Ts6/fRh/1njXnhM1uuPGX/TTkcTq0TmGb9jMorJph/R6weDxi8hEbJKL
 KKEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M7wDnYJLkdZ3OOSrLZqOeBqYHWkaMb/EXIdOIWi2ux8=;
 b=czsLIr2ahogzkzOKNzQYxnZjE+bJjugb35U4WA2VkIb4OXd8CZlhj1SHBd/5udiWeK
 x6Fwtiq9R+bVMHgfjggVrFSiptorgZLdwdrGv5QpJobHNFJqCuoYAfgtnYvhbVzB+Hj6
 F5nB8UiFaKSThMzL5dUjD+F6hEbjg/To7tb46pE3VfZQI4tUJUdwJ3TZi4Ogst7jrowE
 mHDIcrVMBnMf2AGD+bWzQdxBjiELImzLHSaLrcDIndLuVWTrX67fv7enpw+oR7Wphqr7
 fiYBGc4AZK1/7jMOpDJfXnvfZ7CV4iwdPxH0hvnK86ETFvfFMFIqsjH1O+fe7ArCEBTJ
 Ed/g==
X-Gm-Message-State: APjAAAUh2L4UOwY+83rg8dFzp9jKt7xAPr32G/FmfQwlTPgtAJN6+p77
 0PSiCMUGtZwEQHVe/A7xnXoiD1juLYwYrUdJEYhetQ==
X-Google-Smtp-Source: APXvYqy3MQrOnoaWbnV7vTPuZtjUUgc057hivbXdtKRtupkYm0cWiXJtUpFsHUEFrTtUPNyNYDJrHT3Sn1/xfTDTMZ0=
X-Received: by 2002:a92:5d92:: with SMTP id e18mr60949654ilg.75.1577805671148; 
 Tue, 31 Dec 2019 07:21:11 -0800 (PST)
MIME-Version: 1.0
References: <20191230194102.2843-1-wambui.karugax@gmail.com>
In-Reply-To: <20191230194102.2843-1-wambui.karugax@gmail.com>
From: Sean Paul <sean@poorly.run>
Date: Tue, 31 Dec 2019 10:20:35 -0500
Message-ID: <CAMavQKLzkP6WKkxkNRYmvo7uhJFuvXjs_ryasFEMi3MeGMhaGQ@mail.gmail.com>
To: Wambui Karuga <wambui.karugax@gmail.com>
Subject: Re: [Freedreno] [PATCH] drm/msm: use BUG_ON macro for debugging.
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
Cc: Dave Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, Dec 30, 2019 at 2:41 PM Wambui Karuga <wambui.karugax@gmail.com> wrote:
>
> As the if statement only checks for the value of the offset_name
> variable, it can be replaced by the more conscise BUG_ON macro for error
> reporting.
>
> Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index c7441fb8313e..0fe7907f5a7d 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -315,10 +315,7 @@ OUT_PKT7(struct msm_ringbuffer *ring, uint8_t opcode, uint16_t cnt)
>  static inline bool adreno_reg_check(struct adreno_gpu *gpu,
>                 enum adreno_regs offset_name)
>  {
> -       if (offset_name >= REG_ADRENO_REGISTER_MAX ||
> -                       !gpu->reg_offsets[offset_name]) {
> -               BUG();
> -       }
> +       BUG_ON(offset_name >= REG_ADRENO_REGISTER_MAX || !gpu->reg_offsets[offset_name]);
>

Minor nit: This line is longer than 80 chars

Other than that,

Reviewed-by: Sean Paul <sean@poorly.run>

>         /*
>          * REG_SKIP is a special value that tell us that the register in
> --
> 2.17.1
>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
