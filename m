Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA9B4F8A8B
	for <lists+freedreno@lfdr.de>; Fri,  8 Apr 2022 02:21:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61D3710EE70;
	Fri,  8 Apr 2022 00:21:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56E6E10EE70
 for <freedreno@lists.freedesktop.org>; Fri,  8 Apr 2022 00:21:22 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id l7so8712049ejn.2
 for <freedreno@lists.freedesktop.org>; Thu, 07 Apr 2022 17:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4AEJnP5mTsYddtMXtuB9PzpAwm62Zr/93tws7knCoTY=;
 b=FrYI2nBdk+yG/OOXXygzXyvL+ZpcWJWtKe8unV3SbCy1rXBwNnk84WeXyNP/2VlDJy
 Kg/uBh0NPlU2+DivSPdwyS8dsLdPzD8+y5xmEtYYC5jD30jJr5S+ozejI/3/UdKogkht
 sWSHEixJSYchJR9gauZlQDTuFx098SCzhXo+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4AEJnP5mTsYddtMXtuB9PzpAwm62Zr/93tws7knCoTY=;
 b=cG2+dWuKt5PvnNxFcZRZKrgeR9LPMIPHA2jHR82y8/DvEhX08UxpPWXbkxp+FGTX+S
 SsjEnEZcM06Dixon7sFIHYLSR8m8Y3oOYeddt1LRr/WwIHZFg0/VSc2Iut2UxDfNTmoH
 0LAKaFvdsSmPZnZSNbZZTsPxEDoptJB1PGTuqE5aIMyt66FngJcvSDBOKg8v31GkilrS
 3ooIPZEzT/6ZWgrWYplm/IR4xl4lckCScCe53hE4FKh/QDU1CZJwDoLF3I09wWEUmd02
 40eRnJ0RTVSf3X0BsKu5UECbA019pWykg2kVZpYPRoMdICvLByX33Tk4535deixpE0oM
 028A==
X-Gm-Message-State: AOAM530ndWbwLiwQzTvd6fqNqhTsP6gyhkQ9wRvaBI6lwWnHiPY9W0T5
 2W17UfTavbqjB1wYcjaUkjhUw+fBIbXgeeJuwmQ=
X-Google-Smtp-Source: ABdhPJxpMO1135REzs5vq8rv8hD8bkyyuNCsihGN/n57kDbN6G3q2vivJYDHTNA+qtiilnd+gFLttQ==
X-Received: by 2002:a17:906:dc8f:b0:6e0:5ce7:d80e with SMTP id
 cs15-20020a170906dc8f00b006e05ce7d80emr16313777ejc.435.1649377280615; 
 Thu, 07 Apr 2022 17:21:20 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com.
 [209.85.221.54]) by smtp.gmail.com with ESMTPSA id
 k16-20020a17090646d000b006e093439cdfsm8110846ejs.89.2022.04.07.17.21.19
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Apr 2022 17:21:19 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id m30so10574784wrb.1
 for <freedreno@lists.freedesktop.org>; Thu, 07 Apr 2022 17:21:19 -0700 (PDT)
X-Received: by 2002:a5d:568e:0:b0:207:8d1a:46c6 with SMTP id
 f14-20020a5d568e000000b002078d1a46c6mr3186227wrv.422.1649377278855; Thu, 07
 Apr 2022 17:21:18 -0700 (PDT)
MIME-Version: 1.0
References: <1648656179-10347-1-git-send-email-quic_sbillaka@quicinc.com>
 <1648656179-10347-2-git-send-email-quic_sbillaka@quicinc.com>
 <CAD=FV=X+QvjwoT2zGP82KW4kD0oMUY6ZgCizSikNX_Uj8dNDqA@mail.gmail.com>
 <392b933f-760c-3c81-1040-c514045df3da@linaro.org>
 <CAD=FV=W4PYK-t607yjRbfjDjjEZX0KdgHDRukw_vSH8E8EDH6w@mail.gmail.com>
 <CAA8EJppt9XONbgtKfmHmN+==QNqiVJeb8GKJFdZm=yyY-tgmHQ@mail.gmail.com>
 <CAD=FV=U5-sTDLYdkeJWLAOG-0wgxR49VxtwUyUO7z2PuibLGsg@mail.gmail.com>
 <CAA8EJppgfYgQjG8A4LsR-1wmBj3Ku3eO8cKfAYhxjWXL7e3eHg@mail.gmail.com>
 <CAD=FV=V=a1CnT8fqTJR40WoS3BaDQ3xZ=HnHVHqZh=MEmVUZBA@mail.gmail.com>
 <3e5fa57f-d636-879a-b98f-77323d07c156@linaro.org>
 <CAD=FV=Uibu-kZyix7K4_WVc-+C8xpzTqU4WFy7O=6sukMZrX5g@mail.gmail.com>
 <MW4PR02MB7186245772DAC3E04FA8D1C0E1E69@MW4PR02MB7186.namprd02.prod.outlook.com>
 <CAD=FV=Wk3U7_bVdiCPp8iQ4bcCA_Botemu4pwHeRtgBa3Xk6KQ@mail.gmail.com>
 <c4f086ce-c56f-f7c9-4092-7f2432330d50@quicinc.com>
 <CAD=FV=UmU_BVUaL_X75yOEvQPtGUBTR5-jiVWBHq7uSRt6HM4Q@mail.gmail.com>
 <225d2c0a-42ec-28ad-688c-e7e9e2035ee1@quicinc.com>
 <CAD=FV=W=WjSACHvRDFBnkLUp-LU2c4XMu3=FTzTx=zexNF5PAw@mail.gmail.com>
 <CAA8EJpqLZ9up4euGEbhf5QyBqm4tJuLcHi7D+0Si7ak9Jej52w@mail.gmail.com>
In-Reply-To: <CAA8EJpqLZ9up4euGEbhf5QyBqm4tJuLcHi7D+0Si7ak9Jej52w@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 7 Apr 2022 17:21:06 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XwOzsRf7RnvyBjr5TtedMhC0LJFKoK9tp-kw1eEyuJmQ@mail.gmail.com>
Message-ID: <CAD=FV=XwOzsRf7RnvyBjr5TtedMhC0LJFKoK9tp-kw1eEyuJmQ@mail.gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v6 1/8] drm/msm/dp: Add eDP support via
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
 "Sankeerth Billakanti \(QUIC\)" <quic_sbillaka@quicinc.com>,
 quic_vproddut <quic_vproddut@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>, Sean Paul <sean@poorly.run>,
 Sean Paul <seanpaul@chromium.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Thu, Apr 7, 2022 at 4:46 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> > The way I'm arguing it should work is that:
> >
> > 1. A whole bunch of the DP init code should move to the DP driver's
> > probe function. This includes parsing the DT, acquiring clocks,
> > getting a handle to our PHY, and IO mapping registers. As far as I
> > know, there's no reason to wait on all the components being probed in
> > order to do this stuff.
>
> Yes. And that's one of the reasons I tried to stay away from the DP
> driver. Each time I open the source code, my hands itch to start
> refactoring the code.
>
> >
> > 2. Once we have done the above things, it should be possible to do AUX
> > transfers, correct? ...and then we can populate the AUX bus from the
> > probe function too.
>
> No. In the DP case the AUX bus is inaccessible until the dongle is
> plugged (see all the HPD handling, phy_init()/phy_power_on() is hidden
> somewhere in that path)

I guess my thought was that in DP you could still create the AUX bus
at probe time. Then for DP you just return an instant "transfer
failed" from the AUX bus if HPD isn't asserted. For eDP (as discussed
elsewhere) when we try to do an AUX transfer then we delay until HPD
is there.

So we can still acquire resources (clocks, PHY, io maps, etc) at probe
time for DP and create the AUX bus, right? It will just return
"-ENODEV" if HPD isn't asserted and you're DP?

-Doug
