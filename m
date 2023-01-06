Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7441866067E
	for <lists+freedreno@lfdr.de>; Fri,  6 Jan 2023 19:41:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EE5C10E8B6;
	Fri,  6 Jan 2023 18:41:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0226710E8B6
 for <freedreno@lists.freedesktop.org>; Fri,  6 Jan 2023 18:41:32 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 m26-20020a05600c3b1a00b003d9811fcaafso1683504wms.5
 for <freedreno@lists.freedesktop.org>; Fri, 06 Jan 2023 10:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=c07bHaLSKmBiOqJY8rgwXLQ5WTN3Pxi4bzCJ/GSn/gM=;
 b=QLPcCaDJq5/uEvmqB7qDUmoRPmaWLCOHw0HWAxKcqFfQdDIAWb/8ZjmEj/AfsJaAmV
 WsI9cb64kgzlxx7zrNFZ6Tos6h998azqjfLDjLegWXcq/bnASQ4tJqrKpBgWSIW4JLnh
 BiovGNQBb89ZokWPrC7+AMdKB//UrselhKH3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c07bHaLSKmBiOqJY8rgwXLQ5WTN3Pxi4bzCJ/GSn/gM=;
 b=nYoRDd3F9zMeySmctjO3pj0coQEuDWt6o6GHihJRUr6t/NoJz0gWUVEseQuC0XVXcF
 8da1vMNeUSd6c+CnBkOAhu2nEsgAWVp+AjHZLGG31fPwZT6tfcR4jk0vx/IcOvgcutMV
 kIOJDpZ7MgHB7reGU3UXxciKRS0H0AXfc9cJTyG9KfnPWcmXXHJyJSzS8VA33UuHUTq6
 /JExO3ibuXwxXw1dSKm7U+QM5fMt3eLBDP+7MsnqLrKbGTr1wcBpONYtDHiDaAKRT73N
 QAcS6jWwUglxj+vQ6u0EPze3ynKV4mQ9kd9KCuvlhDLRBgSOG/RzPw8xcOfsO7rm+ooT
 FMtg==
X-Gm-Message-State: AFqh2krUkExZpbwNH+aISZnVTjX6r/p0kOUr44A6Ozh7+JHBE9E4CC4h
 hxnjjSi5JwqvglDZTg5OEngPag==
X-Google-Smtp-Source: AMrXdXtER5plfyMNb7JNmJyudQYH8E45d2Fn30YgM+7oylC5086tPOdmOMDT1j3tU5wMs+o2prheLQ==
X-Received: by 2002:a05:600c:a0f:b0:3cf:7704:50ce with SMTP id
 z15-20020a05600c0a0f00b003cf770450cemr41156452wmp.38.1673030491541; 
 Fri, 06 Jan 2023 10:41:31 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 az28-20020a05600c601c00b003cf57329221sm7100927wmb.14.2023.01.06.10.41.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 10:41:30 -0800 (PST)
Date: Fri, 6 Jan 2023 19:41:28 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <Y7hrWDpg8msuefgZ@phenom.ffwll.local>
References: <20230104234036.636-1-quic_jesszhan@quicinc.com>
 <Y7a1hCmsvJHKdW1Y@phenom.ffwll.local>
 <58caf08c-3a02-82ce-4452-8ae7f22f373d@quicinc.com>
 <CAA8EJppnAmN6+S-emEfXJEc1iVf+DjeLBmCQpGd-nRY2M2AAQQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJppnAmN6+S-emEfXJEc1iVf+DjeLBmCQpGd-nRY2M2AAQQ@mail.gmail.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
Subject: Re: [Freedreno] [RFC PATCH v3 0/3] Support for Solid Fill Planes
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
Cc: sebastian.wick@redhat.com, ppaalanen@gmail.com,
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, daniel.vetter@ffwll.ch,
 robdclark@gmail.com, seanpaul@chromium.org, laurent.pinchart@ideasonboard.com,
 Daniel Vetter <daniel@ffwll.ch>, contact@emersion.fr,
 Jessica Zhang <quic_jesszhan@quicinc.com>, wayland-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, ville.syrjala@linux.intel.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, Jan 06, 2023 at 05:43:23AM +0200, Dmitry Baryshkov wrote:
> On Fri, 6 Jan 2023 at 02:38, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
> >
> >
> >
> > On 1/5/2023 3:33 AM, Daniel Vetter wrote:
> > > On Wed, Jan 04, 2023 at 03:40:33PM -0800, Jessica Zhang wrote:
> > >> Introduce and add support for a solid_fill property. When the solid_fill
> > >> property is set, and the framebuffer is set to NULL, memory fetch will be
> > >> disabled.
> > >>
> > >> In addition, loosen the NULL FB checks within the atomic commit callstack
> > >> to allow a NULL FB when the solid_fill property is set and add FB checks
> > >> in methods where the FB was previously assumed to be non-NULL.
> > >>
> > >> Finally, have the DPU driver use drm_plane_state.solid_fill and instead of
> > >> dpu_plane_state.color_fill, and add extra checks in the DPU atomic commit
> > >> callstack to account for a NULL FB in cases where solid_fill is set.
> > >>
> > >> Some drivers support hardware that have optimizations for solid fill
> > >> planes. This series aims to expose these capabilities to userspace as
> > >> some compositors have a solid fill flag (ex. SOLID_COLOR in the Android
> > >> hardware composer HAL) that can be set by apps like the Android Gears
> > >> app.
> > >>
> > >> Userspace can set the solid_fill property to a blob containing the
> > >> appropriate version number and solid fill color (in RGB323232 format) and
> > >> setting the framebuffer to NULL.
> > >>
> > >> Note: Currently, there's only one version of the solid_fill blob property.
> > >> However if other drivers want to support a similar feature, but require
> > >> more than just the solid fill color, they can extend this feature by
> > >> creating additional versions of the drm_solid_fill struct.
> > >>
> > >> Changes in V2:
> > >> - Dropped SOLID_FILL_FORMAT property (Simon)
> > >> - Switched to implementing solid_fill property as a blob (Simon, Dmitry)
> > >> - Changed to checks for if solid_fill_blob is set (Dmitry)
> > >> - Abstracted (plane_state && !solid_fill_blob) checks to helper method
> > >>    (Dmitry)
> > >> - Removed DPU_PLANE_COLOR_FILL_FLAG
> > >> - Fixed whitespace and indentation issues (Dmitry)
> > >
> > > Now that this is a blob, I do wonder again whether it's not cleaner to set
> > > the blob as the FB pointer. Or create some kind other kind of special data
> > > source objects (because solid fill is by far not the only such thing).
> > >
> > > We'd still end up in special cases like when userspace that doesn't
> > > understand solid fill tries to read out such a framebuffer, but these
> > > cases already exist anyway for lack of priviledges.
> > >
> > > So I still think that feels like the more consistent way to integrate this
> > > feature. Which doesn't mean it has to happen like that, but the
> > > patches/cover letter should at least explain why we don't do it like this.
> >
> > Hi Daniel,
> >
> > IIRC we were facing some issues with this check [1] when trying to set
> > FB to a PROP_BLOB instead. Which is why we went with making it a
> > separate property instead. Will mention this in the cover letter.
> 
> What kind of issues? Could you please describe them?

We switched from bitmask to enum style for prop types, which means it's
not possible to express with the current uapi a property which accepts
both an object or a blob.

Which yeah sucks a bit ...

But!

blob properties are kms objects (like framebuffers), so it should be
possible to stuff a blob into an object property as-is. Of course you need
to update the validation code to make sure we accept either an fb or a
blob for the internal representation. But that kind of split internally is
required no matter what I think.
-Daniel

> 
> >
> > [1]
> > https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/drm_property.c#L71
> >
> > Thanks,
> >
> > Jessica Zhang
> >
> > > -Daniel
> > >
> > >>
> > >> Changes in V3:
> > >> - Fixed some logic errors in atomic checks (Dmitry)
> > >> - Introduced drm_plane_has_visible_data() and drm_atomic_check_fb() helper
> > >>    methods (Dmitry)
> > >>
> > >> Jessica Zhang (3):
> > >>    drm: Introduce solid fill property for drm plane
> > >>    drm: Adjust atomic checks for solid fill color
> > >>    drm/msm/dpu: Use color_fill property for DPU planes
> > >>
> > >>   drivers/gpu/drm/drm_atomic.c              | 136 +++++++++++++---------
> > >>   drivers/gpu/drm/drm_atomic_helper.c       |  34 +++---
> > >>   drivers/gpu/drm/drm_atomic_state_helper.c |   9 ++
> > >>   drivers/gpu/drm/drm_atomic_uapi.c         |  59 ++++++++++
> > >>   drivers/gpu/drm/drm_blend.c               |  17 +++
> > >>   drivers/gpu/drm/drm_plane.c               |   8 +-
> > >>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |   9 +-
> > >>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c |  65 +++++++----
> > >>   include/drm/drm_atomic_helper.h           |   5 +-
> > >>   include/drm/drm_blend.h                   |   1 +
> > >>   include/drm/drm_plane.h                   |  62 ++++++++++
> > >>   11 files changed, 302 insertions(+), 103 deletions(-)
> > >>
> > >> --
> > >> 2.38.1
> > >>
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
> 
> 
> 
> -- 
> With best wishes
> Dmitry

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
