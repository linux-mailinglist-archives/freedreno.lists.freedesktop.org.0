Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7647921FE
	for <lists+freedreno@lfdr.de>; Tue,  5 Sep 2023 12:57:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B42310E4A5;
	Tue,  5 Sep 2023 10:57:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D51910E4A5
 for <freedreno@lists.freedesktop.org>; Tue,  5 Sep 2023 10:57:12 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-58c92a2c52dso22096287b3.2
 for <freedreno@lists.freedesktop.org>; Tue, 05 Sep 2023 03:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693911431; x=1694516231; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nFp9JN673sSpwa45B4q2HQSN730WX8grbrKR4m9d76A=;
 b=i6+pVCzECF2oVmJH63wW8MbDK5jHRu8rSD5Omo67duOlg9UDorMTWvugVfitB1s1S1
 oUXshRsxWh95RT/s0MGK2lmXZfWk+B3fqY6bLz9Vb0zc0H2T6qicyWpnOXz/rlItSUIS
 5qJBCTSWrKWjXFpVgi0elVoIUyvZU/6GdEbxZSfUMuQEQF5EcLf2X1d5bI22muynB3A+
 1vwkmQcwzcGoDzUvg2ymPhgvofGBrME8OtLHT6g36nc7+qFOMzCH/0tRgIGFSbgt+XVd
 kgpUe55gNjaQVstYxQsXosO9FjPBq0/Rl3hlruEI3LzhiWIHRmsozj+b75WJNf8VlalA
 xbtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693911431; x=1694516231;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nFp9JN673sSpwa45B4q2HQSN730WX8grbrKR4m9d76A=;
 b=LHq5hKXFrrzC02XO7WSgL0ijjBwXSf9lCdRWEzpM1NE0aeItONK7Uv7TnLSmvd110E
 Mv1TlUcHRVQjrTRjF4UhY0FT51vVa7dwUo2xi5WfO85YCtOpgq6CtRybdKPLQusCFZjr
 WoFA2sJjOsT+rEUeY7FeVACN+QgAkWX1GjV+Dq7xxe+s0QZaDQ4nPMtnby4GRnbJX1UR
 rhlqMb/nwJcJgOZzZ7qEHqqLddq1YXv6y3vjEy0N32uicL4MO9Me6TCLT5QCKs0mwMvW
 lBCOhAyLIm9c3GAmT0SdTFIRgoxEAL0g3AGNkbPHQ+/0bFq2QNfvcDv/JhTGvGr/58G8
 t3NQ==
X-Gm-Message-State: AOJu0YyTGDejlopJxjJR/xv70P3FAGbES4I8KL+i5sSYTL+ysFpLFTPU
 QgjVH3xuXHW4gd37045HuHOFB8+C5Ua6yaCYGAFaug==
X-Google-Smtp-Source: AGHT+IGZHwMQlo/ityKImZ2VeEtB90rqhklF5U6Gv8PiiU7XpveUbpNUVJmNlPMw3mBk4Obk/SUY2ph1gPYN6jbIHDo=
X-Received: by 2002:a25:ac20:0:b0:d53:f98f:8018 with SMTP id
 w32-20020a25ac20000000b00d53f98f8018mr13526068ybi.65.1693911431284; Tue, 05
 Sep 2023 03:57:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230903214150.2877023-1-dmitry.baryshkov@linaro.org>
 <20230903214150.2877023-2-dmitry.baryshkov@linaro.org>
 <ZPbrtAlO2Y+bjDhf@kuha.fi.intel.com>
In-Reply-To: <ZPbrtAlO2Y+bjDhf@kuha.fi.intel.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 5 Sep 2023 13:56:59 +0300
Message-ID: <CAA8EJpqUg2-k7LLBL38RHU1sThkXB54ca68xEMd1yMnHQcQ++w@mail.gmail.com>
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

Hi Heikki,

On Tue, 5 Sept 2023 at 11:50, Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> Hi Dmitry,
>
> On Mon, Sep 04, 2023 at 12:41:39AM +0300, Dmitry Baryshkov wrote:
> > The kdev->fwnode pointer is never set in drm_sysfs_connector_add(), so
> > dev_fwnode() checks never succeed, making the respective commit NOP.
>
> That's not true. The dev->fwnode is assigned when the device is
> created on ACPI platforms automatically. If the drm_connector fwnode
> member is assigned before the device is registered, then that fwnode
> is assigned also to the device - see drm_connector_acpi_find_companion().
>
> But please note that even if drm_connector does not have anything in
> its fwnode member, the device may still be assigned fwnode, just based
> on some other logic (maybe in drivers/acpi/acpi_video.c?).
>
> > And if drm_sysfs_connector_add() is modified to set kdev->fwnode, it
> > breaks drivers already using components (as it was pointed at [1]),
> > resulting in a deadlock. Lockdep trace is provided below.
> >
> > Granted these two issues, it seems impractical to fix this commit in any
> > sane way. Revert it instead.
>
> I think there is already user space stuff that relies on these links,
> so I'm not sure you can just remove them like that. If the component
> framework is not the correct tool here, then I think you need to
> suggest some other way of creating them.

The issue (that was pointed out during review) is that having a
component code in the framework code can lead to lockups. With the
patch #2 in place (which is the only logical way to set kdev->fwnode
for non-ACPI systems) probing of drivers which use components and set
drm_connector::fwnode breaks immediately.

Can we move the component part to the respective drivers? With the
patch 2 in place, connector->fwnode will be copied to the created
kdev's fwnode pointer.

Another option might be to make this drm_sysfs component registration optional.

> Side note. The problem you are describing here is a limitation in the
> component framework - right now it's made with the idea that a device
> can represent a single component, but it really should allow a device
> to represent multiple components. I'm not saying that you should try
> to fix the component framework, but I just wanted to make a note about
> this (and this is not the only problem with the component framework).
>
> I like the component framework as a concept, but I think it needs a
> lot of improvements - possibly rewrite.

Yes. There were several attempts to rewrite the component framework,
but none succeeded up to now. Anyway, I consider rewriting components
framework to be a bigger topic compared to drm connector fwnode setup.

--
With best wishes
Dmitry
