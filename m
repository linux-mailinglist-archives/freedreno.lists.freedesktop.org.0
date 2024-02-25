Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F5C862CF0
	for <lists+freedreno@lfdr.de>; Sun, 25 Feb 2024 21:53:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F095210E3C9;
	Sun, 25 Feb 2024 20:52:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="a4FG4tBW";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9322010E3D1
 for <freedreno@lists.freedesktop.org>; Sun, 25 Feb 2024 20:52:58 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-dcc80d6006aso2422882276.0
 for <freedreno@lists.freedesktop.org>; Sun, 25 Feb 2024 12:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708894377; x=1709499177; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QEF/S3FO4Q33ze4M3cBnVyDS/8zKGmdhSYFLrdph210=;
 b=a4FG4tBWcXn1AJrtBrlnP9wcdiH1Xz/40yOxy39nsQh/r+cz6EpE4eSrrSUQ8vBSiT
 iZdI+lp/OoMFkflpFdFAe9LPOgRY5DKzdg0FEPsv9Rp16kJgFPjljq6N6LbZOdG8JCBV
 PQ3XH+WFf2DwNTeq6N6775qEr1PWcpiRlTERyvYcnMwvt3lgPmnikyOuK5oWJqeZt6S4
 zRjeyanBXwmx1z2U6fBfG+9tipR1jVGmuVc73QGTHCGRSnK7KwIbo4ivWtr5vZ4WVCKV
 8xYsMLHxYADMAVFtXydgAQCIdSX0Wv/pRjzBx5WKPN5UjpV8JZ1FGUD7j8+36JlLbMb0
 EJjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708894377; x=1709499177;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QEF/S3FO4Q33ze4M3cBnVyDS/8zKGmdhSYFLrdph210=;
 b=C18vqEvDrYQJDwnlYSICUOGBKQheOHrHTSF8x+Y+jZbO8aHpO8wk5ZmMSu1qcWED+1
 6iq9X+58oENunafbP0F9pwy7XffRAaJmQxna1ygPY2EV1Z/ojPjWGKJhD5FgZOL1AK5+
 YWlK6yrEYzJhfUH9YszHzW3YJCHnJlhgqv6k8gnReaageuHTn5LmB505g33fo5ReMcjm
 CJPBAQy48wmhXuVXPBjh2EFNhhAXItzTl0edoIz3ryoZ4Wemf7V7Hlsh7QYrCtsu2BP8
 NrG2dO3RBy5iVkeRS96FO8DDyi563D3BK+Ko+KTx7z/wstwW7ie4d1/o1IzLn1vycDUK
 Euqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlBaHpaZj/wQwePUn+PoPhIxq6TiQQonwHjcaG56goShdBweHCUY33tfWEVFQq1K8ZQynl5g0/XvwdM8E13DkeLVKVd7MPoJyFR5P+Ny3h
X-Gm-Message-State: AOJu0YxNPxDr4qU/s0QMKLsgxHDpvjXT5PJ9uytOoLtuEj19ZUt7OYVB
 uB0l1iIkXdkUCL03Q+4nU2EZIZmRKV1qMH0gYaxk6LqKpsycLDxxb9Jhd1votrwLmQd5g0SiXtN
 LI2LeN77IyflrRF6RPDNxFdvU8ld6CkRh7imUEw==
X-Google-Smtp-Source: AGHT+IEu2gQjWRGESwuhoH6/gMiZreyz+jquBhBzb1azftBmUXdGMBuG2ZgDmCAYK0stkp6kLMFWmjF0Msrr8esEpWA=
X-Received: by 2002:a25:ab66:0:b0:dcf:56c1:5a12 with SMTP id
 u93-20020a25ab66000000b00dcf56c15a12mr2374113ybi.38.1708894377255; Sun, 25
 Feb 2024 12:52:57 -0800 (PST)
MIME-Version: 1.0
References: <20240225-fd-dpu-debug-timeout-v3-0-252f2b21cdcc@linaro.org>
 <20240225-fd-dpu-debug-timeout-v3-2-252f2b21cdcc@linaro.org>
 <f3c304b3-7cd3-6f90-c438-8c2c0ded8bd2@quicinc.com>
In-Reply-To: <f3c304b3-7cd3-6f90-c438-8c2c0ded8bd2@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 25 Feb 2024 22:52:46 +0200
Message-ID: <CAA8EJpqfERqpxeSY_cd=T4Rdfjh6SsGOj7phN_cpfByaM7pt1Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] drm/msm/dpu: split dpu_encoder_wait_for_event into
 two functions
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Steev Klimaszewski <steev@kali.org>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Sun, 25 Feb 2024 at 21:49, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 2/25/2024 6:12 AM, Dmitry Baryshkov wrote:
> > Stop multiplexing several events via the dpu_encoder_wait_for_event()
> > function. Split it into two distinct functions two allow separate
> > handling of those events.
> >
>
> I understand the idea but would handling of those events be really distinct?

We are interested in capturing the state after the first
wait_for_commit_done() timeout. The wait_for_tx_complete doesn't need
such handling. Even if we were to handle it in some way, it would be a
different conditional.

Last but not least, I don't like multiplexing just for the sake of it.
There is nearly no common behaviour.

>
> Like if wait_for_commit_done timedout or wait_for_tx_complete timedout,
> the handling will be similar from my PoV.
>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 74 +++++++++++++++++++++--------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 22 ++-------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  2 +-
> >   drivers/gpu/drm/msm/msm_drv.h               | 10 ----
> >   4 files changed, 59 insertions(+), 49 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > index 194dbb08331d..30f349c8a1e5 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -1282,7 +1282,7 @@ static void dpu_encoder_virt_atomic_disable(struct drm_encoder *drm_enc,
> >       trace_dpu_enc_disable(DRMID(drm_enc));
> >
> >       /* wait for idle */
> > -     dpu_encoder_wait_for_event(drm_enc, MSM_ENC_TX_COMPLETE);
> > +     dpu_encoder_wait_for_tx_complete(drm_enc);
> >
> >       dpu_encoder_resource_control(drm_enc, DPU_ENC_RC_EVENT_PRE_STOP);
> >
> > @@ -2402,10 +2402,23 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
> >       return &dpu_enc->base;
> >   }
> >
> > -int dpu_encoder_wait_for_event(struct drm_encoder *drm_enc,
> > -     enum msm_event_wait event)
> > +/**
> > + * dpu_encoder_wait_for_commit_done() - Wait for encoder to flush pending state
> > + * @drm_enc: encoder pointer
> > + *
> > + * Wait for hardware to have flushed the current pending frames to hardware at
> > + * a vblank or ctl_start Encoders will map this differently depending on the
> > + * panel type.
> > + *
>
> Missing a '.' between ctl_start and Encoder?

Ack. Also I should drop the leftovers afterwards.

>
> > + * MSM_ENC_TX_COMPLETE -  Wait for the hardware to transfer all the pixels to
> > + *                        the panel. Encoders will map this differently
> > + *                        depending on the panel type.
> > + *                        vid mode -> vsync_irq
> > + *                        cmd mode -> pp_done
> > + * Return: 0 on success, -EWOULDBLOCK if already signaled, error otherwise
> > + */
> > +int dpu_encoder_wait_for_commit_done(struct drm_encoder *drm_enc)
> >   {
> > -     int (*fn_wait)(struct dpu_encoder_phys *phys_enc) = NULL;
> >       struct dpu_encoder_virt *dpu_enc = NULL;
> >       int i, ret = 0;
> >
> > @@ -2419,23 +2432,46 @@ int dpu_encoder_wait_for_event(struct drm_encoder *drm_enc,
> >       for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> >               struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
> >
> > -             switch (event) {
> > -             case MSM_ENC_COMMIT_DONE:
> > -                     fn_wait = phys->ops.wait_for_commit_done;
> > -                     break;
> > -             case MSM_ENC_TX_COMPLETE:
> > -                     fn_wait = phys->ops.wait_for_tx_complete;
> > -                     break;
> > -             default:
> > -                     DPU_ERROR_ENC(dpu_enc, "unknown wait event %d\n",
> > -                                     event);
> > -                     return -EINVAL;
> > +             if (phys->ops.wait_for_commit_done) {
> > +                     DPU_ATRACE_BEGIN("wait_for_commit_done");
> > +                     ret = phys->ops.wait_for_commit_done(phys);
> > +                     DPU_ATRACE_END("wait_for_commit_done");
> > +                     if (ret)
> > +                             return ret;
> >               }
> > +     }
> > +
> > +     return ret;
> > +}
> > +
> > +/**
> > + * dpu_encoder_wait_for_tx_complete() - Wait for encoder to transfer pixels to panel
> > + * @drm_enc: encoder pointer
> > + *
> > + * Wait for the hardware to transfer all the pixels to the panel. Encoders will
> > + * map this differently depending on the panel type.
> > + *
> > + * Return: 0 on success, -EWOULDBLOCK if already signaled, error otherwise
> > + */
> > +int dpu_encoder_wait_for_tx_complete(struct drm_encoder *drm_enc)
> > +{
> > +     struct dpu_encoder_virt *dpu_enc = NULL;
> > +     int i, ret = 0;
> > +
> > +     if (!drm_enc) {
> > +             DPU_ERROR("invalid encoder\n");
> > +             return -EINVAL;
> > +     }
> > +     dpu_enc = to_dpu_encoder_virt(drm_enc);
> > +     DPU_DEBUG_ENC(dpu_enc, "\n");
> > +
> > +     for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> > +             struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
> >
> > -             if (fn_wait) {
> > -                     DPU_ATRACE_BEGIN("wait_for_completion_event");
> > -                     ret = fn_wait(phys);
> > -                     DPU_ATRACE_END("wait_for_completion_event");
> > +             if (phys->ops.wait_for_tx_complete) {
> > +                     DPU_ATRACE_BEGIN("wait_for_tx_complete");
> > +                     ret = phys->ops.wait_for_tx_complete(phys);
> > +                     DPU_ATRACE_END("wait_for_tx_complete");
> >                       if (ret)
> >                               return ret;
> >               }
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> > index fe6b1d312a74..0c928d1876e4 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> > @@ -93,25 +93,9 @@ void dpu_encoder_kickoff(struct drm_encoder *encoder);
> >    */
> >   int dpu_encoder_vsync_time(struct drm_encoder *drm_enc, ktime_t *wakeup_time);
> >
> > -/**
> > - * dpu_encoder_wait_for_event - Waits for encoder events
> > - * @encoder: encoder pointer
> > - * @event:      event to wait for
> > - * MSM_ENC_COMMIT_DONE -  Wait for hardware to have flushed the current pending
> > - *                        frames to hardware at a vblank or ctl_start
> > - *                        Encoders will map this differently depending on the
> > - *                        panel type.
> > - *                     vid mode -> vsync_irq
> > - *                        cmd mode -> ctl_start
> > - * MSM_ENC_TX_COMPLETE -  Wait for the hardware to transfer all the pixels to
> > - *                        the panel. Encoders will map this differently
> > - *                        depending on the panel type.
> > - *                        vid mode -> vsync_irq
> > - *                        cmd mode -> pp_done
> > - * Returns: 0 on success, -EWOULDBLOCK if already signaled, error otherwise
> > - */
> > -int dpu_encoder_wait_for_event(struct drm_encoder *drm_encoder,
> > -                                             enum msm_event_wait event);
> > +int dpu_encoder_wait_for_commit_done(struct drm_encoder *drm_encoder);
> > +
> > +int dpu_encoder_wait_for_tx_complete(struct drm_encoder *drm_encoder);
> >
> >   /*
> >    * dpu_encoder_get_intf_mode - get interface mode of the given encoder
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > index d6412395bacc..26b5e54031d9 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > @@ -476,7 +476,7 @@ static void dpu_kms_wait_for_commit_done(struct msm_kms *kms,
> >                * mode panels. This may be a no-op for command mode panels.
> >                */
> >               trace_dpu_kms_wait_for_commit_done(DRMID(crtc));
> > -             ret = dpu_encoder_wait_for_event(encoder, MSM_ENC_COMMIT_DONE);
> > +             ret = dpu_encoder_wait_for_commit_done(encoder);
> >               if (ret && ret != -EWOULDBLOCK) {
> >                       DPU_ERROR("wait for commit done returned %d\n", ret);
> >                       break;
> > diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> > index 762e13e2df74..91cf57f72321 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.h
> > +++ b/drivers/gpu/drm/msm/msm_drv.h
> > @@ -74,16 +74,6 @@ enum msm_dsi_controller {
> >   #define MSM_GPU_MAX_RINGS 4
> >   #define MAX_H_TILES_PER_DISPLAY 2
> >
> > -/**
> > - * enum msm_event_wait - type of HW events to wait for
> > - * @MSM_ENC_COMMIT_DONE - wait for the driver to flush the registers to HW
> > - * @MSM_ENC_TX_COMPLETE - wait for the HW to transfer the frame to panel
> > - */
> > -enum msm_event_wait {
> > -     MSM_ENC_COMMIT_DONE = 0,
> > -     MSM_ENC_TX_COMPLETE,
> > -};
> > -
> >   /**
> >    * struct msm_display_topology - defines a display topology pipeline
> >    * @num_lm:       number of layer mixers used
> >



-- 
With best wishes
Dmitry
