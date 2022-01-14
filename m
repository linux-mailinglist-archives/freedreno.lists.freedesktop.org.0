Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2667D48F208
	for <lists+freedreno@lfdr.de>; Fri, 14 Jan 2022 22:30:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B16B410E236;
	Fri, 14 Jan 2022 21:30:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22B2C10E1EE
 for <freedreno@lists.freedesktop.org>; Fri, 14 Jan 2022 21:30:55 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id x193so14083595oix.0
 for <freedreno@lists.freedesktop.org>; Fri, 14 Jan 2022 13:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=qzWKW58EHMRYfJEMWdh6ZI9TALsJ363+iOZxWHKT5Dg=;
 b=m+tA33y4EKPBF5RGvo85oy9HWU3abLrzxeiKVsLD9tVTojyWnpMfPiGManmCHq+SJa
 jUCYY4SnECxcwj0qpyLRNSTBNh11tWxEcT5GvTDzcAsjz8ZAvy9YRLFECkOSyGWKolcO
 smb+cvls8PdAvykD60pN2/GL9MWc0BTWbKWjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=qzWKW58EHMRYfJEMWdh6ZI9TALsJ363+iOZxWHKT5Dg=;
 b=vc03bYBR827hZmDwgu6aWEXjgHFesXEW1oJjYXGp87p+M4JXeVNYdR+a5p8zKkEzmz
 zf7z/jP9+vupyzd85HYuD4omPsUaJ+/2KAfoVPcqLBrLX7A6QJaNE+4MRRT+WnZLAmK+
 3/AHqJ2n6fhnm+AufX3FwtI16YYVxWqkW8S7P7RYEknen4VPr5VYhpq1R4RI3Pne4xE0
 4NF1JaqHLIahKyXPc9Z59YxrMhLvAAbwx2/NtoyTkO9Zx9hQ+m2XsFjPWPL0olLXE7AD
 kqJKVBwQJvex+cd0ZanKb1qCqs75tPYiqJZBbQGG28g4qAG0xJDzDuFZpdXw7hXYv5df
 kZlQ==
X-Gm-Message-State: AOAM53109BgsEnD1apzgzdHEghx7sSXshcQ64c+eNrrapqcQf5tf3h9w
 JZ3fLhoUR7yJUPCF3+pGoGvdyJT+BxCeNGKzlssntg==
X-Google-Smtp-Source: ABdhPJzLzmiokzwTquHXvpd04mD3pjLPkUF9enSFzCrjicEdCXOV9BJ3Pf4eqRXnVC2O0O5rr5vYBYKUyd0cJHUJnuk=
X-Received: by 2002:aca:a953:: with SMTP id s80mr14644271oie.164.1642195854341; 
 Fri, 14 Jan 2022 13:30:54 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 14 Jan 2022 15:30:53 -0600
MIME-Version: 1.0
In-Reply-To: <69a10908622512c60790f97942731a8ab989b727.camel@mediatek.com>
References: <20220106214556.2461363-1-swboyd@chromium.org>
 <20220106214556.2461363-26-swboyd@chromium.org>
 <1a3b368eb891ca55c33265397cffab0b9f128737.camel@mediatek.com>
 <CAE-0n53Y3WRy4_QvUm9k9wjjWV7adMDQcK_+1ji4+W25SSeGwg@mail.gmail.com>
 <ff81bc1fe1f1c2060fcf03ba14f1bef584c47599.camel@mediatek.com>
 <CAE-0n53FAHDmCznJ35Xh2aTwXBVwukAM3ioKx8SU9VowSaQSqA@mail.gmail.com>
 <69a10908622512c60790f97942731a8ab989b727.camel@mediatek.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 14 Jan 2022 15:30:53 -0600
Message-ID: <CAE-0n53ao52UX3sJ67UQ3dgj0-DZ0xTeo-NrmW5YVAuXfAnxZw@mail.gmail.com>
To: Yong Wu <yong.wu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v5 25/32] iommu/mtk: Migrate to aggregate
 driver
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
Cc: youlin.pei@mediatek.com, Saravana Kannan <saravanak@google.com>,
 Will Deacon <will@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Joerg Roedel <joro@8bytes.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 Russell King <rmk+kernel@arm.linux.org.uk>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Yong Wu (2022-01-14 01:06:31)
> On Wed, 2022-01-12 at 20:25 -0800, Stephen Boyd wrote:
> > >
> > > [    2.654526] ------------[ cut here ]------------
> > > [    2.655558] refcount_t: addition on 0; use-after-free.
> > >
> > > After this patch, the aggregate_driver flow looks ok. But our
> > > driver
> > > still aborts like this:
> > >
> > > [    2.721316] Unable to handle kernel NULL pointer dereference at
> > > virtual address 0000000000000000
> > > ...
> > > [    2.731658] pc :
> > > mtk_smi_larb_config_port_gen2_general+0xa4/0x138
> > > [    2.732434] lr : mtk_smi_larb_resume+0x54/0x98
> > > ...
> > > [    2.742457] Call trace:
> > > [    2.742768]  mtk_smi_larb_config_port_gen2_general+0xa4/0x138
> > > [    2.743496]  pm_generic_runtime_resume+0x2c/0x48
> > > [    2.744090]  __genpd_runtime_resume+0x30/0xa8
> > > [    2.744648]  genpd_runtime_resume+0x94/0x2c8
> > > [    2.745191]  __rpm_callback+0x44/0x150
> > > [    2.745669]  rpm_callback+0x6c/0x78
> > > [    2.746114]  rpm_resume+0x314/0x558
> > > [    2.746559]  __pm_runtime_resume+0x3c/0x88
> > > [    2.747080]  pm_runtime_get_suppliers+0x7c/0x110
> > > [    2.747668]  __driver_probe_device+0x4c/0xe8
> > > [    2.748212]  driver_probe_device+0x44/0x130
> > > [    2.748745]  __device_attach_driver+0x98/0xd0
> > > [    2.749300]  bus_for_each_drv+0x68/0xd0
> > > [    2.749787]  __device_attach+0xec/0x148
> > > [    2.750277]  device_attach+0x14/0x20
> > > [    2.750733]  bus_rescan_devices_helper+0x50/0x90
> > > [    2.751319]  bus_for_each_dev+0x7c/0xd8
> > > [    2.751806]  bus_rescan_devices+0x20/0x30
> > > [    2.752315]  __component_add+0x7c/0xa0
> > > [    2.752795]  component_add+0x14/0x20
> > > [    2.753253]  mtk_smi_larb_probe+0xe0/0x120
> > >
> > > This is because the device runtime_resume is called before the bind
> > > operation(In our case this detailed function is mtk_smi_larb_bind).
> > > The issue doesn't happen without this patchset. I'm not sure the
> > > right
> > > sequence. If we should fix in mediatek driver, the patch could be:
> >
> > Oh, the runtime PM is moved around with these patches. The aggregate
> > device is runtime PM enabled before the probe is called,
>
> In our case, the component device may probe before the aggregate
> device. thus the component device runtime PM has already been enabled
> when aggregate device probe.

This is always the case. The component device always probes before the
aggregate device because the component device registers with the
component framework. But the component device can decide to enable
runtime PM during driver probe or during component bind.

>
> > and there are
> > supplier links made to each component, so each component is runtime
> > resumed before the aggregate probe function is called.
>
> Yes. This is the current flow.

Got it.

>
> > It means that all
> > the component drivers need to have their resources ready to power on
> > before their component_bind() callback is made.
>
> Sorry, I don't understand here well. In this case, The component
> drivers prepare the resource for power on in the component_bind since
> the resource comes from the aggregate driver. Thus, we expect the
> component_bind run before the runtime resume callback.

What resource comes from the aggregate device that the component device
manages in runtime PM?

>
> Another solution is moving the component's pm_runtime_enable into the
> component_bind(It's mtk_smi_larb_bind here), then the runtime callback
> is called after component_bind in which the resource for power on is
> ready.

This sounds more correct to me. I'm not an expert on runtime PM though
as I always have to read the code to remember how it works. if the
device isn't ready for runtime PM until the component bind function is
called then runtime PM shouldn't be enabled on the component device.
