Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9654FA06C
	for <lists+freedreno@lfdr.de>; Sat,  9 Apr 2022 02:06:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F8AC10F23C;
	Sat,  9 Apr 2022 00:06:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34F1810E227
 for <freedreno@lists.freedesktop.org>; Sat,  9 Apr 2022 00:06:54 +0000 (UTC)
Received: by mail-qv1-xf2e.google.com with SMTP id t9so4697107qvd.3
 for <freedreno@lists.freedesktop.org>; Fri, 08 Apr 2022 17:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1k6iLY0Sudq6bD8a2o9/5Y9vGDy0Ty1UHyUSaVtK5/E=;
 b=WO7NRHdgsGgShWssE4KZmx5Crzkop58DmBiu2kU2evwqUpHP6keMMDLgjrAmE7XIYw
 Lri2mCKwcwFizod56jA+IOHPFJAfZv2BIm3WyFhbbT8AT0tjlJqiRi7jdfXwuvI8m11s
 dtmnr3ygIrHO6xctm07t7VE9Kw5bf1ECwzhNagMlsF1IB2YjXp1ABcTsywqgWXoTd20S
 OH08D++ttEus/iqInpw2OP1VAev8Zes+Q7FuN5Cd9cWRdjXFvdh7w6PTqqyQWfZX16CO
 e59vIdAXnHrwWsGc/x/oISNoKtG7Oe5XiQhhsPjob9ACULrXBtpBtVZR5zgK50f7Qzxj
 GMBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1k6iLY0Sudq6bD8a2o9/5Y9vGDy0Ty1UHyUSaVtK5/E=;
 b=wxvJBOSHdK7dc6libyTnSzoPewjjL+2uLWt0plQjvFSlf8lc3KCJ/VfVcUhHLYfA+Z
 gBNroxVHISooV13kaBhMS+caRnvBW0UQ+4I0Tp/XquQFKW5bfhYercQGVuDy6fBKrok9
 36RSsH/LX55WjM+HwTSu2sHyLoWLtcMNGg9GzwW/H/vTdyxdtK8ExM6ka/udC4QAxPVU
 zO8nY95BAmJ0o52ewxtNQNp2eRc2vQkM/zZf1BJcn5i5AE5KG2Y8AZQpO1b30Uuhj0f0
 IIFuBxMrTdkkh1YVhm+xsiHRaEyC0YSvyQNREADL+EXIUrYJZNQRamgTwv/5uFDv4fb7
 1Jgw==
X-Gm-Message-State: AOAM531H430teZruuL5b+nWVOAa5ySNmOHoj/FgtQRysO2fHnVl3O6TJ
 C++6dhljDKZQjkkXV+lB8UalrVE/PCn4WLecCfj9rw==
X-Google-Smtp-Source: ABdhPJxMwBnJy1/5ajpEfEKria8ImS3O8GaTTh1+JHZ/4S7dCNM6HgIemhFd6yGo9B0iTimRK6GaefIOyjsPI7VKlcc=
X-Received: by 2002:a05:6214:921:b0:443:ce3d:577b with SMTP id
 dk1-20020a056214092100b00443ce3d577bmr18468477qvb.122.1649462812263; Fri, 08
 Apr 2022 17:06:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220408211230.601475-1-olvaffe@gmail.com>
In-Reply-To: <20220408211230.601475-1-olvaffe@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 9 Apr 2022 03:06:41 +0300
Message-ID: <CAA8EJpoMrOj6OoCjMGkSQFoc6GPGS1C=mqtoC+5Ph+vOZzntew@mail.gmail.com>
To: Chia-I Wu <olvaffe@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm: add trace_dma_fence_emit to
 msm_gpu_submit
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Sean Paul <sean@poorly.run>, Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sat, 9 Apr 2022 at 00:12, Chia-I Wu <olvaffe@gmail.com> wrote:
>
> In practice, trace_dma_fence_init is good enough and almost no driver
> calls trace_dma_fence_emit.  But this is still more correct in theory.

Please mention in the commit message that the trace_dma_fence_init()
is called from dma_fence_init().
With that in place:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>
> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
> Cc: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_gpu.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index faf0c242874e..a82193f41ea2 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -15,6 +15,7 @@
>  #include <linux/string_helpers.h>
>  #include <linux/devcoredump.h>
>  #include <linux/sched/task.h>
> +#include <trace/events/dma_fence.h>
>
>  /*
>   * Power Management:
> @@ -769,6 +770,7 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>         gpu->active_submits++;
>         mutex_unlock(&gpu->active_lock);
>
> +       trace_dma_fence_emit(submit->hw_fence);
>         gpu->funcs->submit(gpu, submit);
>         gpu->cur_ctx_seqno = submit->queue->ctx->seqno;
>
> --
> 2.35.1.1178.g4f1659d476-goog
>


-- 
With best wishes
Dmitry
