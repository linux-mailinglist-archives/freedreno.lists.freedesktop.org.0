Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9967C4EE4C6
	for <lists+freedreno@lfdr.de>; Fri,  1 Apr 2022 01:29:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E96210E338;
	Thu, 31 Mar 2022 23:29:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BBE710E12B
 for <freedreno@lists.freedesktop.org>; Thu, 31 Mar 2022 23:29:56 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id c62so1043930edf.5
 for <freedreno@lists.freedesktop.org>; Thu, 31 Mar 2022 16:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UvSSaxHQfu4KzKOKApPWWxQRgS6ya5jprTe140uOq38=;
 b=kRhrubUDhwfjRpRcH2joioz8ltkxfJNbJymSnvaltF2wfQaBrE1Vt07IDBgRkdEHXE
 oyt/cLr6MOTdSRSYEb/qZXgAbgWmYV8v91sSnENZIrXOCOvtBY6eMgGQehbIw9f54vHH
 Liv7tiuP7y9hjW7LHsjGWLQo+Eqrwsqz2awtg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UvSSaxHQfu4KzKOKApPWWxQRgS6ya5jprTe140uOq38=;
 b=Ux6eVKUSC/x1/nHykqeUCI+NIQ58MozLjBRoQInrM08hX1b/7b+Me7jhUzufgTvfml
 DwRJOzmHXTeRgW1BLmYahjPBmCzr5D1KoloZ/2/0sCuw8TW+9scTUkd2hUAgNjrIYNV9
 n4WcmEHeTOyteftxv6VHJQ76kb2RQUl0i0y3Hm8YrFssr0qcMryU0v330h5yROAggqk9
 Ta5JjHczmvmHuprW2StKYEM164DFnIy5YMiL5gO19xQhk5ES//DkSCnmyK7n6OHBakQw
 W+oXWPN0JdAFyipAN3m5dUXS0p7QhXsw+hXnsQydH/IMrVEJBBq2oX8ZjzkJd1ZrEfXh
 BwwQ==
X-Gm-Message-State: AOAM530ZGlp7YqbgdsB58rR+hvMOkClFzVfxxupkhbfAP7KEE59toVgX
 7c04gqYwlikKeKh2gJbV/N+Aejmbdj95cV9DkMo=
X-Google-Smtp-Source: ABdhPJx/3sYL5zDKPb5NvZ6RzzgH/MhGZ69Tvo2+wkqG5O4q3aBX0JQN04pJe5H0XdbtQw9bIcU0jQ==
X-Received: by 2002:aa7:de93:0:b0:418:d700:662a with SMTP id
 j19-20020aa7de93000000b00418d700662amr18441382edv.107.1648769394770; 
 Thu, 31 Mar 2022 16:29:54 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com.
 [209.85.218.48]) by smtp.gmail.com with ESMTPSA id
 mp33-20020a1709071b2100b006db6dea7f9dsm319527ejc.168.2022.03.31.16.29.54
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Mar 2022 16:29:54 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id c10so2322246ejs.13
 for <freedreno@lists.freedesktop.org>; Thu, 31 Mar 2022 16:29:54 -0700 (PDT)
X-Received: by 2002:a5d:5551:0:b0:203:f916:e319 with SMTP id
 g17-20020a5d5551000000b00203f916e319mr5707669wrw.422.1648769060253; Thu, 31
 Mar 2022 16:24:20 -0700 (PDT)
MIME-Version: 1.0
References: <1648656179-10347-1-git-send-email-quic_sbillaka@quicinc.com>
 <1648656179-10347-9-git-send-email-quic_sbillaka@quicinc.com>
 <CAA8EJprvE31ex3fCQHZ-=x+EWHK4UZ0qqHRh+rH4dk5TPhmVyw@mail.gmail.com>
 <MW4PR02MB71867220A90FCFED295830D0E1E19@MW4PR02MB7186.namprd02.prod.outlook.com>
In-Reply-To: <MW4PR02MB71867220A90FCFED295830D0E1E19@MW4PR02MB7186.namprd02.prod.outlook.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 31 Mar 2022 16:24:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VK0D_GzYBv+u+o6-ks-UAsw97__0mWsSn9OycX72LJFg@mail.gmail.com>
Message-ID: <CAD=FV=VK0D_GzYBv+u+o6-ks-UAsw97__0mWsSn9OycX72LJFg@mail.gmail.com>
To: "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v6 8/8] drm/msm/dp: Handle eDP mode_valid
 differently from dp
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
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 quic_vproddut <quic_vproddut@quicinc.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "swboyd@chromium.org" <swboyd@chromium.org>,
 "sean@poorly.run" <sean@poorly.run>,
 "robdclark@gmail.com" <robdclark@gmail.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Wed, Mar 30, 2022 at 11:02 PM Sankeerth Billakanti (QUIC)
<quic_sbillaka@quicinc.com> wrote:
>
> Hi Dmitry,
>
> > On Wed, 30 Mar 2022 at 19:04, Sankeerth Billakanti
> > <quic_sbillaka@quicinc.com> wrote:
> > >
> > > The panel-edp driver modes needs to be validated differently from DP
> > > because the link capabilities are not available for EDP by that time.
> > >
> > > Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> >
> > This should not be necessary after
> > https://patchwork.freedesktop.org/patch/479261/?series=101682&rev=1.
> > Could you please check?
> >
>
> The check for DP_MAX_PIXEL_CLK_KHZ is not necessary anymore but we need
> to return early for eDP because unlike DP, eDP context will not have the information
> about the number of lanes and link clock.
>
> So, I will modify the patch to return after the DP_MAX_PIXEL_CLK_KHZ check if is_eDP is set.

I haven't walked through all the relevant code but something you said
above sounds strange. You say that for eDP we don't have info about
the number of lanes? We _should_.

It's certainly possible to have a panel that supports _either_ 1 or 2
lanes but then only physically connect 1 lane to it. ...or you could
have a panel that supports 2 or 4 lanes and you only connect 1 lane.
See, for instance, ti_sn_bridge_parse_lanes. There we assume 4 lanes
but if a "data-lanes" property is present then we can use that to know
that fewer lanes are physically connected.

It's also possible to connect more lanes to a panel than it supports.
You could connect 2 lanes to it but then it only supports 1. This case
needs to be handled as well...


-Doug
