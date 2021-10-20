Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C227435181
	for <lists+freedreno@lfdr.de>; Wed, 20 Oct 2021 19:41:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C6F06E3A0;
	Wed, 20 Oct 2021 17:41:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61EED6E3A0
 for <freedreno@lists.freedesktop.org>; Wed, 20 Oct 2021 17:41:05 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id y67so25598347iof.10
 for <freedreno@lists.freedesktop.org>; Wed, 20 Oct 2021 10:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=09x1oRFaTKDmQrhlhOb9jy+N6hL8DwJNbTkF0zphjoE=;
 b=mnQOVOqgdt1WuKAT8iYksqfZizblzHqHQ0ZpeyU/Tr7i35LtYOojJ16b518ll9ZQop
 mSXIV/ojivDGtUBOWZKJAjqQpyiuL6uYQv8P1dwI4WVCWO4wf9sJhg+9F4yd4Opbq1HD
 yzO3c7Ha5/V2RuTtNP0UfuMMt6qwM6HdXnzJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=09x1oRFaTKDmQrhlhOb9jy+N6hL8DwJNbTkF0zphjoE=;
 b=5j6NKOx0szShUQcUwVs62ol/Gc6KoPnlbrWo3V6RH/CM7ydFXzFVH/vYe10QRQI44n
 GxjHR3smDZYfGi6tdZP5YKtyhiaSyTJFLWvzYKfnNidXfcjeyk1hp41s5vt12E049ycY
 5aVyZRdsCn4n7H4iikGSyW+VOMV9GEisr3rYKULtBLwkBjL2Gd4EYRcXBT3FPKdBpNl1
 l1g+VCsAYnO/hDnv5qvY+8U/CM4IJ12y5lK2mCHCDVubDpRhIpG6dbpN8ObzF8vfCHfe
 Np9H9fpcZX9UkrLbAiWoGBigmQHPmNyiMDXRo/JwY8GI5jvvTYcyR3vXaj0WOsUxoqRX
 f6Hw==
X-Gm-Message-State: AOAM530J/VplnwUWOVrEmjkYg3zIutIsXFDKWTrOiq8qIZErCnNYzGwO
 VI8aMjYrApTNyuGyNks4fqlH19NMBSjWDg==
X-Google-Smtp-Source: ABdhPJzu33HBnPHcW8PpCkXL5Lc6LFS8vjHilLN8nC1FtmT9ttFZ2Cu/CIHT19DLSMDtQUyNnH933g==
X-Received: by 2002:a6b:208:: with SMTP id 8mr462707ioc.46.1634751663997;
 Wed, 20 Oct 2021 10:41:03 -0700 (PDT)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com.
 [209.85.166.46])
 by smtp.gmail.com with ESMTPSA id h26sm1368723ila.4.2021.10.20.10.41.03
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 10:41:03 -0700 (PDT)
Received: by mail-io1-f46.google.com with SMTP id e144so25670513iof.3
 for <freedreno@lists.freedesktop.org>; Wed, 20 Oct 2021 10:41:03 -0700 (PDT)
X-Received: by 2002:a05:6638:2510:: with SMTP id
 v16mr514672jat.68.1634751662770; 
 Wed, 20 Oct 2021 10:41:02 -0700 (PDT)
MIME-Version: 1.0
References: <1634732051-31282-1-git-send-email-quic_sbillaka@quicinc.com>
 <1634732051-31282-3-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1634732051-31282-3-git-send-email-quic_sbillaka@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 20 Oct 2021 10:40:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U9==zFpYtiU1S=n+Ygy5Qa4xfA6GFMpHJUtkpjpNfcyw@mail.gmail.com>
Message-ID: <CAD=FV=U9==zFpYtiU1S=n+Ygy5Qa4xfA6GFMpHJUtkpjpNfcyw@mail.gmail.com>
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>, 
 LKML <linux-kernel@vger.kernel.org>, 
 Sankeerth Billakanti <sbillaka@codeaurora.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <seanpaul@chromium.org>, Stephen Boyd <swboyd@chromium.org>, 
 Kalyan Thota <kalyan_t@codeaurora.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>,
 Krishna Manikandan <mkrishn@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 2/2] dt-bindings: Add SC7280 compatible
 string
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

Hi,

On Wed, Oct 20, 2021 at 5:14 AM Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> From: Sankeerth Billakanti <sbillaka@codeaurora.org>
>
> The Qualcomm SC7280 platform supports an eDP controller, add
> compatible string for it to dp-controller.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
>  1 file changed, 1 insertion(+)

I think you ignored some of the feedback that was given on v1. Perhaps
you could go back and re-read that feedback? See the replies to:

https://lore.kernel.org/r/1628726882-27841-3-git-send-email-sbillaka@codeaurora.org/

For one, ${SUBJECT} needs updating. It's probably as simple as adding
the "msm/dp" tag, like:

dt-bindings: msm/dp: Add SC7280 compatible string

For another, Stephen requested that you add "sc7280-dp" too.
