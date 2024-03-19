Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9519887F4C8
	for <lists+freedreno@lfdr.de>; Tue, 19 Mar 2024 01:55:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FF2110E936;
	Tue, 19 Mar 2024 00:55:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cyXuGAqZ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 490F710E936
 for <freedreno@lists.freedesktop.org>; Tue, 19 Mar 2024 00:55:24 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-60a068e26d8so57302687b3.3
 for <freedreno@lists.freedesktop.org>; Mon, 18 Mar 2024 17:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710809723; x=1711414523; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IJp2wlS1QcmyKoSILRJh4VbMcwABTvJV1wN+wh3MV9E=;
 b=cyXuGAqZmiHxqjtjGhHKamIOShrJ6X3q72rqg+bG98IPQe6XHgYOF5gSTcl/p8Ex6f
 ZCpHVcS5jtwF+nTjlF5IofWTKKa1uCmDwV8lvkxoI5EmHi4Tc82s6NL34I84jNTD8NRL
 +ERrfFz9iWhk1zVvTFH6y0EmtgZPEylwuBjk2ipG45h28tFxOC2fOSFUTLmTc8dILxOr
 mXqBTeZRdLqor7Dyur7TINrYILjtO6wup8BWZ8PKepsinDIRrf7pZHo0DmzTWBnnlCMh
 BFCKIP6y5AYiwvuIOrws2pPkrMhqbCQYXpK36x36/pXeEeYkjp2gnjDll3oXJH8DAae7
 S8Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710809723; x=1711414523;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IJp2wlS1QcmyKoSILRJh4VbMcwABTvJV1wN+wh3MV9E=;
 b=jz2Y6wF1Cq+fMha4KR+ZCFYVyDcKNq+cqNsDs5vmRK1VLTlTg6vHtbARrOJftLdGyV
 ejGUXRmrHPwSHpuyOClOLMyV4Nc8sHqVpYkMVs/4fpAeuorbPbbN/pPPG78+aPqkCpMs
 wsaImZFol9MQLlLkY1rz4Dbetr4uFW6zveMdmBKC7yUlw2mPHfNd7YFWERihj3pFdI6V
 phchfzO7MCUqZGU5odW1SKjtW+MlV920djfbL8LVEEphAGeW1FXkHklcH1FqPFLLsMAC
 gWBvgpNKN8IAoTOy1tf8step+3pVlXKxqPbcUk7wvh+SVnZZcHdDL9c4qaZr0VIS9gBy
 pUiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjIJANXoj3G2HUzULmtiO/qdbBgwsy9CrGnE/n38OYeJ1R20MSHh0NlsGtsuXuWQffpTJxgRDRqCY59CJmX5qs5pxC+md4KxXJJhddfONu
X-Gm-Message-State: AOJu0YwTblYKEP/AzQruUPa08ZUsBmz3mSuxWWYFpR3lmEgcAlpovEvh
 zhkUniwa/ROGFfpn9RPnqIFIxCVXuWTQhKoCBxoI1/yKbkVy71qZmfhGl8f2fnkXTq3VoeTRIGp
 OJy0pMT+/lwplnnm78xjWzVlB6m5QqcZBRfQ4Tg==
X-Google-Smtp-Source: AGHT+IEGKYwv10lcfsSdgNSEMTidawwMjd39KQKkAtnp/4ZbSUUFgDbTKVLqQgyVWylbNRxZHqjPhJycsO3zJfAmsks=
X-Received: by 2002:a0d:fd87:0:b0:609:e4b4:c2fb with SMTP id
 n129-20020a0dfd87000000b00609e4b4c2fbmr12750368ywf.27.1710809723036; Mon, 18
 Mar 2024 17:55:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240315213717.1411017-1-dianders@chromium.org>
 <20240315143621.v2.3.I535606f6d4f7e3e5588bb75c55996f61980183cd@changeid>
 <e2319b19-d999-24e7-48fa-bbc19bbfbeea@quicinc.com>
In-Reply-To: <e2319b19-d999-24e7-48fa-bbc19bbfbeea@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 19 Mar 2024 02:55:11 +0200
Message-ID: <CAA8EJppau--vt3RLkH96K0SF2x-QGWz+5U8tErvLFDvz-GQN4Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] drm/msm/dp: Delete the old 500 ms wait for eDP HPD
 in aux transfer
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>, 
 Johan Hovold <johan@kernel.org>
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

On Tue, 19 Mar 2024 at 02:19, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> +bjorn, johan as fyi for sc8280xp
>
> On 3/15/2024 2:36 PM, Douglas Anderson wrote:
> > Before the introduction of the wait_hpd_asserted() callback in commit
> > 841d742f094e ("drm/dp: Add wait_hpd_asserted() callback to struct
> > drm_dp_aux") the API between panel drivers and DP AUX bus drivers was
> > that it was up to the AUX bus driver to wait for HPD in the transfer()
> > function.
> >
> > Now wait_hpd_asserted() has been added. The two panel drivers that are
> > DP AUX endpoints use it. See commit 2327b13d6c47 ("drm/panel-edp: Take
> > advantage of wait_hpd_asserted() in struct drm_dp_aux") and commit
> > 3b5765df375c ("drm/panel: atna33xc20: Take advantage of
> > wait_hpd_asserted() in struct drm_dp_aux"). We've implemented
> > wait_hpd_asserted() in the MSM DP driver as of commit e2969ee30252
> > ("drm/msm/dp: move of_dp_aux_populate_bus() to eDP probe()"). There is
> > no longer any reason for long wait in the AUX transfer() function.
> > Remove it.
> >
> > NOTE: the wait_hpd_asserted() is listed as "optional". That means it's
> > optional for the DP AUX bus to implement. In the case of the MSM DP
> > driver we implement it so we can assume it will be called.
> >
>
> How do we enforce that for any new edp panels to be used with MSM, the
> panels should atleast invoke wait_hpd_asserted()?
>
> I agree that since MSM implements it, even though its listed as
> optional, we can drop this additional wait. So nothing wrong with this
> patch for current users including sc8280xp, sc7280 and sc7180.
>
> But, does there need to be some documentation that the edp panels not
> using the panel-edp framework should still invoke wait_hpd_asserted()?
>
> Since its marked as optional, what happens if the edp panel driver,
> skips calling wait_hpd_asserted()?

It is optional for the DP AUX implementations, not for the panel to be called.

>
> Now, since the wait from MSM is removed, it has a potential to fail.
>
> > ALSO NOTE: the wait wasn't actually _hurting_ anything and wasn't even
> > causing long timeouts, but it's still nice to get rid of unneeded
> > code. Specificaly it's not truly needed because to handle other DP
> > drivers that can't power on as quickly (specifically parade-ps8640) we
> > already avoid DP AUX transfers for eDP panels that aren't powered
> > on. See commit 8df1ddb5bf11 ("drm/dp: Don't attempt AUX transfers when
> > eDP panels are not powered").
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> > (no changes since v1)
> >
> >   drivers/gpu/drm/msm/dp/dp_aux.c | 17 -----------------
> >   1 file changed, 17 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
> > index 75c51f3ee106..ecefd1922d6d 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> > @@ -313,23 +313,6 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
> >               goto exit;
> >       }
> >
> > -     /*
> > -      * For eDP it's important to give a reasonably long wait here for HPD
> > -      * to be asserted. This is because the panel driver may have _just_
> > -      * turned on the panel and then tried to do an AUX transfer. The panel
> > -      * driver has no way of knowing when the panel is ready, so it's up
> > -      * to us to wait. For DP we never get into this situation so let's
> > -      * avoid ever doing the extra long wait for DP.
> > -      */
> > -     if (aux->is_edp) {
> > -             ret = dp_catalog_aux_wait_for_hpd_connect_state(aux->catalog,
> > -                                                             500000);
> > -             if (ret) {
> > -                     DRM_DEBUG_DP("Panel not ready for aux transactions\n");
> > -                     goto exit;
> > -             }
> > -     }
> > -
> >       dp_aux_update_offset_and_segment(aux, msg);
> >       dp_aux_transfer_helper(aux, msg, true);
> >



-- 
With best wishes
Dmitry
