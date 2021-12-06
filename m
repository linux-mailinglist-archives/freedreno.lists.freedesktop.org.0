Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3782C46AC03
	for <lists+freedreno@lfdr.de>; Mon,  6 Dec 2021 23:30:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 490536E17C;
	Mon,  6 Dec 2021 22:30:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0F036E17C
 for <freedreno@lists.freedesktop.org>; Mon,  6 Dec 2021 22:30:13 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 47-20020a9d0332000000b005798ac20d72so15524799otv.9
 for <freedreno@lists.freedesktop.org>; Mon, 06 Dec 2021 14:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=CAVwfz79yxFN2Zk0PuDTv4duedCcEHp7DsaCS0xQ+pg=;
 b=cylFgKGs8JTtZhUXod/RUHTI1lDPe2mC/w0AiRtgMLPOimB3h4/G63R66IzxlwhQiL
 LT/RcvC0cnJdfhL2dzo8q5traVgXhuRBDBUxl1h+pmZV0+uaLtwSK16fPdhSDItJZUc+
 HVXH8Z5RzmiFySF0gB70R/sz7Rji8XbSA3R0+ddTcjP0qXF/vNk77DvxFdQe/oTs+5e3
 IU0ks9vQ291kAIEywt81qqdfPmpDjYgV+TgxpYAONHZVjnsUOfSeAnT0J6S2AYM2bkh5
 yxcYCHP293ScqYlC+0l+LXnckkZnSIKqpu/Sd67Eewm7qy3dTT6JGy7GasYe5OPBv9Aa
 Jb9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CAVwfz79yxFN2Zk0PuDTv4duedCcEHp7DsaCS0xQ+pg=;
 b=JRZdXd9qHSYuwXICMd5aM8GQ5hnRD8Ei/hnYDC6iJo/Gg4+/90R2KBnq3LMsQOpI13
 nxVgDrirHaCP6c4JSRxx+PEPI1q2vVg7SgbgMlsaZPGjxzg+7UGQNwlQkcZKvOYvxxf6
 744qGQCwnZgivCzhdw9wJ7Pqutkq/Atvyi+B7j8lJg94yk5+oeAcACd0uhxeiSx5bnwL
 Ta5RGGUDpTXPzYl/Jrx3ruh7rDCr+fav/XCO69zGEwz4xvHOGPZJ01/x6ZJUDD+0u9FT
 X01jKDJDxYi1R1bi3J0B//oXk0aatdtexfJXwYeDgb/7jW16J8rQLq1ILgGdg6ZWGLDV
 nbTw==
X-Gm-Message-State: AOAM533FskfY3PoXRC55unYQe2zz+ukJJae/w/BVQ0jlrmwDnE9RpYU/
 a17I7hKa3WyAusy902lyp5Aw4Q==
X-Google-Smtp-Source: ABdhPJwJoHiYQW5ssIUBVBMkso32IzKsSY64OY0b75kyPHvg1HEXXLecizsZ4zwpDefzzbDVmVjchw==
X-Received: by 2002:a9d:7a8c:: with SMTP id l12mr31262381otn.84.1638829812821; 
 Mon, 06 Dec 2021 14:30:12 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id y17sm2510204ote.48.2021.12.06.14.30.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 14:30:12 -0800 (PST)
Date: Mon, 6 Dec 2021 14:31:40 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Message-ID: <Ya6PTGN4zaZ8RD9K@ripper>
References: <YVd3YdfgFVc0Br5T@ripper>
 <CAD=FV=U=xVLuKOYHbGPTkLjGa8_U+F1ZtEvJt4LGaRuR5SsKFw@mail.gmail.com>
 <YVumL1lHLqtb/HKS@ripper>
 <CAD=FV=W9uKq00wXn4H1ax0u2D=R8Wn3J-Je43uxcPyDtk7AK7Q@mail.gmail.com>
 <YVyMwsvLl6XalJxB@ripper>
 <CAD=FV=WY+g38p7--QKZCaQnSqx7VvdwC36jH-VKnrEWoxK=XHQ@mail.gmail.com>
 <YV0KBWxVtKgOp2Cj@ripper>
 <CAD=FV=X5JFE3u9BtxxocaUrYNSpYXJN90UJ8HOvXZE6oYiVsDQ@mail.gmail.com>
 <CACeCKac4b_ej87cQD692TNwpsoFsmBwDcSeLy5fp+pvLX1si7g@mail.gmail.com>
 <YV7JNH9QvI4cBz5s@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YV7JNH9QvI4cBz5s@kuha.fi.intel.com>
Subject: Re: [Freedreno] [RFC] drm/msm/dp: Allow attaching a drm_panel
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Benson Leung <bleung@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Doug Anderson <dianders@chromium.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 LKML <linux-kernel@vger.kernel.org>, Kuogee Hsieh <khsieh@codeaurora.org>,
 Rob Clark <robdclark@gmail.com>, Prashant Malani <pmalani@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Vara Reddy <varar@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu 07 Oct 03:17 PDT 2021, Heikki Krogerus wrote:
> On Wed, Oct 06, 2021 at 01:26:35PM -0700, Prashant Malani wrote:
> > (CC+ Heikki)
[..]
> > On Wed, Oct 6, 2021 at 8:19 AM Doug Anderson <dianders@chromium.org> wrote:
[..]
>         void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode);
> 
> If your USB Type-C controller/port driver does not yet register the DP
> alt mode, the it's responsible of handling HPD separately by calling
> drm_connector_oob_hotplug_event() on its own.
> 

Finally found my way back to this topic and it doesn't look like I can
reuse the existing altmode code with the firmware interface provided by
Qualcomm, so  I just hacked something up that invokes
drm_connector_oob_hotplug_event().

But I'm not able to make sense of what the expected usage is. Reading
altmode/displayport.c, it seems that I should only invoke
drm_connector_oob_hotplug_event() as HPD state toggles.

I made a trial implementation of this, where my firmware interface
driver calls drm_connector_oob_hotplug_event() every time HPD state
changes and then in my oob_hotplug_event callback I flip the DP
controller between on and off.

Unfortunately when I then connect my HDMI dongle, I get HPD state HIGH,
call the oob_hotplug_event, the DP driver powers up and concludes that
there's nothing connected to the dongle and goes to idle. I then connect
the HDMI cable to the dongle, the firmware sends me another message with
HPD irq and state HIGH, which I ignore because it's not a change in
state.

In the end I hacked up drm_connector_oob_hotplug_event() to allow me to
pass the HPD state and this solves my problem. I can now distinguish
between connect, disconnect and attention.

Can you please help shed some light on what I might be missing?

Thanks,
Bjorn
