Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EC94F9720
	for <lists+freedreno@lfdr.de>; Fri,  8 Apr 2022 15:43:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDEB910F1CE;
	Fri,  8 Apr 2022 13:43:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C545510E1BA
 for <freedreno@lists.freedesktop.org>; Fri,  8 Apr 2022 13:43:47 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id b15so10143615edn.4
 for <freedreno@lists.freedesktop.org>; Fri, 08 Apr 2022 06:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1ZpanQL7fJ5Imrl94t4mOv+0fifiSCixQTFhocGBbW4=;
 b=ocU4WzdvqVtDrF+QNMkeIFKSbQDrw614kxrKDCXUNEPj0TcZTn2VF33O7pzWeuQcUi
 /kpIefrRb+tIPM7KdnbR0CjVrj0C7uFD+iwBJMThlUaqxYgu/HgyrOL3xZXxjwikkwPM
 /w5y4+LqxJFClA/AFhhdE9da2MRmrUgMM0sYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1ZpanQL7fJ5Imrl94t4mOv+0fifiSCixQTFhocGBbW4=;
 b=nTQ5tjDJ+Pf05Qv6ZbAmYT919cQZLeeH2p6ITPonzMPNRdsHxk5sOz9FT3bi5C3II6
 p16vcKoKteZCc0JHcqfDUJEjxULXJJuZotbczDymog9NN9VFeA1MuGClNKVP3E4Q9fi0
 zyvOmnOye2uCmS48x9srKQWAw0uQVrzYJcjmzKHAgGrDiTxc7CZOe9SFLI20Jn6DeN9a
 Mc5VbdmSF3zC+huN6YmzOqAYmPTtNksn9x+hoJoMeoqiq45Tr13WpmX4UrbpSLdBdRWN
 mvSTWQ3uypOblya+uHxr8hNxluBm40HjWSOwIiR43KQcrhoCJJRFVO8Fw8fbNC+qCxcJ
 rApg==
X-Gm-Message-State: AOAM533mODyrTSpeytJS4x3uTBfXQ/P/t5LP5L14rbUn55wl3kanFduL
 6ZXMHeNAuRJBkPFkxLnmCr0YmsD4mXJwhgykh10=
X-Google-Smtp-Source: ABdhPJzhn/RBYwanm2bahT8OJbt0XtY4sl3tsZpB6irH9QzobCYKFY1rkB7kHXcoUtqhZco1cPEFqQ==
X-Received: by 2002:a05:6402:1804:b0:41d:5883:2f70 with SMTP id
 g4-20020a056402180400b0041d58832f70mr1065648edy.150.1649425426057; 
 Fri, 08 Apr 2022 06:43:46 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com.
 [209.85.221.46]) by smtp.gmail.com with ESMTPSA id
 n24-20020a170906689800b006e835893777sm1737079ejr.52.2022.04.08.06.43.42
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Apr 2022 06:43:44 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id w4so12861129wrg.12
 for <freedreno@lists.freedesktop.org>; Fri, 08 Apr 2022 06:43:42 -0700 (PDT)
X-Received: by 2002:adf:e591:0:b0:206:1202:214 with SMTP id
 l17-20020adfe591000000b0020612020214mr14896572wrm.342.1649425421934; Fri, 08
 Apr 2022 06:43:41 -0700 (PDT)
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
 <CAD=FV=XwOzsRf7RnvyBjr5TtedMhC0LJFKoK9tp-kw1eEyuJmQ@mail.gmail.com>
 <CAA8EJprb5UF24WRNvGaY_hSqW--NPd=9=8AaPYWSMbUumNn+dQ@mail.gmail.com>
In-Reply-To: <CAA8EJprb5UF24WRNvGaY_hSqW--NPd=9=8AaPYWSMbUumNn+dQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 8 Apr 2022 06:43:28 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UG7k4A+hMXxwju-0mLddD1oJdGngXMkMA-dO3AxOx0rQ@mail.gmail.com>
Message-ID: <CAD=FV=UG7k4A+hMXxwju-0mLddD1oJdGngXMkMA-dO3AxOx0rQ@mail.gmail.com>
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

On Fri, Apr 8, 2022 at 5:20 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> > I guess my thought was that in DP you could still create the AUX bus
> > at probe time. Then for DP you just return an instant "transfer
> > failed" from the AUX bus if HPD isn't asserted. For eDP (as discussed
> > elsewhere) when we try to do an AUX transfer then we delay until HPD
> > is there.
>
> I think panel-edp would already handle the delay, so we do not need to
> have this logic in the DP driver.

There's a whole discussion about this between Stephen and me in patch
#5 ("drm/msm/dp: wait for hpd high before any sink interaction").
Basically:

* If panel HPD is hooked up to the dedicated HPD pin on the eDP
controller then the panel driver doesn't have a way to read it.

* We can't leverage the existing "HPD" query functions in DRM because
those indicate whether a panel is _physically_ connected. For eDP, it
always is.

For now the rule is that the AUX transfer function is in charge of
waiting for HPD for eDP if the dedicated HPD pin is used. If we want
to re-invent this we could, but that system works, isn't _too_ ugly,
and we're already making big enough changes in this series.


> > So we can still acquire resources (clocks, PHY, io maps, etc) at probe
> > time for DP and create the AUX bus, right? It will just return
> > "-ENODEV" if HPD isn't asserted and you're DP?
>
> Yes, please. I still suppose that we'd need a separate case to
> power_on eDP's PHY during the probe time. Maybe I'm mistaken here.

I think the ideal way is to do it like Kieran's proposal for sn65dsi86:

https://lore.kernel.org/r/20220317131250.1481275-4-kieran.bingham+renesas@ideasonboard.com/

* When enabling HPD (physical hot plug detect) in the hpd_enable()
callback you do a pm_runtime_get(). You do the
pm_runtime_put_autosuspend() when disabling. This is only used for DP
since we only provide DRM_BRIDGE_OP_HPD for DP, not for eDP.

* We do a pm_runtime_get() / pm_runtime_put_autosuspend() in the AUX
transfer routine. While holding the pm_runtime reference we check HPD.
For DP we return immediately if HPD isn't asserted. For eDP, we delay.

* We do the pm_runtime_get() in pre_enable and the pm_runtime_put() in
post_disable. For DP this will add a 2nd refcount (since we probably
were holding the reference for HPD). For eDP this will cause us to
power on.

* If there's any other time we need to read HW registers, and we
aren't guaranteed to already have a pm_runtime reference (like during
probe), we can do a temporary pm_runtime_get() /
pm_runtime_put_autosuspend().
