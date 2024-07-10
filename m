Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6BF92CC13
	for <lists+freedreno@lfdr.de>; Wed, 10 Jul 2024 09:40:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FFA510E5C9;
	Wed, 10 Jul 2024 07:40:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uiKsqeSg";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CD5B10E5D2
 for <freedreno@lists.freedesktop.org>; Wed, 10 Jul 2024 07:40:36 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-e04b03c9a3cso966982276.3
 for <freedreno@lists.freedesktop.org>; Wed, 10 Jul 2024 00:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720597235; x=1721202035; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OjKb2nGH0uufgiLhroJNuFFSjoPflP4yKTqfadCBBO0=;
 b=uiKsqeSgWYuJXvUYc4A+KzRj3Xh54TUTMzcXd8BbJFc8EqXxLk5sXQhHr3nZj9Pm7K
 h2fio8flYAahH9ZAJ+fHK+T5uD67OCGEUsjdUE52XVA6mPdgYl87ub22kqpm+Mx3VfTH
 BxC5Eh04dXDXVtU+VqrNXcy/YOG7qP3Kx1rb8EosgfLqKCSqavtMQdUHRuo5fAROjMdW
 kPI8D4WO3AkIsdN0cFMcE5VRE66msegS/sbvg8h0MrJbD//2XYJS0SLDlI0oIgUGcT98
 6cRXcgqbM6KDP+OioCmf8XmkKZ+qOSazTJ4YRTuudBbZlnFc/gWuRJJ/cR2GglrFuDzw
 aGxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720597235; x=1721202035;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OjKb2nGH0uufgiLhroJNuFFSjoPflP4yKTqfadCBBO0=;
 b=DaeBkuxWw9pg3qFc2bLkkuFbJVXMFgd5N7plIRjCmEDlonPZFQfwYVhbtdjbHRdx5j
 lHD4ukgYi9398xJl6ZQsSonV0DCJIqgZEp2zhVcEAag9xbFRAN5Rdtsk2Nbt1WSKgAZO
 g8lCWTg52nQbbZkPwpBNYUtpAMhZk2TtffvESEG+dhGIZ9vOAU8Ew4XRGLUbicZBWbM8
 AJftSvfkJDC/zLSX8WXyrb9i0cH+4nfTcZRRDOMztJVVEmZearGk5V67eHxsq/fpztPI
 2ohI/w/vFaFehK1zNHPgSp4Q62HD4WuHVucrrUptzD5MylF2LFcmlkYYphK+kFiTqAj4
 ahWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyTdy+zj5YobFfJ9O23iH+fcx9TogVJBUMiHPPfG4Q0OxGOKi0S5KLTR4PUZI1wTFO/C+D4tObqrjrCSJOOIWYLW44xKWd7cKh9H+UC3z5
X-Gm-Message-State: AOJu0YxH+zFdwq1ZCrPqzRWblso5is7v+bIuNGPl9Udonxa4zsaLfqIr
 v6/X8ll17ddmyvMCDTVNOwKauljfhu9f63Io/MO7glhZrLUaLMZEyNgf8JtoT4w+/sGvw/+pjMR
 M4caPaWn8ozHYQAVB+FVo5wDoNMPJDNLqUSWfLA==
X-Google-Smtp-Source: AGHT+IH/sNttlz7iEcuuUfbPUqCuI5UQBYVSoBT/R+GVBSmPgZ4m9GAISSCZwv88ItHVb+x6KfGQ+5FMLUM7PbL3uKE=
X-Received: by 2002:a25:800c:0:b0:e03:6533:136d with SMTP id
 3f1490d57ef6-e041b12408amr5399518276.40.1720597234909; Wed, 10 Jul 2024
 00:40:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240709-dpu-fix-wb-v1-0-448348bfd4cb@linaro.org>
 <20240709-dpu-fix-wb-v1-2-448348bfd4cb@linaro.org>
 <46487222-6818-b0bf-e5cc-2310d62b5fe6@quicinc.com>
In-Reply-To: <46487222-6818-b0bf-e5cc-2310d62b5fe6@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 10 Jul 2024 10:40:23 +0300
Message-ID: <CAA8EJpq7Lp-3V_AsLxO9ZOt8ZW1ZZ=FjhXV6R9jvH=sQ8XQE9w@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/msm/dpu: don't play tricks with debug macros
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jordan Crouse <jordan@cosmicpenguin.net>, 
 Chandan Uddaraju <chandanu@codeaurora.org>,
 Rajesh Yadav <ryadav@codeaurora.org>, 
 Sravanthi Kollukuduru <skolluku@codeaurora.org>,
 Archit Taneja <architt@codeaurora.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jeykumar Sankaran <jsanka@codeaurora.org>
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

On Tue, 9 Jul 2024 at 22:39, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 7/9/2024 6:48 AM, Dmitry Baryshkov wrote:
> > DPU debugging macros need to be converted to a proper drm_debug_*
> > macros, however this is a going an intrusive patch, not suitable for a
> > fix. Wire DPU_DEBUG and DPU_DEBUG_DRIVER to always use DRM_DEBUG_DRIVER
> > to make sure that DPU debugging messages always end up in the drm debug
> > messages and are controlled via the usual drm.debug mask.
> >
>
> These macros have been deprecated, is this waht you meant by the
> conversion to proper drm_debug_*?

Yes. Drop the driver-specific wrappers where they don't make sense.
Use sensible format strings in the cases where it actually does (like
VIDENC or _PLANE)

>
> /* NOTE: this is deprecated in favor of drm_dbg(NULL, ...). */
> #define DRM_DEBUG_DRIVER(fmt, ...)                                      \
>          __drm_dbg(DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
>
> I think all that this macro was doing was to have appropriate DRM_UT_*
> macros enabled before calling the corresponding DRM_DEBUG_* macros. But
> I think what was incorrect here is for DPU_DEBUG, we could have used
> DRM_UT_CORE instead of DRM_UT_KMS.

It pretty much tries to overplay the existing drm debugging mechanism
by either sending the messages to the DRM channel or just using
pr_debug. With DYNAMIC_DEBUG being disabled pr_debug is just an empty
macro, so all the messages can end up in /dev/null. We should not be
trying to be too smart, using standard DRM_DEBUG_DRIVER should be
enough. This way all driver-related messages are controlled by
drm.debug including or excluding the 0x02 bit.


>
> And DRM_DEBUG_DRIVER should have been used instead of DRM_ERROR.
>
> Was this causing the issue of the prints not getting enabled?

I pretty much think so.

>
> > Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h | 14 ++------------
> >   1 file changed, 2 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > index e2adc937ea63..935ff6fd172c 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > @@ -31,24 +31,14 @@
> >    * @fmt: Pointer to format string
> >    */
> >   #define DPU_DEBUG(fmt, ...)                                                \
> > -     do {                                                               \
> > -             if (drm_debug_enabled(DRM_UT_KMS))                         \
> > -                     DRM_DEBUG(fmt, ##__VA_ARGS__); \
> > -             else                                                       \
> > -                     pr_debug(fmt, ##__VA_ARGS__);                      \
> > -     } while (0)
> > +     DRM_DEBUG_DRIVER(fmt, ##__VA_ARGS__)
> >
> >   /**
> >    * DPU_DEBUG_DRIVER - macro for hardware driver logging
> >    * @fmt: Pointer to format string
> >    */
> >   #define DPU_DEBUG_DRIVER(fmt, ...)                                         \
> > -     do {                                                               \
> > -             if (drm_debug_enabled(DRM_UT_DRIVER))                      \
> > -                     DRM_ERROR(fmt, ##__VA_ARGS__); \
> > -             else                                                       \
> > -                     pr_debug(fmt, ##__VA_ARGS__);                      \
> > -     } while (0)
> > +     DRM_DEBUG_DRIVER(fmt, ##__VA_ARGS__)
> >
> >   #define DPU_ERROR(fmt, ...) pr_err("[dpu error]" fmt, ##__VA_ARGS__)
> >   #define DPU_ERROR_RATELIMITED(fmt, ...) pr_err_ratelimited("[dpu error]" fmt, ##__VA_ARGS__)
> >



-- 
With best wishes
Dmitry
