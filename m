Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2A5859723
	for <lists+freedreno@lfdr.de>; Sun, 18 Feb 2024 14:31:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0D6610E163;
	Sun, 18 Feb 2024 13:31:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SYYbAxgn";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 412D310E163
 for <freedreno@lists.freedesktop.org>; Sun, 18 Feb 2024 13:31:55 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-dc236729a2bso3296302276.0
 for <freedreno@lists.freedesktop.org>; Sun, 18 Feb 2024 05:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708263114; x=1708867914; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BLZq4hHi1AwzI9ptRmrUPgmKE8tZxkSC9vVEZHcAwl4=;
 b=SYYbAxgnvRCFK4KC5hmxTh0bFEcqjP1+o/OGaxpYdjifYuns+3tOr7visZrYUQJrHW
 eUXYgCYYRDg9/2BxHATzBXbwOuu+HtQQ8pgTh8ts6K6/aLRbDDLPG1nyWI96ZftySpDq
 Lv0IiQ8cKIIO23cBX+9UyXicqadfyCBpIqZ/mz4+UnNXX+cZ66xWBK5X8mmkDMuxLv72
 +7WMaNc2qLQSGpeXucuCDQOt5tcmYyeAlX0FgjytYrF0DsQoB5KLo5AZF/YsX1KaqB2K
 9Ue6bJlk5Hb0iinqJHYQPSup4y5C0fpPsOZdoSQ+Qbo1sHRxca66NOJ7bgHjbCo/fVWr
 SVpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708263114; x=1708867914;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BLZq4hHi1AwzI9ptRmrUPgmKE8tZxkSC9vVEZHcAwl4=;
 b=erJUkuttaFlk/41Zdmttf305cx8vkC+vZk4NvEEE4kY6kLvIYo5XeO6u/nh9Ol64ha
 PusLKsGlbsesG0JEwFm+J7GbfqlzvC0VTLmqyCjmIYjzWVV1JCrEeS0ISg+OqDe6YdA6
 hgeMBqPh5IdUbXjhZLmxJsXM7lsCPjueBCGCQArqDNpNjuM304068RFz/Q9XpdflRZaN
 7RHPxqz32n7jh8bI5ZI+VUbpeu0Gs+EgDZqHvrVSKpDmWKd7Pj5hsSL0a4n+bpxVguvK
 +gACLcrZtaswm39FViTXova5KGQU4ahe7TcIf6RoYK4a23ilCBEY227rXDKUehpT5o8V
 5nFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0cL4k7PzAu+ZhY2cogypFfxNy0RIJsgLB7WqJ/E+/6lK69jNgEVicrt3bQNljN21PgPui0az/Bxcdzr5tzR3/G52YYij+B4qJ9LQ5y/UP
X-Gm-Message-State: AOJu0YxBCzmmISy9WsyDV/xcq0XvSNK1N6pmpzJo0mVL5fE4lKtDFX1H
 RlBUwgjtl/ro15Vaw8Tqxn3SinMzKkr6oZpCqnWN+aYnkInIbiwTw8UfqO2k4O+ibQBiFytEMav
 IMdTKSFTKmgbmoIeWElmdovyBygyy7bxztI9VFg==
X-Google-Smtp-Source: AGHT+IFtJWbUMAlmCDvHbnQtv8DWuSpS+RMOGtTOdZUEacxd/aOjFJ8Dzacfw8W4vpnWE8jAyB0bBS5+Jh+puyW8WEk=
X-Received: by 2002:a25:8404:0:b0:dbe:4f15:b5cf with SMTP id
 u4-20020a258404000000b00dbe4f15b5cfmr9384502ybk.15.1708263114193; Sun, 18 Feb
 2024 05:31:54 -0800 (PST)
MIME-Version: 1.0
References: <20231207213048.1377147-1-cwabbott0@gmail.com>
 <85581fad-da8f-4550-a1c8-8f2996425dcd@lausen.nl>
In-Reply-To: <85581fad-da8f-4550-a1c8-8f2996425dcd@lausen.nl>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 18 Feb 2024 15:31:43 +0200
Message-ID: <CAA8EJpoqS856N8w3ZxdhQ0TUVP2u5K8qCjG=qLQPnHXGH9NyNg@mail.gmail.com>
Subject: Re: [REGRESSION] sc7180-trogdor-lazor image corruption regression for
 USB-C DP Alt Mode ([PATCH 0/2] Add param for the highest bank bit)
To: Leonard Lausen <leonard@lausen.nl>
Cc: Connor Abbott <cwabbott0@gmail.com>, freedreno@lists.freedesktop.org, 
 regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sun, 18 Feb 2024 at 03:17, Leonard Lausen <leonard@lausen.nl> wrote:
>
> Hi Connor,
>
> unfortunately, your series https://patchwork.freedesktop.org/series/12752=
9/ has introduced a regression for external displays connected through USB-=
C DP Alt Mode, at least on sc7180-trogdor-lazor devices. Do you think it's =
possible to  fix this before the 6.8 release or would it be better to rever=
t the series? I'm happy to help testing any fixes. The issue is also tracke=
d at https://gitlab.freedesktop.org/drm/msm/-/issues/49.
>
> Thank you
> Leonard
>
> #regzbot introduced: 8814455a0e54ca353b4b0ad5105569d3fdb945cc

#regzbot monitor https://gitlab.freedesktop.org/drm/msm/-/issues/49


--=20
With best wishes
Dmitry
