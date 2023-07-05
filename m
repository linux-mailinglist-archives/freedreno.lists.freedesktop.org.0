Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EA7747C87
	for <lists+freedreno@lfdr.de>; Wed,  5 Jul 2023 07:39:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37F0C10E1BA;
	Wed,  5 Jul 2023 05:39:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B256C10E1B9
 for <freedreno@lists.freedesktop.org>; Wed,  5 Jul 2023 05:39:30 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-5702415be17so70650147b3.2
 for <freedreno@lists.freedesktop.org>; Tue, 04 Jul 2023 22:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688535569; x=1691127569;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oZRUZb3Mavh3zQZr0EyamsRHMcZS99pmjV8Wj5+w+qg=;
 b=x9RjFt6ulqSjQi+8+xXDMCIFQrdt06fwjMPTcE71RERLqQZnJaU5Kj31PMwi3f/DBi
 2uCscmaq04UgqRS5ZYxtcuaaaNndSjhll2FryhV6h4LWPSoyLaLUXau18fV2SpEfSztf
 OXsmtSrGr7pI7T+M9d+zNkhQ3w8g7WuXY80r3of1RHia26zfhcXBRZLqxXlQIZC487KG
 f4cYFubeJ3XdN0iIVWjmQPKB024M9CxBgHkBHuNPIOeRzEiAsutc/e63ypZ2nmv3KBtx
 bQ/XwTtEDhy9yDWdWAKG4MZLd7lSKV3+4+qSGqBKi+0pzhiRStfNh7nAzYS9VlHcdtTQ
 5f2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688535569; x=1691127569;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oZRUZb3Mavh3zQZr0EyamsRHMcZS99pmjV8Wj5+w+qg=;
 b=bmnCLx0qCppfnzPcDPg358JExlmJGn8hQrhLkbofHbi5Na+MKLSHFCDaqAnbBZr71R
 1xoghkLI3ouY3IITsCyFE1OAXwTLtKc+d8082vQFppuXDEkJvFjnQevfn/I8YWD0U4IE
 MQ7eiQ/+eY6bEUuXXYdvJ4X8zReiYU6U3LW6SU9WRzTO+YNfSB1cuyr+I37eacaP8dfZ
 92yXfCmKr/DKezQu/uX3TKbsqmU1xARZdYT/NMwHkWaGRgq+abiqT5s/OIA5lihK8XXM
 376m8neQMmTC3RxRrK0CE3VtjuYU5c6fOZzGyW4C4JyKzJtG9QSIA0JlhbZu080mB8k3
 N8IQ==
X-Gm-Message-State: ABy/qLawxXYr39TW+PO0zTZDd/xcuL0y+v/UIwI4NuqUWmO0MJrIt27o
 eb42cjhn9HtC6ir7i9fqQvhMByd1Kv/Gy4xrGQ7jSw==
X-Google-Smtp-Source: APBJJlF/o0+UnDZwtyE3kuzBDCdbAEQWshCz47kYNXjLYoj6S3T1Qy4vIgjTzrrW/XTGavWVmpml++zCtJ2idlA3dPM=
X-Received: by 2002:a25:c303:0:b0:c11:bec7:a029 with SMTP id
 t3-20020a25c303000000b00c11bec7a029mr11967714ybf.46.1688535569460; Tue, 04
 Jul 2023 22:39:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230403221233.500485-1-marex@denx.de>
 <20230403221233.500485-2-marex@denx.de>
 <CAMi1Hd0TD=2z_=bcDrht3H_wiLvAFcv8Z-U_r_KUOoeMc6UMjw@mail.gmail.com>
 <CAMty3ZBNFu=f-FS4YFN4wfmiTuk=48nna-vub1eMYwidDt+msg@mail.gmail.com>
In-Reply-To: <CAMty3ZBNFu=f-FS4YFN4wfmiTuk=48nna-vub1eMYwidDt+msg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 5 Jul 2023 08:39:18 +0300
Message-ID: <CAA8EJppbdiUz5m+9EAPnFb916DaS_VKWd30c7_EPWjuid8rtqQ@mail.gmail.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [PATCH 2/2] drm/bridge: lt9611: Do not generate
 HFP/HBP/HSA and EOT packet
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
Cc: Amit Pundir <amit.pundir@linaro.org>, Marek Vasut <marex@denx.de>,
 Robert Foss <rfoss@kernel.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Michael Walle <michael@walle.cc>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

[Adding freedreno@ to cc list]

On Wed, 5 Jul 2023 at 08:31, Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> Hi Amit,
>
> On Wed, Jul 5, 2023 at 10:15=E2=80=AFAM Amit Pundir <amit.pundir@linaro.o=
rg> wrote:
> >
> > Hi Marek,
> >
> > On Wed, 5 Jul 2023 at 01:48, Marek Vasut <marex@denx.de> wrote:
> > >
> > > Do not generate the HS front and back porch gaps, the HSA gap and
> > > EOT packet, as these packets are not required. This makes the bridge
> > > work with Samsung DSIM on i.MX8MM and i.MX8MP.
> >
> > This patch broke display on Dragonboard 845c (SDM845) devboard running
> > AOSP. This is what I see
> > https://people.linaro.org/~amit.pundir/db845c-userdebug/v6.5-broken-dis=
play/PXL_20230704_150156326.jpg.
> > Reverting this patch fixes this regression for me.
>
> Might be msm dsi host require proper handling on these updated
> mode_flags? did they?

The msm DSI host supports those flags. Also, I'd like to point out
that the patch didn't change the rest of the driver code. So even if
drm/msm ignored some of the flags, it should not have caused the
issue. Most likely the issue is on the lt9611 side. I's suspect that
additional programming is required to make it work with these flags.

--=20
With best wishes
Dmitry
