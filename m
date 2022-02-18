Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 631FB4BBB1D
	for <lists+freedreno@lfdr.de>; Fri, 18 Feb 2022 15:56:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E45E710EB63;
	Fri, 18 Feb 2022 14:56:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D81510E9D8
 for <freedreno@lists.freedesktop.org>; Fri, 18 Feb 2022 14:56:18 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id lw4so15609533ejb.12
 for <freedreno@lists.freedesktop.org>; Fri, 18 Feb 2022 06:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HEDVsJdoBlriKRiWsMiaPibDlLRBSHkQp8aBEXdrRPg=;
 b=fqRe4zP7YJl0es1coqEkQ+IA42hkW52O3II+Mzuv6ExVlmG3hQ9BH55+U9/QlFyisp
 0usnUkaPANy2IpTeSlyrZXG5nwU5PJx+kftwW3x7K85HTPrWGf5JoMKVsOXl8czZudNt
 kgmk68cPq+KhxefMKldnyo24+ONhbjWcEPftQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HEDVsJdoBlriKRiWsMiaPibDlLRBSHkQp8aBEXdrRPg=;
 b=ZtYvIbeCFLOY9mAVtsDVHlCKptzDlaqKdZollWM4/zLotfKSb0YBfampcnU11ml+KN
 kjUe7S9iE1js5AAY4uosB9V6m5VSOIjX/VnVQHpM9AazBpAvhZknIQ8WzL1pF1MKLFHN
 G+pTHdkXL/q4dke9e4GhMSdMex9IwXKL6r6p5duHCy20/CGf39b6yaPJjVRGKjl2BivH
 HKtZR3EVdx85dTVErZI+H0JAZkQ3pxEwBv5uJF3wHWxtw6jlA672Ymndwzy2z3rQd/Jv
 oW+Kbu8O+gXoigROMd97i6Sr8fxFaeJXPfFc9QQIkk+E/jFzOQaqZi1161qmqQ32op4e
 GDWQ==
X-Gm-Message-State: AOAM533IISJQc6TCK8iII+9a7DjqCjtkvJnFQeyC5I7125mHuaF5IcO+
 pSP+FpwUmvYx6WqUj8ngbWFflR2QFRXXSWU+Zbg=
X-Google-Smtp-Source: ABdhPJwlGmx6xEvxEn7cOrne4op+Fip5ND9/K4pIaG68ZSyp2yKC5W7oam2oFljqVsujVc2Zn5lEEA==
X-Received: by 2002:a17:906:6693:b0:6cf:3cb:89c9 with SMTP id
 z19-20020a170906669300b006cf03cb89c9mr6931041ejo.23.1645196176468; 
 Fri, 18 Feb 2022 06:56:16 -0800 (PST)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com.
 [209.85.221.51])
 by smtp.gmail.com with ESMTPSA id ej19sm2631641edb.108.2022.02.18.06.56.15
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 06:56:15 -0800 (PST)
Received: by mail-wr1-f51.google.com with SMTP id x5so10180299wrg.13
 for <freedreno@lists.freedesktop.org>; Fri, 18 Feb 2022 06:56:15 -0800 (PST)
X-Received: by 2002:a5d:4c48:0:b0:1e4:aeab:c77e with SMTP id
 n8-20020a5d4c48000000b001e4aeabc77emr6335194wrt.342.1645196174604; Fri, 18
 Feb 2022 06:56:14 -0800 (PST)
MIME-Version: 1.0
References: <1644494255-6632-1-git-send-email-quic_sbillaka@quicinc.com>
 <1644494255-6632-3-git-send-email-quic_sbillaka@quicinc.com>
 <YgWoAwdH/AqJUshh@builder.lan>
In-Reply-To: <YgWoAwdH/AqJUshh@builder.lan>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 18 Feb 2022 06:56:01 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XHsgg-cPVRr8jEUTGm3rf_BO5P+jQawDPq9Hju-O4uwQ@mail.gmail.com>
Message-ID: <CAD=FV=XHsgg-cPVRr8jEUTGm3rf_BO5P+jQawDPq9Hju-O4uwQ@mail.gmail.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v4 2/5] arm64: dts: qcom: sc7280: Add
 support for eDP panel on CRD
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
 <devicetree@vger.kernel.org>, Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 quic_vproddut@quicinc.com, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, quic_abhinavk@quicinc.com,
 Rob Herring <robh+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Andy Gross <agross@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>,
 quic_khsieh@quicinc.com, freedreno <freedreno@lists.freedesktop.org>,
 quic_mkrishn@quicinc.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Thu, Feb 10, 2022 at 4:04 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> > +&mdss_edp {
> > +     status = "okay";
> > +
> > +     vdda-1p2-supply = <&vreg_l6b_1p2>;
> > +     vdda-0p9-supply = <&vreg_l10c_0p8>;
> > +     /delete-property/ pinctrl-names;
> > +     /delete-property/ pinctrl-0;
>
> If the first device to enable &mdss_edp overwrites pinctrl-{names,0} in
> &mdss_dp and removes the properties in &mdss_edp, I think that's a sign
> that they should not be in the .dtsi in the first place.

Actually, I just looked more carefully here. I think the
"/delete-property" for edp_hpd here is just wrong. I'm pretty sure
that the HPD signal is hooked up on CRD and we actually need it. If
somehow deleting the property helps you then it's probably just
hacking around a bug and relying on the panel to be always powered on,
or something.

I think this gets into some of the stuff in your final patch in this
series. I found that, on my hardware, the panel doesn't come up at all
with that final patch. When I go back to how things were working in an
earlier version of your series, though, I can get things working a
little better (though still not perfect).

-Doug
