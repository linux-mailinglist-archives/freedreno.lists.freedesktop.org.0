Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E0780F9E4
	for <lists+freedreno@lfdr.de>; Tue, 12 Dec 2023 23:04:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4ABF10E695;
	Tue, 12 Dec 2023 22:04:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B45F210E695
 for <freedreno@lists.freedesktop.org>; Tue, 12 Dec 2023 22:04:09 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-5d3758fdd2eso61333047b3.0
 for <freedreno@lists.freedesktop.org>; Tue, 12 Dec 2023 14:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702418649; x=1703023449; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RJY8C1DWpCBLWloqWzk5/jPg3401/emPFTGMZQJWPSo=;
 b=ZuqIVxg49zxwObVW1QpSNkHFv7FOl7f8e5XN7fAyjJsmdV6S7UkSNGvmGbmeJBAdcO
 9vDJWGVEGLnHRl/f7bk1+HeribyAVllaAnSHCMZwoKVTxA7CdK4btlBK+oMMdsZxO8r5
 wAOOtA8P7wTGRr8GgrLir4zKdFRw2vY2PqcF9Rd2wAhFwkYfyKLyQOH6ZY7KTGGNqape
 krNOr5pfnyuFNXuEgChWu86WUoOvJ+AbzhRJqYSKD1zWzkHTC3tFvZYihi2p9tuDcSt0
 bKhUl/rbHrr5zzddMkbK2SDXdK+qU0liqIwx6ZaBHLzeYz7sVmy7K/Dyd+0B+I1nEbZT
 MWkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702418649; x=1703023449;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RJY8C1DWpCBLWloqWzk5/jPg3401/emPFTGMZQJWPSo=;
 b=ZVfrVECJBvqff/vHgjOJNm36oBnNOyI92EGrpsHS8WE+gXo+EgWrB3npIEm8vgWUGn
 Tgg0yh9HJ2ahvmbI1tqgVFQ+s/nqkb8Ylaq2icwV4r9sUb76mwssTcpGkYhkCD+ypW8A
 MLs0cUaFyxjfG9BGJ4boS7rgDNedRMzqCeUKU6TpIyZNZqbhOUU2NQuxZswNHSAVYCrT
 qSwJh9/xr6SzknFplTb3CXqmPXnemKSdYQeeoRkIyccBaAApta4V7ttFfeiEW3lLwzQW
 WHkK6RvwSccHfBwpt1fdASazqhAha2D2t7PNz4i7IiR08C6o/SpVTgqMF00tAeG2lytL
 YkUA==
X-Gm-Message-State: AOJu0YzJtdtX729QE+p9esWvzEzjz1iSc/9Ozu791WKjRJGH5UPa1SYs
 CSDDbrKfXKMiu7eySExYQtCVyUA9rVNotjYu9Db0WQ==
X-Google-Smtp-Source: AGHT+IEc9UlLnCrtenTjOxWpVWAwvAo/nKTuRt+2QrFiV7c4g5vWp+h3pcwwc+ssUoUZ+HBsOHFMUA722GrCgvfWqSg=
X-Received: by 2002:a81:52cd:0:b0:5e2:834e:7f76 with SMTP id
 g196-20020a8152cd000000b005e2834e7f76mr441125ywb.41.1702418648867; Tue, 12
 Dec 2023 14:04:08 -0800 (PST)
MIME-Version: 1.0
References: <20231212205254.12422-1-quic_abhinavk@quicinc.com>
 <20231212205254.12422-2-quic_abhinavk@quicinc.com>
 <CAA8EJpr4X3RLFPfgfnsA+UpiOkV0eRzw_FnrEFykS908YuV9Aw@mail.gmail.com>
In-Reply-To: <CAA8EJpr4X3RLFPfgfnsA+UpiOkV0eRzw_FnrEFykS908YuV9Aw@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 13 Dec 2023 00:03:57 +0200
Message-ID: <CAA8EJpooSO3vR+Kp+XHgwOwQy43CKdUsOJOD3LiQ1LxbyW_39w@mail.gmail.com>
Subject: Re: [PATCH v4 01/15] drm/msm/dpu: add formats check for writeback
 encoder
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, seanpaul@chromium.org,
 Daniel Vetter <daniel@ffwll.ch>, quic_jesszhan@quicinc.com,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 12 Dec 2023 at 23:30, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Tue, 12 Dec 2023 at 22:53, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >
> > In preparation for adding more formats to dpu writeback add
> > format validation to it to fail any unsupported formats.
> >
> > changes in v4:
> >         - change the failure message of the API
> >           drm_atomic_helper_check_wb_connector_state() to a generic
> >           one in case it checks more errors later and moreoever it
> >           already has debug message to indicate its failure
> >         - change the corresponding DPU_ERROR to DPU_DEBUG in-line with
> >           other atomic_check failure messages
> >
> > changes in v3:
> >         - rebase on top of msm-next
> >         - replace drm_atomic_helper_check_wb_encoder_state() with
> >           drm_atomic_helper_check_wb_connector_state() due to the
> >           rebase
> >
> > changes in v2:
> >         - correct some grammar in the commit text
> >
> > Fixes: d7d0e73f7de3 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback")
> > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> > index bb94909caa25..4953d87affa1 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> > @@ -272,6 +272,7 @@ static int dpu_encoder_phys_wb_atomic_check(
> >  {
> >         struct drm_framebuffer *fb;
> >         const struct drm_display_mode *mode = &crtc_state->mode;
> > +       int ret;
> >
> >         DPU_DEBUG("[atomic_check:%d, \"%s\",%d,%d]\n",
> >                         phys_enc->hw_wb->idx, mode->name, mode->hdisplay, mode->vdisplay);
> > @@ -308,6 +309,12 @@ static int dpu_encoder_phys_wb_atomic_check(
> >                 return -EINVAL;
> >         }
> >
> > +       ret = drm_atomic_helper_check_wb_connector_state(conn_state->connector, conn_state->state);
> > +       if (ret < 0) {
> > +               DPU_DEBUG("wb check connector state failed ret = %d\n", ret);
>
> We already have a debug message in
> drm_atomic_helper_check_wb_connector_state(). Can we please drop this
> one?

If you don't mind, I can just drop it while applying

>
> > +               return ret;
> > +       }
> > +
> >         return 0;
> >  }
> >
> > --
> > 2.40.1
> >
>
>
> --
> With best wishes
> Dmitry



-- 
With best wishes
Dmitry
