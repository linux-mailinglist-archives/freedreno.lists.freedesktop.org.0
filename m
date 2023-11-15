Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B273B7EBEBA
	for <lists+freedreno@lfdr.de>; Wed, 15 Nov 2023 09:44:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8981810E25B;
	Wed, 15 Nov 2023 08:44:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19DAF10E25B
 for <freedreno@lists.freedesktop.org>; Wed, 15 Nov 2023 08:44:06 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-5a90d6ab962so75486757b3.2
 for <freedreno@lists.freedesktop.org>; Wed, 15 Nov 2023 00:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700037845; x=1700642645; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=O435LHbyv7oQ7r66GVQ2a6a9TDfwdSVJ9URtMEVc7Uk=;
 b=UqksTRhIbbSOd2hPcVVMdr+dLO/R6mfNbuyDVrmASiB7O47YQhW/WtO+BzmloZBOSK
 xHJbVxsYP4LIzT80tW0h040gbFQA+mMkfUSxurE61THJMO1Ie3coW5jmJVt4T0WWg4ST
 Xi7BLSXOhOyeDicrm3rtaf33mxh6X6DqGhJCXxpwhc/i/lJrYbxoSV18A5Dz1psdYdNK
 ib6MJAvUDki1mGqFSnz2813KkkBrFGuLJdCh4IKG1Z5YmP0cKPOPbHpOb0v0qoIyKP3a
 3cy2ctkJlXWVEJn4OiTKf5y9SOF71XhZ9PSoR5sJT4TSXKO3jbvSe9jypPyRi4ba7Ga+
 s9Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700037845; x=1700642645;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O435LHbyv7oQ7r66GVQ2a6a9TDfwdSVJ9URtMEVc7Uk=;
 b=oHdFp1YyR4gmkydbpqlEWsbCeBAG33mt8TiJ+Mw+QGt15SErKSHd8hV6RoqbbPc/ZG
 UWjuSXgI8FUgUo8y526BytZQrB5nk17OyQm49mZo+VAFLlB0dDq9d2TQTiDxUXci4qHY
 jqvNj/6vT1I4NBZ57X+2s12nQKH/A69iHGE3CdQz6t4fPC0OB9Qkor73Z6QZVts/aqES
 ZsJjO7B1KtCMwS90fnWf9vv5oyLNAl5lX7EzQktcsTuTaf5Zjq/mNgiyhvIVbTIsIz9L
 jDp7LcaL7Z5rp/E6ajQlcx392ZR3JemNNPxrXpSZMtrhOAO79g5w8Xy4SwxRC7RnRqEv
 qagg==
X-Gm-Message-State: AOJu0YwCmMJS0qPQNV8PSw+Errv3G40hBeeoztuQpOxOWaMwc4iJFcBE
 JCQ74SEJrac67zSrwZ+LoA8f4/IKZIo3KCUindmu2Q==
X-Google-Smtp-Source: AGHT+IGYyMbXo0cenT7MAhAK2LCaEB9+Xb+FoInpMblxB77kbQVUXJEQUSN6Df2UdZWuepVN2y/hrda9iVITRdFay/M=
X-Received: by 2002:a0d:cd86:0:b0:5a7:af0c:bf97 with SMTP id
 p128-20020a0dcd86000000b005a7af0cbf97mr12883973ywd.6.1700037845260; Wed, 15
 Nov 2023 00:44:05 -0800 (PST)
MIME-Version: 1.0
References: <cover.1669012140.git.viresh.kumar@linaro.org>
 <c03c4f2b9d4dcc3264d1902606c6c5c464b4b043.1669012140.git.viresh.kumar@linaro.org>
 <Y3snGQet8yc7HnJK@hovoldconsulting.com> <20221121073946.GE11945@thinkpad>
 <20230125042145.hrjpnskywwqn7b6v@vireshk-i7> <20230216064727.GA2420@thinkpad>
 <20231011054858.3vvnr76u5enu5lf6@vireshk-i7>
 <20231115063201.rc3pf3pga6zhoqb5@vireshk-i7>
 <20231115075542.GA20982@workstation>
In-Reply-To: <20231115075542.GA20982@workstation>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 15 Nov 2023 10:43:53 +0200
Message-ID: <CAA8EJpqhYxvgXsbQfdrYs=tdbbqE=uTwtB71kqFDBAfnTtNwAA@mail.gmail.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 2/2] OPP: Disallow "opp-hz" property without
 a corresponding clk
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
Cc: Nishanth Menon <nm@ti.com>, Vincent Guittot <vincent.guittot@linaro.org>,
 linux-pm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, andersson@kernel.org,
 "Rafael J. Wysocki" <rafael@kernel.org>, Johan Hovold <johan@kernel.org>,
 linux-kernel@vger.kernel.org, robdclark@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, Viresh Kumar <vireshk@kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 15 Nov 2023 at 09:55, Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> + Dmitry
>
> On Wed, Nov 15, 2023 at 12:02:01PM +0530, Viresh Kumar wrote:
> > On 11-10-23, 11:18, Viresh Kumar wrote:
> > > On 16-02-23, 12:17, Manivannan Sadhasivam wrote:
> > > > Sorry for the delay. I've submitted the dts changes [1] to handle the CPU clocks
> > > > for the rest of the Qcom SoCs.
> > > >
> > > > For the Qcom GPUs, I've CCed Rob Clark who is the maintainer.
> > > >
> > > > Rob, here is the background on the issue that is being discussed in this
> > > > thread:
> > > >
> > > > Viresh submitted a series [2] back in July to improve the OPP framework, but
> > > > that ended up breaking cpufreq on multiple Qcom SoCs. After investigation, it
> > > > was found that the series was expecting the clocks supplied to the OPP end
> > > > devices like CPUs/GPUs to be modeled in DT. But on Qcom platforms even though
> > > > the clocks for these nodes are supplied by a separate entity, like CPUFreq
> > > > (EPSS/OSM) for CPUs and GMU for GPUs, there was no clock property present in
> > > > the respective nodes. And these nodes are using OPP table to switch frequencies
> > > > dynamically.
> > > >
> > > > While the series was merged with a hack that still allows the OPP nodes without
> > > > clock property in DT, we came to an agreement that the clock hierarchy should
> > > > be modeled properly.
> > > >
> > > > So I submitted a series [3] that added clock provider support to cpufreq driver
> > > > and sourced the clock from cpufreq node to CPU nodes in DT.
> > > >
> > > > Likewise, it should be handled for the adreno GPUs whose clock is managed by
> > > > GMU on newer SoCs. Can you take a look at this?
> > >
> > > Any update on this ?
> >
> > Mani,
> >
> > Ping.
> >
>
> Dmitry, can you please look into this? Please read my above reply to Rob
> to get the background.

The issue is that we don't have an actual clock that corresponds to
the GPU frequency. Not even a read-only one.
Can we get away by manually setting config_clocks()?

Also could you please remind me, can we sleep inside the config_clks() callback?

-- 
With best wishes
Dmitry
