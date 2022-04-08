Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 610244F8A89
	for <lists+freedreno@lfdr.de>; Fri,  8 Apr 2022 02:20:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C331E10EE70;
	Fri,  8 Apr 2022 00:20:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 361DA10EE6D
 for <freedreno@lists.freedesktop.org>; Fri,  8 Apr 2022 00:20:52 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id q26so8265025edc.7
 for <freedreno@lists.freedesktop.org>; Thu, 07 Apr 2022 17:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EUO4ZkagqI35g4dyGZeSriotv9HvxG7vujGEgbCcZkU=;
 b=TEef53cSAydlsremUikPhSFLztWvs7WNKJRSiFhTfUee8wYEynR3p69EEhAbLFPoHE
 b29Gzz98Zuy76c+968HMXG1B9jQMg4QDHrYN4LM3amlXHkzn5hT+Pf77Sa8oH5mwkTxV
 oBPd9oZf+Ph6Z2N5mV3Z4xjh9ozw8I7/7moPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EUO4ZkagqI35g4dyGZeSriotv9HvxG7vujGEgbCcZkU=;
 b=y1j3Kxf3DtSHY4BRNJ1yBx/8qO4/0oyApsISTBe2quNb3UUy2pywetnlR2yCE7lTLz
 aHT0cCw1TI0YyaHwfQ/7VKtfmeobOzmmV2mgC+kmEvhL3kGtrYmCx85cTPdrjC4udSQ+
 i9AHnuNNgTeYm1TG6kgWE3/0OaNmdvd3YhJJaCo+u1ZwZz5ZfBOfjGBDySKiuXFxxvCP
 oCwV0YNSzQflqudSLpYYnMWqXm73dgTlCVkHkfRUQrRhrJrrVz48r8DkxOdne3cXjNuT
 WWpQfQDvk01aCc+0j+xlkl+I9dcsguqiZwEaHspC89MBnTMxBwiBzQYfzaeRKlM/XAw2
 hQ4g==
X-Gm-Message-State: AOAM531dEsBHlzybKziSN+5NXoJGutcn23SRbuJBJ9NqtR14xPKgzL5p
 gf0LhPq5+frCKJlOsWIC55FsIaOdau37swo/lyA=
X-Google-Smtp-Source: ABdhPJxRWVyxSBw+w0V3OnsaGczjTWccZ8wjEkptr/wRLAZ0cxJ5BW6kY9wk0oUqADbDnT+JdCTwBg==
X-Received: by 2002:a50:d659:0:b0:41c:bb88:b5db with SMTP id
 c25-20020a50d659000000b0041cbb88b5dbmr16722549edj.76.1649377250531; 
 Thu, 07 Apr 2022 17:20:50 -0700 (PDT)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com.
 [209.85.221.52]) by smtp.gmail.com with ESMTPSA id
 kw3-20020a170907770300b006b2511ea97dsm8088853ejc.42.2022.04.07.17.20.47
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Apr 2022 17:20:48 -0700 (PDT)
Received: by mail-wr1-f52.google.com with SMTP id h4so10476186wrc.13
 for <freedreno@lists.freedesktop.org>; Thu, 07 Apr 2022 17:20:47 -0700 (PDT)
X-Received: by 2002:a5d:674d:0:b0:206:163c:f70c with SMTP id
 l13-20020a5d674d000000b00206163cf70cmr12433627wrw.679.1649377247367; Thu, 07
 Apr 2022 17:20:47 -0700 (PDT)
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
 <CAA8EJprdV64jOexEF-XqbkwsNDWBNRRndOAas-QqMHaL=zp9rw@mail.gmail.com>
In-Reply-To: <CAA8EJprdV64jOexEF-XqbkwsNDWBNRRndOAas-QqMHaL=zp9rw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 7 Apr 2022 17:20:34 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XdRKWFQnJx9AKYmB2p26sXmhjqxLzz+LYyCt7rg+zF6w@mail.gmail.com>
Message-ID: <CAD=FV=XdRKWFQnJx9AKYmB2p26sXmhjqxLzz+LYyCt7rg+zF6w@mail.gmail.com>
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

On Thu, Apr 7, 2022 at 4:36 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> The ps8640 driver looks 'working by coincidence'. It calls
> dp_aux_populate, then immediately after the function returns it checks
> for the panel. If panel-edp is built as a module, the probe might fail
> easily.
> The anx7625 driver has the same kind of issue. The DP AUX bus is
> populated from the probe() and after some additional work the panel is
> being checked.
> This design is fragile and from my quick glance it can break (or be
> broken) too easy. It reminds me of our drm msm 'probe' loops
> preventing the device to boot completely if the dsi bridge/panel could
> not be probed in time.

I did spend some time thinking about this, at least for ps8640. I
believe that as long as the panel's probe isn't asynchronous.
Basically if the panel isn't ready then ps8640 should return and we'll
retry later. I do remember the probe loops that we used to have with
msm and I don't _think_ this would trigger it.

That being said, if we need to separate out the AUX bus into a
sub-device like we did in sn65dsi86 we certainly could.

-Doug
