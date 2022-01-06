Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5174485E75
	for <lists+freedreno@lfdr.de>; Thu,  6 Jan 2022 03:11:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7476310E567;
	Thu,  6 Jan 2022 02:11:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1897E10E54C
 for <freedreno@lists.freedesktop.org>; Thu,  6 Jan 2022 02:11:37 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id s127so1749369oig.2
 for <freedreno@lists.freedesktop.org>; Wed, 05 Jan 2022 18:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=q2VQMTLj5iMfGBhNI/dlyoIBVmaRNduV4g9FSAc5d0Q=;
 b=HAVqmktk9jdmgZuflgaqkWXgkT6HjjILGQc4nyrtPjXqB/28cq964Ts7Dx4YSVx+nZ
 lvMilO6WZjQUOE7DcdMRpEeflvrwsEdmHMJw3y1+54jjelilqM1XnGYhpkyKEdLGD4is
 5wV0VP6y2BEak1xFEQq6CQf3jXLQX5hdP559w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=q2VQMTLj5iMfGBhNI/dlyoIBVmaRNduV4g9FSAc5d0Q=;
 b=UsKmzSNTaNHoC3cDbjBRZY89/XhHCpzGI6IUpWV8bU8fiHZ3gABADpQv1IkZ9YKEdr
 vZ7MijOmNjPtyUiEHFaIh+28JQiPT9Ie+bMuxa5Wx1frGqtbL/uG6p0iIz35QvQTs/SP
 YYKu4q5h+kszng31VQCA1N5MZB9FwkzBotkMSR0PjPYMcfq6n4ECcThDDfuvOPNHXhGv
 LGt49fqz7k8Y/3OmK05/ZSPlF+X/PJyg/7BbWqy5d6hIdimSXlKFpWYJ6vAhrsnuWMQs
 pgspNqkb0ofK9a2FT+JkwNyk9a/Xzw5RY5E/tPA74goUQXz0J4RD5M7r72LPRsPlkOw8
 nhOQ==
X-Gm-Message-State: AOAM533TeJosTJ2gOy0Nqnf7qkslAF9TjwG7U6ISR0Ty9JzvWtPV5CYO
 THBzav25dqIZaiTGtZRRWEVcTMh7KpLx2sJaoXBR7g==
X-Google-Smtp-Source: ABdhPJwpP4rARq+ZNtjjgLJ5aaz4xxbiA6N8LCGM1f9VveTOLHPxVsLehRjSQTj+a9Afka6xm71L9rlxNmHRbUONRxc=
X-Received: by 2002:a54:4710:: with SMTP id k16mr4656667oik.32.1641435096318; 
 Wed, 05 Jan 2022 18:11:36 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 5 Jan 2022 18:11:35 -0800
MIME-Version: 1.0
In-Reply-To: <YcGeKpy/oecKlKZg@kroah.com>
References: <20211202222732.2453851-1-swboyd@chromium.org>
 <20211202222732.2453851-2-swboyd@chromium.org>
 <YcGeKpy/oecKlKZg@kroah.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 5 Jan 2022 18:11:35 -0800
Message-ID: <CAE-0n52E-9T0X8COP0EhnjCK8iieSD0Vy_0f9-v8JX7ZshZ_0A@mail.gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v4 01/34] component: Introduce struct
 aggregate_device
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
Cc: Saravana Kannan <saravanak@google.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Russell King <rmk+kernel@arm.linux.org.uk>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Greg Kroah-Hartman (2021-12-21 01:28:10)
> On Thu, Dec 02, 2021 at 02:26:59PM -0800, Stephen Boyd wrote:
> > Replace 'struct master' with 'struct aggregate_device' and then rename
> > 'master' to 'adev' everywhere in the code. While we're here, put a
> > struct device inside the aggregate device so that we can register it
> > with a bus_type in the next patch.
>
> Do not do a "while we are here" type change please.  Do the
> rename/replace first, and then make the other change.
>
> > The diff is large but that's because this is mostly a rename, where
> > sometimes 'master' is replaced with 'adev' and other times it is
> > replaced with 'parent' to indicate that the struct device that was being
> > used is actually the parent of the aggregate device and driver.
>
> The diff is 15 lines, how is that "large"?
>

Looks like I forgot to remove this chunk of commit text while splitting
the change earlier. Will fix it up now.
