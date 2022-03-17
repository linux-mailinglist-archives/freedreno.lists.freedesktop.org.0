Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B36894DC382
	for <lists+freedreno@lfdr.de>; Thu, 17 Mar 2022 11:01:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0447B10E6D6;
	Thu, 17 Mar 2022 10:01:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88D6C10E2B6
 for <freedreno@lists.freedesktop.org>; Thu, 17 Mar 2022 10:01:40 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id n35so1173335wms.5
 for <freedreno@lists.freedesktop.org>; Thu, 17 Mar 2022 03:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=9l6NBxX2UZsMGRkoxZx43LnIDFGc4TaO3DZ+Kj9Qpf4=;
 b=cmNuvLZeUm3UsnoG4XRekrH5FSBFxvAFKD4LwxK8oD2ZoeYqjOrHfEeKymX4dvXUhC
 Wp2wZFY/TpaCiL6oIN3YRi10XdxvG7NW5mUiI4clRd9UBS7FQ9awp0dmuRwpB8JEIM5B
 56CCPMnTQTKXrmfC0gHW02R9a5W0vC9bn4T+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9l6NBxX2UZsMGRkoxZx43LnIDFGc4TaO3DZ+Kj9Qpf4=;
 b=OosM1lAQZsKnP1cSKA9x9QDdnusECrsCLT8MPokE+7hIHQUJ+mlviG6bRpa2AATVoZ
 nEdzj3aQvzeMiUom33KiMNyam3InSCEZDKLZ4xXyHax1ngTwTmd11hDZ6N4Ty62oeF06
 II11ALaev9deViJ086/+BYWKdkgS4oGtbtZWJA1vQEJIHi9OZhr1LYpko4UQ8b34pS+U
 PoPmbxycjMNpuSa4cQcUbKDGcRVltk1lC1EECjn3DjOOgNKtAI/68J0n+hoerl8lGm/v
 4A63eTejW6txL5lIkCAHAi/rnJdlhxVgtuqczKwUmOSr/1biA0dcACSvQbnzfOG+jLwW
 zF8Q==
X-Gm-Message-State: AOAM5336XvjfAunAxzrx21JflCzd0q5ZTWEfGdi3z8Hn/z0hA80NUldl
 oCuVKBWqUuL6gW9dInRvvaHCtA==
X-Google-Smtp-Source: ABdhPJyJx1Y44+6zNzj+dXcthENWKdkjHlvTlAl03eTRnbjmkk5+aYe8Tosyv9oBzRKNnpjfhcAJsA==
X-Received: by 2002:a05:600c:4f15:b0:38c:3db8:11cf with SMTP id
 l21-20020a05600c4f1500b0038c3db811cfmr3187653wmq.132.1647511298877; 
 Thu, 17 Mar 2022 03:01:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 bg42-20020a05600c3caa00b00380deeaae72sm5899618wmb.1.2022.03.17.03.01.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 03:01:38 -0700 (PDT)
Date: Thu, 17 Mar 2022 11:01:36 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Message-ID: <YjMHAI8zlxey/WNl@phenom.ffwll.local>
References: <1646963400-25606-1-git-send-email-quic_abhinavk@quicinc.com>
 <1646963400-25606-2-git-send-email-quic_abhinavk@quicinc.com>
 <CAA8EJpqnC=crWaSrXLNLBX5WsZ6LDzG0aNUu7RmqhDPTvP8tFQ@mail.gmail.com>
 <YisC4cY8EZADarG6@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YisC4cY8EZADarG6@pendragon.ideasonboard.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Subject: Re: [Freedreno] [PATCH 1/6] drm: allow real encoder to be passed
 for drm_writeback_connector
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
Cc: hamohammed.sa@gmail.com, suraj.kandpal@intel.com, emma@anholt.net,
 rodrigosiqueiramelo@gmail.com, jani.nikula@intel.com, liviu.dudau@arm.com,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, melissa.srw@gmail.com, robdclark@gmail.com,
 nganji@codeaurora.org, seanpaul@chromium.org, mripard@kernel.org,
 daniel@ffwll.ch, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 james.qian.wang@arm.com, quic_aravindh@quicinc.com, mihail.atanassov@arm.com,
 freedreno@lists.freedesktop.org, brian.starkey@arm.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, Mar 11, 2022 at 10:05:53AM +0200, Laurent Pinchart wrote:
> On Fri, Mar 11, 2022 at 10:46:13AM +0300, Dmitry Baryshkov wrote:
> > On Fri, 11 Mar 2022 at 04:50, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > >
> > > For some vendor driver implementations, display hardware can
> > > be shared between the encoder used for writeback and the physical
> > > display.
> > >
> > > In addition resources such as clocks and interrupts can
> > > also be shared between writeback and the real encoder.
> > >
> > > To accommodate such vendor drivers and hardware, allow
> > > real encoder to be passed for drm_writeback_connector.
> > >
> > > Co-developed-by: Kandpal Suraj <suraj.kandpal@intel.com>
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > ---
> > >  drivers/gpu/drm/drm_writeback.c |  8 ++++----
> > >  include/drm/drm_writeback.h     | 13 +++++++++++--
> > >  2 files changed, 15 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
> > > index dccf4504..4dad687 100644
> > > --- a/drivers/gpu/drm/drm_writeback.c
> > > +++ b/drivers/gpu/drm/drm_writeback.c
> > > @@ -189,8 +189,8 @@ int drm_writeback_connector_init(struct drm_device *dev,
> > >         if (IS_ERR(blob))
> > >                 return PTR_ERR(blob);
> > >
> > > -       drm_encoder_helper_add(&wb_connector->encoder, enc_helper_funcs);
> > > -       ret = drm_encoder_init(dev, &wb_connector->encoder,
> > > +       drm_encoder_helper_add(wb_connector->encoder, enc_helper_funcs);
> > > +       ret = drm_encoder_init(dev, wb_connector->encoder,
> > >                                &drm_writeback_encoder_funcs,
> > >                                DRM_MODE_ENCODER_VIRTUAL, NULL);
> > 
> > If the encoder is provided by a separate driver, it might use a
> > different set of encoder funcs.
> 
> More than that, if the encoder is provided externally but doesn't have
> custom operations, I don't really see the point of having an external
> encoder in the first place.
> 
> Has this series been tested with a driver that needs to provide an
> encoder, to make sure it fits the purpose ?

Also, can we not force all drivers to do this setup that don't need it? We
have a ton of kms drivers, forcing unnecessary busiwork on drivers is
really not good.
-Daniel

> 
> > I'd suggest checking whether the wb_connector->encoder is NULL here.
> > If it is, allocate one using drmm_kzalloc and init it.
> > If it is not NULL, assume that it has been initialized already, so
> > skip the drm_encoder_init() and just call the drm_encoder_helper_add()
> > 
> > >         if (ret)
> > > @@ -204,7 +204,7 @@ int drm_writeback_connector_init(struct drm_device *dev,
> > >                 goto connector_fail;
> > >
> > >         ret = drm_connector_attach_encoder(connector,
> > > -                                               &wb_connector->encoder);
> > > +                                               wb_connector->encoder);
> > >         if (ret)
> > >                 goto attach_fail;
> > >
> > > @@ -233,7 +233,7 @@ int drm_writeback_connector_init(struct drm_device *dev,
> > >  attach_fail:
> > >         drm_connector_cleanup(connector);
> > >  connector_fail:
> > > -       drm_encoder_cleanup(&wb_connector->encoder);
> > > +       drm_encoder_cleanup(wb_connector->encoder);
> > >  fail:
> > >         drm_property_blob_put(blob);
> > >         return ret;
> > > diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
> > > index 9697d27..0ba266e 100644
> > > --- a/include/drm/drm_writeback.h
> > > +++ b/include/drm/drm_writeback.h
> > > @@ -25,13 +25,22 @@ struct drm_writeback_connector {
> > >         struct drm_connector base;
> > >
> > >         /**
> > > -        * @encoder: Internal encoder used by the connector to fulfill
> > > +        * @encoder: handle to drm_encoder used by the connector to fulfill
> > >          * the DRM framework requirements. The users of the
> > >          * @drm_writeback_connector control the behaviour of the @encoder
> > >          * by passing the @enc_funcs parameter to drm_writeback_connector_init()
> > >          * function.
> > > +        *
> > > +        * For some vendor drivers, the hardware resources are shared between
> > > +        * writeback encoder and rest of the display pipeline.
> > > +        * To accommodate such cases, encoder is a handle to the real encoder
> > > +        * hardware.
> > > +        *
> > > +        * For current existing writeback users, this shall continue to be the
> > > +        * embedded encoder for the writeback connector.
> > > +        *
> > >          */
> > > -       struct drm_encoder encoder;
> > > +       struct drm_encoder *encoder;
> > >
> > >         /**
> > >          * @pixel_formats_blob_ptr:
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
