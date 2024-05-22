Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEF98CC79B
	for <lists+freedreno@lfdr.de>; Wed, 22 May 2024 22:05:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2914010F16C;
	Wed, 22 May 2024 20:05:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TygbwEYO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2037410F16C
 for <freedreno@lists.freedesktop.org>; Wed, 22 May 2024 20:05:47 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-df4f05f4cc8so663140276.0
 for <freedreno@lists.freedesktop.org>; Wed, 22 May 2024 13:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716408346; x=1717013146; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hk3jDe7FCuIhCM+FHY50wYnpF7qQKPUq+TZmlYJWz+A=;
 b=TygbwEYOEo26ze94h0VRjrQNIQpF5ynF3Twe2HvMQEenOdqfisd9srbVlQvjELT9/i
 uITVhpPsuWmNqpqmJBkVgQwhP1YKUdhvWTk8PXRlvBEcjHi8vZ4aYxRUTOBDCAdycVty
 inosiGbQFjEaUXiars7H/fQJ91H9ysFIMzT1dj1HqsxwRRMkBE1KLS0slNi9mgtxNPPY
 wLCagx6EBD0H2J64J3SYJUSGp5a9d0mNIchRIRHyUt3LiE0YZZW9KfI/wds1A5oIC8bu
 MB+zpbRBgv1r8MjBQWzO/6QsEQiOc/E6r8ie5T5zdz2hsTTOlQJu50taG2JFXCOkkuJB
 M09w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716408346; x=1717013146;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hk3jDe7FCuIhCM+FHY50wYnpF7qQKPUq+TZmlYJWz+A=;
 b=RLrfHT351ph5nJlCG2vl+RI3tE2WmkAZ6LIChPSp76RkuW7hfBoFbXI5t2wsqnLwgg
 KyGzI25SD/NkaEIbjVP8qe1r4Q4dU7HJdp5EM36ljZif9kMdNk9Wkd+xG5I3xFVMfDMw
 pgAqYkj5h0hbbUXFhrrmXFArM0/rLD+LOcTJ84zpOldE0SLUdVvfgaolMXHiE1u/5YvC
 7mCRCkYOsWvgUAvruR5ONd6p7xXC12j3iBqMoVJzATZtJ7M6xyqT+lVdNmbDZV/ilXFH
 enyBksyA9UwwHy6Rea45KWQ8QI+Ncvw7PQe/le9s4s9AoupgkcsabM9e2H07pPE/LFGo
 uErQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPWFUNOUaqbCBwQSIQroJPc08PcJ5JK26fUignThWXsUrKVWp43tDNQ3IPL4OBt44VPmXzUkBE8TPmCU1wdoLVgoR/NY/tGTCL7pZQ5zmS
X-Gm-Message-State: AOJu0Ywm3J0F2/oUz8SU00904PxEAVGt1da1MfauMgVLGBVd0CzrPpKB
 Pno7O2XpuOuHOXGq+yI5dxU5Xypm6UnFlWk6lECmzyHRn7smv/ZfPRaQ10tIMtnLlnQ+AOmt1av
 kQ+4ZdhfGIxqsANlQnRgqqsrgd3iencfKrcGoNA==
X-Google-Smtp-Source: AGHT+IGriJg+wB3ztmixivwvv97cgSoAQj2CfDfqQDNVbMaFx0uytg1e+rLooAVwAc90Yaum/PZOSVahorkiKNzK6YY=
X-Received: by 2002:a25:6b44:0:b0:de5:9ec3:6475 with SMTP id
 3f1490d57ef6-df4e0c1347cmr3111690276.31.1716408345943; Wed, 22 May 2024
 13:05:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240520-dpu-handle-te-signal-v1-0-f273b42a089c@linaro.org>
 <20240520-dpu-handle-te-signal-v1-1-f273b42a089c@linaro.org>
 <224fa477-07ba-e7b2-2f7d-8f7d21f4a0c7@quicinc.com>
In-Reply-To: <224fa477-07ba-e7b2-2f7d-8f7d21f4a0c7@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 22 May 2024 23:05:34 +0300
Message-ID: <CAA8EJpp8kRPKboHNHwD+R5f1AcndjaQdGG=Q4ygmRE9VMNievQ@mail.gmail.com>
Subject: Re: [PATCH 1/7] dt-bindings: display/msm/dsi: allow specifying TE
 source
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 22 May 2024 at 21:38, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 5/20/2024 5:12 AM, Dmitry Baryshkov wrote:
> > Command mode panels provide TE signal back to the DSI host to signal
> > that the frame display has completed and update of the image will not
> > cause tearing. Usually it is connected to the first GPIO with the
> > mdp_vsync function, which is the default. In such case the property can
> > be skipped.
> >
>
> This is a good addition overall. Some comments below.
>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   .../bindings/display/msm/dsi-controller-main.yaml        | 16 ++++++++++++++++
> >   1 file changed, 16 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> > index 1fa28e976559..c1771c69b247 100644
> > --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> > +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> > @@ -162,6 +162,21 @@ properties:
> >                   items:
> >                     enum: [ 0, 1, 2, 3 ]
> >
> > +              qcom,te-source:
> > +                $ref: /schemas/types.yaml#/definitions/string
> > +                description:
> > +                  Specifies the source of vsync signal from the panel used for
> > +                  tearing elimination. The default is mdp_gpio0.
>
> panel --> command mode panel?
>
> > +                enum:
> > +                  - mdp_gpio0
> > +                  - mdp_gpio1
> > +                  - mdp_gpio2
>
> are gpio0, gpio1 and gpio2 referring to the vsync_p, vsync_s and vsync_e
> sources?

No idea, unfortunately. They are gpioN or just mdp_vsync all over the
place. For the reference, in case of the SDM845 and Pixel3 the signal
is routed through SoC GPIO12.

> In that case wouldnt it be better to name it like that?
>
> > +                  - timer0
> > +                  - timer1
> > +                  - timer2
> > +                  - timer3
> > +                  - timer4
> > +
>
> These are indicating watchdog timer sources right?

Yes.

>
> >       required:
> >         - port@0
> >         - port@1
> > @@ -452,6 +467,7 @@ examples:
> >                             dsi0_out: endpoint {
> >                                      remote-endpoint = <&sn65dsi86_in>;
> >                                      data-lanes = <0 1 2 3>;
> > +                                   qcom,te-source = "mdp_gpio2";
>
> I have a basic doubt on this. Should te-source should be in the input
> port or the output one for the controller? Because TE is an input to the
> DSI. And if the source is watchdog timer then it aligns even more as a
> property of the input endpoint.

I don't really want to split this. Both data-lanes and te-source are
properties of the link between the DSI and panel. You can not really
say which side has which property.

> >                             };
> >                     };
> >              };
> >

-- 
With best wishes
Dmitry
