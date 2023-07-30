Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFC2768784
	for <lists+freedreno@lfdr.de>; Sun, 30 Jul 2023 21:40:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 183AA10E12C;
	Sun, 30 Jul 2023 19:40:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 334AA10E12C
 for <freedreno@lists.freedesktop.org>; Sun, 30 Jul 2023 19:40:47 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-d075a831636so4132056276.3
 for <freedreno@lists.freedesktop.org>; Sun, 30 Jul 2023 12:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690746046; x=1691350846;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=u4O6ZawXer3mVTKnarrWqBgcfvMFoUQwRwHCG0qCv6M=;
 b=YURPGLGBB1udt43SyXJLPr6YSyuKRpJh2BlXpo5LOP3NhD/wrG8+hLu6coJzmdzM6R
 zwWJAE4edjJ9woRWILGI2ygDJMay3lUr5K7cmsaxTl7ibFvsBrsIiB9ouBsKjlXb6lAX
 Fpd3ywIb/WdQKM04X8A7Qs+KSvmFXwb9/cBs6l6SpLugOZCJDQ+4kpsG3qsYm8F9ai0D
 7ShzQ+yb+fG6ZpBdQAEYlDC5IY6ERZQ54nYAqq9kUgFYrR79scZoThcHgCDOsXEdws5b
 KMEo4PxoqZ6wHXpUbNHe254Ynd/aol8fobUHovnKmVqakOincHrMYXkKAx+IYwnlpIga
 zuqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690746046; x=1691350846;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u4O6ZawXer3mVTKnarrWqBgcfvMFoUQwRwHCG0qCv6M=;
 b=S7BHXp9U5KPwlY6NP32/urvypo5D6bfiVQd8hUKENdyECMJPOqwtKJYIIheo/V36CW
 CgasijNz50nQfdEgUZ8ar/ywx/xFCmgQmMvod7XAb+jL0hxr/AaUTQZdyOhZeuvLt9qz
 e1Kcw2e3Y6vrcwWbLEoJPQAZBlbQLyFO0Oi06fjxD/H09c4ya+EsKZ5DHgYh3xUQHinr
 4NhGyDlK4t5iuc8xSuxaH+jY9O7O2zpRTaYXP7Dnu7tmyrl2Wya2fVJYNL76wVa1AvJA
 kikbTmPiJlVlMGfylIRucPGc8wWzJdNy3f3Z+RMWtjFMpfamoCwZ+8YpYiRACawmEQ8T
 dw1g==
X-Gm-Message-State: ABy/qLZaS+N9Z+U7KJFYj1HmZhRtAQBUWVlPtFKOrjDH7c61Xj8BOs41
 QBlWQqg53ivzfuT8+KjHqzq3NNYg3RTl1+DKSvFnVQ==
X-Google-Smtp-Source: APBJJlG/E4H+Ws4wp1OY0jmhlntSeOAzMEu9y3NjgImS4fPIhQ7TgI+F3vmL3g5OCB4EGO7wqR+AQcs55RErWUO1OFo=
X-Received: by 2002:a25:dc86:0:b0:c73:9c0e:179d with SMTP id
 y128-20020a25dc86000000b00c739c0e179dmr8338466ybe.55.1690746046237; Sun, 30
 Jul 2023 12:40:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230729222708.329265-1-dmitry.baryshkov@linaro.org>
 <20230729222708.329265-7-dmitry.baryshkov@linaro.org>
 <sa6htfdgpht34fz72l2jkrtho6gbcdrxzfeuoi4hgcd5slleik@u4hpd7h42ogk>
In-Reply-To: <sa6htfdgpht34fz72l2jkrtho6gbcdrxzfeuoi4hgcd5slleik@u4hpd7h42ogk>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 30 Jul 2023 22:40:35 +0300
Message-ID: <CAA8EJpoDzf3cjEm9K16TUkUqJQT1A_wnzEebc78d5_99X16M6Q@mail.gmail.com>
To: Marijn Suijten <marijn.suijten@somainline.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v4 6/7] drm/msm/dpu: stop using raw IRQ
 indices in the kernel traces
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sun, 30 Jul 2023 at 22:39, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> On 2023-07-30 01:27:07, Dmitry Baryshkov wrote:
> > In preparation to reworking IRQ indcies, stop using raw indices in
> > kernel traces. Instead use a pair of register index and bit. This
> > corresponds closer to the values in HW catalog.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  6 +-
> >  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c |  8 +--
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h     | 72 +++++++++++--------
> >  3 files changed, 49 insertions(+), 37 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > index b81daa415efb..126ad2707dba 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -413,7 +413,7 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
> >       } else {
> >               ret = 0;
> >               trace_dpu_enc_irq_wait_success(DRMID(phys_enc->parent),
> > -                     func, irq_idx,
> > +                     func, DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx),
> >                       phys_enc->hw_pp->idx - PINGPONG_0,
> >                       atomic_read(wait_info->atomic_cnt));
> >       }
> > @@ -1554,7 +1554,9 @@ static int dpu_encoder_helper_wait_event_timeout(
> >                               atomic_read(info->atomic_cnt) == 0, jiffies);
> >               time = ktime_to_ms(ktime_get());
> >
> > -             trace_dpu_enc_wait_event_timeout(drm_id, irq_idx, rc, time,
> > +             trace_dpu_enc_wait_event_timeout(drm_id,
> > +                                              DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx),
> > +                                              rc, time,
> >                                                expected_time,
> >                                                atomic_read(info->atomic_cnt));
> >       /* If we timed out, counter is valid and time is less, wait again */
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> > index b1592d73470d..04e5b889c6d6 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> > @@ -546,7 +546,7 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
> >               return -EBUSY;
> >       }
> >
> > -     trace_dpu_core_irq_register_callback(irq_idx, irq_cb);
> > +     trace_dpu_core_irq_register_callback(DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx), irq_cb);
> >       irq_entry->arg = irq_arg;
> >       irq_entry->cb = irq_cb;
> >
> > @@ -558,7 +558,7 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
> >                         DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
> >       spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
> >
> > -     trace_dpu_irq_register_success(irq_idx);
> > +     trace_dpu_irq_register_success(DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
> >
> >       return 0;
> >  }
> > @@ -579,7 +579,7 @@ int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx)
> >            DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
> >
> >       spin_lock_irqsave(&dpu_kms->hw_intr->irq_lock, irq_flags);
> > -     trace_dpu_core_irq_unregister_callback(irq_idx);
> > +     trace_dpu_core_irq_unregister_callback(DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
> >
> >       ret = dpu_hw_intr_disable_irq_locked(dpu_kms->hw_intr, irq_idx);
> >       if (ret)
> > @@ -592,7 +592,7 @@ int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx)
> >
> >       spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
> >
> > -     trace_dpu_irq_unregister_success(irq_idx);
> > +     trace_dpu_irq_unregister_success(DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
> >
> >       return 0;
> >  }
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> > index 1a92d21094f4..b64bd8eba26c 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> > @@ -168,46 +168,50 @@ TRACE_EVENT(dpu_perf_crtc_update,
> >  );
> >
> >  DECLARE_EVENT_CLASS(dpu_irq_template,
> > -     TP_PROTO(int irq_idx),
> > -     TP_ARGS(irq_idx),
> > +     TP_PROTO(unsigned int irq_reg, unsigned int irq_bit),
> > +     TP_ARGS(irq_reg, irq_bit),
> >       TP_STRUCT__entry(
> > -             __field(        int,                    irq_idx         )
> > +             __field(        unsigned int,           irq_reg         )
> > +             __field(        unsigned int,           irq_bit         )
> >       ),
> >       TP_fast_assign(
> > -             __entry->irq_idx = irq_idx;
> > +             __entry->irq_reg = irq_reg;
> > +             __entry->irq_bit = irq_bit;
> >       ),
> > -     TP_printk("irq=%d", __entry->irq_idx)
> > +     TP_printk("IRQ=[%d, %d]", __entry->irq_reg, __entry->irq_bit)
>
> Regarding the other patch: IRQ=[...] works for me too, as long as it's
> consistent.

Yes, maybe it will be more consistent.

> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
>
> >  );
> >  DEFINE_EVENT(dpu_irq_template, dpu_irq_register_success,
> > -     TP_PROTO(int irq_idx),
> > -     TP_ARGS(irq_idx)
> > +     TP_PROTO(unsigned int irq_reg, unsigned int irq_bit),
> > +     TP_ARGS(irq_reg, irq_bit)
> >  );
> >  DEFINE_EVENT(dpu_irq_template, dpu_irq_unregister_success,
> > -     TP_PROTO(int irq_idx),
> > -     TP_ARGS(irq_idx)
> > +     TP_PROTO(unsigned int irq_reg, unsigned int irq_bit),
> > +     TP_ARGS(irq_reg, irq_bit)
> >  );
> >
> >  TRACE_EVENT(dpu_enc_irq_wait_success,
> >       TP_PROTO(uint32_t drm_id, void *func,
> > -              int irq_idx, enum dpu_pingpong pp_idx, int atomic_cnt),
> > -     TP_ARGS(drm_id, func, irq_idx, pp_idx, atomic_cnt),
> > +              unsigned int irq_reg, unsigned int irq_bit, enum dpu_pingpong pp_idx, int atomic_cnt),
> > +     TP_ARGS(drm_id, func, irq_reg, irq_bit, pp_idx, atomic_cnt),
> >       TP_STRUCT__entry(
> >               __field(        uint32_t,               drm_id          )
> >               __field(        void *,                 func            )
> > -             __field(        int,                    irq_idx         )
> > +             __field(        unsigned int,           irq_reg         )
> > +             __field(        unsigned int,           irq_bit         )
> >               __field(        enum dpu_pingpong,      pp_idx          )
> >               __field(        int,                    atomic_cnt      )
> >       ),
> >       TP_fast_assign(
> >               __entry->drm_id = drm_id;
> >               __entry->func = func;
> > -             __entry->irq_idx = irq_idx;
> > +             __entry->irq_reg = irq_reg;
> > +             __entry->irq_bit = irq_bit;
> >               __entry->pp_idx = pp_idx;
> >               __entry->atomic_cnt = atomic_cnt;
> >       ),
> > -     TP_printk("id=%u, callback=%ps, irq=%d, pp=%d, atomic_cnt=%d",
> > +     TP_printk("id=%u, callback=%ps, IRQ=[%d, %d], pp=%d, atomic_cnt=%d",
> >                 __entry->drm_id, __entry->func,
> > -               __entry->irq_idx, __entry->pp_idx, __entry->atomic_cnt)
> > +               __entry->irq_reg, __entry->irq_bit, __entry->pp_idx, __entry->atomic_cnt)
> >  );
> >
> >  DECLARE_EVENT_CLASS(dpu_drm_obj_template,
> > @@ -507,12 +511,13 @@ DEFINE_EVENT(dpu_id_event_template, dpu_crtc_frame_event_more_pending,
> >  );
> >
> >  TRACE_EVENT(dpu_enc_wait_event_timeout,
> > -     TP_PROTO(uint32_t drm_id, int irq_idx, int rc, s64 time,
> > +     TP_PROTO(uint32_t drm_id, unsigned int irq_reg, unsigned int irq_bit, int rc, s64 time,
> >                s64 expected_time, int atomic_cnt),
> > -     TP_ARGS(drm_id, irq_idx, rc, time, expected_time, atomic_cnt),
> > +     TP_ARGS(drm_id, irq_reg, irq_bit, rc, time, expected_time, atomic_cnt),
> >       TP_STRUCT__entry(
> >               __field(        uint32_t,       drm_id          )
> > -             __field(        int,            irq_idx         )
> > +             __field(        unsigned int,   irq_reg         )
> > +             __field(        unsigned int,   irq_bit         )
> >               __field(        int,            rc              )
> >               __field(        s64,            time            )
> >               __field(        s64,            expected_time   )
> > @@ -520,14 +525,15 @@ TRACE_EVENT(dpu_enc_wait_event_timeout,
> >       ),
> >       TP_fast_assign(
> >               __entry->drm_id = drm_id;
> > -             __entry->irq_idx = irq_idx;
> > +             __entry->irq_reg = irq_reg;
> > +             __entry->irq_bit = irq_bit;
> >               __entry->rc = rc;
> >               __entry->time = time;
> >               __entry->expected_time = expected_time;
> >               __entry->atomic_cnt = atomic_cnt;
> >       ),
> > -     TP_printk("id=%u, irq_idx=%d, rc=%d, time=%lld, expected=%lld cnt=%d",
> > -               __entry->drm_id, __entry->irq_idx, __entry->rc, __entry->time,
> > +     TP_printk("id=%u, IRQ=[%d, %d], rc=%d, time=%lld, expected=%lld cnt=%d",
> > +               __entry->drm_id, __entry->irq_reg, __entry->irq_bit, __entry->rc, __entry->time,
> >                 __entry->expected_time, __entry->atomic_cnt)
> >  );
> >
> > @@ -886,30 +892,34 @@ TRACE_EVENT(dpu_intf_connect_ext_te,
> >  );
> >
> >  TRACE_EVENT(dpu_core_irq_register_callback,
> > -     TP_PROTO(int irq_idx, void *callback),
> > -     TP_ARGS(irq_idx, callback),
> > +     TP_PROTO(unsigned int irq_reg, unsigned int irq_bit, void *callback),
> > +     TP_ARGS(irq_reg, irq_bit, callback),
> >       TP_STRUCT__entry(
> > -             __field(        int,                            irq_idx )
> > +             __field(        unsigned int,                   irq_reg )
> > +             __field(        unsigned int,                   irq_bit )
> >               __field(        void *,                         callback)
> >       ),
> >       TP_fast_assign(
> > -             __entry->irq_idx = irq_idx;
> > +             __entry->irq_reg = irq_reg;
> > +             __entry->irq_bit = irq_bit;
> >               __entry->callback = callback;
> >       ),
> > -     TP_printk("irq_idx:%d callback:%ps", __entry->irq_idx,
> > +     TP_printk("IRQ=[%d, %d] callback:%ps", __entry->irq_reg, __entry->irq_bit,
> >                 __entry->callback)
> >  );
> >
> >  TRACE_EVENT(dpu_core_irq_unregister_callback,
> > -     TP_PROTO(int irq_idx),
> > -     TP_ARGS(irq_idx),
> > +     TP_PROTO(unsigned int irq_reg, unsigned int irq_bit),
> > +     TP_ARGS(irq_reg, irq_bit),
> >       TP_STRUCT__entry(
> > -             __field(        int,                            irq_idx )
> > +             __field(        unsigned int,                   irq_reg )
> > +             __field(        unsigned int,                   irq_bit )
> >       ),
> >       TP_fast_assign(
> > -             __entry->irq_idx = irq_idx;
> > +             __entry->irq_reg = irq_reg;
> > +             __entry->irq_bit = irq_bit;
> >       ),
> > -     TP_printk("irq_idx:%d", __entry->irq_idx)
> > +     TP_printk("IRQ=[%d, %d]", __entry->irq_reg, __entry->irq_bit)
> >  );
> >
> >  TRACE_EVENT(dpu_core_perf_update_clk,
> > --
> > 2.39.2
> >



-- 
With best wishes
Dmitry
