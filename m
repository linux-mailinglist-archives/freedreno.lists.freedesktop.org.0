Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A02AB40700B
	for <lists+freedreno@lfdr.de>; Fri, 10 Sep 2021 18:55:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A089D6EA48;
	Fri, 10 Sep 2021 16:55:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB0236EA44;
 Fri, 10 Sep 2021 16:55:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2BCBB60295;
 Fri, 10 Sep 2021 16:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631292930;
 bh=U+sZ6nVPSNJ9MS3GXenkUY7bzKhjXvmMIhpRXmmrLgk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o/pwgWMSgenytzhnrdMbPEMISfwbvVHTOqYThFhxyQpynEdnoBkZq2rXtxa+EjUo+
 pbMCppirDEyEWW/HY+HlFJY/lV9Vkl11wV008oDXrJVWLT8X/tvlQZkVIisg9gmK0b
 U0nOukSEckI9fOVCPfWOYRlnawe1vCJGixH4NsIPP8xD50gj1bybku1fjxn16RoqPE
 TiySjwARsx3S341bHwaRlHjBEFFLG93CKFnr3eazA3eeqYcqtdJy7AB6m5Xg8BnN9y
 KtnFCY0uMmYs3tBXJfwOeohMsurvvKFRVRnBF/NwpiFlKKZslOCTd9fVH0KgF4WgYb
 TGfWF8b6ABTBg==
Date: Fri, 10 Sep 2021 17:54:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Jonathan Marek <jonathan@marek.ca>,
 Aswath Govindraju <a-govindraju@ti.com>, Marc Zyngier <maz@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-spi@vger.kernel.org, linux-watchdog@vger.kernel.org
Message-ID: <20210910165453.GF4474@sirena.org.uk>
References: <20210910165153.2843871-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="SxgehGEc6vB0cZwN"
Content-Disposition: inline
In-Reply-To: <20210910165153.2843871-1-robh@kernel.org>
X-Cookie: You are standing on my toes.
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Freedreno] [PATCH] dt-bindings: More use 'enum' instead of
 'oneOf' plus 'const' entries
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


--SxgehGEc6vB0cZwN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 10, 2021 at 11:51:53AM -0500, Rob Herring wrote:

> 'enum' is equivalent to 'oneOf' with a list of 'const' entries, but 'enum'
> is more concise and yields better error messages.

Acked-by: Mark Brown <broonie@kernel.org>

--SxgehGEc6vB0cZwN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmE7jdwACgkQJNaLcl1U
h9CHLAf/ce1bTYSeCkAdzRg3md0W2wpv1rXAh9bxgQH9A915d4ZJQWmJSEbZ7tl7
41CCMQMRuDFAtTcI55NtNY/gt4vvetWJsFWw1ynNSsDm2FD0M10RluMLiC+AuUXB
XkTyvl21NhRJvWEazXKnG34R6EkFBKIoHY8xEDE7mgfPVrJG+vLp4fkxzpgIAMWH
evEppWB/IamjiDxVrSZqYYz3fpBfSp6OVOC9TwMMiKoPsUd+2CaJM7/UN+ws/wJh
xWw7TC2Y/Fif1De47ztTg7KybIQoxLaNU1ZwV6BTj2Wq787hOpbC1ec2hZJBtgIr
svGZRyp2dBXL0vaksYgJd2wOThdTJg==
=U85h
-----END PGP SIGNATURE-----

--SxgehGEc6vB0cZwN--
