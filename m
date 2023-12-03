Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B08D980262C
	for <lists+freedreno@lfdr.de>; Sun,  3 Dec 2023 19:15:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB49B10E098;
	Sun,  3 Dec 2023 18:15:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E057E10E0B7
 for <freedreno@lists.freedesktop.org>; Sun,  3 Dec 2023 18:15:07 +0000 (UTC)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-5d4f71f7e9fso21969247b3.0
 for <freedreno@lists.freedesktop.org>; Sun, 03 Dec 2023 10:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701627307; x=1702232107; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VBw8A5WuhAfyasORYk3sNHDucWPtvrzZdNlLhqgrg1E=;
 b=g3te0d48pUVV3lbLgVk26T13OENPR+nEGLY0Q/+5iwmGT0e2dHHDwiwK5nkPLr8NKg
 mWxpYKWCRfa+Zx0SyFZAc/z/KLgQN21Rtohru0MIUN38dGlamEQXRYJgFFz2kc/Otxtn
 xqkeRUCVlGxKPV/tBFSdodLzUIq+Ta7UpsUrJoV5WrbOc+LIkrEnUKeVZ+Pf9Y7HyIBM
 b2r5deFyqo4r3aFaXizsu1aEftDTCVzOR2BIX6BYJbSurVBkypAQebOhlC/obV+WGSDu
 qA7se6njCvKNry3aGqSkRqrHEn+PrHHRLHEu9TLDFXiudZznNZaKaPsdwM3BIs9G9zLZ
 NWuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701627307; x=1702232107;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VBw8A5WuhAfyasORYk3sNHDucWPtvrzZdNlLhqgrg1E=;
 b=QC9GoLX78vkGHLq+/CnX108QC4PhTglF5juMZSUWauIE3T5EWrnLGeB+iHeUpIY/ys
 Q6oYJfeRtj74YLvbBpnftiH1IoREqf0oBM7B7x9uDvINWJH3/I5Cp0JrzzfwBhpRRDTH
 6Do9MMM0vgUrRdg2ERQHi4SEre71Ahbcnqdlpr6RPHANJ+p55Dt2tql1v1ZSQi99aN7X
 8LfmOlwm9+A+BBxU8HJErwvjSbLeGdpqlLM/IoAUeza4tcuz3fsDMi1qa454rAvXXCtV
 upGyMivVb0VvAeEhMLCKkfs7ZbBXfuTGDev8yDcUUMyd3WgBsqXxKe1gD+B31AaMS2o0
 aWrg==
X-Gm-Message-State: AOJu0Yyo+q2PYJGmmv18J9DtXmSQhHUn27NzKi6c5c1CaWqINV0wvyYM
 A5zXfN+kOyOLLjVRXavNMNh9u0vrRLOwGWRULLcTng==
X-Google-Smtp-Source: AGHT+IFUy8B/4S31oVJp9dqmSc+u4tDNY7+u9M9vX7qbZTp0uUteKIcgNDwDYa2dp4XivmCNvukRiq8p2gb2GfW9Zyg=
X-Received: by 2002:a05:690c:3381:b0:5d6:c347:4b11 with SMTP id
 fl1-20020a05690c338100b005d6c3474b11mr1829719ywb.42.1701627307031; Sun, 03
 Dec 2023 10:15:07 -0800 (PST)
MIME-Version: 1.0
References: <20230920201358.27597-1-quic_abhinavk@quicinc.com>
 <20231203142441.GA26644@pendragon.ideasonboard.com>
In-Reply-To: <20231203142441.GA26644@pendragon.ideasonboard.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 3 Dec 2023 20:14:56 +0200
Message-ID: <CAA8EJpoykwsMWX+msDAB3TZaBmwE4iA4fiDiA-iOELmWd50s-w@mail.gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm: improve the documentation of connector
 hpd ops
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
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 andersson@kernel.org, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, jani.nikula@linux.intel.com,
 linux-kernel@vger.kernel.org, quic_parellan@quicinc.com,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 quic_jesszhan@quicinc.com, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sun, 3 Dec 2023 at 16:24, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Abhinav,
>
> Thank you for the patch (and thank to Dmitry for pinging me on IRC, this
> patch got burried in my inbox).
>
> On Wed, Sep 20, 2023 at 01:13:58PM -0700, Abhinav Kumar wrote:
> > While making the changes in [1], it was noted that the documentation
> > of the enable_hpd() and disable_hpd() does not make it clear that
> > these ops should not try to do hpd state maintenance and should only
> > attempt to enable/disable hpd related hardware for the connector.
>
> s/attempt to //

I can probably fix this while applying the patch.

>
> >
> > The state management of these calls to make sure these calls are
> > balanced is handled by the DRM core and we should keep it that way
> > to minimize the overhead in the drivers which implement these ops.
> >
> > [1]: https://patchwork.freedesktop.org/patch/558387/
> >
>
> You could add a
>
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> > ---
> >  include/drm/drm_modeset_helper_vtables.h | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
> > index e3c3ac615909..a33cf7488737 100644
> > --- a/include/drm/drm_modeset_helper_vtables.h
> > +++ b/include/drm/drm_modeset_helper_vtables.h
> > @@ -1154,6 +1154,11 @@ struct drm_connector_helper_funcs {
> >        * This operation is optional.
> >        *
> >        * This callback is used by the drm_kms_helper_poll_enable() helpers.
> > +      *
> > +      * This operation does not need to perform any hpd state tracking as
> > +      * the DRM core handles that maintenance and ensures the calls to enable
> > +      * and disable hpd are balanced.
> > +      *
> >        */
> >       void (*enable_hpd)(struct drm_connector *connector);
> >
> > @@ -1165,6 +1170,11 @@ struct drm_connector_helper_funcs {
> >        * This operation is optional.
> >        *
> >        * This callback is used by the drm_kms_helper_poll_disable() helpers.
> > +      *
> > +      * This operation does not need to perform any hpd state tracking as
> > +      * the DRM core handles that maintenance and ensures the calls to enable
> > +      * and disable hpd are balanced.
> > +      *
> >        */
> >       void (*disable_hpd)(struct drm_connector *connector);
> >  };
>
> --
> Regards,
>
> Laurent Pinchart



-- 
With best wishes
Dmitry
