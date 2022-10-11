Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E330E5FB7CF
	for <lists+freedreno@lfdr.de>; Tue, 11 Oct 2022 17:56:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C64F10E645;
	Tue, 11 Oct 2022 15:56:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com
 [IPv6:2607:f8b0:4864:20::929])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A7D210E63A
 for <freedreno@lists.freedesktop.org>; Tue, 11 Oct 2022 15:56:45 +0000 (UTC)
Received: by mail-ua1-x929.google.com with SMTP id i20so5183110ual.4
 for <freedreno@lists.freedesktop.org>; Tue, 11 Oct 2022 08:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wH1Bl8itt96KxBsAlutBeKuPO2AccjwjUzu7pu+C0go=;
 b=cHQS7SWHH1gASscavrPWCc246E7BVCVrvaxgOLz953W9ZYcFihTNZv8KTxGIoPE6VO
 oxondL9qq+lJt4+IbHPqqpuaTIVC17a3n1VJ1GNQMzW5Pm1mS57FLx+5CAdHEkcfl7wu
 Wwm66Rp6rTnBPjtVSfACGBqcakSKTvYQ47tmUJBN0sqjUjgLWyAS3SJ/fPNfhEGngrt2
 0ZoJeZbPXX2MoCGE4SpvxUHGHv/Ovju656QRtnZJsqWpbYmlQ7pygRvr4N6pOUPceDQl
 dwHTSyp+zflFhfPwKszINz4PuTsGqtK2Jefl0RHElZbs7PwM+DjGcWnKFSSCX9OIqkfU
 4q6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wH1Bl8itt96KxBsAlutBeKuPO2AccjwjUzu7pu+C0go=;
 b=xC1h6IkK6RwuFeaTc1/h4dWCqMBbLscC2U8PD7zW6kleQ8fdhPVrYjVQhJXT8CwfyR
 OZB38k3pvtWsPZgRhk+pGEmXyRSShrcShfmjxcg2sqxQsxUD/E7WV2b5rwaZzNk8Q0VM
 aIoWA98u2R3Db4Dd+eVzd9L3A1eKKq3wOMOx5+QZPT0e1I8lA0+mSGmw2atzBDocLDhS
 kzmkQ4tcspjU72IVXqK+uTVuF6b+lhbnrV7EETgPtxxVcupemJbB9FDtZAMGuM0wMm1B
 NY0Y4J9PFz0qtfd1FelaFeMc59ggOpkLe72y5Fesv896JRSa9+LrzAldXJjkZg+iMigv
 CjLw==
X-Gm-Message-State: ACrzQf1bSUVuAkVPv718elFbxEjhcYgT/gbiTS2kspKYoq8MzNro4FLZ
 98TSLJnrv5OFwMT10hcWwdHd5iZm5bA/ADszkkJYjw==
X-Google-Smtp-Source: AMsMyM7hO86TNlZ7RU1O5BbKxgzcrBU9iEjAHsEU8uEo45EdTTocB+iB/ZslSLRzKUzF+PENEMSkZ/nzKg+/gEiZ/rg=
X-Received: by 2002:ab0:7a5b:0:b0:3b3:8eb9:5a25 with SMTP id
 a27-20020ab07a5b000000b003b38eb95a25mr11832841uat.55.1665503804335; Tue, 11
 Oct 2022 08:56:44 -0700 (PDT)
MIME-Version: 1.0
References: <20221011075519.3111928-1-shraash@google.com>
In-Reply-To: <20221011075519.3111928-1-shraash@google.com>
From: Guenter Roeck <groeck@google.com>
Date: Tue, 11 Oct 2022 08:56:33 -0700
Message-ID: <CABXOdTdum0q=2Fy3yM3OnGmHM9ZkNyEURx6C08879ND7ye=vxg@mail.gmail.com>
To: Aashish Sharma <shraash@google.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm: Remove redundant check for 'submit'
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 kernel test robot <lkp@intel.com>, David Airlie <airlied@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Guenter Roeck <groeck@chromium.org>, Sean Paul <sean@poorly.run>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, Oct 11, 2022 at 12:55 AM Aashish Sharma <shraash@google.com> wrote:
>
> Rectify the below smatch warning:
> drivers/gpu/drm/msm/msm_gem_submit.c:963 msm_ioctl_gem_submit() warn:
> variable dereferenced before check 'submit'
>
> 'submit' is normally error pointer or valid, so remove its NULL
> initializer as it's confusing and also remove a redundant check for it's
> value.
>
> Signed-off-by: Aashish Sharma <shraash@google.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  drivers/gpu/drm/msm/msm_gem_submit.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index 5599d93ec0d2..74fe1c56cd65 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -706,7 +706,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>         struct msm_drm_private *priv = dev->dev_private;
>         struct drm_msm_gem_submit *args = data;
>         struct msm_file_private *ctx = file->driver_priv;
> -       struct msm_gem_submit *submit = NULL;
> +       struct msm_gem_submit *submit;
>         struct msm_gpu *gpu = priv->gpu;
>         struct msm_gpu_submitqueue *queue;
>         struct msm_ringbuffer *ring;
> @@ -946,8 +946,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>                 put_unused_fd(out_fence_fd);
>         mutex_unlock(&queue->lock);
>  out_post_unlock:
> -       if (submit)
> -               msm_gem_submit_put(submit);
> +       msm_gem_submit_put(submit);
>         if (!IS_ERR_OR_NULL(post_deps)) {
>                 for (i = 0; i < args->nr_out_syncobjs; ++i) {
>                         kfree(post_deps[i].chain);
> --
> 2.38.0.rc2.412.g84df46c1b4-goog
>
