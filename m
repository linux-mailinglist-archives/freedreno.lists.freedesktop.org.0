Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C912B515955
	for <lists+freedreno@lfdr.de>; Sat, 30 Apr 2022 02:34:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88ECE10E2D5;
	Sat, 30 Apr 2022 00:34:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 600DA10E2D5
 for <freedreno@lists.freedesktop.org>; Sat, 30 Apr 2022 00:34:41 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-2ef5380669cso100934987b3.9
 for <freedreno@lists.freedesktop.org>; Fri, 29 Apr 2022 17:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xZdhfgXcYyzwQ2Qbee46+dN9XPUR+TwA/X5/pzXcNMQ=;
 b=hgzCI1pU/Sf5CSopWVg8mrZsOmGMyK2uQJMYiDRakeWgP4rQDVr0OzsKoAEyGr7G7s
 MU+79meZgzN6dY170248qXerXKjAawlPA19wuoLRK/EygBn9OHvDdRtX0lbr9w7DQoui
 hfTr9X8yvB9ngRQbxXadIp1y44r+xsjCSF1xEHfnfinzDrgU+rI+X5yn/1DnXl7K1l0a
 cZ5s/ZQ/AUftZhpQsp/2QzwGb/Bk9fRDN3JveXlfvHHOCThdPTL5/81aJZ99DxZLXxPV
 DhCH/1bmQre/0VOtJ0nG1s0AfmL/NoD0LKEt+YbcvF+A1YyzK0AvQXPj8RrPnm6/XHM3
 EXYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xZdhfgXcYyzwQ2Qbee46+dN9XPUR+TwA/X5/pzXcNMQ=;
 b=g9H1QCNf6YhQqQOkyr+ZsD1QdPzrzZKwQ5fiHSUmHXeHzPw4w2AsiV+4MROotTHYAQ
 Pj+lnZKRDG3gieRE+rexaQuv3IXf5aIQtk2pAryKh6a8VZI8jLrPhqtG9Zw32MIIxOen
 aDpiwai0O5YEg2KFYf13oeSAKkgOFUXRaYGpDwygTSJ7Q0FKew016Q4po1ADFxZizSmg
 1FaLK/+aNftmlwSSwKDPxlE5chZLcavq8NBccblXPzrs5pcUx11R4ip7fX8HiO8dKMP5
 POf5PjOKohqtWY2qVc9h74bPIUCwTU/Kyb1zQQGK5/rAsMCkRBcOVBhpP8slDXL0WG8M
 yP2A==
X-Gm-Message-State: AOAM530ZEnlnIqIe7UpzJYH2WjgZkEtSmU6F++zHEjyqbOnEMhKyRuHj
 9beNRnDFqdGKkczj8C+Zq/7wEtSGpQovy+WvB02K9g==
X-Google-Smtp-Source: ABdhPJwgD+XnOBNx8doAXxOKJPMj70f1B+iF247gtD9LkvbzcVOtpMrSGBmJinpKgpBS3LvBxStkWw7WXaDVdB1d6H0=
X-Received: by 2002:a05:690c:293:b0:2f8:d994:b750 with SMTP id
 bf19-20020a05690c029300b002f8d994b750mr1878320ywb.459.1651278880449; Fri, 29
 Apr 2022 17:34:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220429164325.1.I2a3b980ea051e59140227999f0f0ca16f1125768@changeid>
In-Reply-To: <20220429164325.1.I2a3b980ea051e59140227999f0f0ca16f1125768@changeid>
From: Saravana Kannan <saravanak@google.com>
Date: Fri, 29 Apr 2022 17:34:04 -0700
Message-ID: <CAGETcx-i0giDksG7ARfT0E6gakdYuh6OO9g1Vmeu6S3PH1qGUQ@mail.gmail.com>
To: Douglas Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] device property: Fix recent breakage of
 fwnode_get_next_parent_dev()
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-msm@vger.kernel.org,
 swboyd@chromium.org, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Daniel Scally <djrscally@gmail.com>, linux-acpi@vger.kernel.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, Apr 29, 2022 at 4:43 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> Due to a subtle typo, instead of commit 87ffea09470d ("device
> property: Introduce fwnode_for_each_parent_node()") being a no-op
> change, it ended up causing the display on my sc7180-trogdor-lazor
> device from coming up unless I added "fw_devlink=off" to my kernel
> command line. Fix the typo.

Thank you for the fix!

Reviewed-by: Saravana Kannan <saravanak@google.com>

-Saravana

>
> Fixes: 87ffea09470d ("device property: Introduce fwnode_for_each_parent_node()")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  drivers/base/property.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/base/property.c b/drivers/base/property.c
> index 36401cfe432c..52e85dcb20b5 100644
> --- a/drivers/base/property.c
> +++ b/drivers/base/property.c
> @@ -600,7 +600,7 @@ struct device *fwnode_get_next_parent_dev(struct fwnode_handle *fwnode)
>         struct device *dev;
>
>         fwnode_for_each_parent_node(fwnode, parent) {
> -               dev = get_dev_from_fwnode(fwnode);
> +               dev = get_dev_from_fwnode(parent);
>                 if (dev) {
>                         fwnode_handle_put(parent);
>                         return dev;
> --
> 2.36.0.464.gb9c8b46e94-goog
>
