Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A052D50A512
	for <lists+freedreno@lfdr.de>; Thu, 21 Apr 2022 18:15:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 463F310E0CF;
	Thu, 21 Apr 2022 16:15:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AABB10E0CF
 for <freedreno@lists.freedesktop.org>; Thu, 21 Apr 2022 16:15:32 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id g18so11022997ejc.10
 for <freedreno@lists.freedesktop.org>; Thu, 21 Apr 2022 09:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r/PzIKSjMeAOGbI6c4RWxm0pVUCyssgrVjMCd8c5Dag=;
 b=nSF4LY4d2BN1+JKzCgg54cIZdi/67BsPH/yDBzQffgGlo9dfl+XlmWXoZzWzMAXnIp
 qdZnwGxZTweXi0UkZvcPT3csTHegVQ7l9Yr8NqemyuxGmINZvpE6WVK/kWcyEnj1B29C
 R+2ri3hviOx0Pn502v6FXWj/8GgnrITxJ4CN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r/PzIKSjMeAOGbI6c4RWxm0pVUCyssgrVjMCd8c5Dag=;
 b=efhB0onQMM1wEcLs/P4K3xufPC2b8T9NuaVdnHM40vjjkWXzmkpkBDUVk1WGCCtIGC
 feyPjNIPH810aQPjvCAXge8dqCZluVlRUxfX9RA+LrRZflgBxBs0aTnsZrNxP3pzOs5w
 jxcf98F/1lhF0meMmCZBky5oh6u8hmbRnotLO0t8Woir7HbnjjrNMDHAH4GKCLlTLXZM
 cC1+6vmg9Y3ZU8A6UiQTLbizAYvPxx8dWfYHHpgAFWVnkczNcqFqb0OvFRY5+BxMqW2a
 QllJwRAv3c884FBRIuXNJoIk+kbhfCbfvq6UdpGpgyP9CP0WnC28LckWcojB4X+qnyQp
 JFkA==
X-Gm-Message-State: AOAM533OLwllABpkZWrAASq2TQC6FJyiQx75WayzpVEO1oRBpi/UUnAy
 MzQa7QMFdT7GuqaiUse47VA2iLkyTBuiBuqY5ic=
X-Google-Smtp-Source: ABdhPJw3/ilq17jZaDm5XOkZIB1DDGmfpX7LfQNQCZgaWAj9YNoeC4EJh9kTgmYqcXgNMZxRZUR1rA==
X-Received: by 2002:a17:907:8a08:b0:6ef:f0c9:9472 with SMTP id
 sc8-20020a1709078a0800b006eff0c99472mr231865ejc.397.1650557730556; 
 Thu, 21 Apr 2022 09:15:30 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com.
 [209.85.208.54]) by smtp.gmail.com with ESMTPSA id
 la10-20020a170907780a00b006e889ee7741sm7952767ejc.75.2022.04.21.09.15.29
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 09:15:30 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id y21so266906edo.2
 for <freedreno@lists.freedesktop.org>; Thu, 21 Apr 2022 09:15:29 -0700 (PDT)
X-Received: by 2002:adf:a29c:0:b0:20a:a246:a826 with SMTP id
 s28-20020adfa29c000000b0020aa246a826mr355251wra.422.1650557277978; Thu, 21
 Apr 2022 09:07:57 -0700 (PDT)
MIME-Version: 1.0
References: <1650551811-24319-1-git-send-email-quic_sbillaka@quicinc.com>
 <1650551811-24319-2-git-send-email-quic_sbillaka@quicinc.com>
 <CAD=FV=Ug-ZRiMrVyVH+OT1fMhyUnAixP2FfWKTQpLZXka0U_=g@mail.gmail.com>
 <MW4PR02MB718603608E45FB53A8D942C7E1F49@MW4PR02MB7186.namprd02.prod.outlook.com>
In-Reply-To: <MW4PR02MB718603608E45FB53A8D942C7E1F49@MW4PR02MB7186.namprd02.prod.outlook.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 21 Apr 2022 09:07:44 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UOALugpmgJK8dHxK=b_GO+c12d3xmGE3HiqJK+yznViA@mail.gmail.com>
Message-ID: <CAD=FV=UOALugpmgJK8dHxK=b_GO+c12d3xmGE3HiqJK+yznViA@mail.gmail.com>
To: "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v8 1/4] drm/msm/dp: Add eDP support via
 aux_bus
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
 <devicetree@vger.kernel.org>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 quic_vproddut <quic_vproddut@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Steev Klimaszewski <steev@kali.org>, Daniel Vetter <daniel@ffwll.ch>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Thu, Apr 21, 2022 at 9:00 AM Sankeerth Billakanti (QUIC)
<quic_sbillaka@quicinc.com> wrote:
>
> >> +       }
> >> +
> >> +       /*
> >> +        * External bridges are mandatory for eDP interfaces: one has to
> >> +        * provide at least an eDP panel (which gets wrapped into panel-
> >bridge).
> >> +        *
> >> +        * For DisplayPort interfaces external bridges are optional, so
> >> +        * silently ignore an error if one is not present (-ENODEV).
> >> +        */
> >> +       rc = dp_parser_find_next_bridge(dp_priv->parser);
> >> +       if (rc && dp->is_edp) {
> >> +               DRM_ERROR("eDP: cannot find the next bridge, rc = %d\n", rc);
> >> +               goto edp_error;
> >> +       } else if (rc && rc != -ENODEV) {
> >> +               DRM_ERROR("DP: cannot find the next bridge, rc = %d\n", rc);
> >> +               goto error;
> >> +       }
> >
> >The above wouldn't be my favorite way of doing this. Instead, I would have
> >written:
> >
> >  if (rc) {
> >    DRM_ERROR("Cannot find the next bridge, rc = %d\n", rc);
> >    goto err;
> >  }
> >  ...
> >
> >err:
> >  if (dp->is_edp) {
> >    disable_irq(...);
> >    dp_display_host_phy_exit(...);
> >    dp_display_host_deinit(...);
> >  }
> >  return rc;
> >
>
> If rc is ENODEV for DP, then we need to return 0. Shall I add like below ?
>
> err:
>   if (dp->is_edp) {
>     disable_irq(...);
>     dp_display_host_phy_exit(...);
>     dp_display_host_deinit(...);
>   } else
>         If (rc == -ENODEV)
>             rc = 0;
>   return rc;

I wouldn't. Then you're essentially going to "err" for a case that you
don't consider an error. I would instead have just handled it right
away.

rc = dp_parser_find_next_bridge(dp_priv->parser);
if (!dp->is_edp && rc == -ENODEV)
  return 0;

This also is better IMO because it means you aren't assuming that
`dp_priv->parser->next_bridge` is "valid" (or at least NULL) after
dp_parser_find_next_bridge() returned an error.

-Doug
