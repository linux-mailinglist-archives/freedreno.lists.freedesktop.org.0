Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3C6381EAB
	for <lists+freedreno@lfdr.de>; Sun, 16 May 2021 14:18:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06FC089ECD;
	Sun, 16 May 2021 12:18:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 039EB89199
 for <freedreno@lists.freedesktop.org>; Sun, 16 May 2021 12:18:41 +0000 (UTC)
Received: by mail-qv1-xf2b.google.com with SMTP id c13so674267qvx.5
 for <freedreno@lists.freedesktop.org>; Sun, 16 May 2021 05:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O1mGXyme0tS5V31oK5nRfRtDEHh64dhToBqvFaoH8HI=;
 b=bCB9ldPhw5dRnQiT21Ov+ncDDR1ggHpXO5zFG2rqwWN8fs2hNqcfazX2XON54mjxaj
 o2zFrPqCqD+Zb4u8ZUhB4DLqLdb85GA1s0ZzHVe11jmOHtWeul2hcrE/D0GyBbVKxzhC
 qokRjsVy5Ep1ngkVkqkHaETlt35jDQqkPlQ0JY2rsrFOKOqNvUFojoYcswuse1v2+J5+
 wnjbSOkiCyCj8XEM1rsaSXMYyn4TpRO8HS9QHdOAjUP8zgQjnyN2JwYS/X+iOJSotebE
 wAqwPovrujWP3q9j+Gw4CWVpYT/PGLkdoXVrsje2JXdW4P3URgRWpy0Sxzcu8UGleg0D
 wUaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O1mGXyme0tS5V31oK5nRfRtDEHh64dhToBqvFaoH8HI=;
 b=dVrrxBxTjId0XRXnsixMC9J1MotViQkXcUdZsKAJLFaC3prb9amnvgi8sSUG8xAe/3
 g6/RbvrmTEWb4x5cB8chz6V4uXQIL0/Yk7CvckrT3Vx6lCHfsEjvqmj3pM95ToiRh08s
 KNUfomony8ryyu+rsNhi0sogmNXFt3Dm2ZlwrYWMxn2JcCxhG1kTqnDOA5VBGbSz6Ewn
 QiRiQkt6AsYLWvV+nwmECMK2Z7ZDQS78yikiXLLqyl7RJ27xRIEwNn5SKllxEyVnxZ5N
 iJ5+3nbWP9dRESpuNNAEAStk3EBmDhjPFioS+2c+c3TIETiwO1ggO5hLV0+lFXnHzlaN
 RhhQ==
X-Gm-Message-State: AOAM5306fxiop0B6iE4MMeDGvwPXk+s3m60WWsRJw987IBj2+RPBlKVq
 JpmI+U+VU3wFvjsmHyiqY+Xc3WiRDjbZ5exQ3EAQ8w==
X-Google-Smtp-Source: ABdhPJxpbwGFs0dCzeVTVlYolK+rSHjDPFYgDXjIG8TMySQLA9zXCvDteMJNlxBZmmHntuS1acUZtYkggrNLg18Ro6A=
X-Received: by 2002:a0c:ca0c:: with SMTP id c12mr21679965qvk.47.1621167521075; 
 Sun, 16 May 2021 05:18:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210515195612.1901147-1-dmitry.baryshkov@linaro.org>
 <20210516054136.GR2484@yoga>
In-Reply-To: <20210516054136.GR2484@yoga>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 16 May 2021 15:18:31 +0300
Message-ID: <CAA8EJpq4tUQRuzXjW58mbzi9KhZHnxzhrTdLGBh3Zw4qmCcmCA@mail.gmail.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: remove most of usbpd-related
 remains
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
 Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, David Airlie <airlied@linux.ie>,
 Rob Clark <robdclark@gmail.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sun, 16 May 2021 at 08:41, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Sat 15 May 14:56 CDT 2021, Dmitry Baryshkov wrote:
>
> > Remove most of remains of downstream usbpd code. Mainline kernel uses
> > different approach for managing Type-C / USB-PD, so this remains unused.
> > Do not touch usbpd callbacks for now, since they look usefull enough as
> > an example of how to handle connect/disconnect (to be rewritten into .
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/Makefile        |  1 -
> >  drivers/gpu/drm/msm/dp/dp_ctrl.c    |  4 +-
> >  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  3 +-
> >  drivers/gpu/drm/msm/dp/dp_debug.c   |  6 +--
> >  drivers/gpu/drm/msm/dp/dp_debug.h   |  4 +-
> >  drivers/gpu/drm/msm/dp/dp_display.c | 36 ++-------------
> >  drivers/gpu/drm/msm/dp/dp_hpd.c     | 69 -----------------------------
> >  drivers/gpu/drm/msm/dp/dp_hpd.h     | 51 ---------------------
> >  drivers/gpu/drm/msm/dp/dp_power.c   |  2 +-
> >  drivers/gpu/drm/msm/dp/dp_power.h   |  3 +-
> >  10 files changed, 11 insertions(+), 168 deletions(-)
> >  delete mode 100644 drivers/gpu/drm/msm/dp/dp_hpd.c
> >
> [..]
> > diff --git a/drivers/gpu/drm/msm/dp/dp_hpd.c b/drivers/gpu/drm/msm/dp/dp_hpd.c
>
> It seems to me that this would be a reasonable place to plug in the
> typec_mux stuff. And as we're starting that exercise we should perhaps
> hold off on applying until we've figured out how that would look?

I'm fine with holding this for a while. Note, that actual code
handling the connection/disconnection is left in place. I've just
dropped unused data structures and related code.
In fact this started as I started looking for the place to put
typec-mux code and whether fields from dp_usbpd struct are used or not
(they are not).



-- 
With best wishes
Dmitry
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
