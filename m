Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C97494B9166
	for <lists+freedreno@lfdr.de>; Wed, 16 Feb 2022 20:40:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6926910E442;
	Wed, 16 Feb 2022 19:40:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AC9610E42E
 for <freedreno@lists.freedesktop.org>; Wed, 16 Feb 2022 19:40:00 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id p9so1624257ejd.6
 for <freedreno@lists.freedesktop.org>; Wed, 16 Feb 2022 11:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ciKM8JCmOjTFWsSXmArs9c1a9jxN6MlNWKsQdAvB9wQ=;
 b=S+Sj3p+F2dgiPbzCoR+LfRa53UtOXeFacCuEW1Mf2T3LAZQOHiwOq/wfozB3rRsSqp
 6m6F0YJx/DExHK3yJTw89l8Pd7sxcn9PMPbCsGt0Ox3DmNKQkRvhTzpZDwlLeXof1rUL
 5XWlIRBhJyKQu5JehUO7HjJMozFEjKnd9VuGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ciKM8JCmOjTFWsSXmArs9c1a9jxN6MlNWKsQdAvB9wQ=;
 b=ucGke7VM/UA7p6uukSy7DuOHUz/uFLtQxZiIgt4VuZaeoqX6q6if3OVpOCJ/Ai0b+T
 OAKruK9sz6TE58h22DfIp+bjEQlF4n45gTPQ2v6kbIHpvPt543yKfBhczhQ6Z6CTazqv
 gQ0ZHHHxzi18fwG8FQ+HKD7ayOh5H9fXqKzsFfeX7+u3TSCU+rjkfEJySDbPTOtw4yPc
 ZOpAFlDizGpriXdcSkj+wQgi72scylhnzl3VIeyNUgbc1L5CHTEVQJ2yUMuww/r+TIUu
 /Ssufz7mv1NhvHtqDfbGg3hw/ucWrgE0zCx/AAg1Tgmmt19G84Px+RooQRXo7Q0IiR3C
 el3A==
X-Gm-Message-State: AOAM533mxesVQytFn8e6uHXla3ZkIdJsIPyQLV5PRUxdeIt8dxfH4cfU
 q8haxhYB94Wnj6gJ7cbuOZxqAIptzer2Rax7
X-Google-Smtp-Source: ABdhPJyfgHhDYUFGoT4luUDIyjc3rcEuhZN9xJcDNhhIWxa9SaV5tuTBkgzrE92Mvcik7gmIn/g9yA==
X-Received: by 2002:a17:906:eb4a:b0:6cf:bb0e:69fb with SMTP id
 mc10-20020a170906eb4a00b006cfbb0e69fbmr3599097ejb.149.1645040398308; 
 Wed, 16 Feb 2022 11:39:58 -0800 (PST)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com.
 [209.85.221.44])
 by smtp.gmail.com with ESMTPSA id l7sm2309737edb.53.2022.02.16.11.39.55
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 11:39:56 -0800 (PST)
Received: by mail-wr1-f44.google.com with SMTP id f3so5009741wrh.7
 for <freedreno@lists.freedesktop.org>; Wed, 16 Feb 2022 11:39:55 -0800 (PST)
X-Received: by 2002:adf:e4c2:0:b0:1e3:3e5d:bd65 with SMTP id
 v2-20020adfe4c2000000b001e33e5dbd65mr3549580wrm.422.1645040395241; Wed, 16
 Feb 2022 11:39:55 -0800 (PST)
MIME-Version: 1.0
References: <1644494255-6632-1-git-send-email-quic_sbillaka@quicinc.com>
 <1644494255-6632-2-git-send-email-quic_sbillaka@quicinc.com>
 <CAD=FV=UZwuYRMNOxX6_W_z1PC-UNqvN=Mdtskn=djPPMRE122w@mail.gmail.com>
In-Reply-To: <CAD=FV=UZwuYRMNOxX6_W_z1PC-UNqvN=Mdtskn=djPPMRE122w@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 16 Feb 2022 11:39:43 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UvTXLEuKbkVHeiP=djzFscGJxL5iP+cafGnvjMXhmFKA@mail.gmail.com>
Message-ID: <CAD=FV=UvTXLEuKbkVHeiP=djzFscGJxL5iP+cafGnvjMXhmFKA@mail.gmail.com>
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v4 1/5] dt-bindings: display: simple: Add
 sharp LQ140M1JW46 panel
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
Cc: quic_kalyant@quicinc.com,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 quic_khsieh@quicinc.com, quic_vproddut@quicinc.com,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, quic_abhinavk@quicinc.com,
 Rob Herring <robh+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Andy Gross <agross@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>,
 Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>, quic_mkrishn@quicinc.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Wed, Feb 16, 2022 at 11:26 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, Feb 10, 2022 at 3:58 AM Sankeerth Billakanti
> <quic_sbillaka@quicinc.com> wrote:
> >
> > Add support for sharp LQ140M1JW46 display panel. It is a 14" eDP panel
> > with 1920x1080 display resolution.
> >
> > Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> > Acked-by: Rob Herring <robh@kernel.org>
> > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > ---
> >
> > Changes in v4:
> >   None
> >
> > Changes in v3:
> >   None
> >
> >  Documentation/devicetree/bindings/display/panel/panel-simple.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

...and pushed to drm-misc-next:

122365cfe9de dt-bindings: display: simple: Add sharp LQ140M1JW46 panel

So v5 shouldn't include this patch.

-Doug
