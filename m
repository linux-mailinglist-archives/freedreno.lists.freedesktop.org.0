Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A80639F4BEA
	for <lists+freedreno@lfdr.de>; Tue, 17 Dec 2024 14:22:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E32810E416;
	Tue, 17 Dec 2024 13:21:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="MiOtjqkW";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16E9410E6A6
 for <freedreno@lists.freedesktop.org>; Mon, 16 Dec 2024 14:27:10 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43628e97467so37644635e9.3
 for <freedreno@lists.freedesktop.org>; Mon, 16 Dec 2024 06:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1734359228; x=1734964028; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Z8Oktj07WxPQkf8tAMVutVUrZO5J/YvoL7NP4SyxFZg=;
 b=MiOtjqkWnu8PIC/QMcJpe9++rkN8qRiMQLbuHODN8AKA8MNhpksdVRcbnl2YI2XF4S
 cXFj4eFJHWZpkmy6KyvUvnT7EA0fNG8puIIWyZkmsJS44r09yowJnX5fZj65wHBQEBmt
 nh0LCxveeqXjrO6M3RkYmZgjtcBvMB4f74UOg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734359228; x=1734964028;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z8Oktj07WxPQkf8tAMVutVUrZO5J/YvoL7NP4SyxFZg=;
 b=CxZYYKKDU6SChEGHV8veV16naufn+Vl9OIsEFagfKys9cnf21N34r0ApbvTLBZzsjo
 /1P7ERbDSupPbPGUuc4uiTGC3f8QXonVfGu7OQfPU3EA8/RendFQ3vgiiqWyQ47sviwi
 inohb4r5N3980LyNHh4mIh9GK7wRiymin+9ZVFLNuLsygbyj54glscDRFkejUd0sh7DJ
 lqQ/y90op3S47dcTmNsSwXszrW1O0BIEux3cpu9tSpNgFE666QWquP08cPKxlNliqI/S
 yYvVUhdk5m2EbZye3yPZOH3yb6P0bAX1CorM02p3KisVHbWTkETygtSpOYgUtajeA2w3
 OmVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUi5c3WHxY8Tg82w/zmtWyM44kcewXuGnHdmg10jUA2V7EpLc8iMu9TE446Ol3tAHeqJP0MiReKP7g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9smd5OIS5gvDL5wpfwFShvkZwvG0DiSkruXOFTeTlivbg6EHE
 7FIHJ+6ZU3ZFoCkXtmDTwQ2olThkWxBeXJ+fbBpXtYYXffhzrSC9TvIZ/aLedhY=
X-Gm-Gg: ASbGncsZ/wdylmVuUybxl4TeTgRlJAyak5fuU2JtybmBKfApvGvYoaUSz52zJLdiqOA
 wHjAqszDXZwSTlHvnDWAiqDEmo1AjZhPXTwt8Tdi1UTgDCLXYbdXsnYub7C125KeIlgwrV3xvvT
 d5qnssTodBRstFJkOTBGG4zwf7jrvo9wiBVRJfgOyCv0tzNjEMBU5lua9Fj2aOofgU1GbfSOJux
 sfIubk+qakdZCBBlvrRLEMwnL6dlYScq07rH3FqS8WoPtsOrKf3/n2YzHB5Mph8HQp0
X-Google-Smtp-Source: AGHT+IGn5RgQ81hy0jW21u7TUA0sQjR5dFe9QEPAlFJD5h/VCFCRbd8HnQjhW9nAjZ+l5PGK8UsXnQ==
X-Received: by 2002:a05:600c:b99:b0:435:9ed3:5698 with SMTP id
 5b1f17b1804b1-4362aa9784cmr102190165e9.24.1734359228496; 
 Mon, 16 Dec 2024 06:27:08 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4362557c54bsm141004955e9.13.2024.12.16.06.27.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 06:27:07 -0800 (PST)
Date: Mon, 16 Dec 2024 15:27:05 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 02/22] drm: Add valid clones check
Message-ID: <Z2A4uahCHuOz45Fc@phenom.ffwll.local>
Mail-Followup-To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
 <20240924-concurrent-wb-v2-2-7849f900e863@quicinc.com>
 <20240925-hasty-bald-caribou-eedbf5@houat>
 <80d08449-71de-4a7f-8b2a-8af565d8d701@quicinc.com>
 <54188c68-41c7-4a42-9eca-67363b30217a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <54188c68-41c7-4a42-9eca-67363b30217a@quicinc.com>
X-Operating-System: Linux phenom 6.12.3-amd64 
X-Mailman-Approved-At: Tue, 17 Dec 2024 13:21:57 +0000
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

On Sun, Dec 15, 2024 at 06:19:08PM -0800, Abhinav Kumar wrote:
> Hi Maxime
> 
> Gentle reminder on this one.
> 
> We are looking for some advice on how to go about KUnit for this static
> function.
> 
> Please help with our question below.
> 
> Thanks
> 
> Abhinav
> 
> On 12/6/2024 4:48 PM, Jessica Zhang wrote:
> > 
> > 
> > On 9/25/2024 12:23 AM, Maxime Ripard wrote:
> > > On Tue, Sep 24, 2024 at 03:59:18PM GMT, Jessica Zhang wrote:
> > > > Check that all encoders attached to a given CRTC are valid
> > > > possible_clones of each other.
> > > > 
> > > > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > > > ---
> > > >   drivers/gpu/drm/drm_atomic_helper.c | 23 +++++++++++++++++++++++
> > > >   1 file changed, 23 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/drm_atomic_helper.c
> > > > b/drivers/gpu/drm/drm_atomic_helper.c
> > > > index 43cdf39019a4..cc4001804fdc 100644
> > > > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > > > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > > > @@ -574,6 +574,25 @@ mode_valid(struct drm_atomic_state *state)
> > > >       return 0;
> > > >   }
> > > > +static int drm_atomic_check_valid_clones(struct
> > > > drm_atomic_state *state,
> > > > +                     struct drm_crtc *crtc)
> > > > +{
> > > > +    struct drm_encoder *drm_enc;
> > > > +    struct drm_crtc_state *crtc_state =
> > > > drm_atomic_get_new_crtc_state(state,
> > > > +                                      crtc);
> > > > +
> > > > +    drm_for_each_encoder_mask(drm_enc, crtc->dev,
> > > > crtc_state->encoder_mask) {
> > > > +        if ((crtc_state->encoder_mask & drm_enc->possible_clones) !=
> > > > +            crtc_state->encoder_mask) {
> > > > +            DRM_DEBUG("crtc%d failed valid clone check for mask
> > > > 0x%x\n",
> > > > +                  crtc->base.id, crtc_state->encoder_mask);
> > > > +            return -EINVAL;
> > > > +        }
> > > > +    }
> > > > +
> > > > +    return 0;
> > > > +}
> > > > +
> > > >   /**
> > > >    * drm_atomic_helper_check_modeset - validate state object for
> > > > modeset changes
> > > >    * @dev: DRM device
> > > > @@ -745,6 +764,10 @@ drm_atomic_helper_check_modeset(struct
> > > > drm_device *dev,
> > > >           ret = drm_atomic_add_affected_planes(state, crtc);
> > > >           if (ret != 0)
> > > >               return ret;
> > > > +
> > > > +        ret = drm_atomic_check_valid_clones(state, crtc);
> > > > +        if (ret != 0)
> > > > +            return ret;
> > > >       }
> > > 
> > > Pretty much the same comment, we should have kunit tests for this.
> > 
> > Hey Maxime,
> > 
> > I'm working on the kunit test for this and had a question on the design
> > for the unit test:
> > 
> > Since this is a static helper that returns a pretty common error code,
> > how would you recommend going about making sure that
> > `drm_atomic_check_valid_clones()` specifically is returning the error
> > (and not a different part of check_modeset) when testing the
> > check_valid_clones() failure path?

So the usual way to test very specific things of a big function is to
first setup a driver and atomic request which does pass all checks. And
then do a minimal change which does not pass anymore.

So what you could do here is have 3 connectors 1 crtc, but only the first
two connectors can be cloned. Then do an atomic request with those two
connectors and the crtc. Then the 2nd request is with one of the
connectors replaced with the 3rd one (so it's still a clone config, but
not an invalid one), then have a failure.

Note: I didn't check all the details, I might be getting something wrong
here, but the idea should work.

Cheers, Sima

> > 
> > Thanks,
> > 
> > Jessica Zhang
> > 
> > > 
> > > Maxime
> > 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
