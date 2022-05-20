Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4943E52F475
	for <lists+freedreno@lfdr.de>; Fri, 20 May 2022 22:34:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E18E810E70C;
	Fri, 20 May 2022 20:34:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2635210E70C
 for <freedreno@lists.freedesktop.org>; Fri, 20 May 2022 20:34:24 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id y13so16885184eje.2
 for <freedreno@lists.freedesktop.org>; Fri, 20 May 2022 13:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PUvHmCiaUykxHI8OvIFLVAwT2TJ4ujC+7HAZA4KLm9o=;
 b=E7VekmNmqzzPvnMy92tHR6mFRFrwHRPFMUmM3juUv3W7Caij6EZHqbPF7ji6Ppk5ak
 cLMD4QdxKzTo9OL54y8cUEo8NCYpKVhEHKEn+bt4ImwfTax8nV5J7UHC/HtAlpSHRNly
 +trvejQGwU/eryTVgCTqDvA6Vvw0FwAohxVZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PUvHmCiaUykxHI8OvIFLVAwT2TJ4ujC+7HAZA4KLm9o=;
 b=i39MQY3U/Hi0ymxoCk7z7OofLoWKI2cG053uK5+lZXpW51p+9norKwpWqhr5AMEGq3
 JZf27aPQAJatbLh/1uyT5P9N/UJma1tZ0upQYHaQ/TNHgUJZWNcmCUWwcReaaunQOTsA
 klu8WipwumiuqcBq/0Cz+s26/jzMck/TBVqzVJ4a9NrTXupAh5Hdj0c2SKhTGiWljz1M
 odiyZmrGXhIHqf+Kx6qIUq1oiI8ZpbElzOZiejH4wyPQp3oNatD0k7sAem0pcKHFu6OE
 sRD5aBKxrkJnDxRUXJHnYXaibCPUY4FJmH8+BGOgGDfN2pmDnOdKheF5OUS07Hn7VLCS
 sigQ==
X-Gm-Message-State: AOAM532dUeiOlUk44GIYeEDgZeojv54Fsjp+L6Jbwm/FS40HByxotCN/
 lPhABPzB5NRwp0nNXm8xORs7rQILifpZeDPQ4wk=
X-Google-Smtp-Source: ABdhPJzWxBMN32aWERsA54Cji7zG5Vft0d8RGOY4zNtjtFZcC21uWH+7TMPtcRVtWzNM0k8IkTNnrA==
X-Received: by 2002:a17:907:1b05:b0:6f0:18d8:7be0 with SMTP id
 mp5-20020a1709071b0500b006f018d87be0mr10098081ejc.561.1653078862491; 
 Fri, 20 May 2022 13:34:22 -0700 (PDT)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com.
 [209.85.128.48]) by smtp.gmail.com with ESMTPSA id
 gv29-20020a1709072bdd00b006f3ef214e13sm3474241ejc.121.2022.05.20.13.34.21
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 May 2022 13:34:22 -0700 (PDT)
Received: by mail-wm1-f48.google.com with SMTP id k126so5112678wme.2
 for <freedreno@lists.freedesktop.org>; Fri, 20 May 2022 13:34:21 -0700 (PDT)
X-Received: by 2002:a05:600c:4f13:b0:394:8978:7707 with SMTP id
 l19-20020a05600c4f1300b0039489787707mr10309201wmq.34.1653078530208; Fri, 20
 May 2022 13:28:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220510192944.2408515-1-dianders@chromium.org>
 <20220510122726.v3.3.Iba4b9bf6c7a1ee5ea2835ad7bd5eaf84d7688520@changeid>
 <CAA8EJpqBnR_-YaNj-hc6fjfeRX-aTBhuzCFKg77QEyANu37cnA@mail.gmail.com>
In-Reply-To: <CAA8EJpqBnR_-YaNj-hc6fjfeRX-aTBhuzCFKg77QEyANu37cnA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 20 May 2022 13:28:37 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VBkCZXL-6LnHMSCOwbUn5t8m0bhLRVh7R64w0Ce6FOvg@mail.gmail.com>
Message-ID: <CAD=FV=VBkCZXL-6LnHMSCOwbUn5t8m0bhLRVh7R64w0Ce6FOvg@mail.gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 3/4] drm/bridge: Add devm_drm_bridge_add()
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Philip Chen <philipchen@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Robert Foss <robert.foss@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Tue, May 10, 2022 at 5:22 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Tue, 10 May 2022 at 22:30, Douglas Anderson <dianders@chromium.org> wrote:
> >
> > This adds a devm managed version of drm_bridge_add(). Like other
> > "devm" function listed in drm_bridge.h, this function takes an
> > explicit "dev" to use for the lifetime management. A few notes:
> > * In general we have a "struct device" for bridges that makes a good
> >   candidate for where the lifetime matches exactly what we want.
> > * The "bridge->dev->dev" device appears to be the encoder
> >   device. That's not the right device to use for lifetime management.
> >
> > Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Thanks for the review! For now I'll hold off on landing this until
sometime has time to review the other patches in the series. While not
technically required, it seems weird to add the devm function without
any callers.

-Doug
