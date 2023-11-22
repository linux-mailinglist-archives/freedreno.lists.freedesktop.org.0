Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4027F4F99
	for <lists+freedreno@lfdr.de>; Wed, 22 Nov 2023 19:33:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A383C10E0DB;
	Wed, 22 Nov 2023 18:32:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [IPv6:2607:f8b0:4864:20::112a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B5B510E0DB
 for <freedreno@lists.freedesktop.org>; Wed, 22 Nov 2023 18:32:55 +0000 (UTC)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-5cd0af4a7d3so721207b3.0
 for <freedreno@lists.freedesktop.org>; Wed, 22 Nov 2023 10:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700677974; x=1701282774; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9evLgerhPexVHQkBogiwmvf7m2BOF4vHI4aXwGPPVJ4=;
 b=cZXdJZ3MSofFFzb2xXtUvETvnzpMqH7GEhLZb3SE0duMOsxxBYox6GU4SFjQaKrY7j
 jbT5NPIe/+XXZwFYlmYWvbHsnEDAGuL3uBLc0o/vxMyIFclHHKiiBRCw3dMm5PxdLJmZ
 1xV2XlvhSwozVQexifxBF2liA+IyNh06hYmWNLYFGr5lQGCLzoE4JJoO9CLO6YFlJiMA
 2TzEm0+lNcev+SVSi+0zMdA5qIWx0iHLzrvOj87hGfzrBT2jKEuholVXUQthmY+WgTCO
 9QOqca44RnOnCrbddrDhbD09x3EiyAXqiBzlqiN7FvmJncWdzbKHB+Gk7Ep1iX7hbNM0
 v7Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700677974; x=1701282774;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9evLgerhPexVHQkBogiwmvf7m2BOF4vHI4aXwGPPVJ4=;
 b=BvVYcJfL6c8t3vaC3hzZ0x5Jr3yPpg9TeUu4BnDAGlsGy79lRUoTzXqVbZW8nBYUS/
 mCRmak+kC1cVWPtgMbsGlgKSm45BH4Uvb4jZoSsfhruUg4p9D6/a1oW1oqlWxw9yy5Rd
 v5Y+oGZcRZRx3zUlmAOyhdsg9k8iN+AE39k72YhgJC7StXLaz13hfOE1uNUperzyFUHg
 l4A0QHLcxUwAwtMOUIgFQVirinLoWzJ5SfWAlhvZX698+G5UdYdmNu7yJ74Jbq4DFzT2
 lx3AwBS55GyAoXajDMlZHPQTNn5/yb6JILXNwp9m6pg8Wn3QDb9xQRK9ANL0V5ZPHOaa
 ePIQ==
X-Gm-Message-State: AOJu0YxVKgnMlTRgBrCbKSXoT3u9x2k5iyGUUfbepvcfdS0hZBMcYKkl
 CA4GYsJLakey9f62n0inhUNXfIwnkEAHk0k7ypSMQw==
X-Google-Smtp-Source: AGHT+IHyhJSWiia3K3sWSqzs9R4jjq04Y+WIUYIc2Ttxdvr+Ys8bPby4u0SJWAcMZONs2xz0YHXI4buzX0cWSLoaSkQ=
X-Received: by 2002:a0d:f245:0:b0:5c9:d64e:68c7 with SMTP id
 b66-20020a0df245000000b005c9d64e68c7mr3050822ywf.35.1700677974461; Wed, 22
 Nov 2023 10:32:54 -0800 (PST)
MIME-Version: 1.0
References: <20231103230414.1483428-1-dmitry.baryshkov@linaro.org>
 <7a4a6698-0954-4225-82ff-02dd13bd64bb@linux.dev>
In-Reply-To: <7a4a6698-0954-4225-82ff-02dd13bd64bb@linux.dev>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 22 Nov 2023 20:32:45 +0200
Message-ID: <CAA8EJpoqfwyVYQy17QAOtrGr1AGzFkpKrOM5_F58=A95PoYncQ@mail.gmail.com>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v6 0/6] drm: simplify support for
 transparent DRM bridges
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Robert Foss <rfoss@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-usb@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Andy Gross <agross@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, freedreno@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 22 Nov 2023 at 18:03, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
>
> Hi,
>
>
> On 2023/11/4 07:03, Dmitry Baryshkov wrote:
> > Supporting DP/USB-C can result in a chain of several transparent
> > bridges (PHY, redrivers, mux, etc). All attempts to implement DP support
> > in a different way resulted either in series of hacks or in device tree
> > not reflecting the actual hardware design. This results in drivers
> > having similar boilerplate code for such bridges.
>
> Please improve the written,  "resulted" -> "yield" ?
>
> > Next, these drivers are susceptible to -EPROBE_DEFER loops: the next
> > bridge can either be probed from the bridge->attach callback, when it is
> > too late to return -EPROBE_DEFER, or from the probe() callback, when the
> > next bridge might not yet be available, because it depends on the
> > resources provided by the probing device. Device links can not fully
> > solve this problem since there are mutual dependencies between adjancent
> > devices.
> >
> > Last, but not least, this results in the the internal knowledge of DRM
>
> There is a duplicated "the" word in this sentence.
>
> As far as I can understand, nearly all of those troubles are because the display bridges
> drivers are designed as a kernel module(.ko) instead of making them as static link-able
> helpers. I means that a display bridge device can not work standalone, as it have to be
> used with a display controller. So a display bridge is just a slave device or a auxiliary
> device. My question is: if it can't works by itself, we probably shouldn't design them as
> kernel modules style. Am I correct?

No. This has nothing to do with the driver being a kernel module or built-in.

>
> > subsystem slowly diffusing into other subsystems, like PHY or USB/TYPEC.
>
> Yeah, this indeed a problem.
>
> > To solve all these issues, define a separate DRM helper, which creates
> > separate aux device just for the bridge.
>
> I'm supporting you if want to solve all these problems, this is fine and thanks a lot.
> But I want to ask a question, now that you are solving these problems by creating separate
> devices, does this manner match the hardware design perfectly? which is the hardware units
> you newly created device is corresponding to?

Aux devices do not always follow the actual hardware internals. For
example, see the TI sn65dsi86 driver, which also uses aux devices to
split dependency and probing chains.

> > During probe such aux device
> > doesn't result in the EPROBE_DEFER loops. Instead it allows the device
> > drivers to probe properly, according to the actual resource
> > dependencies. The bridge auxdevs are then probed when the next bridge
> > becomes available, sparing drivers from drm_bridge_attach() returning
> > -EPROBE_DEFER.
>
> OK, as far as I can understand,  in order to solve the mentioned problem
> you are also retire the defer probe mechanism.

No, I'm not retiring the probe deferral mechanism. Instead I'm
splitting it into two chains. One going from the controller to the
usb-c connector for the signal flow, another going from the connector
back to the drm_encoder for the drm_bridge dependencies.

>
>
> > Changes since v5:
> >   - Removed extra semicolon in !DRM_AUX_HPD_BRIDGE stubs definition.
> >
> > Changes since v4:
> >   - Added documentation for new API (Sima)
> >   - Added generic code to handle "last mile" DP bridges implementing just
> >     the HPD functionality.
> >   - Rebased on top of linux-next to be able to drop #ifdef's around
> >     drm_bridge->of_node
> >
> > Changes since v3:
> >   - Moved bridge driver to gpu/drm/bridge (Neil Armstrong)
> >   - Renamed it to aux-bridge (since there is already a simple_bridge driver)
> >   - Made CONFIG_OF mandatory for this driver (Neil Armstrong)
> >   - Added missing kfree and ida_free (Dan Carpenter)
> >
> > Changes since v2:
> >   - ifdef'ed bridge->of_node access (LKP)
> >
> > Changes since v1:
> >   - Added EXPORT_SYMBOL_GPL / MODULE_LICENSE / etc. to drm_simple_bridge
> >
> > Dmitry Baryshkov (6):
> >    drm/bridge: add transparent bridge helper
> >    phy: qcom: qmp-combo: switch to DRM_AUX_BRIDGE
> >    usb: typec: nb7vpq904m: switch to DRM_AUX_BRIDGE
> >    drm/bridge: implement generic DP HPD bridge
> >    soc: qcom: pmic-glink: switch to DRM_AUX_HPD_BRIDGE
> >    usb: typec: qcom-pmic-typec: switch to DRM_AUX_HPD_BRIDGE
> >
> >   drivers/gpu/drm/bridge/Kconfig                |  17 ++
> >   drivers/gpu/drm/bridge/Makefile               |   2 +
> >   drivers/gpu/drm/bridge/aux-bridge.c           | 140 +++++++++++++++
> >   drivers/gpu/drm/bridge/aux-hpd-bridge.c       | 164 ++++++++++++++++++
> >   drivers/phy/qualcomm/Kconfig                  |   2 +-
> >   drivers/phy/qualcomm/phy-qcom-qmp-combo.c     |  44 +----
> >   drivers/soc/qcom/Kconfig                      |   1 +
> >   drivers/soc/qcom/pmic_glink_altmode.c         |  33 +---
> >   drivers/usb/typec/mux/Kconfig                 |   2 +-
> >   drivers/usb/typec/mux/nb7vpq904m.c            |  44 +----
> >   drivers/usb/typec/tcpm/Kconfig                |   1 +
> >   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c |  41 +----
> >   include/drm/bridge/aux-bridge.h               |  37 ++++
> >   13 files changed, 383 insertions(+), 145 deletions(-)
> >   create mode 100644 drivers/gpu/drm/bridge/aux-bridge.c
> >   create mode 100644 drivers/gpu/drm/bridge/aux-hpd-bridge.c
> >   create mode 100644 include/drm/bridge/aux-bridge.h
> >



-- 
With best wishes
Dmitry
