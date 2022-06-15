Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C28154D4F4
	for <lists+freedreno@lfdr.de>; Thu, 16 Jun 2022 01:06:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C89113945;
	Wed, 15 Jun 2022 23:06:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 420 seconds by postgrey-1.36 at gabe;
 Wed, 15 Jun 2022 23:06:24 UTC
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59133113945
 for <freedreno@lists.freedesktop.org>; Wed, 15 Jun 2022 23:06:24 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LNgjL0Vbhz4xXj;
 Thu, 16 Jun 2022 08:59:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1655333959;
 bh=d5d/IXe2LkYdx5k7DNB4uYu/qhr7MqhAXwMIkq0IZr8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=S50womizPOE/MYo07uLMQcWFqsctzgwvZiWerf0osMSG5zjbC8x0h2xehY+IjdAug
 Q8ZWTFPVx7O39mZzBj+pw1UNC7GFA6lTwdb8tao4+F984YmtCrcN1vX2/OU5yccXRA
 uFE1rKlG9y0acJ20YeAbKiDea2xVfYHRgL0BL1Z+TvearBUCWZcVRC8GPng+dmntd7
 1YfbKQmaxoCeOtv9udflSSoxCnEiFLyXXUh0/0+1fgY1ryzYFDvArpTDOhQLNHLwY/
 jNQZeGjrdhaD7Wk+xsXx8Xjq/HVwtGM63jBGHbzNCBZkhQVHNSnOAwJsyKqs4RQdR8
 99V/4B6nRk2cg==
Date: Thu, 16 Jun 2022 08:59:16 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <20220616085916.113e477b@canb.auug.org.au>
In-Reply-To: <5dbc0159-cb33-db5b-20cc-05f3027af15e@linaro.org>
References: <5dbc0159-cb33-db5b-20cc-05f3027af15e@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0Rts+dJPHVuFp7yBrsgCJ62";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Subject: Re: [Freedreno] Please add another drm/msm tree to the linux-next
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
Cc: Rob Clark <robdclark@gmail.com>, linux-next@vger.kernel.org,
 freedreno <freedreno@lists.freedesktop.org>, linux-kernel@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

--Sig_/0Rts+dJPHVuFp7yBrsgCJ62
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

On Wed, 15 Jun 2022 17:19:42 +0300 Dmitry Baryshkov <dmitry.baryshkov@linar=
o.org> wrote:
>
> I would appreciate if you could add
>=20
> https://gitlab.freedesktop.org/lumag/msm.git msm-next-lumag
>=20
> to the linux-next tree.
>=20
> This tree is a part of drm/msm maintenance structure. As a co-maintainer =
I collect and test display patches, while Rob concenctrates on GPU part of =
the driver. Later during the release cycle these patchesare pulled by Rob C=
lark directly into msm-next.
>=20
> During last cycle Rob suggested adding this tree to the linux-next effort=
, so that the patches receive better integration testing during the Linux d=
evelopment cycle.

Added from today.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--Sig_/0Rts+dJPHVuFp7yBrsgCJ62
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmKqZEQACgkQAVBC80lX
0Gy8RAf+IsCrpN0TDFAO9/3ciyLA7BYcxQ/hKmvxNaN2bLcryQB1yauyzvsDZXgU
IK0JJ3IIj74Spo+BkUYsET41GEJdCKZ+wsz3oxhRrTHm2SuA1uV5NcScB2AMuAc5
li4wgBFQ9+QOO+gjijsWKgpNsC51hjvmra4c1w5RmPk074XJCBzuSJQ+/aACQL3I
706Aexc/pUvuwWgBeSW0d5ykai0t7GXSfuefJxebvZfgyBL7KFd8TUsR4RSQ5hFD
sxc5LxZqW9+L6XRM3LSLaLJnKcnqK7pjuWrH5tqV9fM113XhN9ccJjdUtrZ0c5CW
nFRpf2SjqtvYrK+v4wKzAIvh2eC00A==
=NQ/0
-----END PGP SIGNATURE-----

--Sig_/0Rts+dJPHVuFp7yBrsgCJ62--
