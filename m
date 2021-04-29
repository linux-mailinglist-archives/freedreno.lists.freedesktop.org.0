Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 534A636F196
	for <lists+freedreno@lfdr.de>; Thu, 29 Apr 2021 23:10:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4B8B6F4BF;
	Thu, 29 Apr 2021 21:10:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 059BC6F4BF
 for <freedreno@lists.freedesktop.org>; Thu, 29 Apr 2021 21:10:47 +0000 (UTC)
Received: by mail-qv1-xf34.google.com with SMTP id b14so7790887qvf.9
 for <freedreno@lists.freedesktop.org>; Thu, 29 Apr 2021 14:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xRU2yBtauvlwmgJ+pf3kg4KpnBtBpDuxDmDITGaelXM=;
 b=MxcB5px72C8+5vJCXXHc+ftOlbOvLaOIZCcSYXwDudiJ5T6uRWCF3IbA/q7i0v05H4
 b5+Xhyg/FMAavwP1EiO0TTX+zk0MdwRoYHVLZbsieoDElYIszlwp9kC2cL2arlNwdmht
 5eSBc+Cb7eohKUohNBZmGo0StBZWqhQKL+4x4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xRU2yBtauvlwmgJ+pf3kg4KpnBtBpDuxDmDITGaelXM=;
 b=PFDn/H1A7o1tkaUkVNmRFVtyPs+AaEA4LAgRDUTPIwkAbU50+y9vAiI+d9OCJXsZcU
 2QSv7U2kdu/Spp+2mDVuKHeK6g68MeSoRis/4vqE1om/Ke17fxLMS5hUtYWtIalUSzr/
 rS3w1SmMH1MKPyz1VF6e6mwpTaJryZ4X+ozjPEOMb+Ap666tppzTxyS1vSaAgnUgDWxS
 CJTS4ZTo55AeSbhruaeoBC7qE6OBtXim4t10V+aWwf1n3HAfdKrcHv4BYgowziPRtyGF
 dTgCtDS/le9i/WScnMmvZEU7ww53gt5cRIFTsEdtCRFG/nimKN2OzrTtkbvEjzCdg7wO
 V3gw==
X-Gm-Message-State: AOAM532DBZxd5GrvTQp7vI7LJ0uz0DERsRIvYFuo4IvO6N3BK407FBaT
 k0FTRlwI1zFV9yD7ha1Y0Yw9ycjyAKC6Pg==
X-Google-Smtp-Source: ABdhPJxdJWazgjML5EaIDiWQZ+G0cMV1epBrUGm5A+eyH1O9JT5FJgJ/O3se4lI/KW8+a7OR5/kavw==
X-Received: by 2002:a0c:a0c6:: with SMTP id c64mr1592407qva.57.1619730647036; 
 Thu, 29 Apr 2021 14:10:47 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com.
 [209.85.219.175])
 by smtp.gmail.com with ESMTPSA id n18sm815503qtv.87.2021.04.29.14.10.46
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 14:10:46 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id g38so80356598ybi.12
 for <freedreno@lists.freedesktop.org>; Thu, 29 Apr 2021 14:10:46 -0700 (PDT)
X-Received: by 2002:a05:6902:4e2:: with SMTP id
 w2mr2101815ybs.79.1619730210214; 
 Thu, 29 Apr 2021 14:03:30 -0700 (PDT)
MIME-Version: 1.0
References: <1619416756-3533-1-git-send-email-rajeevny@codeaurora.org>
 <1619416756-3533-2-git-send-email-rajeevny@codeaurora.org>
 <20210429180435.GA1385465@robh.at.kernel.org>
In-Reply-To: <20210429180435.GA1385465@robh.at.kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 29 Apr 2021 14:03:18 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V-kdySH5Pp-Fb-PRYk60Ha_UOTXJHcvMp+uV3P1oo7Uw@mail.gmail.com>
Message-ID: <CAD=FV=V-kdySH5Pp-Fb-PRYk60Ha_UOTXJHcvMp+uV3P1oo7Uw@mail.gmail.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [Freedreno] [v3 1/2] dt-bindings: backlight: add DisplayPort
 aux backlight
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
 <devicetree@vger.kernel.org>, Rajeev Nandan <rajeevny@codeaurora.org>,
 mkrishn@codeaurora.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <seanpaul@chromium.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Thu, Apr 29, 2021 at 11:04 AM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Apr 26, 2021 at 11:29:15AM +0530, Rajeev Nandan wrote:
> > Add bindings for DisplayPort aux backlight driver.
> >
> > Changes in v2:
> > - New
> >
> > Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
> > ---
> >  .../bindings/leds/backlight/dp-aux-backlight.yaml  | 49 ++++++++++++++++++++++
> >  1 file changed, 49 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/leds/backlight/dp-aux-backlight.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/leds/backlight/dp-aux-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/dp-aux-backlight.yaml
> > new file mode 100644
> > index 00000000..0fa8bf0
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/backlight/dp-aux-backlight.yaml
> > @@ -0,0 +1,49 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/leds/backlight/dp-aux-backlight.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: DisplayPort aux backlight driver bindings
> > +
> > +maintainers:
> > +  - Rajeev Nandan <rajeevny@codeaurora.org>
> > +
> > +description:
> > +  Backlight driver to control the brightness over DisplayPort aux channel.
> > +
> > +allOf:
> > +  - $ref: common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: dp-aux-backlight
> > +
> > +  ddc-i2c-bus:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      A phandle to the system I2C controller connected to the DDC bus used
> > +      for the DisplayPort AUX channel.
> > +
> > +  enable-gpios:
> > +    maxItems: 1
> > +    description: GPIO specifier for backlight enable pin.
> > +
> > +  max-brightness: true
> > +
> > +required:
> > +  - compatible
> > +  - ddc-i2c-bus
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    backlight {
> > +        compatible = "dp-aux-backlight";
> > +        ddc-i2c-bus = <&sn65dsi86_bridge>;
> > +        enable-gpios = <&tlmm 12 GPIO_ACTIVE_HIGH>;
>
> So the DDC bus is connected to a backlight and also a panel? This
> binding is not reflecting the h/w, but rather what you want for some
> driver.
>
> There's only one thing here and that's an eDP panel which supports
> backlight control via DP aux channel. You can figure all that out from
> the panel's compatible and/or reading the EDID.
>
> You might also be interested in this thread:
>
> https://lore.kernel.org/lkml/YIKsDtjcIHGNvW0u@orome.fritz.box/

I think Rajeev needs to rework everything anyway as per:

https://lore.kernel.org/r/87zgxl5qar.fsf@intel.com

...but you're right that it makes sense not to model the backlight as
a separate node in the device tree. The panel driver can handle
setting up the backlight.

-Doug
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
