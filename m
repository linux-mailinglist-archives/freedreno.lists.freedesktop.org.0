Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1548367DB15
	for <lists+freedreno@lfdr.de>; Fri, 27 Jan 2023 02:09:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8415B10E160;
	Fri, 27 Jan 2023 01:09:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1455E10E3D6
 for <freedreno@lists.freedesktop.org>; Fri, 27 Jan 2023 01:09:44 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id v13so3456669eda.11
 for <freedreno@lists.freedesktop.org>; Thu, 26 Jan 2023 17:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bsxheyz2R0UbmBuV8xy/pUsm2Fl4pHdkB/ioAyB+rco=;
 b=EiGqV0MIPP8TW23tebION2ZJgrgr++P7/ZpDTt4rtqec6eq+VLy43oMzpbO1+zqdH0
 +z7Zbfa2z2q0990uk9aTs/H32KCv/TnDkKZEWaRcaq4x1yZpguK256JbKJlUsrdG1frO
 kOAlkA7BnvZQLNu9io4IrChw4A7FcjEGNUYhM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bsxheyz2R0UbmBuV8xy/pUsm2Fl4pHdkB/ioAyB+rco=;
 b=6ipD5TsR8fHFw958pmfKMYi+2o2d6hmzc10eOsjFY8g1SVUUAsgq2mghn7GgRQYUUZ
 pY6/E+0tmV+r0jlTswboxKS/abXMa0MV6INTkunRF6K+dIQXAOX7noRlo6Lz/rBlOHmC
 AxYxGQnBlnrvoFSQLEYHbUEefTGzvNuxT/WkYNk7m4XlxYO4ABHnd2iAFV3J4G03waNs
 0opAbCqLnATcnm38+kTep1S5Yu5iC249TTN+sWBMJLuHNf3ljJghKOsrmsE/u4cjckrz
 J/dl3Fdo4x7JXpwaQ/EJap9jIrEL16cMYFaXj7qejXo2UyZgWVQni8+BL4cCS2599ixq
 HxhQ==
X-Gm-Message-State: AFqh2kpoQZNg9D4surlGVIzBP2q+LGwcVPydZjomjH7goUMee7p/Fh2U
 NGH6wZH6BnA5jt/nyjdLRsyNBODYtRdCeWDjdPI=
X-Google-Smtp-Source: AMrXdXsl7n4s80Gt0Xp3Y2cNDbX67hrbg2SI5DM+F6bNivZjN2TsJSGB3/egOLFUW+/5BbS5JXPSlA==
X-Received: by 2002:a05:6402:2421:b0:472:9af1:163f with SMTP id
 t33-20020a056402242100b004729af1163fmr43449030eda.37.1674781782454; 
 Thu, 26 Jan 2023 17:09:42 -0800 (PST)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com.
 [209.85.128.48]) by smtp.gmail.com with ESMTPSA id
 ez18-20020a056402451200b0049dd7eec977sm1490484edb.41.2023.01.26.17.09.40
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jan 2023 17:09:40 -0800 (PST)
Received: by mail-wm1-f48.google.com with SMTP id
 m5-20020a05600c4f4500b003db03b2559eso2387560wmq.5
 for <freedreno@lists.freedesktop.org>; Thu, 26 Jan 2023 17:09:40 -0800 (PST)
X-Received: by 2002:a7b:c38d:0:b0:3da:fd7c:98c2 with SMTP id
 s13-20020a7bc38d000000b003dafd7c98c2mr1637467wmj.93.1674781779909; Thu, 26
 Jan 2023 17:09:39 -0800 (PST)
MIME-Version: 1.0
References: <20230119145248.1.I90ffed3ddd21e818ae534f820cb4d6d8638859ab@changeid>
 <d4d1ee21-47c1-a141-edc1-f0ae86ec58ce@quicinc.com>
In-Reply-To: <d4d1ee21-47c1-a141-edc1-f0ae86ec58ce@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 26 Jan 2023 17:09:26 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VHLbVWgF-mn8=uCtpOteNoqK2RCQEuPE+BpQ2-YDKyRQ@mail.gmail.com>
Message-ID: <CAD=FV=VHLbVWgF-mn8=uCtpOteNoqK2RCQEuPE+BpQ2-YDKyRQ@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 1/2] drm/msm/dp: Clean up handling of DP AUX
 interrupts
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
Cc: freedreno@lists.freedesktop.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Wed, Jan 25, 2023 at 9:13 AM Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
>
> On 1/19/2023 2:53 PM, Douglas Anderson wrote:
> > The DP AUX interrupt handling was a bit of a mess.
> > * There were two functions (one for "native" transfers and one for
> >    "i2c" transfers) that were quite similar. It was hard to say how
> >    many of the differences between the two functions were on purpose
> >    and how many of them were just an accident of how they were coded.
> > * Each function sometimes used "else if" to test for error bits and
> >    sometimes didn't and again it was hard to say if this was on purpose
> >    or just an accident.
> > * The two functions wouldn't notice whether "unknown" bits were
> >    set. For instance, there seems to be a bit "DP_INTR_PLL_UNLOCKED"
> >    and if it was set there would be no indication.
> > * The two functions wouldn't notice if more than one error was set.
> >
> > Let's fix this by being more consistent / explicit about what we're
> > doing.
> >
> > By design this could cause different handling for AUX transfers,
> > though I'm not actually aware of any bug fixed as a result of
> > this patch (this patch was created because we simply noticed how odd
> > the old code was by code inspection). Specific notes here:
> > 1. In the old native transfer case if we got "done + wrong address"
> >     we'd ignore the "wrong address" (because of the "else if"). Now we
> >     won't.
> > 2. In the old native transfer case if we got "done + timeout" we'd
> >     ignore the "timeout" (because of the "else if"). Now we won't.
> > 3. In the old native transfer case we'd see "nack_defer" and translate
> >     it to the error number for "nack". This differed from the i2c
> >     transfer case where "nack_defer" was given the error number for
> >     "nack_defer". This 100% can't matter because the only user of this
> >     error number treats "nack defer" the same as "nack", so it's clear
> >     that the difference between the "native" and "i2c" was pointless
> >     here.
> > 4. In the old i2c transfer case if we got "done" plus any error
> >     besides "nack" or "defer" then we'd ignore the error. Now we don't.
> > 5. If there is more than one error signaled by the hardware it's
> >     possible that we'll report a different one than we used to. I don't
> >     know if this matters. If someone is aware of a case this matters we
> >     should document it and change the code to make it explicit.
> > 6. One quirk we keep (I don't know if this is important) is that in
> >     the i2c transfer case if we see "done + defer" we report that as a
> >     "nack". That seemed too intentional in the old code to just drop.
> >
> > After this change we will add extra logging, including:
> > * A warning if we see more than one error bit set.
> > * A warning if we see an unexpected interrupt.
> > * A warning if we get an AUX transfer interrupt when shouldn't.
> >
> > It actually turns out that as a result of this change then at boot we
> > sometimes see an error:
> >    [drm:dp_aux_isr] *ERROR* Unexpected DP AUX IRQ 0x01000000 when not busy
> > That means that, during init, we are seeing DP_INTR_PLL_UNLOCKED. For
> > now I'm going to say that leaving this error reported in the logs is
> > OK-ish and hopefully it will encourage someone to track down what's
> > going on at init time.
> >
> > One last note here is that this change renames one of the interrupt
> > bits. The bit named "i2c done" clearly was used for native transfers
> > being done too, so I renamed it to indicate this.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > I don't have good test coverage for this change and it does have the
> > potential to change behavior. I confirmed that eDP and DP still
> > continue to work OK on one machine. Hopefully folks can test it more.
> >
> >   drivers/gpu/drm/msm/dp/dp_aux.c     | 80 ++++++++++++-----------------
> >   drivers/gpu/drm/msm/dp/dp_catalog.c |  2 +-
> >   drivers/gpu/drm/msm/dp/dp_catalog.h |  2 +-
> >   3 files changed, 36 insertions(+), 48 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
> > index cc3efed593aa..34ad08ae6eb9 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> > @@ -162,47 +162,6 @@ static ssize_t dp_aux_cmd_fifo_rx(struct dp_aux_private *aux,
> >       return i;
> >   }
> >
> > -static void dp_aux_native_handler(struct dp_aux_private *aux, u32 isr)
> > -{
> > -     if (isr & DP_INTR_AUX_I2C_DONE)
> > -             aux->aux_error_num = DP_AUX_ERR_NONE;
> > -     else if (isr & DP_INTR_WRONG_ADDR)
> > -             aux->aux_error_num = DP_AUX_ERR_ADDR;
> > -     else if (isr & DP_INTR_TIMEOUT)
> > -             aux->aux_error_num = DP_AUX_ERR_TOUT;
> > -     if (isr & DP_INTR_NACK_DEFER)
> > -             aux->aux_error_num = DP_AUX_ERR_NACK;
> > -     if (isr & DP_INTR_AUX_ERROR) {
> > -             aux->aux_error_num = DP_AUX_ERR_PHY;
> > -             dp_catalog_aux_clear_hw_interrupts(aux->catalog);
> > -     }
> > -}
> > -
> > -static void dp_aux_i2c_handler(struct dp_aux_private *aux, u32 isr)
> > -{
> > -     if (isr & DP_INTR_AUX_I2C_DONE) {
> > -             if (isr & (DP_INTR_I2C_NACK | DP_INTR_I2C_DEFER))
> > -                     aux->aux_error_num = DP_AUX_ERR_NACK;
> > -             else
> > -                     aux->aux_error_num = DP_AUX_ERR_NONE;
> > -     } else {
> > -             if (isr & DP_INTR_WRONG_ADDR)
> > -                     aux->aux_error_num = DP_AUX_ERR_ADDR;
> > -             else if (isr & DP_INTR_TIMEOUT)
> > -                     aux->aux_error_num = DP_AUX_ERR_TOUT;
> > -             if (isr & DP_INTR_NACK_DEFER)
> > -                     aux->aux_error_num = DP_AUX_ERR_NACK_DEFER;
> > -             if (isr & DP_INTR_I2C_NACK)
> > -                     aux->aux_error_num = DP_AUX_ERR_NACK;
> > -             if (isr & DP_INTR_I2C_DEFER)
> > -                     aux->aux_error_num = DP_AUX_ERR_DEFER;
> > -             if (isr & DP_INTR_AUX_ERROR) {
> > -                     aux->aux_error_num = DP_AUX_ERR_PHY;
> > -                     dp_catalog_aux_clear_hw_interrupts(aux->catalog);
> > -             }
> > -     }
> > -}
> > -
> >   static void dp_aux_update_offset_and_segment(struct dp_aux_private *aux,
> >                                            struct drm_dp_aux_msg *input_msg)
> >   {
> > @@ -427,13 +386,42 @@ void dp_aux_isr(struct drm_dp_aux *dp_aux)
> >       if (!isr)
> >               return;
> >
> > -     if (!aux->cmd_busy)
> > +     if (!aux->cmd_busy) {
> > +             DRM_ERROR("Unexpected DP AUX IRQ %#010x when not busy\n", isr);
> >               return;
> > +     }
> >
> > -     if (aux->native)
> > -             dp_aux_native_handler(aux, isr);
> > -     else
> > -             dp_aux_i2c_handler(aux, isr);
> > +     /*
> > +      * The logic below assumes only one error bit is set (other than "done"
> > +      * which can apparently be set at the same time as some of the other
> > +      * bits). Warn if more than one get set so we know we need to improve
> > +      * the logic.
> > +      */
> > +     if (hweight32(isr & ~DP_INTR_AUX_XFER_DONE) > 1)
> > +             DRM_WARN("Some DP AUX interrupts unhandled: %#010x\n", isr);
> > +
> > +     if (isr & DP_INTR_AUX_ERROR) {
> > +             aux->aux_error_num = DP_AUX_ERR_PHY;
> > +             dp_catalog_aux_clear_hw_interrupts(aux->catalog);
> > +     } else if (isr & DP_INTR_NACK_DEFER) {
> > +             aux->aux_error_num = DP_AUX_ERR_NACK_DEFER;
> > +     } else if (isr & DP_INTR_WRONG_ADDR) {
> > +             aux->aux_error_num = DP_AUX_ERR_ADDR;
> > +     } else if (isr & DP_INTR_TIMEOUT) {
> > +             aux->aux_error_num = DP_AUX_ERR_TOUT;
> > +     } else if (isr & DP_INTR_AUX_XFER_DONE) {
> > +             aux->aux_error_num = DP_AUX_ERR_NONE;
>
>
> 1) both DP_INTR_AUX_XFER_DONE and DP_INTR_I2C_NACK are set
>
> 2) both DP_INTR_AUX_XFER_DONE and DP_INTR_I2C_DEFER are set
>
> with above two condition, below two "else if" will not be reached since
> DP_INTR_AUX_XFER_DONE is check with higher priority

Indeed, that is a bug, good catch! I had the "DONE" at the end at the
beginning but then I remember thinking it looked ugly because the two
I2C cases below had the extra "aux->native". Moved it to the right
place and I'll send a quick v2 since I don't expect more feedback
since it's already been a week.

-Doug
