Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C910C1C1DD6
	for <lists+freedreno@lfdr.de>; Fri,  1 May 2020 21:26:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67D8A6ECE8;
	Fri,  1 May 2020 19:26:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C28C6ED36
 for <freedreno@lists.freedesktop.org>; Fri,  1 May 2020 19:26:53 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id s9so8333539eju.1
 for <freedreno@lists.freedesktop.org>; Fri, 01 May 2020 12:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WSBsQZ2+xdpIGJHeWYCQoQ8u8zj8iW41GKBmcCq8Vf4=;
 b=DLoHcXmcvTFS/+twF+21LyXQXa4r4cYqQemg0TWHfg58oMuYNXGlh4SbNe1B1cZWqa
 pujm5ZCp6nUNtWH1bpuP7OT1zBdLGI8kmzc5Gkuw3zLLyc2k8omqAuPDaalUhwAbPtcx
 C3eBYHxenOfc1KBPb2qSB/tdUOXMWOqyoiWoqzwNtZNoLeaCYjZB8AFmnHlC1Ak1PwhO
 0Q9DHbS3rT5WcnA/M6enVwME+JEpBS9mSZZsAGVyC2CT6CuKaAgJTGLFM+EwSuHx/QjA
 0hAqt5i/jSubHG67tR13+UV9Qq9vkTRzsw09F5Mqov72qHjl+ZMBVjy+KYXUz32XgIPu
 kX1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WSBsQZ2+xdpIGJHeWYCQoQ8u8zj8iW41GKBmcCq8Vf4=;
 b=KAkXhWoxv0DCjQuZ6G8xvTcr7+jZk5fFI6DnJDGTa5TKGg5OSgnR+zJBw5Tqt5//La
 EXZdT6NaPcy8Zf/WYT/iISFOsabfilVe5i0dZoMm/aKCNRpKKghAENGXcC74a3f9CyaT
 hJmkNeLemOdE/+MaV+WVp4Ile7j2UzR47ryfFvxcCK4YdivYmNht1GBx31b+vEq3eK2E
 /4iMkxZqZ6XbSsK6dSNb6e2QdWYd1Ss26tlkRFrEE7FKWQs3t76TB84utIX8mlLs6NhW
 zBY7cib38yOyZkohWqckwUJdfGv+26tqSS+Jjs6IrmTczbCobey4wZ6A21EVysaTKcgC
 U7Uw==
X-Gm-Message-State: AGi0PubmlISZ7uWhsGkcBbd7n/lQWcWBC2ZgrjXjR8+oUB8R8qCDMoJ3
 ZepAKGg4aIzhXhIy4cXSCjjkuwzbDxlHj7wMThigpw==
X-Google-Smtp-Source: APiQypLApNY61otSA22NZA39/hjaktQy51DUgGFWhUfIxiTrwN68t56bqzU5r5Zim7TgQ4ysNdZzyPE3WcKZnLt9dbU=
X-Received: by 2002:a17:907:214d:: with SMTP id
 rk13mr4810578ejb.220.1588361211835; 
 Fri, 01 May 2020 12:26:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200501190320.17681-1-jcrouse@codeaurora.org>
In-Reply-To: <20200501190320.17681-1-jcrouse@codeaurora.org>
From: Eric Anholt <eric@anholt.net>
Date: Fri, 1 May 2020 12:26:40 -0700
Message-ID: <CADaigPXJJoEgWK6nx8yc_DVsDAv1VdzuA5NYZO63K=hHVvT2JQ@mail.gmail.com>
To: Jordan Crouse <jcrouse@codeaurora.org>
Subject: Re: [Freedreno] [PATCH v2] drm/msm: Check for powered down HW in
 the devfreq callbacks
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
Cc: freedreno@lists.freedesktop.org, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 Rob Clark <robdclark@gmail.com>, Ben Dooks <ben.dooks@codethink.co.uk>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, May 1, 2020 at 12:03 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> Writing to the devfreq sysfs nodes while the GPU is powered down can
> result in a system crash (on a5xx) or a nasty GMU error (on a6xx):
>
>  $ /sys/class/devfreq/5000000.gpu# echo 500000000 > min_freq
>   [  104.841625] platform 506a000.gmu: [drm:a6xx_gmu_set_oob]
>         *ERROR* Timeout waiting for GMU OOB set GPU_DCVS: 0x0
>
> Despite the fact that we carefully try to suspend the devfreq device when
> the hardware is powered down there are lots of holes in the governors that
> don't check for the suspend state and blindly call into the devfreq
> callbacks that end up triggering hardware reads in the GPU driver.
>
> Call pm_runtime_get_if_in_use() in the gpu_busy() and gpu_set_freq()
> callbacks to skip the hardware access if it isn't active.
>
> v2: Use pm_runtime_get_if_in_use() per Eric Anholt
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
>
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 6 ++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 8 ++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 7 +++++++
>  3 files changed, 21 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index 724024a2243a..4d7f269edfcc 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -1404,6 +1404,10 @@ static unsigned long a5xx_gpu_busy(struct msm_gpu *gpu)
>  {
>         u64 busy_cycles, busy_time;
>
> +       /* Only read the gpu busy if the hardware is already active */
> +       if (pm_runtime_get_if_in_use(&gpu->pdev->dev) <= 0)
> +               return 0;
> +

RPM's APIs are a bit of a trap and will return a negative errno for
the get functions if runtime PM is disabled in kconfig, even though
usually that would mean that the power domain is not ever disabled by
RPM.  I think in these checks you want "if (pm_runtime_get_if_in_use()
== 0)", and that seems to be a common pattern in other drivers.  With
that,

Reviewed-by: Eric Anholt <eric@anholt.net>

(and tested, too)
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
