Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97717793CF9
	for <lists+freedreno@lfdr.de>; Wed,  6 Sep 2023 14:48:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABE7E10E625;
	Wed,  6 Sep 2023 12:48:49 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6D3A10E628
 for <freedreno@lists.freedesktop.org>; Wed,  6 Sep 2023 12:48:47 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-d7e87b4a0f2so3025852276.0
 for <freedreno@lists.freedesktop.org>; Wed, 06 Sep 2023 05:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694004527; x=1694609327; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=92om2bQSNnR9D1DHhKVFZqGrlhplU+xlpPXmIDI9/fQ=;
 b=cNt7ygyq4ZuGnMyDaFviRwTFHvyRciYe4AIDWLbPc7NM8TlDTazedFB129QgfDVzZZ
 9MG6YvYq7U7P8adfy0ZCnwXfjLMwglKvEXxXrkUx4+oxX7aXg/GJlvtwnxRpmCAbTgic
 d5HHmYIyKdfjlC7+H0XseFKi06drKJp6bR/hpNs5OH8jMyXSI44jNLTx7OzCYHRtgTXy
 JNLqohlmjWyOAuyI+/5Guh77Y7AQUaQ+C4UIGoi651QBC7CvA1ynt4UTPv7/UFAeigKf
 6UC1Has2Utzdwws0uFt+MpuaQFA3F2dGsWZBq6TzpKKpB5Mj9uR6AGuT+AmJ+o0/GRmx
 gtHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694004527; x=1694609327;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=92om2bQSNnR9D1DHhKVFZqGrlhplU+xlpPXmIDI9/fQ=;
 b=CiZ9TkgsUq1kQdPWfyujY+BZKs0+Zr2QKafXLI9v0zDiZu+zZEVqJih8Wmtgg4Tsir
 VcoLZ//wSgk2Z8RTTgi7RclRGOu50ORZzzSOgQrlW+MB+70KJsE3m6E/KPKrqv3mXhUb
 GkmAyu3sa9CAY0MDF3tZtjA80o4fdHSp59WU73fKAaCCTI7ghUPzQaIMi1gGeUGU5ce0
 2P8XDi8nbgVDPmCb/W0SEYaqcYO2AvSFU23KWozZI6GtZCmByAnBbhrKkNrdZzkJCBnH
 uKl+AXg2ul8g5l/HPSCnT9eAYh3Wo1vaKlEY01ECHGKSZAAPEN2fysdlaOIPHlu2ou4C
 tENg==
X-Gm-Message-State: AOJu0YxYp7t6o+m9lM2HDjGYLhMA36qOVVPNyhUG0UrAvzv46VP5gadn
 zBqiDmOGh+H7/CohKvzSEF2vIhQ1EncvOBBKLgMNDQ==
X-Google-Smtp-Source: AGHT+IG22IPQGRrf8eEKph8YYMyYOGggoX0BSU0gnlm3GqlA+rCxg8GxZJknwqypa88MgH+7q+/GwfJRCMq11nNuXqM=
X-Received: by 2002:a25:81d2:0:b0:d74:5f61:15b1 with SMTP id
 n18-20020a2581d2000000b00d745f6115b1mr15250331ybm.26.1694004526735; Wed, 06
 Sep 2023 05:48:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230903214150.2877023-1-dmitry.baryshkov@linaro.org>
 <20230903214150.2877023-2-dmitry.baryshkov@linaro.org>
 <ZPbrtAlO2Y+bjDhf@kuha.fi.intel.com>
 <CAA8EJpqUg2-k7LLBL38RHU1sThkXB54ca68xEMd1yMnHQcQ++w@mail.gmail.com>
 <ZPh0Ps9UJ3HLzdeR@kuha.fi.intel.com>
In-Reply-To: <ZPh0Ps9UJ3HLzdeR@kuha.fi.intel.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 6 Sep 2023 15:48:35 +0300
Message-ID: <CAA8EJpratbBybgk8woD3maA=J_HuQis44Unq0n+c_UvaFs__AA@mail.gmail.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [RFC PATCH v1 01/12] Revert "drm/sysfs: Link DRM
 connectors to corresponding Type-C connectors"
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
Cc: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Janne Grunau <j@jannau.net>,
 Robert Foss <rfoss@kernel.org>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andy Gross <agross@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Won Chung <wonchung@google.com>, Daniel Vetter <daniel@ffwll.ch>,
 Simon Ser <contact@emersion.fr>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 6 Sept 2023 at 15:44, Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Tue, Sep 05, 2023 at 01:56:59PM +0300, Dmitry Baryshkov wrote:
> > Hi Heikki,
> >
> > On Tue, 5 Sept 2023 at 11:50, Heikki Krogerus
> > <heikki.krogerus@linux.intel.com> wrote:
> > >
> > > Hi Dmitry,
> > >
> > > On Mon, Sep 04, 2023 at 12:41:39AM +0300, Dmitry Baryshkov wrote:
> > > > The kdev->fwnode pointer is never set in drm_sysfs_connector_add(), so
> > > > dev_fwnode() checks never succeed, making the respective commit NOP.
> > >
> > > That's not true. The dev->fwnode is assigned when the device is
> > > created on ACPI platforms automatically. If the drm_connector fwnode
> > > member is assigned before the device is registered, then that fwnode
> > > is assigned also to the device - see drm_connector_acpi_find_companion().
> > >
> > > But please note that even if drm_connector does not have anything in
> > > its fwnode member, the device may still be assigned fwnode, just based
> > > on some other logic (maybe in drivers/acpi/acpi_video.c?).
> > >
> > > > And if drm_sysfs_connector_add() is modified to set kdev->fwnode, it
> > > > breaks drivers already using components (as it was pointed at [1]),
> > > > resulting in a deadlock. Lockdep trace is provided below.
> > > >
> > > > Granted these two issues, it seems impractical to fix this commit in any
> > > > sane way. Revert it instead.
> > >
> > > I think there is already user space stuff that relies on these links,
> > > so I'm not sure you can just remove them like that. If the component
> > > framework is not the correct tool here, then I think you need to
> > > suggest some other way of creating them.
> >
> > The issue (that was pointed out during review) is that having a
> > component code in the framework code can lead to lockups. With the
> > patch #2 in place (which is the only logical way to set kdev->fwnode
> > for non-ACPI systems) probing of drivers which use components and set
> > drm_connector::fwnode breaks immediately.
> >
> > Can we move the component part to the respective drivers? With the
> > patch 2 in place, connector->fwnode will be copied to the created
> > kdev's fwnode pointer.
> >
> > Another option might be to make this drm_sysfs component registration optional.
>
> You don't need to use the component framework at all if there is
> a better way of determining the connection between the DP and its
> Type-C connector (I'm assuming that that's what this series is about).
> You just need the symlinks, not the component.

The problem is that right now this component registration has become
mandatory. And if I set the kdev->fwnode manually (like in the patch
2), the kernel hangs inside the component code.
That's why I proposed to move the components to the place where they
are really necessary, e.g. i915 and amd drivers.

-- 
With best wishes
Dmitry
