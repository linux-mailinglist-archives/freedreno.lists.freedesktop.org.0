Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 869D65018FF
	for <lists+freedreno@lfdr.de>; Thu, 14 Apr 2022 18:47:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A5B010FC77;
	Thu, 14 Apr 2022 16:47:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EB1210FC77
 for <freedreno@lists.freedesktop.org>; Thu, 14 Apr 2022 16:47:38 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id i27so11153714ejd.9
 for <freedreno@lists.freedesktop.org>; Thu, 14 Apr 2022 09:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sMT54nF1SMSOMqMYCZmgi8xN7eOCKvvK35fHMg+oHcc=;
 b=HSJ9f0E6ehW76H552h3PgIs14xn6y6HwbJiaJF0oa3iCxtOPhzg/D2glMXnfa5V7zs
 2ydypI+2zeXrr0g9B4UWfLJdZ34Qn5AYYeaah1j314JBM4begDsciAwS3BG0HazrznFc
 uoig8EHfEzKP8qEFJ3HrxOKUff/q+RBzzM2nM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sMT54nF1SMSOMqMYCZmgi8xN7eOCKvvK35fHMg+oHcc=;
 b=zotNktdyklX3OX6bVQyYpF4BDpprzhyfYIbLYk+4sSWt1ewn19GaoTdJCESw5qyIrR
 lru08LSlBVizBre3fGaiZ+Jbv22pv2+o/4hJ/10/eY0+KybFcPfijIb0mPA+BnIlL0/q
 FkWVbNVx0z/ihqmA22gFMOdONPliEkkFUjguRhiaV207i78ne/BkZssDPPh1IHBasRPp
 NHIPOWLCxQsWWzSsP5kTsEpKhyO5lVpRklzGrrdsJVBTQiSRTpCOBA/cpYevxQYDrxlU
 ZCH03XHqrpI1Vn8AeKNGJS9a46Fgy0Dal5+H32g4O7OtGk80WUn+ZDVu2XgY3b5yTQjZ
 WGmg==
X-Gm-Message-State: AOAM533XU9GQRH8EdoeJ82+NlYlac6aFqYKTgy0VXTu/8aU1BJ/mrN+2
 3/Nbx3KziBm24slriKVMmrsqX0Sqy5QgxrP0vF8=
X-Google-Smtp-Source: ABdhPJylMjsgHTJv5khnCa/ULSYfqFXWZRs62lFJrTkfdKpTai17HoiOuVvX+0TlR5p8oopBTeKsRg==
X-Received: by 2002:a17:906:2991:b0:6cf:6b24:e92f with SMTP id
 x17-20020a170906299100b006cf6b24e92fmr3089007eje.748.1649954856338; 
 Thu, 14 Apr 2022 09:47:36 -0700 (PDT)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com.
 [209.85.218.53]) by smtp.gmail.com with ESMTPSA id
 eq7-20020a056402298700b00419d8d46a8asm1159577edb.39.2022.04.14.09.47.35
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 09:47:35 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id i27so11153560ejd.9
 for <freedreno@lists.freedesktop.org>; Thu, 14 Apr 2022 09:47:35 -0700 (PDT)
X-Received: by 2002:a5d:64ce:0:b0:208:fff6:22cb with SMTP id
 f14-20020a5d64ce000000b00208fff622cbmr2751540wri.301.1649954404806; Thu, 14
 Apr 2022 09:40:04 -0700 (PDT)
MIME-Version: 1.0
References: <1649938766-6768-1-git-send-email-quic_sbillaka@quicinc.com>
 <1649938766-6768-4-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1649938766-6768-4-git-send-email-quic_sbillaka@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 14 Apr 2022 09:39:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wv57p-A=zniSKZYStRSPby7vSE-SqZQ-JVuQsO+MbK+A@mail.gmail.com>
Message-ID: <CAD=FV=Wv57p-A=zniSKZYStRSPby7vSE-SqZQ-JVuQsO+MbK+A@mail.gmail.com>
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v7 3/4] drm/msm/dp: wait for hpd high before
 aux transaction
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 quic_vproddut <quic_vproddut@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Steev Klimaszewski <steev@kali.org>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Thu, Apr 14, 2022 at 5:20 AM Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> The source device should ensure the sink is ready before proceeding to
> read the sink capability or perform any aux transactions. The sink
> will indicate its readiness by asserting the HPD line. The controller
> driver needs to wait for the hpd line to be asserted by the sink before
> it performs any aux transactions.
>
> The eDP sink is assumed to be always connected. It needs power from the
> source and its HPD line will be asserted only after the panel is powered
> on. The panel power will be enabled from the panel-edp driver and only
> after that, the hpd line will be asserted.
>
> Whereas for DP, the sink can be hotplugged and unplugged anytime. The hpd
> line gets asserted to indicate the sink is connected and ready. Hence
> there is no need to wait for the hpd line to be asserted for a DP sink.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---

It might be worth mentioning "after the cut" that we may eventually
end up changing the rules if people like my proposal [1]. However,
what your code is doing here for eDP is correct as things are
currently intended to work and it would make sense to land it while we
debate about whether we want to add the is_hpd_asserted() callback
like my patch does.

[1] https://lore.kernel.org/r/20220408193536.RFC.3.Icf57bb12233a47727013c6ab69eebf803e22ebc1@changeid/


> Changes in v7:
>   - add a comment to say why the wait si done for eDP
>   - correct the commit text
>
> Changes in v6:
>   - Wait for hpd high only for eDP
>   - Split into smaller patches
>
>  drivers/gpu/drm/msm/dp/dp_aux.c     | 21 ++++++++++++++++++++-
>  drivers/gpu/drm/msm/dp/dp_aux.h     |  3 ++-
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 13 +++++++++++++
>  drivers/gpu/drm/msm/dp/dp_catalog.h |  1 +
>  drivers/gpu/drm/msm/dp/dp_display.c |  2 +-
>  5 files changed, 37 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
> index 6d36f63..cf0739f 100644
> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> @@ -36,6 +36,7 @@ struct dp_aux_private {
>         bool initted;
>         u32 offset;
>         u32 segment;
> +       bool is_edp;

Kinda nitty, but can you put it next to the other booleans? This will
help with structure packing.


>         struct drm_dp_aux dp_aux;
>  };
> @@ -337,6 +338,22 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
>                 goto exit;
>         }
>
> +       /*
> +        * For eDP it's important to give a reasonably long wait here for HPD
> +        * to be asserted. This is because the panel driver may have _just_
> +        * turned on the panel and then tried to do an AUX transfer. The panel
> +        * driver has no way of knowing when the panel is ready, so it's up
> +        * to us to wait. For DP we never get into this situation so let's
> +        * avoid ever doing the extra long wait for DP.
> +        */
> +       if (aux->is_edp) {
> +               ret = dp_catalog_aux_wait_for_hpd_connect_state(aux->catalog);
> +               if (ret) {
> +                       DRM_DEBUG_DP("Panel not ready for aux transactions\n");
> +                       goto exit;
> +               }
> +       }
> +
>         dp_aux_update_offset_and_segment(aux, msg);
>         dp_aux_transfer_helper(aux, msg, true);
>
> @@ -491,7 +508,8 @@ void dp_aux_unregister(struct drm_dp_aux *dp_aux)
>         drm_dp_aux_unregister(dp_aux);
>  }
>
> -struct drm_dp_aux *dp_aux_get(struct device *dev, struct dp_catalog *catalog)
> +struct drm_dp_aux *dp_aux_get(struct device *dev, struct dp_catalog *catalog,
> +                               bool is_edp)

nit: I think indentation rules for this file are that the type of the
argument for the 2nd line should line up right under the 1st. Thus you
should delete one tab character and insert 6 spaces before the "bool".

Similar in other places, like your header file.


Stuff above is all nits and this looks right to me. I'm happy with:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
