Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 870261E6DC9
	for <lists+freedreno@lfdr.de>; Thu, 28 May 2020 23:37:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 098916E7EF;
	Thu, 28 May 2020 21:37:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com
 [IPv6:2607:f8b0:4864:20::943])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F21989B8F
 for <freedreno@lists.freedesktop.org>; Thu, 28 May 2020 21:37:51 +0000 (UTC)
Received: by mail-ua1-x943.google.com with SMTP id k3so62993ual.8
 for <freedreno@lists.freedesktop.org>; Thu, 28 May 2020 14:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6EBXP08UfA+20wnVaOt/Z0KcauZvdNBVCxlQRkCKiaE=;
 b=hQE6rkU9ZVc2K3wj2lHCfZ6PCW6mEVrt6pyiaSDGWcBIMcQg9CeU1m6QiV/RMjl/FO
 QW+xgDshAs1RIO/5kskBlpD5CGQInHMf4OK055PDNSV+BHB9yk9TxBI+8Xml915AGrxN
 CRVyAjb8Q9DR9q6ppylctJsVaX7mnSK1Ql2rk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6EBXP08UfA+20wnVaOt/Z0KcauZvdNBVCxlQRkCKiaE=;
 b=qHJXVlE0dkscGVzkMqZkc9D+qT7HLYCDx5qxV1XJeflKCMv5k8cXGaMISklY9b0712
 xZA6D6HjJjB8QIrwepQN2FiQfIc3rqgaK3Oeby3C+sHYWbvw96zP9J5fXd853A5VgYmU
 QYeazkmAYU1IcZjz8iwl4VEqqrk2hsbmml8IDU7GO50WKXMKsNxW+RQXWwPt4brCs3pO
 zSds6by9T38uxvMWdH3BG6LAocAkZ6OE4eSHqKJk8RyhcvwejwI6bduy+kUfReAxD8PD
 gSuPtGCirBAqWPrsjyh+T5objvQi/zY59yjNYQfbyodTPDtrgddBCKZVvnH9n4beKg/x
 l0iA==
X-Gm-Message-State: AOAM530x5pjDIEHC7fZ7Dmi+qPBSVctW3Vq7ktZ/OvmGO5KyptNy9rdS
 2itQvvMc0SZGKU9ZwXtalNvwiDwWkps=
X-Google-Smtp-Source: ABdhPJxqiGikd80a0z/RDvB58hfeFsNP7BBAHUjbYBnsDqI68oiEUuBWSaMK9WRjDQsWmOLHnEhChg==
X-Received: by 2002:ab0:1548:: with SMTP id p8mr3694884uae.60.1590701869830;
 Thu, 28 May 2020 14:37:49 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com.
 [209.85.222.51])
 by smtp.gmail.com with ESMTPSA id r12sm447296vka.9.2020.05.28.14.37.48
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 May 2020 14:37:48 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id g7so64243uap.7
 for <freedreno@lists.freedesktop.org>; Thu, 28 May 2020 14:37:48 -0700 (PDT)
X-Received: by 2002:ab0:1684:: with SMTP id e4mr3531314uaf.22.1590701867624;
 Thu, 28 May 2020 14:37:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200422090443.12529-1-harigovi@codeaurora.org>
 <158931520588.215346.14524550377627605126@swboyd.mtv.corp.google.com>
In-Reply-To: <158931520588.215346.14524550377627605126@swboyd.mtv.corp.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 28 May 2020 14:37:36 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VLNuG7ZGN_yRe9zN3fahBKhevjkJDBTh7G4kozKvnDnQ@mail.gmail.com>
Message-ID: <CAD=FV=VLNuG7ZGN_yRe9zN3fahBKhevjkJDBTh7G4kozKvnDnQ@mail.gmail.com>
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [Freedreno] [v1] drm/bridge: ensure bridge suspend happens
 during PM sleep
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Harigovindan P <harigovi@codeaurora.org>, Rob Clark <robdclark@gmail.com>,
 nganji@codeaurora.org, Sean Paul <seanpaul@chromium.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Tue, May 12, 2020 at 1:26 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> The subject is not specific enough. I'd expect it to be something like:
>
> drm/bridge: ti-sn65dsi86: ensure bridge suspend happens during PM sleep
>
> Quoting Harigovindan P (2020-04-22 02:04:43)
> > ti-sn65dsi86 bridge is enumerated as a runtime device.
> >
> > Adding sleep ops to force runtime_suspend when PM suspend is
> > requested on the device.
> >
> > This change needs to be taken along with the series:
> > https://patchwork.kernel.org/patch/11494309/
>
> Why? It doesn't seem like it should be required to go along with a qcom
> specific driver patch.
>
> >
> > Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> > ---
>
> Besides the subject:
>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Are you planning to re-post with the changes Stephen requested?  Maybe
CC Sam too who was nice enough to help land some of my recent changes
to this driver.

-Doug
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
