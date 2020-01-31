Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD47E14F2D5
	for <lists+freedreno@lfdr.de>; Fri, 31 Jan 2020 20:37:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0665A6FBDF;
	Fri, 31 Jan 2020 19:37:49 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 319F76FBD3
 for <freedreno@lists.freedesktop.org>; Fri, 31 Jan 2020 18:08:35 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id m10so9365943wmc.0
 for <freedreno@lists.freedesktop.org>; Fri, 31 Jan 2020 10:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kYOKSEFF1BtF9aJwHzx6v8WXqAWKyMBvX++xdlfE4d8=;
 b=iYSfoyHTsGlXKZ4IO0n64y0Xqn7f8PjxKdcCYPDJWYitw/g6eGxDn3V5rE/Xe8Ktla
 vYUmCX3I5mkCkzLmizMb67m/NdRR8sV/C9hZTZ0vHD/UfetrAh0lC3OGmXy2jUwobG9B
 Lw5eMdV0NCU7UAYlEhmwrE47UkhqC/PBGJkUSmJHsyJNkunH4eja/PlkCQccI8kaxO5q
 8HC+SngAl3zd2bWqaGlKv2k2h3/nFk7FO93xsxEdBhkDOth6tBP0ohNkeYK24ENkXBav
 8XTCNb/UW9j/06AdAD1hFtSfBACG9prcTAk/s3SkTNbNKV0fqlHKWLLJIL+JtGVL1wzH
 Dpew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kYOKSEFF1BtF9aJwHzx6v8WXqAWKyMBvX++xdlfE4d8=;
 b=sN1ogxrNQgDKxK/P9UofJoMufCu2CAsbMgiZH3WYjmyd/GmE8eFMFw+autQK0BwK6/
 74+dAdeXvgxINeREoQNr5Sk7lTWsgScfQgHtLu8i1rUykteoyiLqr3LD3eNrXOfphEi1
 8oVsW0cUb6/X3wT7W7hj7yQeMV39+3tPHTg1mfps0nY3zqEQ/9AGGyt+XETRo8GBZtQf
 CXbSTNQEQvoZIvdSwzvz05ucnLlYyaK1aoWccmd9IbYoYjpf4wYBxFAUI0d4CQPj2+U9
 aF84TEqrNKkdZ5MviiTVK2HIYnuJcwnuZM2Af1nNhtUb5aS498oGmut64+ZpwSOg9rYA
 SIIw==
X-Gm-Message-State: APjAAAVMUAt2Qox9+4n/Wx7R5ubOfcPhY8OHAbsAWM7e9O1bz7jVhPJT
 8sgpaVWdm7iJJnHJTvZr58VM+TiFA1Y0Wx6L/xFxcg==
X-Google-Smtp-Source: APXvYqyhZyRGCBxAeZg+IW09HBdaPjaVlM6D9DWfNiUlhVSeaPJsVbBU1kH/80Y6uYbH7F/mIN7daAvKakWdC3THYQg=
X-Received: by 2002:a7b:c94a:: with SMTP id i10mr13239142wml.88.1580494113721; 
 Fri, 31 Jan 2020 10:08:33 -0800 (PST)
MIME-Version: 1.0
References: <20200129201244.65261-1-john.stultz@linaro.org>
In-Reply-To: <20200129201244.65261-1-john.stultz@linaro.org>
From: Amit Pundir <amit.pundir@linaro.org>
Date: Fri, 31 Jan 2020 23:37:57 +0530
Message-ID: <CAMi1Hd3bWmhSSrbYoM59LP5NuxJt2JWwiXBacOyNxpnx-73w_Q@mail.gmail.com>
To: John Stultz <john.stultz@linaro.org>
X-Mailman-Approved-At: Fri, 31 Jan 2020 19:37:47 +0000
Subject: Re: [Freedreno] [PATCH] drm: msm: Fix return type of
 dsi_mgr_connector_mode_valid for kCFI
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
Cc: Alistair Delva <adelva@google.com>, freedreno@lists.freedesktop.org,
 lkml <linux-kernel@vger.kernel.org>, clang-built-linux@googlegroups.com,
 Rob Clark <robdclark@gmail.com>, Sami Tolvanen <samitolvanen@google.com>,
 Sean Paul <sean@poorly.run>, Sumit Semwal <sumit.semwal@linaro.org>,
 Todd Kjos <tkjos@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 30 Jan 2020 at 01:42, John Stultz <john.stultz@linaro.org> wrote:
>
> I was hitting kCFI crashes when building with clang, and after
> some digging finally narrowed it down to the
> dsi_mgr_connector_mode_valid() function being implemented as
> returning an int, instead of an enum drm_mode_status.
>
> This patch fixes it, and appeases the opaque word of the kCFI
> gods (seriously, clang inlining everything makes the kCFI
> backtraces only really rough estimates of where things went
> wrong).
>
> Thanks as always to Sami for his help narrowing this down.
>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Sami Tolvanen <samitolvanen@google.com>
> Cc: Todd Kjos <tkjos@google.com>
> Cc: Alistair Delva <adelva@google.com>
> Cc: Amit Pundir <amit.pundir@linaro.org>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: freedreno@lists.freedesktop.org
> Cc: clang-built-linux@googlegroups.com
> Signed-off-by: John Stultz <john.stultz@linaro.org>

Tested-by: Amit Pundir <amit.pundir@linaro.org>
Cc: stable@vger.kernel.org # v4.4+

> ---
>  drivers/gpu/drm/msm/dsi/dsi_manager.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> index 271aa7bbca925..355a60b4a536f 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> @@ -336,7 +336,7 @@ static int dsi_mgr_connector_get_modes(struct drm_connector *connector)
>         return num;
>  }
>
> -static int dsi_mgr_connector_mode_valid(struct drm_connector *connector,
> +static enum drm_mode_status dsi_mgr_connector_mode_valid(struct drm_connector *connector,
>                                 struct drm_display_mode *mode)
>  {
>         int id = dsi_mgr_connector_get_id(connector);
> --
> 2.17.1
>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
