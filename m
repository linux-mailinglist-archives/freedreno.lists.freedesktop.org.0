Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A59794A7A61
	for <lists+freedreno@lfdr.de>; Wed,  2 Feb 2022 22:26:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 390E810E11C;
	Wed,  2 Feb 2022 21:26:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2C2610E11C
 for <freedreno@lists.freedesktop.org>; Wed,  2 Feb 2022 21:26:37 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id 9so771001iou.2
 for <freedreno@lists.freedesktop.org>; Wed, 02 Feb 2022 13:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o2/UoLjZiFXhay6ZdHILc8GiD9j1bhUbIT2EuWPLH8I=;
 b=FfAaTdVcfqAbX85RPfFV6HhR5h9+bXVbMraOahfnDr8UOhhCYSX4SEvQ55Wxuabmm7
 FhOfpBElQNYy6enchn8R3Q/efh9z0sddllHKf8duiau/uvjtonae4vMRqaM+Fvd54PTg
 u9vyqApXHmUX4M50H9N7bNPdmRJEjGXy5EfWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o2/UoLjZiFXhay6ZdHILc8GiD9j1bhUbIT2EuWPLH8I=;
 b=nsGcRpWrVbBmReP72DJx2PkxPY5Bmpa1Xu6Mbr4a4NgWVUseKAUAtWvK39XIMYk5W6
 fQEuHcbB0lN4x6WqC0rlXrcXETPdBPalUP5VBsz6tRxWEODx8fRfKrMqYOLPpsa3rml4
 i4tozQOV8AJk4htAk9rm/EH80nAMANBK1ODVt0OBtdSrQeCA2U4BRysmz9djTRQd+RAB
 4wO7/h20vL5JzGLzjLSiwW2TQiYJMQmQb2aLJrTa03oJaw4D1NJXm3I9KBU+642fC91K
 U+vUvwYYYTgj5r88WLOr6Mf+RZsYsuVcQoKGMKDht2m78hYXen8VKYNMUIKVivyWrjxj
 FhlQ==
X-Gm-Message-State: AOAM533lXRWuR/UUZkq+xr0gaZbitmzt3rm/dikkO9Bc8rlV7/pS19FT
 YHJ1fqUlQgIC42t7PficGIIyiLs49gnuXA==
X-Google-Smtp-Source: ABdhPJxcQhPE6qVdTVQR4cQ3GnyHSybB8dXztWm7ikMQUwYm60CPEuH9hISzJHDHzhE4/X7gw5z+8Q==
X-Received: by 2002:a05:6638:1409:: with SMTP id
 k9mr13440705jad.54.1643837197109; 
 Wed, 02 Feb 2022 13:26:37 -0800 (PST)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com.
 [209.85.166.172])
 by smtp.gmail.com with ESMTPSA id i15sm22325567iog.14.2022.02.02.13.26.36
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Feb 2022 13:26:37 -0800 (PST)
Received: by mail-il1-f172.google.com with SMTP id z18so497380ilp.3
 for <freedreno@lists.freedesktop.org>; Wed, 02 Feb 2022 13:26:36 -0800 (PST)
X-Received: by 2002:a92:cd84:: with SMTP id r4mr18778065ilb.180.1643837196261; 
 Wed, 02 Feb 2022 13:26:36 -0800 (PST)
MIME-Version: 1.0
References: <1643048114-2996-1-git-send-email-quic_sbillaka@quicinc.com>
 <1643048114-2996-2-git-send-email-quic_sbillaka@quicinc.com>
 <CAD=FV=WjnDCh6dLV8pxgYepMDtf5oMSTb9v+Z8dwyMARL7TYaQ@mail.gmail.com>
In-Reply-To: <CAD=FV=WjnDCh6dLV8pxgYepMDtf5oMSTb9v+Z8dwyMARL7TYaQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 2 Feb 2022 13:26:24 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X_y3duGCN09sKOR0uZLft5x7OcLcBbbtT9EHi-4EGV6g@mail.gmail.com>
Message-ID: <CAD=FV=X_y3duGCN09sKOR0uZLft5x7OcLcBbbtT9EHi-4EGV6g@mail.gmail.com>
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v1 1/2] ARM64: dts: qcom: enable eDP panel
 support for sc7280
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
 <devicetree@vger.kernel.org>, quic_abhinavk@quicinc.com,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, quic_khsieh@quicinc.com,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Andy Gross <agross@kernel.org>,
 Sean Paul <seanpaul@chromium.org>, quic_mkrishn@quicinc.com,
 Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Mon, Jan 24, 2022 at 11:04 AM Doug Anderson <dianders@chromium.org> wrote:
>
> > +&mdss_edp {
> > +       status = "okay";
> > +
> > +       vdda-1p2-supply = <&vreg_l6b_1p2>;
> > +       vdda-0p9-supply = <&vreg_l10c_0p8>;
> > +
> > +       ports {
> > +               port@1 {
> > +                       reg = <1>;
> > +                       edp_out: endpoint {
> > +                               remote-endpoint = <&edp_panel_in>;
> > +                       };
> > +               };
> > +       };
>
> I think part of the above should be in sc7280.dtsi. Basically in
> sc7820.dtsi I think you should have:
>
> ports {
>   #address-cells = <1>;
>   #size-cells = <0>;
>   port@0 {
>     reg = <0>;
>     edp_in: endpoint {
>       remote-endpoint = <&dpu_intf5_out>;
>     };
>   };
>   port@1 {
>     reg = <1>;
>     edp_out: endpoint {
>     };
>   };
> };
>
> ...and then the crd dts file just needs:
>
> &edp_out {
>   remote-endpoint = <&edp_panel_in>;
> };
>
> Right?

I've attempted to do the sc7280 part of this in:

https://lore.kernel.org/r/20220202132301.v3.7.Ic84bb69c45be2fccf50e3bd17b845fe20eec624c@changeid

Assuming folks think that's good then you should probably base your
next version atop that.

-Doug
