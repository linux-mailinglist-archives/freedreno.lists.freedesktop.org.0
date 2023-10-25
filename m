Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E677D6C6D
	for <lists+freedreno@lfdr.de>; Wed, 25 Oct 2023 14:55:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B0BE10E0D7;
	Wed, 25 Oct 2023 12:55:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 1523 seconds by postgrey-1.36 at gabe;
 Wed, 25 Oct 2023 12:55:09 UTC
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40A5910E0D7
 for <freedreno@lists.freedesktop.org>; Wed, 25 Oct 2023 12:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1698238507; x=1698497707;
 bh=6lMF1JifW5huSVXWVFOd0HhrR0SzxrcAOage3NSxPW4=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=UfETWEAZXEqJ4NovRWp4g+BBGNogT8gEA8DtuV9/dEn6wU8I+JggfcnlWb1AgUC27
 kETCGEIyFXKjSvFEjOz9hj8k7YL9vut8PlQUmOS/RvGI/FyoyfcvKkwlwcunYrQVPO
 eKLFhndpUvabDu0ZvE3rMISjptWkhBOX6yCNHXa62j7ic7SZOsy8Wjfg7ywuBk3NRE
 9foDObui7X5onbh1XygKlzNqpUUnqXfzZ2aS28L0U+2mYrIX8UhB34LMOC8Dp71dYR
 7/D5zqnO7b0I0msfWBIeB7N6ViMB35MF0969HegLSU0URVGoz5bpLQNQjGU0I7DSuK
 FiSVV8cRZdtQw==
Date: Wed, 25 Oct 2023 12:54:44 +0000
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
From: Simon Ser <contact@emersion.fr>
Message-ID: <EeTPIPMpLMJf5ZaAnmfLL8a1MUy4DRxST6oU_-N44pa3XfyglLs_sWXdnOvjJLTzahjZhkRqWIO9TwXj4bhSKwBIUYkuIufXms2UjZ7MJjA=@emersion.fr>
In-Reply-To: <65f841ba-5b70-4cbe-98e0-3d53e5b7944c@linaro.org>
References: <20231010225229.77027-1-dmitry.baryshkov@linaro.org>
 <ZTkIpMWpxKzSE7gQ@hovoldconsulting.com>
 <NDl6Ye92jJDp3fm20AwcuUKWuP8tzQ9CyWGGRltZ_DxYgxep2DO8Wil0Nmsfmhp1j4vAp9Yu1duiHeQkjBG-bcAdFoW3ZbWxvVqrCEpQe_4=@emersion.fr>
 <65f841ba-5b70-4cbe-98e0-3d53e5b7944c@linaro.org>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [PATCH] soc: qcom: pmic_glink: fix connector type
 to be DisplayPort
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wednesday, October 25th, 2023 at 14:45, Dmitry Baryshkov <dmitry.baryshk=
ov@linaro.org> wrote:

> On 25/10/2023 15:29, Simon Ser wrote:
>=20
> > On Wednesday, October 25th, 2023 at 14:22, Johan Hovold johan@kernel.or=
g wrote:
> >=20
> > > I was just going to post a patch fixing this after finally investigat=
ing
> > > why the DisplayPort outputs on the X13s were annoyingly identified as
> > > "Unknown20-1" and "Unknown20-2" instead of the expected "DP-1" and
> > > "DP-2".
> >=20
> > Note, ideally userspace should use drmModeGetConnectorTypeName() from
> > libdrm to figure out the proper name for a connector type. That way we
> > only need to update a single spot when adding a new connector type,
> > instead of patching a whole bunch of programs.
>=20
> X11 does its own thing. It further "renames" DP MST connectors. So on my
> laptop I end up with DP-1-1 in xrandr, but DP-3 in kernel.

Right. But that function only takes in a connector type enum as input,
and returns a string for the type only. It doesn't include the suffix
with the number.

IOW: xserver could use drmModeGetConnectorTypeName() and then append
"-2" or "-1-1" or whatever.

But with the current appetite for xserver development this is probably
not going to happen (and doesn't matter very much).
