Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B4B4FA0E5
	for <lists+freedreno@lfdr.de>; Sat,  9 Apr 2022 03:05:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE2CB10E113;
	Sat,  9 Apr 2022 01:05:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8792B10E113
 for <freedreno@lists.freedesktop.org>; Sat,  9 Apr 2022 01:05:29 +0000 (UTC)
Received: by mail-qv1-xf2f.google.com with SMTP id x5so8791812qvk.4
 for <freedreno@lists.freedesktop.org>; Fri, 08 Apr 2022 18:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rmA8PcsmUtgioFLRk5aX2eO1o1HZ2Lvld0hl0tnCmBU=;
 b=CDE3EoWWmeLvRRzMEFbBRckAFEkcKW/qfGa0QoTGglnrq+W8Mu+L4YfPJ2rZ4fPdU0
 HY+MPEhQLJXk3jvpvD7gGzcpXUFym6CQoRv0AlK0vZAnWcfim2RRxiQUyLA415L5W8QS
 NTbvf5eLBVGHs3Yy6Sf5SUz7i/j25X4qKrkg+oa17IveRLyjNtBtv9594k3ohGr1yRH2
 E5AvaZ/vkdeqI9iLjtRaQjQYUH1/9Pv0PF/zCbbmbVrNWIFRoCrT+0oRnDCmd1AEjany
 9S09RsAXx2UyQ+GnJVMtMKIOWdr73irBjESo2Z5k6ukM8yYV0trL4lDB9C6c7SZRBitZ
 eQVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rmA8PcsmUtgioFLRk5aX2eO1o1HZ2Lvld0hl0tnCmBU=;
 b=pjaFX4ntpGfam2Fzn/q1mm+yGgweKOmJLETBqBrGc5kSW6RUPVAiaOModAJz3J+vK2
 wVil2K/UX7VJkKvjJy00zIEcFcPLAhReeaV/kUzHwSLXSRb63SCRV0M0fu7jMAQg5XqZ
 h2jKg2kUvLVyFCIh4NQt5wKOYHLzBQNY7rybFcqy2uT7eTdEy+aW3VTWZZGeIL0zuiAb
 nDA5nsNhkkA57YcKSx9/n9VPMONdPjpm4DuwhrLHX6oiv6+9tJzViNKmHJdonZ3BWE42
 u/rZA84v/tBUgWJe6x7CVB6Fnsjg9PK9LcHLvD+QnCtw6f2wAyK+DhvUABIRSBys6+wz
 eVyw==
X-Gm-Message-State: AOAM530EvckS9/G5xyMycYRWCVxaSGdZUIgnwAK7uPKVyQEAQ7TrC9Lc
 rSEir/KONEmg+k4koEfg99eYy2r+1L04ur67PCr8Ow==
X-Google-Smtp-Source: ABdhPJwUY7e4WQrRxSZoDV1UNN9xe+VixnO+EGaZx8wNbXVdt5zVfBS6m584R5rVkPg2Rt7Yw4mbFQCJJUOgU/+BJY4=
X-Received: by 2002:a05:6214:2aae:b0:440:f701:e8df with SMTP id
 js14-20020a0562142aae00b00440f701e8dfmr18808032qvb.55.1649466328644; Fri, 08
 Apr 2022 18:05:28 -0700 (PDT)
MIME-Version: 1.0
References: <1649465635-20542-1-git-send-email-quic_abhinavk@quicinc.com>
 <1649465635-20542-4-git-send-email-quic_abhinavk@quicinc.com>
In-Reply-To: <1649465635-20542-4-git-send-email-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 9 Apr 2022 04:05:17 +0300
Message-ID: <CAA8EJprbA+Qdg7HOO_YSc2O0JM7f+nJ7R7Tm-R0uVBpzk_A2og@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v7 3/4] drm: allow real encoder to be passed
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
Cc: mripard@kernel.org, hamohammed.sa@gmail.com, suraj.kandpal@intel.com,
 emma@anholt.net, rodrigosiqueiramelo@gmail.com, jani.nikula@intel.com,
 liviu.dudau@arm.com, dri-devel@lists.freedesktop.org, swboyd@chromium.org,
 melissa.srw@gmail.com, robdclark@gmail.com, nganji@codeaurora.org,
 seanpaul@chromium.org, Laurent.pinchart@ideasonboard.com, daniel@ffwll.ch,
 james.qian.wang@arm.com, quic_aravindh@quicinc.com, mihail.atanassov@arm.com,
 freedreno@lists.freedesktop.org, brian.starkey@arm.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sat, 9 Apr 2022 at 03:54, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> For some vendor driver implementations, display hardware can
> be shared between the encoder used for writeback and the physical
> display.
>
> In addition resources such as clocks and interrupts can
> also be shared between writeback and the real encoder.
>
> To accommodate such vendor drivers and hardware, allow
> real encoder to be passed for drm_writeback_connector.
>
> For existing clients, drm_writeback_connector_init() will use
> an internal_encoder under the hood and hence no changes will
> be needed.
>
> changes in v7:
>         - move this change before the vc4 change in the series
>           to minimize the changes to vendor drivers in drm core
>           changes
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/drm_writeback.c | 18 ++++++++++++------
>  drivers/gpu/drm/vc4/vc4_txp.c   |  4 ++--
>  include/drm/drm_writeback.h     | 22 ++++++++++++++++++++--
>  3 files changed, 34 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
> index 92658ad..0538674 100644
> --- a/drivers/gpu/drm/drm_writeback.c
> +++ b/drivers/gpu/drm/drm_writeback.c
> @@ -180,21 +180,21 @@ int drm_writeback_connector_init(struct drm_device *dev,
>  {
>         int ret = 0;
>
> -       drm_encoder_helper_add(&wb_connector->encoder, enc_helper_funcs);
> +       drm_encoder_helper_add(&wb_connector->internal_encoder, enc_helper_funcs);
>
> -       wb_connector->encoder.possible_crtcs = possible_crtcs;
> +       wb_connector->internal_encoder.possible_crtcs = possible_crtcs;
>
> -       ret = drm_encoder_init(dev, &wb_connector->encoder,
> +       ret = drm_encoder_init(dev, &wb_connector->internal_encoder,
>                                &drm_writeback_encoder_funcs,
>                                DRM_MODE_ENCODER_VIRTUAL, NULL);
>         if (ret)
>                 return ret;
>
> -       ret = drm_writeback_connector_init_with_encoder(dev, wb_connector, &wb_connector->encoder,
> -                       con_funcs, formats, n_formats);
> +       ret = drm_writeback_connector_init_with_encoder(dev, wb_connector,
> +                       &wb_connector->internal_encoder, con_funcs, formats, n_formats);
>
>         if (ret)
> -               drm_encoder_cleanup(&wb_connector->encoder);
> +               drm_encoder_cleanup(&wb_connector->internal_encoder);
>
>         return ret;
>  }
> @@ -239,6 +239,12 @@ int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
>         struct drm_mode_config *config = &dev->mode_config;
>         int ret = create_writeback_properties(dev);
>
> +       /*
> +        * Assign the encoder passed to this API to the wb_connector's encoder.
> +        * For drm_writeback_connector_init(), this shall be the internal_encoder
> +        */
> +       wb_connector->encoder = enc;
> +
>         if (ret != 0)
>                 return ret;
>
> diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
> index 3447eb6..7e063a9 100644
> --- a/drivers/gpu/drm/vc4/vc4_txp.c
> +++ b/drivers/gpu/drm/vc4/vc4_txp.c
> @@ -159,7 +159,7 @@ struct vc4_txp {
>
>  static inline struct vc4_txp *encoder_to_vc4_txp(struct drm_encoder *encoder)
>  {
> -       return container_of(encoder, struct vc4_txp, connector.encoder);
> +       return container_of(encoder, struct vc4_txp, connector.internal_encoder);
>  }
>
>  static inline struct vc4_txp *connector_to_vc4_txp(struct drm_connector *conn)
> @@ -507,7 +507,7 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
>         if (ret)
>                 return ret;
>
> -       encoder = &txp->connector.encoder;
> +       encoder = txp->connector.encoder;
>         encoder->possible_crtcs = drm_crtc_mask(crtc);
>
>         ret = devm_request_irq(dev, irq, vc4_txp_interrupt, 0,
> diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
> index bb306fa..3fbae9d 100644
> --- a/include/drm/drm_writeback.h
> +++ b/include/drm/drm_writeback.h
> @@ -25,13 +25,31 @@ struct drm_writeback_connector {
>         struct drm_connector base;
>
>         /**
> -        * @encoder: Internal encoder used by the connector to fulfill
> +        * @encoder: handle to drm_encoder used by the connector to fulfill
>          * the DRM framework requirements. The users of the
>          * @drm_writeback_connector control the behaviour of the @encoder
>          * by passing the @enc_funcs parameter to drm_writeback_connector_init()
>          * function.
> +        *
> +        * For some vendor drivers, the hardware resources are shared between
> +        * writeback encoder and rest of the display pipeline.
> +        * To accommodate such cases, encoder is a handle to the real encoder
> +        * hardware.
> +        *
> +        * For current existing writeback users, this shall continue to be the
> +        * embedded encoder for the writeback connector.
> +        */
> +       struct drm_encoder *encoder;
> +
> +       /**
> +        * @internal_encoder: internal encoder used by writeback when
> +        * drm_writeback_connector_init() is used.
> +        * @encoder will be assigned to this for those cases
> +        *
> +        * This will be unused when drm_writeback_connector_init_with_encoder()
> +        * is used.
>          */
> -       struct drm_encoder encoder;
> +       struct drm_encoder internal_encoder;
>
>         /**
>          * @pixel_formats_blob_ptr:
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
